# ACT Unified v3.0 — Plan de Consolidation et Roadmap

## Handoff — Session de brainstorming du 2026-02-25

> **Ce document est le résultat d'un brainstorming approfondi.** Il doit être utilisé comme point de départ pour l'implémentation dans le repo ArtChiTech-framework.

### Repo cible
- **Emplacement local** : `/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/`
- **GitHub** : `manuelturpin/ArtChiTech-framework`
- **Version actuelle** : v2.6.0

### Projet séparé (ne pas confondre)
- `/Users/manuelturpin/Desktop/ACT/` = **Art·Chi·Tech SaaS** (orchestrateur visuel no-code, repo `manuelturpin/artchitech`) — C'est un produit distinct qui sera géré PAR le framework ACT, pas le framework lui-même.

### Décisions prises
1. **Approche A : ACT Unified** — Consolider ACT + BMAD + Superpowers
2. **Base** : lab-13 (ArtChiTech-framework), branche v3.0-alpha
3. **Pain point principal** : Gestion multi-projets (4-6 projets simultanés)
4. **v3.0** : Auto-amélioration du framework
5. **v3.5** : Séparation complète de B974 (VPS + Bot + Dashboard propres)

---

## Context

### Problème
Manuel gère 4-6 projets simultanément et se perd entre les outils. Trois couches coexistent sans cohérence :
- **ACT Framework v2.6** (7 phases, hooks, Iron Laws, thinking models, session recovery)
- **BMAD Method** (PRD, ADR, Story decomposition, agents personas, onboarding)
- **Superpowers** (TDD, debugging, verification, brainstorming, writing-plans)

Chaque outil est mono-projet. Aucun ne gère le multi-projets. Les commandes se chevauchent et créent de la confusion.

### Décision
**Approche A : ACT Unified** — Consolider les trois couches en un seul framework cohérent, ajouter une couche multi-projets, et préparer l'autonomie complète du framework (séparation de B974).

### Vision long terme
- **v3.0** : Framework unifié + multi-projets + auto-amélioration
- **v3.5** : VPS dédié + Agent Telegram propre (ACT-bot) + dashboard autonome
- ACT devient un **produit open-source indépendant**, séparé de B974

---

## Brainstorming Summary

### Analyse comparative BMAD vs ACT

| Critère | BMAD | ACT v2.6 | ACT v3.0 (cible) |
|---------|------|----------|-------------------|
| Phases | 4 | 7 | 7 (enrichies) |
| Hooks système | Non (skills only ~50-80%) | Oui (100% fiabilité) | Oui |
| Artefacts structurés | PRD, ADR, Stories | config, state, plan, findings | PRD + ADR + Stories + ACT artifacts |
| Multi-projets | Non | Non | **Oui** |
| Sélection de modèle | Non | Opus/Sonnet/Haiku | Oui |
| Thinking models | Non | 12 `/consider:*` | 12+ |
| Session recovery | Non | 5-Question Reboot | Oui |
| Auto-amélioration | Non | Reflexion pattern | **Autonome** |
| Onboarding | `npx bmad-method install` | Manuel | `npx act-framework init` |
| Communauté | Active | Privé | Open-source (cible v3.5) |
| Dashboard web | Non | Non | **Oui** |
| Agent Telegram | Non | Non | **Oui (v3.5)** |
| TDD Iron Law | Non | Oui | Oui |
| Story decomposition | Oui (Scrum Master agent) | Non | **Oui** (absorbé de BMAD) |

### Ce qu'on absorbe de BMAD
1. **PRD Templates** — Product Requirements Document structuré
2. **Architecture Decision Records (ADR)** — Traçabilité des décisions techniques
3. **Story Decomposition** — Epic → Stories granulaires avec contexte complet
4. **Onboarding en une commande** — `npx` install + setup automatique
5. **Scale-adaptive intelligence** — Adapter la profondeur au type de projet

### Ce qu'on garde d'ACT
1. **7 phases** avec Go/No-Go gates
2. **Hooks système** (PreToolUse, PostToolUse, Stop) — 100% fiabilité
3. **Iron Laws** (TDD, Debugging, Verification)
4. **Deviation Rules** (autonomie contrôlée)
5. **Thinking Models** (12 `/consider:*`)
6. **Session Recovery** (5-Question Reboot)
7. **Model Selection** (Opus/Sonnet/Haiku)
8. **Reflexion Pattern** (+8-21% qualité)

