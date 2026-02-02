# /act:audit-all

## Description

Run a comprehensive audit on the entire ACT framework, checking all skills, commands, and agents. Produces a consolidated report with overall health score and prioritized issues.

## Usage

```
/act:audit-all [options]
```

## Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--quick` | No | Summary only, skip detailed checks |
| `--verbose` | No | Show all check details |
| `--json` | No | Output report in JSON format |
| `--fail-on-error` | No | Exit with error code if errors found |
| `--fail-on-warning` | No | Exit with error code if warnings found |
| `--category <type>` | No | Audit only: `skills`, `commands`, or `agents` |

## What Gets Audited

### Skills
All directories under `skills/`:
- Each skill's `SKILL.md`
- Cross-references between skills

### Commands
All `.md` files under `commands/`:
- Command documentation
- Parameter consistency
- README listing

### Agents
All directories under `agents/`:
- Agent documentation
- Capability references
- Role consistency

### Cross-cutting
- Links between components
- README.md accuracy
- CLAUDE.md references

## Output Format

### Standard Report

```markdown
# ACT Framework Audit Report

**Date:** 2024-02-02
**Version:** v2.5.0

## Summary

| Category | Total | ✅ Pass | ⚠️ Warn | ❌ Error |
|----------|-------|---------|---------|----------|
| Skills | 6 | 5 | 1 | 0 |
| Commands | 14 | 12 | 1 | 1 |
| Agents | 7 | 7 | 0 | 0 |
| **Total** | **27** | **24** | **2** | **1** |

**Overall Score: 89%** (24/27 components healthy)

## Issues by Priority

### ❌ Errors (Fix Required)
1. `commands/act/experimental.md` - 2 broken links

### ⚠️ Warnings (Should Fix)
1. `skills/new-feature/SKILL.md` - Missing Examples section
2. `commands/act/beta.md` - Not in README

## Detailed Reports

<details>
<summary>Skills (5 ✅, 1 ⚠️)</summary>

### skill/context-engineering ✅
Score: 5/5

### skill/iron-laws ✅
Score: 5/5

### skill/new-feature ⚠️
Score: 4/5
- Missing Examples section

...
</details>

<details>
<summary>Commands (12 ✅, 1 ⚠️, 1 ❌)</summary>

### command/act/init ✅
Score: 5/5

### command/act/experimental ❌
Score: 2/5
- 2 broken links
- Missing from README

...
</details>

<details>
<summary>Agents (7 ✅)</summary>

All agents passed audit.

</details>
```

### Quick Report

```bash
/act:audit-all --quick
```

Output:
```markdown
# ACT Framework Quick Audit

✅ Skills: 6/6 healthy
⚠️ Commands: 12/14 (1 warning, 1 error)
✅ Agents: 7/7 healthy

**Overall: 89%** - 1 error needs attention

Run `/act:audit-all` for details.
```

### JSON Report

```bash
/act:audit-all --json
```

```json
{
  "date": "2024-02-02T10:30:00Z",
  "version": "v2.5.0",
  "summary": {
    "skills": { "total": 6, "pass": 5, "warn": 1, "error": 0 },
    "commands": { "total": 14, "pass": 12, "warn": 1, "error": 1 },
    "agents": { "total": 7, "pass": 7, "warn": 0, "error": 0 }
  },
  "overallScore": 89,
  "issues": [
    {
      "priority": "error",
      "component": "commands/act/experimental.md",
      "message": "2 broken links"
    },
    {
      "priority": "warning",
      "component": "skills/new-feature/SKILL.md",
      "message": "Missing Examples section"
    }
  ],
  "details": { ... }
}
```

## Examples

### Full Audit
```bash
/act:audit-all
```

### Quick Health Check
```bash
/act:audit-all --quick
```

### Audit Only Commands
```bash
/act:audit-all --category commands
```

### CI Integration
```bash
/act:audit-all --fail-on-error
```

### Strict CI (Fail on Warnings)
```bash
/act:audit-all --fail-on-warning
```

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | All checks passed |
| 1 | Warnings present (with `--fail-on-warning`) |
| 2 | Errors present (with `--fail-on-error`) |
| 3 | Critical failures |

## Workflow

### Regular Maintenance
```bash
# Weekly quick check
/act:audit-all --quick

# Monthly full audit
/act:audit-all

# Fix all issues
/act:heal . --auto
```

### Pre-Release
```bash
# Full audit with strict mode
/act:audit-all --fail-on-warning

# Fix everything before release
/act:heal . --dry-run
/act:heal . --force
```

### CI Pipeline
```yaml
# .github/workflows/audit.yml
name: Framework Audit
on: [push, pull_request]

jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run Audit
        run: /act:audit-all --fail-on-error
```

## Interpreting Results

### Healthy Framework (90%+)
- All components functional
- Minor polish items only
- Ready for production

### Needs Attention (70-89%)
- Some issues to address
- Fix before next release
- Review warnings

### Unhealthy (50-69%)
- Significant problems
- Prioritize fixes
- Consider blocking release

### Critical (<50%)
- Major structural issues
- Immediate attention required
- Framework may not function correctly

## Related

- [/act:audit-skill](audit-skill.md) - Audit individual skills
- [/act:audit-command](audit-command.md) - Audit individual commands
- [/act:audit-agent](audit-agent.md) - Audit individual agents
- [/act:heal](heal.md) - Auto-repair issues
- [SKILL: auditor](../../skills/auditor/SKILL.md) - Auditor skill documentation
