# Skill: Auditor

## Purpose

The Auditor skill enables systematic verification and repair of ACT framework components. It ensures structural integrity, format compliance, reference validity, and content completeness across skills, commands, and agents.

## When to Use

- Before releasing a new version of the framework
- After significant refactoring or reorganization
- When onboarding new components
- During code review of framework changes
- To diagnose issues with a specific component

## Audit Process

### 1. Identify Target
Determine what to audit:
- Single component: `skills/context-engineering`
- Category: `all skills`, `all commands`
- Everything: full framework audit

### 2. Run Checks
Execute checks in order:
1. **Structure** - File existence
2. **Format** - Markdown validity
3. **References** - Link resolution
4. **Consistency** - Cross-file coherence
5. **Completeness** - No forgotten work

### 3. Generate Report
Produce standardized report with:
- Check status for each category
- Overall score (0-5)
- Detailed findings
- Suggested fixes

### 4. Heal (Optional)
Apply automatic fixes for safe issues.

## Checks by Component Type

### Skills

| Check | What to Verify |
|-------|---------------|
| Structure | `SKILL.md` exists in skill directory |
| Format | Has Purpose, Usage, Examples sections |
| References | Internal links resolve |
| Consistency | Skill mentioned in README/CLAUDE.md |
| Completeness | No TODO/FIXME markers |

**Required sections for SKILL.md:**
```markdown
# Skill: <Name>
## Purpose
## When to Use  (or "Usage")
## Examples (or "How to Use")
```

### Commands

| Check | What to Verify |
|-------|---------------|
| Structure | `.md` file exists with valid name |
| Format | Has description, parameters (if any), examples |
| References | Links to other commands/skills exist |
| Consistency | Command listed in README command table |
| Completeness | No placeholder content |

**Required sections for command:**
```markdown
# /act:<name>
## Description (or purpose paragraph)
## Usage / Parameters
## Examples
```

### Agents

| Check | What to Verify |
|-------|---------------|
| Structure | `AGENT.md` or `README.md` exists |
| Format | Has role, capabilities, instructions |
| References | Referenced skills/commands exist |
| Consistency | Agent type matches capabilities |
| Completeness | All sections filled |

**Required sections for agent:**
```markdown
# Agent: <Name>
## Role
## Capabilities
## Instructions
```

## Interpreting Results

### Status Indicators

| Status | Meaning | Action Required |
|--------|---------|-----------------|
| ✅ Pass | Check successful | None |
| ⚠️ Warning | Minor issue found | Fix when convenient |
| ❌ Error | Significant problem | Fix before release |
| ⏭️ Skipped | Check not applicable | None |

### Score Interpretation

| Score | Rating | Meaning |
|-------|--------|---------|
| 5/5 | Excellent | Production ready |
| 4/5 | Good | Minor polish needed |
| 3/5 | Acceptable | Known issues to address |
| 2/5 | Poor | Significant work needed |
| 1/5 | Critical | Major problems |
| 0/5 | Failed | Non-functional |

## Healing Issues

### Automatically Healable

These issues can be fixed with `--auto`:

1. **Missing EOF newline**
   - Fix: Add `\n` at end of file

2. **Missing required section**
   - Fix: Add template section
   ```markdown
   ## Examples
   
   <!-- TODO: Add examples -->
   ```

3. **Relative link depth**
   - Fix: Adjust `../` count
   - Before: `[link](../wrong/path.md)`
   - After: `[link](../../correct/path.md)`

4. **Inconsistent heading levels**
   - Fix: Normalize heading hierarchy

### Manual Healing Required

These need human review:

1. **Empty sections** - Need actual content
2. **Broken external links** - May need update or removal
3. **Conflicting information** - Needs decision
4. **Missing features** - Needs implementation

## Best Practices

### Regular Audits
```bash
# Weekly during active development
/act:audit-all --quick

# Before each release
/act:audit-all
```

### Fix as You Go
Don't let warnings accumulate:
```bash
# Check before commit
/act:audit-command act/new-feature

# Fix issues immediately
/act:heal commands/act/new-feature --dry-run
/act:heal commands/act/new-feature --auto
```

### CI Integration
Add audit to CI pipeline:
```yaml
- name: Audit
  run: /act:audit-all --fail-on-error
```

## Examples

### Audit a Skill
```bash
/act:audit-skill context-engineering
```

Output:
```markdown
## Audit Report: skill/context-engineering

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | SKILL.md present |
| Format | ✅ | All required sections found |
| References | ✅ | 3 links verified |
| Consistency | ✅ | Listed in README |
| Completeness | ✅ | No TODOs found |

**Score: 5/5** (100%)
**Issues:** None
```

### Audit with Issues
```bash
/act:audit-command act/experimental
```

Output:
```markdown
## Audit Report: command/act/experimental

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | File present |
| Format | ⚠️ | Missing Examples section |
| References | ❌ | 2 broken links |
| Consistency | ⚠️ | Not in README |
| Completeness | ⚠️ | 1 TODO found |

**Score: 2/5** (40%)
**Issues:** 1 error, 3 warnings

### Details

#### ❌ References
- Line 15: Link to `../skills/missing/SKILL.md` not found
- Line 28: Link to `#nonexistent-anchor` not found

#### ⚠️ Format
- Missing required section: Examples

#### ⚠️ Consistency
- Command not listed in README.md command table

#### ⚠️ Completeness
- Line 42: `TODO: implement error handling`
```

### Heal with Dry Run
```bash
/act:heal commands/act/experimental --dry-run
```

Output:
```markdown
## Heal Plan: command/act/experimental

### Would Apply:
1. ✅ Add Examples section (template)
2. ⏭️ Fix broken links (manual review needed)
3. ✅ Add to README command table

### Would NOT Apply:
- TODO removal (needs implementation)
- Broken link to missing skill

Run without --dry-run to apply safe fixes.
```

## Related

- [SPEC-agent-auditors.md](../../specs/SPEC-agent-auditors.md) - Full specification
- [/act:audit-skill](../../commands/act/audit-skill.md) - Audit skill command
- [/act:audit-command](../../commands/act/audit-command.md) - Audit command command
- [/act:audit-agent](../../commands/act/audit-agent.md) - Audit agent command
- [/act:audit-all](../../commands/act/audit-all.md) - Full audit command
- [/act:heal](../../commands/act/heal.md) - Healing command
