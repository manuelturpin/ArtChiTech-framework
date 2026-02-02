# /act:audit-agent

## Description

Audit a specific agent configuration to verify its structure, format, references, consistency, and completeness. Generates a detailed report with actionable findings.

## Usage

```
/act:audit-agent <agent-name> [options]
```

## Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `agent-name` | Yes | Name of the agent to audit (directory name under `agents/`) |
| `--verbose` | No | Show detailed check information |
| `--json` | No | Output report in JSON format |
| `--fix-hints` | No | Include fix suggestions in report |

## Checks Performed

### 1. Structure Check
Verifies required files exist:
- `AGENT.md` or `README.md` - Main agent documentation
- Optional: `config.yaml`, `prompts/` directory

### 2. Format Check
Validates markdown structure:
- Has role/identity section
- Has capabilities section
- Has instructions/behavior section
- Proper heading hierarchy

### 3. References Check
Ensures references are valid:
- Referenced skills exist
- Referenced commands exist
- Links to documentation valid
- No broken cross-references

### 4. Consistency Check
Verifies coherence:
- Agent listed in project documentation
- Capabilities match available commands
- Role matches agent type
- No conflicting instructions

### 5. Completeness Check
Identifies unfinished work:
- No `TODO` markers
- No `FIXME` markers
- All capabilities documented
- No placeholder content

## Output Format

```markdown
## Audit Report: agent/<name>

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | AGENT.md present |
| Format | ✅ | All required sections found |
| References | ✅ | 6 links verified |
| Consistency | ⚠️ | 1 capability not documented |
| Completeness | ✅ | No TODOs found |

**Score: 4/5** (80%)
**Issues:** 1 warning

### Details

#### ⚠️ Consistency
- Agent has access to `/act:heal` but not documented in capabilities
```

## Examples

### Basic Audit
```bash
/act:audit-agent researcher
```

### Verbose Audit
```bash
/act:audit-agent developer --verbose
```

### JSON Output
```bash
/act:audit-agent thinker --json
```

Output:
```json
{
  "target": "agent/thinker",
  "checks": {
    "structure": { "status": "pass", "details": "AGENT.md present" },
    "format": { "status": "pass", "details": "All sections found" },
    "references": { "status": "pass", "details": "8 links verified" },
    "consistency": { "status": "warning", "details": "1 issue" },
    "completeness": { "status": "pass", "details": "No TODOs" }
  },
  "score": 4,
  "maxScore": 5,
  "issues": [
    {
      "type": "warning",
      "check": "consistency",
      "message": "Capability not documented",
      "details": "/act:heal access not in capabilities list"
    }
  ]
}
```

## Required Sections

A well-formed agent file should have:

```markdown
# Agent: <Name>

## Role
What this agent does and its primary purpose.

## Capabilities
- List of available commands
- Skills the agent uses
- Special abilities

## Instructions
How the agent should behave:
- Response style
- Priorities
- Constraints

## Context (Optional)
- When to activate this agent
- Integration points
```

## Agent Types

Different agent types have different requirements:

| Type | Required Sections | Special Checks |
|------|------------------|----------------|
| Worker | Role, Capabilities | Has actionable commands |
| Researcher | Role, Methodology | Has research skills |
| Specialist | Role, Domain, Expertise | Domain-specific checks |
| Meta | Role, Targets | Can operate on other agents |

## Scoring Criteria

| Score | Criteria |
|-------|----------|
| 5/5 | Complete, consistent, no issues |
| 4/5 | Minor documentation gaps |
| 3/5 | Missing optional sections |
| 2/5 | Missing required sections |
| 1/5 | Structural problems |
| 0/5 | File missing or unreadable |

## Workflow

```bash
# 1. Audit the agent
/act:audit-agent my-agent

# 2. Review findings

# 3. Fix issues
/act:heal agents/my-agent --dry-run
/act:heal agents/my-agent --auto

# 4. Verify
/act:audit-agent my-agent
```

## Common Issues

### Missing Capabilities
```markdown
#### ⚠️ Consistency
- Agent uses `/act:init` but not listed in capabilities
```
**Fix:** Add command to capabilities section

### Broken Skill Reference
```markdown
#### ❌ References
- Line 15: Skill `missing-skill` not found
```
**Fix:** Create skill or remove reference

### Incomplete Instructions
```markdown
#### ⚠️ Completeness
- Instructions section has only 2 lines
```
**Fix:** Expand instructions with detailed behavior

## Related

- [/act:audit-skill](audit-skill.md) - Audit skills
- [/act:audit-command](audit-command.md) - Audit commands
- [/act:audit-all](audit-all.md) - Full framework audit
- [/act:heal](heal.md) - Auto-repair issues
- [SKILL: auditor](../../skills/auditor/SKILL.md) - Auditor skill documentation
