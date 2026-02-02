# SPEC: Hooks System

**Version:** 2.5.0
**Feature:** 3.2 - Hooks System
**Status:** Implementation
**Date:** 2026-02-02

---

## Overview

The Hooks System provides automated triggers that fire at specific points during agent execution. Unlike skills which are ~50-80% reliable (depend on agent remembering to use them), hooks are **100% reliable** because they're enforced by the runtime.

## Motivation

From research (SYNTHESIS.md):
> "Hooks are 100% reliable (vs skills ~50-80%)"

Agents often forget to:
- Re-check the plan before modifying code
- Update progress after completing work
- Verify all phases before declaring done

Hooks solve this by making these checks automatic and mandatory.

---

## The 3 Essential Hooks

### 1. PreToolUse Hook

**Trigger:** Before `Write`, `Edit`, or `Bash` tool execution

**Purpose:** Refresh goals before taking action to prevent drift

**Action:**
```
Before modifying files or running commands:
1. Re-read `.act/plan.md` (refresh current phase goals)
2. Verify action aligns with current phase
3. If deviation detected → apply deviation rules
```

**Rationale:** Prevents the agent from drifting away from the plan during long sessions.

---

### 2. PostToolUse Hook

**Trigger:** After `Write` or `Edit` tool execution

**Purpose:** Maintain progress log and session continuity

**Action:**
```
After modifying files:
1. Remind to update `.act/progress.md` with what was done
2. If significant milestone → update `.act/state.md`
3. Log the change for session recovery
```

**Rationale:** Ensures progress is tracked for session recovery and handoff.

---

### 3. Stop Hook

**Trigger:** Before session end or task completion claim

**Purpose:** Prevent premature completion claims

**Action:**
```
Before stopping or claiming completion:
1. Read `.act/plan.md` and list all phases
2. Verify each phase has completion evidence
3. Run verification checks if defined
4. If incomplete → warn and continue
5. If complete → allow stop
```

**Rationale:** Implements the Iron Law: "No completion claims without verification evidence."

---

## Hook Configuration

### hooks.json Structure

```json
{
  "version": "1.0",
  "hooks": {
    "PreToolUse": {
      "enabled": true,
      "triggers": ["Write", "Edit", "Bash"],
      "action": "refresh_plan",
      "config": {
        "planFile": ".act/plan.md",
        "checkAlignment": true
      }
    },
    "PostToolUse": {
      "enabled": true,
      "triggers": ["Write", "Edit"],
      "action": "update_progress",
      "config": {
        "progressFile": ".act/progress.md",
        "stateFile": ".act/state.md"
      }
    },
    "Stop": {
      "enabled": true,
      "triggers": ["complete", "done", "finished", "stop"],
      "action": "verify_completion",
      "config": {
        "planFile": ".act/plan.md",
        "requireEvidence": true
      }
    }
  }
}
```

---

## Implementation Details

### Hook Execution Flow

```
┌─────────────────────────────────────────────────────────┐
│                    Agent Session                        │
│                                                         │
│  ┌─────────┐                                            │
│  │ Request │                                            │
│  └────┬────┘                                            │
│       │                                                 │
│       ▼                                                 │
│  ┌─────────────┐     ┌──────────────────┐              │
│  │ Tool Call   │────▶│ PreToolUse Hook  │              │
│  │ (Write/Edit)│     │ → Read plan.md   │              │
│  └─────────────┘     │ → Check alignment│              │
│       │              └──────────────────┘              │
│       ▼                                                 │
│  ┌─────────────┐                                        │
│  │ Execute     │                                        │
│  │ Tool        │                                        │
│  └─────────────┘                                        │
│       │                                                 │
│       ▼                                                 │
│  ┌─────────────┐     ┌──────────────────┐              │
│  │ Tool Result │────▶│ PostToolUse Hook │              │
│  │             │     │ → Update progress│              │
│  └─────────────┘     └──────────────────┘              │
│       │                                                 │
│       ▼                                                 │
│  ┌─────────────┐     ┌──────────────────┐              │
│  │ Completion  │────▶│ Stop Hook        │              │
│  │ Claim       │     │ → Verify phases  │              │
│  └─────────────┘     └──────────────────┘              │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Deviation Rules Integration

When PreToolUse detects misalignment:

| Rule | Trigger | Action |
|------|---------|--------|
| 1 | Bugs | Auto-fix immediately |
| 2 | Missing critical | Auto-add immediately |
| 3 | Blockers | Auto-fix immediately |
| 4 | Architectural change | **STOP, ask user** |
| 5 | Enhancements | Log to ISSUES.md, continue |

---

## File Structure

```
hooks/
├── hooks.json              # Hook configuration
├── pre-tool-use.md         # PreToolUse hook documentation
├── post-tool-use.md        # PostToolUse hook documentation
└── stop.md                 # Stop hook documentation
```

---

## Usage Examples

### Example 1: PreToolUse in Action

```
Agent: I'll now create the user model...

