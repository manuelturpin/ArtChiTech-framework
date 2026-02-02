---
name: act-stories
description: Internal stories workflow - decompose PRD into Epics and dev-ready User Stories with estimation
version: 1.0.0
---

# ACT Stories Workflow

## Purpose

Bridge Phase 3 (Design) and Phase 4 (Development) by decomposing the PRD into Epics and dev-ready User Stories. Each story includes acceptance criteria, estimation (T-shirt sizing), and traceability back to the PRD.

## When to Use

- After PRD is created and validated (Phase 2 → Phase 3)
- When planning development sprints
- When breaking down features for implementation
- When estimating development effort

## Prerequisite

A PRD must exist in `.epct/prd/`. If no PRD is found:
```
❌ No PRD found in .epct/prd/
💡 Run the PRD workflow first: internal:prd (create mode)
```

## Initialization

1. Set the workflow root path:
   ```
   STORIES_ROOT="${ACT_ROOT}/workflows/stories"
   ```

2. Ensure the output directories exist:
   ```bash
   mkdir -p .epct/stories/{epics,stories}
   ```

3. Read the estimation guide:
   ```
   ${STORIES_ROOT}/estimation-guide.csv
   ```
   If `estimation-guide.csv` is missing or empty, display an error and abort:
   ```
   ❌ Estimation guide not found at ${STORIES_ROOT}/estimation-guide.csv
   💡 Reinstall ACT or verify the plugin installation.
   ```

4. Load the PRD:
   ```bash
   ls .epct/prd/prd-*.md 2>/dev/null
   ```
   Use the most recent PRD file.

## Workflow Sequence

Execute the 3 steps in order:

### Step 1: Parse PRD
Read and follow `${STORIES_ROOT}/steps/parse-prd.md`

Parse the PRD to extract features (Section 3), technical constraints (Section 4), and personas (Section 2). Present the parsed structure for user validation.

### Step 2: Create Epics
Read and follow `${STORIES_ROOT}/steps/create-epics.md`

Group features into 3-7 Epics, assign IDs, names, and priorities. Save each Epic using the template.

### Step 3: Decompose into Stories
Read and follow `${STORIES_ROOT}/steps/decompose.md`

Break each Epic into dev-ready User Stories with acceptance criteria, T-shirt size estimation, and dependency mapping. Save each Story using the template.

## Key Principles

1. **PRD-driven**: Every story traces back to a PRD feature and section.
2. **Dev-ready**: Stories include acceptance criteria, estimation, and dependencies.
3. **Right-sized**: Stories should be completable in 1-5 days (S to L size).
4. **User-centric**: Stories are written from the user's perspective.
5. **Traceable**: Epic → PRD Section → Research Hypothesis chain is maintained.

## Quick Mode (Fallback)

For rapid decomposition:

1. Skip Epic grouping (Step 2)
2. Create stories directly from PRD features
3. Use simplified acceptance criteria (1-2 per story)
4. Skip dependency mapping

Trigger: When the user needs quick story creation or mode is QUICK.

## Resources

| Resource | Path |
|----------|------|
| Estimation guide | `${STORIES_ROOT}/estimation-guide.csv` |
| Epic template | `${STORIES_ROOT}/template-epic.md` |
| Story template | `${STORIES_ROOT}/template-story.md` |
| Step 1: Parse PRD | `${STORIES_ROOT}/steps/parse-prd.md` |
| Step 2: Create Epics | `${STORIES_ROOT}/steps/create-epics.md` |
| Step 3: Decompose | `${STORIES_ROOT}/steps/decompose.md` |
| Epics output | `.epct/stories/epics/` |
| Stories output | `.epct/stories/stories/` |
