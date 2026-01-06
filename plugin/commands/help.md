---
name: help
description: Contextual help for the ACT framework and its commands
argument-hint: [topic]
---

# /help - ACT Help

You provide contextual help on the ACT framework.

## Without Argument: General Help

```
╭─────────────────────────────────────────────────────────────╮
│  📖 ACT Framework - Help                                    │
│                                                             │
│  ACT (ArtChiTech) is a project management framework         │
│  with 7 phases: Discovery → Growth.                         │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Main Commands:                                             │
│  /projet    Main hub - entry point                          │
│  /onboard   Audit and initialize a project                  │
│  /status    View complete project state                     │
│  /next      Move to the next phase                          │
│  /fix       Fix problems                                    │
│  /resume    Resume a session                                │
│  /help      This help                                       │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  For more help: /help [topic]                               │
│  Topics: phases, modes, commands, phase-[1-7]               │
╰─────────────────────────────────────────────────────────────╯
```

## /help phases

```
The 7 ACT Phases:

1. Discovery    - Validate the problem and needs
2. Strategy     - Define roadmap and business model
3. Design       - Design architecture and UX
4. Development  - Implement with TDD
5. Quality      - Test and validate
6. Launch       - Deploy and acquire users
7. Growth       - Iterate and optimize

Each phase requires a score >= 70% to move to the next one.
Use /status to see your progress.
```

## /help modes

```
The 3 ACT Modes:

COMPLETE - New project, all phases
           Used for a project from scratch.
           Goes through all 7 phases in order.

FEATURE  - New feature on existing project
           Adapted based on feature importance.
           May require all phases.

QUICK    - Bugfix or quick refactoring
           Quick execution of necessary steps.
           Always verify global impact.

The mode is automatically defined based on context.
```

## /help commands

```
ACT Commands:

/projet   Main hub - single entry point
          Detects context and proposes actions.

/onboard  Audit and initialize a project
          Analyzes the project, calculates scores,
          initializes .epct/state.json.

/status   View complete project state
          Displays phase, scores, progress.

/next     Move to the next phase
          Verifies Go/No-Go criteria.
          Creates a checkpoint before transition.

/fix      Fix problems
          Lists problems by priority.
          Guides the correction.

/resume   Resume a session
          Restores the work context.
          Can restore from a checkpoint.

/help     This help
          /help [topic] for specific help.
```

## /help phase-[N]

Displays details of the requested phase.

### /help phase-1

```
Phase 1: Discovery

Objective: Validate the problem and needs

Validation criteria (score >= 70%):
- README with documented problem (30 pts)
- Personas/users defined (25 pts)
- Documented validation (25 pts)
- Scope defined (20 pts)

Recommended skills:
- superpowers:brainstorming

Deliverables:
- README.md with "Problem" section
- Personas or user stories
- Validation/interview notes
```

### /help phase-2

```
Phase 2: Strategy

Objective: Define roadmap and business model

Validation criteria (score >= 70%):
- Roadmap defined (30 pts)
- Business model documented (25 pts)
- Competitive analysis (25 pts)
- KPIs identified (20 pts)

Recommended skills:
- superpowers:brainstorming

Deliverables:
- ROADMAP.md or docs/roadmap
- Business model canvas
- Competitor benchmark
```

### /help phase-3

```
Phase 3: Design

Objective: Design architecture and UX

Validation criteria (score >= 70%):
- Architecture documented (30 pts)
- Tech stack documented (25 pts)
- API specs (25 pts)
- UI mockups (20 pts)

Recommended skills:
- superpowers:writing-plans

Deliverables:
- docs/architecture.md
- Technical specs
- OpenAPI/GraphQL schema
```

### /help phase-4

```
Phase 4: Development

Objective: Implement with TDD

Validation criteria (score >= 70%):
- Source code present (25 pts)
- Tests written (25 pts)
- CI/CD configured (25 pts)
- Code documented (25 pts)

Recommended skills:
- superpowers:test-driven-development

Deliverables:
- Functional code
- Unit tests
- CI/CD pipeline
```

### /help phase-5

```
Phase 5: Quality

Objective: Test and validate

Validation criteria (score >= 70%):
- Coverage > 60% (30 pts)
- No critical bugs (30 pts)
- Clean linting (20 pts)
- Performance OK (20 pts)

Recommended skills:
- superpowers:code-reviewer

Deliverables:
- Coverage report
- Integration tests
- Performance benchmarks
```

### /help phase-6

```
Phase 6: Launch

Objective: Deploy and acquire users

Validation criteria (score >= 70%):
- Deployed to production (30 pts)
- Monitoring in place (25 pts)
- User documentation (25 pts)
- Launch checklist (20 pts)

Deliverables:
- Production URL
- Monitoring dashboard
- User guide
```

### /help phase-7

```
Phase 7: Growth

Objective: Iterate and optimize

Validation criteria (score >= 70%):
- Analytics configured (30 pts)
- Feedback collected (25 pts)
- Iterations done (25 pts)
- Growth metrics (20 pts)

Deliverables:
- Analytics dashboard
- Changelog
- User metrics
```

## Unknown Topic

If the requested topic does not exist:

```
❓ Unknown topic: [topic]

Available topics:
- phases    : The 7 framework phases
- modes     : The 3 usage modes
- commands  : List of commands
- phase-1 to phase-7 : Details of a phase

Example: /help phases
```
