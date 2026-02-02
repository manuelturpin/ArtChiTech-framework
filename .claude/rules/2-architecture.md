# Architecture du Projet - ACT v2.5

## Structure des Dossiers

```
lab-13/
├── CLAUDE.md                   # Entry point + @imports
├── README.md                   # Documentation du framework
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
│       └── 9-hooks-behavior.md # Hooks ACT v2.5
│
├── plugin/                     # Framework ACT distribuable
│   ├── .claude-plugin/
│   │   └── plugin.json         # v2.5.0
│   ├── commands/
│   │   ├── act/                # Commandes v2.5 (23 fichiers)
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
│   │   │   ├── sync-github.md
│   │   │   ├── export.md
│   │   │   ├── audit-*.md      # 4 audit commands
│   │   │   ├── heal.md
│   │   │   └── verify-hooks.md
│   │   ├── consider/           # Thinking models (12)
│   │   ├── act-onboard.md      # Legacy migrated
│   │   ├── act-fix.md
│   │   ├── act-fix-issue.md
│   │   ├── act-feedback.md
│   │   ├── act-triage.md
│   │   └── loop*.md            # Loop commands
│   ├── workflows/              # BMAD workflows
│   ├── agents/                 # Agent definitions
│   └── references/             # Phases, scoring
│
├── rules/                      # Iron Laws, Deviation Rules
│   ├── iron-laws.md
│   └── deviation-rules.md
│
├── skills/                     # 8 Skills
│   ├── auditor/
│   ├── continuous-learning/
│   ├── context-engineering/
│   ├── github-integration/
│   ├── party-mode/
│   ├── reflexion/
│   ├── session-recovery/
│   └── thinking/
│
├── agents/                     # 6 Agents v2.5
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
│   ├── SPEC-*.md               # 10+ specs
│
├── templates/                  # Templates
│   ├── act/                    # .act/ templates
│   ├── context-handoff.xml
│   ├── verification-checklist.md
│   └── ISSUES.md
│
├── test-apps/                  # Test applications
│   └── [app-name]/
│
├── docs/                       # Development docs
│   ├── sources/
│   ├── plans/
│   ├── handoffs/
│   └── audits/
│
└── scripts/                    # Build/install scripts
    └── install-local.sh
```

---

## Structure `.act/` (User Project)

Quand ACT est initialisé dans un projet utilisateur :

```
user-project/
├── .act/
│   ├── config.yaml             # Configuration projet
│   ├── state.md                # État courant
│   ├── plan.md                 # Plan d'implémentation
│   ├── progress.md             # Journal de progression
│   ├── findings.md             # Découvertes et insights
│   ├── history/                # Historique des sessions
│   │   └── YYYY-MM-DD-HHmm.md
│   ├── handoffs/               # Context handoffs
│   │   └── latest.xml
│   ├── logs/                   # Logs d'exécution
│   │   ├── build-errors.log
│   │   └── type-errors.log
│   └── observations.jsonl      # Continuous learning
└── CLAUDE.md
```

---

## Composants Clés v2.5

### Commands (`plugin/commands/act/`)

| Catégorie | Commandes |
|-----------|-----------|
| **Init** | `init`, `quick`, `full` |
| **State** | `status`, `resume`, `where-am-i`, `validate` |
| **History** | `diff`, `history`, `replay`, `handoff` |
| **Quality** | `reflect`, `memorize`, `evolve` |
| **Multi-perspective** | `party` |
| **GitHub** | `sync-github` |
| **Portability** | `export` |
| **Audit** | `audit-skill`, `audit-command`, `audit-agent`, `audit-all`, `heal` |
| **Hooks** | `verify-hooks` |

### Skills (`skills/`)

| Skill | Rôle |
|-------|------|
| `auditor` | Audit et réparation |
| `continuous-learning` | Apprentissage adaptatif |
| `context-engineering` | Gestion du contexte |
| `github-integration` | Sync GitHub Issues |
| `party-mode` | Multi-perspective |
| `reflexion` | Amélioration qualité |
| `session-recovery` | Récupération contexte |
| `thinking` | Mental models |

### Agents (`agents/`)

| Agent | Model | Rôle |
|-------|-------|------|
| `planner` | opus | Planification |
| `architect` | opus | Design |
| `executor` | sonnet | Implémentation |
| `reviewer` | opus | Code review |
| `tester` | sonnet | Tests |
| `documenter` | haiku | Documentation |

### Hooks (`hooks/`)

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
| User state | `.act/` | Créé par user |
| Dev tools | `test-apps/`, `docs/` | Interne |

### Règle Importante

Le contenu de `plugin/` ne doit **jamais** référencer :
- Les applications de test (`test-apps/`)
- La documentation de développement (`docs/`)
- Les configurations locales (`.claude/CLAUDE.local.md`)

---

## Fichiers Clés

| Fichier | Rôle |
|---------|------|
| `plugin/.claude-plugin/plugin.json` | Manifeste v2.5.0 |
| `CLAUDE.md` | Entry point + hooks |
| `rules/iron-laws.md` | TDD, Debug, Verify |
| `rules/deviation-rules.md` | Autonomy rules |
| `.claude/rules/9-hooks-behavior.md` | Hook injection |

---

*Architecture ACT v2.5*
