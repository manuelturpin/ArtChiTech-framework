# Architecture du Projet - ACT v3.0

## Structure des Dossiers

```
act-framework/
├── CLAUDE.md                   # Entry point + @imports
├── README.md                   # Documentation du framework
├── package.json                # NEW v3.0 — NPX installer
├── .gitignore
├── .github/                    # CI/CD workflows
│
├── .claude/                    # Configuration Claude
│   ├── CLAUDE.local.md         # Préférences locales (gitignored)
│   └── rules/                  # Source of truth
│       ├── 0-behavior.md       # Règles anti-hallucination
│       ├── 1-framework-overview.md
│       ├── 2-architecture.md   # Ce fichier
│       ├── 3-command-development.md
│       ├── 4-conventions.md
│       ├── 5-testing.md
│       ├── 6-troubleshooting.md
│       ├── 7-loop-safety.md
│       └── 9-hooks-behavior.md # Hooks ACT v2.5+
│
├── plugin/                     # Framework ACT distribuable
│   ├── .claude-plugin/
│   │   └── plugin.json         # v3.0.0-alpha
│   ├── commands/
│   │   ├── act/                # Commandes v3.0 (27+ fichiers)
│   │   │   ├── init.md
│   │   │   ├── quick.md
│   │   │   ├── full.md
│   │   │   ├── status.md
│   │   │   ├── resume.md
│   │   │   ├── where-am-i.md
│   │   │   ├── validate.md
│   │   │   ├── diff.md
│   │   │   ├── history.md
│   │   │   ├── replay.md
│   │   │   ├── handoff.md
│   │   │   ├── reflect.md
│   │   │   ├── memorize.md
│   │   │   ├── evolve.md
│   │   │   ├── party.md
│   │   │   ├── agent.md
│   │   │   ├── sync-github.md
│   │   │   ├── export.md
│   │   │   ├── projects.md     # NEW v3.0 — Multi-projects
│   │   │   ├── switch.md       # NEW v3.0 — Context switching
│   │   │   ├── dashboard.md    # NEW v3.0 — Multi-project overview
│   │   │   ├── audit-*.md      # 4 audit commands
│   │   │   ├── heal.md
│   │   │   └── verify-hooks.md
│   │   ├── consider/           # Thinking models (12)
│   │   └── (legacy commands)
│   ├── workflows/              # BMAD + ACT workflows
│   │   ├── brainstorming/      # Ideation workflow
│   │   ├── research/           # Discovery validation
│   │   ├── prd/                # Product Requirements Document
│   │   ├── stories/            # Story decomposition
│   │   └── adr/                # NEW v3.0 — Architecture Decision Records
│   ├── agents/                 # Agent definitions
│   ├── skills/                 # Skills (distributed copy)
│   ├── references/             # Phases, scoring, superpowers
│   │   ├── phases/             # 7 phase definitions (enriched v3.0)
│   │   ├── scoring/
│   │   ├── schemas/
│   │   └── SUPERPOWERS.md      # Superpowers orchestration layer
│   ├── hooks/                  # Hooks system
│   └── tests/                  # Test infrastructure
│
├── rules/                      # Iron Laws, Deviation Rules
│   ├── iron-laws.md
│   └── deviation-rules.md
│
├── skills/                     # 10 Skills (source of truth)
│   ├── auditor/
│   ├── continuous-learning/
│   ├── context-engineering/
│   ├── github-integration/
│   ├── iron-laws/
│   ├── orchestrator/           # NEW v3.0 — Multi-project orchestrator
│   ├── party-mode/
│   ├── reflexion/
│   ├── session-recovery/
│   └── thinking/
│
├── agents/                     # 6 Agents
│   ├── README.md
│   ├── planner.md
│   ├── architect.md
│   ├── executor.md
│   ├── reviewer.md
│   ├── tester.md
│   └── documenter.md
│
├── hooks/                      # Hooks documentation
│   ├── hooks.json
│   ├── pre-tool-use.md
│   ├── post-tool-use.md
│   └── stop.md
│
├── specs/                      # Specifications
│   └── SPEC-*.md               # 10+ specs
│
├── templates/                  # Templates
│   ├── act/                    # .act/ project templates
│   │   ├── config.yaml.template    # Updated v3.0
│   │   ├── state.md.template
│   │   ├── plan.md.template
│   │   ├── progress.md.template
│   │   ├── findings.md.template
│   │   ├── prd.md.template         # NEW v3.0
│   │   └── observation.jsonl.md
│   ├── global-act/             # NEW v3.0 — ~/.act/ templates
│   │   └── projects.yaml
│   ├── github/
│   ├── ide/
│   ├── context-handoff.xml
│   ├── verification-checklist.md
│   └── ISSUES.md
│
├── test-apps/                  # Test applications
├── docs/                       # Development docs
├── research/                   # Research materials
└── scripts/                    # Build/install scripts
```

