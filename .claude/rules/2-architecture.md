# Architecture du Projet

## Structure des Dossiers

```
lab-13/
├── CLAUDE.md                  # Quick reference + @imports
├── README.md                  # Documentation du plugin
├── .gitignore
├── .github/                   # CI/CD workflows
│
├── .claude/                   # Configuration Claude
│   ├── CLAUDE.local.md        # Préférences locales (gitignored)
│   └── rules/                 # Source of truth
│       ├── 0-behavior.md
│       ├── 1-framework-overview.md
│       ├── 2-architecture.md
│       └── ...
│
├── plugin/                    # Source du plugin ACT
│   ├── .claude-plugin/        # Configuration plugin
│   │   └── plugin.json
│   ├── commands/              # Commandes slash
│   ├── agents/                # Agents spécialisés
│   ├── references/            # Documentation de référence
│   │   ├── phases/            # Définition des 7 phases
│   │   ├── scoring/           # Critères de scoring
│   │   ├── recommendations/   # Recommandations par type
│   │   └── templates/         # Templates de rapports
│   └── scripts/               # Scripts utilitaires
│
├── test-apps/                 # Applications de test (dev interne)
│   └── [app-name]/            # Application de référence
│
├── docs/                      # Documentation développement
│   ├── sources/               # Fichiers sources originaux
│   ├── plans/                 # Plans d'implémentation
│   ├── handoffs/              # Handoffs de sessions
│   └── architecture/          # Documentation architecture
│
└── scripts/                   # Scripts de build/installation
    └── install-local.sh
```

---

## Rôle de Chaque Dossier

### `plugin/` - Le Framework ACT

C'est le **cœur du produit** à distribuer.

| Sous-dossier | Contenu |
|--------------|---------|
| `.claude-plugin/` | Configuration (plugin.json) |
| `commands/` | Les 7 commandes slash |
| `agents/` | 6 agents spécialisés |
| `references/` | Documentation des phases, scoring |
| `scripts/` | Utilitaires (detect_stack.py) |

### `test-apps/` - Applications de Test

**Usage** : Développement et validation uniquement.

- Contient des applications de référence pour tester le framework
- **N'est PAS documenté dans le plugin** lui-même
- Permet de valider que ACT fonctionne sur des cas réels

### `docs/` - Documentation Développement

| Sous-dossier | Contenu |
|--------------|---------|
| `sources/` | Recherches originales, extractions |
| `plans/` | Plans d'implémentation |
| `handoffs/` | Résumés de sessions de dev |
| `architecture/` | Documentation technique |

### `.claude/rules/` - Source of Truth

Fichiers de configuration pour Claude :
- Règles de comportement
- Architecture et conventions
- Workflow de développement

---

## Séparation Framework vs Outils de Dev

| Type | Dossier | Distribution |
|------|---------|--------------|
| **Framework** | `plugin/` | Distribué aux utilisateurs |
| **Dev tools** | `test-apps/`, `docs/`, `scripts/` | Usage interne |
| **Config Claude** | `.claude/` | Peut être partagé comme template |

### Règle importante

Le contenu de `plugin/` ne doit **jamais référencer** :
- Les applications de test (`test-apps/`)
- La documentation de développement (`docs/`)
- Les configurations locales

---

## Fichiers Clés

| Fichier | Rôle |
|---------|------|
| `plugin/.claude-plugin/plugin.json` | Manifeste du plugin |
| `plugin/README.md` | Documentation utilisateur |
| `.claude/rules/0-behavior.md` | Règles de conduite Claude |
| `CLAUDE.md` | Quick reference pour Claude |