### Ce qu'on garde des Superpowers
1. **Brainstorming** → Devient la phase Discovery d'ACT
2. **Writing-plans** → Devient la phase Strategy d'ACT
3. **TDD** → Renforce l'Iron Law TDD dans la phase Development
4. **Systematic-debugging** → Renforce l'Iron Law Debugging
5. **Verification-before-completion** → Renforce l'Iron Law Verification
6. **Code-review** → Intégré à la phase Quality
7. **Git worktrees** → Outil d'isolation pour le développement parallèle

### Infra existante exploitable
- **VPS OVH** : Ubuntu 24.04, 4 vCPU, 8 Go RAM, Docker
- **Bot Archi** : Bun + grammY + Claude API (~10k lignes, 935 tests)
- **agent.b974.fr** : Dashboard Hono/Bun + WebSocket
- **PostgreSQL** : 4 bases dont `archi_bot`
- **Redis** : Sessions, cache

---

## Architecture ACT v3.0

```
┌─────────────────────────────────────────────────────────┐
│           Couche 3 — ORCHESTRATEUR MULTI-PROJETS        │
│                                                         │
│  ~/.act/                    agent.b974.fr → act.bot     │
│  ├── projects.yaml          (dashboard web)             │
│  ├── global-state.md                                    │
│  └── projects/              Bot Telegram                │
│      ├── project-a/         (notifications,             │
│      ├── project-b/          /status, /switch)          │
│      └── project-c/                                     │
├─────────────────────────────────────────────────────────┤
│           Couche 2 — METHODOLOGIE (par projet)          │
│                                                         │
│  .act/                                                  │
│  ├── config.yaml        ← Métadonnées projet            │
│  ├── state.md           ← Phase courante + scoring      │
│  ├── prd.md             ← [NEW from BMAD] Product Req   │
│  ├── architecture.md    ← [NEW from BMAD] ADR           │
│  ├── stories/           ← [NEW from BMAD] Epic/Stories  │
│  ├── plan.md            ← Plan d'implémentation         │
│  ├── findings.md        ← Découvertes et learnings      │
│  ├── progress.md        ← Log de progression            │
│  ├── history/           ← Historique sessions            │
│  ├── handoffs/          ← Context handoff               │
│  └── observations.jsonl ← Auto-amélioration             │
│                                                         │
│  7 Phases : Discovery → Strategy → Design →             │
│             Development → Quality → Launch → Growth     │
│                                                         │
│  Iron Laws | Deviation Rules | Thinking Models          │
├─────────────────────────────────────────────────────────┤
│           Couche 1 — EXECUTION (dans le code)           │
│                                                         │
│  Superpowers intégrées :                                │
│  - brainstorming → Discovery                            │
│  - writing-plans → Strategy                             │
│  - TDD → Development                                   │
│  - systematic-debugging → Development                   │
│  - verification → Quality                               │
│  - code-review → Quality                                │
│                                                         │
│  Agents : planner(Opus) | architect(Opus) |             │
│           executor(Sonnet) | reviewer(Opus) |           │
│           tester(Sonnet) | documenter(Haiku)            │
│                                                         │
│  Hooks : PreToolUse | PostToolUse | Stop                │
└─────────────────────────────────────────────────────────┘
```

---

## Roadmap d'implémentation

### Phase 1 : v3.0-alpha — Consolidation (2-3 semaines)

**Objectif** : Un seul framework, zéro duplication, multi-projets CLI

