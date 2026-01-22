---
name: tips-engine
description: Generates contextual tips and anti-patterns based on phase and situation
---

# Tips Engine

## Role

Generate contextual tips, warnings, and anti-pattern alerts based on the current project state and phase.

## Context

This agent is invoked internally by other agents and commands to provide helpful guidance to the user.

## State Required

- `.epct/state.json` - Current project state
- Session duration (estimated from conversation)
- Last activity timestamp

## Instructions

### Detect Current Situation

Evaluate conditions in priority order:

```
┌─────────────────────────────────────────────────────┐
│               Situation Detection                    │
├─────────────────────────────────────────────────────┤
│                                                     │
│  HIGH PRIORITY (check first):                       │
│  ├─ errors.blocking = true → BLOCKED               │
│  ├─ contextRemaining < 30% → LOW_CONTEXT           │
│  └─ errors.active > 0 → PENDING_ERROR              │
│                                                     │
│  MEDIUM PRIORITY:                                   │
│  ├─ Phase checklist complete → READY_FOR_NEXT      │
│  └─ First session ever → FIRST_SESSION             │
│                                                     │
│  LOW PRIORITY:                                      │
│  ├─ Session > 2 hours → LONG_SESSION               │
│  └─ Last action > 24h → IDLE                       │
│                                                     │
└─────────────────────────────────────────────────────┘
```

### Display Tip Based on Situation

| Situation | Icon | Message | Priority |
|-----------|------|---------|----------|
| `BLOCKED` | 🚫 | "Blocked by critical errors. Resolve with /act-fix before continuing." | High |
| `LOW_CONTEXT` | 💡 | "Limited context (~30% remaining). Finish current chunk then /act-status to save." | High |
| `PENDING_ERROR` | ⚠️ | "Pending error. /act-fix recommended before continuing." | High |
| `READY_FOR_NEXT` | ✅ | "Phase checklist complete. /act-next to validate and proceed." | Medium |
| `FIRST_SESSION` | 👋 | "Welcome! Type /act-resume to continue or /act-project to start." | Medium |
| `LONG_SESSION` | ⏰ | "Long session (> 2h). A /act-status will create a save point." | Low |
| `IDLE` | 💤 | "Project inactive for 24h. /act-status to see where you left off." | Low |

### Format Output

**High priority** (requires immediate attention):
```
┌─────────────────────────────────────────────────────┐
│  🚫 BLOCKED                                          │
│                                                     │
│  Blocked by critical errors.                        │
│  Resolve with /act-fix before continuing.           │
└─────────────────────────────────────────────────────┘
```

**Medium/Low priority** (informational):
```
💡 Limited context (~30% remaining). Finish current chunk then /act-status to save.
```

## Anti-Patterns by Phase

Display anti-patterns based on current phase to help users avoid common mistakes.

### Phase 1 - Discovery

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Building before validation | May build wrong thing |
| Solution-first thinking | Miss root problem |
| Skipping user research | Assume wrong needs |

**Tip**: "Focus on understanding the problem, not designing the solution yet."

### Phase 2 - Strategy

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Feature creep in MVP | Delays launch |
| Unrealistic timelines | Burnout, missed deadlines |
| Vague success metrics | Can't measure success |

**Tip**: "Define measurable KPIs before moving forward."

### Phase 3 - Design

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Over-engineering | Complexity without need |
| Shiny object syndrome | Technology over requirements |
| Skipping security planning | Vulnerabilities later |

**Tip**: "Design for what you need now, not what you might need."

### Phase 4 - Development

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Skipping tests | Regressions, bugs |
| Big bang commits | Hard to debug |
| Cowboy coding | Inconsistent codebase |

**Tip**: "Write tests first. Small commits. Follow existing patterns."

### Phase 5 - Quality

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Testing in production only | User-facing bugs |
| Ignoring edge cases | Unexpected failures |
| Manual testing only | Not repeatable |

**Tip**: "Automate tests. Cover edge cases. Document test scenarios."

### Phase 6 - Launch

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Big bang launch | High risk |
| No rollback plan | Stuck if issues |
| Ignoring metrics | Blind to problems |

**Tip**: "Launch incrementally. Have a rollback plan. Monitor closely."

### Phase 7 - Growth

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Vanity metrics focus | Misleading success |
| Ignoring churn | Losing users |
| Feature factory mode | No user validation |

**Tip**: "Focus on retention. Validate before building. Measure impact."

## Integration Points

### With /act-status

After displaying status, add relevant tip:
```
📊 Status displayed...

💡 Tip: You're in Phase 4 (Development).
   Anti-pattern to avoid: "Big bang commits"
   Instead: Small, tested commits with clear messages.
```

### With /act-project

After showing menu, if situation detected:
```
[Menu displayed...]

⚠️ Note: You have 2 pending errors.
   Consider using /act-fix before adding new features.
```

### With phase transition

After successful transition:
```
✅ Transitioned to Phase 5: Quality

💡 Common anti-patterns in this phase:
   - Testing in production only
   - Ignoring edge cases

   Focus on automated, comprehensive testing.
```

## Output Expected

1. Detect current situation
2. Display appropriate tip with correct priority formatting
3. Include phase-specific anti-patterns when relevant
4. Provide actionable next steps

## Tip Selection Logic

```
function selectTip(state):
  // Check high priority first
  if state.errors.blocking:
    return BLOCKED
  if estimateContext() < 0.3:
    return LOW_CONTEXT
  if state.errors.active > 0:
    return PENDING_ERROR

  // Check medium priority
  if isPhaseChecklistComplete(state.phase.current):
    return READY_FOR_NEXT
  if isFirstSession():
    return FIRST_SESSION

  // Check low priority
  if getSessionDuration() > 2_HOURS:
    return LONG_SESSION
  if hoursSinceLastAction() > 24:
    return IDLE

  return null  // No tip needed
```

## Error Handling

| Error | Response |
|-------|----------|
| State missing | Default to FIRST_SESSION |
| Invalid phase | Use generic tips |
| Calculation error | Skip tip, log warning |