[PreToolUse Hook Fires]
→ Reading .act/plan.md...
→ Current phase: "Database Schema Design"
→ Action: Create user model
→ ✓ Aligned with current phase
→ Proceeding with Write tool...
```

### Example 2: PostToolUse in Action

```
[Write tool executed: src/models/user.py]

[PostToolUse Hook Fires]
→ File modified: src/models/user.py
→ Reminder: Update .act/progress.md
→ Agent updates progress log
```

### Example 3: Stop Hook in Action

```
Agent: Task complete! All phases done.

[Stop Hook Fires]
→ Reading .act/plan.md...
→ Phase 1: Research ✓ (evidence in findings.md)
→ Phase 2: Design ✓ (schema in docs/)
→ Phase 3: Implementation ✓ (code committed)
→ Phase 4: Testing ⚠️ (no test evidence found)
→ 
→ WARNING: Phase 4 incomplete. Continue implementation.
```

---

## Testing Strategy

### Unit Tests
- Hook fires at correct trigger
- Hook reads correct files
- Hook detects misalignment

### Integration Tests
- Full workflow with all hooks
- Session recovery after interrupt
- Deviation handling

---

## References

- Planning Files framework (hooks inspiration)
- Everything CC (continuous context)
- GSD (deviation rules)

---

## Acceptance Criteria
- [x] hooks.json structure définie
- [x] PreToolUse hook documenté
- [x] PostToolUse hook documenté
- [x] Stop hook documenté
- [x] README hooks créé
- [x] Section dans CLAUDE.md

---

## Local Hooks

### Overview

Beyond framework-level hooks, ACT v2.5 supports **project-local hooks** defined in `.act/hooks.json`. This allows projects to customize hook behavior without modifying the framework.

### Hierarchy

```
┌─────────────────────────────────────┐
│ Project Hooks (.act/hooks.json)     │ ← Highest priority
├─────────────────────────────────────┤
│ Framework Hooks (hooks/hooks.json)  │ ← Base configuration
└─────────────────────────────────────┘
```

**Resolution order:**
1. Load framework hooks (base configuration)
2. If `extends: "framework"` in local hooks, merge with framework
3. Apply local overrides on top
4. Custom hooks are added to the hook registry

### Local hooks.json Structure

```json
{
  "$schema": "../../hooks/hooks-schema.json",
  "version": "1.0",
  "description": "Project-specific hooks",
  "extends": "framework",
  "hooks": {
    "CustomHook": {
      "enabled": true,
      "description": "Custom hook for this project",
      "triggers": ["custom-event"],
      "action": "custom_action",
      "config": {}
    }
  },
  "overrides": {
    "PreToolUse": {
      "config": {
        "additionalFiles": [".act/custom-context.md"]
      }
    }
  }
}
```

### Configuration Options

| Field | Type | Description |
|-------|------|-------------|
| `extends` | string | Base config to extend (`"framework"` or `"none"`) |
| `hooks` | object | Custom hooks specific to this project |
| `overrides` | object | Override config for framework hooks |

### Extends Modes

| Mode | Behavior |
|------|----------|
| `"framework"` | Inherit all framework hooks, apply overrides |
| `"none"` | Start fresh, no framework hooks inherited |

### Override Capabilities

You can override specific config values for framework hooks:

```json
{
  "overrides": {
    "PreToolUse": {
      "config": {
        "additionalFiles": ["docs/CONTEXT.md"],
        "checkAlignment": false
      }
    },
    "Stop": {
      "enabled": false
    }
  }
}
```

### Use Cases

1. **Project-specific context files**
   ```json
   "overrides": {
     "PreToolUse": {
       "config": {
         "additionalFiles": [".act/api-context.md"]
       }
     }
   }
   ```

2. **Disable hooks for quick iterations**
   ```json
   "overrides": {
     "PostToolUse": { "enabled": false }
   }
   ```

3. **Custom project hooks**
   ```json
   "hooks": {
     "PreDeploy": {
       "enabled": true,
       "triggers": ["deploy", "release"],
       "action": "run_checks",
       "config": { "checkList": ["tests", "lint", "build"] }
     }
   }
   ```

### Creating Local Hooks

Use the init command with `--with-hooks`:

```bash
/act:init --with-hooks
```

This creates `.act/hooks.json` from the template with:
- `extends: "framework"` (inherit base hooks)
- Empty `hooks` section for custom hooks
- Empty `overrides` section for customization

### Best Practices

**DO ✅**
- Use `extends: "framework"` to keep base protections
- Only override what you need
- Document why you disabled/modified a hook

**DON'T ❌**
- Disable Stop hook without good reason (removes completion verification)
- Use `extends: "none"` unless you really know what you're doing
- Create hooks that duplicate framework functionality

---

*Specification for ACT v2.5 Hooks System*
