# Command: /act:reflect

## Purpose
Trigger structured self-reflection to improve output quality. Research shows reflexion improves results by **+8-21%**.

---

## Syntax

```
/act:reflect [topic]
```

### Arguments

| Argument | Required | Description |
|----------|----------|-------------|
| `topic` | No | Specific topic to reflect on. Defaults to most recent task. |

---

## Usage Examples

```bash
# Reflect on recent work
/act:reflect

# Reflect on specific topic
/act:reflect API implementation

# Reflect on process
/act:reflect "my debugging approach"

# Reflect on decision
/act:reflect "choice of database"
```

---

## Execution Steps

### Step 1: Identify Topic

```
IF topic provided THEN
  reflection_topic = topic
ELSE
  reflection_topic = most recent task from progress.md
  IF no recent task THEN
    ASK "What would you like to reflect on?"
```

### Step 2: Ask Reflexion Questions

Present and answer the 4 core questions:

#### Question 1: What worked well? ✅
```
Think about:
- Which decisions led to good outcomes?
- What techniques were effective?
- What patterns should I repeat?
```

#### Question 2: What could be improved? 🔧
```
Think about:
- Any edge cases missed?
- Quality issues?
- Performance gaps?
- Documentation needs?
```

#### Question 3: What did I learn? 💡
```
Think about:
- New technical knowledge?
- Domain insights?
- Better approaches discovered?
```

#### Question 4: What would I do differently? 🔄
```
Think about:
- Alternative approaches?
- Better starting point?
- Improved workflow?
```

### Step 3: Format Output

#### Quick Format (simple tasks)

```markdown
## Quick Reflect: [Topic]

✅ **Worked:** [1-2 key successes]
🔧 **Improve:** [1-2 specific improvements]
💡 **Learned:** [1 key insight]
```

#### Full Format (complex tasks)

```markdown
## Reflexion: [Topic]

### What Worked Well ✅
- [Success 1 with explanation]
- [Success 2 with explanation]

### What Could Be Improved 🔧
- [Issue 1]: [How to address]
- [Issue 2]: [How to address]

### What I Learned 💡
- [Technical insight]
- [Process insight]

### What I'd Do Differently 🔄
- [Alternative approach]
- [Better sequence]

### Action Items
- [ ] [Immediate improvement]
- [ ] [Future consideration]
```

### Step 4: Save to Findings

Append to `.act/findings.md`:

```markdown
## Reflexion Insights

### [YYYY-MM-DD HH:mm] [Topic]

**What worked:**
- [key success]

**What to improve:**
- [key improvement]

**Lesson:**
- [key insight]
```

### Step 5: Suggest Memorization

```
IF insight is significant (reusable across projects) THEN
  OUTPUT: "💡 This insight seems valuable. Save with /act:memorize?"
```

---

## Output Format

### Success

```
🪞 Reflexion: [Topic]

### What Worked Well ✅
- Clear API design made integration straightforward
- Test-first approach caught validation edge cases

### What Could Be Improved 🔧
- Response time on search endpoint (800ms → target 200ms)
- Missing documentation for error codes

### What I Learned 💡
- Database indexes are critical for search performance
- Early performance testing prevents late-stage surprises

### What I'd Do Differently 🔄
- Add performance benchmarks to CI pipeline
- Document error codes as I implement them

---

📝 Saved to .act/findings.md
💡 Consider: /act:memorize "Add performance benchmarks early"
```

### No Topic Found

```
🪞 Reflexion

No recent task found in progress.md.

What would you like to reflect on?
- A specific implementation?
- A decision you made?
- Your recent workflow?
```

---

## Context-Specific Questions

The command adds relevant questions based on context:

### For Code Tasks

```markdown
### Additional Checks
- [ ] Is it tested?
- [ ] Is it documented?
- [ ] Any security concerns?
- [ ] Performance acceptable?
```

### For Design Tasks

```markdown
### Additional Checks
- [ ] Does it scale?
- [ ] Is it flexible?
- [ ] Consistent patterns?
```

### For Research Tasks

```markdown
### Additional Checks
- [ ] Sources reliable?
- [ ] Any gaps?
- [ ] Actionable insights?
```

---

## Auto-Trigger

Reflexion is automatically triggered when:

1. **"reflect" appears in prompt**
   ```
   User: "Please review and reflect on the implementation"
   → /act:reflect auto-triggered
   ```

2. **Stop Hook suggests it**
   ```
   [Stop Hook]
   → Complex task completed (>30 min)
   → Suggest: "Consider /act:reflect"
   ```

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:memorize` | Save important insight |
| `/act:status` | Check current state |
| `/act:resume` | Recover session context |

---

## Notes

- Reflexion adds ~2-5 minutes but improves quality by 8-21%
- Skip for trivial tasks (overhead > benefit)
- Best done immediately after task completion (fresh context)
- Insights stored in `.act/findings.md`

---

*Command version: 1.0*
*ACT version: 2.5*
