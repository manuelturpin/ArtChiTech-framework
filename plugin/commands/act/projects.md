# Command: /act:projects

## Purpose
Liste tous les projets enregistrés dans le registre global ACT avec leur phase courante, progression et dernière activité.

---

## Syntax

```
/act:projects [--register <path>] [--unregister <name>] [--scan <dir>]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| (none) | Liste tous les projets enregistrés | - |
| `--register <path>` | Enregistre un projet dans le registre | - |
| `--unregister <name>` | Retire un projet du registre | - |
| `--scan <dir>` | Scanne un répertoire pour découvrir des projets `.act/` | - |

---

## Usage Examples

```bash
# Lister tous les projets
/act:projects

# Enregistrer un nouveau projet
/act:projects --register /path/to/my-project

# Retirer un projet du registre
/act:projects --unregister my-project

# Scanner un répertoire pour découvrir des projets ACT
/act:projects --scan ~/projects
```

---

## Output Format

### Standard Output

```markdown
## 📁 ACT Projects

| # | Project | Phase | Progress | Last Active | Status |
|---|---------|-------|----------|-------------|--------|
| 1 | act-framework | 4/7 Development | 55% | 2h ago | 🔄 Active |
| 2 | pocket-watch-ai | 2/7 Strategy | 30% | 3d ago | ⏸️ Paused |
| 3 | archi-bot | 6/7 Launch | 90% | 1d ago | 🔄 Active |
| 4 | bonsai-tracker | 5/7 Quality | 75% | 5d ago | ⏸️ Paused |

**Total:** 4 projects | 2 active | 2 paused
**Current context:** act-framework

💡 Use `/act:switch <name>` to change project context
💡 Use `/act:dashboard` for a detailed overview
```

---

## Execution Steps

### Step 1: Load Global Registry

```
registry_path = ~/.act/projects.yaml
IF NOT exists(registry_path):
  Display: "No projects registered. Use /act:projects --register <path>"
  RETURN

registry = load(registry_path)
```

### Step 2: Refresh Project States

```
FOR each project in registry.projects:
  act_dir = project.path + "/.act/"

  IF exists(act_dir + "state.md"):
    state = parse(act_dir + "state.md")
    project.phase = state.current_phase
    project.progress = state.progress
    project.last_active = file_mtime(act_dir + "state.md")
  ELSE:
    project.status = "⚠️ Missing .act/"
```

### Step 3: Display Table

Sort by last_active (most recent first) and display formatted table.

### Step 4: Register (if --register)

```
IF --register:
  path = resolve_absolute(arg)
  IF NOT exists(path + "/.act/"):
    Display: "⚠️ No .act/ directory found. Run /act:init first."
    RETURN

  config = load(path + "/.act/config.yaml")
  name = config.project.name OR basename(path)

  Add to registry:
    name: name
    path: path
    registered: now()

  Save registry
  Display: "✅ Project '{name}' registered"
```

### Step 5: Scan (if --scan)

```
IF --scan:
  dir = resolve_absolute(arg)
  found = find_all(dir, ".act/config.yaml", maxdepth=3)

  FOR each config_path in found:
    project_path = dirname(dirname(config_path))
    IF NOT already_registered(project_path):
      Display: "Found: {project_path}"
      Prompt: "Register? (y/n)"
```

---

## Global Registry Format

File: `~/.act/projects.yaml`

```yaml
version: "3.0"
default_project: act-framework
scan_paths:
  - ~/projects
  - ~/Desktop/bonsai974/claude/lab

projects:
  - name: act-framework
    path: /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
    registered: 2026-02-25
    tags: [framework, open-source]

  - name: pocket-watch-ai
    path: /Users/manuelturpin/Desktop/bonsai974/claude/lab/pocket-watch-ai
    registered: 2026-02-25
    tags: [product, ai]
```

---

## Integration

### With /act:switch
Projects listed here are the targets for `/act:switch <name>`.

### With /act:dashboard
Dashboard reads the same registry for its multi-project overview.

### With /act:init
After `/act:init`, suggest registering the project:
```
💡 Register this project globally: /act:projects --register .
```

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:switch` | Switch context to another project |
| `/act:dashboard` | Multi-project overview dashboard |
| `/act:status` | Current project status |
| `/act:init` | Initialize ACT in a project |

---

*Command version: 1.0*
*ACT version: 3.0*
