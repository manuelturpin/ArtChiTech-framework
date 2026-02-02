---
name: act-brainstorming
description: Internal brainstorming workflow with 75 techniques, 4 selection modes, and anti-bias protocol
version: 1.0.0
---

# ACT Brainstorming Workflow

## Purpose

Facilitate structured brainstorming sessions adapted to the current ACT phase. This workflow replaces external brainstorming dependencies with an internal system offering 75 techniques, 4 selection modes, and a built-in anti-bias protocol.

## When to Use

- Starting a new project (Phase 1 Discovery)
- Adding a new feature
- Resuming or refining a phase
- Exploring architecture or design options
- Any time structured creative thinking is needed

## Initialization

1. Set the workflow root path:
   ```
   BRAINSTORM_ROOT="${ACT_ROOT}/workflows/brainstorming"
   ```

2. Ensure the session output directory exists:
   ```bash
   mkdir -p .epct/brainstorming
   ```

3. Read the techniques library:
   ```
   ${BRAINSTORM_ROOT}/techniques.csv
   ```
   If `techniques.csv` is missing or empty, display an error and abort:
   ```
   ❌ Techniques library not found at ${BRAINSTORM_ROOT}/techniques.csv
   💡 Reinstall ACT or verify the plugin installation.
   ```

## Workflow Sequence

Execute the 4 steps in order:

### Step 1: Setup
Read and follow `${BRAINSTORM_ROOT}/steps/setup.md`

Configure the session: read project state, determine context, gather topic and constraints, display session header, create session file.

### Step 2: Selection
Read and follow `${BRAINSTORM_ROOT}/steps/selection.md`

Choose brainstorming mode and select techniques. 4 modes available:
- **AI-Recommended**: 2-4 techniques auto-selected by phase
- **Browse Library**: Explore all 75 techniques filtered by phase
- **Random Selection**: Anti-bias random pick from different categories
- **Progressive Flow**: 3-round Creative → Analytical → Convergent

### Step 3: Execution
Read and follow `${BRAINSTORM_ROOT}/steps/execution.md`

Facilitate the brainstorming using selected techniques. Apply the anti-bias protocol: domain rotation (every ~10 ideas), perspective shifts (every ~20 ideas), plateau busters (when stuck). Target: 50+ ideas.

### Step 4: Organization
Read and follow `${BRAINSTORM_ROOT}/steps/organization.md`

Organize ideas into themes, prioritize with phase-appropriate criteria, extract insights, generate next steps, save output document, update state.

## Key Principles

1. **Facilitate, don't generate**: Claude coaches the user through techniques. The user does the creative thinking.
2. **Anti-bias by design**: Built-in mechanisms prevent tunnel vision and ensure diverse exploration.
3. **Phase-aware**: Techniques and prioritization adapt to the current ACT phase.
4. **Output-driven**: Every session produces a structured document with actionable next steps.
5. **Flexible depth**: Quick sessions use 1 technique; deep sessions use Progressive Flow.

## Quick Mode (Fallback)

For simple needs that don't require the full protocol:

1. Skip mode selection
2. Use a single technique appropriate to the phase
3. Skip anti-bias protocol
4. Generate a minimal output document

Trigger: When the user's need is narrow and well-defined, or when they explicitly ask for a quick session.

## Resources

| Resource | Path |
|----------|------|
| Techniques library | `${BRAINSTORM_ROOT}/techniques.csv` |
| Output template | `${BRAINSTORM_ROOT}/template.md` |
| Step 1: Setup | `${BRAINSTORM_ROOT}/steps/setup.md` |
| Step 2: Selection | `${BRAINSTORM_ROOT}/steps/selection.md` |
| Step 3: Execution | `${BRAINSTORM_ROOT}/steps/execution.md` |
| Step 4: Organization | `${BRAINSTORM_ROOT}/steps/organization.md` |
| Session output | `.epct/brainstorming/session-{timestamp}.md` |