---

## Architecture v3.0 — 3 Couches

```
┌─────────────────────────────────────────────────────────┐
│           Couche 3 — ORCHESTRATEUR MULTI-PROJETS        │
│                                                         │
│  ~/.act/                    Commands:                   │
│  ├── projects.yaml          /act:projects               │
│  └── (cache)                /act:switch                 │
│                             /act:dashboard              │
│  Skill: orchestrator/                                   │
├─────────────────────────────────────────────────────────┤
│           Couche 2 — METHODOLOGIE (par projet)          │
│                                                         │
│  .act/                                                  │
│  ├── config.yaml        ← Métadonnées projet           │
│  ├── state.md           ← Phase courante + scoring     │
│  ├── prd.md             ← [v3.0] Product Requirements  │
│  ├── architecture/      ← [v3.0] ADRs                  │
│  ├── stories/           ← [v3.0] Epic/Stories          │
│  ├── plan.md            ← Plan d'implémentation        │
│  ├── findings.md        ← Découvertes et learnings     │
│  ├── progress.md        ← Log de progression           │
│  ├── history/           ← Historique sessions           │
│  ├── handoffs/          ← Context handoff              │
│  └── observations.jsonl ← Auto-amélioration            │
│                                                         │
│  7 Phases : Discovery → Strategy → Design →            │
│             Development → Quality → Launch → Growth    │
│                                                         │
│  Iron Laws | Deviation Rules | Thinking Models         │
│  BMAD Workflows: research, brainstorming, prd,         │
│                  stories, adr                           │
├─────────────────────────────────────────────────────────┤
│           Couche 1 — EXECUTION (dans le code)           │
│                                                         │
│  Superpowers orchestrées :                             │
│  - brainstorming → Discovery/Strategy/Design           │
│  - writing-plans → Strategy/Design                     │
│  - TDD → Development (Iron Law)                        │
│  - systematic-debugging → Development/Quality          │
│  - verification → Quality/Launch (Iron Law)            │
│  - code-review → Quality                               │
│                                                         │
│  Agents : planner(Opus) | architect(Opus) |            │
│           executor(Sonnet) | reviewer(Opus) |          │
│           tester(Sonnet) | documenter(Haiku)           │
│                                                         │
│  Hooks : PreToolUse | PostToolUse | Stop               │
└─────────────────────────────────────────────────────────┘
```

---

## Structure `.act/` (User Project) — v3.0

```
user-project/
├── .act/
│   ├── config.yaml             # Configuration projet (v3.0)
│   ├── state.md                # État courant
│   ├── plan.md                 # Plan d'implémentation
│   ├── progress.md             # Journal de progression
│   ├── findings.md             # Découvertes et insights
│   ├── prd.md                  # [NEW v3.0] Product Requirements Document
│   ├── architecture/           # [NEW v3.0] Architecture Decision Records
│   │   ├── ADR-001-*.md
│   │   └── ADR-002-*.md
│   ├── stories/                # [NEW v3.0] Epic/Story decomposition
│   │   ├── epic-01-*.md
│   │   └── epic-02-*.md
│   ├── history/                # Historique des sessions
│   │   └── YYYY-MM-DD-HHmm.md
│   ├── handoffs/               # Context handoffs
│   │   └── latest.xml
│   ├── hooks.json              # Local hooks override
│   ├── logs/                   # Logs d'exécution
│   │   ├── build-errors.log
│   │   └── type-errors.log
│   └── observations.jsonl      # Continuous learning
└── CLAUDE.md
```

