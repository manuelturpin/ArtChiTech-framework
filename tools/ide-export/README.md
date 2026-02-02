# IDE Export Tools

> Generators for exporting ACT configurations to various IDEs.

## Overview

This module handles the export of ACT methodology to different AI coding assistants. Each IDE has its own format and structure, and the export tools transform ACT concepts into IDE-specific configurations.

## Architecture

```
/act:export
    │
    ├── Parse options (--ide, --all, --force)
    │
    ├── Load project config (.act/config.yaml)
    │
    ├── For each target IDE:
    │   ├── Load template from templates/ide/<ide>/
    │   ├── Process template variables
    │   ├── Handle conflicts (backup/overwrite)
    │   └── Write output files
    │
    └── Generate summary report
```

## Export Logic Per IDE

### Cursor

**Input Template:** `templates/ide/cursor/rules.md`

**Output Structure:**
```
.cursor/
└── rules/
    ├── act-iron-laws.md
    ├── act-deviation-rules.md
    └── act-workflow.md
```

**Export Steps:**
1. Create `.cursor/rules/` directory if not exists
2. Split template into topic-specific files
3. Preserve existing `.cursorrules` if present
4. Inject project variables

**Notes:**
- Cursor loads all `.md` files from `rules/` directory
- Order matters: prefix with numbers for priority (e.g., `00-iron-laws.md`)
- Maximum recommended file size: 10KB per rule file

### Windsurf

**Input Template:** `templates/ide/windsurf/rules.md`

**Output Structure:**
```
.windsurf/
└── rules/
    ├── act-iron-laws.md
    ├── act-deviation-rules.md
    └── act-workflow.md
```

**Export Steps:**
1. Create `.windsurf/rules/` directory if not exists
2. Format similar to Cursor (compatible)
3. Add Windsurf-specific headers if needed

**Notes:**
- Windsurf supports cascading rules (project overrides workspace)
- Can reference external documentation
- Similar format to Cursor but check for version differences

### Aider

**Input Template:** `templates/ide/aider/aider.conf.yml`

**Output Structure:**
```
.aider/
├── .aider.conf.yml
└── conventions.md
```

**Export Steps:**
1. Create `.aider/` directory if not exists
2. Generate `.aider.conf.yml` with model settings
3. Create `conventions.md` with ACT methodology
4. Reference conventions in config

**Notes:**
- Aider uses `--read <file>` to include conventions
- Config supports model selection (matches ACT's model selection)
- Can use `--convention-file` option

### Continue

**Input Template:** `templates/ide/continue/config.json`

**Output Structure:**
```
.continue/
├── config.json
└── act-instructions.md
```

**Export Steps:**
1. Create `.continue/` directory if not exists
2. Generate `config.json` with system prompt reference
3. Create `act-instructions.md` with methodology
4. Configure docs reference

**Notes:**
- Continue uses JSON configuration
- System prompt can reference external files
- Supports multiple model providers

### Copilot

**Input Template:** `templates/ide/copilot/copilot-instructions.md`

**Output Structure:**
```
.github/
└── copilot-instructions.md
```

**Export Steps:**
1. Ensure `.github/` directory exists
2. Generate single `copilot-instructions.md` file
3. Include all ACT concepts in one file
4. Keep under Copilot's size limit

**Notes:**
- Copilot only reads one file
- Must be in `.github/` directory
- Size limit: recommend < 8KB

## Template Processing

### Variables

| Variable | Source | Fallback |
|----------|--------|----------|
| `{{project_name}}` | `.act/config.yaml` | Directory name |
| `{{project_type}}` | `.act/config.yaml` | `"generic"` |
| `{{date}}` | Current date | — |
| `{{iron_laws}}` | `rules/iron-laws.md` | Default text |
| `{{deviation_rules}}` | `rules/deviation-rules.md` | Default text |

### Processing Steps

```
1. Load template file
2. Parse {{variable}} placeholders
3. Resolve each variable:
   - Check project config
   - Check rule files
   - Use fallback
4. Replace placeholders with values
5. Validate output (no unresolved {{...}})
```

## Conflict Handling

### Scenarios

| Condition | Action |
|-----------|--------|
| Target doesn't exist | Create new file |
| Target exists, no `--force` | Skip with warning |
| Target exists, `--force` | Backup to `.bak`, overwrite |
| Target is directory | Error (won't overwrite directory) |

### Backup Strategy

```bash
# Before overwriting
.cursor/rules/act-iron-laws.md
# Backed up to
.cursor/rules/act-iron-laws.md.bak

# If .bak exists, add timestamp
.cursor/rules/act-iron-laws.md.bak.20260202-1030
```

## Output Report Format

```markdown
## /act:export Complete

**Target:** Cursor
**Date:** 2026-02-02

### Files Created
| File | Status | Notes |
|------|--------|-------|
| `.cursor/rules/act-iron-laws.md` | ✅ Created | — |
| `.cursor/rules/act-deviation-rules.md` | ✅ Created | — |
| `.cursor/rules/act-workflow.md` | ⚠️ Skipped | Exists (use --force) |

### Next Steps
1. Review generated files
2. Customize for your project
3. Commit to repository
```

## Adding New IDEs

1. **Research** IDE's configuration format
2. **Create template** in `templates/ide/<ide>/`
3. **Add export logic** to this module
4. **Update spec** in `specs/SPEC-multi-ide.md`
5. **Test** export in real project

### Template Requirements

- Must include Iron Laws section
- Must include Deviation Rules section
- Should include session recovery concepts
- Use `{{variable}}` syntax for customization
- Keep total size reasonable (< 10KB recommended)

## Error Handling

| Error | Resolution |
|-------|------------|
| Template not found | Check `templates/ide/<ide>/` exists |
| Permission denied | Check file/directory permissions |
| Invalid config | Validate `.act/config.yaml` syntax |
| Variable unresolved | Check variable name, add fallback |
