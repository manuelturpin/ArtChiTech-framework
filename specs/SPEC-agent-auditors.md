# SPEC-agent-auditors.md

## Overview

Agent Auditors provide tools to audit and repair skills, commands, and agents within the ACT framework. They ensure structural integrity, format compliance, and consistency across all framework components.

## Problem Statement

As the ACT framework grows, maintaining consistency becomes challenging:
- Files may become malformed or incomplete
- Links between components may break
- Documentation may drift from implementation
- TODOs and FIXMEs may be forgotten

## Solution

A comprehensive audit system that:
1. Validates component structure and format
2. Checks internal references and links
3. Ensures consistency across related files
4. Identifies incomplete or forgotten work
5. Provides automated healing capabilities

## Audit Checks

### 1. Structure Check
Verifies that all required files are present for a component type.

| Component | Required Files |
|-----------|---------------|
| Skill | `SKILL.md` |
| Command | `<name>.md` with valid frontmatter |
| Agent | `AGENT.md` or `README.md` |

### 2. Format Check
Validates markdown structure and required sections.

| Component | Required Sections |
|-----------|------------------|
| Skill | Purpose, Usage, Examples |
| Command | Description, Parameters, Examples |
| Agent | Role, Capabilities, Instructions |

### 3. References Check
Ensures all internal links point to existing files.

**Checks performed:**
- Markdown links `[text](path)` resolve correctly
- Cross-references between docs exist
- No orphaned links

### 4. Consistency Check
Verifies coherence with related components.

**Examples:**
- Command documented in README matches actual file
- Skill mentioned in CLAUDE.md exists
- Agent capabilities match available commands

### 5. Completeness Check
Identifies unfinished work.

**Patterns detected:**
- `TODO` markers
- `FIXME` markers
- `XXX` markers
- `[placeholder]` patterns
- Empty sections

## Report Format

```markdown
## Audit Report: <type>/<name>

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | All required files present |
| Format | ✅ | Valid markdown |
| References | ⚠️ | 1 broken link found |
| Consistency | ✅ | Consistent with docs |
| Completeness | ✅ | No TODOs found |

**Score: 4/5** (80%)
**Issues:** 1 warning

### Details

#### ⚠️ References
- Line 42: Link to `../specs/missing.md` not found
```

## Status Indicators

| Symbol | Meaning |
|--------|---------|
| ✅ | Check passed |
| ⚠️ | Warning (non-blocking) |
| ❌ | Error (requires attention) |
| ⏭️ | Skipped (not applicable) |

## Scoring

- **5/5 (100%)** - Perfect, all checks pass
- **4/5 (80%)** - Good, minor warnings only
- **3/5 (60%)** - Acceptable, some issues to fix
- **2/5 (40%)** - Poor, significant problems
- **1/5 (20%)** - Critical, major structural issues
- **0/5 (0%)** - Failed, component non-functional

## Commands

### `/act:audit-skill <name>`
Audit a specific skill.

```bash
/act:audit-skill context-engineering
```

### `/act:audit-command <name>`
Audit a specific command.

```bash
/act:audit-command act/init
```

### `/act:audit-agent <name>`
Audit a specific agent.

```bash
/act:audit-agent researcher
```

### `/act:audit-all`
Run comprehensive audit on entire framework.

```bash
/act:audit-all
/act:audit-all --quick  # Summary only
```

### `/act:heal <target>`
Attempt automatic repair of identified issues.

```bash
/act:heal skills/context-engineering
/act:heal commands/act/init --dry-run
/act:heal . --auto  # Heal all safe issues
```

## Heal Capabilities

### Auto-healable Issues
Issues that can be safely fixed automatically:
- Missing required sections (add template)
- Broken relative links (adjust path)
- Missing newlines at EOF
- Inconsistent formatting

### Manual-heal Issues
Issues requiring human review:
- Missing content in sections
- Conflicting information
- Architectural decisions
- Feature completeness

## Integration

### With CI/CD
```yaml
# In .github/workflows/audit.yml
- name: Audit Framework
  run: /act:audit-all --ci --fail-on-warning
```

### With Hooks
```markdown
# In hooks/pre-commit/audit.md
Run `/act:audit-all --quick` before committing
```

## Best Practices

1. **Run audits regularly** - At least before major releases
2. **Fix warnings promptly** - They tend to accumulate
3. **Use `--dry-run` first** - Before auto-healing
4. **Review heal changes** - Even "safe" fixes need review
5. **Integrate with CI** - Catch issues early

## Related

- [SPEC-act-validate.md](SPEC-act-validate.md) - Installation validation
- [skills/auditor/SKILL.md](../skills/auditor/SKILL.md) - Auditor skill documentation
