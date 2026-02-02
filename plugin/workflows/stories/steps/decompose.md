---
name: stories-decompose
description: Step 3 - Decompose Epics into dev-ready User Stories with estimation
---

# Step 3: Decompose into Stories

## Objective

Break each Epic into dev-ready User Stories with acceptance criteria, T-shirt size estimation, and dependency mapping.

## Instructions

### 3.1 Process Each Epic

For each Epic in implementation order:

```
╭─────────────────────────────────────────────────────────────╮
│  📦 Decomposing: {EPIC_ID} - {epic_name}                    │
│                                                             │
│  Features in this epic: [N]                                 │
│  Priority: [priority]                                       │
│  Personas: [persona_list]                                   │
╰─────────────────────────────────────────────────────────────╯
```

### 3.2 Create Stories from Features

For each feature in the epic:

1. **Identify story candidates**: Break the feature into 1-5 stories
   - Each story should be independently deliverable
   - Target size: S to L (0.5 to 5 days)
   - If a story would be XL, break it down further

2. **Write user story format**:
   ```
   As a {persona},
   I want to {action},
   so that {benefit}.
   ```

3. **Define acceptance criteria** (3-5 per story):
   - Specific and testable
   - Covers happy path and key edge cases
   - Includes any relevant non-functional requirements

4. **Estimate size** using `estimation-guide.csv`:
   Read the estimation guide and apply:

   | Size | Effort | When to Use |
   |------|--------|-------------|
   | XS | <0.5 day | Config/typo/trivial change |
   | S | 0.5-1 day | Small self-contained feature |
   | M | 1-3 days | Multi-file feature with moderate logic |
   | L | 3-5 days | Complex multi-layer feature |
   | XL | 5+ days | Too large — break down further |

5. **Add technical notes**:
   - Files likely affected
   - API changes needed
   - Integration points

6. **Map dependencies**:
   - Which stories must be completed first
   - External dependencies (APIs, services, etc.)

### 3.3 Present Stories per Epic

```
📋 Stories for {EPIC_ID} - {epic_name}:

| ID | Story | Size | Effort | Depends On |
|----|-------|------|--------|------------|
| S-001 | [title] | S | 0.5-1d | - |
| S-002 | [title] | M | 1-3d | S-001 |
| S-003 | [title] | M | 1-3d | - |
| S-004 | [title] | L | 3-5d | S-002, S-003 |

Epic total estimate: [sum] days
Stories: [count]

Accept these stories? (yes / adjust / add more / split further)
```

### 3.4 Story Quality Checks

For each story, verify:
- [ ] User story format is complete (As a / I want / So that)
- [ ] 3-5 acceptance criteria defined
- [ ] Size is S to L (XL must be split)
- [ ] Technical notes included
- [ ] Dependencies mapped
- [ ] Traceability to PRD feature and epic

Flag issues:
```
⚠️  Quality checks:
- S-004: Size XL → should be broken into smaller stories
- S-002: Only 1 acceptance criterion → add 2 more
```

### 3.5 Save Stories

Read and use `${STORIES_ROOT}/template-story.md`

For each story:
```bash
# Save to .epct/stories/stories/story-{ID}.md
```

### 3.6 Generate Summary

After all epics are decomposed:

```
╭─────────────────────────────────────────────────────────────╮
│  📊 Stories Decomposition Complete                           │
│                                                             │
│  Epics:   [N]                                               │
│  Stories: [N] total                                         │
│                                                             │
│  By Size:                                                   │
│    XS: [N] | S: [N] | M: [N] | L: [N]                     │
│                                                             │
│  By Priority:                                               │
│    Must Have: [N] | Should Have: [N] | Could Have: [N]     │
│                                                             │
│  Total Estimated Effort: [N] days                           │
│                                                             │
│  Files:                                                     │
│    Epics: .epct/stories/epics/                              │
│    Stories: .epct/stories/stories/                           │
╰─────────────────────────────────────────────────────────────╯
```

### 3.7 Next Steps

```
✅ Stories ready for development!

Next steps:
1. Review stories in .epct/stories/stories/
2. Run /act-next to advance to Phase 4: Development
3. Use superpowers:test-driven-development for implementation
4. Stories can be imported into your project management tool

💡 Tip: Start with Must Have stories from EPIC-01.
   Each story includes traceability back to PRD → Research → Hypotheses.
```

### 3.8 Update State

Update `.epct/state.json` with:
```json
{
  "stories_created": true,
  "stories_date": "YYYY-MM-DD",
  "epic_count": N,
  "story_count": N,
  "total_effort_days": N
}
```

## Output

Final deliverables:
- All stories saved to `.epct/stories/stories/`
- All epics saved to `.epct/stories/epics/`
- Summary with effort estimation
- State updated
- Next steps with ACT commands
