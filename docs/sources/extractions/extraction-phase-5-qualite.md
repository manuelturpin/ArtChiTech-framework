# Extraction Phase 5 - Qualité

## 1. Résumé Exécutif

Cette phase couvre **l'ensemble des pratiques de testing** pour garantir la qualité d'une application e-commerce. Elle introduit les **Testing Agile Quadrants** (Brian Marick) et la **Pyramide des Tests** (Mike Cohn) comme cadres de référence. Les tests sont organisés en tests fonctionnels (Unit, Integration, E2E, System, Regression, API, Database) et non-fonctionnels (Performance, Security, Accessibility, Compatibility, Usability, Localization). L'automatisation est stratégique avec calcul de ROI. L'**UAT** valide l'adéquation métier avant le Go-Live. La gestion des bugs suit un cycle de vie structuré avec triage régulier. La décision **Go/No-Go** repose sur des exit criteria quantifiables et des quality gates automatisées. L'approche "Shift-Left" préconise de tester le plus tôt possible pour réduire les coûts.

---

## 2. Checklist Complète

### Stratégie de Test
- [ ] Stratégie de test documentée couvrant les 4 quadrants - **NON-NÉGOCIABLE**
- [ ] Pyramide des tests respectée (70% Unit, 20% Integration, 10% E2E) - **NON-NÉGOCIABLE**
- [ ] ROI de l'automatisation calculé pour chaque niveau - **NICE-TO-HAVE**
- [ ] Test environments définis (Local, CI, Staging, Pre-prod) - **NON-NÉGOCIABLE**

### Tests Unitaires
- [ ] Coverage > 80% sur la logique métier - **NON-NÉGOCIABLE**
- [ ] Pattern AAA (Arrange-Act-Assert) respecté - **NON-NÉGOCIABLE**
- [ ] Principes FIRST appliqués (Fast, Independent, Repeatable, Self-validating, Timely) - **NON-NÉGOCIABLE**
- [ ] Mocking limité aux frontières (API, DB) - **NON-NÉGOCIABLE**
- [ ] TDD pratiqué pour la logique critique - **NICE-TO-HAVE**

### Tests d'Intégration
- [ ] Points d'intégration critiques testés (API, DB, services externes) - **NON-NÉGOCIABLE**
- [ ] Contract testing pour microservices (Pact) - **NICE-TO-HAVE**
- [ ] Testcontainers pour DB/Redis/etc. - **NICE-TO-HAVE**

### Tests E2E
- [ ] Parcours critiques automatisés (checkout, login, search) - **NON-NÉGOCIABLE**
- [ ] Page Object Model implémenté - **NON-NÉGOCIABLE**
- [ ] Data-testid sur éléments interactifs - **NON-NÉGOCIABLE**
- [ ] Waits explicites (pas de sleep()) - **NON-NÉGOCIABLE**
- [ ] Cross-browser testing (Chrome, Firefox, Safari, Mobile) - **NON-NÉGOCIABLE**
- [ ] Stratégie anti-flaky tests - **NON-NÉGOCIABLE**

### Tests de Performance
- [ ] Load testing sur trafic attendu - **NON-NÉGOCIABLE**
- [ ] Stress testing pour trouver le point de rupture - **NON-NÉGOCIABLE**
- [ ] Core Web Vitals mesurés (LCP < 2.5s, INP < 200ms, CLS < 0.1) - **NON-NÉGOCIABLE**
- [ ] Soak testing 24h avant release majeure - **NICE-TO-HAVE**
- [ ] Spike testing pour flash sales - **NICE-TO-HAVE**

### Tests de Sécurité
- [ ] SAST intégré en CI (Semgrep, SonarQube) - **NON-NÉGOCIABLE**
- [ ] DAST sur staging (OWASP ZAP) - **NON-NÉGOCIABLE**
- [ ] Dependency scanning (Snyk, npm audit) - **NON-NÉGOCIABLE**
- [ ] Secrets detection (GitLeaks) - **NON-NÉGOCIABLE**
- [ ] OWASP Top 10 vérifié - **NON-NÉGOCIABLE**
- [ ] Penetration testing annuel - **NON-NÉGOCIABLE**