#### 1.1 Restructuration du repo `ArtChiTech-framework`
- Fichiers à modifier : `plugin/`, `skills/`, `commands/`, `agents/`
- Nouvelle structure :
  ```
  act-framework/
  ├── src/
  │   ├── core/           # Engine principal
  │   │   ├── phases.ts   # 7 phases + gates
  │   │   ├── hooks.ts    # Système de hooks
  │   │   ├── state.ts    # State management
  │   │   └── scoring.ts  # Phase scoring
  │   ├── methodology/    # Artefacts et templates
  │   │   ├── prd/        # [NEW] PRD templates (from BMAD)
  │   │   ├── adr/        # [NEW] Architecture Decision Records
  │   │   ├── stories/    # [NEW] Story decomposition
  │   │   ├── thinking/   # 12 thinking models
  │   │   └── iron-laws/  # TDD, Debug, Verify
  │   ├── orchestrator/   # [NEW] Multi-projets
  │   │   ├── registry.ts # Registre global des projets
  │   │   ├── switcher.ts # Context switching
  │   │   └── dashboard.ts# Status multi-projets
  │   ├── agents/         # 6 agents spécialisés
  │   ├── skills/         # Skills consolidées
  │   └── cli/            # Commands
  │       ├── act/        # /act:* commands
  │       └── consider/   # /consider:* commands
  ├── templates/          # Templates .act/
  ├── docs/               # Documentation
  ├── tests/              # Tests
  └── package.json        # npx act-framework
  ```

#### 1.2 Absorption des artefacts BMAD
- Créer templates PRD (`templates/prd.md`) basés sur le format BMAD
- Créer templates ADR (`templates/adr.md`)
- Créer workflow Story decomposition (Epic → Stories)
- Intégrer dans les phases : Discovery produit PRD, Design produit ADR

