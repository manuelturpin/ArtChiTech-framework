# Plan Framework Projet v2.0

**Version** : 2.0 (enrichi avec recherche)
**Date** : 2026-01-04
**Base** : plan-framework-projet.md + 7 rapports de recherche

---

## 1. Vision et Objectifs

### 1.1 North Star Metric
**Métrique principale** : _À définir selon le modèle business_
- E-commerce B2C : Weekly Active Buyers
- Marketplace : GMV (Gross Merchandise Value)
- Subscription : Monthly Recurring Revenue (MRR)

### 1.2 OKRs Projet

**Objective 1** : Valider le Product-Market Fit
- KR1 : Sean Ellis Test > 40% "très déçus"
- KR2 : NPS > 30
- KR3 : Retention D30 > 25%

**Objective 2** : Livrer un MVP fonctionnel
- KR1 : 100% des user stories critiques implémentées
- KR2 : 0 bug critique en production
- KR3 : Core Web Vitals dans le vert

**Objective 3** : Établir les fondations techniques
- KR1 : Coverage tests > 80%
- KR2 : CI/CD < 15 min
- KR3 : SLO Uptime > 99.5%

---

## 2. Discovery (Phase 1)

### 2.1 Framework JTBD

**Job Principal** :
```
[UTILISATEUR CIBLE] a besoin de [BESOIN/OBJECTIF]
parce que [INSIGHT/RAISON]
mais actuellement [OBSTACLE/FRICTION]
ce qui entraîne [CONSÉQUENCE NÉGATIVE].
```

**Dimensions à explorer** :
- Job fonctionnel
- Job émotionnel
- Job social
- Four Forces : Push, Pull, Anxiety, Habit

### 2.2 Value Proposition Canvas

| Customer Profile | Value Map |
|-----------------|-----------|
| **Jobs** : Tâches à accomplir | **Products** : Solutions offertes |
| **Pains** : Frustrations actuelles | **Pain Relievers** : Comment on soulage |
| **Gains** : Résultats désirés | **Gain Creators** : Comment on crée de la valeur |

### 2.3 Analyse Marché

- [ ] TAM (Total Addressable Market)
- [ ] SAM (Serviceable Available Market)
- [ ] SOM (Serviceable Obtainable Market)
- [ ] Benchmark 5+ concurrents
- [ ] Porter's 5 Forces

### 2.4 Personas Validés

Template par persona :
```markdown
## Persona : [Nom]
**Segment** : [Description]
**Job principal** : [JTBD]
**Pains majeurs** : [Liste]
**Gains recherchés** : [Liste]
**Quote** : "[Verbatim interview]"
```

### 2.5 Opportunity Solution Tree

```
        OUTCOME (North Star)
               │
    ┌──────────┼──────────┐
    │          │          │
Opportunity  Opp 2      Opp 3
    │
┌───┴───┐
Sol A  Sol B
```

### 2.6 Livrables Discovery

- [ ] Problem Statement validé
- [ ] Personas documentés (3-5)
- [ ] JTBD identifiés
- [ ] VPC complété
- [ ] OST créé
- [ ] Hypothèses priorisées
- [ ] Go/No-Go documenté

---

## 3. Stratégie (Phase 2)

### 3.1 Priorisation RICE

| Feature | Reach | Impact | Confidence | Effort | Score |
|---------|-------|--------|------------|--------|-------|
| [Feature] | [1-10] | [1-5] | [%] | [semaines] | R×I×C/E |

### 3.2 User Story Mapping

```
├── Epic 1 : [Nom]
│   ├── Story 1.1 : [Titre] [MVP]
│   ├── Story 1.2 : [Titre] [MVP]
│   └── Story 1.3 : [Titre] [V2]
├── Epic 2 : [Nom]
│   └── ...
```

### 3.3 MVP Scope

**In Scope (MVP)** :
- [ ] Feature critique 1
- [ ] Feature critique 2
- [ ] Feature critique 3

