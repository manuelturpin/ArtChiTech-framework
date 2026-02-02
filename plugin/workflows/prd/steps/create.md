---
name: prd-create
description: Mode 1 - Create a new PRD from scratch using research and brainstorming inputs
---

# PRD Create Mode

## Objective

Build a complete PRD by gathering input from research outputs, brainstorming sessions, and user knowledge.

## Instructions

### C.1 Gather Input Sources

Check for available data:

```bash
# Research outputs
ls .epct/research/synthesis-*.md 2>/dev/null
ls .epct/research/problem-statement.md 2>/dev/null
ls .epct/research/personas/ 2>/dev/null

# Brainstorming outputs
ls .epct/brainstorming/session-*.md 2>/dev/null
```

Present findings:
```
📂 Available inputs for PRD:

Research:
  [✅ | ❌] Research synthesis
  [✅ | ❌] Problem Statement
  [✅ | ❌] Personas ([N] found)

Brainstorming:
  [✅ | ❌] Sessions ([N] found)

Missing inputs will require manual input from you.
Proceed? (yes / gather more data first)
```

### C.2 Process Each Section

Read `sections.csv` from the workflow directory.

For each section in order (PRD-001 through PRD-007):

1. **Present the section**:
   ```
   ╭─────────────────────────────────────────────────────────────╮
   │  📄 Section [N]/7: [section_name]                            │
   │                                                             │
   │  Description: [description from CSV]                        │
   │  Required: [Yes/No]                                         │
   │  Input sources: [input_sources from CSV]                    │
   ╰─────────────────────────────────────────────────────────────╯
   ```

2. **Extract from inputs**: Pull relevant data from research/brainstorming outputs
   - PRD-001 (Vision): Use Problem Statement + research synthesis
   - PRD-002 (Users): Use personas from `.epct/research/personas/`
   - PRD-003 (Features): Use brainstorming top ideas + validated hypotheses
   - PRD-004 (Technical): Use existing codebase analysis if available
   - PRD-005 (Metrics): Use research validation metrics + strategy KPIs
   - PRD-006 (Risks): Use Pre-Mortem findings (BT-039) + research red flags
   - PRD-007 (Timeline): Use strategy roadmap if available

3. **Present draft** for user review:
   ```
   📝 Draft for [section_name]:

   [formatted section content]

   Based on: [list of input sources used]

   Accept this section? (yes / revise / skip for now)
   ```

4. **Apply validation criteria** from `sections.csv`:
   ```
   ✅ Validation check for [section_name]:
   - [criterion 1]: [PASS/FAIL]
   - [criterion 2]: [PASS/FAIL]
   - [criterion 3]: [PASS/FAIL]
   ```

### C.3 Generate Complete PRD

Once all sections are processed:

1. Read and use `${PRD_ROOT}/template.md`
2. Fill in all sections with approved content
3. Add source references throughout

Present overview:
```
╭─────────────────────────────────────────────────────────────╮
│  📄 PRD Generation Complete                                  │
│                                                             │
│  Sections:                                                  │
│  ✅ 1. Vision & Objectives                                   │
│  ✅ 2. Users & Personas                                      │
│  ✅ 3. Features                                              │
│  ✅ 4. Technical Requirements                                │
│  ✅ 5. Success Metrics                                       │
│  ✅ 6. Risks & Mitigations                                   │
│  [✅ | ⏭️] 7. Timeline                                        │
│                                                             │
│  Save PRD? (yes / review section [N])                       │
╰─────────────────────────────────────────────────────────────╯
```

### C.4 Save and Update State

Save the PRD:
```bash
# Save to .epct/prd/prd-{YYYY-MM-DD}.md
```

Update state:
```
✅ PRD saved to .epct/prd/prd-{date}.md

Next steps:
1. Run internal:prd (validate mode) to score your PRD
2. Run internal:stories to decompose features into user stories
3. Run /act-next to advance to Phase 3: Design

💡 Tip: Your PRD will be used as input by the Stories workflow.
```

## Output

- Complete PRD document saved to `.epct/prd/`
- Validation results per section
- Source references linked
- State updated
