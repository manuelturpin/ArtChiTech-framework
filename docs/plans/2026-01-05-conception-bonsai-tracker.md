# Conception - bonsai-tracker

**Date :** 2026-01-05
**Phase :** 3 - Conception
**Status :** Validé

---

## 1. Architecture Technique

### 1.1 Infrastructure (Développement Local)

```
┌─────────────────────────────────────────────────────────────────┐
│                     Local Development                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Docker Compose (standalone)                                     │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │  postgres   │  │   redis     │  │  bonsai-    │             │
│  │    (15)     │  │    (7)      │  │  tracker    │             │
│  │  Port 5432  │  │  Port 6379  │  │  Port 3000  │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
│                                                                  │
│  Commandes:                                                      │
│  - make dev     → démarre tout                                  │
│  - make stop    → arrête tout                                   │
│  - make reset   → reset DB                                      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘

URL: http://localhost:3000
```

### 1.2 Stack Technique (aligné sur B974)

| Composant | Technologie | Version |
|-----------|-------------|---------|
| **Frontend** | Next.js (App Router) | 16.x |
| **UI Framework** | React | 19.x |
| **Styling** | Tailwind CSS | 4.x |
| **Components** | shadcn/ui | latest |
| **State** | Zustand | 5.x |
| **Backend** | Next.js API Routes | 16.x |
| **ORM** | Prisma | 6.x |
| **Auth** | NextAuth.js | 5.x |
| **Validation** | Zod | 3.x |
| **Database** | PostgreSQL | 15 |
| **Cache** | Redis | 7 |
| **Containerisation** | Docker Compose | 2.x |

### 1.3 Structure du Projet

```
bonsai-tracker/
├── docker-compose.yml
├── Makefile
├── .env.example
├── apps/
│   └── webapp/
│       ├── src/
│       │   ├── app/              # App Router pages
│       │   ├── components/       # React components
│       │   │   └── ui/          # shadcn/ui
│       │   ├── lib/             # Utilities
│       │   └── styles/          # Global styles
│       ├── prisma/
│       │   └── schema.prisma
│       └── package.json
├── docs/
│   └── plans/
└── tests/
```

---

## 2. Data Model

### 2.1 Schéma Prisma

```prisma
// ═══════════════════════════════════════════════════════
// AUTH & USERS
// ═══════════════════════════════════════════════════════

model User {
  id             String       @id @default(cuid())
  email          String       @unique
  name           String?
  role           Role         @default(EMPLOYEE)
  organizationId String
  organization   Organization @relation(fields: [organizationId], references: [id])
  createdAt      DateTime     @default(now())

  careEntries    CareEntry[]
}

enum Role {
  ADMIN      // Accès complet
  EMPLOYEE   // Lecture + écriture soins
  READONLY   // Lecture seule
}

model Organization {
  id        String   @id @default(cuid())
  name      String
  plan      Plan     @default(FREE)

  users     User[]
  sites     Site[]
  bonsais   Bonsai[]
  clients   Client[]
}

enum Plan {
  FREE        // 1-25 bonsaïs
  STARTER     // 26-100
  PRO         // 101-500
  BUSINESS    // 501-2000
  ENTERPRISE  // 2000+
}

// ═══════════════════════════════════════════════════════
// CORE: BONSAI
// ═══════════════════════════════════════════════════════

model Site {
  id             String       @id @default(cuid())
  name           String
  address        String?
  organizationId String
  organization   Organization @relation(fields: [organizationId], references: [id])

  bonsais        Bonsai[]
}

model Bonsai {
  id              String       @id @default(cuid())
  code            String       @unique  // Pour QR code (ex: F-0234)
  name            String?               // Nom personnalisé optionnel
  species         String                // Espèce (Ficus, Pin, Érable...)
  age             Int?                  // Âge en années
  acquisitionDate DateTime?
  status          BonsaiStatus @default(IN_STOCK)
  price           Decimal?
  notes           String?

  // Localisation
  siteId          String
  site            Site         @relation(fields: [siteId], references: [id])
  organizationId  String
  organization    Organization @relation(fields: [organizationId], references: [id])

  // Vente (un bonsaï ne peut être vendu qu'une fois)
  soldAt          DateTime?
  soldPrice       Decimal?
  clientId        String?
  client          Client?      @relation(fields: [clientId], references: [id])

  // Relations
  photos          Photo[]
  careEntries     CareEntry[]

  createdAt       DateTime     @default(now())
  updatedAt       DateTime     @updatedAt
}

enum BonsaiStatus {
  IN_STOCK   // En stock
  RESERVED   // Réservé
  SOLD       // Vendu
  DEAD       // Mort
}

model Photo {
  id        String   @id @default(cuid())
  url       String
  caption   String?
  isPrimary Boolean  @default(false)
  bonsaiId  String
  bonsai    Bonsai   @relation(fields: [bonsaiId], references: [id], onDelete: Cascade)
  createdAt DateTime @default(now())
}

// ═══════════════════════════════════════════════════════
// CARE TRACKING (Historique soins)
// ═══════════════════════════════════════════════════════

model CareEntry {
  id       String   @id @default(cuid())
  type     CareType
  notes    String?
  date     DateTime @default(now())

  bonsaiId String
  bonsai   Bonsai   @relation(fields: [bonsaiId], references: [id], onDelete: Cascade)
  userId   String
  user     User     @relation(fields: [userId], references: [id])
}

enum CareType {
  WATERING    // Arrosage
  PRUNING     // Taille
  REPOTTING   // Rempotage
  FERTILIZING // Engrais
  TREATMENT   // Traitement
  OTHER       // Autre
}

// ═══════════════════════════════════════════════════════
// CLIENTS
// ═══════════════════════════════════════════════════════

model Client {
  id             String       @id @default(cuid())
  name           String
  email          String?
  phone          String?
  address        String?
  notes          String?
  organizationId String
  organization   Organization @relation(fields: [organizationId], references: [id])

  bonsais        Bonsai[]     // Bonsaïs achetés
  createdAt      DateTime     @default(now())
}
```

