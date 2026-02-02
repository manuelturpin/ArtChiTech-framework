# Skill: Reflexion

> **"Reflect before you ship. +8-21% quality improvement."**

## Purpose

Improve output quality through structured self-reflection. Research shows reflexion improves results by 8-21% across diverse tasks.

---

## When to Reflect

### High Priority (Always Reflect)

| Situation | Why |
|-----------|-----|
| Complex task completed | Most benefit from review |
| User asks for review | Explicit request |
| "reflect" appears in prompt | Auto-trigger |
| Multiple iterations needed | Process improvement opportunity |
| Unexpected result | Learn from surprises |

### Skip Reflection

| Situation | Why |
|-----------|-----|
| Simple mechanical task | Overhead > benefit |
| Urgent time-critical fix | Speed priority |
| User explicitly requests speed | Respect user choice |

### Rule of Thumb

```
Did this task require thinking, creativity, or problem-solving?
├── YES → Reflect
└── NO  → Skip
```

---

## How to Reflect

### The 4 Questions

Ask yourself after completing a task:

#### 1. What worked well? ✅

Identify successful approaches and patterns:
- Which decisions led to good outcomes?
- What techniques were effective?
- What should I do again?

#### 2. What could be improved? 🔧

Find quality gaps and enhancement opportunities:
- Any edge cases missed?
- Performance issues?
- Code quality concerns?
- Documentation gaps?

#### 3. What did I learn? 💡

Extract insights for future tasks:
- New technical knowledge?
- Domain understanding?
- Better approaches discovered?

#### 4. What would I do differently? 🔄

Consider alternative approaches:
- Better starting point?
- Different architecture?
- Improved workflow?

---

## Reflexion Format

### Quick Reflexion (< 2 minutes)

```markdown
## Quick Reflect: [Task Name]

✅ **Worked:** [1-2 key successes]
🔧 **Improve:** [1-2 specific improvements]
💡 **Learned:** [1 key insight]
```

### Full Reflexion (5-10 minutes)

```markdown
## Reflexion: [Task Name]

### What Worked Well ✅
- [Success 1 with explanation]
- [Success 2 with explanation]
- [Pattern to repeat]

### What Could Be Improved 🔧
- [Issue 1]: [How to address]
- [Issue 2]: [How to address]
- [Gap identified]: [Solution]

### What I Learned 💡
- [Technical insight]
- [Process insight]
- [Domain knowledge]

### What I'd Do Differently 🔄
- [Alternative approach 1]
- [Better starting point]
- [Improved sequence]

### Action Items
- [ ] [Specific improvement to make now]
- [ ] [Note for future similar tasks]
```

---

## Context-Specific Questions

### For Code

| Question | Why |
|----------|-----|
| Is it tested? | Verification Iron Law |
| Is it documented? | Maintainability |
| Is it maintainable? | Long-term quality |
| Any security concerns? | Critical check |
| Performance acceptable? | User experience |

### For Design

| Question | Why |
|----------|-----|
| Does it scale? | Future-proofing |
| Is it flexible? | Change tolerance |
| Clear separation? | Maintainability |
| Consistent patterns? | Team understanding |

### For Research

| Question | Why |
|----------|-----|
| Sources reliable? | Accuracy |
| Any gaps? | Completeness |
| Bias considered? | Objectivity |
| Actionable insights? | Usefulness |

### For Documentation

| Question | Why |
|----------|-----|
| Is it clear? | Usability |
| Is it complete? | Coverage |
| Is it up-to-date? | Accuracy |
| Examples included? | Understanding |

---

## Storing Insights

### findings.md (Default)

All reflexion insights go to `.act/findings.md`:

```markdown
## Reflexion Insights

### [2026-02-02 14:30] Auth Implementation

**What worked:**
- JWT approach was correct choice
- Test-first caught 3 edge cases early

**What to improve:**
- Consider refresh tokens earlier in design
- Document error codes before implementation

**Lesson:**
- Always define token lifecycle before coding
```

### CLAUDE.md (Important Only)

For insights that should persist across projects:

```markdown
## Lessons Learned

### Authentication
- Always define token lifecycle before implementation
- Consider refresh tokens in initial design phase
```

**Threshold:** Only add to CLAUDE.md if insight is:
- Applicable to multiple projects
- A significant pattern or anti-pattern
- Worth remembering long-term

---

## Commands

| Command | When to Use |
|---------|-------------|
| `/act:reflect` | After completing a task |
| `/act:reflect [topic]` | Reflect on specific topic |
| `/act:memorize <insight>` | Save important insight |

---

## Examples

### Example 1: After API Implementation

```
/act:reflect API endpoint implementation
```

Output:
```markdown
## Reflexion: API Endpoint Implementation

### What Worked Well ✅
- Clean separation between routes and controllers
- Comprehensive validation with clear error messages
- Good test coverage (87%)

### What Could Be Improved 🔧
- Response time on `/users/search` is 800ms (target: <200ms)
- Missing rate limiting on public endpoints
- No caching strategy for frequently accessed data

### What I Learned 💡
- Early performance profiling catches issues before they compound
- Database indexes make 10x difference on search queries

### What I'd Do Differently 🔄
- Add performance tests from day 1
- Define caching strategy in design phase
- Consider pagination limits earlier
```

### Example 2: Quick Reflect After Bug Fix

```
/act:reflect
```

Output:
```markdown
## Quick Reflect: Login Timeout Bug

✅ **Worked:** Root cause found quickly using logs
🔧 **Improve:** Add monitoring for session timeouts
💡 **Learned:** Always check JWT expiry + clock skew together
```

### Example 3: Memorize Important Insight

```
/act:memorize "JWT issues: always check both token expiry AND server clock skew"
```

---

## Best Practices

### DO ✅

- Reflect immediately after task completion (fresh context)
- Be specific in observations
- Include actionable items
- Save truly important insights to CLAUDE.md
- Time-box reflection (5 min max for most tasks)

### DON'T ❌

- Skip reflection on complex tasks
- Write vague observations ("could be better")
- Reflect on trivial tasks (waste of time)
- Save everything to CLAUDE.md (noise)
- Spend more time reflecting than executing

---

## Integration

### With Hooks

Stop Hook suggests reflection for complex tasks:

```
[Stop Hook fires]
→ Task was complex (>30 min work OR multiple files)
→ Suggest: "Consider /act:reflect before finalizing"
```

### With Session Recovery

Reflexion insights appear in catchup report:

```markdown
## 🔄 Session Recovery

**Recent Insights (from reflexion):**
- JWT: check both expiry and clock skew
- Search queries need index on `created_at`
```

---

## Reflexion Patterns

### Pattern: Improvement Loop

```
Execute → Reflect → Improve → Execute (improved)
```

Use when: First attempt isn't good enough

### Pattern: Learning Extraction

```
Execute → Reflect → Memorize → Apply to next task
```

Use when: Insight applies beyond current task

### Pattern: Process Improvement

```
Execute multiple tasks → Reflect on process → Update workflow
```

Use when: Noticing repeated friction

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