**Out of Scope (V2+)** :
- Feature nice-to-have 1
- Feature nice-to-have 2

### 3.4 Go-to-Market Strategy

| Stratégie | Description | Quand |
|-----------|-------------|-------|
| Product-Led | Le produit drive l'acquisition | Produit self-serve |
| Sales-Led | Équipe commerciale | Enterprise B2B |
| Marketing-Led | Brand et contenu | B2C, SMB |

### 3.5 Livrables Stratégie

- [ ] Roadmap MVP définie
- [ ] User Story Map créée
- [ ] Backlog priorisé (RICE)
- [ ] Timeline établie
- [ ] Équipe staffée

---

## 4. Conception (Phase 3)

### 4.1 Information Architecture

- [ ] Site map
- [ ] Navigation structure
- [ ] Content model
- [ ] URL strategy

### 4.2 Design System

**Tokens** :
- Colors (primary, secondary, semantic)
- Typography (font family, sizes, weights)
- Spacing (scale)
- Shadows, borders, radius

**Components** :
- [ ] Buttons
- [ ] Forms (inputs, selects, checkboxes)
- [ ] Cards
- [ ] Navigation
- [ ] Modals
- [ ] Tables
- [ ] Alerts/Toasts

### 4.3 Accessibilité (WCAG 2.2 AA)

- [ ] Contrast ratio ≥ 4.5:1
- [ ] Focus visible
- [ ] Navigation clavier complète
- [ ] Alt text sur images
- [ ] Labels sur tous les inputs
- [ ] Erreurs identifiées

### 4.4 Wireframes & Prototypes

- [ ] Low-fidelity wireframes
- [ ] User flows
- [ ] High-fidelity mockups
- [ ] Prototype interactif
- [ ] User testing (5+ users)

### 4.5 Livrables Conception

- [ ] Design System documenté
- [ ] Maquettes validées
- [ ] Specs composants
- [ ] Assets exportés
- [ ] Handoff dev prêt

---

## 5. Développement (Phase 4)

### 5.1 Architecture

**Stack Technique** :
- Frontend : [Framework]
- Backend : [Framework]
- Database : [Type]
- Infra : [Cloud provider]

**Patterns** :
- [ ] API REST/GraphQL
- [ ] State management
- [ ] Authentication
- [ ] Error handling

### 5.2 Git Workflow

```
main ← production (protected)
  └── develop ← integration
       └── feature/XXX-description
```

**Branches** :
- `main` : Production
- `develop` : Intégration
- `feature/*` : Nouvelles features
- `bugfix/*` : Corrections
- `hotfix/*` : Urgences prod

### 5.3 Definition of Done

**Story is Done when** :
- [ ] Code review approuvé
- [ ] Tests unitaires écrits (coverage > 80%)
- [ ] Tests E2E pour parcours critiques
- [ ] Documentation mise à jour
- [ ] Déployé en staging
- [ ] QA validé
- [ ] Acceptance criteria vérifiés

### 5.4 Code Review Checklist

- [ ] Code lisible et maintenable
- [ ] Pas de console.log/debug
- [ ] Gestion des erreurs
- [ ] Pas de secrets hardcodés
- [ ] Performance OK
- [ ] Sécurité OK (OWASP)
- [ ] Tests présents

### 5.5 Feature Flags

**Stratégie** :
- Release toggles : Découpler deploy/release
- Experiment toggles : A/B tests
- Ops toggles : Circuit breakers
- Permission toggles : Features par segment

**Outils** : LaunchDarkly / Unleash / Flagsmith

### 5.6 Technical Debt

- [ ] Backlog dette maintenu
- [ ] 20-30% temps alloué maintenance
- [ ] Review trimestrielle
- [ ] Métriques qualité trackées

### 5.7 Livrables Développement

- [ ] Code fonctionnel
- [ ] Tests passants
- [ ] Documentation API
- [ ] Changelog
- [ ] Migration scripts