### 2.2 Résumé des Entités

| Entité | Rôle | Relations clés |
|--------|------|----------------|
| **Organization** | Pépinière (multi-tenant) | → Users, Sites, Bonsais, Clients |
| **User** | Utilisateur avec rôle | → Organization, CareEntries |
| **Site** | Localisation (serre, showroom) | → Organization, Bonsais |
| **Bonsai** | Fiche arbre + QR code | → Site, Client (vente), Photos, CareEntries |
| **Photo** | Photos du bonsaï | → Bonsai |
| **CareEntry** | Journal des soins | → Bonsai, User |
| **Client** | Acheteur | → Organization, Bonsais |

### 2.3 Décisions de conception

| Question | Décision | Justification |
|----------|----------|---------------|
| Un bonsaï peut-il être vendu plusieurs fois ? | **Non** | Simplifie le modèle. Champs `soldAt`, `soldPrice`, `clientId` directement sur Bonsai |
| Multi-tenant ? | **Oui** | Chaque pépinière a son Organisation isolée |
| Suppression en cascade ? | **Oui pour Photos/CareEntries** | Si un bonsaï est supprimé, ses photos et soins aussi |

---

## 3. UI/UX Design System

### 3.1 Brand B974 appliqué

Bonsai-tracker utilise le **Brand Book B974** pour garantir la cohérence visuelle avec l'écosystème existant.

### 3.2 Palette de Couleurs

| Couleur | Hex | RGB | Usage | Ratio |
|---------|-----|-----|-------|-------|
| **Ivoire** | `#F8F5F0` | 248, 245, 240 | Fond principal | 55% |
| **Blanc** | `#FFFFFF` | 255, 255, 255 | Cards, modales | 20% |
| **Noir doux** | `#2D2D2D` | 45, 45, 45 | Texte principal | 15% |
| **Vert mousse** | `#5D6B4A` | 93, 107, 74 | Status "en stock", liens nav | 5% |
| **Orange B974** | `#E65100` | 230, 81, 0 | CTA, alertes | 5% |

#### Nuances

```css
:root {
  /* Ivoire */
  --color-ivory-100: #F8F5F0;
  --color-ivory-75: #FAF8F5;
  --color-ivory-50: #FCFAF8;

  /* Noir doux */
  --color-black-100: #2D2D2D;
  --color-black-75: #525252;
  --color-black-50: #787878;
  --color-black-25: #A3A3A3;

  /* Vert mousse */
  --color-green-100: #5D6B4A;
  --color-green-75: #7D896B;
  --color-green-25: #BEC5AE;

  /* Orange B974 */
  --color-orange-100: #E65100;
  --color-orange-75: #EB7433;
  --color-orange-25: #F8BA99;
}
```

### 3.3 Typographie

