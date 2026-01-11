# STRAT-003 - Roadmap Produit Blog B974

> Date: 2026-01-11 | Phase: Strategy | Status: Complete

## Summary

Roadmap produit sur 12 mois structurée en 4 releases majeures : MVP (Q1), Social Integration (Q2), Analytics & Growth (Q3), Community Features (Q4).

---

## 1. Vue Globale 12 Mois

### Timeline Overview

```
2026
┌─────────────────────────────────────────────────────────────────────────────┐
│  JAN    FEV    MAR  │  AVR    MAI    JUN  │  JUL    AOÛ    SEP  │  OCT    NOV    DÉC  │
├─────────────────────┼─────────────────────┼─────────────────────┼─────────────────────┤
│     MVP (V1.0)      │  Social (V1.2)      │  Growth (V1.5)      │  Community (V2.0)   │
│                     │                     │                     │                     │
│  ○ Blog Public      │  ○ Instagram        │  ○ Analytics        │  ○ Commentaires     │
│  ○ Upload           │  ○ Facebook         │  ○ Search           │  ○ User accounts    │
│  ○ Ralph            │  ○ Scheduling       │  ○ A/B Testing      │  ○ Bookmarks        │
│  ○ Newsletter       │  ○ Series           │  ○ Recommandations  │  ○ Newsletter pro   │
│                     │  ○ Editorial params │  ○ SEO automation   │  ○ API publique     │
└─────────────────────┴─────────────────────┴─────────────────────┴─────────────────────┘
```

### Versions & Dates

| Version | Nom | Date Cible | Status |
|---------|-----|------------|--------|
| **V1.0** | MVP | Fin février 2026 | Planned |
| **V1.1** | Editorial+ | Mars 2026 | Planned |
| **V1.2** | Social Integration | Mai 2026 | Planned |
| **V1.5** | Growth Engine | Août 2026 | Planned |
| **V2.0** | Community | Décembre 2026 | Planned |

---

## 2. Roadmap Détaillée par Trimestre

### Q1 2026 (Janvier - Mars) : Foundation

#### V1.0 - MVP (Semaines 1-6)

| Feature | Description | Priority | Effort |
|---------|-------------|----------|--------|
| **Blog Public** | Route /blog, liste, article, SEO | P0 | M |
| **Upload Interface** | Audio + photos back-office | P0 | M |
| **Ralph Generation** | Whisper + Claude → article | P0 | L |
| **Newsletter** | Inscription + envoi auto | P0 | M |

**Milestone M1**: Premier article publié via workflow complet

**Critères de sortie**:
- [ ] 3 articles publiés
- [ ] Newsletter fonctionnelle
- [ ] Performance OK (LCP < 2.5s)

#### V1.1 - Editorial+ (Semaines 7-10)

| Feature | Description | Priority | Effort |
|---------|-------------|----------|--------|
| **Séries/Thèmes** | Grouper articles par série | P1 | S |
| **Publication programmée** | Scheduler publication | P1 | S |
| **Paramètres éditoriaux** | Config ton, longueur, style | P1 | M |
| **Draft workflow** | Save, edit, preview amélioré | P1 | S |

**Milestone M2**: Série "Voyage Japon 2026" publiée (3+ articles)

---

### Q2 2026 (Avril - Juin) : Social Expansion

#### V1.2 - Social Integration (Semaines 11-18)

| Feature | Description | Priority | Effort |
|---------|-------------|----------|--------|
| **Instagram Integration** | Génération + publication auto | P1 | L |
| **Facebook Integration** | Génération + publication auto | P1 | M |
| **Social Preview** | Preview posts avant publication | P1 | S |
| **Media Optimization** | Formats adaptés par canal | P1 | M |
| **Scheduling social** | Programmer posts sociaux | P2 | M |

**Milestone M3**: Publication multi-canal automatique (blog + social)

**Critères de sortie**:
- [ ] 10 articles publiés avec distribution sociale
- [ ] Engagement social > 3%
- [ ] Workflow < 20 min total

#### V1.3 - LinkedIn & Polish (Semaines 19-22)

