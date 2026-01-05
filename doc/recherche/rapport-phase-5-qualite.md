# Rapport de Recherche : Phase 5 - Qualité
## "Tester & Valider"

**Version** : 1.0
**Date** : 29 décembre 2024
**Auteur** : Claude (Deep Research - OPUS 4.5)
**Statut** : Final

---

## Table des matières complète

### Section 1 : Introduction
- Executive Summary
- 1.1 Objectif de cette phase
- 1.2 Place dans le cycle de vie projet
- 1.3 Prérequis (outputs de Développement)
- 1.4 Outputs attendus (inputs pour Lancement)

### Section 2 : Stratégie de Test et QA
- 2.1 Test Strategy vs Test Plan
- 2.2 Quality Assurance vs Quality Control
- 2.3 Shift-Left Testing Philosophy
- 2.4 Risk-Based Testing
- 2.5 Test Coverage Strategies
- 2.6 Testing Quadrants (Brian Marick / Crispin & Gregory)
- 2.7 Exploratory Testing

### Section 3 : Tests Fonctionnels
- 3.1 Unit Testing
- 3.2 Integration Testing
- 3.3 End-to-End Testing (E2E)
- 3.4 System Testing
- 3.5 Regression Testing
- 3.6 Smoke Testing vs Sanity Testing
- 3.7 API Testing
- 3.8 Database Testing

### Section 4 : Tests Non-Fonctionnels
- 4.1 Performance Testing (Load, Stress, Spike, Endurance, Scalability)
- 4.2 Security Testing (OWASP, SAST, DAST)
- 4.3 Accessibility Testing (WCAG)
- 4.4 Compatibility Testing
- 4.5 Usability Testing
- 4.6 Localization Testing

### Section 5 : Automatisation des Tests
- 5.1 Automation Strategy et ROI
- 5.2 Test Automation Pyramid
- 5.3 Page Object Model (POM)
- 5.4 Test Data Management
- 5.5 Flaky Tests
- 5.6 Visual Regression Testing
- 5.7 Continuous Testing in CI/CD
- 5.8 Test Environment Management

### Section 6 : User Acceptance Testing (UAT)
- 6.1 UAT Planning et Execution
- 6.2 Alpha vs Beta Testing
- 6.3 Acceptance Criteria Verification
- 6.4 UAT Environments
- 6.5 Sign-off Process
- 6.6 Feedback Collection et Triage
- 6.7 UAT dans un contexte e-commerce

### Section 7 : Gestion des Bugs
- 7.1 Bug Lifecycle
- 7.2 Bug Report Writing
- 7.3 Severity vs Priority
- 7.4 Bug Triage Meetings
- 7.5 Root Cause Analysis
- 7.6 Defect Metrics

### Section 8 : Go/No-Go Decision
- 8.1 Release Criteria et Exit Criteria
- 8.2 Quality Gates
- 8.3 Go/No-Go Checklist
- 8.4 Risk Acceptance Documentation
- 8.5 Stakeholder Sign-off
- 8.6 Release Readiness Review

### Section 9 : Questions Transversales
- 9.1 Couverture de tests optimale
- 9.2 Balance automated vs manual
- 9.3 QA intégré vs équipe séparée
- 9.4 Testing sous pression temporelle
- 9.5 Testing en solo
- 9.6 Spécificités e-commerce

### Section 10 : Métiers et Compétences
- 10.1 QA Engineer / Test Engineer
- 10.2 QA Lead / Test Manager
- 10.3 SDET (Software Development Engineer in Test)
- 10.4 Test Automation Engineer
- 10.5 Performance Engineer
- 10.6 Security Tester / Penetration Tester

### Section 11 : Annexes
- 11. Checklist de Phase Qualité
- 12. Red Flags et Anti-Patterns
- 13. Quick Reference
- Glossaire
- Bibliographie et Sources
- Notes et Limitations

---

## Executive Summary

La phase de **Qualité** constitue le dernier rempart avant la mise en production d'un produit digital. Elle ne se limite pas à "trouver des bugs" : c'est un processus stratégique qui valide que le produit répond aux exigences fonctionnelles, non-fonctionnelles et aux attentes des utilisateurs finaux.

### Points clés de ce rapport

**1. La qualité est une responsabilité partagée**
Le paradigme moderne (Shift-Left Testing) déplace les activités de test le plus tôt possible dans le cycle de développement. L'ISTQB Foundation Level v4.0 (2023) confirme cette tendance en intégrant DevOps et Continuous Delivery dans son syllabus.

**2. Les Testing Quadrants structurent la stratégie**
Le modèle de Brian Marick, étendu par Lisa Crispin et Janet Gregory, organise les types de tests en quatre quadrants selon deux axes : business-facing vs technology-facing, et supporting the team vs critique the product. Cette matrice aide à équilibrer les efforts de test.

**3. L'automatisation est un investissement, pas une fin**
La Test Automation Pyramid de Mike Cohn recommande une base large de tests unitaires (rapides, stables), une couche intermédiaire de tests d'intégration, et un sommet étroit de tests E2E (lents, fragiles). Le ROI de l'automatisation doit être calculé : tous les tests ne méritent pas d'être automatisés.

**4. La sécurité est non-négociable pour l'e-commerce**
L'OWASP Top 10 (2021) et le Web Security Testing Guide (WSTG v4.2) fournissent les référentiels incontournables. Pour le B2B/B2C, les tests de paiement, la gestion des données personnelles (RGPD) et la protection contre les injections sont critiques.

**5. L'UAT valide la valeur métier**
Les tests d'acceptation utilisateur ne sont pas des tests fonctionnels "refaits par le client" : ils vérifient que le produit résout le problème métier initial. Un processus de sign-off formalisé protège toutes les parties.

**6. Les métriques guident les décisions**
Defect density, defect escape rate, test coverage, mean time to resolution : ces KPIs objectivisent la qualité et alimentent la décision Go/No-Go.

### Recommandations prioritaires pour le contexte e-commerce B2B/B2C

| Priorité | Action | Impact |
|----------|--------|--------|
| 🔴 Critique | Automatiser les tests du tunnel de paiement | Revenus |
| 🔴 Critique | Implémenter SAST/DAST dans la CI/CD | Sécurité |
| 🟠 Haute | Définir des exit criteria mesurables | Gouvernance |
| 🟠 Haute | Former l'équipe aux principes ISTQB | Professionnalisation |
| 🟡 Moyenne | Mettre en place le visual regression testing | UX consistency |
| 🟡 Moyenne | Structurer le bug triage hebdomadaire | Efficacité |

### Avertissement méthodologique

Ce rapport compile les bonnes pratiques issues de référentiels reconnus (ISTQB, OWASP, IEEE, ISO 25010) et de praticiens établis (Crispin, Gregory, Bach, Kaner, Cohn). Les recommandations doivent être adaptées au contexte spécifique de chaque projet. Les sections marquées **[À VÉRIFIER]** indiquent des informations qui nécessitent une validation supplémentaire.

---

## 1. Introduction

### 1.1 Objectif de cette phase

La phase de Qualité a pour mission de **garantir que le produit développé est conforme aux attentes** avant sa mise en production. Elle répond à trois questions fondamentales :

1. **Le produit fonctionne-t-il correctement ?** (Tests fonctionnels)
2. **Le produit fonctionne-t-il bien ?** (Tests non-fonctionnels : performance, sécurité, accessibilité)
3. **Le produit répond-il au besoin métier ?** (Validation utilisateur)

Cette phase ne se limite pas à l'exécution de tests. Elle englobe :
- La **définition de la stratégie de test** alignée sur les risques projet
- La **conception des cas de test** couvrant les exigences
- L'**exécution des tests** (manuels et automatisés)
- La **gestion des anomalies** découvertes
- La **validation par les parties prenantes** (UAT)
- La **décision de mise en production** (Go/No-Go)

### 1.2 Place dans le cycle de vie projet

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Discovery  │───▶│  Stratégie  │───▶│ Conception  │───▶│Développement│
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
                                                               │
                                                               ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────────────────────────┐
│ Croissance  │◀───│  Lancement  │◀───│      ★ QUALITÉ ★               │
└─────────────┘    └─────────────┘    │   (Tester & Valider)           │
                                      └─────────────────────────────────┘
```

**Position** : Entre le Développement et le Lancement

**Remarque importante** : Dans les approches Agile et DevOps, la phase Qualité n'est pas séquentielle mais **continue**. Les tests sont intégrés tout au long du développement (Shift-Left). Cependant, une phase formelle de validation reste nécessaire avant chaque release majeure.

### 1.3 Prérequis (outputs de la phase Développement)

Pour démarrer efficacement la phase Qualité, les éléments suivants doivent être disponibles :

| Prérequis | Description | Responsable |
|-----------|-------------|-------------|
| **Code source complet** | Fonctionnalités implémentées selon les spécifications | Équipe Dev |
| **Environnement de test** | Infrastructure dédiée, isolée de la production | DevOps/Ops |
| **Documentation technique** | Architecture, API, modèle de données | Tech Lead |
| **Critères d'acceptation** | Pour chaque User Story / fonctionnalité | Product Owner |
| **Données de test** | Jeux de données représentatifs | QA + PO |
| **Tests unitaires** | Couverture minimale définie (ex: 80%) | Développeurs |
| **Build stable** | Aucune erreur de compilation, CI verte | Équipe Dev |

### 1.4 Outputs attendus (inputs pour la phase Lancement)

La phase Qualité produit les livrables suivants :

| Output | Description | Destinataire |
|--------|-------------|--------------|
| **Rapport de tests** | Synthèse des tests exécutés, résultats, couverture | Stakeholders |
| **Liste des bugs résiduels** | Bugs connus avec severity/priority, workarounds | Support, Ops |
| **Sign-off UAT** | Validation formelle par les parties prenantes | Direction |
| **Release notes** | Fonctionnalités livrées, bugs corrigés, known issues | Utilisateurs |
| **Décision Go/No-Go** | Documentation de la décision avec justification | Projet |
| **Métriques qualité** | KPIs finaux (coverage, defect density, etc.) | Management |
| **Plan de rollback** | Procédure testée de retour arrière | Ops |

---

# Section 2 : Stratégie de Test et QA

---

## 2.1 Test Strategy vs Test Plan

### Niveau 1 - Vulgarisation

**Test Strategy** et **Test Plan** sont deux documents souvent confondus mais qui servent des objectifs différents.

- **Test Strategy** = "Comment on teste en général dans notre organisation" (vision long terme)
- **Test Plan** = "Comment on va tester ce projet spécifique" (vision projet)

**Analogie** : La Test Strategy est comme la politique de sécurité d'une entreprise (règles générales), tandis que le Test Plan est le plan de sécurité pour un événement particulier (mesures spécifiques).

**Pourquoi c'est important** : Sans stratégie claire, chaque projet réinvente la roue. Sans plan détaillé, l'exécution manque de structure.

### Niveau 2 - Approfondissement Expert

#### Définitions formelles

**Test Strategy** (selon ISTQB) :
> "Documentation de haut niveau définissant les niveaux de test à réaliser et les tests au sein de ces niveaux pour une organisation ou un programme (un ou plusieurs projets)."

**Test Plan** (selon ISTQB CTFL v4.0) :
> "Documentation décrivant les objectifs de test, les ressources et les processus pour un projet de test ; elle identifie notamment les éléments à tester, les fonctionnalités à tester, les tâches de test, les responsabilités et les risques."

#### Origine et évolution

- **IEEE 829-1998** : Premier standard définissant le format des documents de test
- **IEEE 829-2008** : Mise à jour avec Master Test Plan et niveaux de détail
- **ISTQB** : Adoption mondiale via les certifications (Foundation depuis 2005)
- **Évolution Agile** : Documents plus légers, stratégie dans le "Definition of Done"

#### Contenu type d'une Test Strategy

| Section | Contenu |
|---------|---------|
| Scope | Types de produits couverts |
| Niveaux de test | Unit, Integration, System, UAT |
| Types de test | Fonctionnel, Performance, Sécurité, etc. |
| Critères d'entrée/sortie | Génériques par niveau |
| Métriques | KPIs standards de l'organisation |
| Outils | Stack technologique de test |
| Environnements | Politique de gestion des environnements |
| Gestion des défauts | Process standard |
| Rôles et responsabilités | Matrice RACI générique |

#### Contenu type d'un Test Plan

| Section | Contenu |
|---------|---------|
| Identifiant | Référence unique du document |
| Introduction | Contexte projet, objectifs |
| Éléments à tester | Fonctionnalités spécifiques |
| Fonctionnalités exclues | Ce qui n'est PAS testé (et pourquoi) |
| Approche | Techniques de test choisies |
| Critères pass/fail | Spécifiques au projet |
| Livrables | Documents produits |
| Planning | Dates, jalons |
| Ressources | Équipe, outils, environnements |
| Risques | Risques projet spécifiques |
| Approbations | Signatures requises |

#### Standards et certifications

- **ISTQB CTFL** : Couvre Test Strategy et Test Plan
- **ISO/IEC/IEEE 29119-3:2021** : Documentation des processus de test
- **TMMi (Test Maturity Model integration)** : Niveaux de maturité incluant la documentation

#### Tendances 2024-2025

1. **Lightweight documentation** : Moins de paperasse, plus d'action
2. **Living documents** : Test plans dans des wikis collaboratifs (Confluence, Notion)
3. **Strategy as Code** : Configuration des pipelines = stratégie de test
4. **Context-Driven Testing** : Adaptation continue plutôt que plan rigide

#### Critiques et limites

- **Sur-documentation** : Risk de documents jamais lus ni mis à jour
- **Fausse sécurité** : Un plan n'est pas une garantie de qualité
- **Rigidité** : Plans détaillés obsolètes face aux changements Agile
- **Écoles alternatives** : Le Context-Driven Testing (James Bach, Cem Kaner) critique les approches trop formalisées

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Test Strategy** : Organisations avec plusieurs projets, équipes distribuées, besoin de cohérence
- **Test Plan** : Tout projet nécessitant traçabilité (réglementaire, contractuel, complexité)

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Copy-paste plan | Plan générique non adapté | Personnaliser chaque section |
| Plan exhaustif jamais lu | Trop long, trop détaillé | Limiter à 10-15 pages max |
| Plan figé | Non mis à jour | Reviews régulières (sprint) |
| Plan sans propriétaire | Personne ne maintient | Assigner un responsable |

#### Exemple concret : E-commerce B2C

**Extrait de Test Plan pour une refonte checkout**

```
PROJET: Refonte Tunnel de Paiement v2.0
DATE: Janvier 2025

1. SCOPE
   - Panier (ajout, modification, suppression)
   - Identification (guest, compte, SSO)
   - Adresse (livraison, facturation)
   - Paiement (CB, PayPal, Apple Pay)
   - Confirmation et email