| Niveau | Police | Taille | Graisse | Usage |
|--------|--------|--------|---------|-------|
| **H1** | Playfair Display | 48px / 3rem | 700 | Titres de page |
| **H2** | Playfair Display | 36px / 2.25rem | 700 | Sections |
| **H3** | Playfair Display | 28px / 1.75rem | 600 | Sous-sections |
| **H4** | Source Sans Pro | 22px / 1.375rem | 600 | Titres cards |
| **Body** | Source Sans Pro | 18px / 1.125rem | 400 | Texte courant |
| **Small** | Source Sans Pro | 14px / 0.875rem | 400 | Labels, meta |

```css
/* Polices */
font-family: 'Playfair Display', Georgia, serif;      /* Titres */
font-family: 'Source Sans Pro', -apple-system, sans-serif; /* Corps */
```

### 3.4 Composants UI

#### Boutons

| Variant | Fond | Texte | Bordure | Usage |
|---------|------|-------|---------|-------|
| **default** | Orange #E65100 | Blanc | — | CTA principal |
| **outline** | Transparent | Noir #2D2D2D | Noir #2D2D2D | Actions secondaires |
| **ghost** | Transparent | Courant | — | Actions discrètes |

```css
/* Hover effect (Motion Guidelines) */
.btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: all 200ms ease-out;
}
```

#### Cards

```css
/* État normal */
.card {
  background: #FFFFFF;
  border-radius: 8px; /* rounded-lg */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

/* État hover */
.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
  transition: all 300ms ease-out;
}
```

#### Inputs

```css
.input {
  border: 1px solid #C9C9C9;
  border-radius: 6px;
  padding: 8px 12px;
}
.input:focus {
  border-color: #5D6B4A; /* Vert mousse */
  outline: none;
}
```

### 3.5 Wireframes

#### Dashboard Principal

```
┌─────────────────────────────────────────────────────────────────┐
│  🌳 bonsai-tracker            [🔍 Recherche]    👤  Pierre     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Dashboard                      Inventaire: 1,247 bonsaïs       │
│  ─────────────────────────────────────────────────              │
│                                                                  │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────┐│
│  │   En stock   │ │   Réservés   │ │    Vendus    │ │ Alertes  ││
│  │     892      │ │      45      │ │     310      │ │    12    ││
│  │   ▓▓▓▓▓▓▓    │ │   ████       │ │   ████████   │ │  ████    ││
│  │  Vert mousse │ │    Orange    │ │  Noir 50%    │ │  Orange  ││
│  └──────────────┘ └──────────────┘ └──────────────┘ └──────────┘│
│                                                                  │
│  Dernières entrées de soins                                     │
│  ───────────────────────────────                                │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  🪴 Ficus retusa #F-0234      Arrosage       Aujourd'hui   │ │
│  │  🪴 Pin noir #P-0891          Taille         Hier          │ │
│  │  🪴 Érable #E-0156            Rempotage      03/01/2026    │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  [+ Ajouter un bonsaï]                          ← Orange CTA    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Fiche Bonsaï

```
┌─────────────────────────────────────────────────────────────────┐
│  ← Retour                                    [QR] [Modifier]    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────┐                                           │
│  │                  │   Ficus retusa "Ginseng"                  │
│  │    [PHOTO]       │   Code: F-0234                            │
│  │                  │   ───────────────────                     │
│  │                  │   Espèce: Ficus retusa                    │
│  └──────────────────┘   Âge: 15 ans                             │
│  [●] [○] [○] [○]        Status: ██ En stock                     │
│                         Site: Serre principale                   │
│                         Prix: 450€                               │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│  Historique des soins                                           │
│  ─────────────────────                                          │
│  [Arrosage] [Taille] [Rempotage] [Engrais] [+ Ajouter]         │
│                                                                  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  💧 Arrosage      05/01/2026    Pierre    "Sol humide"     │ │
│  │  ✂️  Taille        28/12/2025    Marie     "Branches..."   │ │
│  │  🪴 Rempotage     15/11/2025    Pierre    "Akadama..."     │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Scan QR (Mobile PWA)

```
┌─────────────────────────┐
│  ← Retour    bonsai     │
├─────────────────────────┤
│                         │
│   ┌─────────────────┐   │
│   │                 │   │
│   │   📷 CAMERA     │   │
│   │                 │   │
│   │   [QR ZONE]     │   │
│   │                 │   │
│   └─────────────────┘   │
│                         │
│   Scanner le QR code    │
│   du bonsaï             │
│                         │
│   ────────────────────  │
│                         │
│   Scans récents:        │
│   • F-0234    14:32     │
│   • P-0891    14:28     │
│   • E-0156    14:15     │
│                         │
└─────────────────────────┘
```

