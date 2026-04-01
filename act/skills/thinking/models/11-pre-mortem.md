# Pre-Mortem

> **"Our ability to imagine failure in advance is crucial to our ability to prevent it."** — Gary Klein

## What Is It?

A Pre-Mortem is a project planning technique where you imagine the project has already failed, then work backwards to identify what caused the failure. Unlike a post-mortem (after failure), a pre-mortem (before launch) lets you prevent failures rather than just analyze them.

## When to Use

- Before launching a major project
- Before making irreversible decisions
- When planning high-stakes initiatives
- When you feel overconfident (everyone agrees it'll work)
- Before major releases or deployments

## When NOT to Use

- For low-stakes, easily reversible decisions
- When speed matters more than risk mitigation
- When the project is already well-validated

---

## Process

### Step 1: Assume Failure
"It's 6 months from now. The project has failed spectacularly."

### Step 2: Brainstorm Causes
"What went wrong? Why did it fail?"

### Step 3: Prioritize Risks
Which failures are most likely? Most damaging?

### Step 4: Develop Mitigations
How do we prevent or detect each failure mode?

### Step 5: Update the Plan
Build mitigations into the project plan.

---

## Example: Product Launch

### Setup
"It's 6 months from now. Our product launch was a disaster."

### What Went Wrong?

**Brainstorm:**
- Users didn't understand the value proposition
- Onboarding was too complex, 80% dropped off
- Critical bug in payment flow caused revenue loss
- Server couldn't handle launch traffic
- Marketing spent budget on wrong channels
- Support team was overwhelmed
- Key feature was missing that competitors had
- Pricing was wrong (too high or too low)

### Prioritized Risks

| Failure Mode | Likelihood | Impact | Priority |
|--------------|------------|--------|----------|
| Onboarding drop-off | High | High | **P0** |
| Server can't handle traffic | Medium | Critical | **P0** |
| Payment bug | Medium | High | **P1** |
| Wrong marketing channels | High | Medium | **P1** |
| Value prop unclear | Medium | High | **P1** |

### Mitigations

**P0: Onboarding drop-off**
- Run usability tests before launch
- Simplify to 3 steps max
- Add progress indicator
- Create skip option for power users
- **Owner:** Product team

**P0: Server capacity**
- Load test at 3x expected traffic
- Set up auto-scaling
- Have rollback plan ready
- **Owner:** Infrastructure team

**P1: Payment bug**
- Dedicated QA for payment flow
- Test with real cards in staging
- Monitor payment success rate in real-time
- **Owner:** Engineering team

---

## Example: Architecture Migration

### Setup
"It's 1 year from now. The migration to microservices failed."

### What Went Wrong?

- Data inconsistency between services
- Latency increased 10x
- Team couldn't debug distributed system
- Migration took 2x longer than estimated
- Half the team burned out and quit
- Old system still running in parallel (cost)
- Customer-facing outages during migration

### Prioritized Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| Data inconsistency | Design distributed transactions carefully; eventual consistency patterns; extensive testing |
| Latency increase | Prototype critical paths first; set latency budgets |
| Debug complexity | Invest in observability before migration; distributed tracing |
| Timeline overrun | Build in 50% buffer; define clear phases; allow partial rollback |
| Team burnout | Realistic schedule; rotate people; celebrate milestones |
| Parallel system cost | Budget for 6 months of parallel operation |
| Customer outages | Feature flags; gradual rollout; instant rollback capability |

---

## Example: Hiring Senior Role

### Setup
"It's 1 year from now. Hiring this VP was a mistake."

### What Went Wrong?

- Cultural mismatch (not collaborative)
- Technical skills didn't transfer to our domain
- Team didn't respect them
- They couldn't adapt to startup pace
- Made decisions without buy-in
- Key existing employees quit
- They quit after 8 months

### Mitigations

| Risk | Mitigation |
|------|------------|
| Cultural mismatch | Extensive culture-fit interviews; have team meet them |
| Skills don't transfer | Work sample tests in our domain; references from similar contexts |
| Team doesn't respect | Have team involved in hiring; informal interactions |
| Can't adapt to pace | References from similar-stage companies; trial project |
| Decisions without buy-in | Clear expectations during offer; first 90 days plan |
| Key people quit | Talk to team about concerns; address before hire |
| They quit quickly | Understand their career goals; ensure mutual fit |

---

## The Psychology Behind It

### Why Pre-Mortems Work

1. **Permission to dissent:** People often see risks but don't voice them. "Assume failure" legitimizes criticism.

2. **Prospective hindsight:** Studies show imagining an event has already happened improves prediction accuracy by 30%.

3. **Reduces overconfidence:** Optimism bias makes us underestimate risks. Pre-mortems counter this.

4. **Generates specific scenarios:** Vague "what could go wrong?" → Specific "here's exactly how this fails."

### When Teams Skip Pre-Mortems

- "We don't have time" → You'll have time for the post-mortem
- "It'll work, everyone agrees" → Groupthink is exactly when you need it
- "Don't be negative" → Pre-mortems are constructively negative

---

## Template

Use this when running a Pre-Mortem:

```markdown
## Project
[Name and brief description]

## Setup
"It's [timeframe] from now. [Project] has failed completely."

## Brainstorm: What Went Wrong?
(Everyone contributes independently, then share)
1. [Failure mode 1]
2. [Failure mode 2]
3. [Failure mode 3]
...

## Prioritized Risks
| Failure Mode | Likelihood (H/M/L) | Impact (H/M/L) | Priority |
|--------------|-------------------|----------------|----------|
| [FM1] | [L] | [I] | [P#] |
| [FM2] | [L] | [I] | [P#] |

## Mitigations
### [P0 Failure Mode 1]
- Mitigation: [What will we do to prevent this?]
- Detection: [How will we know if it's happening?]
- Owner: [Who is responsible?]

### [P0 Failure Mode 2]
...

## Plan Updates
What changes to the plan based on this pre-mortem?
- [ ] [Change 1]
- [ ] [Change 2]

## Review Schedule
When will we revisit these risks?
[Date/milestone]
```

---

## Running a Pre-Mortem Meeting

### Format
- **Duration:** 45-60 minutes
- **Participants:** Key stakeholders + skeptics
- **Facilitator:** Someone neutral

### Agenda
1. **Setup (5 min):** Explain pre-mortem concept
2. **Individual brainstorm (10 min):** Everyone writes failures silently
3. **Share (15 min):** Go around, one failure each, until exhausted
4. **Prioritize (10 min):** Vote on likelihood and impact
5. **Mitigations (15 min):** Discuss top risks
6. **Assign (5 min):** Owners for each mitigation

### Key Rules
- No defending the plan during brainstorm
- All failures are valid to mention
- Focus on causes, not blame
- Be specific, not vague

---

## Common Pitfalls

1. **Too vague:** "Things went wrong" → "Database migration failed because we didn't test rollback"
2. **Not involving skeptics:** The person who has doubts is your best asset
3. **No follow-through:** Pre-mortem without mitigation is just worrying
4. **Doing it once:** Revisit as project evolves
5. **Overconfident after:** Pre-mortem doesn't eliminate risk, just reduces it

---

## Related Models

- **Inversion:** Pre-mortem is structured inversion for projects
- **Second-Order Effects:** What cascading failures could occur?
- **Probabilistic Thinking:** Assign probabilities to failure modes

---

## References

- Gary Klein (inventor of pre-mortem technique)
- "Thinking, Fast and Slow" by Daniel Kahneman
- "Performing a Project Premortem" (HBR)
