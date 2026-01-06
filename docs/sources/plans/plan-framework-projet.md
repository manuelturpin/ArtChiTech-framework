# Plan de Design : Framework Projet Claude Code

**Date** : 2026-01-04
**Projet** : lab-13
**Statut** : En attente de validation

---

## 1. Vision et Objectifs

### 1.1 Vision
Créer un framework de gestion de projet complet, intégré à Claude Code, qui transforme 167K mots de recherche en un système actionnable avec seulement 6 commandes utilisateur.

### 1.2 Objectifs Principaux
- **Simplicité** : Maximum 6 commandes utilisateur
- **Persistance** : Contexte préservé entre sessions Claude Code
- **Incrémental** : Test par petits chunks, pas d'implémentation massive
- **Générique** : Applicable à tout projet (webapp, mobile, feature, refacto)
- **Intégré** : Utilise les skills superpowers existants

### 1.3 Ce que le framework N'EST PAS
- ❌ Un outil lourd avec 50 commandes
- ❌ Une documentation à lire en entier
- ❌ Un remplacement de Claude Code
- ❌ Spécifique à un type de projet

### 1.4 Ce que le framework EST
- ✅ 6 commandes simples
- ✅ Orchestration intelligente cachée
- ✅ Contexte préservé entre sessions
- ✅ Test incrémental par petits chunks
- ✅ Générique et réutilisable

---

## 2. Architecture Globale

### 2.1 Vue d'ensemble

```
┌─────────────────────────────────────────────────────────────┐
│                    UTILISATEUR                               │
│         /projet  /resume  /status  /fix  /next  /help       │
└─────────────────────────────┬───────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                 ORCHESTRATEUR PRINCIPAL                      │
│              (skill:projet-orchestrator)                     │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │ Context     │  │ Chunk       │  │ Error               │  │
│  │ Manager     │  │ Manager     │  │ Tracker             │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────┬───────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                  SKILLS SUPERPOWERS                          │
│  brainstorming | TDD | code-review | debugging | verify     │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    PERSISTANCE                               │
│              .epct/state.json + checkpoints                  │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Couches du Système

| Couche | Responsabilité | Visible utilisateur |
|--------|----------------|---------------------|
| Commandes | Interface utilisateur (6 commandes) | ✅ Oui |
| Orchestrateur | Coordination des skills et modules | ❌ Non |
| Modules internes | Context, Chunk, Error management | ❌ Non |
| Skills superpowers | TDD, brainstorming, code-review, etc. | ❌ Non (appelés auto) |
| Persistance | État, checkpoints, historique | ❌ Non |

---

## 3. Commandes Utilisateur

### 3.1 Liste des 6 Commandes

| Commande | Description | Cas d'usage |
|----------|-------------|-------------|
| `/projet` | Hub principal interactif | Nouveau projet, feature, refacto, menu |
| `/resume` | Reprendre session précédente | Début de session, récupération contexte |
| `/status` | État actuel + progression | Voir où on en est, créer checkpoint |
| `/fix` | Traiter l'erreur prioritaire | Débloquer avant de continuer |
| `/next` | Passer à l'étape suivante | Transition chunk ou phase (Go/No-Go) |
| `/help` | Aide contextuelle + tips | Documentation phase, anti-patterns |

### 3.2 Détail : `/projet`

Point d'entrée principal avec menu intelligent :

```
╭─────────────────────────────────────────────────────╮
│  Que voulez-vous faire ?                            │
│                                                     │
│  1. 🆕 Démarrer un nouveau projet                   │
│  2. ➕ Ajouter une feature                          │
│  3. 🔧 Refactoring/optimisation                     │
│  4. 📋 Voir checklist phase actuelle                │
│  5. ⏭️  Passer à la phase suivante                  │
│                                                     │
│  Tapez le numéro ou décrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

### 3.3 Détail : `/resume`

Récupération intelligente du contexte :

