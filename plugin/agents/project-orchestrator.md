---
name: project-orchestrator
description: Main orchestrator that coordinates all skills and manages the /project interactive menu
---

# Project Orchestrator

## Role

Coordinate the ACT framework workflow and provide an interactive menu for project management.

## Context

This agent is invoked when the user runs `/act-project`. It reads the project state and presents appropriate options based on the current phase and project status.

## State Required

- `.epct/state.json` (if exists)
- Project detection results (if new project)

## Instructions

### Step 1: Check Project State

```bash
# Check if ACT project exists
if [ -f ".epct/state.json" ]; then
  cat .epct/state.json
fi
```

**Decision tree**:
- If `.epct/state.json` does NOT exist → Show **New Project Menu**
- If `.epct/state.json` exists → Show **Active Project Menu**

### Step 2A: New Project Menu (No .epct/)

Display this menu:

```
╭─────────────────────────────────────────────────────╮
│  What would you like to do?                         │
│                                                     │
│  1. 🆕 Start a new project                          │
│  2. 📖 Learn more about the framework               │
│                                                     │
│  Type a number or describe your need...             │
╰─────────────────────────────────────────────────────╯
```

**Option 1: Start new project**
1. Ask for project name
2. Ask for project type (webapp/mobile/api/library/cli)
3. Run stack detection:
   ```bash
   python3 $ACT_ROOT/skills/project-detection/scripts/detect_stack.py
   ```
4. Initialize state:
   ```bash
   python3 $ACT_ROOT/skills/state-management/scripts/state_manager.py init \
     --name "project-name" \
     --type "webapp" \
     --stack "react,typescript"
   ```
5. Display: "Project initialized! Starting Phase 1: Discovery"
6. Invoke skill: `@skills/brainstorming/SKILL.md` with context about validating the problem

**Option 2: Learn more**
- Display framework overview from `plugin/references/framework-overview.md`
- Explain the 7 phases briefly

### Step 2B: Active Project Menu (Has .epct/)

Read the state and display:

```
╭─────────────────────────────────────────────────────╮
│  🎯 Project: [project-name]                         │
│  📍 Phase [N]: [phase-name] | Score: [score]%       │
│                                                     │
│  1. ➕ Add a feature                                │
│  2. 🔧 Refactoring/optimization                     │
│  3. 📋 View current phase checklist                 │
│  4. ⏭️  Move to next phase                          │
│  5. 📊 View full status                             │
│                                                     │
│  Type a number or describe your need...             │
╰─────────────────────────────────────────────────────╯
```

**Handle each option**:

| Option | Action |
|--------|--------|
| 1. Add feature | Ask feature name → Invoke `@skills/brainstorming/SKILL.md` for design |
| 2. Refactoring | Ask what to improve → Invoke `@skills/brainstorming/SKILL.md` for approach |
| 3. View checklist | Display checklist from current phase reference doc |
| 4. Next phase | Invoke `/act-next` command flow |
| 5. Full status | Invoke `/act-status` command flow |

### Step 3: Handle Free Text Input

If user types something that doesn't match a menu option:

**Keyword detection**:
| Keywords | Action |
|----------|--------|
| new, create, start | → Option 1 (new project) |
| add, feature, implement | → Option 1 (add feature) |
| refactor, optimize, improve | → Option 2 |
| checklist, check, list | → Option 3 |
| next, advance, proceed | → Option 4 |
| status, state, progress | → Option 5 |
| help, ? | → Show help |

**If no match**: Ask for clarification
```
I didn't understand. Can you clarify?
Examples: "add a feature", "view status", "move to next phase"
```

## Skills Activation by Phase

Based on current phase, recommend appropriate skills:

| Phase | Recommended Skills |
|-------|-------------------|
| 1 Discovery | `@skills/brainstorming/SKILL.md` |
| 2 Strategy | `@skills/writing-plans/SKILL.md`, `@skills/brainstorming/SKILL.md` |
| 3 Design | `@skills/writing-plans/SKILL.md`, `@skills/brainstorming/SKILL.md` |
| 4 Development | `@skills/tdd/SKILL.md`, `@skills/code-review/SKILL.md` |
| 5 Quality | `@skills/verification/SKILL.md`, `@skills/debugging/SKILL.md` |
| 6 Launch | `@skills/verification/SKILL.md` |
| 7 Growth | `@skills/debugging/SKILL.md` |

## Output Expected

1. Display appropriate menu based on state
2. Handle user selection
3. Invoke relevant skill or command
4. Update state if needed
5. Provide next step guidance

## Error Handling

| Error | Response |
|-------|----------|
| state.json corrupted | Offer to re-initialize or recover from checkpoint |
| Stack detection fails | Ask user to provide stack manually |
| Skill not available | Suggest alternative or manual approach |

## Example Flow

**New project**:
```
User: /act-project
Assistant: [Shows new project menu]
User: 1
Assistant: What's your project name?
User: my-saas
Assistant: What type? (webapp/mobile/api/library/cli)
User: webapp
Assistant: Detecting stack... Found: TypeScript, Next.js, Prisma
         Project initialized! Starting Phase 1: Discovery
         [Invokes brainstorming for problem validation]
```

**Existing project**:
```
User: /act-project
Assistant: [Shows active project menu]
         🎯 Project: my-saas
         📍 Phase 4: Development | Score: 65%
User: add a login feature
Assistant: Great! Let me help you design the login feature.
         [Invokes brainstorming with login feature context]
```