2. HORS SCOPE
   - Back-office (testé séparément)
   - Intégration ERP (tests d'intégration dédiés)

3. APPROCHE
   - Tests E2E automatisés: 100% du happy path
   - Tests manuels: Edge cases, paiements réels sandbox
   - Tests de charge: 500 users concurrent (objectif Black Friday)
   - Tests sécurité: OWASP Top 10, PCI-DSS compliance

4. CRITÈRES GO/NO-GO
   - 0 bug critique/bloquant
   - < 5 bugs majeurs avec workaround
   - Performance: < 3s page load, < 500ms API response
   - Taux de conversion test A/B: non inférieur à -2%

5. PLANNING
   - Semaine 1-2: Tests fonctionnels
   - Semaine 3: Tests performance + sécurité
   - Semaine 4: UAT + corrections
   - Semaine 5: Go-live
```

---

## 2.2 Quality Assurance vs Quality Control

### Niveau 1 - Vulgarisation

**Quality Assurance (QA)** et **Quality Control (QC)** sont deux approches complémentaires :

- **QA** = "Prévenir les problèmes" (processus, méthodes, formation)
- **QC** = "Détecter les problèmes" (tests, inspections, revues)

**Analogie culinaire** :
- QA = S'assurer que le chef est formé, que les recettes sont standardisées, que la cuisine est propre
- QC = Goûter chaque plat avant de le servir au client

**Pourquoi c'est important** : QC sans QA = on trouve les bugs mais on ne réduit pas leur source. QA sans QC = on a des processus mais pas de vérification finale.

### Niveau 2 - Approfondissement Expert

#### Définitions formelles

**Quality Assurance** (ISO 9000:2015) :
> "Partie du management de la qualité visant à donner confiance en ce que les exigences pour la qualité seront satisfaites."

**Quality Control** (ISO 9000:2015) :
> "Partie du management de la qualité axée sur la satisfaction des exigences pour la qualité."

#### Tableau comparatif

| Aspect | Quality Assurance | Quality Control |
|--------|-------------------|-----------------|
| **Focus** | Processus | Produit |
| **Objectif** | Prévention des défauts | Détection des défauts |
| **Temporalité** | Proactif | Réactif |
| **Responsabilité** | Toute l'équipe | Équipe QC/Test |
| **Activités** | Standards, revues de code, formation | Tests, inspections |
| **Orientation** | Process-oriented | Product-oriented |
| **Exemples** | Définition de DoD, revues de design | Exécution de tests, validation |

#### Origine et évolution

- **1920s** : Walter Shewhart introduit le contrôle statistique de la qualité (Bell Labs)
- **1950s** : W. Edwards Deming et Joseph Juran développent le TQM (Total Quality Management)
- **1987** : ISO 9000 première version
- **1990s** : Adaptation au développement logiciel (CMM, puis CMMI)
- **2000s** : Intégration dans Agile ("Quality is everyone's responsibility")
- **2010s** : DevOps et "Quality Engineering"

#### Activités QA typiques

1. **Process Definition**
   - Définition des workflows de développement
   - Standards de codage
   - Templates et checklists

2. **Reviews et Audits**
   - Code reviews systématiques
   - Design reviews
   - Audits de processus

3. **Métriques et Amélioration**
   - Collecte de métriques
   - Analyse des tendances
   - Actions correctives

4. **Formation**
   - Onboarding qualité
   - Workshops bonnes pratiques

#### Activités QC typiques

1. **Test Design**
   - Création des cas de test
   - Préparation des données de test

2. **Test Execution**
   - Exécution manuelle et automatisée
   - Enregistrement des résultats

3. **Defect Management**
   - Identification et logging des bugs
   - Vérification des corrections

4. **Reporting**
   - Rapports de test
   - Métriques de qualité produit

#### Certifications associées

| Certification | Focus | Organisme |
|---------------|-------|-----------|
| ISTQB CTFL | Test fondamentaux | ISTQB |
| ISTQB CTAL | Test avancé | ISTQB |
| CSQA | Software Quality Assurance | QAI |
| Six Sigma | Process improvement | ASQ |
| ISO 9001 Lead Auditor | Systèmes qualité | Divers |

#### Évolution vers "Quality Engineering"

Tendance 2020s : fusion des rôles QA et QC vers le **Quality Engineer** qui :
- Participe à la définition des processus (QA)
- Conçoit et exécute les tests (QC)
- Automatise les vérifications (Dev)
- Analyse les métriques (Data)

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **QA fort** : Environnements réglementés (finance, santé), grandes organisations
- **QC fort** : Projets courts, MVP, startups early-stage
- **Équilibre** : Toute organisation mature

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| "QA Police" | QA vu comme obstacle | Intégrer QA dans l'équipe |
| QC only | Aucune amélioration des processus | Investir dans QA |
| Over-process | Bureaucratie qualité | Lean QA, juste ce qu'il faut |
| Quality silo | Qualité = job du QA uniquement | "Quality is everyone's job" |

#### Exemple concret : Mise en place QA/QC pour startup e-commerce

**Phase 1 - QC minimal (0-10 employés)**
- Tests manuels sur les parcours critiques
- Bug tracking simple (GitHub Issues)
- Pas de process formalisé

**Phase 2 - Introduction QA (10-30 employés)**
- Definition of Done avec critères qualité
- Code reviews obligatoires
- Tests automatisés CI/CD
- Première personne dédiée QA

**Phase 3 - QA mature (30+ employés)**
- Stratégie de test documentée
- Métriques suivies (coverage, defect rate)
- Audits périodiques
- Formation continue équipe
- Quality Engineer vs QA manuel

---

## 2.3 Shift-Left Testing Philosophy

### Niveau 1 - Vulgarisation

**Shift-Left Testing** signifie "décaler les tests vers la gauche" sur la timeline du projet, c'est-à-dire **tester le plus tôt possible**.

**Analogie** : Au lieu d'attendre qu'une maison soit construite pour vérifier les plans, on vérifie les plans avant de poser la première brique.

**Pourquoi c'est important** : Un bug détecté en production coûte 100x plus cher à corriger qu'un bug détecté en phase de design. Plus on teste tôt, moins on paie cher.

### Niveau 2 - Approfondissement Expert

#### Définition technique

> "Shift-Left Testing est une approche qui consiste à intégrer les activités de test dès les premières phases du cycle de développement logiciel, plutôt que de les concentrer en fin de cycle."

#### Origine et évolution

- **2001** : Larry Smith introduit le terme dans un article pour Dr. Dobb's Journal
- **2000s** : Adoption progressive avec l'Agile
- **2010s** : Accélération avec DevOps et CI/CD
- **2020s** : Extension à "Shift-Left Security" et "Shift-Left Performance"

#### Le coût des défauts selon la phase

| Phase de détection | Coût relatif | Source |
|--------------------|--------------|--------|
| Requirements | 1x | IBM Systems Sciences Institute |
| Design | 3-6x | (Étude classique, chiffres indicatifs) |
| Development | 10x | |
| Testing | 15-40x | |
| Production | 30-100x | |

**Note** : Ces chiffres sont souvent cités mais leur source originale (IBM, années 1970-80) est difficile à vérifier précisément. L'ordre de grandeur reste pertinent. **[À VÉRIFIER]** pour les ratios exacts.

#### Pratiques Shift-Left concrètes

| Pratique | Description | Phase |
|----------|-------------|-------|
| **Requirements Testing** | Review et validation des exigences | Requirements |
| **TDD** (Test-Driven Development) | Écrire le test avant le code | Development |
| **BDD** (Behavior-Driven Development) | Spécifications exécutables | Design → Dev |
| **Static Analysis** | Analyse du code sans exécution | Development |
| **Pair Programming** | Revue en temps réel | Development |
| **Code Review** | Inspection avant merge | Development |
| **Unit Testing** | Tests automatisés par les devs | Development |
| **Contract Testing** | Validation des interfaces API | Design → Dev |

#### Shift-Left vs Shift-Right

| Concept | Focus | Activités |
|---------|-------|-----------|
| **Shift-Left** | Prévention, détection précoce | Tests early, static analysis, reviews |
| **Shift-Right** | Validation en conditions réelles | Testing in production, A/B tests, feature flags, observability |

Les deux approches sont **complémentaires** dans une stratégie moderne.

#### Mesure de l'efficacité Shift-Left

**Métriques clés** :
- **Defect Detection Percentage (DDP)** par phase
- **Defect Removal Efficiency (DRE)** avant production
- **Cost of Quality (CoQ)** : prévention vs détection vs défaillance

Formule DRE :
```
DRE = (Défauts trouvés avant production / Total défauts) × 100
```

Objectif : DRE > 95%

#### ISTQB v4.0 et Shift-Left

Le syllabus ISTQB Foundation Level v4.0 (2023) intègre explicitement Shift-Left :
> "Early testing saves time and money. [...] Both static testing and dynamic testing should start as early as possible."

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Projets Agile/DevOps** : CI/CD avec tests automatisés
- **Équipes matures** : Capables de TDD, code review systématique
- **Produits critiques** : Où le coût des bugs en prod est élevé

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Shift-Left sans formation | Devs non formés aux tests | Investir en formation |
| Tout automatiser trop tôt | ROI négatif sur MVP | Automatiser progressivement |
| Oublier Shift-Right | Pas de feedback production | Monitoring, feature flags |
| Tests unitaires = suffisant | Fausse sécurité | Maintenir tests E2E |

#### Exemple concret : Pipeline CI/CD Shift-Left pour e-commerce

```
┌─────────────────────────────────────────────────────────────────┐
│                        SHIFT-LEFT PIPELINE                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  COMMIT ──▶ LINT ──▶ UNIT ──▶ SAST ──▶ BUILD ──▶ INTEGRATION   │
│              │       TESTS     │                    TESTS        │
│              │        │        │                     │           │
│              ▼        ▼        ▼                     ▼           │
│           Style    Coverage  Security            Contract        │
│           Check     > 80%    Scan                Tests           │
│                                                                  │
│  ────────────────────────────────────────────────────────────   │
│                                                                  │
│  ──▶ E2E TESTS ──▶ PERF ──▶ DEPLOY ──▶ SMOKE ──▶ MONITORING    │
│       (Critical    TESTS    STAGING    TESTS                     │
│        Paths)                                                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘

Temps total : < 15 minutes (objectif)
Blocage sur : Lint errors, Test failures, Security critical
```

---

## 2.4 Risk-Based Testing

### Niveau 1 - Vulgarisation

**Risk-Based Testing (RBT)** consiste à **prioriser les tests en fonction des risques**. On teste davantage ce qui est le plus susceptible de causer des problèmes graves.

**Analogie** : Un médecin ne fait pas tous les examens possibles à chaque visite. Il priorise selon les symptômes et l'historique du patient. De même, on concentre les tests là où les risques sont les plus élevés.

**Pourquoi c'est important** : Avec des ressources et du temps limités, tester tout de manière égale est impossible. RBT permet d'optimiser l'effort de test.

### Niveau 2 - Approfondissement Expert

#### Définition technique (ISTQB)

> "Risk-based testing est une approche de test où les activités de test sont priorisées et sélectionnées en fonction de l'analyse des risques."

**Risque Produit** = Probabilité de défaillance × Impact de la défaillance

#### Origine et évolution

- **Concept général** : Issu du Risk Management (ISO 31000)
- **Application au test** : Formalisé dans les années 1990-2000
- **ISTQB** : Intégré au syllabus Foundation depuis les premières versions
- **Standards** : ISO/IEC/IEEE 29119-1 inclut le Risk-Based Testing

#### Processus RBT

```
1. IDENTIFICATION DES RISQUES
   └─▶ Brainstorming, historique, expertise

2. ÉVALUATION DES RISQUES
   └─▶ Probabilité × Impact = Niveau de risque

3. PRIORISATION
   └─▶ Focus sur risques élevés

4. CONCEPTION DES TESTS
   └─▶ Plus de tests sur zones à risque

5. EXÉCUTION
   └─▶ Commencer par les risques élevés

6. RÉÉVALUATION
   └─▶ Ajuster selon les résultats
```

#### Matrice de risque classique

|              | Impact Faible | Impact Moyen | Impact Élevé |
|--------------|---------------|--------------|--------------|
| **Proba Élevée** | Moyen | Élevé | Critique |
| **Proba Moyenne** | Faible | Moyen | Élevé |
| **Proba Faible** | Négligeable | Faible | Moyen |

#### Facteurs influençant le risque produit

**Facteurs de probabilité (Likelihood)** :
- Complexité du code
- Nouvelles technologies
- Développeur junior
- Dépendances externes
- Historique de bugs
- Fréquence de changement

**Facteurs d'impact (Impact)** :
- Criticité business (ex: paiement vs page "À propos")
- Nombre d'utilisateurs affectés
- Réglementation (RGPD, PCI-DSS)
- Réputation
- Financier direct (pertes de ventes)
- Sécurité des utilisateurs

#### Techniques d'identification des risques

1. **Analyse d'historique** : Où étaient les bugs précédemment ?
2. **Workshops risques** : Brainstorming avec équipe et stakeholders
3. **Checklists** : Listes de risques types par domaine
4. **FMEA** (Failure Mode and Effects Analysis) : Analyse formelle
5. **Expertise métier** : Le Product Owner connaît les zones sensibles

#### Métriques associées

- **Risk Coverage** : % des risques identifiés couverts par des tests
- **Defect Detection by Risk Level** : Bugs trouvés par niveau de risque
- **Residual Risk** : Risques non couverts ou partiellement couverts

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Ressources limitées** : Impossible de tout tester
- **Délais serrés** : Priorisation nécessaire
- **Projets legacy** : Focus sur les parties modifiées + critiques
- **Réglementaire** : Démontrer une approche méthodique

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Évaluation subjective | Biais personnels | Critères objectifs, consensus équipe |
| Une seule évaluation | Risques évoluent | Réévaluation régulière |
| Ignorer les "petits" risques | Accumulation | Couvrir minimum sur tout |
| Sur-analyse | Paralysie | Timeboxer l'analyse |

#### Exemple concret : RBT pour site e-commerce B2B

**Contexte** : Plateforme de commande B2B avec 500 clients entreprises

**Analyse des risques** :

| Fonctionnalité | Probabilité | Impact | Risque | Effort Test |
|----------------|-------------|--------|--------|-------------|
| Calcul prix B2B (remises, volumes) | Élevée (complexe) | Critique (CA) | **CRITIQUE** | 40% |
| Workflow validation commande | Moyenne | Élevé (opérations) | **ÉLEVÉ** | 25% |
| Authentification SSO | Moyenne | Élevé (sécurité) | **ÉLEVÉ** | 15% |
| Catalogue produits | Faible | Moyen | MOYEN | 10% |
| Page "Mon compte" | Faible | Faible | FAIBLE | 5% |
| Footer, pages statiques | Très faible | Faible | NÉGLIGEABLE | 5% |

**Allocation résultante** :
- Tests automatisés : Calcul prix (100% coverage), Workflow (80%), SSO (100%)
- Tests manuels approfondis : Calcul prix (edge cases), Workflow (scénarios complexes)
- Tests de non-régression : Tout
- Tests exploratoires : Concentrés sur risques élevés

---

## 2.5 Test Coverage Strategies

### Niveau 1 - Vulgarisation

**Test Coverage** (couverture de test) mesure **quelle proportion du système est testée**. Il existe deux grandes approches :

- **Code Coverage** : Quel pourcentage du code est exécuté par les tests ?
- **Requirements Coverage** : Quel pourcentage des exigences est vérifié par des tests ?

**Analogie** : Si vous vérifiez une maison, le code coverage dirait "j'ai visité 80% des pièces", tandis que le requirements coverage dirait "j'ai vérifié 90% des points de la checklist d'inspection".

**Pourquoi c'est important** : La couverture indique les "zones d'ombre" non testées. Mais attention : 100% coverage ≠ 100% qualité.

### Niveau 2 - Approfondissement Expert

#### Types de Code Coverage

| Type | Mesure | Exemple |
|------|--------|---------|
| **Line Coverage** | Lignes exécutées / Total lignes | 80/100 = 80% |
| **Branch Coverage** | Branches (if/else) exécutées | Toutes les conditions testées |
| **Function Coverage** | Fonctions appelées | Toutes les fonctions utilisées |
| **Statement Coverage** | Instructions exécutées | Similaire à line coverage |
| **Condition Coverage** | Conditions booléennes | Chaque condition true ET false |
| **Path Coverage** | Chemins d'exécution | Toutes les combinaisons (explosif) |
| **MC/DC** | Modified Condition/Decision | Standard aéronautique (DO-178C) |

#### Hiérarchie de rigueur

```
Path Coverage (le plus strict, souvent impraticable)
        ↑
MC/DC (aviation, safety-critical)
        ↑
Branch Coverage (recommandé minimum)
        ↑
Line/Statement Coverage (baseline)
        ↑
Function Coverage (minimum minimorum)
```

#### Requirements Coverage

**Formule** :
```
Requirements Coverage = (Exigences avec tests / Total exigences) × 100
```

**Traceability Matrix** : Tableau liant chaque exigence à ses cas de test

| Req ID | Description | Test Cases | Status |
|--------|-------------|------------|--------|
| REQ-001 | Login utilisateur | TC-001, TC-002, TC-003 | ✅ Covered |
| REQ-002 | Récupération MDP | TC-004 | ✅ Covered |
| REQ-003 | 2FA | - | ❌ Not covered |

#### Objectifs de coverage : les chiffres du marché

**[À VÉRIFIER]** - Ces chiffres sont indicatifs et varient selon les sources :

| Contexte | Code Coverage Recommandé | Source indicative |
|----------|--------------------------|-------------------|
| Safety-critical (aviation) | 100% MC/DC | DO-178C |
| Finance, santé | 80-90% branch | Pratique courante |
| Web/SaaS standard | 70-80% line | Convention industrie |
| MVP/Startup | 50-60% minimum | Pragmatique |
| Legacy (amélioration) | +10% par release | Progressif |

#### Limites du Code Coverage

**Ce que la couverture NE dit PAS** :
1. **Qualité des assertions** : Le code est exécuté mais les tests vérifient-ils quelque chose ?
2. **Edge cases** : Les valeurs limites sont-elles testées ?
3. **Combinaisons** : Les interactions entre fonctions sont-elles couvertes ?
4. **Non-fonctionnel** : Performance, sécurité ne sont pas mesurées
5. **Code mort** : Du code jamais appelé gonfle artificiellement le coverage

**Exemple piège** :
```javascript
function divide(a, b) {
  return a / b;
}

// Test avec 100% line coverage mais 0 vérification
test('divide', () => {
  divide(10, 2); // Pas d'assertion ! Le test passe mais ne vérifie rien
});
```

#### Mutation Testing : au-delà du coverage

**Principe** : Introduire des "mutations" (bugs artificiels) dans le code et vérifier que les tests les détectent.

**Mutation Score** = (Mutations détectées / Total mutations) × 100

**Outils** : Stryker (JS), PITest (Java), mutmut (Python)

Plus révélateur que le coverage simple car vérifie la qualité des assertions.

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Code coverage** : Projets avec bonne base de tests unitaires
- **Requirements coverage** : Projets avec traçabilité exigée (contrats, réglementation)
- **Mutation testing** : Projets critiques où la qualité des tests est primordiale

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| "Gaming" the coverage | Tests sans assertions pour gonfler % | Vérifier assertions, mutation testing |
| Coverage unique métrique | Ignore autres aspects qualité | Dashboard multi-métriques |
| 100% comme objectif absolu | Rendements décroissants | Définir seuil pragmatique |
| Mesurer sans agir | Métrique non utilisée | Alertes si coverage < seuil |

#### Exemple concret : Dashboard Coverage pour e-commerce

```
DASHBOARD COUVERTURE - CHECKOUT MODULE
═══════════════════════════════════════

Code Coverage (Jest)
├── Line:     82% ████████░░ (target: 80%) ✅
├── Branch:   75% ███████░░░ (target: 70%) ✅
└── Function: 91% █████████░ (target: 85%) ✅

Requirements Coverage
├── Panier:      100% ██████████ (12/12 tests)
├── Paiement:    100% ██████████ (8/8 tests)
├── Livraison:    89% ████████░░ (8/9 tests) ⚠️
└── Confirmation: 75% ███████░░░ (3/4 tests) ⚠️

Mutation Score (Stryker) - Last run: 3 days ago
└── Score: 68% ██████░░░░ (target: 70%) ⚠️
    Surviving mutants: 24

ACTION REQUIRED:
- REQ-LIV-009: "Choix point relais" non couvert
- REQ-CONF-004: "Email récapitulatif" partiellement couvert
- 24 mutants survivants dans CartCalculator.js
```

---

## 2.6 Testing Quadrants

### Niveau 1 - Vulgarisation

Les **Testing Quadrants** (ou Agile Testing Quadrants) sont un modèle qui organise les différents types de tests en 4 catégories selon deux axes :

- **Axe horizontal** : Tests orientés "Business" (compréhensibles par le métier) vs "Technology" (techniques)
- **Axe vertical** : Tests qui "supportent l'équipe" (guident le développement) vs "critiquent le produit" (évaluent après)

**Analogie** : C'est comme organiser les outils d'un artisan en 4 boîtes : outils de mesure précis, outils de création, outils de finition, outils de vérification qualité.

**Pourquoi c'est important** : Les quadrants aident à s'assurer qu'on n'oublie aucun type de test et à équilibrer les efforts.

### Niveau 2 - Approfondissement Expert

#### Origine et évolution

- **2003** : Brian Marick crée la matrice originale "Agile Testing Matrix"
- **2009** : Lisa Crispin et Janet Gregory popularisent et étendent le concept dans "Agile Testing: A Practical Guide for Testers and Agile Teams"
- **2014** : "More Agile Testing" affine le modèle
- **2024** : Le modèle reste une référence, intégré au "Holistic Testing Model" de Crispin & Gregory

#### Les 4 Quadrants détaillés

```
                        Business-Facing
                              │
     ┌────────────────────────┼────────────────────────┐
     │         Q2             │          Q3            │
     │    Functional Tests    │   Exploratory Testing  │
     │    Story Tests         │   Usability Testing    │
     │    Prototypes          │   UAT                  │
     │    Simulations         │   Alpha/Beta Testing   │
     │                        │                        │
     │    [AUTOMATED]         │   [MANUAL]             │
     │                        │                        │
Support──────────────────────────────────────────────────Critique
Team   │         Q1             │          Q4            │Product
     │    Unit Tests          │   Performance Testing  │
     │    Component Tests     │   Load Testing         │
     │    Integration Tests   │   Security Testing     │
     │                        │   "-ility" Testing     │
     │                        │                        │
     │    [AUTOMATED]         │   [TOOLS]              │
     │                        │                        │
     └────────────────────────┼────────────────────────┘
                              │
                        Technology-Facing
```

#### Quadrant Q1 : Technology-Facing / Supporting the Team

**Objectif** : Guider le développement, feedback rapide aux développeurs

| Type de test | Description | Automatisation |
|--------------|-------------|----------------|
| Unit Tests | Test d'une fonction/méthode isolée | Fortement automatisé |
| Component Tests | Test d'un composant/module | Automatisé |
| Integration Tests | Test des interactions entre composants | Automatisé |

**Caractéristiques** :
- Écrits par les développeurs
- Exécutés fréquemment (à chaque commit)
- Rapides (< quelques secondes)
- Base de la pyramide d'automatisation

#### Quadrant Q2 : Business-Facing / Supporting the Team

**Objectif** : Vérifier que le produit répond aux besoins métier, définir le comportement attendu

| Type de test | Description | Automatisation |
|--------------|-------------|----------------|
| Functional Tests | Scénarios fonctionnels complets | Automatisable (E2E) |
| Story Tests | Tests dérivés des User Stories | Automatisable |
| Prototypes | Validation précoce des concepts | Manuel |
| Simulations | Maquettes interactives | Manuel |
| Examples (BDD) | Spécifications par l'exemple | Automatisable |

**Caractéristiques** :
- Collaboration dev/QA/PO
- Langage métier (Gherkin, etc.)
- Définissent les critères d'acceptation
- Servent de documentation vivante

#### Quadrant Q3 : Business-Facing / Critique Product

**Objectif** : Évaluer le produit du point de vue utilisateur, trouver ce qui manque

| Type de test | Description | Automatisation |
|--------------|-------------|----------------|
| Exploratory Testing | Exploration créative du produit | Manuel (cerveau humain) |
| Usability Testing | Évaluation de l'expérience utilisateur | Manuel |
| UAT | Validation par les parties prenantes | Manuel |
| Alpha/Beta Testing | Tests par utilisateurs réels | Manuel |
| User Scenarios | Parcours utilisateurs réalistes | Partiellement auto |

**Caractéristiques** :
- Principalement manuel (intelligence humaine requise)
- Découverte de problèmes non anticipés
- Feedback qualitatif
- Réalisé tard dans le cycle (produit fonctionnel requis)

#### Quadrant Q4 : Technology-Facing / Critique Product

**Objectif** : Évaluer les attributs non-fonctionnels (les "-ilities")

| Type de test | Description | Automatisation |
|--------------|-------------|----------------|
| Performance Testing | Temps de réponse, throughput | Outils spécialisés |
| Load Testing | Comportement sous charge | Outils spécialisés |
| Stress Testing | Limites du système | Outils spécialisés |
| Security Testing | Vulnérabilités | Outils + expertise |
| Reliability Testing | Stabilité dans le temps | Automatisé |
| Scalability Testing | Capacité de montée en charge | Outils + infra |

**Caractéristiques** :
- Outils spécialisés requis
- Expertise technique nécessaire
- Souvent réalisé périodiquement (pas à chaque sprint)
- Résultats objectifs et mesurables

#### Utilisation stratégique des quadrants

**Répartition effort typique** (indicatif, varie selon contexte) :

| Quadrant | % Effort | Fréquence |
|----------|----------|-----------|
| Q1 | 40-50% | Continue (CI) |
| Q2 | 20-30% | Chaque story/feature |
| Q3 | 10-20% | Chaque sprint/release |
| Q4 | 10-20% | Périodique (mensuel, pre-release) |

#### Critiques et limites du modèle

1. **Frontières floues** : Certains tests chevauchent plusieurs quadrants
2. **Interprétations variables** : Différents auteurs placent différemment certains tests
3. **Pas prescriptif** : Ne dit pas QUAND ni COMBIEN tester
4. **Contexte-dépendant** : Un MVP n'a pas besoin de la même couverture qu'un produit mature

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Planning de sprint** : S'assurer qu'on couvre tous les quadrants
- **Audit de maturité** : Identifier les quadrants négligés
- **Communication** : Expliquer la stratégie de test aux stakeholders
- **Équilibrage équipe** : Répartir les compétences sur les 4 quadrants

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Q1 seulement | Pas de validation métier ni NFR | Équilibrer les 4 quadrants |
| Q3 négligé | Pas d'exploratory testing | Allouer temps d'exploration |
| Q4 en dernier | Perf/Security découvertes trop tard | Shift-left Q4 |
| Quadrants en silos | QA fait Q2-Q3, Dev fait Q1 | Cross-fonctionnel |

#### Exemple concret : Mapping des tests d'un sprint e-commerce

**Sprint Goal** : "Permettre le paiement en 3x sans frais via Alma"

| Quadrant | Tests planifiés |
|----------|-----------------|
| **Q1** | Unit tests: AlmaPaymentService, InstallmentCalculator |
| **Q1** | Integration test: Alma API mock |
| **Q2** | E2E: Parcours paiement 3x complet |
| **Q2** | Story tests: Éligibilité 3x (montant min/max, pays) |
| **Q3** | Exploratory: Edge cases, interruptions, erreurs |
| **Q3** | UAT: Validation par équipe finance |
| **Q4** | Performance: Impact sur le checkout time |
| **Q4** | Security: Données bancaires, webhook signature |

---

## 2.7 Exploratory Testing

### Niveau 1 - Vulgarisation

**Exploratory Testing** est une approche de test où le testeur **apprend, conçoit et exécute simultanément**, sans script prédéfini. C'est comme explorer une ville inconnue sans GPS : on découvre, on s'adapte, on suit son intuition.

**Analogie** : Un script de test, c'est suivre un guide touristique mot à mot. L'exploratory testing, c'est flâner librement en restant attentif aux détails intéressants.

**Pourquoi c'est important** : Les tests scriptés ne trouvent que ce qu'on a prévu de chercher. L'exploration trouve l'inattendu.

### Niveau 2 - Approfondissement Expert

#### Définition (Cem Kaner, 1983)

> "Exploratory testing is a style of software testing that emphasizes the personal freedom and responsibility of the individual tester to continually optimize the quality of their work by treating test-related learning, test design, test execution, and test result interpretation as mutually supportive activities that run in parallel throughout the project."

**Traduction simplifiée** : Apprendre, concevoir et exécuter des tests en parallèle, de façon continue et adaptative.

#### Origine et figures clés

- **1983** : Cem Kaner utilise le terme pour la première fois
- **1990s** : James Bach développe "Session-Based Test Management" (SBTM)
- **2001** : Bach et Kaner formalisent l'approche dans "Lessons Learned in Software Testing"
- **2000s-2010s** : Intégration dans l'Agile, reconnaissance par ISTQB
- **2020s** : Reste essentiel malgré l'automatisation croissante

#### Exploratory Testing ≠ Ad-hoc Testing

| Aspect | Exploratory Testing | Ad-hoc Testing |
|--------|---------------------|----------------|
| Structure | Structuré (charters, sessions) | Non structuré |
| Documentation | Notes, rapports de session | Aucune ou minimale |
| Objectif | Clair (charter) | Vague ou inexistant |
| Apprentissage | Intentionnel | Accidentel |
| Reproductibilité | Session documentée | Difficile |

#### Session-Based Test Management (SBTM)

**Structure d'une session** :
- **Charter** : Mission de la session (quoi explorer, pourquoi)
- **Time-box** : Durée fixe (60-120 minutes typiquement)
- **Session Notes** : Log continu des découvertes
- **Debriefing** : Résumé post-session

**Format de Charter** :
```
Explore [cible]
With [ressources/outils]
To discover [information recherchée]
```

**Exemple** :
```
Explore le tunnel de paiement
With un compte client existant et différents moyens de paiement
To discover des problèmes d'UX et des edge cases non couverts
```

#### Métriques SBTM

- **Session Duration** : Temps réel de la session
- **Charter vs Opportunity** : % temps sur le charter vs exploration opportuniste
- **Bug Clusters** : Zones où les bugs se concentrent
- **Test Coverage** : Fonctionnalités explorées
- **Issues Found** : Bugs, questions, risques identifiés

#### Heuristiques d'exploration

**SFDPOT** (San Francisco Depot) - James Bach :
- **S**tructure : Qu'est-ce qui compose le produit ?
- **F**unction : Que fait le produit ?
- **D**ata : Quelles données le produit traite-t-il ?
- **P**latform : Sur quoi tourne le produit ?
- **O**perations : Comment le produit sera-t-il utilisé ?
- **T**ime : Comment le produit se comporte-t-il dans le temps ?

**Autres heuristiques** :
- **CRUSSPIC STMPL** : Capability, Reliability, Usability, Security, Scalability, Performance, Installability, Compatibility, Supportability, Testability, Maintainability, Portability, Localizability
- **Boundaries** : Tester aux limites (min, max, 0, négatif, null)
- **RCRCRC** : Recent, Core, Risky, Configuration, Repaired, Chronic

#### Compétences du testeur explorateur

1. **Curiosité** : Questionner tout, rien n'est évident
2. **Observation** : Remarquer les détails anormaux
3. **Modélisation** : Construire une carte mentale du système
4. **Critique** : Challenger les hypothèses
5. **Communication** : Documenter clairement les découvertes
6. **Connaissance domaine** : Comprendre le métier testé

#### Place dans la stratégie de test moderne

L'exploratory testing est **complémentaire** de l'automatisation :
- Automatisation : Vérifie ce qu'on sait (régression, validation)
- Exploration : Découvre ce qu'on ne sait pas (nouveaux bugs, usability issues)

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Nouvelles fonctionnalités** : Avant l'automatisation
- **Domaine complexe** : Règles métier nombreuses
- **Après bugs critiques** : Explorer la zone suspecte
- **Pre-release** : Validation humaine finale
- **MVP** : Feedback rapide, peu de specs

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| "On explore quand on a le temps" | Jamais fait | Time-box dédié |
| Exploration sans notes | Pas reproductible | Session notes obligatoires |
| Même testeur, même zone | Œillères | Rotation, pair testing |
| Confondre avec ad-hoc | Pas de structure | Charters et debriefs |

#### Exemple concret : Session Report e-commerce

```
═══════════════════════════════════════════════════════════
            SESSION DE TEST EXPLORATOIRE
═══════════════════════════════════════════════════════════

Date: 2025-01-15
Testeur: Marie D.
Durée planifiée: 90 min
Durée réelle: 105 min

CHARTER:
Explore le processus de retour produit
With un compte client ayant des commandes récentes (< 30j)
To discover des problèmes d'UX et des cas limites

───────────────────────────────────────────────────────────
NOTES DE SESSION
───────────────────────────────────────────────────────────

[00:00] Connexion compte test, 3 commandes récentes OK
[00:05] Parcours standard retour : RAS, fluide
[00:15] Test retour partiel (2 articles sur 3) : OK
[00:25] BUG #1 : Si je sélectionne "Autre" comme motif,
        le champ texte n'est pas obligatoire mais le message
        d'erreur dit "Veuillez préciser" sans indiquer où
        → Screenshot bug-return-motif.png

[00:35] Test retour produit personnalisé : Message OK
        "Ce produit ne peut être retourné", mais bouton
        "Demander retour" reste cliquable (disabled visuellement
        mais pas fonctionnellement)
        → BUG #2 : Accessibility issue + confusing UX

[00:50] Test retour après 28 jours (limite = 30j) : OK
[00:55] Test retour après 31 jours : Refusé OK
[01:00] Opportunity: je remarque que l'email de confirmation
        retour n'a pas le numéro de suivi Colissimo
        → SUGGESTION #1 : Ajouter tracking number à l'email

[01:15] Test 2 retours simultanés sur même commande : OK
[01:30] Test retour avec carte cadeau comme remboursement :
        Long loading (8+ secondes), succès final
        → PERFORMANCE #1 : Slow response gift card refund

[01:45] Debriefing

───────────────────────────────────────────────────────────
RÉSUMÉ
───────────────────────────────────────────────────────────

Bugs trouvés: 2 (1 UX, 1 A11y)
Suggestions: 1
Performance issues: 1
Questions ouvertes: 0

Coverage:
- Retour standard ✅
- Retour partiel ✅
- Retour refusé (délai) ✅
- Retour produit exclu ✅
- Retours multiples ✅
- Modes remboursement (CB, carte cadeau) ✅

Non exploré (pour prochaine session):
- Retour en point relais (vs domicile)
- Retour avec promo appliquée
- Retour cross-border

═══════════════════════════════════════════════════════════
```

---

# Section 3 : Tests Fonctionnels

---

## 3.1 Unit Testing

### Niveau 1 - Vulgarisation

Un **test unitaire** vérifie le bon fonctionnement d'une **petite partie isolée du code**, généralement une fonction ou une méthode. C'est comme tester chaque ingrédient séparément avant de préparer un plat.

**Analogie** : Avant de construire une maison, on teste individuellement chaque brique, chaque vis, chaque planche. Si une brique est défectueuse, on le sait immédiatement sans avoir à démolir le mur.

**Pourquoi c'est important** : Les tests unitaires sont les plus rapides, les moins chers, et permettent de détecter les bugs au plus tôt (Shift-Left). Ils constituent la base de la pyramide des tests.

### Niveau 2 - Approfondissement Expert

#### Définition technique (ISTQB)

> "Component testing (also known as unit testing): Testing of individual hardware or software components."

**Caractéristiques clés** :
- Isolé : Teste une unité sans ses dépendances réelles
- Rapide : Millisecondes d'exécution
- Déterministe : Même input → même output
- Automatisé : Intégré au CI/CD
- Écrit par les développeurs : Proche du code

#### Structure d'un test unitaire : AAA Pattern

```
ARRANGE  → Préparer les données et conditions initiales
ACT      → Exécuter l'action à tester
ASSERT   → Vérifier le résultat
```

**Exemple JavaScript (Jest)** :
```javascript
describe('CartService', () => {
  test('should calculate total with tax', () => {
    // Arrange
    const cart = new CartService();
    cart.addItem({ price: 100, quantity: 2 });

    // Act
    const total = cart.getTotalWithTax(0.20); // 20% TVA

    // Assert
    expect(total).toBe(240); // 200 + 40 TVA
  });
});
```

#### Frameworks par langage

| Langage | Frameworks populaires | Notes |
|---------|----------------------|-------|
| JavaScript/TypeScript | Jest, Vitest, Mocha | Jest = standard React |
| Python | pytest, unittest | pytest = préféré |
| Java | JUnit 5, TestNG | JUnit = standard |
| C# | NUnit, xUnit, MSTest | xUnit = moderne |
| PHP | PHPUnit, Pest | Pest = moderne, élégant |
| Go | testing (built-in), testify | testing = standard |
| Ruby | RSpec, Minitest | RSpec = BDD style |
| Rust | built-in (#[test]) | Intégré au langage |

#### Isolation : Mocking, Stubbing, Faking

| Technique | Description | Cas d'usage |
|-----------|-------------|-------------|
| **Mock** | Objet qui vérifie les interactions (appels, paramètres) | Vérifier qu'une méthode a été appelée |
| **Stub** | Objet qui retourne des réponses prédéfinies | Simuler une réponse d'API |
| **Fake** | Implémentation simplifiée fonctionnelle | Base de données en mémoire |
| **Spy** | Objet réel avec suivi des appels | Observer sans modifier |

**Exemple avec Mock (Jest)** :
```javascript
test('should call payment gateway', async () => {
  // Mock du service externe
  const mockGateway = {
    processPayment: jest.fn().mockResolvedValue({ success: true })
  };

  const orderService = new OrderService(mockGateway);
  await orderService.checkout(order);

  // Vérifie que le mock a été appelé avec les bons params
  expect(mockGateway.processPayment).toHaveBeenCalledWith(
    expect.objectContaining({ amount: 100 })
  );
});
```

#### Code Coverage Metrics (rappel)

| Métrique | Description | Seuil recommandé |
|----------|-------------|------------------|
| Line Coverage | Lignes exécutées | 80% minimum |
| Branch Coverage | Branches testées | 70% minimum |
| Function Coverage | Fonctions appelées | 90% minimum |

#### Principes FIRST pour bons tests unitaires

- **F**ast : Rapide (ms, pas secondes)
- **I**ndependent : Pas de dépendance entre tests
- **R**epeatable : Même résultat à chaque exécution
- **S**elf-validating : Pass/Fail automatique
- **T**imely : Écrits au bon moment (idéalement avant le code - TDD)

#### Test-Driven Development (TDD)

**Cycle Red-Green-Refactor** :
1. **RED** : Écrire un test qui échoue
2. **GREEN** : Écrire le code minimal pour passer le test
3. **REFACTOR** : Améliorer le code en gardant les tests verts

**Avantages** : Design émergent, coverage naturellement élevé, documentation vivante

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Logique métier pure** : Calculs, validations, transformations
- **Fonctions utilitaires** : Helpers, formatters
- **Algorithmes** : Sorting, filtering, parsing
- **Edge cases** : Valeurs limites, cas d'erreur

#### Ce qu'il ne faut PAS tester unitairement

- Appels réseau réels (utiliser mocks)
- Base de données réelle (utiliser fakes)
- UI (tests d'intégration ou E2E)
- Code trivial (getters/setters simples)

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Tests trop couplés au code | Fragiles, cassent au refactoring | Tester le comportement, pas l'implémentation |
| Tests sans assertion | Faux positifs | Toujours une assertion significative |
| Mocks excessifs | Tests ne testent plus rien de réel | Limiter les mocks aux frontières |
| Tests non maintenus | Commentés ou ignorés | Traiter comme code de production |
| Nommage flou | Impossible de comprendre l'intent | Noms descriptifs : `should_return_error_when_email_invalid` |

#### Exemple concret : Tests unitaires pour calcul panier e-commerce

```javascript
// CartCalculator.test.js
describe('CartCalculator', () => {
  let calculator;

  beforeEach(() => {
    calculator = new CartCalculator();
  });

  describe('calculateSubtotal', () => {
    test('should return 0 for empty cart', () => {
      expect(calculator.calculateSubtotal([])).toBe(0);
    });

    test('should sum prices × quantities', () => {
      const items = [
        { price: 10, quantity: 2 },
        { price: 25, quantity: 1 }
      ];
      expect(calculator.calculateSubtotal(items)).toBe(45);
    });

    test('should handle decimal prices', () => {
      const items = [{ price: 19.99, quantity: 3 }];
      expect(calculator.calculateSubtotal(items)).toBeCloseTo(59.97, 2);
    });
  });

  describe('applyDiscount', () => {
    test('should apply percentage discount', () => {
      const result = calculator.applyDiscount(100, { type: 'percent', value: 10 });
      expect(result).toBe(90);
    });

    test('should apply fixed discount', () => {
      const result = calculator.applyDiscount(100, { type: 'fixed', value: 15 });
      expect(result).toBe(85);
    });

    test('should not go below zero', () => {
      const result = calculator.applyDiscount(10, { type: 'fixed', value: 50 });
      expect(result).toBe(0);
    });

    test('should throw for unknown discount type', () => {
      expect(() => {
        calculator.applyDiscount(100, { type: 'unknown', value: 10 });
      }).toThrow('Unknown discount type');
    });
  });

  describe('calculateShipping', () => {
    test('should be free above threshold', () => {
      const result = calculator.calculateShipping(100, { freeAbove: 50 });
      expect(result).toBe(0);
    });

    test('should apply flat rate below threshold', () => {
      const result = calculator.calculateShipping(30, { freeAbove: 50, flatRate: 5.99 });
      expect(result).toBe(5.99);
    });
  });
});
```

---

## 3.2 Integration Testing

### Niveau 1 - Vulgarisation

Les **tests d'intégration** vérifient que **plusieurs composants fonctionnent correctement ensemble**. Si les tests unitaires vérifient chaque ingrédient, les tests d'intégration vérifient que les ingrédients se combinent bien dans la recette.

**Analogie** : Vous avez testé le moteur et les roues séparément. Le test d'intégration vérifie que le moteur fait bien tourner les roues quand on appuie sur l'accélérateur.

**Pourquoi c'est important** : Des composants qui fonctionnent parfaitement individuellement peuvent échouer ensemble (interfaces incompatibles, timing, état partagé).

### Niveau 2 - Approfondissement Expert

#### Définition technique (ISTQB)

> "Integration testing: Testing performed to expose defects in the interfaces and in the interactions between integrated components or systems."

#### Stratégies d'intégration

| Stratégie | Description | Avantages | Inconvénients |
|-----------|-------------|-----------|---------------|
| **Big Bang** | Intégrer tout en une fois | Simple si peu de composants | Debugging difficile |
| **Top-Down** | Commencer par les modules de haut niveau | Test précoce des flux principaux | Besoin de stubs pour modules bas |
| **Bottom-Up** | Commencer par les modules de bas niveau | Pas de stubs nécessaires | Flux principaux testés tard |
| **Sandwich** | Combinaison top-down et bottom-up | Équilibré | Plus complexe à orchestrer |
| **Incremental** | Ajouter un composant à la fois | Isolation des problèmes | Plus de cycles de test |

#### Niveaux d'intégration

```
┌─────────────────────────────────────────────────────────┐
│         INTEGRATION TESTS                               │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │  Component Integration                           │   │
│  │  (Module A + Module B dans même service)         │   │
│  └─────────────────────────────────────────────────┘   │
│                       ↓                                 │
│  ┌─────────────────────────────────────────────────┐   │
│  │  Service Integration                             │   │
│  │  (Service A → API → Service B)                   │   │
│  └─────────────────────────────────────────────────┘   │
│                       ↓                                 │
│  ┌─────────────────────────────────────────────────┐   │
│  │  System Integration                              │   │
│  │  (App + DB + Cache + External APIs)              │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

#### Contract Testing

Technique moderne pour l'intégration de microservices.

**Principe** : Le consommateur d'une API définit un "contrat" (ce qu'il attend), le fournisseur s'engage à le respecter.

