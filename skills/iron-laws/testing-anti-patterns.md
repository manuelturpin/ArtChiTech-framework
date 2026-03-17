# Testing Anti-Patterns

> Companion document for the TDD Iron Law. Recognize these patterns to avoid them.

## Anti-Pattern 1: The Retroactive Test
**What it looks like:** Writing production code first, then adding tests after.
**Why it's dangerous:** Tests designed to pass prove nothing. You're testing your implementation, not behavior.
**How to fix:** Delete the code. Write the test. Watch it fail. Only then write the code.

## Anti-Pattern 2: The Giant Test
**What it looks like:** One test that validates 15 different behaviors at once.
**Why it's dangerous:** When it fails, you don't know which behavior broke. When it passes, you have false confidence.
**How to fix:** One test = one behavior. Split into focused test cases.

## Anti-Pattern 3: The Implementation Mirror
**What it looks like:** Test that duplicates production code logic (`expect(sum(1,2)).toBe(1+2)`).
**Why it's dangerous:** If the implementation has a bug, the test has the same bug.
**How to fix:** Use hardcoded expected values. Test behavior, not algorithm.

## Anti-Pattern 4: The Untestable Design
**What it looks like:** "I can't test this because it depends on X, Y, Z."
**Why it's dangerous:** Untestable code is always poorly designed code.
**How to fix:** Extract dependencies. Inject them. If you can't test it simply, refactor the design.

## Anti-Pattern 5: The Flaky Test
**What it looks like:** Test that sometimes passes, sometimes fails, with no code changes.
**Why it's dangerous:** Erodes trust in the entire test suite. Team starts ignoring failures.
**How to fix:** Eliminate non-determinism: mock time, fix race conditions, control randomness. A flaky test is worse than no test.

---

## Quick Reference

| Anti-Pattern | Red Flag Phrase | Fix |
|-------------|----------------|-----|
| Retroactive Test | "I'll add tests after" | Delete code, test first |
| Giant Test | "This one test covers everything" | Split by behavior |
| Implementation Mirror | "Test follows the same logic" | Hardcode expected values |
| Untestable Design | "It's too coupled to test" | Refactor design |
| Flaky Test | "Just rerun it" | Fix non-determinism |

*Companion to TDD Iron Law — ACT v3.5*
