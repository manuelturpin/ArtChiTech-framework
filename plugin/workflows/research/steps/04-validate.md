---
name: research-validate
description: Step 4 - Map evidence to hypotheses, validate or invalidate each one
---

# Step 4: Validate

## Objective

Map research evidence to hypotheses, score each hypothesis, and determine the overall validation rate.

## Instructions

### 4.1 Create Validation Plan

**Non-Negotiable NN-008**: Validation plan must exist.

Read the hypotheses from Step 2 (`.epct/research/hypotheses.md`).

For each hypothesis, create a validation plan:

```
╭─────────────────────────────────────────────────────────────╮
│  📋 Validation Plan                                          │
│                                                             │
│  H[N]: [hypothesis summary]                                 │
│                                                             │
│  Evidence sources:                                          │
│  - Interviews: [which interviews are relevant]              │
│  - Benchmarks: [which competitors inform this]              │
│  - Personas: [which personas relate]                        │
│  - Other data: [any additional evidence]                    │
│                                                             │
│  Validation criteria:                                       │
│  - What would confirm this hypothesis?                      │
│  - What would invalidate it?                                │
│  - What is ambiguous?                                       │
╰─────────────────────────────────────────────────────────────╯
```

Save to `.epct/research/validation-plan.md`

### 4.2 Map Evidence to Hypotheses

For each hypothesis, gather and present all supporting and contradicting evidence:

```
🔬 Evidence Map for H[N]: [hypothesis summary]

Supporting Evidence:
  ✅ Interview [N]: "[relevant quote or finding]"
  ✅ Benchmark [name]: [relevant competitive data]
  ✅ [other supporting data]

Contradicting Evidence:
  ❌ Interview [N]: "[contradicting finding]"
  ❌ [other contradicting data]

Ambiguous:
  ❓ [data that could go either way]
```

### 4.3 Score Hypotheses

For each hypothesis, assign a validation status:

| Status | Criteria | Score |
|--------|----------|-------|
| **Validated** | Strong supporting evidence, minimal contradiction | 100% |
| **Partially Validated** | Mixed evidence, some support with caveats | 50% |
| **Invalidated** | Strong contradicting evidence or no support | 0% |

Present scoring:

```
📊 Hypothesis Validation Results:

| # | Hypothesis | Status | Score | Key Evidence |
|---|-----------|--------|-------|--------------|
| H1 | [summary] | ✅ Validated | 100% | [key point] |
| H2 | [summary] | ⚠️ Partial | 50% | [key point] |
| H3 | [summary] | ❌ Invalidated | 0% | [key point] |

Overall Validation Rate: [average]%
```

### 4.4 Check Validation Rate

**Red Flag RF-007 check**: If validation_rate < 50%, flag as HIGH.

```
⚠️  RED FLAG RF-007: Validation rate is [rate]% (below 50%)

This suggests weak problem-solution fit. Consider:
1. Re-evaluating the Problem Statement
2. Conducting additional research to fill gaps
3. Pivoting to a different problem or audience
4. Gathering more evidence before deciding
```

**Red Flag RF-006 check**: If days_since_last_interview > 30, flag as MEDIUM.

```
⚠️  RED FLAG RF-006: Last interview was [N] days ago.

Research data may be stale. Consider:
1. Conducting 2-3 fresh interviews to confirm findings
2. Noting this limitation in the synthesis
```

### 4.5 Concept Testing (Optional)

If applicable and the user wants to go further:

1. Create a concept based on validated hypotheses
2. Present the concept to 3-5 users (can reuse interview participants)
3. Gather feedback on the concept
4. Update hypothesis scores if new evidence emerges

### 4.6 Save Validation Results

```bash
# Save to .epct/research/validation-results.md
```

Include:
- Validation plan
- Evidence map per hypothesis
- Scoring table
- Overall validation rate
- Red flag status

## Output

Pass to Step 5 (Decide):
- `validation_results`: hypothesis scores and evidence
- `validation_rate`: overall percentage
- `nn_008_passed`: boolean (validation plan exists)
- `rf_006_status`: clear or flagged
- `rf_007_status`: clear or flagged
- `concept_test_results`: optional concept test data