**Outils** :
- **Pact** : Standard de facto pour contract testing
- **Spring Cloud Contract** : Écosystème Spring

**Avantage** : Pas besoin de déployer tous les services ensemble pour tester l'intégration.

#### Test Doubles pour l'intégration

| Situation | Solution |
|-----------|----------|
| Service externe (paiement, email) | Mock server (WireMock, MSW) |
| Base de données | Test containers (Docker) |
| Message queue | Embedded broker ou mock |
| Cache | In-memory (embedded Redis) |

#### Outils populaires

| Catégorie | Outils |
|-----------|--------|
| Mock Servers | WireMock, MockServer, MSW (Mock Service Worker) |
| Test Containers | Testcontainers (Java, Node, .NET, Go) |
| API Testing | Postman, REST Assured, Supertest |
| Contract Testing | Pact, Spring Cloud Contract |

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Points d'intégration** : API calls, DB queries, file I/O
- **Workflows multi-composants** : Commande → Paiement → Stock
- **Changements d'interface** : Nouvelle version d'API

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Tester trop de composants | Lent, fragile | Limiter le scope |
| Dépendance à l'environnement | Non reproductible | Containers, mocks |
| Données de test partagées | Tests s'influencent | Isolation des données |
| Tests d'intégration comme unitaires | Confusion | Séparer clairement |

#### Exemple concret : Test d'intégration API + DB pour e-commerce

```javascript
// order.integration.test.js
const request = require('supertest');
const { setupTestDb, teardownTestDb, seedProducts } = require('./testUtils');
const app = require('../app');

describe('Order API Integration', () => {
  beforeAll(async () => {
    await setupTestDb();
    await seedProducts([
      { id: 'PROD-001', name: 'Widget', price: 29.99, stock: 100 }
    ]);
  });

  afterAll(async () => {
    await teardownTestDb();
  });

  describe('POST /api/orders', () => {
    test('should create order and decrement stock', async () => {
      const orderData = {
        customerId: 'CUST-001',
        items: [{ productId: 'PROD-001', quantity: 2 }]
      };

      // Act
      const response = await request(app)
        .post('/api/orders')
        .send(orderData)
        .expect(201);

      // Assert - Order created
      expect(response.body).toMatchObject({
        id: expect.stringMatching(/^ORD-/),
        status: 'pending',
        total: 59.98
      });

      // Assert - Stock decremented (vérifie l'intégration DB)
      const stockResponse = await request(app)
        .get('/api/products/PROD-001')
        .expect(200);

      expect(stockResponse.body.stock).toBe(98);
    });

    test('should reject order if insufficient stock', async () => {
      const orderData = {
        customerId: 'CUST-001',
        items: [{ productId: 'PROD-001', quantity: 9999 }]
      };

      const response = await request(app)
        .post('/api/orders')
        .send(orderData)
        .expect(400);

      expect(response.body.error).toContain('Insufficient stock');
    });
  });
});
```

---

## 3.3 End-to-End Testing (E2E)

### Niveau 1 - Vulgarisation

Les **tests End-to-End (E2E)** vérifient un **parcours utilisateur complet**, du début à la fin, comme le ferait un vrai utilisateur. C'est le test le plus proche de la réalité.

**Analogie** : Au lieu de tester les ingrédients ou la cuisson, vous faites goûter le plat complet à quelqu'un et observez sa réaction du premier regard jusqu'à la dernière bouchée.

**Pourquoi c'est important** : Les tests unitaires et d'intégration peuvent tous passer, mais le parcours utilisateur complet peut échouer (problème de configuration, timing, UI).

### Niveau 2 - Approfondissement Expert

#### Définition technique

> "End-to-end testing is a methodology that validates the entire software application from start to finish, including all integrated components, interfaces, and external dependencies."

#### Position dans la pyramide des tests

```
        △
       /  \          E2E Tests (peu, lents, chers)
      /────\
     /      \        Integration Tests (quelques-uns)
    /────────\
   /          \      Unit Tests (beaucoup, rapides)
  /────────────\
```

**Proportion recommandée** (indicative) :
- Unit : 70%
- Integration : 20%
- E2E : 10%

#### Frameworks E2E populaires (2024-2025)

| Framework | Langage | Points forts | Points faibles |
|-----------|---------|--------------|----------------|
| **Playwright** | JS/TS, Python, .NET, Java | Multi-browser, rapide, moderne | Relativement nouveau |
| **Cypress** | JavaScript | DX excellente, debugging visuel | Chrome-centric historiquement |
| **Selenium** | Multi-langages | Standard historique, large communauté | Plus lent, moins moderne |
| **WebdriverIO** | JavaScript | Flexible, protocoles multiples | Courbe d'apprentissage |
| **Puppeteer** | JavaScript | Control fin de Chrome | Chrome uniquement |

**Tendance 2024-2025** : Playwright a pris le leadership grâce à sa rapidité et son support multi-navigateur natif.

#### Anatomie d'un test E2E

```javascript
// checkout.e2e.spec.js (Playwright)
test.describe('Checkout Flow', () => {
  test('should complete purchase as guest user', async ({ page }) => {
    // Navigation
    await page.goto('/products/widget-pro');

    // Add to cart
    await page.click('[data-testid="add-to-cart"]');
    await page.waitForSelector('[data-testid="cart-count"]');
    expect(await page.textContent('[data-testid="cart-count"]')).toBe('1');

    // Go to cart
    await page.click('[data-testid="cart-icon"]');
    await expect(page).toHaveURL('/cart');

    // Proceed to checkout
    await page.click('[data-testid="checkout-button"]');

    // Fill shipping info
    await page.fill('[name="email"]', 'test@example.com');
    await page.fill('[name="firstName"]', 'John');
    await page.fill('[name="lastName"]', 'Doe');
    await page.fill('[name="address"]', '123 Test Street');
    await page.fill('[name="city"]', 'Paris');
    await page.fill('[name="postalCode"]', '75001');

    // Select shipping method
    await page.click('[data-testid="shipping-standard"]');

    // Fill payment (sandbox)
    await page.fill('[name="cardNumber"]', '4242424242424242');
    await page.fill('[name="expiry"]', '12/28');
    await page.fill('[name="cvc"]', '123');

    // Place order
    await page.click('[data-testid="place-order"]');

    // Verify success
    await expect(page).toHaveURL(/\/order-confirmation/);
    await expect(page.locator('[data-testid="order-number"]')).toBeVisible();
  });
});
```

#### Stratégies pour E2E fiables

1. **Data-testid attributes** : Ne pas dépendre des classes CSS ou du texte
2. **Waits explicites** : Attendre les éléments, pas des délais fixes
3. **Isolation des données** : Chaque test crée ses propres données
4. **Retry mechanism** : Réessayer automatiquement les tests flaky
5. **Parallélisation** : Exécuter plusieurs tests simultanément
6. **Visual comparison** : Capturer des screenshots pour régression visuelle

#### Coût et maintenance des E2E

| Aspect | Réalité |
|--------|---------|
| Temps d'écriture | 5-10x plus long qu'un test unitaire |
| Temps d'exécution | Secondes à minutes par test |
| Flakiness | Plus fréquent (réseau, timing, UI) |
| Maintenance | Coûteuse si UI change souvent |
| Debugging | Plus difficile (beaucoup de couches) |

**ROI** : Prioriser les parcours critiques business (checkout, login, core features).

### Niveau 3 - Application Pratique

#### Contexte d'utilisation optimal

- **Parcours critiques** : Checkout, inscription, fonctions génératrices de revenus
- **Smoke tests** : Vérification rapide post-déploiement
- **Regression majeure** : Après refactoring important
- **Validation cross-browser** : Vérifier sur différents navigateurs

#### Ce qu'il ne faut PAS tester en E2E

- Tous les edge cases (→ tests unitaires)
- Tous les messages d'erreur (→ tests unitaires)
- Performance (→ tests de charge dédiés)
- Chaque combinaison possible (explosion combinatoire)

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Trop de tests E2E | Lent, fragile, coûteux | Limiter aux parcours critiques |
| `sleep(5000)` | Fragile, lent | Waits intelligents |
| Sélecteurs CSS fragiles | Cassent au redesign | data-testid |
| Tests interdépendants | Un échec cascade | Tests indépendants |
| Ignorer les flaky tests | Faux sentiment de sécurité | Fix ou remove |

#### Exemple concret : Suite E2E pour e-commerce (Playwright)

```javascript
// e2e/critical-paths.spec.js

import { test, expect } from '@playwright/test';

test.describe('Critical E-commerce Paths', () => {

  test.describe('Guest Checkout', () => {
    test('complete purchase with credit card', async ({ page }) => {
      // ... (voir exemple ci-dessus)
    });

    test('complete purchase with PayPal', async ({ page }) => {
      // Parcours PayPal sandbox
    });
  });

  test.describe('Registered User', () => {
    test.beforeEach(async ({ page }) => {
      // Login une seule fois
      await page.goto('/login');
      await page.fill('[name="email"]', 'test@example.com');
      await page.fill('[name="password"]', 'testpassword');
      await page.click('[type="submit"]');
      await expect(page).toHaveURL('/account');
    });

    test('reorder from order history', async ({ page }) => {
      await page.goto('/account/orders');
      await page.click('[data-testid="reorder-btn"]');
      await expect(page).toHaveURL('/cart');
      await expect(page.locator('[data-testid="cart-item"]')).toHaveCount(2);
    });

    test('save address for future orders', async ({ page }) => {
      // ...
    });
  });

  test.describe('Search & Browse', () => {
    test('search product and filter results', async ({ page }) => {
      await page.goto('/');
      await page.fill('[data-testid="search-input"]', 'chaussures');
      await page.press('[data-testid="search-input"]', 'Enter');

      await expect(page.locator('[data-testid="product-card"]')).toHaveCount.greaterThan(0);

      // Filter by price
      await page.click('[data-testid="filter-price-50-100"]');
      await expect(page.locator('[data-testid="active-filter"]')).toContainText('50€ - 100€');
    });
  });
});
```

---

## 3.4 System Testing

### Niveau 1 - Vulgarisation

Le **System Testing** teste le **système complet** comme un tout, en conditions proches de la production. C'est la vérification finale avant de livrer.

**Analogie** : Après avoir assemblé tous les composants d'une voiture, on la teste sur piste dans des conditions réelles (routes, météo) avant de la vendre.

**Pourquoi c'est important** : Valider que tous les composants intégrés forment un système fonctionnel qui répond aux spécifications initiales.

### Niveau 2 - Approfondissement Expert

#### Définition technique (ISTQB)

> "System testing: Testing an integrated system to verify that it meets specified requirements."

#### Différence avec les autres niveaux

| Niveau | Scope | Environnement | Responsable |
|--------|-------|---------------|-------------|
| Unit | Fonction/Classe | Dev local | Développeur |
| Integration | Composants combinés | Test/Dev | Dev/QA |
| System | Système complet | Proche prod | QA |
| Acceptance | Système + processus métier | Prod-like | Business/Users |

#### Types de tests système

1. **Functional System Testing** : Vérifier les fonctionnalités
2. **Non-Functional System Testing** : Performance, sécurité, etc.
3. **Regression System Testing** : Pas de régression après changements
4. **Recovery Testing** : Comportement après crash/failure
5. **Installation Testing** : Processus d'installation/mise à jour

#### Environnement de System Testing

**Caractéristiques** :
- Configuration similaire à la production
- Données représentatives (anonymisées si nécessaire)
- Intégrations réelles (ou mocks réalistes)
- Isolation des autres environnements

### Niveau 3 - Application Pratique

#### Contexte e-commerce

**Checklist System Testing** :
- [ ] Parcours complet guest + registered
- [ ] Tous les moyens de paiement
- [ ] Gestion du stock (réservation, libération)
- [ ] Emails transactionnels
- [ ] Intégration logistique (carrier APIs)
- [ ] Back-office : gestion commandes
- [ ] Multi-device (desktop, mobile, tablet)
- [ ] Multi-browser

---

## 3.5 Regression Testing

### Niveau 1 - Vulgarisation

Les **tests de régression** vérifient que les **nouvelles modifications n'ont pas cassé ce qui fonctionnait**. C'est comme vérifier que réparer une fuite n'a pas créé une autre fuite ailleurs.

**Analogie** : Après avoir ajouté une extension à votre maison, vous vérifiez que le reste de la maison fonctionne toujours (électricité, plomberie, chauffage).

**Pourquoi c'est important** : Les effets de bord sont fréquents. Un changement innocent peut casser une fonctionnalité distante.

### Niveau 2 - Approfondissement Expert

#### Définition technique (ISTQB)

> "Regression testing: Testing of a previously tested program following modification to ensure that defects have not been introduced or uncovered in unchanged areas of the software."

#### Quand exécuter les tests de régression

| Trigger | Scope de régression |
|---------|---------------------|
| Chaque commit | Tests unitaires (CI) |
| Chaque PR/MR | Unit + Integration |
| Chaque sprint | Full regression |
| Pre-release | Full regression + exploratory |
| Hotfix | Ciblé + smoke test |

#### Stratégies de sélection des tests

1. **Retest All** : Tout exécuter (complet mais lent)
2. **Risk-Based Selection** : Prioriser par risque
3. **Change-Based Selection** : Tests impactés par les changements
4. **Combination** : Analyse d'impact + tests critiques toujours

#### Automation pour la régression

La régression est le **candidat idéal pour l'automatisation** car :
- Tests répétitifs (même chose à chaque release)
- Volume important
- Besoin de rapidité pour feedback CI/CD
- Coût manuel prohibitif à terme

#### Outils d'analyse d'impact

- **Coverage-based** : Quels tests couvrent le code modifié ?
- **Git history** : Quels fichiers/modules changent ensemble ?
- **Dependency analysis** : Quels modules dépendent du code modifié ?

### Niveau 3 - Application Pratique

#### Stratégie de régression pour e-commerce

```
REGRESSION STRATEGY

┌─────────────────────────────────────────────────────────┐
│ CONTINUOUS (chaque commit)                              │
│ - Unit tests (< 5 min)                                  │
│ - Lint + Static analysis                                │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│ PR/MR (avant merge)                                     │
│ - Unit + Integration (< 15 min)                         │
│ - E2E smoke (checkout, login)                           │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│ NIGHTLY (chaque nuit)                                   │
│ - Full E2E suite                                        │
│ - Cross-browser tests                                   │
│ - Visual regression                                     │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│ PRE-RELEASE (avant chaque release)                      │
│ - Full regression all levels                            │
│ - Performance baseline                                  │
│ - Security scan                                         │
│ - Exploratory testing                                   │
└─────────────────────────────────────────────────────────┘
```

---

## 3.6 Smoke Testing vs Sanity Testing

### Niveau 1 - Vulgarisation

**Smoke Testing** et **Sanity Testing** sont deux tests rapides pour vérifier qu'un build mérite des tests plus approfondis.

- **Smoke Test** : "Est-ce que ça démarre ?" (vérification très basique)
- **Sanity Test** : "Est-ce que les changements récents fonctionnent ?" (focus sur le nouveau)

**Analogie** :
- Smoke Test : Tourner la clé de la voiture pour voir si le moteur démarre
- Sanity Test : Après avoir changé les freins, vérifier que les freins fonctionnent

### Niveau 2 - Approfondissement Expert

#### Tableau comparatif

| Aspect | Smoke Testing | Sanity Testing |
|--------|---------------|----------------|
| **Autre nom** | Build Verification Test (BVT) | Surface level testing |
| **Objectif** | Vérifier la stabilité du build | Vérifier la rationalité des changements |
| **Scope** | Large (fonctions critiques) | Étroit (zones modifiées) |
| **Profondeur** | Superficiel | Un peu plus profond |
| **Quand** | Après chaque build | Après bug fixes ou minor changes |
| **Automatisé** | Oui, toujours | Souvent manuel |
| **Durée** | < 30 minutes | < 1 heure |
| **Si échec** | Build rejeté | Investigation ciblée |

#### Origine du terme "Smoke Test"

Vient de l'électronique/plomberie : on met sous tension un circuit ou sous pression un tuyau, et on regarde si de la fumée sort. Si oui, problème fondamental.

#### Exemples de Smoke Tests pour e-commerce

1. La page d'accueil charge
2. La recherche retourne des résultats
3. Une fiche produit s'affiche
4. L'ajout au panier fonctionne
5. Le panier s'affiche
6. La page de login est accessible
7. Une API health check répond 200

### Niveau 3 - Application Pratique

#### Script de Smoke Test automatisé

```javascript
// smoke.spec.js
test.describe('Smoke Tests', () => {
  test('homepage loads', async ({ page }) => {
    const response = await page.goto('/');
    expect(response.status()).toBe(200);
    await expect(page.locator('header')).toBeVisible();
  });

  test('product listing loads', async ({ page }) => {
    await page.goto('/products');
    await expect(page.locator('[data-testid="product-card"]')).toHaveCount.greaterThan(0);
  });

  test('search works', async ({ page }) => {
    await page.goto('/');
    await page.fill('[data-testid="search"]', 'test');
    await page.press('[data-testid="search"]', 'Enter');
    await expect(page).toHaveURL(/search/);
  });

  test('add to cart works', async ({ page }) => {
    await page.goto('/products/sample-product');
    await page.click('[data-testid="add-to-cart"]');
    await expect(page.locator('[data-testid="cart-count"]')).not.toHaveText('0');
  });

  test('login page loads', async ({ page }) => {
    await page.goto('/login');
    await expect(page.locator('form')).toBeVisible();
  });

  test('API health check', async ({ request }) => {
    const response = await request.get('/api/health');
    expect(response.status()).toBe(200);
  });
});
```

---

## 3.7 API Testing

### Niveau 1 - Vulgarisation

Les **tests d'API** vérifient que les **interfaces de programmation** (les "portes d'entrée" pour les données) fonctionnent correctement, sans passer par l'interface utilisateur.

**Analogie** : Au lieu de tester une distributrice en appuyant sur les boutons, vous testez directement le mécanisme interne qui reçoit les commandes et délivre les produits.

**Pourquoi c'est important** : L'API est le contrat entre le frontend et le backend. Si l'API a des bugs, tout ce qui l'utilise sera impacté.

### Niveau 2 - Approfondissement Expert

#### Types de tests API

| Type | Description | Exemple |
|------|-------------|---------|
| **Contract Testing** | Vérifie le format des requêtes/réponses | Schema validation (OpenAPI) |
| **Functional Testing** | Vérifie la logique métier | CRUD operations |
| **Performance Testing** | Vérifie les temps de réponse | Response time < 200ms |
| **Security Testing** | Vérifie les vulnérabilités | Auth bypass, injection |
| **Integration Testing** | Vérifie les dépendances | API → DB → External service |

#### Éléments à tester pour chaque endpoint

```
REQUEST
├── HTTP Method (GET, POST, PUT, DELETE, PATCH)
├── URL / Path parameters
├── Query parameters
├── Headers (Auth, Content-Type, Accept)
├── Request body (JSON, form-data)
└── Edge cases (missing fields, invalid types)

RESPONSE
├── Status code (200, 201, 400, 401, 403, 404, 500)
├── Response body structure
├── Response headers
├── Response time
└── Error messages
```

#### Outils populaires

| Outil | Type | Points forts |
|-------|------|--------------|
| **Postman** | GUI + Scripting | Populaire, collections, collaboration |
| **Insomnia** | GUI | Plus léger que Postman |
| **REST Assured** | Java library | Pour projets Java |
| **Supertest** | Node.js library | Intégré aux tests Jest/Mocha |
| **pytest + requests** | Python | Simple et efficace |
| **k6** | Performance | Tests de charge API |
| **Bruno** | GUI | Open source, Git-friendly |

#### Structure d'un test API (REST Assured - Java)

```java
@Test
public void shouldCreateOrderSuccessfully() {
    given()
        .contentType(ContentType.JSON)
        .header("Authorization", "Bearer " + token)
        .body("""
            {
                "customerId": "CUST-001",
                "items": [{"productId": "PROD-001", "quantity": 2}]
            }
        """)
    .when()
        .post("/api/orders")
    .then()
        .statusCode(201)
        .body("id", matchesPattern("ORD-\\d+"))
        .body("status", equalTo("pending"))
        .body("total", equalTo(59.98f))
        .time(lessThan(2000L)); // < 2 secondes
}
```

### Niveau 3 - Application Pratique

#### Checklist API Testing e-commerce

