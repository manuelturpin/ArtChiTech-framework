# Command: /act:memorize

## Purpose
Save important insights for future reference. Stores in `.act/findings.md` with option to promote significant insights to `CLAUDE.md`.

---

## Syntax

```
/act:memorize <insight> [options]
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `insight` | Yes | The insight to save (text or quoted string) |

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--important` | Also add to CLAUDE.md | false |
| `--category` | Category for organization | "general" |
| `--context` | Additional context | Current task |

---

## Usage Examples

```bash
# Basic memorization
/act:memorize "Always check JWT expiry AND clock skew together"

# Mark as important (adds to CLAUDE.md)
/act:memorize "Database indexes are 10x impact on search" --important

# With category
/act:memorize "Use connection pooling for >10 concurrent users" --category performance

# With context
/act:memorize "Refresh tokens need separate expiry logic" --context "Auth implementation"
```

---

## Execution Steps

### Step 1: Parse Input

```
insight = parsed insight text
options = {
  important: --important flag present,
  category: --category value OR "general",
  context: --context value OR current task from state.md
}
```

### Step 2: Validate Insight

```
IF insight is empty THEN
  ERROR "Please provide an insight to memorize"
  STOP

IF insight length < 10 characters THEN
  WARN "Insight seems short. Did you mean: /act:memorize \"your insight here\"?"
```

### Step 3: Save to findings.md

Append to `.act/findings.md`:

```markdown
## Memorized Insights

### [YYYY-MM-DD HH:mm] Insight
> [insight text]

**Context:** [context]
**Category:** [category]
```

### Step 4: Optionally Save to CLAUDE.md

```
IF --important flag THEN
  Append to CLAUDE.md under "## Lessons Learned":
  
  ### [Category]
  - [insight text]
  
  OUTPUT: "✅ Added to CLAUDE.md (persistent across projects)"
```

### Step 5: Confirm

```
OUTPUT:
📝 Memorized: "[insight]"
📁 Saved to: .act/findings.md
[IF important] 📌 Also added to: CLAUDE.md
```

---

## Output Format

### Success (Basic)

```
📝 Memorized!

> "Always check JWT expiry AND clock skew together"

📁 Saved to: .act/findings.md
🏷️ Category: authentication
📅 Context: Auth implementation
```

### Success (Important)

```
📝 Memorized!

> "Database indexes are 10x impact on search queries"

📁 Saved to: .act/findings.md
📌 Also added to: CLAUDE.md (persistent)
🏷️ Category: performance
```

### Error: No Insight

```
❌ No insight provided.

Usage: /act:memorize <insight> [options]

Examples:
  /act:memorize "Always validate input before processing"
  /act:memorize "Use caching for expensive queries" --important
```

---

## Storage Format

### In `.act/findings.md`

```markdown
## Memorized Insights

### [2026-02-02 14:30] Insight
> Always check JWT expiry AND clock skew together

**Context:** Auth implementation
**Category:** authentication

---

### [2026-02-02 15:45] Insight
> Database indexes are 10x impact on search queries

**Context:** Search optimization
**Category:** performance
**Important:** Yes (added to CLAUDE.md)
```

### In `CLAUDE.md` (--important only)

```markdown
## Lessons Learned

### Performance
- Database indexes are 10x impact on search queries
- Use connection pooling for >10 concurrent users

### Authentication  
- Always check JWT expiry AND clock skew together
- Define token lifecycle before implementation
```

---

## Categories

Suggested categories for organization:

| Category | Use For |
|----------|---------|
| `general` | Default, miscellaneous insights |
| `performance` | Speed, optimization, scaling |
| `security` | Auth, validation, vulnerabilities |
| `testing` | Test strategies, coverage |
| `architecture` | Design patterns, structure |
| `debugging` | Troubleshooting techniques |
| `process` | Workflow, methodology |
| `domain` | Business logic, domain knowledge |

---

## When to Use --important

Add `--important` when the insight:

✅ **Should be --important:**
- Applies to multiple projects
- Is a significant pattern or anti-pattern
- Prevented a major bug/issue
- Changed how you approach problems
- Worth remembering 6+ months from now

❌ **Should NOT be --important:**
- Project-specific detail
- Temporary workaround
- Obvious/well-known fact
- Minor optimization

### Rule of Thumb

```
Would I want to know this when starting a new project?
├── YES → --important
└── NO  → findings.md only
```

---

## Integration

### After /act:reflect

```
[After reflection]
"💡 This insight seems valuable: 'Always define token lifecycle before coding'"
"Save with: /act:memorize \"Always define token lifecycle before coding\" --important"
```

### In Session Recovery

Memorized insights appear in findings summary:

```markdown
## 🔄 Session Recovery

**Recent Insights:**
- [Auth] Always check JWT expiry AND clock skew
- [Perf] Database indexes are 10x on search
```

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:reflect` | Generate insights through reflection |
| `/act:status` | See current project state |
| `/act:resume` | Recover with context including insights |

---

## Notes

- Primary storage is `.act/findings.md` (project-level)
- Use `--important` sparingly to avoid CLAUDE.md noise
- Insights are timestamped for chronological tracking
- Categories help organize and retrieve insights later

---

*Command version: 1.0*
*ACT version: 2.5*
