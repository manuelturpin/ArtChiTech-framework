# DISC-001 - Audit Architecture Site Existant

> Date: 2026-01-11 | Phase: Discovery | Status: Complete

## Summary

VPS-b974.fr est une application e-commerce Next.js 16.1.1 moderne utilisant App Router, déployée en monorepo avec Turbopack.

---

## 1. Structure Next.js

### Router Type
**App Router** (dossier `/app` moderne, pas Pages Router)

### Configuration Next.js
- Version: **16.1.1**
- Output: Standalone (optimisé Docker)
- Turbopack: Activé (monorepo root: '../..')
- Images: webp/avif avec cache 1 an

### Structure des Dossiers

```
apps/webapp/src/
├── app/                    # Next.js App Router
│   ├── layout.tsx          # Root layout
│   ├── globals.css         # Tailwind + Brand theme
│   ├── page.tsx            # Homepage
│   ├── (auth)/             # Route group authentification
│   ├── (dashboard)/        # Route group dashboard
│   ├── mon-premier-bonsai/ # E-commerce bonsais
│   ├── guides/             # Guides d'entretien
│   ├── formations/         # Formations
│   ├── contact/            # Contact
│   ├── services/           # Services
│   ├── a-propos/           # About
│   ├── checkout/           # Panier/paiement
│   └── api/                # API Routes
├── components/             # Composants React
│   ├── landing/            # Navigation, Footer, Hero
│   ├── layout/             # Headers alternatifs
│   ├── ui/                 # shadcn/ui components
│   └── mpb/                # Mon Premier Bonsai
├── lib/                    # Utilitaires
├── stores/                 # Zustand stores
├── hooks/                  # Custom hooks
├── config/                 # Configuration (navigation)
├── data/                   # Données produits
└── types/                  # TypeScript definitions
```

### Routes Existantes

| Route | Type | Description |
|-------|------|-------------|
| `/` | Page | Landing page |
| `/mon-premier-bonsai` | Page | Catalogue e-commerce |
| `/guides/genevrier-itoigawa` | Page | Guide statique |
| `/formations` | Page | Formations |
| `/contact` | Page | Contact |
| `/services` | Page | Services |
| `/a-propos` | Page | À propos |
| `/checkout` | Page | Checkout |
| `/(auth)/*` | Group | Authentification |
| `/(dashboard)/*` | Group | Dashboard utilisateur |
| `/api/*` | API | Endpoints REST |

---

## 2. Patterns de Code Existants

### Styling
- **Framework**: Tailwind CSS 4
- **PostCSS**: @tailwindcss/postcss
- **UI Library**: shadcn/ui (Radix + Tailwind)
- **Animations**: Framer Motion 12 + GSAP 3.14 + Lenis (smooth scroll)
- **3D**: Three.js + React Three Fiber

### State Management
- **Framework**: Zustand 5.0.8
- **Stores**:
  - `useCartStore` - Panier + checkout
  - `useUserStore` - Auth utilisateur
  - `useUIStore` - Modals, sidebar, notifications
  - `useAppStore` - Settings globaux
- **Pattern**: Selector functions pour performance

### Data Fetching
- **Server Components**: Par défaut (force-dynamic si nécessaire)
- **Database**: PostgreSQL 15 + Prisma ORM 7.0.1
- **Cache**: Next.js automatic + Redis (ioredis)
- **APIs**: RESTful dans `/api/`

### Component Organization
- Composants fonctionnels avec hooks
- 'use client' explicite où nécessaire
- TypeScript strict avec interfaces
- Organisation par feature (landing/, mpb/, etc.)

---

## 3. Points d'Intégration Blog

### Navigation Principale

**Fichier config**: `src/config/navigation.ts`
```typescript
mainNavItems: [
  { label: 'Mon Premier Bonsai', href: '/mon-premier-bonsai' },
  { label: 'Formations', href: '/formations' },
  { label: 'Contact', href: '/contact' },
  // Blog ici
]
```

**Composants**:
- `src/components/landing/Navigation.tsx` - Header principal
- `src/components/layout/Header.tsx` - Header alternatif sub-pages

### Footer

**Fichier**: `src/components/landing/Footer.tsx`

Liens actuels:
- Navigation: Accueil, Mon Premier Bonsai, Formations, À propos, Contact
- Legal: Mentions légales, CGU, Confidentialité

### Routes Disponibles pour Blog

| Option | Route | Notes |
|--------|-------|-------|
| **Recommandé** | `/blog` | Namespace dédié |
| Alternative | `/guides` | Extension existant |
| Alternative | `/ressources/blog` | Hub contenu |

### Redirections Existantes

Dans `next.config.ts`, redirections blog WordPress:
- `/blog/*` → `/guides/*` (déjà configuré)

**Action**: Retirer ces redirections si `/blog` devient actif.

---

## 4. Dépendances Techniques

### Core
| Package | Version | Usage |
|---------|---------|-------|
| next | 16.1.1 | Framework |
| react | 19.2.0 | UI |
| typescript | 5.x | Types |

### UI & Styling
| Package | Version | Usage |
|---------|---------|-------|
| tailwindcss | 4.x | Styling |
| @radix-ui/* | latest | shadcn/ui base |
| lucide-react | 0.553.0 | Icons |
| framer-motion | 12.23.26 | Animations |
| gsap | 3.14.2 | Animations avancées |
| three | 0.182.0 | 3D |
| @react-three/fiber | 9.5.0 | React 3D |
| lenis | 1.3.17 | Smooth scroll |

### State & Data
| Package | Version | Usage |
|---------|---------|-------|
| zustand | 5.0.8 | State management |
| prisma | 7.0.1 | ORM |
| ioredis | 5.8.2 | Cache Redis |

### Auth & Payments
| Package | Version | Usage |
|---------|---------|-------|
| next-auth | 5.0.0-beta.30 | Authentication |
| stripe | 20.0.0 | Payments |
| @marsidev/react-turnstile | 1.4.0 | CAPTCHA |

### Database
- PostgreSQL 15
- Prisma ORM avec adapter-pg

---

## 5. Monorepo Structure

```
VPS-b974.fr/
├── apps/
│   ├── app/             # Application secondaire
│   └── webapp/          # Site principal B974
├── packages/
│   └── @b974/database   # Package DB partagé
└── pnpm-workspace.yaml  # Configuration monorepo
```

**Build Tools**: pnpm workspaces + Turbopack

---

## 6. Fichiers Clés pour Intégration

| Fichier | Action |
|---------|--------|
| `src/config/navigation.ts` | Ajouter lien Blog |
| `src/components/landing/Navigation.tsx` | Vérifier rendu |
| `src/components/landing/Footer.tsx` | Ajouter section Blog |
| `src/app/globals.css` | Styles déjà prêts |
| `src/app/layout.tsx` | Providers existants |
| `prisma/schema.prisma` | Ajouter model BlogPost |
| `next.config.ts` | Retirer redirect /blog |

---

## Recommendations

1. **Route `/blog`** - Namespace propre, distinct des guides produits
2. **Réutiliser composants** - Navigation, Footer, UI library existants
3. **Prisma model** - BlogPost avec markdown/MDX support
4. **Même stack** - Server Components + Zustand si state client
5. **SEO** - Utiliser patterns Open Graph existants

---

## Acceptance Criteria Status

- [x] Structure Next.js documentée (App Router, pages, composants)
- [x] Patterns de code existants identifiés (styling, state, data fetching)
- [x] Points d'intégration blog listés (navigation, footer, routes)
- [x] Dépendances techniques notées (versions, packages clés)
