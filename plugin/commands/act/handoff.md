# Command: /act:handoff

**Version:** 1.0.0
**Category:** Context Engineering

---

## Purpose

Generate a context handoff document for transferring work between sessions or agents. Captures current state, completed work, and remaining tasks in a standardized format.

## Syntax

```
/act:handoff [options]
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--to <agent>` | Specify target agent | (none) |
| `--format <xml\|md>` | Output format | `xml` |
| `--save` | Save to `.act/handoffs/` | `false` |
| `--include-files` | List all modified files | `true` |
| `--compact` | Minimal handoff (metadata + remaining only) | `false` |

## Usage Examples

### Basic Handoff

```
/act:handoff
```

Generates a full context handoff to stdout:

```xml
<context_handoff>
  <metadata>
    <project>ACT v2.5</project>
    <timestamp>2026-02-02T10:30:00Z</timestamp>
    <from_session>main</from_session>
  </metadata>
  <original_task>
    Implement Phase 4 of ACT v2.5 framework
  </original_task>
  ...
</context_handoff>
```

### Handoff to Specific Agent

```
/act:handoff --to code-review-agent
```

Includes target agent in metadata:

```xml
<metadata>
  ...
  <to_agent>code-review-agent</to_agent>
</metadata>
```

### Save Handoff

```
/act:handoff --save
```

Saves to `.act/handoffs/YYYY-MM-DD-HHmm.xml` and updates `latest.xml` symlink.

### Markdown Format

```
/act:handoff --format md
```

Generates markdown instead of XML:

```markdown
# Context Handoff

## Metadata
- **Project:** ACT v2.5
- **Timestamp:** 2026-02-02T10:30:00Z
- **From Session:** main

## Original Task
Implement Phase 4 of ACT v2.5 framework

## Work Completed
- Created specs/SPEC-context-handoff.md
- Created templates/context-handoff.xml

## Work Remaining
- Create commands/act/handoff.md
- Update session-recovery skill
...
```

### Compact Handoff

```
/act:handoff --compact
```

Minimal handoff for quick context transfer:

```xml
<context_handoff>
  <metadata>
    <project>ACT v2.5</project>
    <timestamp>2026-02-02T10:30:00Z</timestamp>
  </metadata>
  <current_state>Phase: 4/6 | Progress: 60%</current_state>
  <work_remaining>
    - Create handoff command
    - Update session-recovery
  </work_remaining>
</context_handoff>
```

## Data Sources

The handoff command collects data from:

| Information | Source |
|-------------|--------|
| Project name | `.act/config.yaml` |
| Current phase | `.act/state.md` |
| Progress | `.act/state.md` |
| Completed work | `.act/progress.md` |
| Remaining work | `.act/plan.md` (incomplete tasks) |
| Files touched | `git diff --name-only` |
| Last commit | `git log -1 --format=%h` |
| Blockers | `.act/state.md` |

## Generation Process

1. **Read State Files**
   ```
   config.yaml → project name, goals
   state.md → phase, progress, blockers
   progress.md → recent actions
   plan.md → remaining tasks
   ```

2. **Collect Git Information**
   ```
   git branch → current branch
   git log -1 → last commit
   git diff --name-only → modified files
   ```

3. **Extract Critical Context**
   - Parse recent decisions from progress.md
   - Identify constraints from config.yaml
   - Note any blockers from state.md

4. **Generate Output**
   - Apply template (XML or MD)
   - Fill placeholders with collected data
   - Output to stdout or save to file

## Output

### To Stdout (default)

Displays the handoff document directly:

```
/act:handoff
```

### To File (--save)

```
/act:handoff --save
```

Creates:
- `.act/handoffs/2026-02-02-1030.xml`
- Updates `.act/handoffs/latest.xml` symlink

### Return Value

Returns the path to saved file if `--save` is used:

```
✅ Handoff saved to .act/handoffs/2026-02-02-1030.xml
```

## Integration

### With /act:stop

When stopping a session, optionally generate handoff:

```
/act:stop --handoff
```

Equivalent to:
```
/act:handoff --save
/act:stop
```

### With /act:resume

When resuming, check for recent handoff:

```
/act:resume
```

If `.act/handoffs/latest.xml` exists and is recent (<24h), include in catchup report:

```markdown
## 🔄 Session Recovery

**Previous handoff found:** 2026-02-02 10:30

### From Last Session
- Original task: Implement Phase 4
- Completed: 3 items
- Remaining: 2 items

### Prochaines étapes
[from handoff work_remaining]
```

### With Subagent Spawning

Generate handoff for subagent context:

```
/act:handoff --to subagent:impl-feature --compact
```

Pass output to subagent as initial context.

## Error Handling

### No .act/ Directory

```
❌ Error: No .act/ directory found.
   Run /act:init to initialize project first.
```

### Missing State Files

```
⚠️ Warning: Some state files missing.
   - [x] config.yaml ✓
   - [x] state.md ✓
   - [ ] progress.md ❌
   
   Generating partial handoff...
```

### No Work Remaining

```
ℹ️ Note: No remaining work found in plan.md.
   Generating handoff marked as complete.
```

## Best Practices

1. **Generate before context overflow**
   - Don't wait until context is full
   - Generate when you notice slowdown

2. **Be specific in critical_context**
   - Include decisions, not just facts
   - Note user preferences

3. **Use --save for important handoffs**
   - Creates recoverable history
   - Enables /act:resume integration

4. **Include recommendations**
   - Help the next agent start faster
   - Warn about gotchas

## Configuration

In `.act/config.yaml`:

```yaml
handoff:
  format: xml          # Default format (xml|md)
  autoSave: false      # Auto-save on generation
  maxFiles: 5          # Max handoffs to keep
  includeGitDiff: true # Include file changes
```

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:resume` | Resume from handoff |
| `/act:stop` | Stop session (optionally with handoff) |
| `/act:status` | View current state |
| `/act:history` | View session history |

## Related Documentation

- [Context Handoff SPEC](../../specs/SPEC-context-handoff.md)
- [Context Handoff Template](../../templates/context-handoff.xml)
- [Session Recovery Skill](../../skills/session-recovery/SKILL.md)

---

*Command documentation for ACT v2.5 /act:handoff*