---

## 6. Qualité (Phase 5)

### 6.1 Pyramide des Tests

```
        /\           E2E (10%)
       /──\
      /    \         Integration (20%)
     /──────\
    /        \       Unit (70%)
   /──────────\
```

### 6.2 Testing Agile Quadrants

| Quadrant | Type | Automatisation |
|----------|------|----------------|
| Q1 (Tech/Team) | Unit, Component | AUTOMATISÉ |
| Q2 (Business/Team) | Functional, E2E | AUTOMATISÉ |
| Q3 (Business/Critique) | Exploratory, UAT | MANUEL |
| Q4 (Tech/Critique) | Perf, Security | OUTILS |

### 6.3 Types de Tests

**Automatisés** :
- [ ] Unit tests (Jest/Vitest)
- [ ] Integration tests
- [ ] E2E tests (Playwright)
- [ ] API tests
- [ ] Visual regression

**Performance** :
- [ ] Load testing (k6)
- [ ] Core Web Vitals
- [ ] Lighthouse CI

**Sécurité** :
- [ ] SAST (Semgrep/SonarQube)
- [ ] DAST (OWASP ZAP)
- [ ] Dependency scan (Snyk)
- [ ] Secrets detection (GitLeaks)

**Accessibilité** :
- [ ] axe-core CI
- [ ] Lighthouse accessibility
- [ ] Screen reader testing

### 6.4 UAT Process

1. Scénarios dérivés des AC
2. Environnement UAT proche prod
3. Données anonymisées
4. Sessions avec stakeholders
5. Feedback structuré
6. Sign-off formel

### 6.5 Bug Management

**Severity** : Critical > Major > Minor > Trivial
**Priority** : P1 (heures) > P2 (sprint) > P3 (planifié) > P4 (backlog)

**Template Bug Report** :
```markdown
## Bug : [Titre]
**Severity** : [Critical/Major/Minor/Trivial]
**Priority** : [P1/P2/P3/P4]
**Steps to Reproduce** :
1. ...
2. ...
**Expected** : ...
**Actual** : ...
**Environment** : ...
**Screenshot/Video** : [lien]
```

### 6.6 Exit Criteria Release

- [ ] 0 bug critique ouvert
- [ ] Coverage > 80%
- [ ] E2E tests verts
- [ ] Security scan passé
- [ ] Performance baseline OK
- [ ] UAT sign-off obtenu
- [ ] Documentation à jour

---

## 7. Lancement (Phase 6)

### 7.1 Stratégie Déploiement

| Stratégie | Quand | Rollback |
|-----------|-------|----------|
| Blue-Green | Apps critiques, zero downtime | Instantané |
| Canary | Features majeures | Graduel |
| Rolling | Updates réguliers | Graduel |
| Dark Launch | Backend majeur | N/A |

### 7.2 SLI/SLO/SLA

| SLI | SLO | Measurement |
|-----|-----|-------------|
| Availability | 99.9% | successful_requests / total |
| Latency P99 | < 500ms | histogram_quantile(0.99) |
| Error Rate | < 0.1% | errors / total |

**Error Budget** : `100% - SLO%` de marge d'erreur autorisée

### 7.3 Rollback Plan

1. Snapshot pré-déploiement
2. Health checks automatiques
3. Rollback automatique si échec
4. Rollback manuel < 5 min
5. Communication stakeholders

### 7.4 Infrastructure Checklist

- [ ] Environment prod provisionné
- [ ] Config identique staging/prod
- [ ] Auto-scaling configuré
- [ ] Backups testés
- [ ] DR plan documenté
- [ ] Monitoring opérationnel
- [ ] Logs centralisés
- [ ] Secrets sécurisés
- [ ] CDN configuré

### 7.5 Go/No-Go Checklist

