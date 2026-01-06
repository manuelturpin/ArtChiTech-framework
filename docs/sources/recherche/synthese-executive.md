# Synthese Executive : Cycle de Vie Projet
## Guide Consolide des 7 Phases

**Version** : 1.0
**Date** : 30 decembre 2024
**Auteur** : Claude (Deep Research - OPUS 4.5)
**Source** : Consolidation de 7 rapports de recherche (~1.2 Mo)

---

## Table des matieres

1. [Executive Summary](#1-executive-summary)
2. [Flux et Transitions](#2-flux-et-transitions)
3. [Cartographie des Roles](#3-cartographie-des-roles)
4. [Priorisation des Pratiques](#4-priorisation-des-pratiques)
5. [Metriques et KPIs](#5-metriques-et-kpis)
6. [Anti-patterns](#6-anti-patterns)
7. [Boite a Outils](#7-boite-a-outils)
8. [Checklist Master](#8-checklist-master)
9. [Adaptation par Contexte](#9-adaptation-par-contexte)
10. [References Croisees et Glossaire](#10-references-croisees-et-glossaire)

---

# 1. Executive Summary

## 1.1 Vue d'ensemble

Le cycle de vie d'un projet digital se decompose en **7 phases distinctes mais interconnectees**, formant un continuum allant de la validation du probleme jusqu'a l'exploitation et l'optimisation continue. Chaque phase produit des livrables qui deviennent les inputs de la suivante, avec des points de decision Go/No-Go qui protegent contre les investissements prematures.

**Le paradigme moderne** integre ces phases de maniere iterative plutot que strictement sequentielle : le "Shift-Left" deplace les tests et validations en amont, tandis que le "Continuous Discovery" maintient le lien avec les utilisateurs tout au long du cycle. L'objectif n'est plus de "livrer un projet" mais de "creer de la valeur validee incrementalement".

**Pour le e-commerce B2B/B2C**, ce cycle est particulierement critique : les couts d'erreur sont eleves (bugs de paiement, securite, performance), la concurrence est feroce, et la retention client determine la rentabilite long terme. Une Discovery rigoureuse evite de construire le mauvais produit, une Qualite systematique previent les incidents en production, et une Croissance data-driven maximise le ROI.

## 1.2 Les 7 phases en bref

| Phase | Objectif | Livrable cle | Duree typique | Effort relatif |
|-------|----------|--------------|---------------|----------------|
| **1. Discovery** | Valider que le probleme existe et merite d'etre resolu | Problem Statement, Personas, Value Prop Canvas, Go/No-Go | 2-8 sem | 5-10% |
| **2. Strategie** | Planifier et cadrer le projet avec objectifs mesurables | OKRs, Business Model Canvas, Scope MVP, Budget | 2-4 sem | 5-10% |
| **3. Conception** | Designer l'experience et l'architecture | Wireframes, Design System, Architecture, ADRs | 4-8 sem | 10-15% |
| **4. Developpement** | Construire et implementer le code | Code teste, CI/CD, Documentation technique | 8-16 sem | 35-45% |
| **5. Qualite** | Tester et valider avant production | Tests E2E, UAT Sign-off, Release notes, Go/No-Go | 4-8 sem | 15-20% |
| **6. Lancement** | Deployer et communiquer | Systeme en prod, Monitoring, War Room, Rollback | 2-4 sem | 5-10% |
| **7. Croissance** | Operer et iterer continuellement | Analytics, Feedback loops, SLOs, Experiments | Continue | 10-20%/an |

## 1.3 Les 7 insights majeurs

### 1. La Discovery economise 10-100x en developpement
Un bug detecte en phase requirements coute 1x, en developpement 10x, en production 30-100x. Investir 5-10% du budget en Discovery evite de construire le mauvais produit.

### 2. Les OKRs supplantent les objectifs SMART pour l'alignement
Le framework OKR (Objectives & Key Results) d'Intel/Google permet un alignement hierarchique avec un taux de succes cible de 70% (pas 100%), encourageant l'ambition sans penaliser l'echec partiel.

### 3. Le Design System est un investissement, pas un cout
Un Design System reduit le temps de developpement de 25-50% sur les projets suivants, assure la coherence UI/UX, et facilite l'onboarding des nouveaux designers/developpeurs.

### 4. Le Shift-Left Testing reduit le cout des bugs de 30-100x
Integrer les tests des les phases de conception et developpement (TDD, code review, CI) detecte les problemes avant qu'ils n'atteignent la production.

### 5. La retention > acquisition comme levier de croissance
Ameliorer la retention de 5% peut augmenter les profits de 25%. Le ratio LTV/CAC ideal est de 3:1 a 5:1. La retention est le multiplicateur de toutes les autres metriques.

### 6. Le rollback doit etre TESTE avant chaque deploiement
Un plan de rollback non teste est un plan qui echouera. Les strategies Blue-Green et Canary permettent un retour arriere instantane.

### 7. Le Product-Market Fit se mesure objectivement
Si plus de 40% des utilisateurs seraient "tres decus" sans votre produit (test de Sean Ellis), vous avez atteint le PMF. Sinon, iterez avant de scaler.

## 1.4 Les 3 erreurs fatales a eviter

### Erreur #1 : Skipper la Discovery
**Impact** : Construire un produit que personne ne veut. Gaspillage de 100% du budget developpement.
**Prevention** : Minimum 5 interviews utilisateurs, Problem Statement valide, decision Go/No-Go formelle.

### Erreur #2 : Deployer sans plan de rollback teste
**Impact** : Incident en production sans possibilite de retour arriere. Perte de revenus, reputation, clients.
**Prevention** : Rollback documente ET teste en staging. Feature flags pour desactivation instantanee.

### Erreur #3 : Feature Factory (shipper sans mesurer)
**Impact** : Accumulation de features non utilisees, dette technique, equipe demotivee, metriques stagnantes.
**Prevention** : Success metrics definies AVANT developpement. Kill criteria. Review hebdomadaire des experiments.

---

# 2. Flux et Transitions

## 2.1 Diagramme du cycle de vie

```
                                    BOUCLE FEEDBACK CONTINU
    +-------------------------------------------------------------------------+
    |                                                                         |
    v                                                                         |
+----------+     +----------+     +-----------+     +-------------+           |
|          |     |          |     |           |     |             |           |
| DISCOVERY| --> | STRATEGIE| --> | CONCEPTION| --> | DEVELOPPEMENT|          |
|          |     |          |     |           |     |             |          |
+----+-----+     +----+-----+     +-----+-----+     +------+------+          |
     |                |                 |                  |                  |
     | Go/No-Go       | Go/No-Go        |                  |                  |
     v                v                 v                  v                  |
                                                                              |
+----------+     +----------+     +-----------+                               |
|          |     |          |     |           |                               |
| QUALITE  | --> | LANCEMENT| --> | CROISSANCE| ------------------------------+
|          |     |          |     |           |
+----+-----+     +----+-----+     +-----------+
     |                |                 ^
     | Go/No-Go       |                 |
     v                +-----------------+
                         Iterations continues
```

**Legende** :
- **Fleches pleines** : Flux sequentiel principal
- **Go/No-Go** : Points de decision formels
- **Boucle Feedback** : Insights croissance alimentent les iterations

## 2.2 Matrice de transition inter-phases

| Transition | Livrables cles passes | Risques si mal gere | Validation requise |
|------------|----------------------|---------------------|-------------------|
| **Discovery -> Strategie** | Problem Statement, Personas, Value Prop Canvas, Competitive Analysis | Construire solution sans comprendre le probleme | PO + Sponsor signent Go/No-Go |
| **Strategie -> Conception** | OKRs, Business Model Canvas, Scope MVP, Budget, RACI | Concevoir sans objectifs mesurables, scope flou | Sponsor approuve budget |
| **Conception -> Developpement** | Wireframes valides, Design System, Architecture, ADRs, API specs | Architecture irrealisable, design non teste | Tech Lead + Design Lead signent |
| **Developpement -> Qualite** | Code complet, Tests unitaires (>80%), CI verte, Documentation | Code non testable, environnement non pret | Build stable, DoD respectee |
| **Qualite -> Lancement** | Tests E2E passes, UAT sign-off, Release notes, Known issues | Bugs critiques non detectes, UAT incomplete | QA Lead + PO signent Go/No-Go |
| **Lancement -> Croissance** | Systeme stable 24h, Monitoring actif, Baseline metriques | Pas de metriques, support non pret | Ops confirme stabilite |

## 2.3 Points de decision Go/No-Go

| Phase | Question cle | Criteres Go | Criteres No-Go |
|-------|--------------|-------------|----------------|
| **Discovery** | Le probleme merite-t-il d'etre resolu ? | Problem valide, marche suffisant, faisable | Probleme non valide, marche trop petit, infaisable |
| **Strategie** | Le projet est-il viable ? | ROI positif, ressources disponibles, risques acceptables | ROI negatif, ressources manquantes, risques trop eleves |
| **Qualite** | Le produit est-il pret pour la production ? | 0 bug critique, UAT signe, rollback teste | Bugs critiques, UAT non signe, rollback non teste |
| **Lancement** | Le deploiement est-il reussi ? | Systeme stable, metriques dans les seuils | Error rate > 5%, performance degradee |

---

# 3. Cartographie des Roles

## 3.1 Vue consolidee des metiers par phase

| Metier | Ph.1 | Ph.2 | Ph.3 | Ph.4 | Ph.5 | Ph.6 | Ph.7 | Competences cles | Certifications |
|--------|------|------|------|------|------|------|------|------------------|----------------|
| **Product Manager** | +++ | +++ | ++ | + | ++ | + | +++ | Vision produit, priorisation, analytics | CSPO, CPM |
| **UX Researcher** | +++ | + | ++ | - | + | - | + | Interviews, tests utilisateurs, analyse | Nielsen Norman |
| **UX/UI Designer** | + | - | +++ | + | + | - | + | Wireframing, Figma, design systems | - |
| **Solutions Architect** | - | + | +++ | ++ | + | + | + | Architecture, cloud, scalabilite | AWS SA, GCP |
| **Tech Lead** | - | + | ++ | +++ | ++ | ++ | ++ | Code, architecture, decisions techniques | - |
| **Developpeur Frontend** | - | - | + | +++ | + | + | + | JS/TS, frameworks, HTML/CSS | - |
| **Developpeur Backend** | - | - | + | +++ | + | + | + | APIs, databases, securite | - |
| **DevOps Engineer** | - | - | + | ++ | + | +++ | ++ | CI/CD, cloud, containers, IaC | AWS DevOps, CKA |
| **QA Engineer** | - | - | + | + | +++ | + | + | Tests, automatisation, methodologie | ISTQB |
| **SRE** | - | - | - | + | + | +++ | +++ | Monitoring, SLOs, incident management | Google SRE |
| **Scrum Master** | - | + | + | +++ | + | + | + | Facilitation, Agile, coaching | CSM, PSM |
| **Data Analyst** | + | + | - | - | - | - | +++ | SQL, Python, BI tools, stats | - |

**Legende** : +++ = Role principal, ++ = Contributeur important, + = Contributeur ponctuel, - = Non implique

## 3.2 Equipe minimale par taille de projet

| Taille | Roles essentiels (cumules) | Roles dedies si budget | Notes |
|--------|---------------------------|------------------------|-------|
| **Solo (1 personne)** | PM + UX + Dev + Ops (vous) | Freelance UX pour discovery, DevOps ponctuel | Focus MVP strict, outils no-code si possible |
| **Petite equipe (2-5)** | PM/PO, 1-2 Devs full-stack, UX/UI | QA, DevOps | PM peut faire discovery, devs font ops |
| **Equipe moyenne (5-15)** | PM, UX Researcher, 2 UX/UI, Tech Lead, 3-5 Devs, QA Lead, DevOps | SRE, Data Analyst | Specialisation des roles commence |
| **Equipe large (15+)** | Tous les roles separes | Plusieurs de chaque role | Squads par domaine fonctionnel |

## 3.3 Salaires indicatifs 2024-2025

| Metier | France (brut annuel) | USA (brut annuel) |
|--------|---------------------|-------------------|
| Product Manager | 45-80K EUR | $100-180K |
| UX/UI Designer | 35-70K EUR | $80-160K |
| Solutions Architect | 60-90K EUR | $140-200K+ |
| Developpeur Senior | 45-75K EUR | $100-200K |
| DevOps Engineer | 50-80K EUR | $120-200K |
| QA Lead | 45-65K EUR | $100-160K |
| SRE | 55-95K EUR | $130-250K |

---

# 4. Priorisation des Pratiques

## 4.1 Matrice Impact x Effort

### Quick Wins (Fort impact, Faible effort)

| Pratique | Phase | Impact | Effort | ROI |
|----------|-------|--------|--------|-----|
| 5 user interviews minimum | Discovery | Tres eleve | 1 semaine | 100:1 |
| Definition of Done ecrite | Developpement | Eleve | 1 jour | 50:1 |
| Smoke tests automatises | Qualite | Eleve | 2 jours | 30:1 |
| Feature flags | Lancement | Tres eleve | 2-3 jours | 40:1 |
| NPS post-achat | Croissance | Moyen | 1 jour | 20:1 |

### Investissements majeurs (Fort impact, Fort effort)

| Pratique | Phase | Impact | Effort | ROI |
|----------|-------|--------|--------|-----|
| Design System complet | Conception | Tres eleve | 4-8 semaines | 5:1 sur 2 ans |
| CI/CD pipeline complete | Developpement | Tres eleve | 2-4 semaines | 10:1 sur 1 an |
| Tests E2E automatises | Qualite | Tres eleve | 4-8 semaines | 8:1 sur 1 an |
| Observability stack | Croissance | Eleve | 2-4 semaines | 6:1 sur 1 an |

### A eviter (Faible impact, Fort effort)

| Pratique | Phase | Pourquoi eviter | Alternative |
|----------|-------|-----------------|-------------|
| Documentation exhaustive en Discovery | Discovery | Obsolete rapidement | Lean documentation, research repository |
| Wireframes haute fidelite d'emblee | Conception | Attachment premature | Low-fi puis iteration |
| 100% code coverage | Qualite | Rendements decroissants | 80% + tests critiques |
| Alerting sur tout | Croissance | Alert fatigue | SLO-based alerting |

## 4.2 Non-negociables vs Nice-to-have par phase

| Phase | Non-negociables | Nice-to-have si temps/budget |
|-------|-----------------|------------------------------|
| **Discovery** | 5+ user interviews, Problem Statement documente, Go/No-Go formel | Focus groups, etude quantitative, Design Sprint |
| **Strategie** | OKRs/objectifs mesurables, Scope MVP defini, Budget approuve | Business Model Canvas complet, PESTEL, Monte Carlo |
| **Conception** | Wireframes valides, Tests utilisateurs (5+), Architecture documentee | Design System complet, Prototype haute fidelite, ADRs formels |
| **Developpement** | Code review systematique, Tests unitaires (>80%), CI fonctionnelle | TDD strict, Pair programming, Documentation exhaustive |
| **Qualite** | Tests E2E parcours critiques, UAT formelle, Rollback teste | Tests performance, Tests securite OWASP, Tests accessibilite |
| **Lancement** | Monitoring actif, Plan rollback, Communication utilisateurs | Blue-Green deployment, Canary release, War Room formel |
| **Croissance** | Analytics de base, NPS/CSAT, Incident management | A/B testing infrastructure, Cohort analysis automatisee |

---

# 5. Metriques et KPIs

## 5.1 Dashboard consolide par phase

| Phase | KPI principal | Cible indicative | Red flag | Outil type |
|-------|---------------|------------------|----------|------------|
| **Discovery** | Problem/Solution Fit | Validation qualitative (5+ interviews convergent) | 0 interview, assumptions non testees | Dovetail, Notion |
| **Strategie** | Scope clarte | Document MVP approuve par sponsor | Scope flou, pas de budget | Confluence, Jira |
| **Conception** | Task Success Rate (usability tests) | > 80% | < 60%, pas de tests utilisateurs | Maze, UserTesting |
| **Developpement** | Velocity stable + Coverage > 80% | Trend stable sur 4 sprints | Velocity erratique, coverage < 60% | Jira, SonarQube |
| **Qualite** | Defect Escape Rate | < 5% bugs trouves en prod | > 10%, bugs critiques en prod | TestRail, Jira |
| **Lancement** | MTTR (Mean Time To Recovery) | < 1 heure | > 4 heures | PagerDuty, Datadog |
| **Croissance** | Retention D30 / LTV:CAC | D30 > 25%, LTV:CAC > 3:1 | D30 < 15%, LTV:CAC < 1:1 | Amplitude, Mixpanel |

## 5.2 Metriques DORA (DevOps Research and Assessment)

| Metrique | Definition | Cible Elite | Cible Medium | Cible Low |
|----------|------------|-------------|--------------|-----------|
| **Deployment Frequency** | Frequence deploiements prod | Multiple fois/jour | 1x/semaine a 1x/mois | 1x/mois a 1x/6mois |
| **Lead Time for Changes** | Temps commit -> prod | < 1 heure | 1 semaine a 1 mois | 1-6 mois |
| **Change Failure Rate** | % deploiements causant incident | 0-15% | 16-30% | > 30% |
| **Mean Time to Recovery** | Temps moyen restauration | < 1 heure | 1 jour a 1 semaine | > 1 semaine |

## 5.3 Metriques e-commerce specifiques

| Metrique | Definition | Cible B2C | Cible B2B | Source |
|----------|------------|-----------|-----------|--------|
| **Conversion Rate** | Visiteurs -> Acheteurs | 1-3% | 2-5% | Google Analytics |
| **Cart Abandonment** | Paniers abandonnes | < 70% | < 60% | Analytics |
| **LTV (Lifetime Value)** | Valeur client sur duree vie | > 3x CAC | > 5x CAC | CRM + Analytics |
| **CAC (Customer Acquisition Cost)** | Cout acquisition client | < 1/3 LTV | < 1/5 LTV | Marketing + Finance |
| **NPS (Net Promoter Score)** | Recommandation | > 30 | > 40 | Survey (Typeform, Delighted) |
| **Churn Rate** | Taux attrition mensuel | < 5% | < 3% | CRM |

## 5.4 Red flags par phase

| Phase | Red flag | Cause probable | Action immediate |
|-------|----------|----------------|------------------|
| **Discovery** | Aucune interview realisee | Rush, assumptions | STOP - Faire 5 interviews |
| **Strategie** | Scope change > 3x par semaine | Pas de priorisation | Figer scope MVP, appliquer MoSCoW |
| **Conception** | Aucun test utilisateur | Budget/temps | Minimum 5 tests guerilla |
| **Developpement** | Velocity en chute libre | Dette tech, scope creep | Retrospective urgente, sprint cleanup |
| **Qualite** | Bugs critiques en UAT | Tests insuffisants | Renforcer tests E2E, reporter lancement |
| **Lancement** | Error rate > 5% post-deploy | Bug non detecte | Rollback immediat |
| **Croissance** | NPS < 0 | Probleme produit majeur | Customer research urgente |

---

# 6. Anti-patterns

## 6.1 Top 10 des erreurs les plus couteuses (toutes phases)

| # | Anti-pattern | Phase | Impact | Prevention |
|---|--------------|-------|--------|------------|
| **1** | **Skipper la Discovery** | 1 | CRITIQUE - Construire le mauvais produit | Minimum 5 interviews, Problem Statement valide, Go/No-Go formel |
| **2** | **Scope Creep non gere** | 2 | ELEVE - Budget/delais x2-3 | MoSCoW strict, cut-off date features, sponsor valide tout ajout |
| **3** | **Pas de tests utilisateurs** | 3 | ELEVE - UX defectueuse en prod | Minimum 5 tests guerilla avant dev |
| **4** | **Code sans tests unitaires** | 4 | ELEVE - Bugs couteux, refactoring impossible | TDD ou coverage > 80% obligatoire, CI bloque si < seuil |
| **5** | **Tests happy path only** | 5 | MOYEN-ELEVE - Edge cases decouverts en prod | Analyse risques, tests negatifs, exploratory testing |
| **6** | **Deploiement sans rollback teste** | 6 | CRITIQUE - Crise si incident | Rollback teste en staging, feature flags |
| **7** | **Friday Deploys** | 6 | MOYEN - Incident weekend sans support | Regle "No deploy Friday", deployer mardi-mercredi |
| **8** | **Feature Factory** | 7 | ELEVE - Ship sans mesurer, metriques stagnantes | Success metrics AVANT dev, kill criteria, review hebdo |
| **9** | **Ignorer la dette technique** | 4,7 | ELEVE - Velocite en declin, bugs croissants | 20-30% temps alloue maintenance, tech debt backlog |
| **10** | **UAT cursoire** | 5 | MOYEN-ELEVE - Rejet utilisateurs en prod | 2+ semaines UAT, vrais utilisateurs, scenarios complets |

## 6.2 Anti-patterns par phase

### Phase 1 - Discovery
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Biais de confirmation | Ne chercher que les donnees confirmant l'idee | Questions ouvertes, chercher activement les contradictions |
| Solution-first thinking | Parler de "l'app" avant de comprendre le probleme | Bannir mots "app/site/plateforme" jusqu'au problem statement |
| Echantillonnage biaise | Interroger uniquement des proches | Screener strict, inclure sceptiques, payer participants |

### Phase 2 - Strategie
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Objectifs non mesurables | "Ameliorer l'experience" | Chaque objectif a une metrique et une cible |
| Business model ignore | Pas de clarte sur le revenu | Business Model Canvas obligatoire |
| Planning optimiste | Aucun buffer, pas de risques | PERT estimation, contingency 15-20% |

### Phase 3 - Conception
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Wireframes trop detailles | Attachment premature | Low-fi d'abord, iteration rapide |
| Devs exclus | Decouvrent architecture tard | Inclure Tech Lead des le debut |
| A11y "pour plus tard" | Accessibilite repoussee | WCAG AA integre des la conception |

### Phase 4 - Developpement
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Branches longue-duree | > 1 semaine = conflits | Trunk-based development, PRs < 1 jour |
| Code reviews superficielles | Juste "LGTM" | Checklist review, temps alloue |
| Pas de DoD | "Done" signifie different choses | Definition of Done ecrite, verifiee |

### Phase 5 - Qualite
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Tout manuel | Pas d'automatisation | Automatiser parcours critiques d'abord |
| Pas de traceability | Coverage requirements inconnu | Matrice requirements-tests |
| Ignorer non-fonctionnel | Pas de tests perf/secu | Budget temps pour non-fonctionnel |

### Phase 6 - Lancement
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Big Bang release | Tout le monde jour J | Canary/progressive rollout |
| Pas de monitoring pre-deploy | Configurer apres | Dashboards et alertes AVANT deploiement |
| Communication oubliee | Users/support surpris | Plan communication integre |

### Phase 7 - Croissance
| Anti-pattern | Symptome | Solution |
|--------------|----------|----------|
| Vanity metrics | Focus sur pageviews vs conversion | North Star Metric + input metrics |
| Backlog infini | Tout est P0 | RICE/ICE frameworks, limits WIP |
| Pas de closing the loop | Feedback collecte mais pas utilise | Process pour feedback -> roadmap |

---

# 7. Boite a Outils

## 7.1 Frameworks essentiels par phase

| Phase | Framework #1 | Framework #2 | Framework #3 | Quand utiliser |
|-------|--------------|--------------|--------------|----------------|
| **Discovery** | Jobs-to-be-Done (JTBD) | Value Proposition Canvas | Lean Canvas | JTBD pour comprendre motivations, VPC pour aligner valeur, Lean pour business model |
| **Strategie** | OKRs | MoSCoW | RICE Prioritization | OKRs pour objectifs, MoSCoW pour scope, RICE pour backlog |
| **Conception** | Design Thinking | Double Diamond | Atomic Design | Design Thinking pour process, Double Diamond pour flux, Atomic pour composants |
| **Developpement** | Scrum | Kanban | XP (TDD, Pair Programming) | Scrum pour sprints, Kanban pour flux continu, XP pour qualite code |
| **Qualite** | Testing Pyramid | Risk-Based Testing | ISTQB | Pyramid pour strategy, RBT pour prioriser, ISTQB pour methodologie |
| **Lancement** | Blue-Green Deployment | Feature Flags | SRE (SLOs/SLIs) | Blue-Green pour zero-downtime, Flags pour rollout, SRE pour monitoring |
| **Croissance** | AARRR (Pirate Metrics) | Build-Measure-Learn | HEART Framework | AARRR pour funnel, BML pour iteration, HEART pour UX metrics |

## 7.2 Stack technologique recommandee (e-commerce)

### Frontend
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| Framework | Next.js | Nuxt.js, Remix | SSR/SSG pour SEO, React ecosystem |
| UI Components | Radix UI + Tailwind | Chakra UI, MUI | Accessibilite native, personnalisable |
| State Management | Zustand / TanStack Query | Redux Toolkit | Leger, performant |
| Forms | React Hook Form + Zod | Formik + Yup | Validation type-safe |

### Backend
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| Runtime | Node.js (Express/Fastify) | Python (FastAPI) | Ecosystem JS unifie |
| ORM | Prisma | Drizzle, TypeORM | Type-safe, migrations |
| Database | PostgreSQL | MySQL | ACID, JSON support |
| Cache | Redis | Memcached | Sessions, panier, inventory |
| Search | Algolia | Elasticsearch, Meilisearch | Faceted search rapide |
| Queue | BullMQ | RabbitMQ | Jobs async (emails, webhooks) |

### DevOps & Infrastructure
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| Cloud | AWS | GCP, Azure | Leader marche, ecosysteme complet |
| Container | Docker + Kubernetes | ECS, Cloud Run | Standard industrie |
| CI/CD | GitHub Actions | GitLab CI, CircleCI | Integration native GitHub |
| IaC | Terraform | Pulumi, CloudFormation | Multi-cloud, declaratif |
| CDN | Cloudflare | AWS CloudFront | Images, static assets |
| Secrets | AWS Secrets Manager | Vault, Doppler | Rotation automatique |

### Monitoring & Observability
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| APM | Datadog | New Relic, Dynatrace | All-in-one |
| Logs | Loki + Grafana | ELK, CloudWatch | Leger, integre Grafana |
| Metrics | Prometheus + Grafana | Datadog | Open-source, standard k8s |
| Error Tracking | Sentry | Rollbar, Bugsnag | Stack traces, context |
| Uptime | Better Uptime | Pingdom | Alerting, status pages |
| Alerting | PagerDuty | Opsgenie | On-call, escalation |

### Testing
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| Unit Tests | Vitest | Jest | Rapide, ESM natif |
| E2E | Playwright | Cypress | Multi-browser, stable |
| API Testing | Playwright API | Postman, Insomnia | Integre dans suite E2E |
| Load Testing | k6 | JMeter, Locust | Scriptable JS |
| Security | Snyk + OWASP ZAP | Dependabot | SAST + DAST |

### Analytics & Product
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| Product Analytics | Amplitude | Mixpanel, PostHog | Cohorts, funnels, retention |
| Web Analytics | Plausible | GA4, Fathom | Privacy-first, RGPD compliant |
| Session Recording | PostHog | Hotjar, FullStory | Replays, heatmaps |
| A/B Testing | Statsig | LaunchDarkly, VWO | Stats robustes |
| Feature Flags | LaunchDarkly | Unleash, Flagsmith | Progressive rollout |
| Feedback | Canny | Productboard | Feature requests |

### Payments & Commerce
| Categorie | Outil recommande | Alternative | Notes |
|-----------|-----------------|-------------|-------|
| Payment Gateway | Stripe | Adyen, PayPal | API excellente, PCI compliant |
| Subscriptions | Stripe Billing | Recurly, Chargebee | Gestion abonnements |
| Tax | TaxJar / Stripe Tax | Avalara | Calcul taxes automatique |
| Fraud | Stripe Radar | Signifyd | Detection fraude |

---

# 8. Checklist Master

## 8.1 Checklist globale de projet

```
# DISCOVERY (Phase 1)
[ ] Sponsor identifie et budget approuve
[ ] Minimum 5 user interviews realisees
[ ] Problem Statement documente et valide
[ ] Personas crees (2-4, bases sur donnees)
[ ] Analyse concurrentielle completee (top 3-5)
[ ] Value Proposition Canvas rempli
[ ] TAM/SAM/SOM estimes
[ ] Hypotheses critiques listees et priorisees
[ ] Go/No-Go decide et documente
[ ] Handoff vers Strategie prepare

# STRATEGIE (Phase 2)
[ ] OKRs definis (3-5 objectives, 3-5 KRs chacun)
[ ] Business Model Canvas/Lean Canvas complete
[ ] Scope MVP defini (in/out explicite)
[ ] MoSCoW prioritization appliquee
[ ] WBS cree (Work Breakdown Structure)
[ ] Estimations realisees (planning poker, t-shirt, PERT)
[ ] Budget detaille et approuve
[ ] Risques identifies (RAID log)
[ ] RACI etabli
[ ] Go/No-Go decide

# CONCEPTION (Phase 3)
[ ] User flows documentes
[ ] Architecture de l'information validee (card sorting)
[ ] Wireframes low/mid-fi approuves
[ ] Tests utilisateurs conduits (min 5 users)
[ ] Mockups haute fidelite approuves
[ ] Design System initie (tokens, composants)
[ ] Architecture technique documentee (C4, ADRs)
[ ] API design documente (OpenAPI/Swagger)
[ ] Database schema defini
[ ] Accessibilite verifiee (WCAG AA)
[ ] Handoff design-dev prepare

# DEVELOPPEMENT (Phase 4)
[ ] Definition of Done ecrite et validee
[ ] Environnement dev configure
[ ] CI/CD pipeline fonctionnel
[ ] Conventions de code definies (linter configure)
[ ] Code reviews systematiques
[ ] Tests unitaires (coverage > 80%)
[ ] Tests integration (flux critiques)
[ ] Documentation technique a jour (README, API docs)
[ ] Secrets geres securement
[ ] Migrations database testees

# QUALITE (Phase 5)
[ ] Test plan documente
[ ] Tests E2E automatises (parcours critiques)
[ ] Tests de regression valides
[ ] Tests performance executes (load, stress)
[ ] Tests securite realises (OWASP, SAST, DAST)
[ ] Tests accessibilite (WCAG AA)
[ ] Environnement UAT prepare
[ ] UAT executee (min 2 semaines)
[ ] Bugs critiques/majeurs resolus
[ ] Sign-off UAT obtenu
[ ] Release notes preparees
[ ] Plan rollback teste
[ ] Go/No-Go decide

# LANCEMENT (Phase 6)
[ ] Checklist pre-deploiement validee
[ ] Backup database effectue
[ ] Communication utilisateurs planifiee
[ ] Support team briefee
[ ] War room participants confirmes
[ ] Monitoring/alerting configure et teste
[ ] Deploiement execute selon strategie
[ ] Smoke tests passes
[ ] Health checks verts
[ ] Metriques baseline capturees
[ ] Rollback triggers definis
[ ] Post-mortem planifie si incidents

# CROISSANCE (Phase 7)
[ ] Tracking plan implemente
[ ] North Star Metric definie
[ ] Dashboards key metrics accessibles
[ ] NPS/CSAT collecte regulierement
[ ] Canaux feedback utilisateur actifs
[ ] SLOs definis et trackes
[ ] Error budgets calcules
[ ] Incident response process documente
[ ] On-call rotation etablie
[ ] Postmortem process en place
[ ] Roadmap partagee et a jour
[ ] Tech debt backlog gere (20-30% temps)
[ ] A/B testing infrastructure operationnelle
```

---

# 9. Adaptation par Contexte

## 9.1 Par type de projet

| Type | Phases a renforcer | Phases a alleger | Specificites |
|------|-------------------|------------------|--------------|
| **E-commerce B2C** | Discovery (emotions, mobile), Lancement (SEO, perf) | - | Tunnel paiement critique, performance Core Web Vitals, SEO |
| **E-commerce B2B** | Discovery (cycle decision), Strategie (pricing) | Lancement (pas viral) | Sales enablement, pricing complexe, integrations ERP/CRM |
| **SaaS** | Toutes phases egales | - | Onboarding critique, product-led growth, churn analysis |
| **Refonte/Migration** | Conception (migration data), Qualite (regression) | Discovery (probleme connu) | Parité fonctionnelle, SEO redirections, migration donnees |
| **MVP/Startup** | Discovery, Strategie | Conception (design), Qualite (auto minimal) | Speed to market, validation rapide, iterer post-feedback |
| **Application interne** | Strategie (ROI), Conception (UX) | Lancement (pas de marketing) | Adoption employee, formation, integration SI |

## 9.2 Par taille d'equipe

### Solo (1 personne)

**Priorites** :
- Discovery : 5 interviews minimum (non negociable)
- Strategie : Lean Canvas 1 page, pas de formalisme
- Conception : Wireframes low-fi, pas de design system
- Developpement : No-code/low-code si possible, sinon boilerplate
- Qualite : Tests E2E critiques seulement
- Lancement : Deploy simple (Vercel, Railway), monitoring basique
- Croissance : Analytics basiques, NPS mensuel

**Outils** : Notion (tout-en-un), Figma (design), Vercel (deploy), Plausible (analytics)

### Petite equipe (2-5 personnes)

**Priorites** :
- Discovery : Research partagee PM + UX
- Strategie : OKRs simples, backlog Jira/Linear
- Conception : Design System light, composants reutilisables
- Developpement : CI/CD automatisee, code reviews
- Qualite : Tests E2E automatises, QA manuel parcours critiques
- Lancement : Blue-Green ou Canary, monitoring Datadog/Sentry
- Croissance : Amplitude/Mixpanel, weekly metrics review

**Outils** : Linear (gestion), Figma (design), GitHub Actions (CI), Vercel/AWS (infra), Datadog (monitoring)

### Equipe moyenne (5-15 personnes)

**Priorites** :
- Discovery : UX Researcher dedie
- Strategie : OKRs cascades, roadmap formelle
- Conception : Design System complet, composant library
- Developpement : TDD, pair programming, architecture clean
- Qualite : QA Lead dedie, tests perf/secu, UAT formelle
- Lancement : Progressive delivery, SLOs, on-call rotation
- Croissance : Product Analytics avancees, A/B testing, experimentation culture

**Outils** : Jira + Confluence, Figma + Storybook, GitHub, AWS/GCP, Datadog, Amplitude, LaunchDarkly

## 9.3 Adaptation B2C vs B2B

| Aspect | B2C | B2B |
|--------|-----|-----|
| **Discovery** | Focus emotions, parcours mobile, impulse buying | Focus ROI, cycle decision, multiples stakeholders |
| **Strategie** | CAC faible, volume eleve, freemium possible | CAC eleve acceptable, LTV long, contrats annuels |
| **Conception** | UX intuitive, onboarding rapide, mobile-first | UX efficace, formation acceptee, desktop-first |
| **Developpement** | Performance critique, SEO, integrations social | Integrations ERP/CRM, SSO, API robuste |
| **Qualite** | Tests perf (Core Web Vitals), tests mobile | Tests integration, tests data, compliance |
| **Lancement** | Marketing digital, influenceurs, viral loops | Account-Based Marketing, demo, proof of concept |
| **Croissance** | Acquisition paid, retention via engagement | Retention via success, expansion revenue, NRR |

---

# 10. References Croisees et Glossaire

## 10.1 Index vers les rapports detailles

| Sujet | Rapport | Section | Description |
|-------|---------|---------|-------------|
| User Interviews | Phase 1 - Discovery | 3.1 | Techniques d'interview, recrutement, analyse |
| Jobs-to-be-Done | Phase 1 - Discovery | 2.2 | Framework JTBD complet, exemples |
| OKRs | Phase 2 - Strategie | 2.2 | Implementation OKRs, erreurs courantes |
| Business Model Canvas | Phase 2 - Strategie | 3.1 | 9 blocs, exemples e-commerce |
| Design System | Phase 3 - Conception | 5.2 | Atomic Design (5.3), tokens, implementation |
| Architecture | Phase 3 - Conception | 7.x | C4 Model, ADRs, patterns |
| Scrum | Phase 4 - Developpement | 2.2 | Ceremonies, roles, artefacts |
| CI/CD | Phase 4 - Developpement | 6.x | Pipelines, GitOps, DevOps |
| Testing Pyramid | Phase 5 - Qualite | 5.2 | Strategie tests, automatisation |
| OWASP | Phase 5 - Qualite | 4.2 | Tests securite, Top 10 |
| Blue-Green Deployment | Phase 6 - Lancement | 3.2 | Zero-downtime, rollback |
| Feature Flags | Phase 6 - Lancement | 2.7 | Progressive delivery, types flags |
| AARRR | Phase 7 - Croissance | 2.2 | Pirate Metrics, funnel |
| SRE | Phase 7 - Croissance | 6.x | SLOs, error budgets, incidents |

## 10.2 Glossaire consolide

| Terme | Definition | Phase |
|-------|------------|-------|
| **A/B Testing** | Comparaison de deux versions pour mesurer laquelle performe mieux | 7 |
| **AARRR** | Framework Acquisition-Activation-Retention-Revenue-Referral (Pirate Metrics) | 7 |
| **ADR** | Architecture Decision Record - documentation des decisions architecture | 3 |
| **Atomic Design** | Methodologie design : Atoms > Molecules > Organisms > Templates > Pages | 3 |
| **Blue-Green Deployment** | Strategie avec deux environnements identiques pour zero-downtime | 6 |
| **CAC** | Customer Acquisition Cost - cout pour acquerir un client | 2, 7 |
| **Canary Release** | Deploiement progressif a un petit pourcentage d'utilisateurs | 6 |
| **CI/CD** | Continuous Integration / Continuous Delivery | 4 |
| **Design System** | Ensemble de composants, tokens et guidelines pour coherence UI | 3 |
| **Design Thinking** | Methode resolution problemes centree humain (Empathize, Define, Ideate, Prototype, Test) | 3 |
| **DoD** | Definition of Done - criteres pour considerer un travail termine | 4 |
| **Double Diamond** | Framework design : Discover > Define > Develop > Deliver | 3 |
| **Error Budget** | Quantite d'erreurs autorisee avant de stopper les features | 7 |
| **Feature Flag** | Interrupteur permettant d'activer/desactiver une feature sans deploiement | 6 |
| **HEART** | Framework UX metrics : Happiness, Engagement, Adoption, Retention, Task Success | 7 |
| **JTBD** | Jobs-to-be-Done - framework pour comprendre motivations utilisateurs | 1 |
| **Lean Canvas** | Version startup du Business Model Canvas | 1, 2 |
| **LTV** | Lifetime Value - valeur totale d'un client sur sa duree de vie | 2, 7 |
| **MoSCoW** | Priorisation : Must have, Should have, Could have, Won't have | 2 |
| **MTTR** | Mean Time To Recovery - temps moyen de restauration apres incident | 6 |
| **MVP** | Minimum Viable Product - produit minimal pour valider hypotheses | 2 |
| **North Star Metric** | Metrique unique capturant la valeur produit | 7 |
| **NPS** | Net Promoter Score - mesure de recommandation | 7 |
| **OKR** | Objectives and Key Results - framework d'objectifs | 2 |
| **PMF** | Product-Market Fit - adequation produit-marche | 1, 7 |
| **Problem Statement** | Formulation claire et testable du probleme a resoudre | 1 |
| **RICE** | Priorisation : Reach, Impact, Confidence, Effort | 2 |
| **Rollback** | Retour a une version precedente en cas de probleme | 6 |
| **Shift-Left** | Deplacer tests et validations en amont du cycle | 4, 5 |
| **SLI** | Service Level Indicator - mesure de fiabilite | 7 |
| **SLO** | Service Level Objective - objectif de fiabilite | 7 |
| **SMART** | Objectifs Specifiques, Mesurables, Atteignables, Realistes, Temporels | 2 |
| **SRE** | Site Reliability Engineering - discipline de fiabilite systeme | 6, 7 |
| **TDD** | Test-Driven Development - ecrire le test avant le code | 4 |
| **Testing Pyramid** | Beaucoup de tests unitaires, moins d'integration, peu d'E2E | 5 |
| **UAT** | User Acceptance Testing - validation par utilisateurs finaux | 5 |
| **Value Proposition Canvas** | Outil pour aligner offre et besoins clients | 1 |
| **WBS** | Work Breakdown Structure - decomposition du travail | 2 |
| **WCAG** | Web Content Accessibility Guidelines | 3, 5 |

## 10.3 Bibliographie consolidee

### Livres de reference
- Ries, Eric. "The Lean Startup" (2011) - Build-Measure-Learn, MVP
- Osterwalder, A. & Pigneur, Y. "Business Model Generation" (2010) - Business Model Canvas
- Christensen, C. & Ulwick, T. "Jobs to be Done" - Framework JTBD
- Doerr, John. "Measure What Matters" (2018) - OKRs
- Crispin, L. & Gregory, J. "Agile Testing" (2009) - Testing Quadrants
- Kim, G. et al. "The Phoenix Project" (2013) - DevOps
- Forsgren, N. et al. "Accelerate" (2018) - DORA metrics
- Beyer, B. et al. "Site Reliability Engineering" (2016) - SRE Google
- Cohn, Mike. "Succeeding with Agile" (2009) - Scrum, estimation
- Patton, Jeff. "User Story Mapping" (2014) - Story mapping

### Certifications et standards
- ISTQB Foundation Level v4.0 (2023) - Testing
- OWASP Top 10 (2021) - Securite
- WCAG 2.2 (2023) - Accessibilite
- ISO 9241-210 - Human-Centered Design
- ISO/IEC 25010 - Qualite logicielle

---

**Document genere le 30 decembre 2024**
**Source : Consolidation de 7 rapports de recherche - Cycle de vie projet digital**
**Auteur : Claude OPUS 4.5 - Deep Research Mode**