#### 1.3 Intégration Superpowers
- Mapper brainstorming → phase Discovery (pas de duplication, un seul point d'entrée)
- Mapper writing-plans → phase Strategy
- Mapper TDD/debugging/verification → phase Development/Quality
- Les Superpowers restent installées mais ACT les orchestre

#### 1.4 Multi-projets CLI
- Créer `~/.act/` (registre global)
- Commande `/act:projects` — liste tous les projets enregistrés avec leur phase
- Commande `/act:switch <project>` — change de contexte projet
- Commande `/act:dashboard` — vue d'ensemble ASCII des projets
- Auto-découverte des `.act/` dans les répertoires configurés

### Phase 2 : v3.0-beta — Auto-amélioration (1-2 semaines)

**Objectif** : Le framework s'améliore lui-même

#### 2.1 Système d'observations
- `observations.jsonl` collecte les patterns (ce qui marche, ce qui échoue)
- Scoring de confiance par observation
- Quand confidence > 80% sur 3+ occurrences → proposition d'amélioration

#### 2.2 Reflexion autonome
- Après chaque projet complété : auto-analyse des phases
- Identification des bottlenecks récurrents
- Génération automatique de suggestions d'amélioration des templates/workflows
- Commit automatique des améliorations validées

#### 2.3 Evolve command
- `/act:evolve` — Lance un cycle d'auto-amélioration
- Analyse les observations, propose des changements, les applique si validés
- Versionning automatique des skills modifiées

### Phase 3 : v3.0-release — Packaging et distribution (1 semaine)

**Objectif** : Installation en une commande

#### 3.1 NPX installer
- `npx act-framework init` — Initialise ACT dans un projet
- `npx act-framework install --global` — Installe l'orchestrateur multi-projets
- Détection automatique du stack (project-detection existant)
- Génération CLAUDE.md adaptée (claudemd-generator existant)

#### 3.2 Documentation
- README complet avec getting started
- Guide de migration v2.6 → v3.0
- Référence des commandes
- Exemples de workflows

### Phase 4 : v3.5 — Autonomie complète (4-6 semaines)

**Objectif** : ACT possède sa propre infra, séparée de B974

#### 4.1 VPS dédié ACT
- Nouveau VPS (ou sous-domaine dédié sur VPS existant en attendant)
- `act-bot.dev` ou `act-framework.dev` (domaine à choisir)
- Docker : Dashboard + Bot + PostgreSQL + Redis

#### 4.2 ACT-Bot (fork/rewrite d'Archi)
- Agent Telegram dédié au suivi de projets
- Commandes : `/status`, `/projects`, `/switch`, `/blockers`, `/phase`
- Notifications : changements de phase, blockers détectés, reviews nécessaires
- Claude API pour l'intelligence contextuelle

#### 4.3 Dashboard Web
- React/Next.js ou Hono/Bun (décision à prendre)
- Vue multi-projets avec phases, scoring, timeline
- Détail par projet : artefacts, history, observations
- WebSocket pour mises à jour temps réel

#### 4.4 API publique
- REST API pour intégrations tierces
- Webhooks pour événements (phase change, blocker, completion)
- GitHub App pour sync automatique Issues ↔ Stories

#### 4.5 Open-source
- Licence MIT
- GitHub public : `act-framework/act`
- Documentation site (docs.act-framework.dev)
- NPM package : `@act-framework/cli`

---

## Dédoublonnage — Ce qui disparaît

| Élément actuel | Remplacé par | Action |
|---|---|---|
| `skills/brainstorm/` (root) | Superpowers brainstorming via ACT Discovery | Supprimer |
| `skills/phase-scoring/` (root) | `src/core/scoring.ts` dans ACT v3 | Migrer puis supprimer |
| `skills/state-management/` (root) | `src/core/state.ts` dans ACT v3 | Migrer puis supprimer |
| `skills/discovery-validator/` (root) | Intégré dans phase Discovery + PRD | Migrer puis supprimer |
| `skills/project-detection/` (root) | `src/cli/init.ts` (auto-détection au setup) | Migrer puis supprimer |
| `skills/claudemd-generator/` (root) | `src/cli/init.ts` (génération au setup) | Migrer puis supprimer |
| Superpowers brainstorming | Orchestré par ACT phase Discovery | Reste installé, ACT l'appelle |
| Superpowers writing-plans | Orchestré par ACT phase Strategy | Reste installé, ACT l'appelle |
| Superpowers TDD | Orchestré par ACT Iron Law TDD | Reste installé, ACT l'appelle |

---

## Vérification

### Comment tester v3.0-alpha
1. Initialiser ACT v3 sur un projet test : `npx act-framework init`
2. Vérifier que les 7 phases fonctionnent avec Go/No-Go gates
3. Vérifier la génération de PRD et ADR
4. Tester le multi-projets : enregistrer 3 projets, `/act:dashboard`
5. Tester le context switching entre projets
6. Vérifier que les hooks fonctionnent (PreToolUse, PostToolUse, Stop)
7. Vérifier que les Superpowers sont correctement orchestrées (pas de duplication)

### Comment tester v3.0-beta
1. Compléter un mini-projet de bout en bout
2. Vérifier que `observations.jsonl` se remplit
3. Lancer `/act:evolve` et vérifier les suggestions
4. Valider une amélioration et vérifier le commit automatique

### Comment tester v3.5
1. Déployer le dashboard sur le VPS
2. Tester le bot Telegram (commandes, notifications)
3. Vérifier la sync multi-projets entre CLI local et dashboard distant
4. Tester les webhooks et l'API

---

## Risques et mitigations

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Scope creep (trop ambitieux) | Haut | Livrer par phases strictes, v3.0-alpha d'abord |
| Perte de fonctionnalités pendant la migration | Moyen | Tests de non-régression sur chaque feature migrée |
| Confusion pendant la transition v2.6 → v3.0 | Moyen | Guide de migration + backward compatibility temporaire |
| Coût VPS supplémentaire (v3.5) | Bas | Commencer sur le VPS B974 existant, migrer après |
| Auto-amélioration non contrôlée | Moyen | Validation humaine requise avant tout commit auto |

---

## Prochaine action immédiate (depuis lab-13)

### Étape 0 — Copier ce plan dans lab-13
```bash
cp ~/.claude/plans/typed-weaving-teacup.md /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/docs/plans/2026-02-25-act-v3-unified-design.md
```

### Étape 1 — Créer la branche
```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/
git checkout -b v3.0-alpha
```

### Étape 2 — Restructurer le repo
Migrer la structure existante vers la nouvelle architecture (voir section "Roadmap Phase 1.1").

### Étape 3 — Commencer par le multi-projets CLI
C'est le plus haute valeur pour le pain point actuel. Créer :
- `~/.act/projects.yaml` (registre global)
- `/act:projects` command
- `/act:switch` command
- `/act:dashboard` command

### Commande pour relancer
```
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/
claude
# Puis : "Lis le plan dans docs/plans/2026-02-25-act-v3-unified-design.md et lance l'implémentation"
```
