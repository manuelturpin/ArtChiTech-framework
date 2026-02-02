# SPEC: Context Handoff Format

**Version:** 1.0.0
**Status:** Active
**Category:** Context Engineering

---

## Objective

Define a standardized format for transferring context between sessions or agents when:
- Handing off work to another agent
- Context window is about to be exhausted
- Session must end but work isn't complete
- Delegating subtasks to specialized agents

## Format

### XML Schema

```xml
<context_handoff>
  <metadata>
    <project>{{PROJECT_NAME}}</project>
    <timestamp>{{TIMESTAMP}}</timestamp>
    <from_session>{{SESSION_ID}}</from_session>
    <to_agent>{{TARGET_AGENT}}</to_agent>
    <format_version>1.0</format_version>
  </metadata>
  
  <original_task>
    <!-- Full description of the original task or goal -->
  </original_task>
  
  <work_completed>
    <!-- List of completed actions with timestamps -->
    - [timestamp] Action 1 completed
    - [timestamp] Action 2 completed
  </work_completed>
  
  <work_remaining>
    <!-- List of remaining tasks in priority order -->
    - Task 1 (priority: high)
    - Task 2 (priority: medium)
  </work_remaining>
  
  <attempted_approaches>
    <!-- Approaches tried with results -->
    - Approach 1: ✅ Worked
    - Approach 2: ❌ Failed because...
    - Approach 3: ⚠️ Partial success
  </attempted_approaches>
  
  <critical_context>
    <!-- Information that MUST NOT be lost -->
    - Key decision 1
    - Important constraint
    - User preference
  </critical_context>
  
  <current_state>
    <!-- Snapshot of current project state -->
    Phase: X/Y
    Progress: X%
    Branch: feature/...
    Last Commit: abc1234
    Blockers: ...
  </current_state>
  
  <files_touched>
    <!-- Files modified during this session -->
    - path/to/file1.md (created)
    - path/to/file2.md (modified)
  </files_touched>
  
  <recommendations>
    <!-- Suggestions for the next agent -->
    - Start with...
    - Be careful of...
    - Consider...
  </recommendations>
</context_handoff>
```

## Fields

### Required Fields

| Field | Description |
|-------|-------------|
| `metadata.project` | Project name or identifier |
| `metadata.timestamp` | ISO 8601 timestamp of handoff |
| `metadata.from_session` | Session ID or identifier |
| `original_task` | Description of the original goal |
| `work_completed` | List of completed actions |
| `work_remaining` | List of remaining tasks |
| `current_state` | Current phase and progress |

### Optional Fields

| Field | Description |
|-------|-------------|
| `metadata.to_agent` | Target agent if known |
| `metadata.format_version` | Version of handoff format |
| `attempted_approaches` | What was tried and results |
| `critical_context` | Must-not-lose information |
| `files_touched` | Files modified in session |
| `recommendations` | Suggestions for next agent |

## Use Cases

### 1. Context Window Exhaustion

When context is about to overflow:

```xml
<context_handoff>
  <metadata>
    <project>ACT v2.5</project>
    <timestamp>2026-02-02T10:30:00Z</timestamp>
    <from_session>main-session-abc</from_session>
  </metadata>
  <original_task>
    Implement Phase 4 of ACT v2.5 framework
  </original_task>
  <work_completed>
    - Created specs/SPEC-context-handoff.md
    - Created templates/context-handoff.xml
  </work_completed>
  <work_remaining>
    - Create commands/act/handoff.md
    - Update skills/session-recovery/SKILL.md
    - Create tag v2.5.0-beta.4
  </work_remaining>
  <current_state>
    Phase: 4/6
    Progress: 60%
    Branch: feature/act-v2.5-implementation
  </current_state>
</context_handoff>
```

### 2. Agent Delegation

When delegating to a specialized agent:

```xml
<context_handoff>
  <metadata>
    <project>WebApp</project>
    <timestamp>2026-02-02T14:00:00Z</timestamp>
    <from_session>main</from_session>
    <to_agent>code-review-agent</to_agent>
  </metadata>
  <original_task>
    Review the authentication module for security issues
  </original_task>
  <critical_context>
    - Uses JWT with RS256
    - Token expiry is 1 hour
    - Refresh tokens stored in httpOnly cookies
  </critical_context>
  <files_touched>
    - src/auth/jwt.ts
    - src/auth/refresh.ts
  </files_touched>
  <recommendations>
    - Focus on token validation
    - Check for timing attacks
  </recommendations>
</context_handoff>
```

### 3. Session End

When work must pause:

```xml
<context_handoff>
  <metadata>
    <project>DataPipeline</project>
    <timestamp>2026-02-02T18:00:00Z</timestamp>
    <from_session>evening-session</from_session>
  </metadata>
  <original_task>
    Migrate database from v1 to v2 schema
  </original_task>
  <attempted_approaches>
    - In-place migration: ❌ Too slow for prod
    - Blue-green: ✅ Testing now
  </attempted_approaches>
  <current_state>
    Phase: 2/3 (Testing)
    Progress: 75%
    Blockers: Need staging environment access
  </current_state>
  <work_remaining>
    - Complete staging tests
    - Get prod approval
    - Execute migration
  </work_remaining>
</context_handoff>
```

## Alternative Formats

### Markdown Format

For systems that don't support XML:

```markdown
# Context Handoff

## Metadata
- **Project:** {{PROJECT_NAME}}
- **Timestamp:** {{TIMESTAMP}}
- **From Session:** {{SESSION_ID}}

## Original Task
{{ORIGINAL_TASK}}

## Work Completed
{{WORK_COMPLETED}}

## Work Remaining
{{WORK_REMAINING}}

## Current State
- **Phase:** {{PHASE}}
- **Progress:** {{PROGRESS}}
- **Blockers:** {{BLOCKERS}}
```

## Integration Points

### With Session Recovery

The handoff format integrates with `/act:resume`:
1. When resuming, check for recent handoff
2. Parse handoff to populate catchup report
3. Continue from `work_remaining`

### With Stop Hook

The Stop hook can auto-generate handoff:
1. Collect session data
2. Generate handoff XML
3. Save to `.act/handoffs/`

### With Subagent Spawning

When spawning subagents:
1. Generate handoff for subtask
2. Pass to subagent as context
3. Subagent returns result handoff

## Storage

### Default Location

```
.act/
├── handoffs/
│   ├── 2026-02-02-1030.xml
│   ├── 2026-02-02-1400.xml
│   └── latest.xml → 2026-02-02-1400.xml
```

### Retention

- Keep last 5 handoffs by default
- Configurable via `.act/config.yaml`:

```yaml
handoff:
  maxFiles: 5
  format: xml  # or md
  autoSave: true
```

## Validation

A valid handoff MUST:
1. Have all required fields populated
2. Have a valid ISO 8601 timestamp
3. Have at least one item in `work_remaining` OR be marked as complete
4. Have consistent phase/progress values

## Command

Generate handoff via `/act:handoff`:

```
/act:handoff              # Generate to stdout
/act:handoff --save       # Save to .act/handoffs/
/act:handoff --to agent   # Include target agent
/act:handoff --format md  # Use markdown format
```

## Related

- [Session Recovery Skill](../skills/session-recovery/SKILL.md)
- [/act:handoff Command](../commands/act/handoff.md)
- [Context Handoff Template](../templates/context-handoff.xml)
- [Stop Hook](../hooks/stop/)

---

*Specification for ACT v2.5 Context Handoff Format*
