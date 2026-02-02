# /act:audit-command

## Description

Audit a specific command to verify its structure, format, references, consistency, and completeness. Generates a detailed report with actionable findings.

## Usage

```
/act:audit-command <command-path> [options]
```

## Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `command-path` | Yes | Path to command (e.g., `act/init` or `act/status`) |
| `--verbose` | No | Show detailed check information |
| `--json` | No | Output report in JSON format |
| `--fix-hints` | No | Include fix suggestions in report |

## Checks Performed

### 1. Structure Check
Verifies required files exist:
- Command `.md` file exists
- Valid filename format

### 2. Format Check
Validates markdown structure:
- Has description/purpose section
- Has usage section with syntax
- Has parameters section (if applicable)
- Has examples section
- Proper heading hierarchy

### 3. References Check
Ensures links are valid:
- Links to other commands exist
- Links to skills exist
- Links to specs exist
- No broken anchor links

### 4. Consistency Check
Verifies coherence:
- Command listed in README.md command table
- Command follows naming conventions
- Parameters documented match usage

### 5. Completeness Check
Identifies unfinished work:
- No `TODO` markers
- No `FIXME` markers
- No placeholder examples
- All sections have content

## Output Format

```markdown
## Audit Report: command/act/<name>

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | File present |
| Format | ✅ | All required sections found |
| References | ✅ | 4 links verified |
| Consistency | ⚠️ | Not in README table |
| Completeness | ✅ | No TODOs found |

**Score: 4/5** (80%)
**Issues:** 1 warning

### Details

#### ⚠️ Consistency
- Command not listed in README.md command table
- Suggested fix: Add to Commands section
```

## Examples

### Basic Audit
```bash
/act:audit-command act/init
```

### Audit with Namespace
```bash
/act:audit-command act/status
```

### Verbose Output
```bash
/act:audit-command act/evolve --verbose
```

### Check Multiple Commands
```bash
# Audit all act commands
for cmd in init status quick full; do
  /act:audit-command act/$cmd
done
```

## Required Sections

A well-formed command file should have:

```markdown
# /act:<name>

## Description
What the command does.

## Usage
```
/act:<name> <parameters>
```

## Parameters
| Parameter | Required | Description |
|-----------|----------|-------------|
| ... | ... | ... |

## Examples
```bash
/act:<name> example
```

## Related
- Links to related commands
```

## Scoring Criteria

| Score | Criteria |
|-------|----------|
| 5/5 | All sections present, no issues |
| 4/5 | Minor formatting issues |
| 3/5 | Missing optional sections |
| 2/5 | Missing required sections |
| 1/5 | Structural problems |
| 0/5 | File missing or unreadable |

## Workflow

```bash
# 1. Audit the command
/act:audit-command act/new-feature

# 2. Review the report

# 3. Fix issues (dry-run first)
/act:heal commands/act/new-feature.md --dry-run

# 4. Apply safe fixes
/act:heal commands/act/new-feature.md --auto

# 5. Verify
/act:audit-command act/new-feature
```

## Related

- [/act:audit-skill](audit-skill.md) - Audit skills
- [/act:audit-agent](audit-agent.md) - Audit agents
- [/act:audit-all](audit-all.md) - Full framework audit
- [/act:heal](heal.md) - Auto-repair issues
- [SKILL: auditor](../../skills/auditor/SKILL.md) - Auditor skill documentation
