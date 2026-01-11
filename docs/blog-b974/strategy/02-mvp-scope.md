# STRAT-002 - Scope MVP Blog B974

> Date: 2026-01-11 | Phase: Strategy | Status: Complete

## Summary

MVP Blog B974 défini en 4 features core, livrable en 4-6 semaines. Focus sur le workflow AI-Assisted minimal viable : upload → génération → publication.

---

## 1. Vision MVP

### Objectif

> Permettre à Manuel de publier un article de blog généré par IA à partir d'un enregistrement audio et de photos, avec distribution newsletter automatique.

### Principes MVP

| Principe | Application |
|----------|-------------|
| **Minimum Viable** | Workflow complet mais minimal |
| **Validable** | Permet de valider l'hypothèse AI-Assisted |
| **Extensible** | Base pour features futures |
| **Utilisable** | Manuel peut publier dès le MVP |

---

## 2. Features Must-Have vs Nice-to-Have

### Must-Have (MVP)

| Feature | Description | Justification |
|---------|-------------|---------------|
| **F1: Blog Public** | Pages liste + article avec SEO | Core product - sans ça, pas de blog |
| **F2: Upload Audio/Photos** | Interface back-office upload | Entrée du workflow AI-Assisted |
| **F3: Génération Ralph** | Transcription + article généré | Coeur de la value prop |
| **F4: Newsletter** | Inscription + envoi auto | Distribution minimale viable |

### Nice-to-Have (Post-MVP)

| Feature | Description | Phase |
|---------|-------------|-------|
| Séries/Thèmes | Grouper articles par série | V1.1 |
| Publication programmée | Scheduler publication | V1.1 |
| Posts Instagram | Génération + publication auto | V1.2 |
| Posts Facebook | Génération + publication auto | V1.2 |
| Analytics intégré | Dashboard métriques | V1.3 |
| Paramètres ligne éditoriale | Config ton, longueur, style | V1.1 |
| LinkedIn posts | Publication professionnelle | V2.0 |
| Commentaires | Système de commentaires | V2.0 |
| Search | Recherche full-text | V1.3 |

### Explicitly Out of Scope (MVP)

| Feature | Raison |
|---------|--------|
| Réseaux sociaux | Complexité Meta API, MVP = newsletter seule |
| Multi-auteur | Manuel = seul auteur |
| Commentaires | Pas prioritaire, modération complexe |
| Paywall | Blog gratuit pour acquisition |
| Multi-langue | FR uniquement |
| PWA | Pas nécessaire |

---

## 3. MVP Features Détaillées

### F1: Blog Public (Route /blog)

**Objectif**: Pages publiques du blog accessibles depuis le site B974.

#### Composants

| Composant | Description | Priorité |
|-----------|-------------|----------|
| `/blog` page | Liste articles, pagination | P0 |
| `/blog/[slug]` page | Article complet | P0 |
| Navigation link | Lien dans header/footer | P0 |
| ArticleCard | Preview article (image, titre, excerpt) | P0 |
| ArticleContent | Rendu MDX article | P0 |
| SEO metadata | Open Graph, sitemap | P0 |
| NewsletterForm | Inscription newsletter | P0 |

#### Acceptance Criteria F1

- [ ] Route `/blog` affiche liste articles publiés
- [ ] Route `/blog/[slug]` affiche article complet
- [ ] Lien Blog visible dans navigation
- [ ] Metadata SEO (title, description, OG) générés
- [ ] Design cohérent avec B974 (fonts, couleurs)
- [ ] Responsive mobile/desktop
- [ ] Performance : LCP < 2.5s

#### Maquette Liste Articles