| Feature | Description | Priority | Effort |
|---------|-------------|----------|--------|
| **LinkedIn Integration** | Posts professionnels | P2 | M |
| **Rich Snippets** | Schema.org, FAQ | P2 | S |
| **Image Gallery** | Carrousel photos dans articles | P2 | M |
| **Related Articles** | Suggestions automatiques | P2 | S |

**Milestone M4**: 20 articles publiés, SEO optimisé

---

### Q3 2026 (Juillet - Septembre) : Growth Engine

#### V1.5 - Analytics & Optimization (Semaines 23-32)

| Feature | Description | Priority | Effort |
|---------|-------------|----------|--------|
| **Analytics Dashboard** | Métriques intégrées | P2 | L |
| **Search** | Recherche full-text articles | P2 | M |
| **A/B Testing Titles** | Test titres newsletter | P3 | M |
| **Content Recommendations** | IA suggestions sujets | P3 | L |
| **SEO Automation** | Audit, suggestions, refresh | P2 | M |
| **Performance Monitoring** | Core Web Vitals tracking | P2 | S |

**Milestone M5**: Dashboard analytics opérationnel

**KPIs Cibles Q3**:
- 30+ articles publiés
- 2000 visites/mois organiques
- 500+ abonnés newsletter

---

### Q4 2026 (Octobre - Décembre) : Community

#### V2.0 - Community Features (Semaines 33-44)

| Feature | Description | Priority | Effort |
|---------|-------------|----------|--------|
| **Commentaires** | Système modéré | P3 | L |
| **User Accounts** | Login lecteurs (optionnel) | P3 | L |
| **Bookmarks** | Sauvegarder articles | P3 | M |
| **Newsletter Premium** | Tiers, contenu exclusif | P3 | L |
| **API Publique** | Endpoints lecture articles | P3 | M |
| **Notifications** | Push pour nouveaux articles | P3 | M |

**Milestone M6**: Communauté active (commentaires, engagement)

**KPIs Cibles Q4**:
- 50+ articles publiés
- 5000 visites/mois
- 1000+ abonnés newsletter
- 5% engagement communauté

---

## 3. Milestones Clés

### Vue Chronologique

```
2026
│
├─ M0: Projet lancé (Jan)
│   └── PRD validé, équipe alignée
│
├─ M1: Premier article (Fév)
│   └── Workflow complet fonctionnel
│
├─ M2: Série complète (Mars)
│   └── Voyage Japon 2026 publiée
│
├─ M3: Multi-canal (Mai)
│   └── Blog + Newsletter + Social
│
├─ M4: SEO mature (Juin)
│   └── 20 articles, rich snippets
│
├─ M5: Analytics (Août)
│   └── Dashboard, insights data
│
└─ M6: Communauté (Déc)
    └── V2.0, features sociales
```

### Détail Milestones

| ID | Milestone | Date | Deliverables | Success Criteria |
|----|-----------|------|--------------|------------------|
| **M0** | Project Kick-off | Jan 2026 | PRD, Architecture | Documents validés |
| **M1** | First Article | Fév 2026 | MVP live | 1 article publié workflow |
| **M2** | First Series | Mars 2026 | V1.1 live | 3+ articles "Voyage Japon" |
| **M3** | Multi-channel | Mai 2026 | V1.2 live | Auto-post social works |
| **M4** | SEO Maturity | Juin 2026 | V1.3 live | 20 articles, rankings |
| **M5** | Data-Driven | Août 2026 | V1.5 live | Analytics dashboard |
| **M6** | Community | Déc 2026 | V2.0 live | Comments, engagement |

---

## 4. Dépendances entre Features

