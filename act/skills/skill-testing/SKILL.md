---
name: skill-testing
description: TDD for skills — test skill behavior before deployment with structured scenarios
---

# Skill: Skill Testing (TDD for Skills)

**Version:** 1.0.0
**Category:** Meta / Quality
**Type:** Rigid

> **Self-Announcement:** When using this skill, announce: "Using Skill Testing methodology to validate skill effectiveness through RED-GREEN-REFACTOR."

## Purpose

Apply TDD principles to skill development itself. If you haven't seen an agent fail without a skill, you don't know if the skill prevents the right failures.

## The Key Insight

> "A skill that was written without observing failure is like a test written after the code — it proves nothing."

Skills should be written to address **observed** agent failures, not **hypothetical** ones. The RED-GREEN-REFACTOR cycle ensures skills target real problems.

## The RED-GREEN-REFACTOR Cycle for Skills

### RED: Observe Failure Without the Skill

1. Give the agent a task that the skill should help with
2. Do NOT provide the skill
3. Document exactly how the agent fails:
   - What mistakes does it make?
   - What does it forget?
   - What rationalizations does it use?
   - At what point does it go wrong?

**Output:** A failure catalog

```markdown
## Failure Catalog: [Skill Name]

### Observed Failures
1. **Failure:** Agent wrote code before tests
   - **Frequency:** 4/5 attempts
   - **Rationalization used:** "Let me write a quick prototype first"
   - **Impact:** Tests were designed to pass, not to verify

2. **Failure:** Agent claimed completion without evidence
   - **Frequency:** 3/5 attempts
   - **Rationalization used:** "This should work now"
   - **Impact:** Broken code shipped
```

### GREEN: Write the Skill to Address Observed Failures

1. For EACH observed failure, write a countermeasure:
   - A clear rule that prevents the failure
   - A rationalization table entry that addresses the agent's excuse
   - A red flag that helps the agent catch itself

2. Test the skill:
   - Give the agent the same task WITH the skill
   - Verify that the failures are prevented
   - If failures still occur, the skill is insufficient

### REFACTOR: Iterate on the Skill

1. Look for new rationalizations the agent uses to bypass the skill
2. Add counters for each new rationalization
3. Simplify the skill — remove rules that aren't needed
4. Test again with a fresh agent (no memory of previous attempts)

## When to Use

| Situation | Use Skill Testing? |
|-----------|-------------------|
| Writing a new skill | Always |
| Skill seems ineffective | Re-test with RED phase |
| Agent repeatedly ignores a skill | The skill may need stronger language |
| Updating an existing skill | Verify the update helps |
| Simple documentation skill | Overkill |

## Methodology

### Step 1: Define the Scenario

Choose a realistic task that the skill should improve:
- It should be complex enough to expose failures
- It should be repeatable (same task, different agent sessions)
- It should have clear success/failure criteria

### Step 2: Baseline Test (RED)

Run the agent WITHOUT the skill 3-5 times:
- Document failures
- Look for patterns
- Note rationalizations

### Step 3: Write the Skill (GREEN)

Address each observed failure:
- One rule per failure
- One rationalization counter per excuse
- Keep it concise (under 500 lines)

### Step 4: Validation Test (GREEN verify)

Run the agent WITH the skill 3-5 times:
- Do the same failures occur?
- Are there new failures?
- Is the agent's behavior improved?

### Step 5: Refinement (REFACTOR)

Based on validation:
- Remove ineffective rules
- Add counters for new rationalizations
- Simplify language for clarity
- Re-test

## Skill Quality Metrics

| Metric | Good | Bad |
|--------|------|-----|
| **Failure prevention rate** | > 80% of observed failures prevented | < 50% |
| **New failure introduction** | < 10% new failures introduced | > 20% |
| **Agent compliance** | Agent follows > 90% of rules | < 70% |
| **Rationalization coverage** | All observed excuses have counters | Major gaps |

## Common Mistakes

### Writing Skills from Theory
**Problem:** "Agents should do X" without evidence they don't.
**Fix:** Observe the failure first. Then write the rule.

### Too Many Rules
**Problem:** 50-rule skill that agents can't follow.
**Fix:** Each rule must address a specific observed failure. If no failure, no rule.

### Weak Language
**Problem:** "Consider doing X" — agents will "consider" and then skip.
**Fix:** Use imperative language: "You MUST do X. If you skip X, [consequence]."

### No Rationalization Counters
**Problem:** Agent finds creative excuses to bypass rules.
**Fix:** Test with agent, collect excuses, add counters for each.

### Never Re-Testing
**Problem:** Skill written once, never validated again.
**Fix:** Re-test periodically, especially after skill modifications.

## Integration with ACT

### With Auditor Skill
The auditor checks skill structure, but Skill Testing checks skill **effectiveness**:
- Auditor: "Does the file have required sections?" (structural)
- Skill Testing: "Does the skill actually prevent failures?" (behavioral)

### With Continuous Learning
Observations from `.act/observations.jsonl` can inform skill testing:
- Frequent `correction` observations → skill may need strengthening
- Frequent `error` observations → skill may be ineffective

### With Iron Laws
The Iron Laws were developed using implicit skill testing:
- Observed agents writing code before tests → TDD Iron Law
- Observed agents fixing without understanding → Debugging Iron Law
- Observed agents claiming "done" without proof → Verification Iron Law

## Template: Skill Test Plan

```markdown
# Skill Test Plan: [Skill Name]

## Scenario
[Description of the task to test with]

## Success Criteria
[What good behavior looks like]

## Baseline Results (RED)
| Run | Failures Observed | Rationalizations Used |
|-----|------------------|----------------------|
| 1 | [list] | [list] |
| 2 | [list] | [list] |
| 3 | [list] | [list] |

## Skill Written (GREEN)
[Link to skill]
[Rules added to address each failure]

## Validation Results
| Run | Failures Observed | Previously Seen? | New? |
|-----|------------------|-----------------|------|
| 1 | [list] | [yes/no] | [yes/no] |
| 2 | [list] | [yes/no] | [yes/no] |
| 3 | [list] | [yes/no] | [yes/no] |

## Metrics
- Failure prevention rate: X%
- New failure rate: X%
- Compliance rate: X%
```

---

*Skill version: 1.0 — ACT v3.5*