**Endpoints critiques** :
- [ ] `POST /auth/login` - Authentication
- [ ] `POST /auth/register` - Registration
- [ ] `GET /products` - Product listing
- [ ] `GET /products/:id` - Product detail
- [ ] `POST /cart/items` - Add to cart
- [ ] `PUT /cart/items/:id` - Update quantity
- [ ] `DELETE /cart/items/:id` - Remove from cart
- [ ] `POST /orders` - Create order
- [ ] `POST /payments` - Process payment
- [ ] `GET /orders/:id` - Order status

**Cas de test par endpoint** :
1. Happy path
2. Invalid input (400)
3. Unauthorized (401)
4. Forbidden (403)
5. Not found (404)
6. Server error handling (500)
7. Rate limiting (429)
8. Pagination
9. Filtering/sorting

---

## 3.8 Database Testing

### Niveau 1 - Vulgarisation

Les **tests de base de données** vérifient que les données sont **correctement stockées, récupérées et modifiées**. C'est s'assurer que le "coffre-fort" de votre application fonctionne parfaitement.

**Analogie** : Tester un classeur de documents : les documents sont-ils rangés au bon endroit ? Peut-on les retrouver facilement ? Sont-ils protégés contre les modifications accidentelles ?

**Pourquoi c'est important** : Les données sont le cœur de toute application. Une corruption ou une perte de données peut être catastrophique.

### Niveau 2 - Approfondissement Expert

#### Types de tests de base de données

| Type | Description | Exemple |
|------|-------------|---------|
| **Schema Testing** | Structure des tables, colonnes, types | Colonnes requises présentes |
| **Data Integrity** | Contraintes, clés étrangères | FK violations impossibles |
| **CRUD Operations** | Create, Read, Update, Delete | Insert fonctionne |
| **Transaction Testing** | Atomicité, rollback | Transaction échoue = rollback |
| **Migration Testing** | Scripts de migration | Up/down fonctionnent |
| **Performance** | Index, query time | Query < 100ms |
| **Security** | Accès, injection SQL | Pas de SQL injection |

#### Techniques de test

**1. Direct Database Testing**
```sql
-- Vérifier que la contrainte fonctionne
INSERT INTO orders (customer_id, total) VALUES (NULL, 100);
-- Doit échouer : customer_id NOT NULL
```

**2. Application-Level Testing**
```javascript
test('should enforce unique email constraint', async () => {
  await User.create({ email: 'test@example.com' });

  await expect(
    User.create({ email: 'test@example.com' })
  ).rejects.toThrow(/unique constraint/i);
});
```

**3. Migration Testing**
```javascript
describe('Migration 2024_01_15_add_discount_column', () => {
  test('up: adds discount column', async () => {
    await runMigration('up');
    const columns = await getTableColumns('orders');
    expect(columns).toContain('discount');
  });

  test('down: removes discount column', async () => {
    await runMigration('down');
    const columns = await getTableColumns('orders');
    expect(columns).not.toContain('discount');
  });
});
```

#### Outils et frameworks

| Catégorie | Outils |
|-----------|--------|
| ORM Testing | Jest + Sequelize/TypeORM/Prisma |
| Raw SQL Testing | pgTAP (PostgreSQL), MyTAP (MySQL) |
| Migration Testing | Flyway, Liquibase, Knex |
| Data Generation | Faker.js, Factory Bot |
| Test Containers | Testcontainers (DB éphémères) |

### Niveau 3 - Application Pratique

#### Stratégie pour e-commerce

```
DATABASE TESTING STRATEGY

1. SCHEMA VALIDATION (CI/CD)
   - Tables critiques existent
   - Colonnes required présentes
   - Types de données corrects
   - Index de performance

2. CONSTRAINTS (Unit/Integration)
   - NOT NULL sur champs obligatoires
   - UNIQUE sur email, SKU, order_number
   - FOREIGN KEYS (customer → orders)
   - CHECK constraints (price > 0)

3. TRANSACTIONS (Integration)
   - Order creation = atomique
   - Payment + Stock update = atomique
   - Rollback on failure

4. PERFORMANCE (Periodic)
   - Query explain plans
   - Index effectiveness
   - N+1 query detection

5. MIGRATION (Pre-deploy)
   - Up migration fonctionne
   - Down migration fonctionne
   - Data preservation
```

---

# Section 4 : Tests Non-Fonctionnels

---

## 4.1 Performance Testing

### Niveau 1 - Vulgarisation

Les **tests de performance** vérifient que l'application **répond assez vite** et **supporte suffisamment d'utilisateurs**. C'est comme tester si une route peut supporter le trafic d'heure de pointe sans embouteillage.

**Pourquoi c'est important** : Un site e-commerce qui met 5 secondes à charger perd 50% de ses visiteurs. Pendant le Black Friday, un site qui crashe perd des millions.

### Niveau 2 - Approfondissement Expert

#### Types de tests de performance

| Type | Objectif | Question posée |
|------|----------|----------------|
| **Load Testing** | Comportement sous charge normale/attendue | "Tient-on 1000 utilisateurs simultanés ?" |
| **Stress Testing** | Trouver le point de rupture | "À combien d'utilisateurs on casse ?" |
| **Spike Testing** | Réaction à une montée soudaine | "Que se passe-t-il si le trafic x10 en 1 minute ?" |
| **Endurance/Soak Testing** | Stabilité sur longue durée | "Y a-t-il des memory leaks sur 24h ?" |
| **Scalability Testing** | Capacité à monter en charge | "L'ajout de serveurs améliore-t-il les perfs ?" |
| **Volume Testing** | Comportement avec gros volumes de données | "Que se passe-t-il avec 10M de produits ?" |

#### Métriques clés

| Métrique | Description | Seuil e-commerce typique |
|----------|-------------|--------------------------|
| **Response Time** | Temps de réponse d'une requête | < 200ms API, < 3s page |
| **Throughput** | Requêtes/seconde | Dépend du contexte |
| **Error Rate** | % de requêtes en erreur | < 1% |
| **Concurrent Users** | Utilisateurs simultanés | Variable selon business |
| **TTFB** | Time To First Byte | < 600ms |
| **TPS** | Transactions Per Second | Variable |
| **Apdex** | Application Performance Index | > 0.9 |
| **P95/P99** | 95e/99e percentile response time | Plus représentatif que moyenne |

#### Outils de performance testing

| Outil | Type | Points forts |
|-------|------|--------------|
| **k6** | Load testing | Scripting JS, moderne, dev-friendly |
| **JMeter** | Load testing | Mature, extensible, GUI |
| **Gatling** | Load testing | Scala DSL, rapports élégants |
| **Locust** | Load testing | Python, distribué |
| **Artillery** | Load testing | YAML config, simple |
| **Lighthouse** | Frontend perf | Intégré Chrome, Web Vitals |
| **WebPageTest** | Frontend perf | Tests réels multi-localisation |

#### Core Web Vitals (Google, 2020+)

| Métrique | Description | Bon | À améliorer | Mauvais |
|----------|-------------|-----|-------------|---------|
| **LCP** | Largest Contentful Paint | < 2.5s | 2.5-4s | > 4s |
| **INP** | Interaction to Next Paint | < 200ms | 200-500ms | > 500ms |
| **CLS** | Cumulative Layout Shift | < 0.1 | 0.1-0.25 | > 0.25 |

*Note : INP a remplacé FID (First Input Delay) en mars 2024*

#### Script de Load Test (k6)

```javascript
// load-test.js
import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '2m', target: 100 },  // Ramp-up à 100 users
    { duration: '5m', target: 100 },  // Maintien
    { duration: '2m', target: 200 },  // Montée à 200
    { duration: '5m', target: 200 },  // Maintien
    { duration: '2m', target: 0 },    // Ramp-down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'], // 95% des requêtes < 500ms
    http_req_failed: ['rate<0.01'],   // < 1% d'erreurs
  },
};

export default function () {
  // Scénario : browse → search → product → cart
  const baseUrl = 'https://staging.example.com';

  // Homepage
  let res = http.get(`${baseUrl}/`);
  check(res, { 'homepage status 200': (r) => r.status === 200 });

  sleep(1);

  // Search
  res = http.get(`${baseUrl}/api/products?search=shoes`);
  check(res, {
    'search status 200': (r) => r.status === 200,
    'search has results': (r) => JSON.parse(r.body).length > 0,
  });

  sleep(2);

  // Product detail
  res = http.get(`${baseUrl}/api/products/PROD-001`);
  check(res, { 'product status 200': (r) => r.status === 200 });

  sleep(1);

  // Add to cart
  res = http.post(`${baseUrl}/api/cart/items`, JSON.stringify({
    productId: 'PROD-001',
    quantity: 1
  }), { headers: { 'Content-Type': 'application/json' } });

  check(res, { 'add to cart status 201': (r) => r.status === 201 });

  sleep(3);
}
```

### Niveau 3 - Application Pratique

#### Contexte e-commerce : Préparer Black Friday

**Objectifs typiques** :
- 10x le trafic normal
- Response time < 2s sous charge
- 0 downtime
- Checkout < 30s total

**Plan de test** :
1. **Baseline** : Mesurer performance actuelle
2. **Load Test** : Trafic attendu Black Friday
3. **Stress Test** : +50% au-delà des prévisions
4. **Spike Test** : Simulation flash sale
5. **Soak Test** : 24h à charge élevée (memory leaks)

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Tester en dev | Infra différente de prod | Environnement iso-prod |
| Données vides | Pas réaliste | Dataset représentatif |
| Test ponctuel | Régressions non détectées | Tests réguliers (CI) |
| Ignorer le frontend | Backend OK mais UX lente | Inclure Lighthouse/WebVitals |

---

## 4.2 Security Testing

### Niveau 1 - Vulgarisation

Les **tests de sécurité** vérifient que l'application **protège les données et résiste aux attaques**. C'est comme tester les serrures, alarmes et coffres-forts d'une banque.

**Pourquoi c'est important** : Une faille de sécurité peut entraîner vol de données clients, pertes financières, destruction de réputation, et sanctions légales (RGPD).

### Niveau 2 - Approfondissement Expert

#### OWASP Top 10 (2021)

L'**OWASP Top 10** est la référence mondiale des risques de sécurité web.

| # | Catégorie | Description | Exemple |
|---|-----------|-------------|---------|
| A01 | **Broken Access Control** | Accès non autorisé à des ressources | Accéder aux commandes d'un autre utilisateur |
| A02 | **Cryptographic Failures** | Protection insuffisante des données sensibles | Mots de passe stockés en clair |
| A03 | **Injection** | Données non fiables interprétées comme code | SQL injection, XSS |
| A04 | **Insecure Design** | Failles de conception | Absence de rate limiting |
| A05 | **Security Misconfiguration** | Mauvaise configuration | Headers de sécurité manquants |
| A06 | **Vulnerable Components** | Dépendances avec vulnérabilités connues | Log4Shell |
| A07 | **Identification and Authentication Failures** | Authentification faible | Pas de protection brute-force |
| A08 | **Software and Data Integrity Failures** | Code/données non vérifiés | CI/CD compromise |
| A09 | **Security Logging and Monitoring Failures** | Logs insuffisants | Intrusion non détectée |
| A10 | **Server-Side Request Forgery (SSRF)** | Requêtes serveur manipulées | Accès réseau interne |

*Source : https://owasp.org/Top10/*

#### Types de tests de sécurité

| Type | Description | Quand |
|------|-------------|-------|
| **SAST** | Static Application Security Testing | Pendant développement (CI) |
| **DAST** | Dynamic Application Security Testing | Sur application déployée |
| **IAST** | Interactive AST | Runtime avec instrumentation |
| **SCA** | Software Composition Analysis | Analyse des dépendances |
| **Penetration Testing** | Test d'intrusion manuel | Pre-release, périodique |
| **Security Audit** | Revue complète | Annuel ou après incident |

#### SAST vs DAST

| Aspect | SAST | DAST |
|--------|------|------|
| **Quand** | Code source, avant exécution | Application déployée |
| **Quoi** | Analyse statique du code | Attaques simulées |
| **Avantages** | Détection précoce, couverture code | Trouve vulnérabilités runtime |
| **Limites** | Faux positifs, pas de contexte runtime | Couverture limitée, tardif |
| **Outils** | SonarQube, Semgrep, Snyk Code | OWASP ZAP, Burp Suite, Nuclei |

#### Outils de sécurité

| Catégorie | Outils |
|-----------|--------|
| SAST | SonarQube, Semgrep, CodeQL, Snyk Code |
| DAST | OWASP ZAP, Burp Suite, Nuclei |
| SCA (Dependencies) | Snyk, Dependabot, npm audit, OWASP Dependency-Check |
| Secrets Detection | GitLeaks, TruffleHog, detect-secrets |
| Container Security | Trivy, Clair, Snyk Container |

#### OWASP Web Security Testing Guide (WSTG)

Le **WSTG v4.2** est le guide complet de test de sécurité web (400+ pages).

**Catégories de tests** :
1. Information Gathering
2. Configuration and Deployment Management Testing
3. Identity Management Testing
4. Authentication Testing
5. Authorization Testing
6. Session Management Testing
7. Input Validation Testing
8. Error Handling Testing
9. Cryptography Testing
10. Business Logic Testing
11. Client-Side Testing
12. API Testing

*Source : https://owasp.org/www-project-web-security-testing-guide/*

### Niveau 3 - Application Pratique

#### Checklist sécurité e-commerce

**Authentification**
- [ ] Hashing passwords (bcrypt, Argon2)
- [ ] Protection brute-force (rate limiting, lockout)
- [ ] MFA disponible
- [ ] Session management sécurisé

**Données sensibles**
- [ ] HTTPS everywhere
- [ ] Données cartes jamais stockées (tokenization)
- [ ] PII encrypté au repos
- [ ] Logs sans données sensibles

**Injections**
- [ ] Prepared statements (SQL)
- [ ] Output encoding (XSS)
- [ ] CSP headers
- [ ] CORS configuré

**Infrastructure**
- [ ] Security headers (HSTS, X-Content-Type, X-Frame-Options)
- [ ] Dépendances à jour
- [ ] Scans réguliers

#### Pipeline CI/CD sécurisé

```yaml
# .github/workflows/security.yml
name: Security Checks

on: [push, pull_request]

jobs:
  sast:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run Semgrep
        uses: returntocorp/semgrep-action@v1
        with:
          config: p/owasp-top-ten

  dependency-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run npm audit
        run: npm audit --audit-level=high
      - name: Run Snyk
        uses: snyk/actions/node@master
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

  secrets-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: GitLeaks
        uses: gitleaks/gitleaks-action@v2

  dast:
    runs-on: ubuntu-latest
    needs: [sast, dependency-check]
    steps:
      - name: ZAP Baseline Scan
        uses: zaproxy/action-baseline@v0.11.0
        with:
          target: 'https://staging.example.com'
```

---

## 4.3 Accessibility Testing

### Niveau 1 - Vulgarisation

Les **tests d'accessibilité** vérifient que l'application est **utilisable par tous**, y compris les personnes en situation de handicap (visuel, auditif, moteur, cognitif).

**Pourquoi c'est important** :
- **Éthique** : 15% de la population mondiale a un handicap
- **Légal** : Obligations légales (RGAA en France, ADA aux USA, EAA en Europe)
- **Business** : Plus d'utilisateurs, meilleur SEO, meilleure UX pour tous

### Niveau 2 - Approfondissement Expert

#### WCAG 2.2 (Web Content Accessibility Guidelines)

**Principes POUR** :
- **P**erceivable : L'information peut être perçue
- **O**perable : L'interface peut être utilisée
- **U**nderstandable : Le contenu est compréhensible
- **R**obust : Compatible avec les technologies d'assistance

**Niveaux de conformité** :
- **A** : Minimum (critères essentiels)
- **AA** : Standard recommandé (requis légalement en général)
- **AAA** : Optimal (pas toujours atteignable)

#### Critères WCAG clés pour e-commerce

| Critère | Niveau | Description | Impact e-commerce |
|---------|--------|-------------|-------------------|
| 1.1.1 Non-text Content | A | Alternatives textuelles aux images | Images produits avec alt text |
| 1.3.1 Info and Relationships | A | Structure sémantique | Formulaires accessibles |
| 1.4.3 Contrast | AA | Ratio contraste 4.5:1 | Textes lisibles |
| 2.1.1 Keyboard | A | Tout au clavier | Navigation/achat sans souris |
| 2.4.4 Link Purpose | A | Liens explicites | "Voir le produit" vs "Cliquez ici" |
| 3.3.1 Error Identification | A | Erreurs identifiées | Formulaire checkout |
| 4.1.2 Name, Role, Value | A | Composants accessibles | Boutons, selects custom |

#### Tests automatisés vs manuels

| Type | Ce qu'il détecte | Limites |
|------|------------------|---------|
| **Automatisé** | ~30% des problèmes WCAG | Ne comprend pas le contexte |
| **Manuel** | Problèmes complexes | Temps, expertise requise |
| **Utilisateurs réels** | Expérience réelle | Coût, organisation |

**Recommandation** : Automatisé en CI + Manuel périodique + Tests utilisateurs

#### Outils de test d'accessibilité

| Outil | Type | Usage |
|-------|------|-------|
| **axe DevTools** | Extension navigateur | Tests manuels rapides |
| **axe-core** | Library | Intégration CI (Jest, Cypress) |
| **Lighthouse** | Audit Chrome | Score accessibility |
| **WAVE** | Extension/Online | Visualisation des erreurs |
| **Pa11y** | CLI/CI | Automatisation CI/CD |
| **NVDA** | Screen reader (gratuit) | Tests manuels |
| **VoiceOver** | Screen reader (Mac/iOS) | Tests manuels |
| **JAWS** | Screen reader (payant) | Standard professionnel |

#### Intégration CI/CD

```javascript
// cypress/e2e/accessibility.cy.js
describe('Accessibility Tests', () => {
  beforeEach(() => {
    cy.injectAxe();
  });

  it('Homepage should have no critical violations', () => {
    cy.visit('/');
    cy.checkA11y(null, {
      rules: {
        'color-contrast': { enabled: true },
        'label': { enabled: true }
      }
    });
  });

  it('Product page should be accessible', () => {
    cy.visit('/products/sample-product');
    cy.checkA11y();
  });

  it('Checkout form should be accessible', () => {
    cy.visit('/checkout');
    cy.checkA11y('form');
  });
});
```

### Niveau 3 - Application Pratique

#### Checklist accessibilité e-commerce

**Images**
- [ ] Alt text sur toutes les images produits
- [ ] Alt vide pour images décoratives
- [ ] Zoom accessible au clavier

**Formulaires**
- [ ] Labels associés aux inputs
- [ ] Messages d'erreur explicites
- [ ] Focus visible

**Navigation**
- [ ] Skip link "Aller au contenu"
- [ ] Structure de headings logique (h1 → h2 → h3)
- [ ] Navigation au clavier complète
- [ ] Focus trap dans les modales

**Checkout**
- [ ] Étapes clairement indiquées
- [ ] Résumé commande accessible
- [ ] Erreurs de validation claires
- [ ] Timeout avec warning

---

## 4.4 Compatibility Testing

### Niveau 1 - Vulgarisation

Les **tests de compatibilité** vérifient que l'application fonctionne **sur différents navigateurs, appareils et systèmes d'exploitation**.

**Pourquoi c'est important** : Vos utilisateurs n'utilisent pas tous Chrome sur un MacBook Pro dernier cri. Certains sont sur Safari iPhone, d'autres sur Firefox Linux, d'autres sur Edge Windows.

### Niveau 2 - Approfondissement Expert

#### Types de compatibilité

| Type | Description | Exemples |
|------|-------------|----------|
| **Cross-browser** | Différents navigateurs | Chrome, Firefox, Safari, Edge |
| **Cross-device** | Différents appareils | Desktop, tablet, mobile |
| **Cross-OS** | Différents systèmes | Windows, macOS, Linux, iOS, Android |
| **Cross-resolution** | Différentes tailles d'écran | 1920x1080, 1366x768, 375x667 |
| **Backward compatibility** | Anciennes versions | IE11, vieux Android |

#### Stratégie de test cross-browser

**1. Identifier le marché cible**
Utiliser analytics pour connaître les browsers/devices des utilisateurs.

**2. Définir la matrice de support**

| Browser | Version | Support |
|---------|---------|---------|
| Chrome | Latest, Latest-1 | Full |
| Firefox | Latest, Latest-1 | Full |
| Safari | Latest, Latest-1 | Full |
| Edge | Latest | Full |
| Samsung Internet | Latest | Full |
| Chrome Mobile | Latest | Full |
| Safari iOS | Latest, Latest-1 | Full |
| IE11 | - | None |

**3. Tests automatisés multi-browser**

Playwright exemple :
```javascript
// playwright.config.js
module.exports = {
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    { name: 'firefox', use: { ...devices['Desktop Firefox'] } },
    { name: 'webkit', use: { ...devices['Desktop Safari'] } },
    { name: 'mobile-chrome', use: { ...devices['Pixel 5'] } },
    { name: 'mobile-safari', use: { ...devices['iPhone 12'] } },
  ],
};
```

#### Outils et services

| Outil | Usage |
|-------|-------|
| **BrowserStack** | Cloud testing, real devices |
| **Sauce Labs** | Cloud testing, CI integration |
| **LambdaTest** | Cloud testing |
| **Playwright** | Automation multi-browser |
| **Cypress** | Automation (Chrome, Firefox, Edge) |
| **BrowserSync** | Dev testing synchronisé |

### Niveau 3 - Application Pratique

#### Matrice de test e-commerce France

**Basé sur données marché France 2024 [À VÉRIFIER]** :

| Browser | Part de marché | Priorité test |
|---------|----------------|---------------|
| Chrome Desktop | ~50% | Haute |
| Safari Mobile | ~20% | Haute |
| Chrome Mobile | ~15% | Haute |
| Safari Desktop | ~8% | Moyenne |
| Firefox | ~5% | Moyenne |
| Edge | ~2% | Basse |

---

## 4.5 Usability Testing

### Niveau 1 - Vulgarisation

Les **tests d'utilisabilité** évaluent **si les utilisateurs arrivent à utiliser l'application facilement**. Ce n'est pas "est-ce que ça marche" mais "est-ce que c'est facile à utiliser".

**Pourquoi c'est important** : Une fonctionnalité qui existe mais que personne ne trouve ou ne comprend est une fonctionnalité inutile.

### Niveau 2 - Approfondissement Expert

#### Types de tests d'utilisabilité

| Type | Description | Participants |
|------|-------------|--------------|
| **Moderated** | Facilitateur présent, questions en direct | 5-8 par round |
| **Unmoderated** | Utilisateur seul, enregistrement | 10-20+ |
| **Remote** | À distance, outils en ligne | Variable |
| **In-person** | En présentiel, observation directe | 5-8 |
| **Guerrilla** | Tests rapides, lieux publics | 3-5 |
| **A/B Testing** | Comparaison de variantes | 1000+ |

#### Métriques d'utilisabilité

| Métrique | Description | Mesure |
|----------|-------------|--------|
| **Task Success Rate** | % de tâches réussies | Objectif : > 80% |
| **Time on Task** | Temps pour compléter une tâche | Comparaison au benchmark |
| **Error Rate** | Nombre d'erreurs par tâche | Moins = mieux |
| **SUS** | System Usability Scale | Score /100 (>68 = OK) |
| **NPS** | Net Promoter Score | -100 à +100 |
| **SEQ** | Single Ease Question | 1-7 par tâche |

#### System Usability Scale (SUS)

Questionnaire standardisé de 10 questions (John Brooke, 1986).

**Questions** (alternance positive/négative) :
1. Je pense que j'utiliserais volontiers ce système fréquemment
2. J'ai trouvé ce système inutilement complexe
3. J'ai trouvé ce système facile à utiliser
4. Je pense que j'aurais besoin d'une aide technique pour utiliser ce système
5. J'ai trouvé que les fonctions étaient bien intégrées
6. J'ai trouvé qu'il y avait trop d'incohérences dans ce système
7. Je pense que la plupart des gens apprendraient rapidement à utiliser ce système
8. J'ai trouvé ce système très contraignant à utiliser
9. Je me suis senti(e) à l'aise en utilisant ce système
10. J'ai dû apprendre beaucoup de choses avant de pouvoir utiliser ce système

**Calcul** : Score de 0 à 100
- Score > 68 : Au-dessus de la moyenne
- Score > 80 : Bon
- Score > 90 : Excellent

#### Outils de test d'utilisabilité

| Outil | Type | Usage |
|-------|------|-------|
| **UserTesting** | Unmoderated remote | Tests avec vrais utilisateurs |
| **Maze** | Unmoderated | Tests de prototype |
| **Hotjar** | Analytics comportemental | Heatmaps, recordings |
| **FullStory** | Session replay | Comprendre les frictions |
| **Lookback** | Moderated remote | Entretiens utilisateurs |
| **Optimal Workshop** | Card sorting, tree testing | Architecture information |

### Niveau 3 - Application Pratique

#### Scénario de test e-commerce

**Tâche** : "Achetez une paire de chaussures de running taille 42 pour moins de 100€"

**Observations** :
- L'utilisateur trouve-t-il les filtres ?
- Combien de temps pour trouver un produit ?
- Abandonne-t-il ? Où ?
- Complète-t-il l'achat ?

**Métriques collectées** :
- Task success : Oui/Non
- Time on task : 3 min 24 sec
- Errors : 1 (mauvais filtre sélectionné)
- SEQ : 5/7

---

## 4.6 Localization Testing

### Niveau 1 - Vulgarisation

Les **tests de localisation** vérifient que l'application fonctionne correctement **dans différentes langues et régions** : traductions, formats de dates, devises, etc.

**Pourquoi c'est important** : Un e-commerce qui affiche les prix en dollars aux clients français, ou des dates au format américain (MM/DD/YYYY) perd en crédibilité et en conversions.

### Niveau 2 - Approfondissement Expert

#### i18n vs l10n

| Terme | Signification | Focus |
|-------|---------------|-------|
| **i18n** | Internationalization | Préparer le code pour la localisation |
| **l10n** | Localization | Adapter le contenu pour une locale |

#### Éléments à tester

| Catégorie | Éléments | Exemples |
|-----------|----------|----------|
| **Textes** | Traductions, longueur | "Add to cart" → "Ajouter au panier" |
| **Dates** | Format | 12/31/2024 vs 31/12/2024 |
| **Nombres** | Séparateurs | 1,234.56 vs 1 234,56 |
| **Devises** | Symbole, position | $99.99 vs 99,99 € |
| **Adresses** | Format | ZIP code vs Code postal |
| **Téléphones** | Format | +1 (555) 123-4567 vs +33 1 23 45 67 89 |
| **UI** | Direction | LTR vs RTL (arabe, hébreu) |
| **Images** | Contenu culturel | Adapter les visuels |
| **Légal** | CGV, mentions | Spécifiques par pays |

