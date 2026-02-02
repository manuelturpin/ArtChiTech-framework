---
name: act-prd
description: Internal PRD workflow with tri-modal operation (create, validate, edit) and 7-section structure
version: 1.0.0
---

# ACT PRD Workflow

## Purpose

Bridge Phase 2 (Strategy) and Phase 3 (Design) by creating, validating, or editing a Product Requirements Document. This workflow operates in three modes: Create (from scratch using research and brainstorming data), Validate (score an existing PRD), or Edit (modify specific sections).

## When to Use

- After completing research/brainstorming (Phase 1 → Phase 2)
- When formalizing product requirements
- When validating an existing PRD against ACT standards
- When updating a PRD after new information

## Initialization

1. Set the workflow root path:
   ```
   PRD_ROOT="${ACT_ROOT}/workflows/prd"
   ```

2. Ensure the output directory exists:
   ```bash
   mkdir -p .epct/prd
   ```

3. Read the sections definition:
   ```
   ${PRD_ROOT}/sections.csv
   ```
   If `sections.csv` is missing or empty, display an error and abort:
   ```
   ❌ Sections definition not found at ${PRD_ROOT}/sections.csv
   💡 Reinstall ACT or verify the plugin installation.
   ```

4. Auto-detect mode:
   ```bash
   ls .epct/prd/*.md 2>/dev/null
   ```
   - If no PRD files found → Default to **Create** mode
   - If PRD files found → Propose **Validate** or **Edit** mode

## Mode Selection

```
╭─────────────────────────────────────────────────────────────╮
│  📄 ACT PRD Workflow                                         │
│                                                             │
│  [Auto-detected context message]                            │
│                                                             │
│  1. 📝 Create - Write a new PRD from scratch                │
│  2. ✅ Validate - Score an existing PRD                      │
│  3. ✏️  Edit - Modify sections of an existing PRD             │
│                                                             │
│  Type a number or describe your need...                     │
╰─────────────────────────────────────────────────────────────╯
```

## Workflow Modes

### Mode 1: Create
Read and follow `${PRD_ROOT}/steps/create.md`

Build a complete PRD from scratch using research outputs (`.epct/research/`), brainstorming outputs (`.epct/brainstorming/`), and user input. Covers all 7 sections defined in `sections.csv`.

### Mode 2: Validate
Read and follow `${PRD_ROOT}/steps/validate.md`

Score an existing PRD against the 7 sections and their validation criteria. Produces a validation report with Go/No-Go verdict.

### Mode 3: Edit
Read and follow `${PRD_ROOT}/steps/edit.md`

Modify specific sections of an existing PRD while preserving the rest. Maintains version history.

## Key Principles

1. **Data-driven**: PRD content is derived from research and brainstorming, not invented.
2. **Section-complete**: All 7 sections must be addressed for a complete PRD.
3. **Traceable**: Every PRD section links back to its input sources.
4. **Iterative**: PRDs can be validated and edited multiple times.
5. **Phase bridge**: The PRD connects Discovery research to Design specifications.

## Quick Mode (Fallback)

For smaller features or rapid prototyping:

1. Generate a minimal PRD with only 3 sections:
   - Vision & Objectives (PRD-001)
   - Features (PRD-003)
   - Technical Requirements (PRD-004)
2. Skip validation criteria
3. Mark as "DRAFT - Quick Mode"

Trigger: When the user needs a lightweight PRD, or mode is QUICK/FEATURE.

## Resources

| Resource | Path |
|----------|------|
| Sections definition | `${PRD_ROOT}/sections.csv` |
| PRD template | `${PRD_ROOT}/template.md` |
| Step: Create | `${PRD_ROOT}/steps/create.md` |
| Step: Validate | `${PRD_ROOT}/steps/validate.md` |
| Step: Edit | `${PRD_ROOT}/steps/edit.md` |
| PRD output | `.epct/prd/` |