**Technical** (/10) :
- [ ] (2) Tests passants
- [ ] (2) Performance OK
- [ ] (2) Security OK
- [ ] (2) Monitoring ready
- [ ] (2) Rollback testé

**Operational** (/10) :
- [ ] (2) On-call défini
- [ ] (2) Runbooks créés
- [ ] (2) Incident team ready
- [ ] (2) Comms channels OK
- [ ] (2) Support formé

**Business** (/10) :
- [ ] (2) Marketing ready
- [ ] (2) Documentation OK
- [ ] (2) CS briefé
- [ ] (2) Sales enabled
- [ ] (2) Release comms prêtes

**Decision** : Score ≥ 24 = GO

### 7.6 Incident Response

**Rôles War Room** :
- Incident Commander (IC)
- Tech Lead
- Comms Lead
- Ops Lead
- Scribe

**Severity Response** :
| Sev | Impact | Response |
|-----|--------|----------|
| SEV1 | Service down | < 15 min, 24/7 |
| SEV2 | Major degraded | < 30 min |
| SEV3 | Minor impacted | < 4h |
| SEV4 | Cosmetic | Best effort |

### 7.7 Livrables Lancement

- [ ] Release notes
- [ ] Known issues list
- [ ] Support FAQ
- [ ] Status page updated
- [ ] Celebration planned 🎉

---

## 8. Croissance (Phase 7)

### 8.1 AARRR Framework

| Étape | Métrique | Cible |
|-------|----------|-------|
| **Acquisition** | CAC | < LTV/3 |
| **Activation** | Time to Value | < 5 min |
| **Retention** | D30 | > 25% |
| **Revenue** | LTV/CAC | 3:1 - 5:1 |
| **Referral** | K-factor | > 0.5 |

### 8.2 HEART Framework

| Dimension | Metric |
|-----------|--------|
| Happiness | NPS > 30 |
| Engagement | Sessions/user |
| Adoption | Feature adoption > 30% |
| Retention | D30 retention |
| Task Success | Completion rate > 80% |

### 8.3 A/B Testing

**Process** :
1. Hypothèse documentée
2. Sample size calculé
3. Durée minimum définie
4. Guardrail metrics identifiées
5. Analyse statistique rigoureuse
6. Decision documentée

### 8.4 Continuous Discovery

- [ ] Interviews hebdomadaires
- [ ] NPS/CSAT trimestriel
- [ ] Support ticket analysis
- [ ] Product analytics review
- [ ] Roadmap iteration

### 8.5 SRE Practices

**Error Budget Policy** :
- Budget > 50% : Ship normally
- Budget 10-50% : Careful review
- Budget < 10% : Feature freeze

**Postmortem** (dans 48h post-incident) :
1. Summary
2. Impact
3. Timeline
4. Root cause
5. What went well/wrong
6. Action items

### 8.6 Livrables Croissance

- [ ] Dashboards key metrics
- [ ] Experiment reports
- [ ] Cohort analysis weekly
- [ ] Postmortems
- [ ] Roadmap updates

---

## 9. Annexes

### 9.1 Outils Recommandés

| Catégorie | Outil Principal | Alternative |
|-----------|-----------------|-------------|
| Product Analytics | Amplitude | Mixpanel, PostHog |
| Error Tracking | Sentry | Rollbar |
| Feature Flags | LaunchDarkly | Unleash |
| CI/CD | GitHub Actions | GitLab CI |
| E2E Testing | Playwright | Cypress |
| Load Testing | k6 | JMeter |
| Monitoring | Datadog | Prometheus+Grafana |
| Incident Mgmt | PagerDuty | OpsGenie |

### 9.2 Templates Disponibles

- [ ] Template Interview JTBD
- [ ] Template Bug Report
- [ ] Template Postmortem
- [ ] Template Runbook
- [ ] Template Release Notes
- [ ] Template Go/No-Go

---

*Framework Projet v2.0 - Enrichi avec recherche phases 1-7*
