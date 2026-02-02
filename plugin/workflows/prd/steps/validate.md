---
name: prd-validate
description: Mode 2 - Validate and score an existing PRD against section criteria
---

# PRD Validate Mode

## Objective

Score an existing PRD against the 7 section definitions and their validation criteria. Produce a validation report with a Go/No-Go verdict.

## Instructions

### V.1 Load Existing PRD

```bash
ls .epct/prd/*.md 2>/dev/null
```

If multiple PRDs exist, present selection:
```
📄 Found PRDs:
1. prd-2024-01-15.md (most recent)
2. prd-2024-01-10.md

Which PRD to validate? (number or "latest")
```

If no PRD found:
```
❌ No PRD found in .epct/prd/
💡 Run this workflow in Create mode first, or place your PRD in .epct/prd/
```

Read the selected PRD file.

### V.2 Score Each Section

Read `sections.csv` from the workflow directory.

For each section (PRD-001 through PRD-007):

1. **Check presence**: Does the section exist in the PRD?
2. **Apply validation criteria** from `sections.csv`
3. **Score**: Complete (100%) / Partial (50%) / Missing (0%)

```
╭─────────────────────────────────────────────────────────────╮
│  ✅ PRD Validation: [section_name]                           │
│                                                             │
│  Presence: [Found / Not Found]                              │
│                                                             │
│  Validation criteria:                                       │
│  [✅ | ⚠️ | ❌] [criterion 1]                                │
│  [✅ | ⚠️ | ❌] [criterion 2]                                │
│  [✅ | ⚠️ | ❌] [criterion 3]                                │
│                                                             │
│  Section Score: [100% | 50% | 0%]                           │
╰─────────────────────────────────────────────────────────────╯
```

### V.3 Generate Validation Report

Compile all section scores:

```
╭─────────────────────────────────────────────────────────────╮
│  📊 PRD Validation Report                                    │
│                                                             │
│  PRD: [filename]                                            │
│  Date: [validation_date]                                    │
│                                                             │
│  Section Scores:                                            │
│  1. Vision & Objectives:    [████████████████░░░░] 80%      │
│  2. Users & Personas:       [██████████████████░░] 90%      │
│  3. Features:               [████████████░░░░░░░░] 60%      │
│  4. Technical Requirements: [████████████████████] 100%     │
│  5. Success Metrics:        [████████░░░░░░░░░░░░] 40%     │
│  6. Risks & Mitigations:    [████████████████░░░░] 80%      │
│  7. Timeline:               [░░░░░░░░░░░░░░░░░░░░] 0%      │
│                                                             │
│  Overall Score: [score]%                                    │
│  Required sections complete: [N]/6                          │
│                                                             │
│  Verdict: [GO | NEEDS WORK | INCOMPLETE]                    │
╰─────────────────────────────────────────────────────────────╯
```

**Verdict criteria**:
| Overall Score | Required Sections | Verdict |
|--------------|-------------------|---------|
| ≥ 70% | 6/6 complete | GO - PRD ready for stories |
| 50-69% | 4+/6 complete | NEEDS WORK - Address gaps |
| < 50% | Any | INCOMPLETE - Major revision needed |

### V.4 Recommendations

For each section scoring below 100%, provide specific recommendations:

```
📋 Improvement Recommendations:

Section 3 - Features (60%):
  ⚠️ Missing MoSCoW categorization
  ⚠️ Acceptance criteria not defined for 2 features
  💡 Action: Categorize all features and add acceptance criteria

Section 5 - Success Metrics (40%):
  ❌ Only 1 KPI defined (minimum 3)
  ❌ No measurement method specified
  💡 Action: Define 3+ KPIs with measurement methods

Section 7 - Timeline (0%):
  ℹ️ Optional section - not blocking
  💡 Action: Add milestones if timeline is known
```

### V.5 Save Report

```bash
# Save to .epct/prd/validation-{YYYY-MM-DD}.md
```

```
✅ Validation report saved.

Next steps based on verdict:
[If GO] → Run internal:stories to decompose PRD into stories
[If NEEDS WORK] → Run this workflow in Edit mode to fix gaps
[If INCOMPLETE] → Run this workflow in Create mode to rebuild
```

## Output

- Validation report saved to `.epct/prd/`
- Per-section scores
- Overall Go/No-Go verdict
- Specific improvement recommendations