### Graphe de Dépendances

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         DEPENDENCY GRAPH                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  INFRASTRUCTURE                                                              │
│  ┌──────────────┐                                                           │
│  │ Prisma Schema│───────────────────────────────────────────────┐           │
│  └──────┬───────┘                                               │           │
│         │                                                        │           │
│         ▼                                                        ▼           │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐  ┌──────────────┐ │
│  │ Blog Public  │───>│ Newsletter   │───>│ Analytics    │  │ Search       │ │
│  │ (F1)         │    │ (F4)         │    │ Dashboard    │  │              │ │
│  └──────┬───────┘    └──────────────┘    └──────────────┘  └──────────────┘ │
│         │                                                                    │
│         │                                                                    │
│  ┌──────┴───────┐                                                           │
│  │ Upload (F2)  │                                                           │
│  └──────┬───────┘                                                           │
│         │                                                                    │
│         ▼                                                                    │
│  ┌──────────────┐    ┌──────────────┐                                       │
│  │ Ralph (F3)   │───>│ Series       │                                       │
│  │ Generation   │    │ Management   │                                       │
│  └──────┬───────┘    └──────────────┘                                       │
│         │                                                                    │
│         ├───────────────────────────────────────┐                           │
│         │                                       │                           │
│         ▼                                       ▼                           │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐                   │
│  │ Instagram    │    │ Facebook     │    │ LinkedIn     │                   │
│  │ Integration  │    │ Integration  │    │ Integration  │                   │
│  └──────────────┘    └──────────────┘    └──────────────┘                   │
│                                                                              │
│  LEGEND                                                                      │
│  ───> Hard dependency (must be complete before)                             │
│  - - > Soft dependency (benefits from)                                      │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Matrice de Dépendances

| Feature | Depends On | Blocks |
|---------|------------|--------|
| Blog Public (F1) | Prisma Schema | Newsletter, SEO, Search |
| Upload (F2) | Cloudinary config | Ralph Generation |
| Ralph Generation (F3) | Upload, Whisper, Claude | Social posts, Series |
| Newsletter (F4) | Blog Public, Resend | Analytics, Premium tiers |
| Series | Ralph Generation | - |
| Instagram | Ralph Generation, Meta API | - |
| Facebook | Ralph Generation, Meta API | - |
| LinkedIn | Ralph Generation, LinkedIn API | - |
| Analytics | Blog Public, Newsletter | A/B Testing, Recommendations |
| Search | Blog Public | - |
| Commentaires | User Accounts (optional) | - |

### Critical Path

```
Prisma Schema → Blog Public → Upload → Ralph Generation → Social Integration
                    │
                    └──────────→ Newsletter → Analytics
```

**Bottleneck**: Ralph Generation (F3) bloque toute la distribution multi-canal.

---

## 5. Priorités Justifiées

### Matrice Valeur/Effort

```
                    HIGH VALUE
                        │
         ┌──────────────┼──────────────┐
         │              │              │
         │  QUICK WINS  │  BIG BETS    │
         │              │              │
         │  • Series    │  • Ralph Gen │
         │  • SEO meta  │  • Social    │
         │  • Related   │  • Analytics │
    LOW  │              │              │  HIGH
  EFFORT ├──────────────┼──────────────┤ EFFORT
         │              │              │
         │  FILL-INS    │  MONEY PITS  │
         │              │              │
         │  • Rich      │  • Comments  │
         │    Snippets  │  • User Accts│
         │  • Gallery   │  • API       │
         │              │              │
         └──────────────┼──────────────┘
                        │
                    LOW VALUE
```

### Justification par Feature

#### P0 - Must Have (MVP)

| Feature | Justification |
|---------|---------------|
| **Blog Public** | Sans blog, pas de produit. Core functionality. |
| **Upload** | Entrée unique du workflow AI-Assisted. |
| **Ralph Generation** | Différenciateur clé, value prop principale. |
| **Newsletter** | Distribution minimale, fidélisation base. |

#### P1 - Should Have (V1.1-1.2)

| Feature | Justification |
|---------|---------------|
| **Series** | Organisation contenu, UX améliorée, SEO clusters. |
| **Publication programmée** | Flexibilité workflow, plan éditorial. |
| **Paramètres éditoriaux** | Contrôle qualité, adaptabilité ton. |
| **Instagram** | Canal #1 audience B974 (visuel, engagement). |
| **Facebook** | Reach large audience, trafic referral. |

#### P2 - Nice to Have (V1.3-1.5)