```
┌─────────────────────────────────────────────────────────────────┐
│  [Navigation B974]                               [Blog]         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  # Journal du Bonsai                                            │
│  > Réflexions, techniques et coulisses de l'atelier             │
│                                                                  │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │ [Image]         │  │ [Image]         │  │ [Image]         │ │
│  │                 │  │                 │  │                 │ │
│  │ Voyage Japon    │  │ Arrosage Guide  │  │ Taille Pin     │ │
│  │ 12 Jan 2026     │  │ 8 Jan 2026      │  │ 3 Jan 2026      │ │
│  │ Excerpt...      │  │ Excerpt...      │  │ Excerpt...      │ │
│  │                 │  │                 │  │                 │ │
│  │ [Lire →]        │  │ [Lire →]        │  │ [Lire →]        │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │  Newsletter                                                  ││
│  │  Recevez les nouveaux articles par email                    ││
│  │  [email@example.com        ] [S'inscrire]                   ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  [Footer B974]                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### F2: Upload Audio/Photos (Back-office)

**Objectif**: Interface pour uploader le contenu source de l'article.

#### Composants

| Composant | Description | Priorité |
|-----------|-------------|----------|
| Upload page | `/admin/blog/new` | P0 |
| Audio uploader | Drag & drop audio (mp3, m4a) | P0 |
| Photos uploader | Multi-photos drag & drop | P0 |
| Title input | Titre provisoire | P0 |
| Theme selector | Dropdown thèmes (Technique, Voyage, etc.) | P1 |
| Save draft | Sauvegarde avant génération | P0 |

#### Acceptance Criteria F2

- [ ] Upload audio jusqu'à 25MB (mp3, m4a, wav)
- [ ] Upload multiple photos (jpg, png, webp)
- [ ] Preview audio/photos uploadés
- [ ] Suppression fichiers avant validation
- [ ] Sauvegarde draft en DB
- [ ] Feedback upload progress
- [ ] Validation formats supportés

#### Maquette Upload

```
┌─────────────────────────────────────────────────────────────────┐
│  Dashboard B974 > Blog > Nouvel Article                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  # Nouvel Article                                               │
│                                                                  │
│  Titre (provisoire)                                             │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │ Voyage Japon janvier 2026                                   ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  Audio (enregistrement terrain)                                 │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │  ┌──────────────────────────────────────────────────────┐   ││
│  │  │  🎤 Glissez votre fichier audio ici                  │   ││
│  │  │     ou cliquez pour sélectionner                     │   ││
│  │  │     mp3, m4a, wav - max 25MB                         │   ││
│  │  └──────────────────────────────────────────────────────┘   ││
│  │  ▶️ voyage-japon.m4a (12:34) [✕]                            ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  Photos                                                         │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │  ┌────┐ ┌────┐ ┌────┐ ┌────┐ ┌────────────────────────────┐││
│  │  │ 📷 │ │ 📷 │ │ 📷 │ │ 📷 │ │ + Ajouter photos           │││
│  │  └────┘ └────┘ └────┘ └────┘ └────────────────────────────┘││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  Thème                                                          │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │ [▼ Voyage / Reportage                                     ] ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  [Annuler]                          [Sauvegarder] [Générer →]  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### F3: Génération Ralph

**Objectif**: Générer automatiquement l'article et son contenu associé.

#### Composants

| Composant | Description | Priorité |
|-----------|-------------|----------|
| Transcription | Whisper API → texte | P0 |
| Article generation | Claude → MDX article | P0 |
| Newsletter generation | Claude → email content | P0 |
| Preview page | Affichage avant publication | P0 |
| Edit capability | Modifications manuelles | P0 |

#### Acceptance Criteria F3

- [ ] Transcription audio en < 2 min (pour 15 min audio)
- [ ] Article généré en < 1 min
- [ ] Newsletter générée simultanément
- [ ] Preview article avant publication
- [ ] Édition possible post-génération
- [ ] Régénération si insatisfaisant
- [ ] Ton Sage-Artisan respecté

#### Workflow Génération

```
┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐
│ Upload  │────>│Transcribe│────>│ Generate │────>│ Preview │
│ saved   │     │ (Whisper)│     │ (Claude) │     │         │
└─────────┘     └─────────┘     └─────────┘     └─────────┘
                                      │
                                      │ Generates:
                                      ├── Article (MDX)
                                      ├── Newsletter (HTML)
                                      └── Metadata (SEO)
```

#### Maquette Preview

