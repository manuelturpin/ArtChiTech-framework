---
name: act-research
description: Internal research workflow with 5 phases, 25+ methodologies, non-negotiables validation, and red-flag alerts
version: 1.0.0
---

# ACT Research Workflow

## Purpose

Structure Phase 1 Discovery with a rigorous research methodology. This workflow guides the user through 5 sequential phases: preparation, understanding, exploration, validation, and decision. It enforces non-negotiable criteria (blocking) and monitors red flags throughout.

## When to Use

- Starting a new project (Phase 1 Discovery)
- Validating a problem hypothesis
- Conducting user research for a new feature
- Deepening understanding of a market or audience
- Any time structured research is needed before building

## Initialization

1. Set the workflow root path:
   ```
   RESEARCH_ROOT="${ACT_ROOT}/workflows/research"
   ```

2. Ensure the output directories exist:
   ```bash
   mkdir -p .epct/research/{personas,interviews,benchmarks}
   ```

3. Read the methodologies library:
   ```
   ${RESEARCH_ROOT}/methodologies.csv
   ```
   If `methodologies.csv` is missing or empty, display an error and abort:
   ```
   ❌ Methodologies library not found at ${RESEARCH_ROOT}/methodologies.csv
   💡 Reinstall ACT or verify the plugin installation.
   ```

4. Read non-negotiables and red flags:
   ```
   ${RESEARCH_ROOT}/non-negotiables.csv
   ${RESEARCH_ROOT}/red-flags.csv
   ```

## Workflow Sequence

Execute the 5 steps in order:

### Step 1: Preparation
Read and follow `${RESEARCH_ROOT}/steps/01-preparation.md`

Align stakeholders, define research scope, initialize the research repository, and recommend methodologies. Verifies NN-004 (repository initialized) and NN-005 (stakeholder alignment).

### Step 2: Understand
Read and follow `${RESEARCH_ROOT}/steps/02-understand.md`

Analyze existing data (including brainstorming outputs), create Problem Statement via template, formulate 3-5 testable hypotheses, prioritize by impact x uncertainty. Verifies NN-003 and NN-006. Checks RF-002 and RF-004.

### Step 3: Explore
Read and follow `${RESEARCH_ROOT}/steps/03-explore.md`

Conduct user interviews (8+ minimum), competitive analysis (5+ benchmarks), create personas (2+ drafts). This is the most intensive phase. Verifies NN-001, NN-002, and NN-007 (BLOCKING). Checks RF-001, RF-003, RF-005.

### Step 4: Validate
Read and follow `${RESEARCH_ROOT}/steps/04-validate.md`

Map evidence to hypotheses, score each hypothesis (validated/partially/invalidated), concept testing if applicable. Verifies NN-008. Checks RF-006 and RF-007.

### Step 5: Decide
Read and follow `${RESEARCH_ROOT}/steps/05-decide.md`

Generate research synthesis via template, final check of ALL non-negotiables (REFUSES Go if any blocking NN fails), present Go/No-Go/Pivot decision, save synthesis, update state.

## Key Principles

1. **Evidence-based decisions**: Every conclusion must be supported by research data, not assumptions.
2. **Non-negotiables are blocking**: Certain criteria MUST be met before advancing. No exceptions.
3. **Red flags trigger action**: When a red flag is detected, the corrective action must be addressed immediately.
4. **User-centric**: The user conducts the research. Claude facilitates, structures, and tracks progress.
5. **Connected to brainstorming**: Research builds on brainstorming outputs and feeds into PRD creation.

## Quick Mode (Fallback)

For smaller features or quick validations:

1. Skip Step 1 (use existing repository)
2. Simplified Problem Statement (3 sentences)
3. Reduced minimums: 3 interviews, 3 benchmarks, 1 persona
4. Skip formal validation plan
5. Simplified synthesis

Trigger: When the user's scope is narrow, or they explicitly ask for a quick research cycle.

## Resources

| Resource | Path |
|----------|------|
| Methodologies library | `${RESEARCH_ROOT}/methodologies.csv` |
| Non-negotiables | `${RESEARCH_ROOT}/non-negotiables.csv` |
| Red flags | `${RESEARCH_ROOT}/red-flags.csv` |
| Step 1: Preparation | `${RESEARCH_ROOT}/steps/01-preparation.md` |
| Step 2: Understand | `${RESEARCH_ROOT}/steps/02-understand.md` |
| Step 3: Explore | `${RESEARCH_ROOT}/steps/03-explore.md` |
| Step 4: Validate | `${RESEARCH_ROOT}/steps/04-validate.md` |
| Step 5: Decide | `${RESEARCH_ROOT}/steps/05-decide.md` |
| Template: Problem Statement | `${RESEARCH_ROOT}/templates/problem-statement.md` |
| Template: Persona | `${RESEARCH_ROOT}/templates/persona.md` |
| Template: Competitive Analysis | `${RESEARCH_ROOT}/templates/competitive-analysis.md` |
| Template: Research Synthesis | `${RESEARCH_ROOT}/templates/research-synthesis.md` |
| Research output | `.epct/research/` |
