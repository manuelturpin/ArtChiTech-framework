# /act:audit-skill

## Description

Audit a specific skill to verify its structure, format, references, consistency, and completeness. Generates a detailed report with actionable findings.

## Usage

```
/act:audit-skill <skill-name> [options]
```

## Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `skill-name` | Yes | Name of the skill to audit (directory name under `skills/`) |
| `--verbose` | No | Show detailed check information |
| `--json` | No | Output report in JSON format |
| `--fix-hints` | No | Include fix suggestions in report |

## Checks Performed

### 1. Structure Check
Verifies required files exist:
- `SKILL.md` - Main skill documentation

### 2. Format Check
Validates markdown structure:
- Required sections: Purpose, Usage/When to Use, Examples
- Proper heading hierarchy (H1 → H2 → H3)
- Valid markdown syntax

### 3. References Check
Ensures links are valid:
- Internal links resolve to existing files
- Anchor links point to existing headings
- No orphaned cross-references

### 4. Consistency Check
Verifies coherence:
- Skill listed in project README.md
- Skill referenced correctly in CLAUDE.md
- No conflicting documentation

### 5. Completeness Check
Identifies unfinished work:
- No `TODO` markers
- No `FIXME` markers
- No empty sections
- No placeholder content

## Output Format

```markdown
## Audit Report: skill/<name>

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | SKILL.md present |
| Format | ✅ | All required sections found |
| References | ⚠️ | 1 broken link found |
| Consistency | ✅ | Listed in README |
| Completeness | ✅ | No TODOs found |

**Score: 4/5** (80%)
**Issues:** 1 warning

### Details

#### ⚠️ References
- Line 42: Link to `../missing.md` not found
```

## Examples

### Basic Audit
```bash
/act:audit-skill context-engineering
```

### Verbose Audit
```bash
/act:audit-skill iron-laws --verbose
```

### JSON Output
```bash
/act:audit-skill thinking --json
```

Output:
```json
{
  "target": "skill/thinking",
  "checks": {
    "structure": { "status": "pass", "details": "SKILL.md present" },
    "format": { "status": "pass", "details": "All sections found" },
    "references": { "status": "pass", "details": "5 links verified" },
    "consistency": { "status": "pass", "details": "Listed in README" },
    "completeness": { "status": "pass", "details": "No TODOs" }
  },
  "score": 5,
  "maxScore": 5,
  "issues": []
}
```

## Workflow

1. **Run audit** to identify issues
2. **Review report** for warnings and errors
3. **Fix manually** or use `/act:heal` for auto-fixes
4. **Re-run audit** to verify fixes

```bash
# Step 1: Audit
/act:audit-skill my-skill

# Step 2: Review issues in report

# Step 3: Fix
/act:heal skills/my-skill --dry-run
/act:heal skills/my-skill --auto

# Step 4: Verify
/act:audit-skill my-skill
```

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | All checks passed (score 5/5) |
| 1 | Warnings present (score 3-4/5) |
| 2 | Errors present (score 1-2/5) |
| 3 | Critical failure (score 0/5) |

## Related

- [/act:audit-command](audit-command.md) - Audit commands
- [/act:audit-agent](audit-agent.md) - Audit agents
- [/act:audit-all](audit-all.md) - Full framework audit
- [/act:heal](heal.md) - Auto-repair issues
- [SKILL: auditor](../../skills/auditor/SKILL.md) - Auditor skill documentation