#### Checklist localisation e-commerce

**Technique**
- [ ] Tous les textes externalisés (pas de hardcoded)
- [ ] Formats dates/nombres selon locale
- [ ] Devises correctement converties/affichées
- [ ] Tri alphabétique respecte la locale
- [ ] RTL supporté si nécessaire

**Contenu**
- [ ] Traductions complètes (pas de texte manquant)
- [ ] Traductions de qualité (pas de machine translation brute)
- [ ] Contexte respecté (bouton court vs description longue)
- [ ] Termes spécifiques au marché (shipping, VAT)

**UX**
- [ ] UI s'adapte aux textes plus longs (allemand +30%)
- [ ] Images culturellement appropriées
- [ ] Sélecteur de langue visible
- [ ] URL localisées (/fr/, /de/, /es/)

### Niveau 3 - Application Pratique

#### Tests pseudo-localisation

**Technique** : Remplacer les textes par des versions artificielles pour détecter les problèmes.

```
Original: "Add to cart"
Pseudo-L10n: "[Àḓḓ ṭö çàṛṭ one two three]"
```

**Objectifs** :
- Détecter les textes hardcodés (non traduits)
- Vérifier que l'UI supporte les textes longs
- Identifier les problèmes d'encodage (caractères spéciaux)

#### Outils

| Outil | Usage |
|-------|-------|
| **Crowdin** | Gestion traductions |
| **Phrase** | Gestion traductions |
| **Lokalise** | Gestion traductions |
| **i18next** | Library JS i18n |
| **react-intl** | React i18n |

---

# Section 5 : Automatisation des Tests

---

## 5.1 Automation Strategy et ROI

### Niveau 1 - Vulgarisation

L'**automatisation des tests** consiste à faire exécuter des tests par des programmes plutôt que par des humains. Mais automatiser a un coût : il faut l'écrire, le maintenir. La question est : **est-ce que ça vaut le coup ?**

**Analogie** : Acheter un robot aspirateur. Le robot coûte cher à l'achat, mais si vous aspirez tous les jours, il sera rentable après quelques mois. Si vous aspirez une fois par mois, gardez l'aspirateur manuel.

**Pourquoi c'est important** : Automatiser sans stratégie mène à des tests fragiles, coûteux à maintenir, qui finissent ignorés. L'automatisation doit avoir un ROI positif.

### Niveau 2 - Approfondissement Expert

#### Quand automatiser ?

**Automatiser si** :
- Test exécuté fréquemment (régression)
- Test stable (comportement prévisible)
- Test critique (parcours business clé)
- Test manuel long et répétitif
- Test nécessitant précision (calculs)
- Test nécessitant volume (load testing)

**Ne PAS automatiser si** :
- Test one-shot (exploration initiale)
- Fonctionnalité en évolution rapide (instable)
- Test nécessitant jugement humain (UX, exploratory)
- ROI négatif (coût > bénéfice)

#### Calcul du ROI de l'automatisation

**Formule simplifiée** :
```
ROI = (Coût Manuel × Nombre d'exécutions) - Coût Automatisation
                          Coût Automatisation

Où :
- Coût Manuel = Temps exécution × Tarif horaire
- Coût Automatisation = Développement + Maintenance
```

**Exemple concret** :
```
Test manuel checkout :
- Temps d'exécution : 30 minutes
- Fréquence : 20x par mois
- Tarif QA : 50€/h
- Coût mensuel manuel : 0.5h × 20 × 50€ = 500€/mois

Automatisation :
- Développement initial : 8h × 80€/h = 640€
- Maintenance mensuelle : 2h × 80€/h = 160€/mois
- Exécution : ~0€ (CI/CD)

Break-even : 640€ / (500€ - 160€) ≈ 2 mois
ROI après 1 an : ((500 × 12) - (640 + 160 × 12)) / (640 + 160 × 12) ≈ 140%
```

#### Pyramide de l'automatisation appliquée

| Niveau | % Budget | ROI typique |
|--------|----------|-------------|
| Unit Tests | 40-50% | Très élevé |
| Integration | 30-40% | Élevé |
| E2E | 10-20% | Variable |

### Niveau 3 - Application Pratique

#### Framework de décision

```
DÉCISION D'AUTOMATISATION

Pour chaque test, évaluer :

1. FRÉQUENCE D'EXÉCUTION
   □ Quotidien (+3)
   □ Hebdomadaire (+2)
   □ Mensuel (+1)
   □ Rare (0)

2. STABILITÉ DU TEST
   □ Très stable (+3)
   □ Stable (+2)
   □ Changeant (-1)
   □ Très volatile (-3)

3. CRITICITÉ BUSINESS
   □ Bloquant si échec (+3)
   □ Important (+2)
   □ Nice-to-have (+1)
   □ Marginal (0)

4. COMPLEXITÉ D'AUTOMATISATION
   □ Simple (+2)
   □ Moyenne (+1)
   □ Complexe (0)
   □ Très complexe (-2)

SCORE TOTAL :
- >= 8 : Automatiser en priorité
- 5-7 : Automatiser si temps disponible
- 2-4 : Évaluer au cas par cas
- < 2 : Garder manuel
```

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| "Automatiser tout" | ROI négatif, maintenance impossible | Prioriser par ROI |
| "Record & Playback" | Tests fragiles | Conception propre (POM) |
| "Tests abandonnés" | Suite rouge ignorée | Maintenance régulière |
| "Automatiser en retard" | Technical debt | Shift-left automation |

---

## 5.2 Test Automation Pyramid

### Niveau 1 - Vulgarisation

La **pyramide d'automatisation** est un modèle visuel qui recommande **plus de tests unitaires (base), moins de tests E2E (sommet)**. Comme une vraie pyramide : large base, sommet étroit.

**Pourquoi** : Les tests unitaires sont rapides, stables, pas chers. Les tests E2E sont lents, fragiles, chers. Mieux vaut avoir beaucoup du premier et peu du second.

### Niveau 2 - Approfondissement Expert

#### Origine

Concept popularisé par **Mike Cohn** dans "Succeeding with Agile" (2009), bien que l'idée existait avant.

#### La pyramide classique

```
            /\
           /  \         UI / E2E Tests
          /────\        (Peu, lents, fragiles)
         /      \
        /────────\      Integration Tests
       /          \     (Quelques-uns)
      /────────────\
     /              \   Unit Tests
    /────────────────\  (Beaucoup, rapides, stables)
```

#### Proportions recommandées

| Source | Unit | Integration | E2E |
|--------|------|-------------|-----|
| Google Testing Blog | 70% | 20% | 10% |
| Martin Fowler | ~70% | ~20% | ~10% |
| Pratique courante | 60-80% | 15-30% | 5-15% |

**Important** : Ces ratios sont indicatifs, pas des règles absolues. Le contexte compte.

#### Caractéristiques par niveau

| Aspect | Unit | Integration | E2E |
|--------|------|-------------|-----|
| Vitesse | ms | secondes | minutes |
| Stabilité | Haute | Moyenne | Basse |
| Coût écriture | Bas | Moyen | Élevé |
| Coût maintenance | Bas | Moyen | Élevé |
| Feedback | Immédiat | Rapide | Tardif |
| Isolement | Total | Partiel | Aucun |
| Debugging | Facile | Moyen | Difficile |

#### Variantes et critiques

**Ice Cream Cone (Anti-pattern)** :
```
    ▄▄▄▄▄▄▄▄▄▄▄▄▄
   ████████████████   ← Trop de tests manuels
    ██████████████
     ████████████     ← Trop de E2E
      ██████████
       ████████       ← Peu d'integration
        ██████
         ████         ← Très peu de unit tests
          ██
```

**Testing Trophy (Kent C. Dodds)** :
```
        /\
       /  \         E2E (peu)
      /────\
     ████████       Integration (beaucoup)
    ██████████
     ████████       Unit (quelques-uns)
      ██████
       Static (base)
```

Cette variante suggère plus de tests d'intégration et moins de tests unitaires purs.

### Niveau 3 - Application Pratique

#### Application e-commerce

```
STRATÉGIE DE TEST E-COMMERCE
═══════════════════════════════════════════════════

NIVEAU E2E (10%) - 20-30 tests
├── Checkout guest complet
├── Checkout user enregistré
├── Recherche → ajout panier → achat
├── Inscription / Connexion
├── Paiements (CB, PayPal, etc.)
└── Smoke tests critiques

NIVEAU INTEGRATION (25%) - 100-150 tests
├── API endpoints (auth, products, cart, orders)
├── Services ↔ Database
├── Services ↔ External APIs (payment, shipping)
├── Event handlers (order placed, payment received)
└── Business workflows

NIVEAU UNIT (65%) - 500-1000+ tests
├── Cart calculator (prix, promos, taxes)
├── Validators (email, address, card)
├── Formatters (dates, currency)
├── Business logic (stock, eligibility)
├── Utilities
└── Components UI (render, props)
```

---

## 5.3 Page Object Model (POM)

### Niveau 1 - Vulgarisation

Le **Page Object Model** est une façon d'organiser le code des tests E2E/UI. Au lieu de répéter les sélecteurs et actions dans chaque test, on les centralise dans des "objets page".

**Analogie** : Au lieu que chaque recette décrive comment allumer le four, vous avez un manuel du four. Les recettes disent juste "Préchauffer à 180°" et vous consultez le manuel si besoin.

**Pourquoi c'est important** : Si le bouton "Ajouter au panier" change de classe CSS, vous corrigez à un seul endroit plutôt que dans 50 tests.

### Niveau 2 - Approfondissement Expert

#### Principes

1. **Une classe par page/composant** : `LoginPage`, `ProductPage`, `CheckoutPage`
2. **Encapsulation des sélecteurs** : Les sélecteurs sont privés
3. **Méthodes publiques pour les actions** : `login(user, pass)`, `addToCart()`
4. **Retourne des Page Objects** : Pour le chaînage

#### Structure type

```javascript
// pages/ProductPage.js
class ProductPage {
  // Sélecteurs (privés ou dans un objet séparé)
  selectors = {
    title: '[data-testid="product-title"]',
    price: '[data-testid="product-price"]',
    addToCartBtn: '[data-testid="add-to-cart"]',
    quantityInput: '[data-testid="quantity"]',
    sizeSelect: '[data-testid="size-select"]',
  };

  constructor(page) {
    this.page = page;
  }

  // Actions
  async selectSize(size) {
    await this.page.selectOption(this.selectors.sizeSelect, size);
  }

  async setQuantity(qty) {
    await this.page.fill(this.selectors.quantityInput, String(qty));
  }

  async addToCart() {
    await this.page.click(this.selectors.addToCartBtn);
    // Retourne la page suivante pour chaînage
    return new CartPage(this.page);
  }

  // Assertions
  async getTitle() {
    return await this.page.textContent(this.selectors.title);
  }

  async getPrice() {
    const priceText = await this.page.textContent(this.selectors.price);
    return parseFloat(priceText.replace(/[^0-9.]/g, ''));
  }
}
```

#### Utilisation dans un test

```javascript
// tests/checkout.spec.js
test('should add product to cart', async ({ page }) => {
  const homePage = new HomePage(page);
  const productPage = await homePage.searchAndClickFirstProduct('shoes');

  await productPage.selectSize('42');
  await productPage.setQuantity(2);
  const cartPage = await productPage.addToCart();

  const itemCount = await cartPage.getItemCount();
  expect(itemCount).toBe(2);
});
```

#### Variations et évolutions

| Pattern | Description | Cas d'usage |
|---------|-------------|-------------|
| **Page Object** | Une classe par page | Pages distinctes |
| **Component Object** | Une classe par composant réutilisable | Header, Footer, Modal |
| **Screenplay Pattern** | Acteurs + Tâches + Questions | Tests très lisibles, complexité accrue |
| **App Actions** | Actions via API plutôt que UI pour setup | Setup rapide avant tests UI |

### Niveau 3 - Application Pratique

#### Structure de projet

```
tests/
├── e2e/
│   ├── checkout.spec.js
│   ├── search.spec.js
│   └── account.spec.js
├── pages/
│   ├── BasePage.js
│   ├── HomePage.js
│   ├── ProductPage.js
│   ├── CartPage.js
│   ├── CheckoutPage.js
│   └── ConfirmationPage.js
├── components/
│   ├── Header.js
│   ├── SearchBar.js
│   └── ProductCard.js
├── fixtures/
│   └── testData.js
└── utils/
    └── helpers.js
```

#### Anti-patterns

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| Sélecteurs dans les tests | Duplication, maintenance | Centraliser dans Page Objects |
| God Page Object | Classe de 1000 lignes | Décomposer en components |
| Assertions dans Page Object | Mélange des responsabilités | Actions dans PO, assertions dans tests |
| Héritage profond | Complexité | Composition plutôt qu'héritage |

---

## 5.4 Test Data Management

### Niveau 1 - Vulgarisation

La **gestion des données de test** assure que vos tests ont toujours les **bonnes données disponibles** : utilisateurs test, produits, commandes, etc.

**Pourquoi c'est important** : Un test qui cherche le produit "PROD-001" échoue si ce produit n'existe pas. Les données de test doivent être fiables et reproductibles.

### Niveau 2 - Approfondissement Expert

#### Approches

| Approche | Description | Avantages | Inconvénients |
|----------|-------------|-----------|---------------|
| **Fixtures statiques** | Fichiers JSON/SQL préchargés | Simple, rapide | Rigide, couplé |
| **Factories** | Code qui génère des données | Flexible, maintenable | Plus complexe |
| **Seeding** | Peuplement de la DB avant tests | Données réalistes | Lent, lourd |
| **API Setup** | Création via API avant chaque test | Isolé, propre | Plus lent |
| **Shared test DB** | Base partagée entre tests | Simple | Conflits, pollution |

#### Pattern Factory

```javascript
// factories/userFactory.js
const { faker } = require('@faker-js/faker');

const createUser = (overrides = {}) => ({
  id: faker.string.uuid(),
  email: faker.internet.email(),
  firstName: faker.person.firstName(),
  lastName: faker.person.lastName(),
  password: 'TestPassword123!',
  role: 'customer',
  createdAt: new Date(),
  ...overrides, // Permet de surcharger
});

const createAdmin = (overrides = {}) =>
  createUser({ role: 'admin', ...overrides });

const createOrder = (userId, overrides = {}) => ({
  id: faker.string.uuid(),
  userId,
  items: [
    {
      productId: 'PROD-001',
      quantity: faker.number.int({ min: 1, max: 5 }),
      price: faker.number.float({ min: 10, max: 200, precision: 0.01 }),
    },
  ],
  status: 'pending',
  createdAt: new Date(),
  ...overrides,
});

module.exports = { createUser, createAdmin, createOrder };
```

#### Utilisation

```javascript
const { createUser, createOrder } = require('../factories/userFactory');

test('should display order history', async () => {
  // Arrange - Création de données
  const user = await db.users.create(createUser());
  const order1 = await db.orders.create(createOrder(user.id, { status: 'delivered' }));
  const order2 = await db.orders.create(createOrder(user.id, { status: 'pending' }));

  // Act
  await loginAs(user);
  const ordersPage = await navigateTo('/account/orders');

  // Assert
  expect(await ordersPage.getOrderCount()).toBe(2);

  // Cleanup (si nécessaire)
  await db.orders.delete([order1.id, order2.id]);
  await db.users.delete(user.id);
});
```

#### Outils

| Langage | Outils |
|---------|--------|
| JavaScript | Faker.js, Fishery, Factory.ts |
| Python | Factory Boy, Faker |
| Java | Datafaker, Easy Random |
| Ruby | FactoryBot, Faker |

### Niveau 3 - Application Pratique

#### Stratégie pour e-commerce

```
TEST DATA STRATEGY

1. FIXTURES STATIQUES (référence)
   └── Produits catalogue (catégories, prix, images)
   └── Configuration (pays, devises, shipping)

2. FACTORIES (tests individuels)
   └── Users (customer, admin, guest)
   └── Carts
   └── Orders
   └── Addresses

3. SEEDING (environnement staging)
   └── Données anonymisées de production
   └── Volume réaliste

4. ISOLATION
   └── Chaque test crée ses données
   └── Nettoyage après chaque test (ou transaction rollback)
```

---

## 5.5 Flaky Tests

### Niveau 1 - Vulgarisation

Un **test flaky** (instable) est un test qui **parfois passe, parfois échoue**, sans qu'on ait changé le code. C'est comme un détecteur de fumée qui sonne au hasard : on finit par l'ignorer, même quand il y a vraiment un problème.

**Pourquoi c'est un problème** : Les tests flaky érodent la confiance dans la suite de tests. L'équipe commence à "relancer" les tests jusqu'à ce qu'ils passent, ou les désactive.

### Niveau 2 - Approfondissement Expert

#### Causes courantes

| Cause | Exemple | Solution |
|-------|---------|----------|
| **Timing/Race conditions** | Élément pas encore chargé | Waits explicites |
| **Ordre d'exécution** | Tests dépendants de l'ordre | Isolation complète |
| **Données partagées** | Tests modifient les mêmes données | Données isolées |
| **État global** | Singleton non réinitialisé | Reset entre tests |
| **Ressources externes** | API tierce instable | Mock, retry |
| **Concurrence** | Tests en parallèle qui interfèrent | Isolation, locks |
| **Date/Heure** | Test basé sur "aujourd'hui" | Freeze time |
| **Aléatoire** | Math.random() dans le code | Seed déterministe |

#### Stratégies de gestion

1. **Détection** : Marquer les tests qui échouent puis passent au retry
2. **Quarantaine** : Isoler les flaky tests dans une suite séparée
3. **Investigation** : Prioriser le fix selon l'impact
4. **Retry automatique** : Réexécuter N fois avant de marquer comme échec
5. **Suppression** : Si non fixable et faible valeur, supprimer

#### Configuration retry (exemples)

**Jest** :
```javascript
// jest.config.js
module.exports = {
  testRetries: 2, // Retry 2 fois si échec
};
```

**Playwright** :
```javascript
// playwright.config.js
module.exports = {
  retries: process.env.CI ? 2 : 0, // Retry seulement en CI
};
```

**Cypress** :
```javascript
// cypress.config.js
module.exports = {
  retries: {
    runMode: 2,      // CI
    openMode: 0,     // Local dev
  },
};
```

#### Métriques de flakiness

```
Flake Rate = (Runs with flaky failures / Total runs) × 100

Objectif : < 1%
Alerte si : > 5%
Critique si : > 10%
```

### Niveau 3 - Application Pratique

#### Checklist anti-flaky pour E2E

```javascript
// ❌ MAUVAIS : Sleep fixe
await page.click('#submit');
await new Promise(r => setTimeout(r, 3000)); // Danger !
await expect(page.locator('#success')).toBeVisible();

// ✅ BON : Wait explicite
await page.click('#submit');
await expect(page.locator('#success')).toBeVisible({ timeout: 10000 });
```

```javascript
// ❌ MAUVAIS : Sélecteur fragile
await page.click('.btn-primary:nth-child(2)');

// ✅ BON : Sélecteur stable
await page.click('[data-testid="submit-order"]');
```

```javascript
// ❌ MAUVAIS : Dépendance à l'heure actuelle
const isNewYear = new Date().getMonth() === 0;

// ✅ BON : Heure contrôlée
jest.useFakeTimers().setSystemTime(new Date('2025-01-01'));
```

---

## 5.6 Visual Regression Testing

### Niveau 1 - Vulgarisation

Le **visual regression testing** compare des **screenshots** de l'application pour détecter des changements visuels non intentionnels. C'est comme comparer une photo "avant" et "après" pour voir ce qui a changé.

**Pourquoi c'est important** : Un changement CSS peut casser la mise en page sans qu'aucun test fonctionnel ne le détecte. Le bouton fonctionne toujours, mais il est maintenant caché sous un autre élément.

### Niveau 2 - Approfondissement Expert

#### Fonctionnement

1. **Baseline** : Capture des screenshots de référence
2. **Comparison** : Lors des tests, nouvelles captures
3. **Diff** : Comparaison pixel par pixel ou perceptuelle
4. **Review** : Humain valide les changements intentionnels
5. **Update** : Nouvelles baselines si changement accepté

#### Outils

| Outil | Type | Points forts |
|-------|------|--------------|
| **Percy** (BrowserStack) | SaaS | Intégration CI, review UI |
| **Chromatic** | SaaS (Storybook) | Idéal pour composants |
| **Applitools** | SaaS | IA pour comparaison smart |
| **BackstopJS** | Open source | Config simple, local |
| **Playwright** | Built-in | `toHaveScreenshot()` |
| **Cypress** | Plugin | cypress-image-snapshot |

#### Playwright Visual Testing

```javascript
// visual.spec.js
import { test, expect } from '@playwright/test';

test('homepage visual regression', async ({ page }) => {
  await page.goto('/');

  // Full page screenshot
  await expect(page).toHaveScreenshot('homepage.png', {
    fullPage: true,
    maxDiffPixels: 100, // Tolérance
  });
});

test('product card component', async ({ page }) => {
  await page.goto('/products/sample');

  // Screenshot d'un élément spécifique
  const productCard = page.locator('[data-testid="product-card"]');
  await expect(productCard).toHaveScreenshot('product-card.png');
});
```

#### Défis et solutions

| Défi | Solution |
|------|----------|
| Contenu dynamique (dates, ads) | Masquer ou mocker |
| Animations | Désactiver ou attendre fin |
| Fonts non chargées | Attendre font loading |
| Différences cross-browser | Un baseline par browser |
| Anti-aliasing | Tolérance pixel (threshold) |

### Niveau 3 - Application Pratique

#### Stratégie e-commerce

**Pages à tester** :
- Homepage (hero, catégories, promos)
- Listing produits (grid, filtres)
- Fiche produit (images, prix, CTA)
- Panier
- Checkout steps
- Emails (si possible)

**Fréquence** :
- PR : Sur composants modifiés
- Nightly : Suite complète
- Pre-release : Full regression

---

## 5.7 Continuous Testing in CI/CD

### Niveau 1 - Vulgarisation

Le **Continuous Testing** intègre les tests automatisés dans le **pipeline CI/CD** pour avoir du feedback à chaque changement de code. Chaque commit déclenche des tests automatiquement.

**Pourquoi c'est important** : Plus on détecte un bug tôt (Shift-Left), moins il coûte cher à corriger. Les tests en CI/CD détectent les régressions immédiatement.

### Niveau 2 - Approfondissement Expert

#### Pipeline typique

```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐
│  PUSH   │───▶│  BUILD  │───▶│  TEST   │───▶│ DEPLOY  │───▶│ VERIFY  │
└─────────┘    └─────────┘    └─────────┘    └─────────┘    └─────────┘
                                  │
              ┌───────────────────┼───────────────────┐
              │                   │                   │
              ▼                   ▼                   ▼
         ┌─────────┐         ┌─────────┐         ┌─────────┐
         │  LINT   │         │  UNIT   │         │  SAST   │
         │ STATIC  │         │  TESTS  │         │SECURITY │
         └─────────┘         └─────────┘         └─────────┘
              │                   │                   │
              └───────────────────┼───────────────────┘
                                  ▼
                           ┌─────────────┐
                           │ INTEGRATION │
                           │    TESTS    │
                           └─────────────┘
                                  │
                                  ▼
                           ┌─────────────┐
                           │   E2E TESTS │
                           │   (subset)  │
                           └─────────────┘
```

#### GitHub Actions exemple

```yaml
# .github/workflows/ci.yml
name: CI Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck

  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      - run: npm ci
      - run: npm run test:unit -- --coverage
      - uses: codecov/codecov-action@v3

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        ports:
          - 5432:5432
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
      - run: npm ci
      - run: npm run test:integration
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/test

  e2e-tests:
    runs-on: ubuntu-latest
    needs: [lint, unit-tests]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npm run build
      - run: npm run test:e2e
      - uses: actions/upload-artifact@v4
        if: failure()
        with:
          name: playwright-report
          path: playwright-report/

  deploy-staging:
    runs-on: ubuntu-latest
    needs: [e2e-tests, integration-tests]
    if: github.ref == 'refs/heads/develop'
    steps:
      - run: echo "Deploy to staging..."
```

#### Optimisations

| Technique | Bénéfice |
|-----------|----------|
| **Parallélisation** | Tests plus rapides |
| **Caching** | node_modules, builds, Playwright browsers |
| **Test sharding** | Répartir E2E sur plusieurs runners |
| **Selective testing** | Ne tester que ce qui a changé |
| **Fail fast** | Arrêter dès le premier échec critique |

### Niveau 3 - Application Pratique

#### Durées cibles

| Stage | Durée cible | Bloquant si échec |
|-------|-------------|-------------------|
| Lint + TypeCheck | < 2 min | Oui |
| Unit Tests | < 5 min | Oui |
| Integration Tests | < 10 min | Oui |
| E2E (smoke) | < 10 min | Oui |
| E2E (full) | < 30 min | Oui (pre-release) |
| Visual Regression | < 15 min | Non (review) |

---

## 5.8 Test Environment Management

### Niveau 1 - Vulgarisation

La **gestion des environnements de test** assure que vous avez des environnements **stables, isolés et représentatifs** pour exécuter vos tests.

**Pourquoi c'est important** : Un test qui passe en local mais échoue en CI (ou vice versa) est un cauchemar. Les environnements doivent être cohérents et contrôlés.

### Niveau 2 - Approfondissement Expert

#### Types d'environnements

| Environnement | Usage | Caractéristiques |
|---------------|-------|------------------|
| **Local** | Développement | Machine du dev, DB locale |
| **CI** | Tests automatisés | Éphémère, containers |
| **Staging** | Tests manuels, UAT | Proche prod, données test |
| **Pre-prod** | Validation finale | Identique prod, données prod anonymisées |
| **Production** | Live | Vraies données, vrais users |

#### Infrastructure as Code pour les tests

**Docker Compose** pour environnement local/CI :

```yaml
# docker-compose.test.yml
version: '3.8'

services:
  app:
    build: .
    environment:
      - NODE_ENV=test
      - DATABASE_URL=postgresql://test:test@db:5432/testdb
      - REDIS_URL=redis://cache:6379
    depends_on:
      - db
      - cache

  db:
    image: postgres:15
    environment:
      POSTGRES_USER: test
      POSTGRES_PASSWORD: test
      POSTGRES_DB: testdb
    tmpfs:
      - /var/lib/postgresql/data  # RAM pour rapidité

  cache:
    image: redis:7

  mailhog:
    image: mailhog/mailhog
    ports:
      - "8025:8025"  # UI pour voir les emails
```

