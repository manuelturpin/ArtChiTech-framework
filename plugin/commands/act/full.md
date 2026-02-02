# /act:full

Start a full project with all 7 ACT phases.

---

## Usage

```
/act:full <project description>
```

## Examples

```
/act:full Build user authentication system
/act:full Migrate database to PostgreSQL
/act:full Redesign the checkout flow
/act:full Implement payment processing
```

---

## When to Use

Full Mode is for projects where ANY apply:

- [ ] Involves unknowns (needs research)
- [ ] Multiple approaches possible
- [ ] Scope > 1 day
- [ ] Architectural decisions required
- [ ] High risk (security, data, hard to undo)

**If NONE apply → Consider `/act:quick` instead**

---

## What Happens

### All 7 Phases

```
┌─────────────┬─────────────┬─────────────┐
│  DISCOVERY  │  STRATEGY   │   DESIGN    │
│   1-2 days  │    1 day    │   2-3 days  │
│  Validate   │   Roadmap   │ Architecture│
│  the problem│  & milestones│   & UX     │
└──────┬──────┴──────┬──────┴──────┬──────┘
       │             │             │
       ▼             ▼             ▼
┌─────────────┬─────────────┬─────────────┐
│ DEVELOPMENT │   QUALITY   │   LAUNCH    │
│  Variable   │   1-2 days  │    1 day    │
│   TDD &     │   Test &    │  Deploy &   │
│  Build      │  Validate   │   Ship      │
└──────┬──────┴──────┬──────┴──────┬──────┘
       │             │             │
       ▼             ▼             ▼
              ┌─────────────┐
              │   GROWTH    │
              │   Ongoing   │
              │  Iterate &  │
              │  Improve    │
              └─────────────┘
```

---

## Phase Details

### Phase 1: Discovery (1-2 days)

**Goal:** Validate the problem is worth solving

**Activities:**
- Research existing solutions
- Document requirements
- Identify constraints
- Validate assumptions

**Deliverables:**
```markdown
## Discovery Complete

### Problem Statement
[What problem are we solving?]

### Research Findings
[What did we learn?]

### Constraints
[What limits us?]

### Go/No-Go
- [ ] Problem validated
- [ ] Solution space understood
- [ ] Stakeholder buy-in
```

### Phase 2: Strategy (1 day)

**Goal:** Define the roadmap

**Activities:**
- Choose approach
- Define milestones
- Set success metrics
- Identify risks

**Deliverables:**
```markdown
## Strategy Complete

### Chosen Approach
[Why this approach?]

### Milestones
1. [Milestone 1] - [date]
2. [Milestone 2] - [date]
3. [Milestone 3] - [date]

### Success Metrics
- [Metric 1]
- [Metric 2]

### Risks
| Risk | Mitigation |
|------|------------|
| ... | ... |
```

### Phase 3: Design (2-3 days)

**Goal:** Architecture and specifications

**Activities:**
- System architecture
- API design
- Data models
- UX flows (if applicable)

**Deliverables:**
```markdown
## Design Complete

### Architecture
[Diagrams, components, data flow]

### API Specification
[Endpoints, contracts]

### Data Models
[Schema, relationships]

### Technical Decisions
| Decision | Rationale |
|----------|-----------|
| ... | ... |
```

### Phase 4: Development (Variable)

**Goal:** Build with TDD

**Activities:**
- Test-first development
- Iterative implementation
- Code reviews
- Continuous integration

**Rules:**
- TDD Iron Law applies
- Verification before each commit
- Progress logged daily

### Phase 5: Quality (1-2 days)

**Goal:** Comprehensive testing

**Activities:**
- Integration testing
- Performance testing
- Security review
- Edge case coverage

**Deliverables:**
```markdown
## Quality Complete

### Test Coverage
- Unit: [X]%
- Integration: [X]%
- E2E: [X]%

### Performance
[Benchmarks]

### Security Review
[Findings and remediations]
```

### Phase 6: Launch (1 day)

**Goal:** Ship to production

**Activities:**
- Deployment
- Documentation
- Announcement
- Monitoring setup

**Deliverables:**
```markdown
## Launch Complete

### Deployment
- [x] Production deployed
- [x] Rollback plan ready

### Documentation
- [x] User docs
- [x] API docs
- [x] Runbook

### Monitoring
- [x] Alerts configured
- [x] Dashboards ready
```

### Phase 7: Growth (Ongoing)

**Goal:** Iterate and improve

**Activities:**
- Monitor metrics
- Gather feedback
- Plan iterations
- Continuous improvement

---

## Phase Gates

Each phase ends with a Go/No-Go decision:

```markdown
## Phase [N] → Phase [N+1]

### Checklist
- [ ] All deliverables complete
- [ ] Quality criteria met
- [ ] No blocking issues
- [ ] Resources available

**Decision:** GO / NO-GO

**If NO-GO:**
- Reason: [why]
- Action: [what needs to happen]
```

---

## Context Files

Full Mode uses all context files:

```
.act/
├── config.yaml      # Project configuration
├── state.md         # Current state (phase, task, blockers)
├── plan.md          # All 7 phases with milestones
├── findings.md      # Research and discoveries
└── progress.md      # Full session log
```

---

## Iron Laws

Full Mode enforces all Iron Laws:

| Law | Enforcement |
|-----|-------------|
| **TDD** | No production code without failing test |
| **Debugging** | Root cause before fix |
| **Verification** | Evidence before claims |

---

## Deviation Handling

| Deviation | Action |
|-----------|--------|
| Bug found | Auto-fix (Rule 1) |
| Missing critical | Auto-add (Rule 2) |
| Blocker | Auto-fix (Rule 3) |
| **Architectural** | **STOP, ask user** |
| Enhancement | Log to backlog (Rule 5) |

### Architectural Decisions

In Full Mode, architectural deviations **stop and ask**:

```markdown
⚠️ ARCHITECTURAL DECISION REQUIRED

**Context:** [what we're doing]
**Decision:** [what needs to be decided]

**Options:**
1. [Option A] - [pros/cons]
2. [Option B] - [pros/cons]
3. [Option C] - [pros/cons]

**Recommendation:** [my suggestion]

Please choose (1/2/3) or provide guidance:
```

---

## Output

After `/act:full`, you'll see:

```markdown
## 🚀 Full Mode Initialized

**Project:** [your project]
**Estimated Duration:** [estimate]

### Phase 1: Discovery

**Goal:** Validate the problem

**First Steps:**
1. [Research task]
2. [Validation task]
3. [Documentation task]

### Ready to Begin
Type "go" or provide additional context.
```

---

## De-escalation

If Discovery/Strategy reveals the project is simpler than expected:

```markdown
## 💡 Scope Assessment

After research, this project appears smaller than anticipated.

**Original Estimate:** 2 weeks
**Revised Estimate:** 2 days

**Recommendation:** De-escalate to Quick Mode

Switch to Quick Mode? (yes/no)
```

---

## Tips

1. **Don't rush Discovery** — Time spent here saves 10x later
2. **Document decisions** — Future you will thank present you
3. **Respect phase gates** — They exist for a reason
4. **Use findings.md** — Capture everything you learn
5. **Iterate in Growth** — Shipping is not the end

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:quick` | Quick mode for small tasks |
| `/act:status` | Check current state |
| `/act:phase` | Move to next phase |
| `/act:handoff` | Generate handoff document |

---

*Full mode: Do it right the first time.*
