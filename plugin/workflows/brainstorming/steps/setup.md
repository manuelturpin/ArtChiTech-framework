---
name: brainstorming-setup
description: Step 1 - Configure the brainstorming session based on project state
---

# Step 1: Setup

## Objective

Read project state and configure the brainstorming session context.

## Instructions

### 1.1 Read Project State

```bash
if [ -f ".epct/state.json" ]; then
  cat .epct/state.json
fi
```

Extract:
- `phase`: current phase number (1-7)
- `phase_name`: current phase name
- `project_name`: project name
- `mode`: project mode (COMPLET, FEATURE, QUICK)

If no state exists, default to:
- `phase`: 1
- `phase_name`: Discovery
- `mode`: COMPLET

### 1.2 Determine Context Type

| Context | Condition | Behavior |
|---------|-----------|----------|
| **New Project** | Phase 1, no prior sessions | Full Discovery brainstorming |
| **New Feature** | Mode = FEATURE | Feature-scoped brainstorming |
| **Resume Phase** | Returning to active phase | Continue from last session |
| **Refinement** | User wants to improve existing work | Targeted brainstorming |

### 1.3 Gather Session Parameters

Ask or infer the following:

1. **Topic**: What are we brainstorming about?
   - If new project: "What problem are you trying to solve?"
   - If new feature: "Describe the feature you want to add."
   - If resume: "What aspect of [phase_name] do you want to explore?"
   - If refinement: "What do you want to improve?"

2. **Constraints** (optional): Any limitations to consider?
   - Budget, timeline, tech stack, team size, etc.

3. **Objective**: What does success look like?
   - Number of ideas? A decision? A prioritized list?

### 1.4 Display Session Header

```
╭─────────────────────────────────────────────────────────────╮
│  🧠 ACT Brainstorming Session                               │
│                                                             │
│  📍 Phase: [phase_number] - [phase_name]                    │
│  🎯 Topic: [topic]                                          │
│  📋 Context: [New Project | Feature | Resume | Refinement]  │
│  ⏱️  Started: [timestamp]                                    │
╰─────────────────────────────────────────────────────────────╯
```

### 1.5 Initialize Session File

Create the session directory if needed:

```bash
mkdir -p .epct/brainstorming
```

Create session file: `.epct/brainstorming/session-{YYYY-MM-DD-HHmm}.md`

Write the header section from the template.

## Output

Pass to Step 2 (Selection):
- `phase`: number
- `phase_name`: string
- `context_type`: new_project | feature | resume | refinement
- `topic`: string
- `constraints`: string (optional)
- `objective`: string
- `session_file`: path to session file