```
📍 Dernière session : il y a 2h
   Phase : Développement
   Dernier chunk : ProductService.update ✅
   Prochain : ProductService.delete
   Erreurs en attente : 0

   Continuer avec ProductService.delete ? (o/n)
```

### 3.4 Détail : `/status`

Vue d'ensemble visuelle :

```
╭─────────────────────────────────────────────────────╮
│  🚀 mon-app | Phase: Développement (4/7)           │
├─────────────────────────────────────────────────────┤
│  Progression phase : ████████░░░░░░░░ 52%          │
│  Santé projet      : 🟢 Vert (0 bloqueurs)         │
├─────────────────────────────────────────────────────┤
│  EN COURS (2)                                       │
│  ├─ 🔄 Implémenter UserService [chunk 2/4]         │
│  └─ 🔄 Tests unitaires auth module                 │
│                                                     │
│  ERREURS À CORRIGER (1)                            │
│  └─ ❌ UserService.create() - assertion failed     │
│                                                     │
│  PROCHAINES (3)                                    │
│  ├─ ○ Integration tests UserService                │
│  ├─ ○ Implémenter ProductService                   │
│  └─ ○ ...                                          │
╰─────────────────────────────────────────────────────╯
```

### 3.5 Raccourcis Acceptés

```bash
/projet status  →  /status
/projet fix     →  /fix
/projet resume  →  /resume
```

---

## 4. Gestion de Session et Contexte

### 4.1 Problématique
Claude Code a un contexte limité. Perdre le fil = frustration et perte de temps.

### 4.2 Solution : État Persistant

```
.epct/
├── state.json              # État actuel du projet
├── session/
│   ├── current.json        # Tokens estimés utilisés
│   └── recovery.json       # Point de récupération
├── history/                # Historique des sessions
├── context/                # Contexte condensé par phase
├── checkpoints/            # Points de sauvegarde
└── errors/
    ├── active/             # Erreurs en cours
    └── resolved/           # Erreurs résolues
```

### 4.3 Contenu de state.json

```json
{
  "project": {
    "name": "mon-app",
    "type": "webapp",
    "created": "2026-01-04T10:00:00Z"
  },
  "currentPhase": 4,
  "phaseName": "Développement",
  "progress": {
    "phase": 52,
    "overall": 35
  },
  "currentChunk": {
    "file": "src/services/UserService.ts",
    "method": "create",
    "status": "testing"
  },
  "errors": {
    "active": 1,
    "blocking": false
  },
  "lastAction": {
    "type": "chunk_complete",
    "target": "UserService.update",
    "timestamp": "2026-01-04T14:30:00Z"
  },
  "session": {
    "tokensEstimated": 45000,
    "contextRemaining": "~35%"
  }
}
```

### 4.4 Checkpoints Automatiques

| Événement | Action |
|-----------|--------|
| Chunk complété | Checkpoint auto |
| `/status` exécuté | Checkpoint nommé |
| `/next` (transition phase) | Checkpoint majeur |
| Erreur détectée | Snapshot état + contexte |

### 4.5 Tips Intelligents

| Situation | Tip affiché |
|-----------|-------------|
| Contexte < 30% restant | "💡 Contexte limité. Terminez le chunk actuel puis `/status` pour sauvegarder." |
| Erreur non traitée > 1h | "💡 Erreur en attente. `/fix` recommandé avant de continuer." |
| Phase prête pour Go/No-Go | "💡 Checklist phase complète. `/next` pour valider et avancer." |
| Début de session | "💡 Bienvenue ! Dernière action : [X]. Tapez `/resume` pour continuer." |
| Longue session (>2h) | "💡 Session longue. Un `/status` créera un point de sauvegarde." |

---

## 5. Pattern Chunk-Test-Fix

### 5.1 Principe Fondamental
**Ne jamais implémenter plus qu'on ne peut tester immédiatement.**

### 5.2 Flux de Travail

