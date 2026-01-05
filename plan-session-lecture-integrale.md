# Plan Session : Lecture Intégrale des Recherches

**Date prévue** : Prochaine session
**Objectif** : Connaissance parfaite des 167K mots de recherche
**Méthode** : Agents parallèles + extraction structurée

---

## 1. Commande de Lancement

Au début de la prochaine session, copier-coller cette commande :

```
Lance la session de lecture intégrale des recherches selon le plan dans
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/plan-session-lecture-integrale.md

Utilise des agents en parallèle pour lire tous les documents et extraire
les informations structurées. Crée ensuite les documents de réconciliation
avec le brainstorming actuel.
```

---

## 2. Architecture des Agents

### 2.1 Agents de Lecture (7 en parallèle)

```
┌─────────────────────────────────────────────────────────────────┐
│                    ORCHESTRATEUR PRINCIPAL                       │
└─────────────────────────────┬───────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│ Agent Phase 1 │    │ Agent Phase 2 │    │ Agent Phase 3 │
│   Discovery   │    │   Stratégie   │    │  Conception   │
└───────────────┘    └───────────────┘    └───────────────┘
        │                     │                     │
        ▼                     ▼                     ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│ Agent Phase 4 │    │ Agent Phase 5 │    │ Agent Phase 6 │
│ Développement │    │    Qualité    │    │   Lancement   │
└───────────────┘    └───────────────┘    └───────────────┘
                              │
                              ▼
                    ┌───────────────┐
                    │ Agent Phase 7 │
                    │  Croissance   │
                    └───────────────┘
```

### 2.2 Fichiers à Lire par Agent

| Agent | Fichier Principal | Taille estimée |
|-------|-------------------|----------------|
| Agent 1 | `rapport-phase-1-discovery.md` | ~46K mots |
| Agent 2 | `rapport-phase-2-strategie.md` | ~35K tokens |
| Agent 3 | `rapport-phase-3-conception.md` | ~25K mots |
| Agent 4 | `rapport-phase-4-developpement.md` | ~24K mots |
| Agent 5 | `rapport-phase-5-qualite.md` | ~30K mots |
| Agent 6 | `rapport-phase-6-lancement.md` | ~27K mots |
| Agent 7 | `rapport-phase-7-croissance.md` | ~13K mots |

---

## 3. Instructions pour Chaque Agent

### Template d'Extraction

Chaque agent doit produire un fichier `extraction-phase-X.md` avec cette structure :

```markdown
# Extraction Phase X - [Nom de la Phase]

## 1. Résumé Exécutif (max 200 mots)
[Résumé des points clés de cette phase]

## 2. Checklist Complète
[ ] Item 1 - [NON-NÉGOCIABLE / NICE-TO-HAVE]
[ ] Item 2 - [NON-NÉGOCIABLE / NICE-TO-HAVE]
...

## 3. Frameworks Détaillés
### Framework 1 : [Nom]
- **Quand l'utiliser** :
- **Comment** :
- **Exemple concret** :
- **Pièges à éviter** :

### Framework 2 : [Nom]
...

## 4. Métriques et KPIs
| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|

## 5. Anti-patterns Détaillés
| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|

## 6. Outils Recommandés
| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|

## 7. Rôles Impliqués
| Rôle | Niveau d'implication | Responsabilités |
|------|---------------------|-----------------|

## 8. Livrables Attendus
- Livrable 1 : [description]
- Livrable 2 : [description]

## 9. Transitions
### Entrée (venant de phase précédente)
- Prérequis 1
- Prérequis 2

### Sortie (vers phase suivante)
- Critères Go :
- Critères No-Go :

## 10. Citations Clés
> "Citation importante du document"
- Section X.X

## 11. Références Externes
- Livre/Article 1
- Standard/Certification 1
```

---

## 4. Prompts Détaillés par Agent

### Agent 1 : Phase Discovery

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-1-discovery.md

Extrais TOUTES les informations selon le template fourni.
Points d'attention particuliers pour Discovery :
- Framework JTBD (Jobs-to-be-Done) - détaille complètement
- Value Proposition Canvas - schéma et usage
- Techniques d'interview utilisateur
- Problem Statement - format et exemples
- Personas - méthode de création
- TAM/SAM/SOM - définitions et calcul
- Analyse concurrentielle - méthode

Produis le fichier : extraction-phase-1-discovery.md
```

### Agent 2 : Phase Stratégie

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-2-strategie.md

Points d'attention particuliers pour Stratégie :
- OKRs - format, exemples, erreurs courantes
- Business Model Canvas - 9 blocs détaillés
- Lean Canvas - différences avec BMC
- MoSCoW - méthode de priorisation
- RICE - calcul et exemples
- WBS (Work Breakdown Structure)
- Estimation (Planning Poker, T-Shirt, PERT)
- Gestion des risques (RAID log)
- RACI - matrice responsabilités

Produis le fichier : extraction-phase-2-strategie.md
```

### Agent 3 : Phase Conception

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-3-conception.md

Points d'attention particuliers pour Conception :
- Design Thinking - 5 étapes détaillées
- Double Diamond - flux complet
- Atomic Design - 5 niveaux avec exemples
- Design System - tokens, composants, guidelines
- Architecture (C4 Model, ADRs)
- Wireframes - low-fi vs high-fi
- Tests utilisateurs - méthode des 5 users
- WCAG - niveaux A, AA, AAA
- API Design - OpenAPI/Swagger

