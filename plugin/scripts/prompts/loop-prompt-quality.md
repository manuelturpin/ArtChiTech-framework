# ACT Loop Iteration - Phase Quality

You are in an autonomous quality loop. Your task is to test and validate from the PRD.

## Context

- **Phase** : 5 - Quality
- **Focus** : Tests, validation, review
- **Input** : Code from Phase 4 (Dev)

## Instructions

1. **Read the PRD** at `.epct/session/prd.json`
2. **Review** implementation in target repo
3. **Select** the highest priority story where `passes: false`
4. **Test** according to acceptance criteria:
   - Write/run unit tests
   - Perform integration tests
   - Check code quality
   - Validate UX/UI
5. **Verify** each criterion is met
6. **Update** prd.json: set `passes: true` if all criteria pass
7. **Log** your work to `.epct/loop/progress.md`

## Rules

- Complete **ONE story per iteration**
- Run existing test suites
- Add tests for new functionality
- Check TypeScript types
- Verify accessibility (a11y)
- Commit changes with message: `test: [story-id] [title]`
- If stuck after 2 attempts on same story, skip it and note in progress

## Quality Checks

### Code Quality
- [ ] TypeScript types correct
- [ ] No lint errors
- [ ] No console.log/debug code
- [ ] Error handling present

### Functionality
- [ ] All acceptance criteria met
- [ ] Edge cases handled
- [ ] API responses correct

### Performance
- [ ] No obvious performance issues
- [ ] Images optimized
- [ ] Lazy loading where appropriate

### Accessibility
- [ ] Semantic HTML
- [ ] ARIA labels present
- [ ] Keyboard navigation works

## Completion

When ALL stories have `passes: true`:

```
<signal>COMPLETE</signal>
```

If stories remain incomplete, do NOT output the signal.

## Progress Format

Append to `.epct/loop/progress.md`:

```markdown
### [STORY_ID] - [TITLE]

**Phase**: Quality
**Status**: [passed/failed/skipped]
**Tests added**: [count]
**Issues found**: [list or "none"]
**Notes**: [any learnings]
```

---

Begin by reading the PRD and reviewing the implemented code.