```
┌─────────────────────────────────────────────────────────────────┐
│  Dashboard > Blog > Preview                                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  [Article] [Newsletter]                                         │
│  ─────────                                                       │
│                                                                  │
│  # Voyage Japon : Dans les Jardins de Omiya                     │
│                                                                  │
│  > Ce janvier, j'ai eu la chance de parcourir les jardins...    │
│                                                                  │
│  ## En bref                                                      │
│  - 5 jours de visite                                            │
│  - 12 pépinières visitées                                       │
│  - Rencontres avec 3 maîtres                                    │
│                                                                  │
│  [Image: jardin-omiya.jpg]                                      │
│                                                                  │
│  ## La région d'Omiya                                           │
│  Lorem ipsum dolor sit amet...                                  │
│                                                                  │
│  [...preview continues...]                                      │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│  [← Modifier]        [Régénérer]        [Publier maintenant →]  │
└─────────────────────────────────────────────────────────────────┘
```

---

### F4: Newsletter

**Objectif**: Système d'inscription et d'envoi automatique de newsletter.

#### Composants

| Composant | Description | Priorité |
|-----------|-------------|----------|
| Subscription form | Formulaire public | P0 |
| Double opt-in | Email confirmation | P0 |
| Subscriber list | Liste dans DB | P0 |
| Send on publish | Envoi auto à publication | P0 |
| Unsubscribe | Lien désinscription | P0 |

#### Acceptance Criteria F4

- [ ] Formulaire inscription sur `/blog`
- [ ] Email de confirmation (double opt-in)
- [ ] Newsletter envoyée à publication article
- [ ] Lien désinscription fonctionnel
- [ ] Email responsive (mobile/desktop)
- [ ] Deliverability > 95%
- [ ] Conformité RGPD (consent explicite)

