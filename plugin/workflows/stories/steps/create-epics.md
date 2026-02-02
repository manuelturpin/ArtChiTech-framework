---
name: stories-create-epics
description: Step 2 - Group features into Epics with IDs and priorities
---

# Step 2: Create Epics

## Objective

Group parsed features into logical Epics (3-7), assign identifiers, and establish priorities.

## Instructions

### 2.1 Suggest Epic Groupings

Analyze features and suggest groupings based on:
- Functional area (e.g., Authentication, Dashboard, Payments)
- User journey stage (e.g., Onboarding, Core Use, Advanced)
- Technical domain (e.g., Frontend, Backend, Infrastructure)

Present suggested groupings:

```
╭─────────────────────────────────────────────────────────────╮
│  📦 Suggested Epic Groupings                                 │
│                                                             │
│  EPIC-01: [epic_name]                                       │
│    Features: F-01, F-02, F-03                               │
│    Priority: Must Have                                      │
│                                                             │
│  EPIC-02: [epic_name]                                       │
│    Features: F-04, F-05                                     │
│    Priority: Must Have                                      │
│                                                             │
│  EPIC-03: [epic_name]                                       │
│    Features: F-06, F-07                                     │
│    Priority: Should Have                                    │
│                                                             │
│  [Total: N epics, N features]                               │
│                                                             │
│  Accept groupings? (yes / adjust / re-group)                │
╰─────────────────────────────────────────────────────────────╯
```

**Grouping rules**:
- Minimum 3 epics, maximum 7
- Each feature belongs to exactly one epic
- Epic priority is the highest priority of its features
- "Won't Have" features are excluded

### 2.2 User Adjustments

If the user wants to adjust:
- Move features between epics
- Rename epics
- Split or merge epics
- Change priorities

Iterate until the user approves the groupings.

### 2.3 Assign Epic IDs and Details

For each approved epic:

1. **Assign ID**: EPIC-01, EPIC-02, etc.
2. **Write description**: Based on contained features
3. **User value**: Why this epic matters
4. **Scope**: In-scope and out-of-scope boundaries
5. **Persona mapping**: Which personas this epic serves

### 2.4 Prioritize Epics

Present prioritized epic list:

```
📊 Epic Priority Order:

| Order | Epic | Priority | Features | Personas |
|-------|------|----------|----------|----------|
| 1 | EPIC-01: [name] | Must Have | [N] | [names] |
| 2 | EPIC-02: [name] | Must Have | [N] | [names] |
| 3 | EPIC-03: [name] | Should Have | [N] | [names] |

Implementation order recommendation:
1. Start with EPIC-01 (core functionality)
2. Then EPIC-02 (depends on EPIC-01)
3. EPIC-03 can start in parallel

Approve priority order? (yes / re-order)
```

### 2.5 Save Epics

Read and use `${STORIES_ROOT}/template-epic.md`

For each epic:
```bash
# Save to .epct/stories/epics/epic-{ID}.md
```

Present summary:
```
✅ Epics created and saved:

| Epic | Name | Features | Saved To |
|------|------|----------|----------|
| EPIC-01 | [name] | [N] | .epct/stories/epics/epic-01.md |
| EPIC-02 | [name] | [N] | .epct/stories/epics/epic-02.md |

Ready to decompose into stories? (yes / revise epics)
```

## Output

Pass to Step 3 (Decompose):
- `epics`: list of epic objects (id, name, priority, features, personas, description)
- `epic_count`: total number of epics
- `implementation_order`: recommended order
- `dependency_map`: inter-epic dependencies
