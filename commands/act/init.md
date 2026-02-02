# Command: /act:init

## Purpose
Initialise la structure ACT v2.5 dans un projet. Crée le dossier `.act/` avec tous les fichiers nécessaires au Context Engineering.

---

## Syntax

```
/act:init [options]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--name` | Nom du projet | Nom du dossier |
| `--type` | Type de projet | "feature" |
| `--scale` | Échelle | "full" |
| `--quick` | Shortcut pour `--scale quick` | - |
| `--gitignore` | Crée un `.gitignore` pour `.act/` | false |
| `--with-hooks` | Créer `.act/hooks.json` local | - |

### Project Types

| Type | Description | Example |
|------|-------------|---------|
| `product` | Nouveau produit complet | SaaS app |
| `cli` | Application ligne de commande | TaskFlow |
| `app` | Application desktop/mobile | Electron app |
| `library` | Package réutilisable | npm package |
| `service` | Microservice/API | REST API |
| `refactor` | Refactoring existant | Migration v2 |
| `bugfix` | Correction de bug | Hotfix |

### Scale
- `quick` - Mode rapide (bugs, small features)
- `full` - Mode complet (products, major features)

---

## Usage Examples

```bash
# Basic init
/act:init

# Named project
/act:init --name "auth-module"

# Quick bugfix
/act:init --type bugfix --quick

# Full product
/act:init --name "new-api" --type product --scale full

# With local hooks for customization
/act:init --with-hooks

# Full product with local hooks
/act:init --name "my-api" --type product --with-hooks
```

---

## Execution Steps

### Step 1: Check Existing
```
IF .act/ exists THEN
  WARN "ACT already initialized. Use /act:reset to reinitialize."
  STOP
```

### Step 2: Gather Info
```
project_name = --name OR directory_name
project_type = --type OR "feature"
scale = --scale OR "full"
date = today
```

### Step 3: Create Structure
```
mkdir .act/
```

### Step 4: Create Files

#### 4.1 config.yaml
```yaml
version: "2.5"
project:
  name: "{project_name}"
  type: "{project_type}"
  scale: "{scale}"
settings:
  auto_commit: true
  verification_required: true
  tdd_mode: "relaxed"
```

#### 4.2 state.md
```markdown
# ACT State

## Current
- **Phase:** 1/? (Context)
- **Task:** Initial setup
- **Blocker:** None

## Quick Stats
- **Started:** {date}
- **Last Update:** {date}
- **Progress:** 0%

## Next Action
Define the project goal and phases.
```

#### 4.3 plan.md
```markdown
# {project_name} - Plan

## Goal
[TODO: Define your goal]

## Phases
[TODO: Define your phases]

## Decisions Log
| Date | Decision | Rationale |
|------|----------|-----------|
| {date} | Project initialized | Starting with ACT v2.5 |
```

#### 4.4 findings.md
```markdown
# Findings

## Research
### {date}: Initial Research
- [TODO: Document your research]

## Discoveries
- [TODO: Document unexpected findings]

## References
- [TODO: Add relevant links]
```

#### 4.5 progress.md
```markdown
# Session Progress

## {date}

### Session Start
- **Objective:** Initialize project with ACT v2.5
- **Status:** Ready to begin

### Next Steps
- [ ] Define project goal
- [ ] Create phase plan
- [ ] Start Phase 1: Context
```

#### 4.6 hooks.json (if --with-hooks)
```json
{
  "$schema": "../../hooks/hooks-schema.json",
  "version": "1.0",
  "description": "Project-specific hooks for {project_name}",
  "extends": "framework",
  "hooks": {
    "CustomHook": {
      "enabled": false,
      "description": "Add your custom hook here",
      "triggers": [],
      "action": "",
      "config": {}
    }
  },
  "overrides": {
    "PreToolUse": {
      "config": {
        "additionalFiles": []
      }
    }
  }
}
```

### Step 5: Create Gitignore (if --gitignore)

```
IF --gitignore THEN
  COPY templates/act/gitignore.template → .act/.gitignore
  OUTPUT: "📋 Created .act/.gitignore (edit to customize)"
```

### Step 6: Confirm
```
OUTPUT:
✅ ACT v2.5 initialized!

📁 Created:
  .act/
  ├── config.yaml
  ├── state.md
  ├── plan.md
  ├── findings.md
  ├── progress.md
  └── hooks.json      # (if --with-hooks)

🎯 Next: Edit .act/plan.md to define your goal and phases.
```

---

## Output Format

### Success
```
✅ ACT v2.5 initialized!

📁 Project: {name}
📋 Type: {type}
⚖️ Scale: {scale}

🎯 Next steps:
1. Edit .act/plan.md to define your goal
2. Create phases with clear milestones
3. Run /act:start to begin Phase 1
```

### Already Exists
```
⚠️ ACT already initialized in this project.

Current state:
- Phase: {phase}
- Progress: {progress}%

Use /act:reset to reinitialize (warning: will overwrite).
Use /act:status for current status.
```

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:status` | Show current ACT status |
| `/act:resume` | Recover from previous session |
| `/act:reset` | Reset ACT (delete and recreate .act/) |
| `/act:start` | Start working on current phase |

---

## Notes

- `.act/` is added to version control (unlike `.git/`)
- Templates are in `templates/act/`
- Skill documentation in `skills/context-engineering/SKILL.md`

---

*Command version: 1.0*
*ACT version: 2.5*