```
┌─────────────┐    ┌─────────┐    ┌─────────┐
│ Implémenter │───▶│ Tester  │───▶│  Vert?  │
│  1 chunk    │    │ le chunk│    │         │
└─────────────┘    └─────────┘    └────┬────┘
                                       │
                         ┌─────────────┴─────────────┐
                         │                           │
                        OUI                         NON
                         │                           │
                         ▼                           ▼
                   ┌───────────┐            ┌──────────────┐
                   │  Chunk    │            │ Fix erreur   │
                   │  suivant  │            │ avant suite  │
                   └───────────┘            └──────────────┘
```

### 5.3 Définition d'un Chunk

- 1 fonction ou 1 méthode
- Maximum ~50 lignes de code
- Testable de manière isolée
- Responsabilité unique

### 5.4 Intégration TDD Automatique

Quand on travaille sur un chunk :
1. `superpowers:test-driven-development` activé automatiquement
2. Pattern RED → GREEN → REFACTOR
3. Test du chunk immédiat après implémentation
4. Si erreur → blocage et focus sur le fix
5. Si vert → proposition chunk suivant

### 5.5 Gestion des Erreurs

Structure d'une erreur stockée :

```json
{
  "id": "001",
  "type": "assertion_failed",
  "chunk": "UserService.create",
  "file": "src/services/UserService.ts",
  "line": 42,
  "message": "Expected user.email to be defined",
  "stackTrace": "...",
  "context": {
    "phase": 4,
    "attemptedFixes": 0
  },
  "created": "2026-01-04T14:30:00Z"
}
```

---

## 6. Les 7 Phases du Projet

### 6.1 Vue d'Ensemble

| # | Phase | Description | Skills Superpowers |
|---|-------|-------------|-------------------|
| 1 | Discovery | Validation problème, JTBD | brainstorming |
| 2 | Stratégie | Positionnement, roadmap | brainstorming, writing-plans |
| 3 | Conception | Design, architecture | brainstorming, writing-plans |
| 4 | Développement | Implémentation code | TDD, code-review |
| 5 | Qualité | Tests, QA | systematic-debugging, verification |
| 6 | Lancement | Déploiement, release | verification-before-completion |
| 7 | Croissance | Monitoring, itération | root-cause-tracing |

### 6.2 Documentation Condensée

Chaque phase dispose d'un condensé (~500 mots) contenant :
- ✅ Checklist (10-15 items actionnables)
- ⚠️ Anti-patterns (5-7 pièges à éviter)
- 🔧 Outils recommandés
- 📊 Métriques à suivre

Source : Documentation recherche (167K mots) → Condensés actionnables

### 6.3 Chargement Contextuel

Seul le condensé de la phase actuelle est chargé en contexte.
- Phase 4 active → uniquement `4-developpement.md` en mémoire
- Économie de tokens significative

### 6.4 Go/No-Go entre Phases

```
Phase N en cours
       │
       ▼
Checklist complète ?
       │
   ┌───┴───┐
   NON     OUI
   │        │
   ▼        ▼
Afficher   Proposer Go/No-Go
items
manquants        │
                 ▼
          ╭─────────────────────────────────────╮
          │  Phase Développement terminée       │
          │                                     │
          │  ✅ 12/12 items checklist           │
          │  ✅ 0 erreurs en attente            │
          │  ✅ Tests passent                   │
          │                                     │
          │  Passer à Phase Qualité ?           │
          │  [Oui] [Non, voir détails]          │
          ╰─────────────────────────────────────╯
```

---

## 7. Intégration Skills Superpowers

### 7.1 Mapping Phase → Skills

| Phase | Skill Principal | Skills Secondaires |
|-------|-----------------|-------------------|
| Discovery | brainstorming | - |
| Stratégie | writing-plans | brainstorming |
| Conception | writing-plans | brainstorming |
| Développement | test-driven-development | code-review |
| Qualité | verification-before-completion | systematic-debugging |
| Lancement | verification-before-completion | - |
| Croissance | root-cause-tracing | systematic-debugging |

### 7.2 Activation Automatique

