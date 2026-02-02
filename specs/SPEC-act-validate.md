# SPEC: /act:validate

> Specification for the ACT validation command

## Overview

The `/act:validate` command verifies the conformity of `.act/` directory files to ensure proper ACT framework operation.

## Objective

Provide a quick health check for ACT projects that:
1. Detects missing or malformed files
2. Identifies inconsistencies between files
3. Optionally auto-fixes minor issues

## Validation Checks

### 1. File Presence (Required)

| File | Required | Purpose |
|------|:--------:|---------|
| `config.yaml` | ✅ | Project configuration |
| `state.md` | ✅ | Current state snapshot |
| `plan.md` | ✅ | Phases and progress |
| `findings.md` | ✅ | Research & discoveries |
| `progress.md` | ✅ | Session log |
| `history/` | ✅ | Session history directory |

### 2. YAML Validation (config.yaml)

```yaml
# Required fields
project:
  name: string      # Required
  version: string   # Required
  mode: quick|full  # Required

# Optional fields
settings:
  history_retention: number  # Default: 10
  auto_save: boolean         # Default: true
```

**Errors detected:**
- Invalid YAML syntax
- Missing required fields
- Invalid field values (e.g., mode not in quick|full)

### 3. State/Plan Consistency

The `phase` value in `state.md` must match the current phase in `plan.md`.

**state.md example:**
```markdown
## Current
- **Phase:** 3/5 (Implementation)
```

**plan.md example:**
```markdown
## Phases
- [x] 1. Discovery
- [x] 2. Strategy  
- [ ] 3. Implementation  ← Current
- [ ] 4. Testing
- [ ] 5. Deployment
```

**Errors detected:**
- Phase number mismatch
- Phase name mismatch
- Invalid phase format

### 4. File Format Validation

Each file must follow its expected structure:

| File | Expected Sections |
|------|-------------------|
| `state.md` | `## Current`, `## Quick Stats` |
| `plan.md` | `## Goal`, `## Phases` |
| `findings.md` | Valid markdown (can be empty) |
| `progress.md` | Session entries with timestamps |

### 5. History Directory

- Directory must exist
- Files must follow naming convention: `YYYY-MM-DD-HHMM.md`
- Check for corrupted files (valid markdown)

## Output Format

### All Checks Pass

```
✅ ACT Validation Passed

- config.yaml: ✅
- state.md: ✅
- plan.md: ✅
- findings.md: ✅
- progress.md: ✅
- history/: ✅
```

### With Issues

```
⚠️ ACT Validation: 2 issues found

- config.yaml: ✅
- state.md: ❌ Missing phase field
- plan.md: ✅
- findings.md: ⚠️ Empty file
- progress.md: ✅
- history/: ✅

Run `/act:validate --fix` to auto-fix minor issues.
```

### Status Icons

| Icon | Meaning |
|:----:|---------|
| ✅ | Valid |
| ⚠️ | Warning (non-blocking) |
| ❌ | Error (blocking) |

## Options

### `--fix`

Attempts to auto-fix minor issues:
- Create missing optional sections
- Fix formatting issues
- Create empty `history/` directory
- Initialize empty files with templates

**Will NOT auto-fix:**
- Missing required fields in config.yaml
- Phase inconsistencies (requires human decision)

### `--verbose`

Shows detailed validation information:
- Each check performed
- Time taken per check
- Suggestions for improvements

## Exit Codes

| Code | Meaning |
|:----:|---------|
| 0 | All checks pass |
| 1 | Warnings only (non-blocking) |
| 2 | Errors found (blocking) |

## Integration

### Pre-commit Hook

Can be used as a pre-commit hook to ensure `.act/` files are valid before commit.

### CI/CD

Can be integrated into CI pipelines to validate project structure.

## Related

- `/act:init` — Creates the initial `.act/` structure
- `/act:resume` — Uses validation before resuming
- `@specs/SPEC-context-engineering.md` — 3-File Pattern specification
