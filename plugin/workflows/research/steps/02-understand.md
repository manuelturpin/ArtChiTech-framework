---
name: research-understand
description: Step 2 - Analyze existing data, create Problem Statement, formulate hypotheses
---

# Step 2: Understand

## Objective

Build a deep understanding of the problem space by analyzing existing data, creating a formal Problem Statement, and formulating testable hypotheses.

## Instructions

### 2.1 Analyze Existing Data

Check for available inputs:

```bash
# Brainstorming outputs
ls .epct/brainstorming/ 2>/dev/null

# Any existing research
ls .epct/research/ 2>/dev/null
```

If brainstorming outputs exist:
- Read the most recent session file
- Extract key insights, top ideas, and themes
- Note relevant techniques used (especially BT-032 Empathy Map, BT-029 JTBD, BT-026 VPC)

Present findings:
```
📂 Existing data found:

Brainstorming:
- Session: [date] - [topic]
- Top ideas: [count]
- Key themes: [list]

This data will inform our Problem Statement and hypotheses.
```

If no existing data, proceed with fresh research.

### 2.2 Create Problem Statement

**Non-Negotiable NN-003**: Problem Statement must exist.

Guide the user through the Problem Statement template:

Read and use `${RESEARCH_ROOT}/templates/problem-statement.md`

Walk through each section:
1. **The Problem**: What is the core problem?
2. **Who is affected**: Who experiences this problem?
3. **Current alternatives**: How do people solve this today?
4. **Impact**: What happens if the problem remains unsolved?
5. **Evidence**: What data supports this problem exists?

Present for validation:
```
📝 Problem Statement Draft:

[formatted problem statement]

Does this accurately capture the problem? (yes / revise)
```

Save to `.epct/research/problem-statement.md`

**Red Flag RF-002 check**: If Problem Statement is not created, flag as CRITICAL.

### 2.3 Formulate Hypotheses

**Non-Negotiable NN-006**: Minimum 3 testable hypotheses.

Guide the user to formulate hypotheses in this format:

```
Hypothesis [N]:
  We believe that [target user]
  has a problem with [problem description]
  because [reason/evidence].
  We will know this is true when [measurable outcome].
```

Generate 3-5 hypotheses based on:
- Problem Statement
- Brainstorming insights (if available)
- User's domain knowledge

Present:
```
🔬 Hypotheses:

H1: [hypothesis summary]
H2: [hypothesis summary]
H3: [hypothesis summary]

Are these testable and specific enough? (yes / revise / add more)
```

**Red Flag RF-004 check**: If no hypotheses formulated, flag as HIGH.

### 2.4 Prioritize Hypotheses

Use Assumption Mapping (BT-033 from brainstorming) to prioritize:

For each hypothesis, score:
- **Impact** (1-5): How important is this if true?
- **Uncertainty** (1-5): How unsure are we about this?

Priority = Impact x Uncertainty (test highest-priority first)

```
📊 Hypothesis Priority:

| # | Hypothesis | Impact | Uncertainty | Priority | Test Order |
|---|-----------|--------|-------------|----------|------------|
| H1 | [summary] | 5 | 4 | 20 | 1st |
| H2 | [summary] | 4 | 3 | 12 | 2nd |
| H3 | [summary] | 3 | 5 | 15 | 2nd |
```

### 2.5 Save Understanding Artifacts

Save all outputs:

```bash
# Problem Statement
# Already saved in 2.2

# Hypotheses
# Save to .epct/research/hypotheses.md
```

## Output

Pass to Step 3 (Explore):
- `problem_statement`: path to saved file
- `hypotheses`: list of hypothesis objects (id, summary, impact, uncertainty, priority)
- `brainstorming_insights`: extracted themes and ideas (if available)
- `nn_003_passed`: boolean (Problem Statement exists)
- `nn_006_passed`: boolean (3+ hypotheses formulated)
- `rf_002_status`: clear or flagged
- `rf_004_status`: clear or flagged
