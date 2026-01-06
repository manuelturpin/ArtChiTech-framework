---
name: help
description: Aide contextuelle sur le framework ACT et ses commandes
argument-hint: [sujet]
---

# /help - Aide ACT

Tu fournis de l'aide contextuelle sur le framework ACT.

## Sans Argument: Aide Generale

```
╭─────────────────────────────────────────────────────────────╮
│  📖 ACT Framework - Aide                                    │
│                                                             │
│  ACT (ArtChiTech) est un framework de gestion de projet     │
│  en 7 phases : Discovery → Croissance.                      │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Commandes Principales:                                     │
│  /projet    Hub principal - point d'entree                  │
│  /onboard   Auditer et initialiser un projet                │
│  /status    Voir l'etat complet du projet                   │
│  /next      Passer a la phase suivante                      │
│  /fix       Corriger les problemes                          │
│  /resume    Reprendre une session                           │
│  /help      Cette aide                                      │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Pour plus d'aide: /help [sujet]                            │
│  Sujets: phases, modes, commandes, phase-[1-7]              │
╰─────────────────────────────────────────────────────────────╯
```

## /help phases

```
Les 7 Phases ACT:

1. Discovery    - Valider le probleme et les besoins
2. Strategie    - Definir roadmap et business model
3. Conception   - Designer architecture et UX
4. Developpement - Implementer avec TDD
5. Qualite      - Tester et valider
6. Lancement    - Deployer et acquerir
7. Croissance   - Iterer et optimiser

Chaque phase requiert un score >= 70% pour passer a la suivante.
Utilisez /status pour voir votre progression.
```

## /help modes

```
Les 3 Modes ACT:

COMPLET  - Nouveau projet, toutes les phases
           Utilise pour un projet from scratch.
           Parcourt les 7 phases dans l'ordre.

FEATURE  - Nouvelle fonctionnalite sur projet existant
           Adapte selon l'importance de la feature.
           Peut necessiter toutes les phases.

QUICK    - Bugfix ou refactoring rapide
           Execution rapide des etapes necessaires.
           Toujours verifier l'impact global.

Le mode est automatiquement defini selon le contexte.
```

## /help commandes

```
Commandes ACT:

/projet   Hub principal - point d'entree unique
          Detecte le contexte et propose les actions.

/onboard  Auditer et initialiser un projet
          Analyse le projet, calcule les scores,
          initialise .epct/state.json.

/status   Voir l'etat complet du projet
          Affiche phase, scores, progression.

/next     Passer a la phase suivante
          Verifie les criteres Go/No-Go.
          Cree un checkpoint avant transition.

/fix      Corriger les problemes
          Liste les problemes par priorite.
          Guide la correction.

/resume   Reprendre une session
          Restaure le contexte de travail.
          Peut restaurer depuis un checkpoint.

/help     Cette aide
          /help [sujet] pour aide specifique.
```

## /help phase-[N]

Affiche les details de la phase demandee.

### /help phase-1

```
Phase 1: Discovery

Objectif: Valider le probleme et les besoins

Criteres de validation (score >= 70%):
- README avec probleme documente (30 pts)
- Personas/users definis (25 pts)
- Validation documentee (25 pts)
- Scope defini (20 pts)

Skills recommandes:
- superpowers:brainstorming

Livrables:
- README.md avec section "Probleme"
- Personas ou user stories
- Notes de validation/interviews
```

### /help phase-2

```
Phase 2: Strategie

Objectif: Definir roadmap et business model

Criteres de validation (score >= 70%):
- Roadmap definie (30 pts)
- Business model documente (25 pts)
- Analyse concurrentielle (25 pts)
- KPIs identifies (20 pts)

Skills recommandes:
- superpowers:brainstorming

Livrables:
- ROADMAP.md ou docs/roadmap
- Business model canvas
- Benchmark concurrents
```

### /help phase-3

```
Phase 3: Conception

Objectif: Designer architecture et UX

Criteres de validation (score >= 70%):
- Architecture documentee (30 pts)
- Tech stack documente (25 pts)
- Specs API (25 pts)
- UI mockups (20 pts)

Skills recommandes:
- superpowers:writing-plans

Livrables:
- docs/architecture.md
- Specs techniques
- OpenAPI/GraphQL schema
```

### /help phase-4

```
Phase 4: Developpement

Objectif: Implementer avec TDD

Criteres de validation (score >= 70%):
- Code source present (25 pts)
- Tests ecrits (25 pts)
- CI/CD configure (25 pts)
- Code documente (25 pts)

Skills recommandes:
- superpowers:test-driven-development

Livrables:
- Code fonctionnel
- Tests unitaires
- Pipeline CI/CD
```

### /help phase-5

```
Phase 5: Qualite

Objectif: Tester et valider

Criteres de validation (score >= 70%):
- Coverage > 60% (30 pts)
- Pas de bugs critiques (30 pts)
- Linting clean (20 pts)
- Performance OK (20 pts)

Skills recommandes:
- superpowers:code-reviewer

Livrables:
- Rapport de coverage
- Tests d'integration
- Benchmarks performance
```

### /help phase-6

```
Phase 6: Lancement

Objectif: Deployer et acquerir

Criteres de validation (score >= 70%):
- Deploye en production (30 pts)
- Monitoring en place (25 pts)
- Documentation utilisateur (25 pts)
- Launch checklist (20 pts)

Livrables:
- URL production
- Dashboard monitoring
- Guide utilisateur
```

### /help phase-7

```
Phase 7: Croissance

Objectif: Iterer et optimiser

Criteres de validation (score >= 70%):
- Analytics configure (30 pts)
- Feedback collecte (25 pts)
- Iterations faites (25 pts)
- Metriques croissance (20 pts)

Livrables:
- Dashboard analytics
- Changelog
- Metriques utilisateurs
```

## Sujet Inconnu

Si le sujet demande n'existe pas :

```
❓ Sujet inconnu: [sujet]

Sujets disponibles:
- phases    : Les 7 phases du framework
- modes     : Les 3 modes d'utilisation
- commandes : Liste des commandes
- phase-1 a phase-7 : Details d'une phase

Exemple: /help phases
```