#### Recherche Avancée

```
┌─────────────────────────────────────────────────────────────────┐
│  Recherche                                                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌───────────────────────────────────────────┐  [Rechercher]    │
│  │ Ficus > 10 ans...                         │                  │
│  └───────────────────────────────────────────┘                  │
│                                                                  │
│  Filtres:                                                        │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌───────────┐  │
│  │ Espèce    ▼ │ │ Âge       ▼ │ │ Status    ▼ │ │ Site    ▼ │  │
│  │ Ficus       │ │ 10-20 ans   │ │ En stock    │ │ Tous      │  │
│  └─────────────┘ └─────────────┘ └─────────────┘ └───────────┘  │
│                                                                  │
│  23 résultats                                                    │
│  ───────────────────────────────────────────────────────────    │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │ [IMG]  Ficus retusa #F-0234   15 ans   En stock   450€    │ │
│  │ [IMG]  Ficus microcarpa #F-0567   12 ans   En stock   380€│ │
│  │ [IMG]  Ficus benjamina #F-0891   18 ans   Réservé   520€  │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 3.6 Motion Guidelines

| Élément | Durée | Easing | Effet |
|---------|-------|--------|-------|
| **Boutons hover** | 200ms | ease-out | translateY(-2px) + shadow |
| **Cards hover** | 300ms | ease-out | translateY(-4px) + shadow |
| **Liens nav** | 300ms | ease-out | underline progressif |
| **Révélations scroll** | 500-800ms | ease-out | fadeIn + translateY(20px) |
| **Modales** | 300ms | ease-out | fadeIn + scale(0.95→1) |

```css
/* Préférence utilisateur respectée */
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

### 3.7 Icônes

Bibliothèque : **Lucide Icons** (style ligne, 1.5px stroke)

| Icône | Usage |
|-------|-------|
| `Leaf` | Bonsaï, nature |
| `Droplet` | Arrosage |
| `Scissors` | Taille |
| `Package` | Rempotage |
| `Search` | Recherche |
| `QrCode` | Scan QR |
| `Plus` | Ajouter |
| `User` | Profil |
| `Settings` | Paramètres |

### 3.8 Responsive Breakpoints

| Device | Largeur | Layout |
|--------|---------|--------|
| **Mobile** | 320px - 767px | Stack vertical, menu hamburger |
| **Tablet** | 768px - 1023px | Grid 2 colonnes |
| **Desktop** | 1024px+ | Sidebar + contenu |
| **Max content** | 1200px | Centré |

---

## 4. Fonctionnalités MVP

### 4.1 Pages

| Route | Page | Priorité |
|-------|------|----------|
| `/` | Dashboard | P0 |
| `/bonsais` | Liste inventaire | P0 |
| `/bonsais/[id]` | Fiche bonsaï | P0 |
| `/bonsais/new` | Ajouter bonsaï | P0 |
| `/scan` | Scanner QR (PWA) | P0 |
| `/search` | Recherche avancée | P0 |
| `/clients` | Liste clients | P1 |
| `/clients/[id]` | Fiche client | P1 |
| `/sites` | Gestion sites | P1 |
| `/settings` | Paramètres | P1 |

### 4.2 API Routes

| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/bonsais` | Liste avec filtres |
| GET | `/api/bonsais/[id]` | Détail bonsaï |
| POST | `/api/bonsais` | Créer bonsaï |
| PATCH | `/api/bonsais/[id]` | Modifier bonsaï |
| DELETE | `/api/bonsais/[id]` | Supprimer bonsaï |
| POST | `/api/bonsais/[id]/care` | Ajouter soin |
| GET | `/api/bonsais/[id]/qr` | Générer QR code |
| GET | `/api/clients` | Liste clients |
| POST | `/api/clients` | Créer client |
| GET | `/api/dashboard/stats` | Stats dashboard |

---

## 5. Validation

### Checklist Conception

- [x] Architecture technique définie
- [x] Stack alignée sur B974
- [x] Data model simplifié validé
- [x] UI/UX conforme au Brand Book B974
- [x] Wireframes principales
- [x] Motion guidelines
- [x] Routes MVP listées

### Go/No-Go

**Decision :** ✅ GO - Passer en Phase 4 Développement

**Rationale :** Architecture simple, data model clair, UI cohérente avec l'écosystème B974. Prêt pour l'implémentation.

---

**Document créé :** 2026-01-05
**Basé sur :** B974 Brand Book v2.0
**Prochaine phase :** Développement (setup projet, foundation)
