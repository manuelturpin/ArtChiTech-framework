---
name: research-preparation
description: Step 1 - Align stakeholders, define scope, initialize research repository
---

# Step 1: Preparation

## Objective

Set up the research environment, align stakeholders on goals, and recommend appropriate methodologies.

## Instructions

### 1.1 Read Project State

```bash
if [ -f ".epct/state.json" ]; then
  cat .epct/state.json
fi
```

Extract:
- `phase`: current phase number
- `phase_name`: current phase name
- `project_name`: project name
- `mode`: project mode (COMPLET, FEATURE, QUICK)

If no state exists, default to:
- `phase`: 1
- `phase_name`: Discovery
- `mode`: COMPLET

### 1.2 Check for Existing Research

```bash
ls -la .epct/research/ 2>/dev/null
ls -la .epct/brainstorming/ 2>/dev/null
```

If brainstorming outputs exist, note them as available inputs for Step 2.

### 1.3 Initialize Research Repository

**Non-Negotiable NN-004**: Research repository must be initialized.

```bash
mkdir -p .epct/research/{personas,interviews,benchmarks}
```

Verify:
```bash
ls .epct/research/
# Should show: personas/ interviews/ benchmarks/
```

If initialization fails, display error and abort.

### 1.4 Define Research Scope

Ask the user:

1. **Research objective**: What are we trying to learn?
   - If new project: "What problem hypothesis do you want to validate?"
   - If feature: "What user need are you exploring?"
   - If refinement: "What gap in understanding do you want to fill?"

2. **Target audience**: Who are we researching?
   - User segments, demographics, behaviors

3. **Constraints**: What limitations exist?
   - Timeline, budget, access to users, existing data

4. **Success criteria**: What would make this research successful?
   - Validated problem? Personas? Market understanding?

### 1.5 Stakeholder Alignment

**Non-Negotiable NN-005** (non-blocking): Document stakeholder alignment.

Ask:
- Who are the key stakeholders?
- What are their expectations from this research?
- Any disagreements to resolve?

Save alignment notes:
```bash
# Save to .epct/research/stakeholder-alignment.md
```

### 1.6 Recommend Methodologies

Read `methodologies.csv` from the workflow directory.

Based on research scope and constraints, recommend 3-5 methodologies:

```
╭─────────────────────────────────────────────────────────────╮
│  🔬 Recommended Research Methodologies                       │
│                                                             │
│  Based on your scope and constraints:                       │
│                                                             │
│  1. [method_name] ([category]) - [description] (~[dur]min) │
│  2. [method_name] ([category]) - [description] (~[dur]min) │
│  3. [method_name] ([category]) - [description] (~[dur]min) │
│                                                             │
│  Non-negotiable methods (required):                         │
│  ✅ User Interviews (RM-001) - minimum 8                    │
│  ✅ Competitive Analysis (RM-022) - minimum 5               │
│                                                             │
│  Proceed with these? (yes / customize)                      │
╰─────────────────────────────────────────────────────────────╯
```

### 1.7 Display Research Header

```
╭─────────────────────────────────────────────────────────────╮
│  🔬 ACT Research Session                                     │
│                                                             │
│  📍 Phase: [phase_number] - [phase_name]                    │
│  🎯 Objective: [research_objective]                          │
│  👥 Audience: [target_audience]                              │
│  📋 Methods: [selected_methods]                              │
│  ⏱️  Started: [timestamp]                                    │
╰─────────────────────────────────────────────────────────────╯
```

## Output

Pass to Step 2 (Understand):
- `phase`: number
- `project_name`: string
- `research_objective`: string
- `target_audience`: string
- `constraints`: string
- `selected_methods`: list of methodology IDs
- `brainstorming_available`: boolean (whether brainstorming outputs exist)
- `nn_004_passed`: boolean (repository initialized)
- `nn_005_passed`: boolean (stakeholder alignment documented)