---

## Structure `~/.act/` (Global) — NEW v3.0

```
~/.act/
├── projects.yaml               # Registre global des projets
└── (future: cache, global-state)
```

---

## Composants Clés v3.0

### Commands (`plugin/commands/act/`) — 27+

| Catégorie | Commandes |
|-----------|-----------|
| **Init** | `init`, `quick`, `full` |
| **State** | `status`, `resume`, `where-am-i`, `validate` |
| **History** | `diff`, `history`, `replay`, `handoff` |
| **Quality** | `reflect`, `memorize`, `evolve` |
| **Multi-perspective** | `party` |
| **Multi-projects** | `projects`, `switch`, `dashboard` ← **NEW v3.0** |
| **GitHub** | `sync-github` |
| **Portability** | `export` |
| **Audit** | `audit-skill`, `audit-command`, `audit-agent`, `audit-all`, `heal` |
| **Hooks** | `verify-hooks` |

### Skills (`skills/`) — 10

| Skill | Rôle | Version |
|-------|------|---------|
| `auditor` | Audit et réparation | v2.5 |
| `continuous-learning` | Apprentissage adaptatif | v2.5 |
| `context-engineering` | Gestion du contexte | v2.5 |
| `github-integration` | Sync GitHub Issues | v2.5 |
| `iron-laws` | Référence TDD/Debug/Verify | v2.5 |
| `orchestrator` | **Multi-project management** | **v3.0 NEW** |
| `party-mode` | Multi-perspective | v2.5 |
| `reflexion` | Amélioration qualité | v2.5 |
| `session-recovery` | Récupération contexte | v2.5 |
| `thinking` | Mental models | v2.5 |

### Workflows (`plugin/workflows/`) — 5

| Workflow | Rôle | Version |
|----------|------|---------|
| `brainstorming` | Ideation et exploration | v2.5 |
| `research` | Discovery et validation | v2.5 |
| `prd` | Product Requirements Document | v2.5 |
| `stories` | Epic/Story decomposition | v2.5 |
| `adr` | **Architecture Decision Records** | **v3.0 NEW** |

### Agents (`agents/`) — 6

| Agent | Model | Rôle |
|-------|-------|------|
| `planner` | opus | Planification |
| `architect` | opus | Design |
| `executor` | sonnet | Implémentation |
| `reviewer` | opus | Code review |
| `tester` | sonnet | Tests |
| `documenter` | haiku | Documentation |

### Hooks (`hooks/`) — 3

| Hook | Trigger | Action |
|------|---------|--------|
| PreToolUse | Write/Edit/Bash | Refresh plan |
| PostToolUse | Write/Edit | Update progress |
| Stop | Completion | Verify all phases |

---

## Séparation Framework vs User

| Composant | Location | Distribution |
|-----------|----------|--------------|
| Plugin code | `plugin/` | Distribué |
| Rules | `rules/`, `skills/`, `specs/` | Distribué |
| Templates | `templates/` | Distribué |
| User state (per-project) | `.act/` | Créé par user |
| User state (global) | `~/.act/` | Créé par init --global |
| Dev tools | `test-apps/`, `docs/` | Interne |

---

## Migration v2.6 → v3.0

| Changement | Impact |
|-----------|--------|
| New commands (projects, switch, dashboard) | Additive — no breaking change |
| New workflow (adr) | Additive — no breaking change |
| New skill (orchestrator) | Additive — no breaking change |
| New templates (prd.md, global projects.yaml) | Additive |
| Enhanced phase definitions | Backward compatible |
| Updated config.yaml template | New fields optional |
| Updated SUPERPOWERS.md | Documentation only |
| plugin.json version bump | 2.6.0 → 3.0.0-alpha |

**v3.0 is fully backward compatible with v2.6 projects.** Existing `.act/` directories work without changes. New features are opt-in.

---

*Architecture ACT v3.0*
