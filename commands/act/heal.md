# /act:heal

## Description

Automatically repair issues identified by audit commands. Can fix structural problems, add missing sections, repair broken links, and ensure consistency across the framework.

## Usage

```
/act:heal <target> [options]
```

## Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `target` | Yes | Path to component or `.` for all |
| `--dry-run` | No | Show fixes without applying |
| `--auto` | No | Apply only safe, automatic fixes |
| `--force` | No | Apply all fixes including risky ones |
| `--verbose` | No | Show detailed fix information |
| `--backup` | No | Create backup before modifying |

## Target Formats

| Format | Example | Description |
|--------|---------|-------------|
| Skill | `skills/context-engineering` | Heal specific skill |
| Command | `commands/act/init` | Heal specific command |
| Agent | `agents/researcher` | Heal specific agent |
| File | `commands/act/init.md` | Heal specific file |
| All | `.` | Heal entire framework |

## Fix Categories

### Safe Fixes (--auto)

These fixes are applied automatically with `--auto`:

| Issue | Fix Applied |
|-------|------------|
| Missing EOF newline | Add trailing newline |
| Missing required section | Add template section |
| Inconsistent heading levels | Normalize hierarchy |
| Relative link depth | Adjust `../` count |
| Missing from README table | Add entry |
| Trailing whitespace | Remove extra spaces |

### Manual Review Required

These fixes need `--force` or manual intervention:

| Issue | Why Manual |
|-------|-----------|
| Empty sections | Need real content |
| Broken external links | May need removal or update |
| Conflicting information | Requires decision |
| TODO/FIXME markers | Need implementation |
| Missing capabilities | Need actual code |

## Output Format

### Dry Run

```bash
/act:heal skills/context-engineering --dry-run
```

```markdown
## Heal Plan: skills/context-engineering

### Will Apply (--auto):
1. ✅ Add trailing newline to SKILL.md
2. ✅ Fix relative link: `../specs/missing.md` → `../../specs/SPEC-context.md`

### Will Apply (--force):
3. ⚠️ Add template Examples section (needs content)

### Cannot Auto-fix:
4. ❌ TODO on line 42 (needs implementation)
5. ❌ Empty "Advanced Usage" section (needs content)

**Summary:** 2 safe fixes, 1 template fix, 2 manual fixes needed

Run without --dry-run to apply safe fixes.
Run with --force to apply all template fixes.
```

### Applied Fixes

```bash
/act:heal skills/context-engineering --auto
```

```markdown
## Heal Report: skills/context-engineering

### Applied Fixes:
1. ✅ Added trailing newline to SKILL.md
2. ✅ Fixed relative link on line 28

### Skipped (needs --force):
3. ⏭️ Template Examples section

### Cannot Auto-fix:
4. ❌ TODO on line 42
5. ❌ Empty section

**Result:** 2 fixes applied, 1 skipped, 2 manual

Re-run audit to verify: `/act:audit-skill context-engineering`
```

## Examples

### Preview Fixes
```bash
/act:heal commands/act/init --dry-run
```

### Apply Safe Fixes
```bash
/act:heal commands/act/init --auto
```

### Apply All Fixes
```bash
/act:heal commands/act/init --force
```

### Heal Entire Framework
```bash
/act:heal . --dry-run
/act:heal . --auto
```

### With Backup
```bash
/act:heal skills/risky-changes --force --backup
```
Creates `.bak` files before modification.

## Fix Templates

When `--force` adds missing sections, it uses templates:

### Missing Examples Section
```markdown
## Examples

### Basic Usage
```bash
# TODO: Add basic example
```

### Advanced Usage
```bash
# TODO: Add advanced example
```
```

### Missing Parameters Section
```markdown
## Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `name` | Yes | TODO: Describe parameter |
```

### Missing Related Section
```markdown
## Related

- [TODO: Add related links]
```

## Workflow

### Standard Healing Flow

```bash
# 1. Run audit to identify issues
/act:audit-skill context-engineering

# 2. Preview what would be fixed
/act:heal skills/context-engineering --dry-run

# 3. Apply safe fixes
/act:heal skills/context-engineering --auto

# 4. Review remaining issues
/act:audit-skill context-engineering

# 5. Apply template fixes if needed
/act:heal skills/context-engineering --force

# 6. Manually fix TODOs and empty sections

# 7. Final verification
/act:audit-skill context-engineering
```

### Framework-wide Healing

```bash
# 1. Full audit
/act:audit-all

# 2. Preview all fixes
/act:heal . --dry-run

# 3. Apply safe fixes
/act:heal . --auto

# 4. Check remaining issues
/act:audit-all --quick

# 5. Address remaining issues manually
```

## Safety

### What --auto Will NOT Do

- Delete any content
- Overwrite existing sections
- Remove TODO markers
- Change semantic meaning
- Modify code blocks
- Alter configuration

### Backup Behavior

With `--backup`:
- Creates `filename.md.bak` before modification
- Keeps last backup only
- Prints backup location

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | All requested fixes applied |
| 1 | Some fixes skipped (need --force) |
| 2 | Some fixes impossible (manual needed) |
| 3 | Error during healing |

## Related

- [/act:audit-skill](audit-skill.md) - Audit skills
- [/act:audit-command](audit-command.md) - Audit commands
- [/act:audit-agent](audit-agent.md) - Audit agents
- [/act:audit-all](audit-all.md) - Full framework audit
- [SKILL: auditor](../../skills/auditor/SKILL.md) - Auditor skill documentation