#### Testcontainers

Librairie pour créer des containers à la volée dans les tests :

```javascript
// setup.js (Jest)
const { PostgreSqlContainer } = require('@testcontainers/postgresql');

let container;

beforeAll(async () => {
  container = await new PostgreSqlContainer()
    .withDatabase('testdb')
    .start();

  process.env.DATABASE_URL = container.getConnectionUri();
});

afterAll(async () => {
  await container.stop();
});
```

#### Gestion des données d'environnement

| Stratégie | Description | Usage |
|-----------|-------------|-------|
| **Reset complet** | Vider et reseed entre les tests | Isolation totale |
| **Transaction rollback** | Rollback après chaque test | Rapide, propre |
| **Fixtures par test** | Chaque test crée ses données | Isolé mais plus lent |
| **Snapshot** | Restaurer un snapshot DB | Données réalistes |

### Niveau 3 - Application Pratique

#### Matrice d'environnements e-commerce

```
ENVIRONNEMENTS DE TEST

┌────────────────┬──────────────┬──────────────┬──────────────┐
│                │   LOCAL      │     CI       │   STAGING    │
├────────────────┼──────────────┼──────────────┼──────────────┤
│ Database       │ Docker PG    │ Testcontainer│ RDS (dédié)  │
│ Cache          │ Docker Redis │ Docker Redis │ ElastiCache  │
│ Search         │ Docker ES    │ Mock         │ OpenSearch   │
│ Payments       │ Sandbox      │ Mock         │ Sandbox      │
│ Emails         │ Mailhog      │ Mock         │ SES Sandbox  │
│ Files          │ Local folder │ Memory       │ S3 (dédié)   │
│ External APIs  │ Mock/Sandbox │ Mock         │ Sandbox      │
├────────────────┼──────────────┼──────────────┼──────────────┤
│ Data           │ Fixtures     │ Factories    │ Anonymized   │
│ Refresh        │ On demand    │ Each run     │ Nightly      │
└────────────────┴──────────────┴──────────────┴──────────────┘
```

---

# Section 6 : User Acceptance Testing (UAT)

---

## 6.1 UAT Planning et Execution

### Niveau 1 - Vulgarisation

Les **tests d'acceptation utilisateur (UAT)** sont réalisés par les **utilisateurs finaux ou leurs représentants** pour vérifier que le système répond à leurs besoins réels. C'est la validation finale avant le Go-Live.

**Analogie** : Vous avez fait construire une maison. L'architecte a validé les plans, le constructeur a vérifié la structure. L'UAT, c'est quand VOUS visitez la maison pour vérifier qu'elle correspond à ce que vous vouliez.

**Pourquoi c'est important** : Les développeurs et QA peuvent passer à côté de problèmes évidents pour un utilisateur métier. L'UAT capture ces écarts.

### Niveau 2 - Approfondissement Expert

#### Définition (ISTQB)

> "Acceptance testing: Formal testing with respect to user needs, requirements, and business processes conducted to determine whether a system satisfies the acceptance criteria."

#### Types d'Acceptance Testing

| Type | Description | Qui |
|------|-------------|-----|
| **User Acceptance Testing** | Validation par utilisateurs finaux | End users, business |
| **Business Acceptance Testing** | Validation des processus métier | Business analysts |
| **Contract Acceptance Testing** | Conformité au contrat | Client/fournisseur |
| **Regulation Acceptance Testing** | Conformité réglementaire | Compliance, legal |
| **Alpha Testing** | Tests internes avant beta | Équipe interne |
| **Beta Testing** | Tests par utilisateurs externes | Users sélectionnés |

#### Planning UAT

**Éléments à définir** :

1. **Scope** : Quelles fonctionnalités sont testées ?
2. **Participants** : Qui teste ? (représentatifs des personas)
3. **Environnement** : Staging/Pre-prod configuré
4. **Données** : Données réalistes (anonymisées si prod)
5. **Scénarios** : Cas de test dérivés des critères d'acceptation
6. **Timeline** : Durée, jalons, deadlines
7. **Critères de succès** : Définition du "pass"
8. **Process de feedback** : Comment remonter les problèmes

#### Template de scénario UAT

```
SCÉNARIO UAT : Commande avec code promo

ID: UAT-CHECKOUT-003
Feature: Tunnel d'achat
User Story: US-042 - En tant que client, je veux utiliser un code promo

PRÉCONDITIONS:
- Utilisateur connecté avec compte test
- Panier contenant 2 articles (total > 50€)
- Code promo WELCOME10 actif (-10%)

ÉTAPES:
1. Aller au panier
2. Cliquer sur "J'ai un code promo"
3. Saisir "WELCOME10"
4. Cliquer sur "Appliquer"
5. Vérifier le récapitulatif
6. Procéder au paiement
7. Vérifier le montant débité

RÉSULTAT ATTENDU:
- Réduction de 10% appliquée et visible
- Total recalculé correctement
- Code affiché dans le récapitulatif
- Confirmation email mentionne la réduction

RÉSULTAT OBTENU:
[À compléter par le testeur]

STATUT: [ ] PASS  [ ] FAIL  [ ] BLOQUÉ

COMMENTAIRES:
[Observations, captures d'écran, etc.]
```

#### Métriques UAT

| Métrique | Description | Seuil typique |
|----------|-------------|---------------|
| Test Pass Rate | % scénarios réussis | > 95% |
| Defect Discovery Rate | Bugs trouvés / scénarios | Informatif |
| Critical Defects | Bugs bloquants | 0 pour Go-Live |
| User Satisfaction | Feedback qualitatif | Positif majoritaire |

### Niveau 3 - Application Pratique

#### Organisation UAT e-commerce

```
PLANNING UAT - REFONTE CHECKOUT

SEMAINE 1 : Préparation
├── Lundi: Formation testeurs, accès environnement
├── Mardi: Walkthrough des scénarios
├── Mercredi: Vérification données test
└── Jeudi-Vendredi: Buffer

SEMAINE 2 : Exécution
├── Lundi-Mardi: Parcours achat standard
├── Mercredi: Cas particuliers (promos, multi-adresses)
├── Jeudi: Paiements (CB, PayPal, 3x)
└── Vendredi: Retours et corrections critiques

SEMAINE 3 : Finalisation
├── Lundi-Mardi: Re-test des corrections
├── Mercredi: Session de feedback
├── Jeudi: Rédaction rapport UAT
└── Vendredi: Sign-off meeting

PARTICIPANTS:
- 2 représentants Service Client
- 1 responsable E-commerce
- 1 responsable Logistique
- Product Owner (facilitation)
```

---

## 6.2 Alpha vs Beta Testing

### Niveau 1 - Vulgarisation

- **Alpha Testing** : Tests par l'équipe **interne** avant de montrer aux utilisateurs externes
- **Beta Testing** : Tests par des **utilisateurs réels sélectionnés** avant le lancement public

**Analogie restaurant** :
- Alpha = Le chef et l'équipe goûtent les plats
- Beta = On invite quelques clients fidèles pour une soirée de test

### Niveau 2 - Approfondissement Expert

| Aspect | Alpha Testing | Beta Testing |
|--------|---------------|--------------|
| **Qui** | Équipe interne, employés | Utilisateurs externes sélectionnés |
| **Où** | Environnement contrôlé | Environnement réel de l'utilisateur |
| **Quand** | Avant beta | Avant release publique |
| **Objectif** | Trouver bugs majeurs | Feedback réel, usabilité |
| **Feedback** | Direct, détaillé | Variable, réaliste |
| **Contrôle** | Élevé | Limité |

#### Types de Beta Testing

| Type | Description |
|------|-------------|
| **Closed Beta** | Groupe restreint d'utilisateurs invités |
| **Open Beta** | Ouvert à tous (inscription) |
| **Technical Beta** | Focus sur la stabilité technique |
| **Marketing Beta** | Focus sur le feedback produit |

### Niveau 3 - Application Pratique

#### Programme Beta e-commerce

```
BETA TESTING PROGRAM

OBJECTIFS:
- Valider l'UX du nouveau checkout
- Identifier les bugs edge cases
- Collecter feedback utilisateurs
- Tester la charge réelle (soft launch)

PARTICIPANTS (Closed Beta):
- 500 clients fidèles (> 5 commandes/an)
- Mix démographique représentatif
- Opt-in avec incentive (10% sur prochaine commande)

DURÉE: 2 semaines

MÉCANISME:
- Feature flag activé pour beta users
- Feedback widget intégré
- Hotline support dédiée
- Analytics séparés

CRITÈRES DE SORTIE:
- < 5 bugs majeurs non résolus
- NPS beta > 30
- Taux de conversion >= version actuelle
- Aucun incident sécurité/paiement
```

---

## 6.3 Acceptance Criteria Verification

### Niveau 1 - Vulgarisation

Les **critères d'acceptation** définissent **quand une fonctionnalité est "terminée"**. L'UAT vérifie que ces critères sont respectés.

**Exemple** :
- User Story : "En tant que client, je veux filtrer les produits par taille"
- Critère d'acceptation : "Quand je sélectionne 'Taille M', seuls les produits disponibles en M s'affichent"

### Niveau 2 - Approfondissement Expert

#### Format des critères d'acceptation

**Gherkin (Given-When-Then)** :
```gherkin
Feature: Product Filtering

  Scenario: Filter by size
    Given I am on the product listing page
    And there are products available in sizes S, M, L
    When I select filter "Size: M"
    Then I should see only products available in size M
    And the filter "Size: M" should be displayed as active
    And the product count should update

  Scenario: Combine multiple filters
    Given I am on the product listing page
    When I select filter "Size: M"
    And I select filter "Color: Blue"
    Then I should see only products that are both size M and blue
```

#### Traceability Matrix

| Req ID | User Story | Acceptance Criteria | Test Cases | UAT Status |
|--------|------------|---------------------|------------|------------|
| REQ-101 | Filter by size | AC-101-1, AC-101-2 | TC-201, TC-202 | ✅ Pass |
| REQ-102 | Filter by color | AC-102-1 | TC-203 | ✅ Pass |
| REQ-103 | Filter by price | AC-103-1, AC-103-2 | TC-204, TC-205 | ⚠️ Partial |
| REQ-104 | Save filters | AC-104-1 | TC-206 | ❌ Fail |

### Niveau 3 - Application Pratique

**Checklist de vérification** :
- [ ] Chaque User Story a des critères d'acceptation
- [ ] Chaque critère est testable (vérifiable objectivement)
- [ ] Chaque critère a au moins un cas de test UAT
- [ ] Tous les critères sont tracés dans la matrice
- [ ] Le statut est mis à jour après chaque test

---

## 6.4 UAT Environments

### Niveau 1 - Vulgarisation

L'**environnement UAT** doit être **le plus proche possible de la production** pour que les tests soient représentatifs.

### Niveau 2 - Approfondissement Expert

#### Caractéristiques de l'environnement UAT

| Aspect | Recommandation |
|--------|----------------|
| **Infrastructure** | Même architecture que prod (scaled down OK) |
| **Données** | Données réalistes, anonymisées si sensibles |
| **Intégrations** | Vraies intégrations (sandbox pour paiements) |
| **Performance** | Suffisante pour les tests (pas besoin de prod-scale) |
| **Accès** | Restreint aux testeurs UAT |
| **Refresh** | Rafraîchissement régulier des données |
| **Monitoring** | Logs accessibles pour debug |

#### Données UAT pour e-commerce

```
DONNÉES UAT

CATALOGUE:
- 1000 produits (subset représentatif)
- Toutes les catégories
- Mix de stocks (dispo, low stock, rupture)
- Prix variés (promos, soldes)

UTILISATEURS:
- 50 comptes test avec différents profils
- Historique de commandes
- Adresses variées (France, DOM-TOM, Europe)
- Moyens de paiement sandbox

COMMANDES:
- Historique de commandes (tous statuts)
- Retours et remboursements
- Litiges

CONFIGURATION:
- Frais de port réels
- Promotions actives
- Règles de livraison
```

---

## 6.5 Sign-off Process

### Niveau 1 - Vulgarisation

Le **sign-off** est la **validation formelle** que l'UAT est terminé et que le système est accepté pour la production. C'est comme signer le bon de livraison.

### Niveau 2 - Approfondissement Expert

#### Processus de sign-off

```
UAT SIGN-OFF PROCESS

1. COMPILATION DES RÉSULTATS
   └── Tous les scénarios exécutés
   └── Défauts documentés avec statut
   └── Métriques calculées

2. REVIEW MEETING
   └── Présentation des résultats
   └── Discussion des défauts ouverts
   └── Décision sur les risques résiduels

3. DÉCISION
   └── GO : UAT accepté, release approuvée
   └── CONDITIONAL GO : Avec réserves documentées
   └── NO-GO : Corrections requises, re-test

4. FORMALISATION
   └── Document de sign-off signé
   └── Liste des known issues
   └── Plan de mitigation si conditional

5. ARCHIVAGE
   └── Rapport UAT complet
   └── Evidence des tests
   └── Signatures
```

#### Template de Sign-off

```
═══════════════════════════════════════════════════════════
                    UAT SIGN-OFF DOCUMENT
═══════════════════════════════════════════════════════════

Projet: Refonte Checkout v2.0
Date: 15 janvier 2025
Version testée: 2.0.0-rc1

RÉSUMÉ EXÉCUTIF
───────────────────────────────────────────────────────────
Scénarios exécutés: 45/45 (100%)
Scénarios réussis: 43/45 (95.5%)
Scénarios échoués: 2/45 (4.5%)

Défauts trouvés: 12
- Critiques: 0
- Majeurs: 2 (résolus)
- Mineurs: 7 (5 résolus, 2 acceptés)
- Cosmétiques: 3 (acceptés, backlog)

DÉCISION
───────────────────────────────────────────────────────────
[X] GO - Release approuvée
[ ] CONDITIONAL GO - Avec réserves
[ ] NO-GO - Corrections requises

RÉSERVES / KNOWN ISSUES
───────────────────────────────────────────────────────────
- BUG-234: Affichage prix arrondi sur mobile (mineur)
- BUG-237: Lenteur filtre pays DOM-TOM (cosmétique)

APPROBATIONS
───────────────────────────────────────────────────────────
Product Owner:     _________________ Date: __/__/____
Responsable QA:    _________________ Date: __/__/____
Sponsor Business:  _________________ Date: __/__/____
```

---

## 6.6 Feedback Collection et Triage

### Niveau 1 - Vulgarisation

Pendant l'UAT, les testeurs remontent des **feedbacks** (bugs, suggestions, questions). Il faut les **collecter efficacement** et les **trier** pour décider quoi faire.

### Niveau 2 - Approfondissement Expert

#### Canaux de feedback

| Canal | Usage | Avantage |
|-------|-------|----------|
| **Bug tracker** (Jira, Linear) | Bugs formels | Traçabilité, workflow |
| **Formulaire intégré** | Feedback rapide in-app | Contexte automatique |
| **Slack/Teams channel** | Questions rapides | Réactivité |
| **Session de debrief** | Feedback qualitatif | Discussion, nuances |

#### Process de triage

```
FEEDBACK TRIAGE

1. CATÉGORISATION
   ├── Bug (défaut)
   ├── Enhancement (amélioration)
   ├── Question (clarification)
   └── Out of scope (hors périmètre)

2. PRIORISATION (si bug)
   ├── Severity (impact technique)
   └── Priority (urgence business)

3. DÉCISION
   ├── Fix now (bloquant pour UAT)
   ├── Fix before release
   ├── Fix after release (known issue)
   └── Won't fix (accepté ou hors scope)

4. COMMUNICATION
   └── Informer le rapporteur de la décision
```

---

## 6.7 UAT dans un contexte e-commerce

### Niveau 1 - Vulgarisation

L'UAT e-commerce a des **spécificités** : tester les paiements (sans vraie transaction), vérifier la logistique, simuler les pics de charge.

### Niveau 2 - Approfondissement Expert

#### Scénarios UAT critiques e-commerce

**Tunnel d'achat**
- [ ] Achat guest (sans compte)
- [ ] Achat client connecté
- [ ] Achat avec code promo
- [ ] Achat avec points fidélité
- [ ] Multi-adresses (livraison ≠ facturation)
- [ ] Click & Collect
- [ ] Livraison express

**Paiements**
- [ ] Carte bancaire (Visa, Mastercard, Amex)
- [ ] PayPal
- [ ] Apple Pay / Google Pay
- [ ] Paiement en 3x/4x
- [ ] Carte cadeau
- [ ] Échec paiement et retry
- [ ] 3D Secure

**Gestion commande**
- [ ] Suivi de commande
- [ ] Modification commande (si possible)
- [ ] Annulation commande
- [ ] Retour produit
- [ ] Remboursement

**Cas particuliers**
- [ ] Produit en rupture pendant checkout
- [ ] Promotion expirée pendant checkout
- [ ] Session timeout
- [ ] Multi-devises (si applicable)
- [ ] TVA intra-EU / export

### Niveau 3 - Application Pratique

#### Environnement de test paiement

| Provider | Mode Test |
|----------|-----------|
| Stripe | Test mode avec cartes test (4242...) |
| PayPal | Sandbox accounts |
| Adyen | Test environment |
| Alma (3x) | Sandbox |

**Cartes de test Stripe** :
- `4242 4242 4242 4242` : Succès
- `4000 0000 0000 0002` : Refusée
- `4000 0027 6000 3184` : Requiert 3DS

---

# Section 7 : Gestion des Bugs

---

## 7.1 Bug Lifecycle

### Niveau 1 - Vulgarisation

Un bug suit un **cycle de vie** depuis sa découverte jusqu'à sa résolution (ou son rejet). Comprendre ce cycle permet de suivre efficacement l'état de chaque défaut.

**Analogie** : C'est comme le suivi d'un colis : commandé → expédié → en transit → livré. Chaque étape a un statut clair.

### Niveau 2 - Approfondissement Expert

#### Cycle de vie standard

```
    ┌─────────┐
    │   NEW   │ ◄── Bug découvert et rapporté
    └────┬────┘
         │
         ▼
    ┌─────────┐
    │  OPEN   │ ◄── Bug confirmé, assigné
    └────┬────┘
         │
    ┌────┴────────────────────────────┐
    │                                  │
    ▼                                  ▼
┌─────────┐                      ┌──────────┐
│IN PROGRESS│                    │ REJECTED │ ◄── Non reproductible,
└────┬────┘                      └──────────┘     ou "by design"
     │
     ▼
┌─────────┐
│  FIXED  │ ◄── Correction implémentée
└────┬────┘
     │
     ▼
┌─────────┐
│IN REVIEW│ ◄── Code review / QA review
└────┬────┘
     │
     ▼
┌─────────┐          ┌──────────┐
│VERIFIED │──────────▶│ REOPENED │ ◄── Fix incorrect
└────┬────┘          └──────────┘
     │                     │
     │                     │
     ▼                     │
┌─────────┐                │
│ CLOSED  │ ◄──────────────┘
└─────────┘
```

#### États possibles

| État | Description | Responsable |
|------|-------------|-------------|
| **New** | Vient d'être créé | Rapporteur |
| **Open** | Confirmé, en attente d'assignation | QA Lead |
| **Assigned** | Assigné à un développeur | Dev assigné |
| **In Progress** | Développeur travaille dessus | Dev |
| **Fixed** | Correction commitée | Dev |
| **In Review** | En code review | Reviewer |
| **Ready for QA** | Prêt pour vérification | QA |
| **Verified** | Fix vérifié fonctionnel | QA |
| **Closed** | Résolu définitivement | QA/PM |
| **Reopened** | Fix incorrect, bug persiste | QA |
| **Rejected** | Pas un bug (by design, duplicate, etc.) | QA/Dev |
| **Deferred** | Reporté à une version future | PM |
| **Won't Fix** | Ne sera pas corrigé (accepté) | PM |

### Niveau 3 - Application Pratique

#### Configuration Jira typique

```
WORKFLOW JIRA - BUG

Transitions autorisées :
- New → Open (triage)
- Open → In Progress | Rejected | Deferred
- In Progress → Fixed | Won't Fix
- Fixed → In Review
- In Review → Ready for QA | In Progress (fix needed)
- Ready for QA → Verified | Reopened
- Verified → Closed
- Reopened → In Progress
- Deferred → Open (repriorisation)

Champs obligatoires par transition :
- Open → In Progress : Assignee
- In Progress → Fixed : Fix Version, Commit Link
- Ready for QA → Verified : Test Evidence
- * → Rejected : Reason
```

---

## 7.2 Bug Report Writing

### Niveau 1 - Vulgarisation

Un **bon rapport de bug** permet au développeur de **comprendre et reproduire le problème** rapidement. Un mauvais rapport fait perdre du temps à tout le monde.

**Règle d'or** : Imaginez que quelqu'un qui n'a jamais vu l'application doit reproduire le bug. Donnez-lui TOUTES les informations nécessaires.

### Niveau 2 - Approfondissement Expert

#### Structure d'un bug report

| Champ | Description | Exemple |
|-------|-------------|---------|
| **Title** | Résumé clair et concis | "[Checkout] Erreur 500 lors du paiement PayPal sur mobile" |
| **Environment** | Où le bug se produit | Staging, Chrome 120, iPhone 14 |
| **Preconditions** | État initial requis | Utilisateur connecté, panier avec 2 articles |
| **Steps to Reproduce** | Étapes exactes | 1. Aller au panier 2. Cliquer "Payer" 3. Choisir PayPal... |
| **Expected Result** | Ce qui devrait se passer | Redirection vers PayPal |
| **Actual Result** | Ce qui se passe réellement | Page erreur 500 |
| **Severity** | Impact technique | Critical / Major / Minor / Trivial |
| **Priority** | Urgence business | P1 / P2 / P3 / P4 |
| **Attachments** | Preuves | Screenshots, vidéos, logs |
| **Workaround** | Solution temporaire | Utiliser CB au lieu de PayPal |

#### Template de bug report

```markdown
## [Checkout] Erreur 500 lors du paiement PayPal sur mobile

### Environment
- **URL**: https://staging.example.com
- **Browser**: Chrome 120.0.6099.109 (Mobile)
- **Device**: iPhone 14 Pro (iOS 17.2)
- **User**: test-user-42@example.com

### Preconditions
- Utilisateur connecté
- Panier contenant au moins 1 article
- Adresse de livraison renseignée

### Steps to Reproduce
1. Accéder au panier (`/cart`)
2. Cliquer sur "Procéder au paiement"
3. Remplir les informations de livraison
4. Sélectionner "PayPal" comme moyen de paiement
5. Cliquer sur "Payer avec PayPal"

### Expected Result
- Redirection vers la page de connexion PayPal
- Possibilité de finaliser le paiement

### Actual Result
- Page d'erreur 500 affichée
- Message : "Une erreur est survenue. Veuillez réessayer."
- Aucune redirection vers PayPal

### Severity: Critical
### Priority: P1

### Attachments
- Screenshot: [error-500-paypal.png]
- Video: [reproduction-bug.mp4]
- Console logs: [console-errors.txt]

### Additional Information
- Le bug ne se produit PAS sur desktop Chrome
- Le bug se produit aussi sur Safari mobile
- Première occurrence : 12/01/2025 14h30
- Fréquence : 100% reproductible

### Workaround
Utiliser le paiement par carte bancaire ou accéder au site via desktop.
```

#### Bonnes pratiques

**DO** :
- Un bug = un ticket (pas de combo)
- Reproduire avant de reporter
- Inclure les logs/stack traces
- Tester le workaround suggéré

