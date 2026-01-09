---
name: act-project
description: ACT main hub - Single entry point for managing projects (new, feature, refactor, status)
---

# /project - ACT Main Hub

You are the main hub of the ACT framework. You manage the entry point for all projects.

## Step 0: Check Local Project State First

**First**, check if an ACT project already exists locally:

```bash
if [ -f ".epct/state.json" ]; then
  echo "✅ ACT project found locally"
  # Skip to Context C (Known ACT Project)
fi
```

## Step 0b: Resolve ACT Path (for new projects)

For new projects or audits, set the ACT path:

```bash
ACT_ROOT=".claude/act"

if [ ! -d "$ACT_ROOT" ]; then
    echo '❌ ACT non installé dans ce projet.'
    echo ''
    echo '💡 Installation :'
    echo '   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash'
    exit 1
fi
```

## Step 1: Context Detection

If `.epct/state.json` exists, skip directly to **Context C**.

Otherwise, execute the detection script:

```bash
python3 ${ACT_ROOT}/skills/project-detection/scripts/detect_stack.py
```

## Step 2: Determine Context

Based on results:

### Context A: New Project (no significant code)

If detection returns `type: "research"` or error, and no `.epct/`:

Display:
```
╭─────────────────────────────────────────────────────╮
│  🚀 ACT Framework - New Project                     │
│                                                     │
│  No active project detected.                        │
│                                                     │
│  1. 🆕 Start a new project                          │
│  2. 📖 Learn more about the framework               │
│                                                     │
│  Type the number or describe your need...           │
╰─────────────────────────────────────────────────────╯
```

If choice 1:
1. Ask for project name
2. **Initialize EPCT state:**
   ```bash
   python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py init \
     --name "[project-name]" \
     --type "new" \
     --stack ""
   ```
3. Confirm initialization:
   ```
   ✅ Project "[project-name]" initialized!
   📁 State saved in .epct/state.json
   🎯 Starting Phase 1: Discovery
   ```
4. Use `superpowers:brainstorming` for the Discovery phase.

### Context B: Existing non-ACT Project (code without .epct/)

If code detected but `.epct/` does not exist:

Display:
```
📁 Existing project detected: [detected stack]
🔍 Launching initial audit...
```

Then automatically execute `/onboard` (spawn the command).

After the audit, return to the normal menu (Context C).

### Context C: Known ACT Project (code + .epct/)

If `.epct/state.json` exists, read the state:

```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py read
```

Display the menu adapted to the phase:
```
╭─────────────────────────────────────────────────────────────╮
│  🚀 [project-name] | Phase: [phase-name] ([current]/7)      │
│                                                             │
│  What would you like to do?                                 │
│                                                             │
│  1. ➕ Add a feature                                        │
│  2. 🔧 Refactoring/Quick fix                                │
│  3. 📋 View current phase checklist                         │
│  4. ⏭️  Move to next phase                                  │
│  5. 📊 View complete status                                 │
│  6. 🔄 Re-audit project                                     │
│                                                             │
│  Type the number or describe your need...                   │
╰─────────────────────────────────────────────────────────────╯
```

## Step 3: Handle Choice

| Choice | Action |
|--------|--------|
| 1 | Ask for feature name → Update state mode=FEATURE → Spawn `superpowers:brainstorming` |
| 2 | Update state mode=QUICK → Ask for description → Execute |
| 3 | Display checklist for current phase from `references/phases/` |
| 4 | Execute `/next` |
| 5 | Execute `/status` |
| 6 | Execute `/onboard` |

## Step 3b: Handle Free Text Input

When the user types free text instead of a number, detect their intention:

### Intent Detection Keywords

| Intent | Keywords (FR + EN) | Action |
|--------|-------------------|--------|
| **Resume phase** | "repren", "continu", "retourn", "travaill", "resume" | Go to Phase Work flow |
| **Improve/Refine** | "amélio", "modifi", "affin", "improve", "refine", "update" | Go to Refinement flow |
| **Question** | "comment", "pourquoi", "qu'est-ce", "how", "why", "what" | Answer directly |

### Phase Work Flow

When user wants to resume/continue a phase:

1. Read current state to get phase info
2. Display:
   ```
   🔄 Resume phase: [phase-name]

   Would you like to use structured brainstorming to guide your thinking?

   1. ✅ Yes - Launch superpowers:brainstorming
   2. ⏭️  No - Continue directly with the checklist
   ```
3. If choice 1 → Spawn `superpowers:brainstorming` with phase context
4. If choice 2 → Display phase checklist from `references/phases/`

### Refinement Flow

When user wants to improve/refine something:

1. **Always** spawn `superpowers:brainstorming`
2. Pass the current phase and user's refinement request as context

## Dependencies

This hub requires the `superpowers` plugin for advanced workflows.

### Required Skills

| Skill | Usage |
|-------|-------|
| `superpowers:brainstorming` | New feature (choice 1), Resume phase (Step 3b), Refinement (Step 3b) |

### Skill Invocation Rules

| Context | Brainstorming |
|---------|---------------|
| Choice 1 (Add feature) | **Always** invoke |
| Resume phase (free text) | **Propose** (user chooses) |
| Refinement (free text) | **Always** invoke |
| Choice 2 (Quick fix) | Never invoke |
