---
name: stories-parse-prd
description: Step 1 - Parse PRD to extract features, constraints, and personas
---

# Step 1: Parse PRD

## Objective

Read the PRD and extract structured data needed for Epic and Story creation.

## Instructions

### 1.1 Load PRD

```bash
# Find the most recent PRD
ls -t .epct/prd/prd-*.md 2>/dev/null | head -1
```

If no PRD found:
```
❌ No PRD found in .epct/prd/
💡 Run the PRD workflow first: internal:prd (create mode)
```

Read the PRD file.

### 1.2 Extract Features (PRD Section 3)

Parse the Features section and extract:

For each feature:
- Name
- Priority (Must Have / Should Have / Could Have / Won't Have)
- User need it addresses
- Acceptance criteria (from PRD)

Present extracted features:
```
╭─────────────────────────────────────────────────────────────╮
│  📋 Features Extracted from PRD                              │
│                                                             │
│  Must Have ([N]):                                           │
│    F-01: [feature_name] → [user_need]                       │
│    F-02: [feature_name] → [user_need]                       │
│                                                             │
│  Should Have ([N]):                                         │
│    F-03: [feature_name] → [user_need]                       │
│                                                             │
│  Could Have ([N]):                                          │
│    F-04: [feature_name] → [user_need]                       │
│                                                             │
│  Won't Have ([N]):                                          │
│    F-05: [feature_name] (excluded: [reason])                │
│                                                             │
│  Total features for decomposition: [N]                      │
│  (Won't Have features are excluded)                         │
╰─────────────────────────────────────────────────────────────╯
```

### 1.3 Extract Technical Constraints (PRD Section 4)

Parse the Technical Requirements section:
- Tech stack
- Integration requirements
- Performance targets
- Security requirements

These constraints inform story technical notes and estimation.

### 1.4 Extract Personas (PRD Section 2)

Parse the Users & Personas section:
- Persona names
- Primary goals
- Key pain points
- JTBD statements

These inform the "As a [persona]" part of user stories.

### 1.5 Present Parsed Structure

```
📊 PRD Parse Summary:

Features:    [N] total ([N] Must, [N] Should, [N] Could)
Personas:    [N] defined
Tech stack:  [stack summary]
Constraints: [N] technical constraints

Is this correct? (yes / re-parse / adjust)
```

### 1.6 Validate Parse Quality

Check for common issues:
- Features without acceptance criteria → Warn
- Features without priority → Assign "Should Have" default
- Missing personas → Warn, use generic "user" role
- No technical constraints → Warn

```
⚠️  Parse warnings:
- [N] features missing acceptance criteria
- [N] features missing priority (defaulted to Should Have)

Proceed to Epic creation? (yes / fix PRD first)
```

## Output

Pass to Step 2 (Create Epics):
- `features`: list of feature objects (id, name, priority, need, criteria)
- `personas`: list of persona objects (name, goal, pain, jtbd)
- `tech_constraints`: technical requirements summary
- `feature_count`: total features (excluding Won't Have)
- `must_have_count`: Must Have features count