**DON'T** :
- "Ça marche pas" (trop vague)
- Supposer la cause ("C'est un bug JavaScript")
- Reporter des duplicates (chercher d'abord)
- Oublier les infos d'environnement

### Niveau 3 - Application Pratique

#### Outils de capture

| Outil | Usage |
|-------|-------|
| **Loom** | Vidéos de reproduction |
| **Jam** | Capture enrichie (console, network) |
| **Marker.io** | Annotation screenshots |
| **BugHerd** | Feedback visuel in-page |

---

## 7.3 Severity vs Priority

### Niveau 1 - Vulgarisation

- **Severity** (Sévérité) : À quel point le bug est **techniquement grave** ?
- **Priority** (Priorité) : À quel point c'est **urgent business** de le corriger ?

**Exemple** : Une faute d'orthographe sur la homepage (severity: trivial, priority: haute car visible par tous). Un crash dans une feature que personne n'utilise (severity: critical, priority: basse).

### Niveau 2 - Approfondissement Expert

#### Définitions

**Severity (impact technique)**

| Niveau | Définition | Exemple |
|--------|------------|---------|
| **Critical** | Système inutilisable, perte de données, sécurité | Crash app, faille SQL injection |
| **Major** | Fonction majeure non fonctionnelle, pas de workaround | Impossible de payer |
| **Minor** | Fonction impactée mais workaround existe | Filtre cassé, mais recherche fonctionne |
| **Trivial** | Problème cosmétique | Typo, alignement pixel |

**Priority (urgence business)**

| Niveau | Définition | Action |
|--------|------------|--------|
| **P1 - Critical** | Blocker release, impact business immédiat | Fix immédiat (heures) |
| **P2 - High** | Impact significatif, pas de workaround viable | Fix ce sprint |
| **P3 - Medium** | Impact modéré, workaround acceptable | Planifier prochains sprints |
| **P4 - Low** | Impact faible | Backlog, si le temps permet |

#### Matrice Severity × Priority

| | P1 (Now) | P2 (Sprint) | P3 (Soon) | P4 (Later) |
|---|----------|-------------|-----------|------------|
| **Critical** | 🔴 HOTFIX | 🔴 Urgent | 🟠 Plan | 🟡 Review |
| **Major** | 🔴 Urgent | 🟠 High | 🟡 Normal | 🟢 Low |
| **Minor** | 🟠 High | 🟡 Normal | 🟢 Low | 🟢 Backlog |
| **Trivial** | 🟡 Normal | 🟢 Low | 🟢 Backlog | 🔵 Optional |

**Cas spéciaux** :
- Severity Critical + Priority Low = Rare mais possible (feature non utilisée)
- Severity Trivial + Priority High = Visible par tous (homepage)

### Niveau 3 - Application Pratique

#### Qui décide ?

| Attribut | Décideur | Critère |
|----------|----------|---------|
| Severity | QA / Tech Lead | Impact technique objectif |
| Priority | Product Owner / Business | Valeur business, risque |

**Processus** : QA assigne la severity, PO assigne la priority pendant le triage.

---

## 7.4 Bug Triage Meetings

### Niveau 1 - Vulgarisation

Le **bug triage** est une réunion régulière pour **passer en revue les nouveaux bugs** et décider quoi en faire : corriger, reporter, rejeter.

**Analogie** : C'est comme le tri aux urgences d'un hôpital. On évalue rapidement chaque patient pour décider qui passe en premier.

### Niveau 2 - Approfondissement Expert

#### Format type

```
BUG TRIAGE MEETING

Fréquence: 2-3x par semaine (ou daily si release proche)
Durée: 30 minutes max
Participants: QA Lead, Tech Lead, Product Owner, Dev représentant

Agenda:
1. Review nouveaux bugs (5 min max par bug)
   - Confirmer la reproduction
   - Assigner severity
   - Assigner priority
   - Décider : Fix / Defer / Reject

2. Review bugs bloquants en cours (5 min)
   - Statut des corrections
   - Blockers ?

3. Métriques (2 min)
   - Bugs ouverts par severity
   - Tendances

Règles:
- Time-boxed: Si pas de décision en 5 min → hors-meeting
- Pas de debugging en séance
- Décisions documentées immédiatement
```

#### Décisions possibles

| Décision | Quand | Action |
|----------|-------|--------|
| **Fix** | Bug confirmé, priorité suffisante | Assigner, planifier |
| **Defer** | Pas critique, pas le moment | Mettre en backlog |
| **Reject** | Pas un bug (by design, duplicate) | Fermer avec raison |
| **Need Info** | Manque d'informations | Renvoyer au rapporteur |
| **Investigate** | Cause incertaine | Assigner investigation |

### Niveau 3 - Application Pratique

#### Dashboard de triage

```
BUG DASHBOARD - 15 Janvier 2025

NOUVEAUX (à trier): 8
├── Critical: 1 🔴
├── Major: 3
├── Minor: 2
└── Unclassified: 2

OUVERTS PAR PRIORITY:
├── P1: 2 (objectif: 0)
├── P2: 5 (objectif: < 5)
├── P3: 12
└── P4: 23

TENDANCE (7 jours):
├── Créés: 15
├── Fermés: 18
└── Net: -3 ✅

BUGS CRITIQUES OUVERTS:
1. BUG-456: Paiement échoue aléatoirement (P1, assigned: @dev1, ETA: today)
2. BUG-461: Fuite mémoire checkout (P1, assigned: @dev2, ETA: tomorrow)
```

---

## 7.5 Root Cause Analysis

### Niveau 1 - Vulgarisation

La **Root Cause Analysis (RCA)** cherche à comprendre **pourquoi** un bug s'est produit, pas juste à le corriger. L'objectif : éviter que le même type de bug se reproduise.

**Analogie** : Si votre voiture tombe en panne, réparer le symptôme (batterie morte) ne suffit pas. Il faut comprendre pourquoi (alternateur défaillant) pour éviter la récidive.

### Niveau 2 - Approfondissement Expert

#### Techniques de RCA

**5 Whys (5 Pourquoi)**

Poser "Pourquoi ?" 5 fois pour remonter à la cause racine.

```
Bug: Les emails de confirmation ne sont pas envoyés

Pourquoi 1: Le service d'email a crashé
  Pourquoi 2: Il a manqué de mémoire
    Pourquoi 3: Une boucle infinie créait des objets
      Pourquoi 4: Une condition de sortie était incorrecte
        Pourquoi 5: Le code review n'a pas détecté l'erreur

Cause racine: Process de code review insuffisant pour ce type de code
Action: Ajouter checklist spécifique pour les boucles/récursions
```

**Ishikawa (Fishbone Diagram)**

Catégories de causes :
- **People** : Formation, erreur humaine
- **Process** : Méthodologie, workflow
- **Tools** : Outils défaillants
- **Environment** : Infra, configuration
- **Materials** : Données, inputs
- **Measurement** : Monitoring, alerting

#### Quand faire une RCA

| Situation | RCA requise |
|-----------|-------------|
| Incident production majeur | Oui, obligatoire |
| Bug critique récurrent | Oui |
| Near-miss (évité de justesse) | Recommandé |
| Bug mineur ponctuel | Non nécessaire |

### Niveau 3 - Application Pratique

#### Template RCA

```
═══════════════════════════════════════════════════════════
              ROOT CAUSE ANALYSIS REPORT
═══════════════════════════════════════════════════════════

INCIDENT: Perte de commandes du 12 janvier 2025
IMPACT: 47 commandes non enregistrées, ~15,000€ de CA
DURÉE: 2h30 (14h15 - 16h45)

TIMELINE:
- 14h15: Premières alertes monitoring (queue RabbitMQ)
- 14h30: Support signale plaintes clients
- 15h00: Investigation commence
- 15h45: Cause identifiée (disque full)
- 16h15: Fix déployé (cleanup + resize)
- 16h45: Service restauré

ROOT CAUSE ANALYSIS (5 Whys):
1. Pourquoi les commandes n'étaient pas enregistrées ?
   → Le worker de traitement des commandes était arrêté

2. Pourquoi le worker était arrêté ?
   → Il a crashé suite à une erreur d'écriture disque

3. Pourquoi l'écriture disque a échoué ?
   → Le disque était plein à 100%

4. Pourquoi le disque était plein ?
   → Les logs n'étaient pas rotés depuis 3 mois

5. Pourquoi les logs n'étaient pas rotés ?
   → La tâche cron de rotation avait été désactivée
      lors d'une maintenance et jamais réactivée

CAUSE RACINE: Absence de vérification post-maintenance

ACTIONS CORRECTIVES:
1. [Immédiat] Réactiver la rotation de logs ✅
2. [Court terme] Ajouter alerte sur espace disque > 80%
3. [Moyen terme] Checklist de fin de maintenance obligatoire
4. [Long terme] Revue des processus de maintenance

RESPONSABLE: @ops-lead
SUIVI: Weekly check pendant 1 mois
```

---

## 7.6 Defect Metrics

### Niveau 1 - Vulgarisation

Les **métriques de défauts** permettent de **mesurer la qualité** du produit et du processus de test. Sans métriques, on navigue à l'aveugle.

### Niveau 2 - Approfondissement Expert

#### Métriques clés

| Métrique | Formule | Interprétation |
|----------|---------|----------------|
| **Defect Density** | Bugs / KLOC ou Bugs / Story Points | Qualité du code |
| **Defect Escape Rate** | Bugs prod / Bugs totaux | Efficacité des tests |
| **Defect Removal Efficiency** | Bugs pré-prod / Bugs totaux | Idem, autre angle |
| **Mean Time to Resolution** | Σ(temps résolution) / N bugs | Efficacité équipe |
| **Defect Reopen Rate** | Bugs réouverts / Bugs fermés | Qualité des fixes |
| **Defect Age** | Jours depuis création | Vélocité de résolution |

#### Formules détaillées

**Defect Density** :
```
Defect Density = Nombre de défauts / Taille du projet

Exemple:
- 45 bugs pour 15,000 lignes de code
- Density = 45 / 15 = 3 bugs / KLOC
- Benchmark: < 5 bugs/KLOC acceptable, < 1 excellent
```

**Defect Escape Rate** :
```
DER = Bugs trouvés en production / Total bugs trouvés × 100

Exemple:
- 10 bugs trouvés en production
- 90 bugs trouvés avant production
- DER = 10 / 100 × 100 = 10%
- Objectif: < 5%
```

**Defect Removal Efficiency** :
```
DRE = Bugs trouvés avant release / Total bugs × 100

Exemple:
- DRE = 90 / 100 × 100 = 90%
- Objectif: > 95%
```

#### Dashboard métriques

```
QUALITY METRICS DASHBOARD - Sprint 23

DEFECT DENSITY
├── This sprint: 2.3 bugs/SP
├── Average: 2.8 bugs/SP
└── Trend: ↓ Improving

DEFECT ESCAPE RATE
├── This quarter: 6.2%
├── Previous: 8.5%
└── Target: < 5%

MTTR (Mean Time to Resolution)
├── Critical: 4h (target: < 8h) ✅
├── Major: 2.1 days (target: < 3d) ✅
├── Minor: 5.2 days (target: < 7d) ✅
└── Overall: 3.4 days

DEFECT BY STATUS
├── Open: 23
├── In Progress: 8
├── Fixed (awaiting QA): 5
└── Closed this sprint: 31

DEFECT BY ROOT CAUSE
├── Logic error: 35%
├── Edge case missed: 25%
├── Integration issue: 20%
├── UI/UX: 12%
└── Other: 8%
```

### Niveau 3 - Application Pratique

#### Utilisation des métriques

| Métrique | Utilisé pour |
|----------|--------------|
| Defect Density | Évaluer la qualité du code, identifier hotspots |
| Escape Rate | Évaluer l'efficacité des tests |
| MTTR | Planification des capacités |
| Reopen Rate | Qualité des revues de code |
| Root Cause Distribution | Amélioration des processus |

---

# Section 8 : Décision Go/No-Go

---

## 8.1 Release Criteria et Exit Criteria

### Niveau 1 - Vulgarisation

Les **exit criteria** définissent **quand on peut considérer la phase de test terminée**. Les **release criteria** définissent **quand le produit est prêt pour la production**.

**Analogie** : Pour un examen, les exit criteria disent "vous avez terminé quand vous avez répondu à toutes les questions". Les release criteria disent "vous êtes admis si vous avez au moins 10/20".

### Niveau 2 - Approfondissement Expert

#### Exit Criteria (Phase Test)

Conditions pour considérer la phase de test terminée :

| Critère | Seuil exemple |
|---------|---------------|
| Test coverage | > 80% code, 100% requirements |
| Test execution | 100% des tests planifiés exécutés |
| Pass rate | > 95% des tests passent |
| Critical bugs | 0 ouvert |
| Major bugs | Tous assignés avec ETA |
| Test documentation | Rapport complet |
| UAT | Sign-off obtenu |

#### Release Criteria (Go-Live)

Conditions pour mettre en production :

| Catégorie | Critère | Seuil |
|-----------|---------|-------|
| **Fonctionnel** | Critical/Blocker bugs | 0 |
| **Fonctionnel** | Major bugs | < 3 avec workaround |
| **Performance** | Page load time | < 3s |
| **Performance** | API response time P95 | < 500ms |
| **Sécurité** | OWASP Top 10 | 0 critical vulnerability |
| **Sécurité** | Dependencies | 0 known critical CVE |
| **Accessibilité** | WCAG AA | Compliance |
| **Documentation** | Release notes | Complètes |
| **Operations** | Rollback plan | Testé |
| **Operations** | Monitoring | Dashboards prêts |
| **Business** | UAT sign-off | Obtenu |

### Niveau 3 - Application Pratique

#### Template Exit Criteria

```
EXIT CRITERIA - PHASE TEST
═══════════════════════════════════════════════════════════

Projet: Checkout v2.0
Date évaluation: 18/01/2025

FONCTIONNEL
├── [✅] Test coverage: 85% (target: >80%)
├── [✅] Tests exécutés: 450/450 (100%)
├── [✅] Pass rate: 97% (target: >95%)
├── [✅] Critical bugs: 0 (target: 0)
├── [✅] Major bugs: 2 open, tous avec workaround
└── [✅] UAT sign-off: obtenu 17/01

PERFORMANCE
├── [✅] Load test: 500 users concurrent OK
├── [✅] Page load: 2.1s (target: <3s)
└── [✅] API P95: 320ms (target: <500ms)

SÉCURITÉ
├── [✅] SAST scan: 0 critical, 2 medium (accepted)
├── [✅] DAST scan: 0 findings
├── [✅] Dependency check: 0 critical CVE
└── [⚠️] Pen test: Planifié post-release

DOCUMENTATION
├── [✅] Release notes: complètes
├── [✅] API docs: à jour
└── [✅] Runbook: mis à jour

VERDICT: ✅ EXIT CRITERIA MET
```

---

## 8.2 Quality Gates

### Niveau 1 - Vulgarisation

Les **Quality Gates** sont des **checkpoints automatisés** qui bloquent la progression si la qualité n'est pas au niveau requis. C'est comme un tourniquet qui ne s'ouvre que si vous avez le bon badge.

### Niveau 2 - Approfondissement Expert

#### Quality Gates par étape

```
CODE ──▶ GATE 1 ──▶ BUILD ──▶ GATE 2 ──▶ DEPLOY ──▶ GATE 3 ──▶ RELEASE
         │                    │                    │
         │                    │                    │
         ▼                    ▼                    ▼
    ┌─────────┐          ┌─────────┐          ┌─────────┐
    │ Lint    │          │ Tests   │          │ UAT     │
    │ SAST    │          │ pass    │          │ Sign-off│
    │ Coverage│          │ Perf OK │          │ Criteria│
    └─────────┘          └─────────┘          └─────────┘
```

#### Configuration SonarQube Quality Gate

```yaml
# sonar-project.properties
sonar.qualitygate.wait=true

# Quality Gate Conditions (exemple)
# - Coverage on New Code >= 80%
# - Duplicated Lines on New Code <= 3%
# - Maintainability Rating on New Code is A
# - Reliability Rating on New Code is A
# - Security Rating on New Code is A
# - Security Hotspots Reviewed >= 100%
```

### Niveau 3 - Application Pratique

#### Gates e-commerce

| Gate | Quand | Critères | Bloquant |
|------|-------|----------|----------|
| **Commit Gate** | Push | Lint, format, unit tests | Oui |
| **PR Gate** | Pull Request | Coverage > 80%, SAST clean | Oui |
| **Build Gate** | CI | Integration tests pass | Oui |
| **Deploy Gate** | Pre-staging | E2E smoke pass | Oui |
| **Release Gate** | Pre-prod | Full regression, perf, UAT | Oui |

---

## 8.3 Go/No-Go Checklist

### Niveau 1 - Vulgarisation

La **checklist Go/No-Go** est la liste complète des éléments à vérifier avant de décider si on lance ou non en production.

### Niveau 2 - Approfondissement Expert

#### Checklist complète

```
GO/NO-GO CHECKLIST
═══════════════════════════════════════════════════════════

QUALITÉ
├── [ ] Tous les tests critiques passent
├── [ ] Aucun bug Critical/Blocker ouvert
├── [ ] Coverage > seuil défini
├── [ ] UAT sign-off obtenu
└── [ ] Known issues documentés et acceptés

PERFORMANCE
├── [ ] Load test validé
├── [ ] Performance baseline respectée
├── [ ] CDN configuré
└── [ ] Auto-scaling testé

SÉCURITÉ
├── [ ] Scan sécurité passé
├── [ ] Secrets rotés si nécessaire
├── [ ] Backup vérifié
└── [ ] SSL/TLS configuré

OPÉRATIONS
├── [ ] Runbook à jour
├── [ ] Monitoring configuré
├── [ ] Alerting en place
├── [ ] On-call identifié
├── [ ] Rollback testé
└── [ ] Capacité suffisante

COMMUNICATION
├── [ ] Release notes prêtes
├── [ ] Équipe support informée
├── [ ] Clients prévenus (si breaking changes)
└── [ ] Communication interne faite

BUSINESS
├── [ ] Pas de conflit calendrier (Black Friday, etc.)
├── [ ] Équipe disponible post-release
├── [ ] Sponsor business OK
└── [ ] Legal/Compliance OK

DÉCISION: [ ] GO  [ ] NO-GO  [ ] CONDITIONNEL

Si NO-GO, raisons:
_________________________________________________

Si CONDITIONNEL, conditions:
_________________________________________________

Signataires:
- Tech Lead: _________________ Date: __/__/__
- QA Lead: __________________ Date: __/__/__
- Product Owner: _____________ Date: __/__/__
- Ops Lead: _________________ Date: __/__/__
```

---

## 8.4 Risk Acceptance Documentation

### Niveau 1 - Vulgarisation

Parfois, on décide de livrer malgré des risques connus. La **documentation d'acceptation des risques** formalise ces décisions pour protéger tout le monde.

### Niveau 2 - Approfondissement Expert

#### Template Risk Acceptance

```
RISK ACCEPTANCE DOCUMENT
═══════════════════════════════════════════════════════════

Risk ID: RISK-2025-001
Date: 18/01/2025
Project: Checkout v2.0

DESCRIPTION DU RISQUE
─────────────────────────────────────────────────────────
Le bug BUG-789 (affichage incorrect du prix en centimes
d'euros pour les commandes DOM-TOM) n'est pas corrigé
avant la release.

IMPACT
- Probabilité: Moyenne (10% des commandes DOM-TOM)
- Impact: Mineur (confusion visuelle, pas de perte financière)
- Clients affectés: ~50/mois

MITIGATION
- Workaround: Le prix correct apparaît au récapitulatif final
- Communication: Note au service client
- Fix planifié: Sprint suivant (release 2.0.1)

DÉCISION
[X] Risque accepté  [ ] Risque refusé

JUSTIFICATION
Le volume de commandes DOM-TOM est faible et le workaround
existe. Reporter la release aurait un coût business supérieur.

APPROBATIONS
- Product Owner: Marie D. __________ Date: 18/01/2025
- Tech Lead: Pierre M. _____________ Date: 18/01/2025
- Sponsor: Jean-Claude R. __________ Date: 18/01/2025
```

---

## 8.5 Stakeholder Sign-off

### Niveau 1 - Vulgarisation

Le **sign-off des parties prenantes** est l'accord formel des décideurs pour la mise en production. C'est le "feu vert" officiel.

### Niveau 2 - Approfondissement Expert

#### Qui doit signer

| Rôle | Responsabilité | Signe pour |
|------|----------------|------------|
| **Product Owner** | Vision produit | Fonctionnalités conformes |
| **Tech Lead** | Architecture | Stabilité technique |
| **QA Lead** | Qualité | Tests suffisants |
| **Ops Lead** | Opérations | Déployable, monitorable |
| **Security** | Sécurité | Pas de vulnérabilité critique |
| **Business Sponsor** | Business | ROI, timing OK |

---

## 8.6 Release Readiness Review

### Niveau 1 - Vulgarisation

La **Release Readiness Review** est la réunion finale où tous les stakeholders valident ensemble que tout est prêt pour le Go-Live.

### Niveau 2 - Approfondissement Expert

#### Agenda type

```
RELEASE READINESS REVIEW
─────────────────────────────────────────────────────────

Date: 18/01/2025 15h00
Durée: 1h
Participants: PO, Tech Lead, QA Lead, Ops, Business Sponsor

AGENDA

1. Résumé exécutif (5 min)
   - Scope de la release
   - Dates clés

2. Statut Qualité (10 min)
   - Résultats des tests
   - Bugs ouverts
   - Coverage

3. Statut Technique (10 min)
   - Changements d'architecture
   - Dépendances
   - Performance

4. Statut Opérations (10 min)
   - Plan de déploiement
   - Rollback
   - Monitoring

5. Risques et Known Issues (10 min)
   - Risques identifiés
   - Mitigation
   - Acceptation

6. Checklist Go/No-Go (10 min)
   - Revue point par point

7. Décision (5 min)
   - Vote Go / No-Go / Conditionnel
   - Actions si No-Go

OUTPUT: Décision documentée et signée
```

---

# Section 9 : Questions Transversales

---

## 9.1 Combien de tests automatisés est "assez" ?

### Réponse courte

Il n'y a pas de chiffre magique. L'objectif n'est pas un pourcentage mais une **confiance suffisante** pour déployer sereinement.

### Indicateurs pratiques

| Indicateur | Bon signe | Mauvais signe |
|------------|-----------|---------------|
| Escape rate | < 5% bugs en prod | > 10% bugs en prod |
| Déploiement | Confiance à déployer sans stress | Peur de casser quelque chose |
| Feedback | < 15 min pour savoir si c'est cassé | Découverte le lendemain |
| Régression | Rare | Fréquente |

### Seuils indicatifs par contexte

| Contexte | Unit | Integration | E2E | Total Coverage |
|----------|------|-------------|-----|----------------|
| MVP/Startup | 50% | Smoke | Critical paths | 40-50% |
| SaaS B2B | 70% | Core flows | Happy paths | 60-70% |
| E-commerce | 80% | Payments, Cart | Checkout, Account | 70-80% |
| Fintech/Santé | 90%+ | Complet | Complet | 85%+ |

---

## 9.2 Balance automated vs manual testing

### Matrice de décision

| Critère | Automatiser | Garder manuel |
|---------|-------------|---------------|
| Fréquence | Répétitif | Ponctuel |
| Stabilité | Comportement stable | Fonctionnalité volatile |
| Valeur | Critique, regression | Exploration, UX |
| ROI | Positif sur 6 mois | Négatif |
| Compétence | Humain = machine | Humain > machine |

### Répartition type

```
EFFORT DE TEST

┌─────────────────────────────────────────────────────────┐
│                                                         │
│  AUTOMATISÉ (70-80%)                                   │
│  ├── Unit tests                                        │
│  ├── Integration tests                                 │
│  ├── E2E regression                                    │
│  ├── Performance tests                                 │
│  └── Security scans                                    │
│                                                         │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  MANUEL (20-30%)                                       │
│  ├── Exploratory testing                               │
│  ├── Usability testing                                 │
│  ├── UAT                                               │
│  ├── Edge cases complexes                              │
│  └── Nouvelles fonctionnalités (avant automation)      │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 9.3 QA intégré à l'équipe vs QA team séparée

### Comparaison

| Aspect | QA intégré (embedded) | QA team séparée |
|--------|----------------------|-----------------|
| **Avantages** | Feedback rapide, ownership | Expertise centralisée, standards |
| | Shift-left naturel | Vision cross-projet |
| | Moins de "handoff" | Indépendance |
| **Inconvénients** | Dilution expertise | Silos, "mur" |
| | Pression sprint | Feedback tardif |
| | Isolation | Moins d'ownership |
| **Convient à** | Agile, petites équipes | Grandes organisations, compliance |

### Recommandation

**Modèle hybride** :
- QA embedded dans chaque équipe pour le quotidien
- QA Chapter/Guild pour le partage de pratiques
- QA centralisé pour les sujets transverses (sécurité, perf, outils)

---

## 9.4 Testing sous pression temporelle

### Stratégies

Quand le temps manque, **prioriser par le risque** :

```
STRATÉGIE "TIME-CRUNCH"

TOUJOURS TESTER (même en urgence):
├── Parcours critique (checkout, login)
├── Changements de code à haut risque
├── Smoke test post-déploiement
└── Security basics

SI UN PEU DE TEMPS:
├── Happy paths des nouvelles features
├── Regression sur zones modifiées
└── Cross-browser sur critiques

SI PLUS DE TEMPS:
├── Edge cases
├── Performance basique
└── Full regression

ACCEPTER DE NE PAS FAIRE:
├── Tests exhaustifs sur features secondaires
├── Full cross-browser/device
└── Performance optimization tests
```

### Communication

**Documenter les compromis** :
- Ce qui a été testé
- Ce qui n'a pas été testé (et pourquoi)
- Risques associés acceptés

---

## 9.5 Testing en solo (one-person QA)

### Priorités pour un QA solo

```
STRATÉGIE ONE-PERSON QA

SEMAINE TYPE:
├── Lundi: Triage bugs, planification
├── Mardi-Mercredi: Tests manuels nouvelles features
├── Jeudi: Maintenance automation, code review tests
└── Vendredi: Exploratory, reporting

INVESTIR DANS:
├── Automation des smokes (ROI max)
├── Templates et checklists
├── Self-service pour devs (lint, unit tests)
└── Documentation claire

DÉLÉGUER AUX DEVS:
├── Unit tests (obligatoire)
├── Integration tests basiques
├── Fix + verify propre bug
└── Code review orientée qualité

NE PAS FAIRE:
├── Tout automatiser
├── Tester chaque détail
├── Être le seul à connaître l'app
└── Gatekeeping sans collaboration
```

---

## 9.6 Spécificités du testing e-commerce

### Zones critiques

| Zone | Tests critiques | Risque si échec |
|------|-----------------|-----------------|
| **Checkout** | Tous les moyens de paiement, calculs | Perte de CA directe |
| **Pricing** | Prix, promos, taxes, devises | Perte financière, légal |
| **Inventory** | Stock, réservation, rupture | Sur-vente, clients mécontents |
| **Performance** | Pics de charge (Black Friday) | Site down = CA perdu |
| **Security** | Paiement, données perso | Fraude, RGPD, réputation |

### Checklist spécifique

```
E-COMMERCE TEST CHECKLIST

CATALOGUE
├── [ ] Recherche produits fonctionne
├── [ ] Filtres et tri OK
├── [ ] Stock affiché correctement
├── [ ] Prix et promos corrects
└── [ ] Images chargent

PANIER
├── [ ] Ajout/suppression/modification quantité
├── [ ] Calcul total correct
├── [ ] Promos appliquées correctement
├── [ ] Panier persistant (session, cookie)
└── [ ] Stock réservé/libéré

CHECKOUT
├── [ ] Guest checkout
├── [ ] Compte client checkout
├── [ ] Multi-adresses
├── [ ] Tous moyens de paiement
├── [ ] 3D Secure
├── [ ] Echec paiement + retry
├── [ ] Emails transactionnels
└── [ ] Confirmation commande

COMPTE CLIENT
├── [ ] Inscription
├── [ ] Connexion / déconnexion
├── [ ] Mot de passe oublié
├── [ ] Historique commandes
├── [ ] Gestion adresses
└── [ ] Préférences

POST-ACHAT
├── [ ] Suivi commande
├── [ ] Retours
├── [ ] Remboursements
├── [ ] SAV

MOBILE
├── [ ] Responsive design
├── [ ] Touch interactions
├── [ ] Performance mobile
└── [ ] Paiement mobile (Apple Pay, etc.)
```

---

# Section 10 : Métiers et Compétences

---

## 10.1 QA Engineer / Test Engineer

### Définition du rôle

Le **QA Engineer** (ou Test Engineer) est le professionnel responsable de la **conception, exécution et analyse des tests** pour garantir la qualité du logiciel.

### Responsabilités clés en phase Qualité

| Responsabilité | Description |
|----------------|-------------|
| **Test Planning** | Définir la stratégie de test, estimer l'effort |
| **Test Design** | Concevoir les cas de test, scénarios |
| **Test Execution** | Exécuter les tests manuels et superviser les automatisés |
| **Defect Management** | Rapporter, suivre, vérifier les bugs |
| **Reporting** | Produire les métriques et rapports de qualité |
| **Process Improvement** | Améliorer continuellement les pratiques de test |

### Compétences requises

**Techniques** :
- Méthodologies de test (ISTQB)
- Outils de test management (Jira, TestRail)
- Outils d'automatisation (Selenium, Playwright, Cypress)
- Langages de scripting (JavaScript, Python)
- SQL pour tests base de données
- API testing (Postman, REST)
- CI/CD basics (GitHub Actions, Jenkins)

**Soft skills** :
- Attention aux détails
- Pensée critique et analytique
- Communication écrite (bug reports)
- Collaboration avec développeurs
- Curiosité et persistance

### Parcours type

```
PARCOURS QA ENGINEER

Débutant (0-2 ans)
├── Formation: BTS/DUT Info, Bootcamp, Autodidacte
├── Rôle: QA Manual Tester, Junior QA
├── Focus: Tests manuels, bug reports, process de base
└── Salaire FR: 28-35k€

Confirmé (2-5 ans)
├── Évolution: QA Engineer
├── Focus: Automation, test design, stratégie
├── Certifications: ISTQB Foundation, ISTQB Agile
└── Salaire FR: 38-48k€

Senior (5+ ans)
├── Évolution: Senior QA, QA Lead
├── Focus: Architecture test, mentoring, process
├── Certifications: ISTQB Advanced (TA, TM)
└── Salaire FR: 50-65k€

Expert/Management
├── Évolution: QA Manager, Head of QA, Quality Director
├── Focus: Stratégie org, équipes, transformation
└── Salaire FR: 65-90k€+
```

### Certifications reconnues

| Certification | Organisme | Niveau | Description |
|---------------|-----------|--------|-------------|
| **ISTQB CTFL** | ISTQB | Foundation | Base essentielle |
| **ISTQB CTFL-AT** | ISTQB | Foundation | Agile Tester |
| **ISTQB CTAL-TA** | ISTQB | Advanced | Test Analyst |
| **ISTQB CTAL-TM** | ISTQB | Advanced | Test Manager |
| **ISTQB CTAL-TAE** | ISTQB | Advanced | Test Automation Engineer |
| **CAT** | QAI | - | Certified Associate Tester |
| **PSM I** | Scrum.org | - | Pour contexte Agile |

### Évolution de carrière

```
                    ┌─────────────────┐
                    │  CTO / VP Eng   │
                    └────────┬────────┘
                             │
           ┌─────────────────┼─────────────────┐
           │                 │                 │
  ┌────────▼────────┐ ┌──────▼──────┐ ┌───────▼───────┐
  │ Head of Quality │ │ Engineering │ │    Product    │
  │    / QA Dir     │ │   Manager   │ │    Manager    │
  └────────┬────────┘ └─────────────┘ └───────────────┘
           │
  ┌────────▼────────┐
  │   QA Manager    │
  └────────┬────────┘
           │
  ┌────────▼────────┐
  │    QA Lead      │
  └────────┬────────┘
           │
  ┌────────▼────────┐
  │  Senior QA Eng  │◄─────────────────┐
  └────────┬────────┘                  │
           │                           │
  ┌────────▼────────┐         ┌────────┴────────┐
  │    QA Engineer  │         │     SDET        │
  └────────┬────────┘         └─────────────────┘
           │
  ┌────────▼────────┐
  │ Junior QA / QA  │
  │    Analyst      │
  └─────────────────┘
```

---

## 10.2 QA Lead / Test Manager

### Définition du rôle

Le **QA Lead** ou **Test Manager** supervise une équipe de QA et est responsable de la **stratégie de test globale** d'un projet ou d'un produit.

### Responsabilités clés

| Responsabilité | Description |
|----------------|-------------|
| **Test Strategy** | Définir et faire évoluer la stratégie de test |
| **Team Management** | Gérer l'équipe QA (recrutement, formation, objectifs) |
| **Planning** | Estimer et planifier les activités de test |
| **Coordination** | Interface avec dev leads, PO, stakeholders |
| **Quality Metrics** | Définir et suivre les KPIs qualité |
| **Process** | Établir et améliorer les processus QA |
| **Risk Management** | Identifier et gérer les risques qualité |

### Compétences requises

**Techniques** :
- Toutes les compétences QA Engineer
- Expérience en automatisation
- Connaissance approfondie CI/CD
- Métriques et reporting avancé
- Gestion de budget test

**Management** :
- Leadership d'équipe
- Gestion des conflits
- Communication stakeholders
- Négociation (ressources, délais)
- Recrutement et évaluation

### Certifications recommandées

- **ISTQB CTAL-TM** (Test Manager)
- **ISTQB Expert Level Test Management**
- **PMP** ou **PMI-ACP** (gestion de projet)
- **SAFe** (contexte Agile scale)

### Salaire indicatif

| Niveau | France | International (US/UK) |
|--------|--------|----------------------|
| QA Lead | 50-65k€ | $90-130k / £60-80k |
| Test Manager | 60-80k€ | $110-150k / £70-100k |
| Head of QA | 80-120k€ | $150-200k / £100-140k |

**[À VÉRIFIER]** : Ces fourchettes sont indicatives et varient selon la région, la taille de l'entreprise et le secteur.

---

## 10.3 SDET (Software Development Engineer in Test)

### Définition du rôle

Le **SDET** est un hybride entre développeur et testeur, spécialisé dans l'**automatisation des tests** et les **outils de qualité**. Il écrit du code de test avec les mêmes standards qu'un développeur.

### Différence avec QA Engineer

| Aspect | QA Engineer | SDET |
|--------|-------------|------|
| Focus | Qualité globale, tests variés | Automatisation, tooling |
| Code | Scripting basique | Développement avancé |
| Ratio dev/test | 30/70 | 70/30 |
| Frameworks | Utilise | Crée, maintient |
| Tests manuels | Fréquents | Rares |

### Responsabilités clés

| Responsabilité | Description |
|----------------|-------------|
| **Test Automation** | Développer et maintenir les frameworks de test |
| **CI/CD Integration** | Intégrer les tests dans les pipelines |
| **Tooling** | Créer des outils internes de test |
| **Code Review** | Participer aux reviews (code de test et prod) |
| **Infrastructure** | Gérer les environnements de test |
| **Mentoring** | Former les QA à l'automation |

### Compétences requises

**Techniques** :
- Langages de programmation (JavaScript/TypeScript, Python, Java)
- Frameworks de test (Playwright, Cypress, Selenium, pytest)
- Design patterns (Page Object, Factory, etc.)
- Architecture logicielle
- Docker, Kubernetes basics
- Cloud (AWS, GCP, Azure)
- Git avancé

**Qualité** :
- Principes de test (ISTQB)
- Test design
- Analyse de risques

### Parcours type

```
PARCOURS SDET

Option A: QA → SDET
├── QA Engineer (2-3 ans)
├── Formation dev intensive
├── Transition progressive vers automation
└── SDET Junior puis confirmé

Option B: Dev → SDET
├── Developer (2-3 ans)
├── Intérêt pour la qualité
├── Formation testing (ISTQB)
└── SDET

Évolution SDET:
├── Senior SDET
├── Staff SDET / Principal
├── Test Architect
└── Engineering Manager (Test Platform)
```

### Salaire indicatif

| Niveau | France | International |
|--------|--------|---------------|
| SDET Junior | 38-45k€ | $80-100k |
| SDET Confirmé | 48-60k€ | $100-140k |
| Senior SDET | 60-80k€ | $140-180k |
| Staff SDET | 80-100k€ | $180-220k |

---

## 10.4 Test Automation Engineer

### Définition du rôle

Le **Test Automation Engineer** est spécialisé dans l'**automatisation des tests** sans nécessairement avoir le profil développeur du SDET. Focus sur l'utilisation des outils plutôt que leur création.

### Différence avec SDET

| Aspect | Test Automation Engineer | SDET |
|--------|-------------------------|------|
| Profil | QA orienté automation | Dev orienté test |
| Code | Scripts, configuration | Architecture, frameworks |
| Création outils | Rare | Fréquent |
| Tests manuels | Occasionnels | Très rares |

### Compétences requises

- Outils d'automatisation (Playwright, Cypress, Selenium)
- Scripting (JavaScript, Python)
- CI/CD (Jenkins, GitHub Actions)
- API testing
- Gestion de données de test
- Reporting et analyse

### Certifications

- **ISTQB CTAL-TAE** (Test Automation Engineer)
- Certifications outils spécifiques (Selenium, etc.)

---

## 10.5 Performance Engineer

### Définition du rôle

Le **Performance Engineer** est spécialisé dans les **tests de performance** : charge, stress, endurance, scalabilité. Il identifie les goulots d'étranglement et optimise les performances.

### Responsabilités clés

| Responsabilité | Description |
|----------------|-------------|
| **Performance Testing** | Concevoir et exécuter les tests de charge |
| **Analysis** | Analyser les résultats, identifier les bottlenecks |
| **Optimization** | Recommander des optimisations |
| **Monitoring** | Mettre en place le monitoring de performance |
| **Capacity Planning** | Aider à dimensionner l'infrastructure |
| **Benchmarking** | Établir et suivre les baselines |

### Compétences requises

**Techniques** :
- Outils de load testing (k6, JMeter, Gatling)
- Profiling et APM (New Relic, Datadog, Dynatrace)
- Infrastructure (servers, load balancers, CDN)
- Databases (query optimization, indexing)
- Networking basics
- Scripting (Python, JavaScript)
- Cloud services (auto-scaling, etc.)

**Analytiques** :
- Analyse de données
- Statistiques
- Visualisation (Grafana)
- Root cause analysis

### Certifications

- Pas de certification standardisée dominante
- Certifications cloud (AWS, GCP) utiles
- ISTQB Performance Testing (module spécialisé)

### Salaire indicatif

| Niveau | France |
|--------|--------|
| Junior | 40-50k€ |
| Confirmé | 50-65k€ |
| Senior | 65-85k€ |
| Expert | 85-110k€ |

---

## 10.6 Security Tester / Penetration Tester

### Définition du rôle

Le **Security Tester** (ou **Penetration Tester / Ethical Hacker**) est spécialisé dans l'**identification des vulnérabilités** de sécurité via des tests offensifs.

### Responsabilités clés

| Responsabilité | Description |
|----------------|-------------|
| **Penetration Testing** | Tests d'intrusion (web, mobile, réseau) |
| **Vulnerability Assessment** | Identification des failles |
| **Security Audits** | Audits de conformité (OWASP, PCI-DSS) |
| **Reporting** | Rapports de vulnérabilités avec remédiation |
| **Red Teaming** | Simulation d'attaques réalistes |
| **Security Training** | Former les équipes dev |

### Compétences requises

**Techniques** :
- OWASP Top 10, WSTG
- Outils : Burp Suite, OWASP ZAP, Metasploit
- Scripting : Python, Bash
- Networking : TCP/IP, protocoles
- Web technologies : HTTP, APIs, OAuth
- Cryptographie basics
- Reverse engineering (avancé)

**Méthodologies** :
- OWASP Testing Guide
- PTES (Penetration Testing Execution Standard)
- NIST Cybersecurity Framework

### Certifications reconnues

| Certification | Organisme | Description |
|---------------|-----------|-------------|
| **CEH** | EC-Council | Certified Ethical Hacker |
| **OSCP** | Offensive Security | Très respectée, pratique |
| **GPEN** | GIAC | Penetration Tester |
| **eJPT** | INE | Entry-level, accessible |
| **CREST** | CREST | Reconnue UK/International |
| **CompTIA Security+** | CompTIA | Base sécurité |
| **CISSP** | (ISC)² | Niveau management |

### Parcours type

```
PARCOURS SECURITY TESTER

Entrée:
├── Dev → Security (shift)
├── Admin sys → Security
├── QA → Security
└── École spécialisée cybersécurité

Progression:
├── Junior Pentester / Security Analyst (0-2 ans)
├── Pentester (2-5 ans)
├── Senior Pentester / Security Consultant (5+ ans)
├── Security Architect / Red Team Lead
└── CISO (Chief Information Security Officer)
```

### Salaire indicatif

| Niveau | France | International |
|--------|--------|---------------|
| Junior | 35-45k€ | $70-90k |
| Confirmé | 50-70k€ | $100-140k |
| Senior | 70-100k€ | $140-200k |
| Expert/Consultant | 100-150k€+ | $200k+ |

---

## Tableau récapitulatif des métiers

| Métier | Focus | Entry Level | Senior | Certification clé |
|--------|-------|-------------|--------|-------------------|
| QA Engineer | Qualité globale | 28-35k€ | 50-65k€ | ISTQB CTFL |
| QA Lead | Management QA | 50-65k€ | 70-90k€ | ISTQB CTAL-TM |
| SDET | Dev + Test | 38-45k€ | 60-80k€ | ISTQB + Dev |
| Test Auto Engineer | Automatisation | 35-42k€ | 55-70k€ | ISTQB TAE |
| Performance Engineer | Performance | 40-50k€ | 65-85k€ | - |
| Security Tester | Sécurité | 35-45k€ | 70-100k€ | OSCP, CEH |

**Note** : Salaires indicatifs France, grandes villes. Varient selon région, secteur, taille entreprise.

---

# Section 11 : Checklist de Phase Qualité

## Checklist complète

```
═══════════════════════════════════════════════════════════
           CHECKLIST PHASE QUALITÉ - E-COMMERCE
═══════════════════════════════════════════════════════════

PRÉPARATION
───────────────────────────────────────────────────────────
□ Test strategy définie et approuvée
□ Test plan documenté
□ Environnements de test configurés
□ Données de test préparées
□ Équipe QA briefée sur le scope
□ Critères d'acceptation clairs pour chaque feature
□ Outils de tracking configurés (Jira, etc.)
□ Access credentials pour tous les testeurs

TESTS FONCTIONNELS
───────────────────────────────────────────────────────────
Unit Tests
□ Coverage > 80%
□ Tous les tests passent
□ Pas de tests désactivés sans raison

Integration Tests
□ APIs testées (tous endpoints critiques)
□ Database operations vérifiées
□ External services mockés/testés

E2E Tests
□ Happy paths automatisés
□ Parcours critique checkout couvert
□ Cross-browser vérifié (Chrome, Safari, Firefox)
□ Mobile responsive testé

Regression
□ Suite de régression exécutée
□ Aucune régression critique

TESTS NON-FONCTIONNELS
───────────────────────────────────────────────────────────
Performance
□ Load test exécuté (charge attendue)
□ Stress test exécuté (limites connues)
□ Response times dans les seuils
□ Core Web Vitals OK (LCP < 2.5s, INP < 200ms, CLS < 0.1)

Sécurité
□ SAST scan clean (0 critical)
□ DAST scan exécuté
□ Dependency check (0 critical CVE)
□ OWASP Top 10 vérifié
□ Headers de sécurité configurés
□ Secrets non exposés

Accessibilité
□ Audit Lighthouse > 90
□ Navigation clavier fonctionnelle
□ Screen reader testé (parcours critique)
□ Contrastes vérifiés

TESTS E-COMMERCE SPÉCIFIQUES
───────────────────────────────────────────────────────────
Catalogue
□ Recherche fonctionne
□ Filtres fonctionnent
□ Prix affichés correctement
□ Stock affiché correctement

Panier
□ Ajout/suppression/modification OK
□ Calculs corrects (sous-total, taxes, shipping)
□ Codes promo fonctionnent
□ Panier persistant

Checkout
□ Guest checkout
□ Checkout utilisateur connecté
□ Toutes les adresses testées (France, DOM-TOM, EU)
□ Tous les moyens de paiement testés
  □ CB Visa/Mastercard
  □ PayPal
  □ Apple Pay / Google Pay
  □ Paiement 3x/4x (si applicable)
□ 3D Secure testé
□ Échec paiement + retry testé
□ Emails transactionnels envoyés

Post-achat
□ Confirmation commande affichée
□ Email confirmation reçu
□ Commande visible dans compte
□ Suivi commande fonctionnel

UAT
───────────────────────────────────────────────────────────
□ Tous les scénarios UAT exécutés
□ Feedback collecté et trié
□ Bugs critiques/majeurs résolus
□ Sign-off obtenu

RELEASE READINESS
───────────────────────────────────────────────────────────
□ Release notes préparées
□ Documentation mise à jour
□ Équipe support formée
□ Monitoring configuré
□ Alerting en place
□ Rollback plan testé
□ On-call identifié
□ Communication planifiée
□ Go/No-Go meeting tenu
□ Toutes les approbations obtenues

═══════════════════════════════════════════════════════════
```

---

# Section 12 : Red Flags et Anti-Patterns

## Tableau des signaux d'alerte

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
| Tests manuels répétitifs | Automation non priorisée | ROI analysis, automatiser |
| Environnement instable | Infra négligée | Investir en test infra |
| Personne ne lit les rapports | Rapports trop longs/complexes | Simplifier, dashboards |
| "Ce n'est pas un bug" | Specs floues | Clarifier acceptance criteria |

---

# Section 13 : Quick Reference

## Testing Quadrants

```
                        Business-Facing
                              │
     ┌────────────────────────┼────────────────────────┐
     │         Q2             │          Q3            │
     │    Functional Tests    │   Exploratory Testing  │
     │    Story Tests         │   Usability Testing    │
     │    [AUTO]              │   UAT [MANUAL]         │
     │                        │                        │
Support──────────────────────────────────────────────────Critique
Team   │         Q1             │          Q4            │Product
     │    Unit Tests          │   Performance Testing  │
     │    Component Tests     │   Security Testing     │
     │    [AUTO]              │   [TOOLS]              │
     │                        │                        │
     └────────────────────────┼────────────────────────┘
                              │
                        Technology-Facing
```

## Test Automation Pyramid

```
            /\
           /  \         E2E (10%)
          /────\        Lent, fragile, cher
         /      \
        /────────\      Integration (20%)
       /          \     Moyen
      /────────────\
     /              \   Unit (70%)
    /────────────────\  Rapide, stable, pas cher
```

## Severity vs Priority

| | Impact Faible | Impact Moyen | Impact Élevé |
|---|---------------|--------------|--------------|
| **Proba Élevée** | P3 | P2 | P1 |
| **Proba Moyenne** | P4 | P3 | P2 |
| **Proba Faible** | P4 | P4 | P3 |

**Severity** (technique) :
- **Critical** : Système inutilisable
- **Major** : Feature majeure cassée
- **Minor** : Problème avec workaround
- **Trivial** : Cosmétique

**Priority** (business) :
- **P1** : Fix immédiat (heures)
- **P2** : Fix ce sprint
- **P3** : Planifié
- **P4** : Backlog

## OWASP Top 10 (2021) - Résumé

| # | Catégorie | Risque | Exemple |
|---|-----------|--------|---------|
| A01 | Broken Access Control | Accès non autorisé | IDOR, privilege escalation |
| A02 | Cryptographic Failures | Données exposées | Passwords en clair |
| A03 | Injection | Exécution de code | SQL injection, XSS |
| A04 | Insecure Design | Failles architecture | Pas de rate limiting |
| A05 | Security Misconfiguration | Mauvaise config | Debug en prod |
| A06 | Vulnerable Components | Dépendances vulnérables | Log4Shell |
| A07 | Auth Failures | Auth faible | Brute force possible |
| A08 | Integrity Failures | Code/données non vérifiés | Supply chain attack |
| A09 | Logging Failures | Pas de monitoring | Intrusion non détectée |
| A10 | SSRF | Requêtes serveur manipulées | Accès réseau interne |

## Métriques clés

| Métrique | Formule | Bon seuil |
|----------|---------|-----------|
| Defect Density | Bugs / KLOC | < 5 |
| Defect Escape Rate | Bugs prod / Total | < 5% |
| Test Pass Rate | Tests pass / Total | > 95% |
| Code Coverage | Lines covered / Total | > 80% |
| MTTR | Avg resolution time | < 3 jours |
| Reopen Rate | Reopened / Closed | < 5% |

## Commandes utiles

```bash
# Jest (JavaScript)
npm test -- --coverage
npm test -- --watchAll

# Playwright
npx playwright test
npx playwright test --ui
npx playwright show-report

# Cypress
npx cypress open
npx cypress run

# k6 (Load testing)
k6 run load-test.js

# OWASP ZAP (CLI)
zap-cli quick-scan https://example.com

# Lighthouse
lighthouse https://example.com --output html
```

---

# Glossaire

| Terme | Définition |
|-------|------------|
| **A/B Testing** | Comparaison de deux versions pour mesurer les performances |
| **Acceptance Criteria** | Conditions pour qu'une feature soit considérée "terminée" |
| **API** | Application Programming Interface |
| **BDD** | Behavior-Driven Development |
| **CI/CD** | Continuous Integration / Continuous Deployment |
| **Coverage** | Pourcentage de code exécuté par les tests |
| **DAST** | Dynamic Application Security Testing |
| **DRE** | Defect Removal Efficiency |
| **E2E** | End-to-End (tests bout en bout) |
| **Flaky Test** | Test instable (parfois passe, parfois échoue) |
| **Happy Path** | Scénario principal sans erreur |
| **i18n** | Internationalization |
| **ISTQB** | International Software Testing Qualifications Board |
| **KPI** | Key Performance Indicator |
| **l10n** | Localization |
| **LCP** | Largest Contentful Paint (Core Web Vital) |
| **Mock** | Simulation d'un composant pour les tests |
| **MTTR** | Mean Time To Resolution |
| **OWASP** | Open Worldwide Application Security Project |
| **POM** | Page Object Model |
| **QA** | Quality Assurance |
| **QC** | Quality Control |
| **RCA** | Root Cause Analysis |
| **Regression** | Bug introduit suite à une modification |
| **ROI** | Return On Investment |
| **SAST** | Static Application Security Testing |
| **SCA** | Software Composition Analysis |
| **SDET** | Software Development Engineer in Test |
| **Shift-Left** | Déplacer les tests plus tôt dans le cycle |
| **Smoke Test** | Test basique de vérification du build |
| **Stub** | Implémentation simplifiée pour tests |
| **SUS** | System Usability Scale |
| **TDD** | Test-Driven Development |
| **UAT** | User Acceptance Testing |
| **WCAG** | Web Content Accessibility Guidelines |
| **WSTG** | Web Security Testing Guide (OWASP) |

---

# Bibliographie et Sources

## Standards et Certifications

- **ISTQB** - International Software Testing Qualifications Board
  - Foundation Level Syllabus v4.0 (2023)
  - https://www.istqb.org/

- **IEEE 829** - Standard for Software and System Test Documentation
  - IEEE 829-2008

- **ISO/IEC 25010** - Software Quality Model
  - https://iso25000.com/index.php/en/iso-25000-standards/iso-25010

- **ISO/IEC/IEEE 29119** - Software Testing Standards
  - Parts 1-5, documentation and processes

## Sécurité

- **OWASP Top 10 (2021)**
  - https://owasp.org/Top10/

- **OWASP Web Security Testing Guide (WSTG) v4.2**
  - https://owasp.org/www-project-web-security-testing-guide/

- **OWASP Application Security Verification Standard (ASVS)**
  - https://owasp.org/www-project-application-security-verification-standard/

## Accessibilité

- **WCAG 2.2** - Web Content Accessibility Guidelines
  - https://www.w3.org/WAI/WCAG22/quickref/

- **WAI-ARIA** - Accessible Rich Internet Applications
  - https://www.w3.org/WAI/standards-guidelines/aria/

## Livres de référence

- Crispin, L., & Gregory, J. (2009). **Agile Testing: A Practical Guide for Testers and Agile Teams**. Addison-Wesley.

- Crispin, L., & Gregory, J. (2014). **More Agile Testing: Learning Journeys for the Whole Team**. Addison-Wesley.

- Kaner, C., Falk, J., & Nguyen, H. Q. (1999). **Testing Computer Software** (2nd ed.). Wiley.

- Kaner, C., Bach, J., & Pettichord, B. (2001). **Lessons Learned in Software Testing**. Wiley.

- Whittaker, J. A. (2009). **Exploratory Software Testing**. Addison-Wesley.

- Cohn, M. (2009). **Succeeding with Agile: Software Development Using Scrum**. Addison-Wesley. (Pyramide des tests)

- Humble, J., & Farley, D. (2010). **Continuous Delivery**. Addison-Wesley.

- Kim, G., et al. (2016). **The DevOps Handbook**. IT Revolution Press.

## Articles et ressources en ligne

- **Martin Fowler** - Testing articles
  - https://martinfowler.com/testing/

- **Google Testing Blog**
  - https://testing.googleblog.com/

- **Ministry of Testing**
  - https://www.ministryoftesting.com/

- **Test Automation University** (Applitools)
  - https://testautomationu.applitools.com/

## Documentation outils

- **Playwright** - https://playwright.dev/docs/intro
- **Cypress** - https://docs.cypress.io/
- **Jest** - https://jestjs.io/docs/getting-started
- **k6** - https://k6.io/docs/
- **Lighthouse** - https://developer.chrome.com/docs/lighthouse/

---

# Notes et Limitations

## Points nécessitant vérification [À VÉRIFIER]

1. **Coût des défauts par phase** (Section 2.3) : Les ratios 1x → 100x sont souvent cités mais la source IBM originale est difficile à tracer. L'ordre de grandeur reste valide.

2. **Seuils de coverage** (Section 2.5) : Les pourcentages recommandés varient selon les sources. Adapter au contexte spécifique.

3. **Salaires** (Section 10) : Les fourchettes indiquées sont des estimations basées sur les données marché 2024. Varient significativement selon région, secteur, taille d'entreprise.

4. **Parts de marché navigateurs** (Section 4.4) : Les chiffres évoluent constamment. Consulter StatCounter ou similaire pour données actuelles.

## Aspects non couverts en détail

- **Testing mobile natif** (iOS/Android apps) : Focus sur le web
- **Testing IoT/Embedded** : Hors scope
- **Testing IA/ML** : Domaine spécialisé émergent
- **Compliance spécifiques** (PCI-DSS détaillé, HIPAA, SOC2) : Mentionnés mais non détaillés
- **Testing jeux vidéo** : Domaine très spécifique

## Évolutions à surveiller

- **IA dans le testing** : Outils d'auto-génération de tests, auto-healing
- **Shift-Right** : Testing in production, chaos engineering
- **Contract Testing** : Adoption croissante dans les microservices
- **Playwright** : Momentum fort vs Cypress/Selenium
- **WCAG 3.0** : En développement, nouvelles approches d'évaluation

---

*Fin du rapport Phase 5 - Qualité*

**Document généré le 29 décembre 2024**
**Version 1.0**