### Tests d'Accessibilité
- [ ] WCAG 2.2 AA compliance - **NON-NÉGOCIABLE**
- [ ] axe-core intégré en CI - **NON-NÉGOCIABLE**
- [ ] Navigation clavier complète - **NON-NÉGOCIABLE**
- [ ] Tests avec screen reader (NVDA/VoiceOver) - **NICE-TO-HAVE**
- [ ] Alt text sur toutes les images - **NON-NÉGOCIABLE**

### UAT
- [ ] Scénarios UAT dérivés des critères d'acceptation - **NON-NÉGOCIABLE**
- [ ] Environnement UAT proche production - **NON-NÉGOCIABLE**
- [ ] Données réalistes (anonymisées) - **NON-NÉGOCIABLE**
- [ ] Process de feedback structuré - **NON-NÉGOCIABLE**
- [ ] Sign-off formel obtenu - **NON-NÉGOCIABLE**

### Gestion des Bugs
- [ ] Template de bug report standardisé - **NON-NÉGOCIABLE**
- [ ] Bug triage régulier (2-3x/semaine) - **NON-NÉGOCIABLE**
- [ ] Severity et Priority correctement assignées - **NON-NÉGOCIABLE**
- [ ] RCA pour bugs critiques - **NON-NÉGOCIABLE**
- [ ] Métriques de défauts suivies (Escape Rate < 5%) - **NON-NÉGOCIABLE**

### Release
- [ ] Exit criteria définis et vérifiés - **NON-NÉGOCIABLE**
- [ ] Quality gates en CI bloquantes - **NON-NÉGOCIABLE**
- [ ] 0 bug critique ouvert - **NON-NÉGOCIABLE**
- [ ] Rollback plan testé - **NON-NÉGOCIABLE**

---

## 3. Frameworks Détaillés

### Framework 1 : Testing Agile Quadrants (Brian Marick)

- **Quand l'utiliser** : Pour équilibrer la stratégie de test et s'assurer qu'on couvre tous les aspects
- **Comment** :
  - **Q1** (Technology-Facing, Support Team) : Tests unitaires, tests composants - AUTOMATISÉS
  - **Q2** (Business-Facing, Support Team) : Tests fonctionnels, tests de story, E2E - AUTOMATISÉS
  - **Q3** (Business-Facing, Critique Product) : Tests exploratoires, usabilité, UAT - MANUELS
  - **Q4** (Technology-Facing, Critique Product) : Performance, sécurité, load testing - OUTILS
- **Répartition effort typique** : Q1: 40-50%, Q2: 20-30%, Q3: 10-20%, Q4: 10-20%
- **Exemple concret** : Pour un sprint e-commerce "Paiement 3x Alma" → Q1: Unit tests AlmaPaymentService, Q2: E2E parcours 3x, Q3: UAT équipe finance, Q4: Performance/Security
- **Pièges à éviter** : Ne faire que Q1, négliger Q3 (exploratory), faire Q4 en dernier (shift-left!)

### Framework 2 : Test Automation Pyramid (Mike Cohn)

- **Quand l'utiliser** : Pour structurer l'investissement en automatisation
- **Comment** :
  ```
        /\           E2E (10%) - Peu, lents, fragiles
       /──\
      /    \         Integration (20%) - Quelques-uns
     /──────\
    /        \       Unit (70%) - Beaucoup, rapides, stables
   /──────────\
  ```
