# Stop Hook

**Type:** Completion-guard hook
**Triggers:** Completion claims (`complete`, `done`, `finished`, `stop`)
**Reliability:** 100%

---

## Purpose

Prevent premature completion claims by verifying all phases have evidence before allowing the agent to stop. This implements the Iron Law:

> **"No completion claims without fresh verification evidence."**

## When It Fires

The Stop hook fires when the agent attempts to:
- Claim task completion ("Task complete!", "All done!")
- End the session ("I'm finished", "That's it")
- Stop work ("Stopping here", "Done for now")

Trigger keywords: `complete`, `done`, `finished`, `stop`, `task complete`

## Actions Performed

### 1. Read the Plan
```
Parse .act/plan.md to identify:
- All defined phases
- Success criteria for each phase
- Expected deliverables
```

### 2. Verify Each Phase
```
For each phase, check:
- Is there evidence of completion?
- Are success criteria met?
- Are deliverables present?
```

### 3. Evidence Check
```
Evidence types accepted:
- Git commits (code changes)
- Test results (passing tests)
- Documentation (docs updated)
- Review notes (code reviewed)
```

### 4. Allow or Block
```
If all phases verified:
  ✅ Allow completion
If phases incomplete:
  ⚠️ Block and list remaining work
```

---

## Implementation

### Hook Message
```
⚠️ Before claiming completion: Read .act/plan.md and verify ALL phases have 
   completion evidence. No completion claims without verification.
```

### Checklist for Agent
```markdown
Before claiming complete:
- [ ] Read .act/plan.md
- [ ] List all phases
- [ ] For each phase:
  - [ ] Check for evidence (commits, tests, docs)
  - [ ] Verify success criteria met
- [ ] If all verified → proceed
- [ ] If not → continue work
```

---

## Verification Matrix

| Phase | Evidence Required | Where to Find |
|-------|-------------------|---------------|
| Research | findings.md entries | `.act/findings.md` |
| Design | Design docs/diagrams | `docs/`, commits |
| Implementation | Code commits | `git log` |
| Testing | Test results | Test output, CI |
| Documentation | Doc updates | `README.md`, `docs/` |
| Review | Review notes | `.act/progress.md` |

---

## Examples

### Example 1: All Phases Complete

```
Agent: "All tasks done! Ready to merge."

[Stop Hook Fires]
→ Reading .act/plan.md...
→ Phases found: 4

→ Phase 1: Research
  ✓ findings.md has 12 entries
  ✓ Evidence: Commit a1b2c3d

→ Phase 2: Design  
  ✓ docs/architecture.md exists
  ✓ Evidence: Commit d4e5f6g

→ Phase 3: Implementation
  ✓ src/ has 8 new files
  ✓ Evidence: Commits h7i8j9k..l1m2n3o

→ Phase 4: Testing
  ✓ 24/24 tests passing
  ✓ Evidence: CI run #42

→ ✅ ALL PHASES VERIFIED
→ Completion allowed
```

### Example 2: Phase Incomplete

```
Agent: "Task complete!"

[Stop Hook Fires]
→ Reading .act/plan.md...
→ Phases found: 4

→ Phase 1: Research ✓
→ Phase 2: Design ✓
→ Phase 3: Implementation ✓
→ Phase 4: Testing ⚠️
  ✗ No test evidence found
  ✗ tests/ directory empty
  ✗ No CI results

→ ⛔ COMPLETION BLOCKED
→ Reason: Phase 4 (Testing) has no evidence
→ Action: Write tests and run them
```

### Example 3: Partial Evidence

```
Agent: "Done with the feature."

[Stop Hook Fires]
→ Reading .act/plan.md...
→ Checking phases...

→ Phase 3: Implementation
  ✓ Code committed
  ⚠️ Success criteria: "All endpoints working"
  ✗ No evidence of endpoint testing

→ ⛔ COMPLETION BLOCKED
→ Reason: Success criteria not verified
→ Action: Test all endpoints and document results
```

---

## Integration with .act/ Files

### Files Read
- `.act/plan.md` - Phases and success criteria
- `.act/progress.md` - Work done and evidence
- `.act/findings.md` - Research evidence

### Files Written
- None (verification only)

---

## Configuration

In `hooks.json`:
```json
"Stop": {
  "enabled": true,
  "triggers": ["complete", "done", "finished", "stop", "task complete"],
  "config": {
    "planFile": ".act/plan.md",
    "progressFile": ".act/progress.md",
    "requireEvidence": true,
    "evidenceTypes": ["commit", "test", "documentation", "review"]
  }
}
```

---

## Strictness Levels

### Strict Mode (recommended)
- All phases must have explicit evidence
- Success criteria must be verified
- Blocks on any missing evidence

### Relaxed Mode
- Phases can be marked complete manually
- Trust agent's judgment
- Warns but doesn't block

Configure in `hooks.json`:
```json
"global": {
  "strictMode": true  // or false for relaxed
}
```

---

## Why This Matters

From research on agent failure modes:
1. Agents often claim completion prematurely
2. "It should work" is not evidence
3. Context loss causes incomplete work
4. No verification = no confidence

The Stop hook ensures quality by making verification mandatory, not optional.

---

## Iron Law Enforcement

This hook directly enforces:

> **Verification Iron Law:**
> "No completion claims without fresh verification evidence."

Fresh = from this session, not assumed from previous work.

---

*Stop Hook - ACT v2.5*