Produis le fichier : extraction-phase-3-conception.md
```

### Agent 4 : Phase Développement

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-4-developpement.md

Points d'attention particuliers pour Développement :
- Scrum - cérémonies, rôles, artefacts
- Kanban - WIP limits, flux
- XP (Extreme Programming) - TDD, Pair Programming
- Definition of Done
- Code Review - checklist
- CI/CD - pipelines, GitOps
- Trunk-based development
- Feature branches
- Conventions de code
- Documentation technique

Produis le fichier : extraction-phase-4-developpement.md
```

### Agent 5 : Phase Qualité

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-5-qualite.md

Points d'attention particuliers pour Qualité :
- Testing Pyramid - proportions, types
- TDD vs BDD
- Tests unitaires - coverage, mocking
- Tests d'intégration
- Tests E2E - outils, stratégie
- Tests de performance (load, stress, soak)
- Tests de sécurité (OWASP, SAST, DAST)
- Tests d'accessibilité
- UAT - organisation, durée
- ISTQB - concepts clés
- Risk-Based Testing

Produis le fichier : extraction-phase-5-qualite.md
```

### Agent 6 : Phase Lancement

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-6-lancement.md

Points d'attention particuliers pour Lancement :
- Stratégies de déploiement (Big Bang, Blue-Green, Canary, Rolling)
- Feature Flags - types, outils
- Rollback - procédure, tests
- War Room - organisation
- Communication utilisateurs
- Monitoring pré-déploiement
- Health checks
- Release notes
- Checklist pré-déploiement
- Post-mortem

Produis le fichier : extraction-phase-6-lancement.md
```

### Agent 7 : Phase Croissance

```
Tu es un agent d'extraction. Lis intégralement le fichier :
/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-7-croissance.md

Points d'attention particuliers pour Croissance :
- AARRR (Pirate Metrics) - 5 étapes détaillées
- HEART Framework - 5 dimensions
- North Star Metric - définition, exemples
- A/B Testing - statistiques, outils
- Cohort Analysis
- SRE - SLOs, SLIs, Error Budgets
- Incident Management
- On-call rotation
- Postmortem process
- Product-Market Fit - test de Sean Ellis
- Build-Measure-Learn

Produis le fichier : extraction-phase-7-croissance.md
```

---

## 5. Phase de Réconciliation

Après les 7 extractions, lancer un agent de réconciliation :

```
Tu es un agent de réconciliation. Tu as accès à :
1. Les 7 fichiers d'extraction (extraction-phase-X.md)
2. Le plan du framework actuel (plan-framework-projet.md)
3. L'analyse d'intégration (analyse-integration-recherche.md)

Produis 3 documents :

### Document 1 : mapping-recherche-framework.md
Tableau de correspondance entre chaque élément de la recherche
et son intégration dans le framework. Identifie les gaps.

### Document 2 : plan-framework-projet-v2.md
Version mise à jour du plan intégrant TOUS les éléments manquants.
Structure enrichie avec les frameworks, métriques, adaptations contextuelles.

### Document 3 : todo-implementation.md
Liste ordonnée de toutes les tâches d'implémentation avec priorités.
Basée sur les dépendances et l'impact.
```

---

## 6. Outputs Attendus

À la fin de la session, les fichiers suivants doivent exister :

```
lab-13/
├── extractions/
│   ├── extraction-phase-1-discovery.md
│   ├── extraction-phase-2-strategie.md
│   ├── extraction-phase-3-conception.md
│   ├── extraction-phase-4-developpement.md
│   ├── extraction-phase-5-qualite.md
│   ├── extraction-phase-6-lancement.md
│   └── extraction-phase-7-croissance.md
│
├── reconciliation/
│   ├── mapping-recherche-framework.md
│   ├── plan-framework-projet-v2.md
│   └── todo-implementation.md
│
├── plan-framework-projet.md          # Original (conservé)
├── analyse-integration-recherche.md  # Créé aujourd'hui
└── plan-session-lecture-integrale.md # Ce fichier
```

---

## 7. Validation Finale

Checklist de fin de session :

- [ ] 7 fichiers d'extraction créés
- [ ] Chaque extraction contient les 11 sections du template
- [ ] Mapping recherche-framework complet
- [ ] Plan v2 intègre tous les éléments manquants
- [ ] Todo implementation priorisé
- [ ] Aucune information de la recherche n'est perdue

---

## 8. Estimation Durée

| Étape | Durée estimée |
|-------|---------------|
| Lancement 7 agents parallèles | 5 min |
| Lecture + extraction (parallèle) | 15-20 min |
| Réconciliation | 10-15 min |
| Validation | 5 min |
| **Total** | **35-45 min** |

---

## 9. Notes Importantes

1. **Ne pas résumer** : Extraire TOUT, même si ça semble redondant
2. **Conserver les exemples** : Les exemples concrets sont précieux
3. **Garder les citations** : Pour référence future
4. **Identifier les contradictions** : Si deux phases disent des choses différentes
5. **Marquer les incertitudes** : Si quelque chose n'est pas clair

---

**Document créé le** : 2026-01-04
**À exécuter lors de** : Prochaine session
**Prérequis** : Aucun - tout est documenté ici