- **Exemple concret** : E-commerce → 500+ tests unitaires, 100-150 tests integration, 20-30 tests E2E
- **Pièges à éviter** : "Ice Cream Cone" anti-pattern (trop de manuels/E2E, peu d'unitaires)

### Framework 3 : TDD - Test-Driven Development

- **Quand l'utiliser** : Pour la logique métier critique
- **Comment** : Cycle **RED-GREEN-REFACTOR**
  1. RED : Écrire un test qui échoue
  2. GREEN : Écrire le code minimal pour passer
  3. REFACTOR : Améliorer en gardant les tests verts
- **Exemple concret** : CartCalculator - écrire le test `should_apply_discount_percentage` avant le code
- **Pièges à éviter** : Écrire le test après, ne pas refactorer

### Framework 4 : Session-Based Test Management (SBTM)

- **Quand l'utiliser** : Pour structurer l'exploratory testing
- **Comment** :
  - **Charter** : Mission de la session (Explore X With Y To discover Z)
  - **Time-box** : 60-120 minutes
  - **Session Notes** : Log continu des découvertes
  - **Debriefing** : Résumé post-session
- **Exemple concret** : "Explore le tunnel de retour With un compte client To discover des edge cases UX"
- **Pièges à éviter** : Confondre avec ad-hoc testing (pas de structure)

### Framework 5 : Page Object Model (POM)

- **Quand l'utiliser** : Pour organiser les tests E2E et réduire la maintenance
- **Comment** : Une classe par page/composant encapsulant sélecteurs et actions
- **Exemple concret** :
  ```javascript
  class ProductPage {
    selectors = { addToCartBtn: '[data-testid="add-to-cart"]' };
    async addToCart() { await this.page.click(this.selectors.addToCartBtn); }
  }
  ```
- **Pièges à éviter** : God Page Object (1000 lignes), assertions dans les PO

### Framework 6 : OWASP Top 10 (2021)

- **Quand l'utiliser** : Comme checklist de sécurité pour chaque release
- **Comment** : Vérifier les 10 catégories de risques :
  - A01: Broken Access Control
  - A02: Cryptographic Failures
  - A03: Injection
  - A04: Insecure Design
  - A05: Security Misconfiguration
  - A06: Vulnerable Components
  - A07: Authentication Failures
  - A08: Integrity Failures
  - A09: Logging Failures
  - A10: SSRF
- **Exemple concret** : A03 Injection → Prepared statements SQL, CSP headers pour XSS
- **Pièges à éviter** : Ne vérifier qu'en fin de projet (shift-left security)

### Framework 7 : WCAG 2.2 (Web Content Accessibility Guidelines)

- **Quand l'utiliser** : Pour garantir l'accessibilité (légalement requis)
- **Comment** : Principes **POUR** :
  - **P**erceivable : L'information peut être perçue (alt text, contraste 4.5:1)
  - **O**perable : Navigation clavier, pas de contenu qui flashe
  - **U**nderstandable : Erreurs explicites, langage clair
  - **R**obust : Compatible avec technologies d'assistance
- **Niveaux** : A (minimum), AA (standard légal), AAA (optimal)
- **Exemple concret** : Checkout → Labels sur inputs, erreurs identifiées, focus visible
- **Pièges à éviter** : Ne tester qu'avec outils automatisés (détectent ~30%)

---

## 4. Métriques et KPIs

| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| **Code Coverage** | % lignes/branches couvertes par tests | > 80% | < 60% | Jest, Istanbul, SonarQube |
| **Test Pass Rate** | % tests qui passent | > 95% | < 90% | CI/CD dashboard |
| **Defect Density** | Bugs / KLOC ou Story Points | < 5 bugs/KLOC | > 10 | Jira, SonarQube |
| **Defect Escape Rate** | Bugs prod / Total bugs | < 5% | > 10% | Jira metrics |
| **Defect Removal Efficiency** | Bugs pré-prod / Total | > 95% | < 90% | Jira metrics |
| **MTTR** | Mean Time To Resolution | < 3 jours | > 7 jours | Jira |
| **Flaky Test Rate** | Runs flaky / Total runs | < 1% | > 5% | CI analytics |
| **LCP** | Largest Contentful Paint | < 2.5s | > 4s | Lighthouse, WebPageTest |
| **INP** | Interaction to Next Paint | < 200ms | > 500ms | Lighthouse |
| **CLS** | Cumulative Layout Shift | < 0.1 | > 0.25 | Lighthouse |
| **API Response P95** | 95e percentile temps réponse | < 500ms | > 2s | k6, Datadog |
| **UAT Pass Rate** | % scénarios UAT réussis | > 95% | < 90% | UAT Report |
| **Critical Bugs Open** | Nombre bugs critiques ouverts | 0 | > 0 | Jira |

---

## 5. Anti-patterns Détaillés

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| **Ice Cream Cone** | Trop de tests manuels/E2E, peu d'unitaires | Lent, coûteux, fragile | Respecter la pyramide |
| **Testing in Prod** | "On verra en prod" | Bugs critiques clients | Environnements de test, automation |
| **Tests Always Green** | Jamais d'échec | Tests faibles ou sans assertions | Mutation testing, review des tests |
| **Tests Always Red** | Tests ignorés | Faux sentiment de sécurité | Fix ou suppression |
| **Flaky Tests Ignored** | Relance jusqu'à vert | Confiance érodée | Time-box dédié pour fix |
| **Coverage Theater** | 100% coverage mais bugs | Tests superficiels | Focus sur comportements critiques |
| **QA Bottleneck** | QA en fin de sprint seulement | Retards, bugs tardifs | Shift-left, embedded QA |
| **Sleep() Waits** | `sleep(5000)` dans E2E | Tests lents et fragiles | Waits explicites |
| **Fragile Selectors** | `.btn-primary:nth-child(2)` | Cassent au redesign | data-testid |
| **God Page Object** | PO de 1000+ lignes | Maintenance impossible | Décomposer en components |
| **Tests Interdépendants** | Ordre d'exécution compte | Échecs en cascade | Isolation complète |
| **Mocking Excessif** | Tout est mocké | Test ne teste plus rien de réel | Mock aux frontières seulement |
| **No Bug Triage** | Bugs jamais triés | Backlog incontrôlable | Meeting régulier obligatoire |
| **UAT Last Minute** | UAT la veille du déploiement | Pas de temps pour corrections | Planifier UAT tôt |
| **Skip Security** | "On fera plus tard" | Vulnérabilités en prod | SAST/DAST en CI |

---

## 6. Outils Recommandés

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| **Unit Testing JS** | Jest, Vitest | Tests unitaires React/Node | Mocha |
| **Unit Testing Python** | pytest | Tests unitaires Python | unittest |
| **E2E Testing** | **Playwright** | Tests E2E multi-browser (leader 2024) | Cypress, Selenium |
| **API Testing** | Supertest, REST Assured | Tests API automatisés | Postman (GUI) |
| **Load Testing** | **k6** | Tests de charge | JMeter, Gatling, Locust |
| **SAST** | Semgrep, SonarQube | Analyse statique sécurité | CodeQL, Snyk Code |
| **DAST** | OWASP ZAP | Scan dynamique | Burp Suite, Nuclei |
| **Dependency Scan** | Snyk, Dependabot | Vulnérabilités dépendances | npm audit |
| **Secrets Detection** | GitLeaks | Secrets dans le code | TruffleHog |
| **Accessibility** | axe-core, Lighthouse | Tests accessibilité auto | Pa11y, WAVE |
| **Screen Reader** | NVDA (gratuit) | Tests manuels accessibilité | VoiceOver (Mac), JAWS |
| **Visual Regression** | Percy, Chromatic | Comparaison screenshots | BackstopJS, Playwright |
| **Test Data** | Faker.js | Génération données test | Factory Bot (Ruby) |
| **Test Containers** | Testcontainers | DB/Cache éphémères | Docker Compose |
| **Contract Testing** | Pact | Consumer-Driven Contracts | Spring Cloud Contract |
| **Bug Tracking** | Jira, Linear | Gestion bugs | GitHub Issues |
| **Bug Capture** | Loom, Jam | Capture vidéo/enrichie | Marker.io |
| **CI/CD** | GitHub Actions | Pipeline de tests | GitLab CI, CircleCI |
| **Coverage** | Istanbul (nyc) | Code coverage | c8, SonarQube |
| **Usability** | Hotjar, UserTesting | Tests utilisabilité | Maze, FullStory |

---

## 7. Rôles Impliqués

| Rôle | Niveau d'implication | Responsabilités |
|------|----------------------|-----------------|
| **QA Engineer / SDET** | Très élevé | Stratégie de test, automation E2E/API, tests manuels, bug triage |
| **Développeurs** | Élevé | Tests unitaires, TDD, code review, fix bugs |
| **Tech Lead** | Moyen | Quality gates, architecture testable, décisions techniques |
| **Product Owner** | Moyen | Critères d'acceptation, priorité bugs, UAT sign-off |
| **DevOps/SRE** | Moyen | CI/CD pipelines, test environments, monitoring |
| **Security Engineer** | Moyen | SAST/DAST, penetration testing, OWASP compliance |
| **UX Designer** | Faible-Moyen | Tests utilisabilité, accessibility review |
| **Users (UAT)** | Faible | Exécution scénarios UAT, feedback |
| **Business Stakeholders** | Faible | Go/No-Go decision, sign-off |

---

## 8. Livrables Attendus

- **Stratégie de Test** : Document définissant l'approche globale, quadrants, outils
- **Plan de Test** : Scénarios et cas de test pour la release
- **Suite de Tests Automatisés** : Unit, Integration, E2E dans le repo
- **Pipeline CI/CD avec Tests** : Lint, Unit, Integration, E2E, Security dans le workflow
- **Rapport de Tests** : Résultats d'exécution, coverage, métriques
- **Rapport de Performance** : Load test results, Core Web Vitals
- **Rapport de Sécurité** : SAST/DAST findings, OWASP compliance
- **Rapport d'Accessibilité** : WCAG compliance, issues identifiées
- **Rapport UAT** : Résultats scénarios, feedback utilisateurs
- **Sign-off UAT** : Document formel d'acceptation
- **Exit Criteria Checklist** : Validation des critères de release
- **Known Issues List** : Bugs acceptés pour la release
- **Release Notes** : Changelog, breaking changes

---

## 9. Transitions

### Entrée (venant de Phase 4 - Développement)
- Code fonctionnel déployable
- Tests unitaires écrits par les devs
- Feature flags configurés
- Environnements de test disponibles
- Documentation API à jour
- Definition of Done respectée sur les stories

### Sortie (vers Phase 6 - Lancement)
**Critères Go** :
- [ ] Exit criteria tous vérifiés
- [ ] 0 bug critique ouvert
- [ ] UAT sign-off obtenu
- [ ] Performance baseline établie
- [ ] Security scan passé
- [ ] Rollback plan testé
- [ ] Monitoring/alerting configuré
- [ ] Documentation release complète

**Critères No-Go** :
- Bug critique non résolu
- Échec UAT sans workaround
- Vulnérabilité sécurité critique
- Performance dégradée (> 50% baseline)
- Environnement prod non prêt
- Rollback impossible

---

## 10. Citations Clés

> "Exploratory testing is a style of software testing that emphasizes the personal freedom and responsibility of the individual tester to continually optimize the quality of their work."
- Cem Kaner, 1983

> "Component testing (also known as unit testing): Testing of individual hardware or software components."
- ISTQB Syllabus

> "Integration testing: Testing performed to expose defects in the interfaces and in the interactions between integrated components."
- ISTQB Syllabus

> "Shift-left testing: An approach to accelerate software testing by moving testing activities earlier in the software development lifecycle."
- Definition

> "The cost to fix a defect grows exponentially the later it is found in the development lifecycle."
- Principe fondamental (1x en dev → 10x en test → 100x en prod)

---

## 11. Références Externes

### Standards et Certifications
- **ISTQB** Foundation Level Syllabus v4.0 (2023) - https://www.istqb.org/
- **IEEE 829** - Standard for Software and System Test Documentation
- **ISO/IEC 25010** - Software Quality Model
- **ISO/IEC/IEEE 29119** - Software Testing Standards

### Sécurité
- **OWASP Top 10 (2021)** - https://owasp.org/Top10/
- **OWASP Web Security Testing Guide (WSTG) v4.2**
- **OWASP ASVS** - Application Security Verification Standard

### Accessibilité
- **WCAG 2.2** - https://www.w3.org/WAI/WCAG22/quickref/
- **WAI-ARIA** - Accessible Rich Internet Applications

### Livres de référence
- Crispin, L. & Gregory, J. - *Agile Testing* (2009)
- Cohn, M. - *Succeeding with Agile* (2009) - Pyramide des tests
- Kaner, C., Bach, J. - *Lessons Learned in Software Testing* (2001)
- Whittaker, J.A. - *Exploratory Software Testing* (2009)

### Documentation outils
- Playwright - https://playwright.dev/docs/intro
- Jest - https://jestjs.io/docs/
- k6 - https://k6.io/docs/
- axe-core - https://www.deque.com/axe/

---

## 12. Red Flags de Phase

| Signal d'alerte | Cause probable | Action recommandée |
|-----------------|----------------|-------------------|
| Tests toujours verts | Tests trop faibles, pas d'assertions | Review des tests, mutation testing |
| Tests toujours rouges | Tests abandonnés ou environment cassé | Fix ou suppression |
| Flaky tests ignorés | Pression delivery, pas de temps | Time-box pour fix |
| Coverage qui baisse | Nouveau code non testé | Quality gate bloquante |
| UAT en dernière minute | Mauvaise planification | Shift-left UAT |
| "On testera en prod" | Manque de confiance dans les tests | Renforcer l'automation |
| Bugs critiques en prod | Testing insuffisant | RCA, améliorer coverage |
| QA bottleneck | QA trop tard, trop centralisé | Shift-left, embedded QA |
| Pas de regression suite | Trop de manual testing | Investir en automation |
| Bug reports incomplets | Manque de formation/process | Template obligatoire |
| Triage jamais fait | Pas de priorité qualité | Meeting régulier obligatoire |
| Environnement instable | Infra négligée | Investir en test infra |
| "Ce n'est pas un bug" | Specs floues | Clarifier acceptance criteria |

---

## 13. Quick Reference

### Testing Quadrants
```
                    Business-Facing
                          │
     ┌────────────────────┼────────────────────┐
     │       Q2           │         Q3          │
     │  Functional/Story  │    Exploratory      │
     │  [AUTOMATISÉ]      │    UAT [MANUEL]     │
Support────────────────────────────────────────────Critique
Team   │       Q1           │         Q4          │Product
     │  Unit/Component    │    Perf/Security    │
     │  [AUTOMATISÉ]      │    [OUTILS]         │
     └────────────────────┼────────────────────┘
                          │
                    Technology-Facing
```

### Pyramide des Tests
```
        /\           E2E (10%) - Lent, fragile
       /──\
      /    \         Integration (20%)
     /──────\
    /        \       Unit (70%) - Rapide, stable
   /──────────\
```

### Severity vs Priority
- **Severity** (technique) : Critical > Major > Minor > Trivial
- **Priority** (business) : P1 (heures) > P2 (sprint) > P3 (planifié) > P4 (backlog)

### Core Web Vitals
| Métrique | Bon | À améliorer | Mauvais |
|----------|-----|-------------|---------|
| LCP | < 2.5s | 2.5-4s | > 4s |
| INP | < 200ms | 200-500ms | > 500ms |
| CLS | < 0.1 | 0.1-0.25 | > 0.25 |
