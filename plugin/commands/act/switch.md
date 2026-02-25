# Command: /act:switch

## Purpose
Change le contexte projet actif. Sauvegarde l'état de la session courante et charge le contexte du projet cible.

---

## Syntax

```
/act:switch <project-name> [--save-handoff] [--no-save]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `<project-name>` | Nom du projet cible (depuis le registre) | Required |
| `--save-handoff` | Génère un handoff avant de switcher | false |
| `--no-save` | Ne sauvegarde pas la session courante | false |

---

## Usage Examples

```bash
# Switch simple
/act:switch pocket-watch-ai

# Switch avec handoff (pour les sessions longues)
/act:switch archi-bot --save-handoff

# Switch rapide sans sauvegarde
/act:switch act-framework --no-save
```

---

## Output Format

```markdown
## 🔄 Context Switch

### Saving current context
- **Project:** act-framework
- **Phase:** 4/7 (Development)
- **Progress:** 55%
- **Session saved:** ✅

---

### Loading new context
- **Project:** pocket-watch-ai
- **Path:** ~/Desktop/bonsai974/claude/lab/pocket-watch-ai
- **Phase:** 2/7 (Strategy)
- **Progress:** 30%
- **Last active:** 3 days ago

### 🔄 5-Question Quick Check

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 2/7 - Strategy | ✅ |
| 2 | Where am I going? | Design, Development, Quality, Launch, Growth | ✅ |
| 3 | What's the goal? | AI-powered time tracking | ✅ |
| 4 | What have I learned? | Pomodoro is overrated, flow states matter | ✅ |
| 5 | What have I done? | Market research, competitor analysis | ✅ |

**Context Status:** ✅ Complete (5/5)

---
💡 Ready to work on **pocket-watch-ai**. Use `/act:status` for details.
```

---

## Execution Steps

### Step 1: Validate Target Project

```
registry = load(~/.act/projects.yaml)
target = find_project(registry, project_name)

IF NOT target:
  Display: "❌ Project '{project_name}' not found in registry."
  Display: "Available projects:"
  list_projects()
  RETURN
```

### Step 2: Save Current Session (unless --no-save)

```
IF NOT --no-save:
  current = get_current_project()
  IF current:
    # Update progress.md with session end marker
    append_to_progress("Session paused - switching to {target.name}")

    # Save session history
    save_session_history(current)

    IF --save-handoff:
      generate_handoff(current)

    Display: "✅ Session saved for {current.name}"
```

### Step 3: Update Global Registry

```
registry.default_project = target.name
save(registry)
```

### Step 4: Load Target Context

```
target_act = target.path + "/.act/"

IF NOT exists(target_act):
  Display: "⚠️ No .act/ directory. Run /act:init in {target.path}"
  RETURN

# Read target state
state = load(target_act + "state.md")
config = load(target_act + "config.yaml")
plan = load(target_act + "plan.md")
```

### Step 5: Run Quick Reboot Test

```
# Run abbreviated 5-question check
run_reboot_test(target_act)
```

### Step 6: Display Summary

Show the formatted context switch summary with quick check results.

---

## Edge Cases

### Project Not Initialized

```
/act:switch new-project
→ ⚠️ No .act/ directory found at /path/to/new-project
→ 💡 Run: cd /path/to/new-project && /act:init
```

### Same Project

```
/act:switch act-framework  (already active)
→ ℹ️ Already on project 'act-framework'
```

### Stale Context (>7 days)

```
→ ⚠️ Last active 12 days ago. Context may be stale.
→ 💡 Consider running /act:resume for a full recovery.
```

---

## Integration

### With Session Recovery
Switch triggers a mini recovery (5-question check) for the target project.

### With Context Handoff
Use `--save-handoff` to create a full handoff document before switching.

### With /act:projects
The target must be a registered project in the global registry.

### With Progress Tracking
Switch events are logged in both projects' progress.md:
- Source: "Session paused - switching to {target}"
- Target: "Session resumed - switched from {source}"

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:projects` | List and manage registered projects |
| `/act:dashboard` | Multi-project overview |
| `/act:resume` | Full session recovery |
| `/act:handoff` | Generate context handoff |

---

*Command version: 1.0*
*ACT version: 3.0*
