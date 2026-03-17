# Stuck Detection

> Companion document for the Debugging Iron Law. Mechanical detection of stuck loops.

## The Problem

Agents get stuck in loops: trying the same fix repeatedly, each time expecting a different result. Without mechanical detection, the agent will continue indefinitely.

## The Rule of 3 (Mechanical)

```
Fix attempt 1 → Fails
    → Retry with enriched diagnostics

Fix attempt 2 → Fails
    → Last chance: different approach required

Fix attempt 3 → Fails
    → HARD STOP. Escalate immediately.
```

**This is NOT optional.** After 3 failed attempts at the same class of fix, the agent MUST stop.

## Detection Criteria

A "failed attempt" is counted when:
- The same file is modified for the same issue
- A test continues to fail after a fix
- The same error reappears after a fix
- A review fails on the same criteria

## What to Do at Each Stage

### Attempt 1: Standard Fix
1. Investigate root cause (Debugging Iron Law)
2. Implement fix
3. Verify → If fails, proceed to Attempt 2

### Attempt 2: Enriched Diagnostics
1. **Don't retry the same approach**
2. Add more logging/tracing
3. Check assumptions explicitly
4. Look for the REAL root cause (it's probably not where you think)
5. Implement different fix
6. Verify → If fails, proceed to Attempt 3

### Attempt 3: Last Resort
1. **Completely different approach**
2. Question your mental model of the problem
3. Consider: is the architecture wrong? (Deviation Rule 4)
4. Try the opposite of what you've been doing
5. Verify → If fails, HARD STOP

### After 3 Failures: ESCALATE

```markdown
## 🛑 Stuck Detection Triggered

**Issue:** [Description of the problem]
**Attempts:** 3 failed fixes

### What Was Tried
1. [Approach 1] → Failed because [reason]
2. [Approach 2] → Failed because [reason]
3. [Approach 3] → Failed because [reason]

### Analysis
The repeated failures suggest [root cause hypothesis].
This may be an architectural issue (Deviation Rule 4).

### Options
- **Option A:** [Alternative approach]
- **Option B:** [Architectural change]
- **Option C:** [Defer / workaround]

### Waiting for decision...
```

## Integration with Hooks

### PreToolUse Hook Check
Before each Write/Edit for a fix:
1. Check fix attempt counter for this issue
2. If counter ≥ 3 → Block the tool use, trigger escalation
3. Log the attempt

### Counter Management
- Counter is per-issue, not global
- Counter resets when:
  - The issue is resolved
  - The user provides new direction
  - A fundamentally different approach is taken
- Counter does NOT reset when:
  - Same approach with minor variation
  - Same file modified for same reason

## Integration with Review Loop

The review workflow (Phase 2.2) also uses the Rule of 3:
- 3 failed review rounds = stuck
- Same escalation process applies

## Quick Reference

```
Attempt 1 → Standard fix (investigate + fix)
Attempt 2 → Different approach (more diagnostics, different angle)
Attempt 3 → Radical change (opposite approach, question assumptions)
Attempt 4 → 🛑 STOP. Escalate. You're stuck.
```

## Red Flags

If you catch yourself thinking:
- "One more try should do it" → You're stuck
- "It's almost working" → You're stuck
- "Just need to tweak X" → You're stuck
- "I know the fix, it just needs..." → You've been wrong 3 times already

---

*Companion to Debugging Iron Law — ACT v3.5*