#### Template Email Newsletter

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│             [Logo B974]                                         │
│                                                                  │
│  Bonjour,                                                       │
│                                                                  │
│  Un nouvel article est disponible sur le Journal du Bonsai.     │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │ [Image article]                                              ││
│  │                                                              ││
│  │ Voyage Japon : Dans les Jardins de Omiya                    ││
│  │                                                              ││
│  │ Ce janvier, j'ai eu la chance de parcourir les jardins      ││
│  │ de la région d'Omiya, haut lieu du bonsai japonais...       ││
│  │                                                              ││
│  │ [Lire l'article →]                                          ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                  │
│  À bientôt,                                                     │
│  Manuel                                                         │
│                                                                  │
│  ─────────────────────────────────────────────────────────────  │
│  [Se désinscrire]                                               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 4. Critères de Succès MVP

### Métriques de Validation

| Critère | Métrique | Cible MVP | Outil |
|---------|----------|-----------|-------|
| **Workflow fonctionnel** | Articles publiés via workflow | ≥ 3 | Manual count |
| **Qualité contenu** | Satisfaction Manuel (1-5) | ≥ 4 | Feedback |
| **Temps publication** | Upload → Publication | < 30 min | Chrono |
| **Newsletter** | Taux livraison | > 95% | Resend dashboard |
| **Performance** | LCP page blog | < 2.5s | Lighthouse |
| **SEO** | Pages indexées | 100% | Google Search Console |

### Critères Go/No-Go

#### Go (MVP réussi)

- [ ] 3 articles publiés via workflow complet
- [ ] Newsletter reçue par tous les subscribers
- [ ] Manuel valide la qualité du contenu généré
- [ ] Temps upload → publication < 30 min
- [ ] Pas de bug bloquant en production

#### No-Go (Blockers)

- [ ] Workflow impossible à compléter
- [ ] Qualité article insuffisante (score < 3/5)
- [ ] Newsletter non délivrée (bounce > 10%)
- [ ] Performance inacceptable (LCP > 5s)

### User Acceptance Test (UAT)

| Test | Description | Expected |
|------|-------------|----------|
| T1 | Uploader audio + 5 photos | Success |
| T2 | Générer article | < 3 min, quality OK |
| T3 | Preview et modifier | Edit possible |
| T4 | Publier | Article visible sur /blog |
| T5 | Newsletter | Email reçu dans inbox |
| T6 | S'inscrire newsletter | Double opt-in fonctionne |
| T7 | Se désinscrire | Unsubscribe fonctionne |

---

## 5. Timeline Estimée

### Vue Globale

| Phase | Durée | Semaines |
|-------|-------|----------|
| **Setup & Infrastructure** | 1 semaine | S1 |
| **F1: Blog Public** | 1 semaine | S2 |
| **F2: Upload Interface** | 0.5 semaine | S3 |
| **F3: Ralph Integration** | 1.5 semaines | S3-S4 |
| **F4: Newsletter** | 1 semaine | S5 |
| **Testing & Polish** | 1 semaine | S6 |
| **Total** | **4-6 semaines** | |

### Détail par Semaine

#### Semaine 1: Setup & Infrastructure

- [ ] Prisma schema extension (BlogPost, Subscriber)
- [ ] Migration database
- [ ] Route `/blog` scaffold
- [ ] Config Cloudinary
- [ ] Config Resend

#### Semaine 2: Blog Public (F1)

- [ ] Page liste articles
- [ ] Page article détail
- [ ] Composants ArticleCard, ArticleContent
- [ ] Navigation integration
- [ ] SEO metadata
- [ ] Newsletter form (UI only)

#### Semaine 3: Upload + Ralph Start (F2 + F3 partial)

- [ ] Page upload back-office
- [ ] Upload audio Cloudinary
- [ ] Upload photos Cloudinary
- [ ] Draft save to DB
- [ ] Whisper integration (transcription)

#### Semaine 4: Ralph Completion (F3)

- [ ] Claude integration (article generation)
- [ ] Newsletter content generation
- [ ] Preview page
- [ ] Edit capability
- [ ] Regenerate feature
- [ ] Publish action

#### Semaine 5: Newsletter (F4)

- [ ] Subscription flow (double opt-in)
- [ ] Email templates (React Email)
- [ ] Send on publish
- [ ] Unsubscribe handling
- [ ] RGPD compliance

#### Semaine 6: Testing & Polish

- [ ] UAT avec Manuel
- [ ] Bug fixes
- [ ] Performance optimization
- [ ] SEO verification
- [ ] Documentation
- [ ] Production deploy

### Risques Timeline

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Claude API instable | +1 semaine | Fallback GPT-4 |
| Quality issues | +1 semaine | Itérations prompt |
| Meta API (si ajouté) | +2 semaines | Garder pour V1.2 |

---

## 6. Dependencies

### Dépendances Externes

| Service | Action Required | Blocker |
|---------|-----------------|---------|
| Cloudinary | Créer compte/projet | S1 |
| OpenAI | API key (Whisper) | S3 |
| Anthropic | API key (Claude) | S3 |
| Resend | Créer compte, domain verify | S5 |

### Dépendances Internes

| Dependency | Required For | When |
|------------|--------------|------|
| Prisma schema | All features | S1 |
| Cloudinary config | Upload (F2) | S3 |
| Claude prompt | Generation (F3) | S3 |
| Resend domain | Newsletter (F4) | S5 |

---

## 7. MVP Definition Summary

### One-Liner

> **MVP = Upload audio/photos → Ralph génère article → Publication avec newsletter automatique**

### 4 Features Core

| # | Feature | Valeur |
|---|---------|--------|
| 1 | Blog Public | Visibilité SEO, acquisition |
| 2 | Upload Interface | Entrée workflow |
| 3 | Génération Ralph | Coeur AI-Assisted |
| 4 | Newsletter | Distribution minimale |

### Timeline

**4-6 semaines** avec 1 développeur + Claude assistance

### Success Metrics

- 3 articles publiés via workflow
- Qualité ≥ 4/5
- Newsletter delivered > 95%
- LCP < 2.5s

---

## Acceptance Criteria Status

- [x] Features must-have vs nice-to-have séparées
- [x] MVP défini en 3-5 features core (4 features)
- [x] Critères de succès MVP mesurables
- [x] Timeline estimée (4-6 semaines)
