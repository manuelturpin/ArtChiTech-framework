# Specification: Iron Laws

**Version:** 1.0  
**Phase:** 3.3 - Iron Laws & Rules  
**Status:** Draft  
**Source:** Superpowers v4.1.1

---

## Overview

The Iron Laws are non-negotiable rules that prevent common AI coding agent failures. They enforce evidence-based development, root cause debugging, and mandatory verification.

## Problem Statement

AI coding agents commonly fail in three predictable ways:

1. **Writing code before tests** → Untested, fragile code that breaks silently
2. **Applying fixes without understanding** → Symptom patching that introduces new bugs
3. **Claiming completion without proof** → "Should work now" without actual verification

## Solution: Three Iron Laws

### 1. TDD Iron Law

> **NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST**

**When it applies:**
- Writing any new function, class, or module
- Adding new features
- Implementing business logic

**Core principle:** A test that passes immediately proves nothing. You must see the test fail first to know it's actually testing something.

### 2. Debugging Iron Law

> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

**When it applies:**
- Bug reports
- Test failures
- Error messages
- Unexpected behavior

**Core principle:** Quick fixes are technical debt. Understanding the root cause leads to lasting solutions.

### 3. Verification Iron Law

> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

**When it applies:**
- Before marking any task complete
- Before claiming "it works"
- Before committing/pushing code

**Core principle:** Evidence before claims. Run the actual verification command and read the output.

## Implementation Requirements

### R1: Rules File
- Create `rules/iron-laws.md` with detailed guidance
- Include when each law applies
- Provide concrete examples
- List common rationalizations to avoid

### R2: CLAUDE.md Integration
- Add Iron Laws to main instructions
- Reference the rules file
- Ensure laws are prominent

### R3: Verification Checklist
- Create `templates/verification-checklist.md`
- Provide copy-paste checklist for each law
- Include evidence format requirements

### R4: Hook Integration
- Stop hook already enforces verification
- PreToolUse should check TDD compliance
- PostToolUse should prompt for verification

## Acceptance Criteria

- [x] `rules/iron-laws.md` exists with all 3 laws detailed
- [x] Each law has:
  - [x] Clear statement
  - [x] When it applies
  - [x] How to comply
  - [x] Common rationalizations to avoid
  - [x] Concrete examples
- [x] `CLAUDE.md` references Iron Laws prominently
- [x] `templates/verification-checklist.md` provides actionable checklist
- [x] Documentation is in English

## Related Specifications

- SPEC-context-engineering.md (3-File Pattern)
- SPEC-hooks-system.md (Enforcement via hooks)

## References

- [Superpowers TDD Skill](https://github.com/obra/superpowers/blob/main/skills/test-driven-development/SKILL.md)
- [Superpowers Debugging Skill](https://github.com/obra/superpowers/blob/main/skills/systematic-debugging/SKILL.md)
- [Superpowers Verification Skill](https://github.com/obra/superpowers/blob/main/skills/verification-before-completion/SKILL.md)

---

*Specification created for ACT v2.5*