| Feature | Justification |
|---------|---------------|
| **LinkedIn** | Audience secondaire, professionnels niche. |
| **Analytics** | Décisions data-driven, mais pas critique au lancement. |
| **Search** | Améliore UX à partir de 20+ articles. |
| **SEO Automation** | Optimisation continue, pas urgente. |

#### P3 - Future (V2.0)

| Feature | Justification |
|---------|---------------|
| **Commentaires** | Engagement communauté, mais modération lourde. |
| **User Accounts** | Nécessaire pour bookmarks/comments, complexe. |
| **API Publique** | Usage futur (apps, intégrations), pas prioritaire. |

### Decision Matrix

| Feature | Business Value | User Value | Effort | Risk | Priority |
|---------|---------------|------------|--------|------|----------|
| Blog Public | 10 | 10 | M | Low | **P0** |
| Upload | 8 | 9 | M | Low | **P0** |
| Ralph Gen | 10 | 10 | L | Medium | **P0** |
| Newsletter | 9 | 8 | M | Low | **P0** |
| Series | 6 | 7 | S | Low | **P1** |
| Instagram | 8 | 7 | L | Medium | **P1** |
| Facebook | 7 | 6 | M | Medium | **P1** |
| LinkedIn | 5 | 4 | M | Medium | **P2** |
| Analytics | 7 | 5 | L | Low | **P2** |
| Search | 5 | 7 | M | Low | **P2** |
| Comments | 4 | 6 | L | High | **P3** |

---

## 6. Risques & Mitigation

### Risques Timeline

| Risque | Impact | Probabilité | Mitigation |
|--------|--------|-------------|------------|
| Claude API instabilité | +2 semaines | Low | Fallback GPT-4 |
| Meta API changes | +3 semaines | Medium | Abstraction layer, buffer time |
| Quality issues Ralph | +2 semaines | Medium | Itérations prompts early |
| SEO non-performance | Objectifs ratés | Medium | Content clusters, patience |
| Newsletter deliverability | Distribution fail | Low | SPF/DKIM, Resend expertise |

### Risques Produit

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Contenu AI détecté | Credibilité | Review humain, ton authentique |
| Workflow trop complexe | Adoption fail | UX testing avec Manuel early |
| Social fatigue audience | Engagement drop | Fréquence contrôlée |
| Feature creep | Timeline slip | Strict MVP, defer nice-to-have |

---

## 7. Resources & Budget

### Effort Estimation (Story Points)

| Version | Features | Effort (SP) | Duration |
|---------|----------|-------------|----------|
| V1.0 MVP | 4 | 34 | 6 weeks |
| V1.1 | 4 | 12 | 4 weeks |
| V1.2 | 5 | 24 | 8 weeks |
| V1.3 | 4 | 10 | 4 weeks |
| V1.5 | 6 | 30 | 10 weeks |
| V2.0 | 6 | 40 | 12 weeks |

### API Costs (Monthly Estimate)

| Service | Usage Estimate | Cost/Month |
|---------|----------------|------------|
| OpenAI (Whisper) | 10 articles × 15 min | $0.90 |
| Anthropic (Claude) | 10 generations | $0.75 |
| Cloudinary | 100 images | Free tier |
| Resend | 1000 emails | Free tier |
| **Total** | | **~$2/month** |

---

## 8. Summary

### Key Takeaways

1. **MVP First**: 4 features, 6 weeks, valider le workflow
2. **Social After**: Instagram/Facebook en Q2, pas rush
3. **Data Later**: Analytics en Q3, après base content
4. **Community Last**: Features sociales en V2.0

### North Star

> **Publier 36 articles de qualité en 12 mois via workflow AI-Assisted, avec distribution multi-canal automatique.**

### Success at 12 Months

| Metric | Target |
|--------|--------|
| Articles publiés | 36+ |
| Trafic organique | 5000 visites/mois |
| Abonnés newsletter | 1000+ |
| Engagement social | 5% |
| Temps publication | < 20 min |

---

## Acceptance Criteria Status

- [x] Roadmap 3-6-12 mois définie
- [x] Milestones clés identifiés (M0-M6)
- [x] Dépendances entre features documentées
- [x] Priorités justifiées (P0-P3 avec matrix)
