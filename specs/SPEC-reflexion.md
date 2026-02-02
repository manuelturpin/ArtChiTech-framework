# SPEC: Reflexion Pattern

**Version:** 2.5.0
**Feature:** 4.2 - Reflexion Pattern
**Status:** Implementation
**Date:** 2026-02-02

---

## Overview

The Reflexion Pattern enables agents to improve output quality through structured self-reflection. Based on research from Context Engineering Kit (CEK), this pattern has demonstrated **+8-21% improvement** in task quality.

## Motivation

From research (CEK studies):
> "Reflexion improves quality by 8-21% across diverse tasks"

Agents often:
- Complete tasks without evaluating quality
- Miss opportunities for improvement
- Forget lessons learned between sessions

Reflexion solves this by introducing a systematic reflection step after task completion.

---

## Impact Evidence

| Study | Task Type | Improvement |
|-------|-----------|-------------|
| CEK Benchmark | Code generation | +21% |
| CEK Benchmark | Problem solving | +15% |
| CEK Benchmark | Documentation | +8% |

**Average improvement: +14.7%**

---

## The Reflexion Process

### Core Flow

```
┌─────────────────────────────────────────────────────────┐
│                  Reflexion Process                       │
│                                                         │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌───────┐│
│  │Complete │───▶│Reflect  │───▶│Improve  │───▶│Memorize││
│  │Task     │    │         │    │         │    │       ││
│  └─────────┘    └─────────┘    └─────────┘    └───────┘│
│                                                         │
│  1. Finish      2. /act:reflect  3. Apply     4. /act:memorize│
│     the task       questions      improvements    insights  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Step 1: Complete Task
Execute the task to the best of your ability.

### Step 2: Reflect (`/act:reflect`)
Ask yourself structured questions:
- What worked well?
- What could be improved?
- What did I learn?
- What would I do differently?

### Step 3: Improve
Apply insights from reflection to enhance the output.

### Step 4: Memorize (`/act:memorize`)
Save important insights for future sessions.

---

## When to Reflect

### Triggers

| Trigger | Priority | Action |
|---------|----------|--------|
| Complex task completed | High | Always reflect |
| User requests review | High | Always reflect |
| "reflect" in prompt | Auto | Triggered automatically |
| Multiple iterations needed | Medium | Reflect on process |
| Unexpected result | Medium | Reflect on approach |

### Skip Reflection When

- Simple, mechanical tasks (file rename, formatting)
- Time-critical urgent fixes
- User explicitly requests speed over quality

---

## Reflexion Questions

### Core Questions (Always Ask)

1. **What worked well?**
   - Identify successful approaches
   - Note effective patterns

2. **What could be improved?**
   - Quality issues
   - Performance gaps
   - Missing edge cases

3. **What did I learn?**
   - New insights about the domain
   - Technical discoveries
   - Process improvements

4. **What would I do differently?**
   - Alternative approaches
   - Better starting points
   - Improved workflow

### Context-Specific Questions

| Context | Additional Questions |
|---------|---------------------|
| Code | Is it tested? Documented? Maintainable? |
| Design | Does it scale? Is it flexible? |
| Research | Are sources reliable? Any gaps? |
| Documentation | Is it clear? Complete? Up-to-date? |

---

## Output Storage

### Findings File (`.act/findings.md`)

```markdown
## Reflexion Insights

### [2026-02-02 14:30] Task: Auth Implementation
**What worked:**
- JWT approach was correct
- Test-first helped catch edge cases

**What to improve:**
- Should have considered refresh tokens earlier
- Documentation needed for error codes

**Lesson learned:**
- Always define token lifecycle before implementation
```

### CLAUDE.md (Important Insights)

For significant, reusable insights, add to CLAUDE.md:

```markdown
## Lessons Learned

### Auth Implementation
- Always define token lifecycle before starting
- Consider refresh tokens in initial design
```

---

## Commands

| Command | Purpose |
|---------|---------|
| `/act:reflect [topic]` | Trigger reflection on a topic or recent task |
| `/act:memorize <insight>` | Save an insight to findings or CLAUDE.md |

---

## Integration

### With Hooks

Reflexion integrates with the Stop hook:

```
[Stop Hook]
→ Verify phases complete
→ IF complex task AND time available
   → Suggest /act:reflect
```

### With Context Engineering

Reflexion outputs are stored in the 3-File Pattern:
- `findings.md` — Reflexion insights
- `progress.md` — Reflection session logged
- `state.md` — Updated with lessons learned

### With Iron Laws

Reflexion supports Verification Iron Law:
- Reflect on evidence quality
- Identify verification gaps
- Improve before claiming done

---

## Configuration

### In `.act/config.yaml`

```yaml
reflexion:
  enabled: true
  auto_trigger:
    - "reflect"
    - "review"
    - "improve"
  save_insights: true
  claude_md_threshold: "important"  # none | important | all
```

---

## Examples

### Example 1: Code Reflexion

```markdown
## /act:reflect API Implementation

### What worked well?
- Clear separation of concerns in controllers
- Comprehensive error handling
- Good test coverage (85%)

### What could be improved?
- Response times on complex queries
- Missing rate limiting documentation
- Could use caching for frequent requests

### What did I learn?
- Database connection pooling is essential at scale
- Early performance testing saves debugging time

### What would I do differently?
- Add performance tests from the start
- Document rate limits before implementation
```

### Example 2: Memorize Insight

```
/act:memorize "Always add performance tests for endpoints expected to handle >100 req/s"
```

Result in `.act/findings.md`:
```markdown
### [2026-02-02] Insight
> Always add performance tests for endpoints expected to handle >100 req/s

**Context:** API Implementation reflexion
**Category:** Testing
```

---

## Acceptance Criteria

- [x] SPEC-reflexion.md created
- [x] skills/reflexion/SKILL.md created
- [x] commands/act/reflect.md created
- [x] commands/act/memorize.md created
- [x] README.md updated
- [x] CLAUDE.md updated

---

## References

- CEK (Context Engineering Kit) research
- Planning Files pattern
- Metacognitive strategies in AI

---

*Specification for ACT v2.5 Reflexion Pattern*