L'orchestrateur active automatiquement les skills appropriés selon :
- La phase actuelle
- Le type de tâche (nouveau code, fix, refacto)
- Le contexte (erreur en cours, transition de phase)

### 7.3 Skills Internes (Non Visibles Utilisateur)

```
skill:projet-orchestrator     # Coordination générale
skill:context-manager         # Gestion session/tokens
skill:chunk-manager           # Découpage et suivi chunks
skill:error-tracker           # Suivi et priorisation erreurs
skill:phase-controller        # Transitions et Go/No-Go
skill:tips-engine             # Génération tips contextuels
```

---

## 8. Structure du Projet lab-13

### 8.1 Arborescence Complète

```
lab-13/
├── claude.md                     # Configuration Claude Code (meta)
├── CLAUDE.md                     # Alias
├── .epct/                        # État du framework lui-même
│   ├── state.json
│   ├── checkpoints/
│   └── errors/
│
├── src/
│   ├── skills/                   # Skills personnalisés
│   │   ├── projet-orchestrator.md
│   │   ├── context-manager.md
│   │   ├── chunk-manager.md
│   │   ├── error-tracker.md
│   │   ├── phase-controller.md
│   │   └── tips-engine.md
│   │
│   ├── cli/                      # Commandes utilisateur
│   │   ├── projet.md             # /projet
│   │   ├── resume.md             # /resume
│   │   ├── status.md             # /status
│   │   ├── fix.md                # /fix
│   │   ├── next.md               # /next
│   │   └── help.md               # /help
│   │
│   └── reference/                # Documentation condensée
│       ├── phases/
│       │   ├── 1-discovery.md
│       │   ├── 2-strategie.md
│       │   ├── 3-conception.md
│       │   ├── 4-developpement.md
│       │   ├── 5-qualite.md
│       │   ├── 6-lancement.md
│       │   └── 7-croissance.md
│       │
│       ├── checklists/
│       ├── anti-patterns/
│       └── tools/
│
├── doc/
│   └── recherche/                # Documentation source (existante)
│       ├── synthese-executive.md
│       ├── rapport-phase-1-discovery.md
│       ├── rapport-phase-2-strategie.md
│       ├── rapport-phase-3-conception.md
│       ├── rapport-phase-4-developpement.md
│       ├── rapport-phase-5-qualite.md
│       ├── rapport-phase-6-lancement.md
│       └── rapport-phase-7-croissance.md
│
├── docs/
│   ├── plans/                    # Plans de design
│   │   └── 2026-01-04-framework-projet-design.md
│   └── installation.md           # Guide d'installation (à créer)
│
├── dist/                         # Framework packagé (distribution)
│
└── tests/                        # Tests du framework
```

### 8.2 Configuration claude.md

```markdown
# Framework Projet - Lab 13

## Nature du projet
Ce dossier est le framework de gestion de projet. Il s'utilise
lui-même pour son propre développement (meta-framework).

## Commandes disponibles
- `/projet` : Hub principal
- `/resume` : Reprendre session
- `/status` : État actuel
- `/fix` : Corriger erreur prioritaire
- `/next` : Étape suivante
- `/help` : Aide contextuelle

## Phase actuelle
Développement initial du framework

## Priorités
1. Gestion de session/contexte
2. Test par petits chunks
3. Intégration superpowers

## Fichiers critiques
- `.epct/state.json` : État persistant
- `src/skills/` : Skills d'orchestration
- `src/reference/` : Documentation condensée

## Pour utiliser ce framework sur un autre projet
Voir `docs/installation.md`
```

---

## 9. Plan d'Implémentation

### 9.1 Priorités de Développement

