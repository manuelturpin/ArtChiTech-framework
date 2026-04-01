# Skill: Writing Plans

> **"A plan is a map. Without it, you're wandering."**

## Purpose

Create structured, actionable plans before starting work. Good plans prevent wasted effort, communicate intent, and enable progress tracking.

---

## When to Use

### Always Write a Plan For

| Situation | Why |
|-----------|-----|
| New projects | Establish direction |
| Multi-step tasks | Track progress |
| Complex features | Prevent scope creep |
| Team work | Align understanding |
| Risky changes | Think before acting |

### Can Skip Planning When

| Situation | Why |
|-----------|-----|
| Trivial fixes | Overhead > benefit |
| Pure exploration | Discovery mode |
| Time-critical hotfix | Action > planning |
| Well-known patterns | Mental model suffices |

---

## The Plan Structure

Every good plan answers these questions:

```
┌─────────────────────────────────────────────────┐
│                                                 │
│   WHAT?   → Goal and deliverables              │
│   WHY?    → Motivation and success criteria    │
│   HOW?    → Approach and phases                │
│   WHEN?   → Timeline and milestones            │
│   RISKS?  → What could go wrong               │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## Plan Template

```markdown
# Plan: [Project/Task Name]

## Goal
[One clear sentence describing the end state]

## Why
- [Motivation 1]
- [Motivation 2]

## Success Criteria
- [ ] [Measurable criterion 1]
- [ ] [Measurable criterion 2]
- [ ] [Measurable criterion 3]

## Scope
### In Scope
- [What IS included]

### Out of Scope
- [What is NOT included]

## Approach
[Brief description of the strategy]

## Phases

### Phase 1: [Name]
- [ ] Task 1.1
- [ ] Task 1.2
- [ ] Task 1.3
**Deliverable:** [What this phase produces]

### Phase 2: [Name]
- [ ] Task 2.1
- [ ] Task 2.2
**Deliverable:** [What this phase produces]

### Phase 3: [Name]
- [ ] Task 3.1
- [ ] Task 3.2
**Deliverable:** [What this phase produces]

## Timeline
| Phase | Estimated Duration |
|-------|-------------------|
| Phase 1 | [X hours/days] |
| Phase 2 | [X hours/days] |
| Phase 3 | [X hours/days] |
| **Total** | **[X hours/days]** |

## Risks
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | [H/M/L] | [H/M/L] | [Strategy] |
| [Risk 2] | [H/M/L] | [H/M/L] | [Strategy] |

## Dependencies
- [External dependency 1]
- [External dependency 2]

## Open Questions
- [ ] [Question that needs answering]
- [ ] [Another unknown]
```

---

## Quick Plan Template

For smaller tasks:

```markdown
# Quick Plan: [Task Name]

**Goal:** [One sentence]

**Steps:**
1. [ ] [Step 1]
2. [ ] [Step 2]
3. [ ] [Step 3]

**Done when:** [Success criterion]

**Time estimate:** [X hours]
```

---

## Planning Principles

### 1. Be Specific

```markdown
# Bad ❌
- Work on authentication

# Good ✅
- Implement JWT token generation
- Add token validation middleware
- Create refresh token endpoint
```

### 2. Make It Measurable

```markdown
# Bad ❌
- Make it faster

# Good ✅
- Reduce API response time from 800ms to <200ms
```

### 3. Define "Done"

```markdown
# Bad ❌
- Finish the feature

# Good ✅
- Feature works end-to-end
- All tests pass
- Documentation updated
- Code reviewed and merged
```

### 4. Identify Dependencies

```markdown
## Dependencies

### Blockers (Must have before starting)
- API spec finalized
- Test environment available

### Can proceed in parallel
- UI mockups
- Database migrations
```

### 5. Include Escape Hatches

```markdown
## Decision Points

After Phase 1, evaluate:
- If performance < target: Consider different algorithm
- If complexity too high: Reduce scope to MVP
```

---

## Phase Planning

### How to Break Down Phases

Use natural boundaries:

| Boundary Type | Example |
|---------------|---------|
| Deliverables | "Phase 1: API, Phase 2: UI" |
| User journeys | "Phase 1: Signup, Phase 2: Login" |
| Risk reduction | "Phase 1: Spike, Phase 2: Build" |
| Dependencies | "Phase 1: Foundation, Phase 2: Features" |

### Phase Size Guidelines

| Phase Length | Number of Tasks | Complexity |
|--------------|-----------------|------------|
| Small | 3-5 tasks | 1-2 hours |
| Medium | 5-10 tasks | 1-2 days |
| Large | 10-20 tasks | 1 week |

If a phase has more than 20 tasks, break it into smaller phases.

---

## Risk Planning

### Risk Categories

| Category | Examples |
|----------|----------|
| Technical | Unfamiliar technology, integration complexity |
| Scope | Feature creep, unclear requirements |
| Resource | Time constraints, team availability |
| External | Third-party APIs, regulatory changes |

### Risk Matrix

```
           │ Low Impact │ Med Impact │ High Impact │
───────────┼────────────┼────────────┼─────────────┤
High Prob  │  Monitor   │   Mitigate │   Prevent   │
Med Prob   │  Accept    │   Monitor  │   Mitigate  │
Low Prob   │  Accept    │   Accept   │   Monitor   │
```

### Mitigation Strategies

| Strategy | When to Use |
|----------|-------------|
| Prevent | High impact, can be avoided |
| Mitigate | Can't prevent, but can reduce |
| Monitor | Low probability, have a backup |
| Accept | Low impact, not worth the effort |

---

## Living Documents

### Plans Should Evolve

```markdown
## Plan Updates

### [Date] - Initial plan created
### [Date] - Added Phase 4 based on discovery
### [Date] - Reduced scope: removed feature X
### [Date] - Timeline extended: dependency delay
```

### When to Update the Plan

- New information discovered
- Scope changes
- Timeline impacts
- Risks materialize
- Tasks complete

---

## Commands

| Command | Description |
|---------|-------------|
| `/plan [project]` | Create a full plan |
| `/plan:quick [task]` | Quick plan template |
| `/plan:review` | Review existing plan |
| `/plan:update` | Update plan with progress |

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| Brainstorming | Use before planning to explore options |
| Context Engineering | Store plan in `.act/plan.md` |
| Verification | Plan verification steps upfront |
| Reflexion | Reflect on plan quality after completion |

---

## Common Planning Mistakes

### ❌ No Plan at All
"I'll figure it out as I go" → Scope creep, rework, confusion

### ❌ Plan Too Detailed
Planning every minute detail → Paralysis, inflexibility

### ❌ Plan Never Updated
Set it and forget it → Plan diverges from reality

### ❌ Plan Without Tasks
High-level vision only → No actionable next steps

### ❌ Plan Without Success Criteria
"Make it better" → Never know when you're done

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
