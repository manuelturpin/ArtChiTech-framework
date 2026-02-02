---
name: research-explore
description: Step 3 - Conduct interviews, competitive analysis, and persona creation
---

# Step 3: Explore

## Objective

Gather primary and secondary research data through user interviews, competitive analysis, and persona creation. This is the most intensive research phase.

## Instructions

### 3.1 Interview Tracker

**Non-Negotiable NN-001**: Minimum 8 user interviews (BLOCKING).

Set up interview tracking:

```
╭─────────────────────────────────────────────────────────────╮
│  👥 Interview Progress                                       │
│                                                             │
│  Target: 8 interviews (minimum)                             │
│  Completed: [count]/8                                       │
│  [████░░░░░░░░░░░░░░░░] [count]/8                          │
│                                                             │
│  Actions:                                                   │
│  1. 📝 Log a completed interview                            │
│  2. 📋 View interview guide                                 │
│  3. 📊 View interview summary                               │
╰─────────────────────────────────────────────────────────────╯
```

**Red Flag RF-001 check**: If interview_count == 0, flag as CRITICAL and STOP other activities.

For each interview logged:
1. Ask for interview subject (anonymized identifier)
2. Key findings (3-5 bullet points)
3. Quotes (notable verbatim quotes)
4. Hypothesis relevance (which hypotheses does this inform?)

Save each interview:
```bash
# Save to .epct/research/interviews/interview-{N}-{YYYY-MM-DD}.md
```

### 3.2 Competitive Analysis

**Non-Negotiable NN-002**: Minimum 5 competitive benchmarks (BLOCKING).

Guide the user through competitive analysis using the template:

Read and use `${RESEARCH_ROOT}/templates/competitive-analysis.md`

**Red Flag RF-003 check**: If benchmark_count < 3, flag as HIGH.

For each competitor:
1. Name and description
2. Strengths and weaknesses
3. Target audience overlap
4. Feature comparison
5. Pricing model
6. Key differentiators

Save each analysis:
```bash
# Save to .epct/research/benchmarks/competitor-{name}.md
```

Track progress:
```
📊 Competitive Analysis Progress:

| # | Competitor | Status | Key Finding |
|---|-----------|--------|-------------|
| 1 | [name] | ✅ Done | [finding] |
| 2 | [name] | ✅ Done | [finding] |
| 3 | [name] | 🔄 In progress | - |
| 4 | - | ⏳ Pending | - |
| 5 | - | ⏳ Pending | - |

Completed: [count]/5
```

### 3.3 Persona Creation

**Non-Negotiable NN-007**: Minimum 2 persona drafts (BLOCKING).

Guide the user through persona creation using the template:

Read and use `${RESEARCH_ROOT}/templates/persona.md`

**Red Flag RF-005 check**: If persona_count == 0, flag as MEDIUM.

For each persona:
1. Name and demographics
2. Background and context
3. Goals and motivations
4. Pain points and frustrations
5. Current solutions and workarounds
6. Quote (representative verbatim)
7. Relevance to hypotheses

Cross-reference with:
- Interview findings (from 3.1)
- Brainstorming persona work (BT-055 Personas Canvas, BT-032 Empathy Map)

Save each persona:
```bash
# Save to .epct/research/personas/persona-{name}.md
```

### 3.4 Research Dashboard

Display a live dashboard showing all research progress:

```
╭─────────────────────────────────────────────────────────────╮
│  📊 Research Dashboard                                       │
│                                                             │
│  Interviews:  [██████████░░░░░░░░░░] [N]/8  [status]       │
│  Benchmarks:  [████████████░░░░░░░░] [N]/5  [status]       │
│  Personas:    [██████████████░░░░░░] [N]/2  [status]       │
│                                                             │
│  Non-Negotiables:                                           │
│  NN-001 Interviews ≥ 8:    [✅ PASS | ❌ FAIL | ⏳ PENDING] │
│  NN-002 Benchmarks ≥ 5:    [✅ PASS | ❌ FAIL | ⏳ PENDING] │
│  NN-007 Personas ≥ 2:      [✅ PASS | ❌ FAIL | ⏳ PENDING] │
│                                                             │
│  Red Flags:                                                 │
│  [List active red flags or "None active"]                   │
│                                                             │
│  What would you like to do next?                            │
│  1. Log interview  2. Add competitor  3. Create persona     │
│  4. View details   5. Proceed to validation                 │
╰─────────────────────────────────────────────────────────────╯
```

**BLOCKING**: Option 5 (proceed to validation) is only available when ALL three non-negotiables (NN-001, NN-002, NN-007) are PASS.

### 3.5 Additional Research Methods

If the user selected additional methodologies in Step 1 (e.g., surveys, JTBD analysis), guide them through execution:

- For JTBD Analysis (RM-015): Use BT-029 from brainstorming techniques
- For Empathy Maps (RM-021): Use BT-032 from brainstorming techniques
- Save outputs to appropriate `.epct/research/` subdirectories

## Output

Pass to Step 4 (Validate):
- `interview_count`: number of completed interviews
- `benchmark_count`: number of competitive analyses
- `persona_count`: number of persona drafts
- `interview_findings`: key findings across all interviews
- `competitive_landscape`: summary of competitive analysis
- `personas`: list of persona summaries
- `nn_001_passed`: boolean (8+ interviews)
- `nn_002_passed`: boolean (5+ benchmarks)
- `nn_007_passed`: boolean (2+ personas)
- `rf_001_status`: clear or flagged
- `rf_003_status`: clear or flagged
- `rf_005_status`: clear or flagged