| Priorité | Module | Raison |
|----------|--------|--------|
| 1 | Gestion session/contexte | Critique - base de tout |
| 2 | Structure .epct/ | Fondation persistance |
| 3 | /resume et /status | Commandes les plus utilisées |
| 4 | Pattern chunk-test-fix | Coeur du workflow dev |
| 5 | /projet (hub) | Point d'entrée principal |
| 6 | /fix | Gestion erreurs |
| 7 | /next | Transitions de phase |
| 8 | /help | Documentation contextuelle |
| 9 | Condensation 7 phases | Documentation actionnable |
| 10 | Tips intelligents | Amélioration UX |

### 9.2 Phase 1 : Fondations (Priorité 1-3)

**Objectif** : Système de persistance fonctionnel

Fichiers à créer :
- `src/skills/context-manager.md`
- `src/cli/resume.md`
- `src/cli/status.md`
- Structure `.epct/` avec state.json

Critère de succès :
- `/resume` restaure le contexte d'une session précédente
- `/status` affiche l'état et crée un checkpoint

### 9.3 Phase 2 : Workflow Dev (Priorité 4-6)

**Objectif** : Pattern chunk-test-fix opérationnel

Fichiers à créer :
- `src/skills/chunk-manager.md`
- `src/skills/error-tracker.md`
- `src/cli/fix.md`

Critère de succès :
- Découpage automatique en chunks
- Intégration TDD sur chaque chunk
- Erreurs trackées et priorisées

### 9.4 Phase 3 : Hub et Navigation (Priorité 5, 7)

**Objectif** : Interface utilisateur complète

Fichiers à créer :
- `src/cli/projet.md`
- `src/cli/next.md`
- `src/skills/phase-controller.md`

Critère de succès :
- `/projet` propose menu interactif
- `/next` gère transitions avec Go/No-Go

### 9.5 Phase 4 : Documentation et Polish (Priorité 8-10)

**Objectif** : Framework complet et documenté

Fichiers à créer :
- `src/cli/help.md`
- `src/reference/phases/*.md` (7 fichiers)
- `src/skills/tips-engine.md`
- `docs/installation.md`

Critère de succès :
- `/help` affiche documentation contextuelle
- Tips apparaissent au bon moment
- Framework utilisable sur un autre projet

---

## 10. Métriques de Succès

### 10.1 Pour le Framework

| Métrique | Cible |
|----------|-------|
| Nombre de commandes utilisateur | ≤ 6 |
| Temps de `/resume` | < 2 secondes |
| Taux de récupération contexte | > 95% |
| Couverture phases | 7/7 |

### 10.2 Pour les Projets Utilisant le Framework

| Métrique | Description |
|----------|-------------|
| Temps perdu en perte de contexte | Réduction significative |
| Erreurs non traitées accumulées | Proche de 0 |
| Visibilité progression | Toujours disponible via /status |
| Transitions de phase | Validées par Go/No-Go |

---

## 11. Risques et Mitigations

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Complexité skills cachée | Maintenance difficile | Documentation interne, tests |
| Limites tokens Claude | Condensés trop lourds | Budget tokens par phase |
| Adoption utilisateur | Framework ignoré | UX simple, tips utiles |
| Sync TodoWrite | Désynchronisation | Validation bidirectionnelle |

---

## 12. Questions Ouvertes

1. **Format des skills** : Markdown pur ou avec frontmatter YAML ?
2. **Stockage checkpoints** : JSON ou format plus compact ?
3. **Intégration Notion** : Priorité ou optionnel v2 ?
4. **Tests du framework** : Comment tester les skills eux-mêmes ?

---

## 13. Validation Requise

### À approuver avant développement :

- [ ] Architecture globale (Section 2)
- [ ] 6 commandes utilisateur (Section 3)
- [ ] Gestion session/contexte (Section 4)
- [ ] Pattern chunk-test-fix (Section 5)
- [ ] 7 phases et condensés (Section 6)
- [ ] Intégration superpowers (Section 7)
- [ ] Structure projet lab-13 (Section 8)
- [ ] Plan d'implémentation (Section 9)

---

**Document généré le** : 2026-01-04
**Framework** : Projet Claude Code
**Version** : 1.0-draft
**Statut** : En attente de validation utilisateur
