---
name: prd-edit
description: Mode 3 - Edit specific sections of an existing PRD
---

# PRD Edit Mode

## Objective

Modify specific sections of an existing PRD while preserving the original and maintaining version history.

## Instructions

### E.1 Load Existing PRD

```bash
ls .epct/prd/prd-*.md 2>/dev/null
```

If no PRD found:
```
❌ No PRD found in .epct/prd/
💡 Run this workflow in Create mode first.
```

Read the latest PRD file.

### E.2 Present Section Overview

Display all sections with their current status:

```
╭─────────────────────────────────────────────────────────────╮
│  ✏️  PRD Edit Mode                                           │
│                                                             │
│  PRD: [filename]                                            │
│  Last modified: [date]                                      │
│                                                             │
│  Sections:                                                  │
│  1. Vision & Objectives    [✅ Complete | ⚠️ Partial]       │
│  2. Users & Personas       [✅ Complete | ⚠️ Partial]       │
│  3. Features               [✅ Complete | ⚠️ Partial]       │
│  4. Technical Requirements [✅ Complete | ⚠️ Partial]       │
│  5. Success Metrics        [✅ Complete | ⚠️ Partial]       │
│  6. Risks & Mitigations    [✅ Complete | ⚠️ Partial]       │
│  7. Timeline               [✅ Complete | ⏭️ Skipped]       │
│                                                             │
│  Which section(s) to edit? (number, or "all")               │
╰─────────────────────────────────────────────────────────────╯
```

### E.3 Edit Selected Sections

For each selected section:

1. **Show current content**:
   ```
   📄 Current content of [section_name]:

   [current section content]
   ```

2. **Ask what to change**:
   ```
   What would you like to modify?
   1. Replace entirely
   2. Add content
   3. Remove content
   4. Revise specific parts
   ```

3. **Guide the revision**:
   - If replacing: Follow the same process as Create mode for that section
   - If adding: Ask what to add and where
   - If removing: Confirm what to remove
   - If revising: Show specific parts and ask for changes

4. **Validate the updated section** against `sections.csv` criteria:
   ```
   ✅ Updated validation for [section_name]:
   - [criterion 1]: [PASS/FAIL]
   - [criterion 2]: [PASS/FAIL]
   ```

### E.4 Save Updated PRD

Preserve the original and save a new version:

```bash
# Keep original as-is
# Save new version: .epct/prd/prd-{YYYY-MM-DD-HHmm}.md
```

Present diff summary:
```
📝 Changes summary:

Section [N] - [name]:
  - [change description]
  - [change description]

Original preserved: .epct/prd/prd-{original-date}.md
New version saved: .epct/prd/prd-{new-date-HHmm}.md

Next steps:
1. Run internal:prd (validate mode) to re-score the updated PRD
2. Run internal:stories if features changed
```

## Output

- Updated PRD saved as new version
- Original PRD preserved
- Change summary displayed
- Validation status updated per modified section
