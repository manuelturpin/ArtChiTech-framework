# DISC-003 - Objectifs Business & Vision AI-Assisted

> Date: 2026-01-11 | Phase: Discovery | Status: Complete

## Summary

Le Blog B974 combine une vision AI-Assisted innovante (capture terrain + génération Ralph) avec des objectifs business clairs (SEO, fidélisation, autorité). L'infrastructure back-office existante permet une intégration rapide.

---

## 1. Vision : Blog AI-Assisted avec Ralph

### Workflow Création Article

```
┌─────────────────────────────────────────────────────────────────┐
│                    WORKFLOW BLOG AI-ASSISTED                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. CAPTURE TERRAIN                                              │
│     ├── Audio (téléphone)                                        │
│     ├── Photos (terrain)                                         │
│     └── Thème/contexte                                           │
│              │                                                   │
│              ▼                                                   │
│  2. UPLOAD BACK-OFFICE                                           │
│     ├── Interface admin existante                                │
│     ├── Sélection thème/série                                    │
│     └── Paramètres ligne éditoriale                              │
│              │                                                   │
│              ▼                                                   │
│  3. RALPH LOOP                                                   │
│     ├── Transcription audio (Whisper)                            │
│     ├── Analyse photos                                           │
│     ├── Génération article STATE OF THE ART                      │
│     └── Intégration images optimisées                            │
│              │                                                   │
│              ▼                                                   │
│  4. VALIDATION & PUBLICATION                                     │
│     ├── Review humain                                            │
│     ├── Ajustements si nécessaire                                │
│     └── Publication programmée                                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Principes Clés

| Principe | Description |
|----------|-------------|
| **State of the Art** | Pas un brouillon, un article publication-ready |
| **Ralph Loops** | Même qualité que le code généré par Ralph |
| **Ligne éditoriale paramétrable** | Ton, longueur, style configurables |
| **Séries/Thèmes** | Ex: "Voyage Japon janvier 2026" |
| **Back-office intégré** | Réutilisation infrastructure existante |

---

## 2. Objectifs Business

### Priorités Classées

| # | Objectif | Impact | Mesure |
|---|----------|--------|--------|
| 1 | **SEO & Acquisition** | Trafic organique | Visites, positions Google |
| 2 | **Fidélisation** | Temps sur site | Pages/session, return visitors |
| 3 | **Autorité** | Expertise reconnue | Backlinks, citations |
| 4 | **Support produit** | Aide à l'achat | Conversions depuis blog |
| 5 | **Pub discrète** | Ventes naturelles | Clics vers produits |

### KPIs Cibles

| Métrique | Objectif 6 mois | Objectif 12 mois |
|----------|-----------------|------------------|
| Articles publiés | 12-18 | 24-36 |
| Trafic organique blog | +500 visites/mois | +2000 visites/mois |
| Pages/session | 2.0 | 2.5 |
| Temps moyen article | 3 min | 4 min |
| Position moyenne | Top 20 | Top 10 |

---

## 3. Architecture Back-office Existante

### Projets Découverts

| Projet | Localisation | Status |
|--------|--------------|--------|
| **Archive 2025** | `b974.fr/2025_archive/` | Monorepo pnpm (référence) |
| **Dashboard 2026** | `b974.fr/2026/b974-dashboard/` | **Actif en prod** |
| **Master 2026** | `b974.fr/2026/b974_master_2026/` | Documentation |

### Dashboard 2026 - Stack

| Package | Version | Usage |
|---------|---------|-------|
| next | 14.2.5 | Framework |
| react | 18.3.1 | UI |
| gray-matter | 4.0.3 | Markdown frontmatter |
| react-markdown | 10.1.0 | Markdown rendering |
| chart.js | 4.5.1 | Charts |
| @hello-pangea/dnd | 18.0.1 | Drag & drop |

### Routes Actuelles Dashboard

| Route | Description |
|-------|-------------|
| `/` | Home dashboard |
| `/dashboard` | Vue principale |
| `/docs` | Documentation viewer (markdown) |
| `/tasks` | Task management |
| `/kpis` | Métriques |
| `/timeline` | Timeline projet |

### Point d'Intégration Recommandé

**Ajouter `/blog` au Dashboard 2026** :
- `gray-matter` + `react-markdown` déjà installés
- Pattern identique à `/docs`
- Articles en markdown dans `/public/blog/articles/`

### VPS OVH Configuration

| Paramètre | Valeur |
|-----------|--------|
| IP | 51.210.100.89 |
| Specs | 4 vCores, 8 GB RAM, 160 GB SSD |
| OS | Ubuntu 24.10 |
| Conteneurs prévus | prod, dev, app |

---

## 4. Ligne Éditoriale Recommandée

### Fréquence & Format

| Aspect | Recommandation | Justification |
|--------|----------------|---------------|
| **Fréquence** | 2-3 articles/mois | Qualité > quantité pour niche |
| **Longueur** | 1 500-2 400 mots | SEO optimal + engagement |
| **Format** | Content Clusters | Autorité thématique |

### Types de Contenu Prioritaires

| Type | % | Exemples |
|------|---|----------|
| **Tutoriels pratiques** | 40% | How-to taille, rempotage, styles |
| **Behind-the-scenes** | 30% | Coulisses artisan, voyages, expos |
| **Guides de soins** | 20% | Par espèce, evergreen SEO |
| **Événements** | 10% | Voyage Japon, expositions |

### Architecture SEO - Content Clusters

```
PILIER : "Guide Complet Bonsai" (2500+ mots)
│
├── Cluster : Arrosage & Hydratation
├── Cluster : Taille & Mise en forme
├── Cluster : Rempotage
├── Cluster : Maladies & Parasites
├── Cluster : Espèces populaires
│   ├── Ficus
│   ├── Genévrier
│   ├── Érable japonais
│   └── Pin
└── Cluster : Outils & Équipement
```

### Ton Éditorial (cohérent avec Brand)

| Canal | Formalité | Chaleur | Expertise |
|-------|-----------|---------|-----------|
| **Blog** | 35% | 85% | 65% |

**Archétype** : Sage-Artisan (55% Sage, 45% Creator)
- Expert mais humble
- Mentor patient, non condescendant
- Artisan passionné
- Bienveillant et authentique

### Paramètres Ligne Éditoriale (back-office)

| Paramètre | Options |
|-----------|---------|
| Ton | Décontracté / Professionnel / Expert |
| Longueur cible | Court (800) / Medium (1500) / Long (2400) |
| Style | Tutoriel / Storytelling / Guide / Actualité |
| Série | Voyage Japon / Technique / Coulisses / Espèces |
| SEO Focus | Principal (H1) / Secondaires (H2-H3) |

---

## 5. Benchmark : Bonsai Empire

### Métriques Leader

| Aspect | Valeur |
|--------|--------|
| Ancienneté | 25+ ans |
| YouTube | 300k+ abonnés |
| Engagement | 1.6 pages/session |
| Stratégie | Contenu éducatif gratuit + communauté |

### Leçons Clés

1. **Contenu gratuit de haute qualité** - Éduquer avant de vendre
2. **Multimédia** - Vidéo + texte combinés
3. **Communauté** - Forum, engagement social
4. **Architecture SEO en silos** - Clusters thématiques
5. **Consistance** - Publication régulière sur le long terme

---

## 6. Fonctionnalités Requises

### MVP Blog AI-Assisted

| Fonctionnalité | Priorité | Complexité |
|----------------|----------|------------|
| Upload audio + photos | P0 | Medium |
| Transcription audio (Whisper) | P0 | Low (API) |
| Génération article Ralph | P0 | High |
| Interface validation | P0 | Medium |
| Publication programmée | P1 | Low |
| Paramètres ligne éditoriale | P1 | Medium |
| Séries/thèmes | P1 | Low |
| SEO auto (meta, sitemap) | P1 | Low |
| Analytics intégré | P2 | Medium |

### Intégrations Techniques

| Service | Usage | API |
|---------|-------|-----|
| **Whisper** | Transcription audio | OpenAI |
| **Claude/GPT** | Génération contenu | Anthropic/OpenAI |
| **Cloudinary** | Optimisation images | Cloudinary |
| **Prisma** | Persistence articles | PostgreSQL |

---

## 7. Fichiers Clés

| Fichier | Contenu |
|---------|---------|
| `b974.fr/2026/b974-dashboard/` | Dashboard actif pour intégration |
| `b974.fr/2026/b974_master_2026/03_technique/` | Documentation technique |
| `b974.fr/2026/b974_master_2026/07_contenu/` | Dossier contenu (vide) |

---

## 8. Risques & Mitigations

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Qualité IA insuffisante | High | Validation humaine obligatoire |
| Ton incohérent | Medium | Paramètres ligne éditoriale stricts |
| SEO non performant | Medium | Content clusters + refresh régulier |
| Adoption utilisateur | Low | Interface simple, workflow fluide |

---

## Recommendations

1. **Phase 1** : Intégrer `/blog` au Dashboard 2026 existant
2. **Phase 2** : Implémenter workflow upload + transcription
3. **Phase 3** : Intégrer Ralph pour génération articles
4. **Phase 4** : Paramètres ligne éditoriale dans back-office
5. **Phase 5** : Analytics et optimisation

---

## Acceptance Criteria Status

- [x] Objectifs business définis et priorisés
- [x] Vision AI-Assisted avec Ralph documentée
- [x] Architecture back-office existante analysée
- [x] Ligne éditoriale recommandée avec sources
- [x] Fonctionnalités requises listées
- [x] Benchmark concurrentiel (Bonsai Empire)
- [x] Risques identifiés avec mitigations
