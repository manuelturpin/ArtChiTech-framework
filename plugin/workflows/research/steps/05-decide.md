---
name: research-decide
description: Step 5 - Generate synthesis, final non-negotiable check, Go/No-Go/Pivot decision
---

# Step 5: Decide

## Objective

Synthesize all research findings, perform a final check of all non-negotiables, and present a Go/No-Go/Pivot decision.

## Instructions

### 5.1 Final Non-Negotiable Check

Read `non-negotiables.csv` and verify ALL blocking criteria:

```
╭─────────────────────────────────────────────────────────────╮
│  ✅ Final Non-Negotiable Check                               │
│                                                             │
│  NN-001 User Interviews ≥ 8:        [✅ PASS | ❌ FAIL]     │
│  NN-002 Competitive Benchmarks ≥ 5: [✅ PASS | ❌ FAIL]     │
│  NN-003 Problem Statement exists:   [✅ PASS | ❌ FAIL]     │
│  NN-004 Repository initialized:     [✅ PASS | ❌ FAIL]     │
│  NN-005 Stakeholder Alignment:      [✅ PASS | ⚠️ SKIP]     │
│  NN-006 Hypotheses ≥ 3:            [✅ PASS | ❌ FAIL]     │
│  NN-007 Persona Drafts ≥ 2:        [✅ PASS | ❌ FAIL]     │
│  NN-008 Validation Plan exists:     [✅ PASS | ❌ FAIL]     │
│                                                             │
│  Result: [ALL PASS | BLOCKING FAILURES]                     │
╰─────────────────────────────────────────────────────────────╯
```

**CRITICAL**: If ANY blocking non-negotiable FAILS:
```
❌ CANNOT PROCEED - Blocking Non-Negotiables Failed:

[List failed NNs with corrective actions from CSV]

You must address these before the research can conclude.
Go/No-Go decision is BLOCKED.
```

Do NOT proceed to synthesis or Go/No-Go until all blocking NNs pass.

### 5.2 Generate Research Synthesis

Read and use `${RESEARCH_ROOT}/templates/research-synthesis.md`

Compile all research findings into a comprehensive synthesis:

1. **Executive Summary**: 3-5 sentence overview of key findings
2. **Problem Validation**: Is the problem real and worth solving?
3. **User Understanding**: Personas, JTBD, key user insights
4. **Market Landscape**: Competitive analysis summary, market sizing
5. **Hypothesis Results**: Validation scores and key evidence
6. **Key Insights**: 5-7 most important learnings
7. **Recommendations**: What should the team do next?

Present for review:
```
📝 Research Synthesis Draft:

[formatted synthesis preview]

Review and approve? (yes / revise section)
```

### 5.3 Red Flag Summary

Read `red-flags.csv` and present all flag statuses:

```
🚩 Red Flag Summary:

| Flag | Status | Details |
|------|--------|---------|
| RF-001 No interviews | ✅ Clear | [N] interviews conducted |
| RF-002 No problem statement | ✅ Clear | Problem Statement exists |
| RF-003 Few benchmarks | ✅ Clear | [N] benchmarks completed |
| RF-004 No hypotheses | ✅ Clear | [N] hypotheses formulated |
| RF-005 No personas | ✅ Clear | [N] personas created |
| RF-006 Stale data | [status] | Last interview: [date] |
| RF-007 Low validation | [status] | Validation rate: [N]% |
```

### 5.4 Go/No-Go/Pivot Decision

Based on all research data, present the decision framework:

```
╭─────────────────────────────────────────────────────────────╮
│  🎯 Research Decision                                        │
│                                                             │
│  Validation Rate: [N]%                                      │
│  Non-Negotiables: [N]/8 passed                              │
│  Red Flags: [N] active                                      │
│                                                             │
│  ═══════════════════════════════════════════════════════     │
│                                                             │
│  Recommendation: [GO | NO-GO | PIVOT]                       │
│                                                             │
│  1. ✅ GO - Problem validated, proceed to Strategy           │
│  2. ❌ NO-GO - Problem not validated, stop project           │
│  3. 🔄 PIVOT - Adjust problem or audience, re-research       │
│                                                             │
│  What is your decision?                                     │
╰─────────────────────────────────────────────────────────────╯
```

**Decision criteria**:
| Validation Rate | Red Flags | Recommendation |
|----------------|-----------|----------------|
| ≥ 70% | 0 critical | GO |
| 50-69% | 0-1 active | GO with caution |
| 50-69% | 2+ active | PIVOT |
| < 50% | Any | NO-GO or PIVOT |

### 5.5 Save Synthesis and Update State

Save the complete synthesis:
```bash
# Save to .epct/research/synthesis-{YYYY-MM-DD}.md
```

Update project state:
```json
{
  "research_completed": true,
  "research_date": "YYYY-MM-DD",
  "research_decision": "GO|NO-GO|PIVOT",
  "validation_rate": N,
  "hypotheses_validated": N,
  "interviews_conducted": N,
  "personas_created": N,
  "benchmarks_completed": N
}
```

### 5.6 Next Steps

Based on decision:

**If GO**:
```
✅ Research complete! Proceeding to Strategy phase.

Next steps:
1. Run `/act-next` to advance to Phase 2: Strategy
2. Use research synthesis as input for PRD creation
3. Personas will feed into user stories

💡 Tip: Your research data in .epct/research/ will be used by the PRD workflow.
```

**If NO-GO**:
```
❌ Research indicates the problem is not validated.

Options:
1. Archive this research and explore a different problem
2. Revisit brainstorming with new constraints
3. Conduct additional research to fill gaps

Run internal:brainstorming to explore alternatives.
```

**If PIVOT**:
```
🔄 Pivot recommended based on research findings.

Suggested pivots:
[Based on partially validated hypotheses and interview insights]

1. Restart research with adjusted Problem Statement
2. Target a different user segment
3. Explore an adjacent problem space

Run this research workflow again with the pivoted scope.
```

## Output

Final deliverables:
- Research synthesis saved to `.epct/research/synthesis-{date}.md`
- All non-negotiables verified
- All red flags assessed
- Go/No-Go/Pivot decision documented
- State updated
- Next steps with ACT commands
