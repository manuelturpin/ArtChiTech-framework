# Ralph Integration Roadmap - ACT Framework

> **Feature**: Intelligent Research Agent with Token Budget Optimization
> **Priority**: High
> **Origin**: Multi-Agent Research Session (Jan 10, 2026)

---

## Context

During the Pocket Watch AI research session, we observed:
- **72% token consumption** in 14 minutes (11 parallel agents)
- **Excellent research quality** (8.0/10 score)
- **Need for budget optimization** to maximize value from Pro Max quota

This document outlines the integration of "Ralph" (Research Agent) into the ACT Framework with guardrails for cost management.

---

## The Problem

```
CURRENT STATE
─────────────────────────────────────────────
│ Heavy Research Task Detected              │
│                                           │
│ User launches → Immediate execution       │
│                                           │
│ Risk: 72% quota consumed in 14 min        │
│ Result: 3-hour wait for quota reset       │
└───────────────────────────────────────────┘
```

Users may not realize the cost of parallel research until quota is depleted.

---

## Proposed Solution: Ralph Module

### Core Concept

```
PROPOSED STATE
─────────────────────────────────────────────
│ Heavy Research Task Detected              │
├───────────────────────────────────────────┤
│                                           │
│ 1. DETECT    → Estimate token cost        │
│ 2. ANALYZE   → Check remaining quota      │
│ 3. RECOMMEND → Suggest optimal timing     │
│ 4. SCHEDULE  → Queue for off-peak hours   │
│ 5. EXECUTE   → Run when budget allows     │
│ 6. REPORT    → Results ready next session │
│                                           │
└───────────────────────────────────────────┘
```

### Feature: Token Budget Optimizer

```
┌─────────────────────────────────────────────────────────┐
│           TOKEN BUDGET OPTIMIZATION SYSTEM               │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  PHASE 1: DETECTION                                      │
│  ─────────────────────────────────────────               │
│  - Identify heavy research tasks before launch           │
│  - Estimate token consumption based on:                  │
│    • Number of agents needed                             │
│    • Research depth (superficial vs deep)                │
│    • Expected output size                                │
│  - Threshold: >20% quota = "heavy task"                  │
│                                                          │
│  PHASE 2: ANALYSIS                                       │
│  ─────────────────────────────────────────               │
│  - Check current quota usage (% used today)              │
│  - Check weekly quota trend                              │
│  - Calculate optimal timing                              │
│  - Factor in user's schedule (e.g., sleep hours)         │
│                                                          │
│  PHASE 3: RECOMMENDATION                                 │
│  ─────────────────────────────────────────               │
│  Options presented to user:                              │
│  A) Execute now (cost: X% quota)                         │
│  B) Schedule for tonight (burn remaining quota)          │
│  C) Split into batches over multiple sessions            │
│  D) Reduce scope (fewer agents, shallower search)        │
│                                                          │
│  PHASE 4: SCHEDULING                                     │
│  ─────────────────────────────────────────               │
│  - Queue task for execution                              │
│  - Define execution window (e.g., 22:00-06:00)           │
│  - Set up notification when complete                     │
│                                                          │
│  PHASE 5: EXECUTION                                      │
│  ─────────────────────────────────────────               │
│  - Run agents within budget constraints                  │
│  - Checkpoint progress every N tokens                    │
│  - Save intermediate results                             │
│                                                          │
│  PHASE 6: REPORTING                                      │
│  ─────────────────────────────────────────               │
│  - Compile results into accessible format                │
│  - Notify user (email, notification)                     │
│  - Generate handoff for next session                     │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

---

## Implementation Phases

### Phase A: Cost Estimation (Quick Win)

**Goal**: Warn users before heavy tasks

```python
def estimate_research_cost(task_config):
    """
    Estimate token cost before execution

    Returns:
    - estimated_tokens: int
    - estimated_quota_percent: float
    - recommendation: str
    """
    agents = task_config.get('agents', 1)
    depth = task_config.get('depth', 'standard')  # shallow/standard/deep

    base_cost = 50000  # tokens per agent
    depth_multiplier = {'shallow': 0.5, 'standard': 1.0, 'deep': 2.0}

    estimated = agents * base_cost * depth_multiplier[depth]

    return {
        'estimated_tokens': estimated,
        'estimated_quota_percent': estimated / DAILY_QUOTA * 100,
        'recommendation': get_recommendation(estimated)
    }
```

### Phase B: Scheduling System

**Goal**: Queue heavy tasks for optimal timing

Components needed:
1. Task queue (persistent storage)
2. Scheduler (cron or daemon)
3. Execution engine
4. Notification system

### Phase C: Full Ralph Integration

**Goal**: Intelligent research agent as ACT module

Features:
- Autonomous research execution
- Multi-session continuity
- Budget-aware optimization
- Quality vs. cost tradeoffs

---

## Guardrails Required

### Token Limits

| Guardrail | Limit | Rationale |
|-----------|:-----:|-----------|
| Max agents parallel | 4 | Observed 72% with 11 |
| Max tokens per agent | 50,000 | Control individual cost |
| Max total per session | 40% quota | Leave buffer for other work |
| Warning threshold | 20% quota | Prompt user for confirmation |

### Quality vs. Cost Tradeoffs

| Mode | Agents | Depth | Est. Cost | Quality |
|------|:------:|:-----:|:---------:|:-------:|
| **Economy** | 3 | shallow | 10% quota | 6/10 |
| **Standard** | 5 | standard | 25% quota | 7.5/10 |
| **Thorough** | 8 | deep | 50% quota | 8.5/10 |
| **Exhaustive** | 11+ | deep | 70%+ quota | 9/10 |

### Safety Features

1. **Hard stop at 80% quota** - Never consume more than 80% in a single task
2. **Checkpoint every 10 agents** - Save progress, allow resumption
3. **User confirmation required** for >30% quota tasks
4. **Automatic batching** - Split large tasks across sessions

---

## User Experience

### Scenario: User requests heavy research

```
USER: Launch deep research on [topic] with 10 aspects

RALPH: 📊 Research Cost Analysis
       ─────────────────────────────
       Estimated cost: ~65% of daily quota
       Current quota used: 15%

       Options:
       A) Execute now (will use 65% quota)
       B) Schedule for tonight (results by morning)
       C) Split into 3 sessions (22% each)
       D) Reduce to 5 aspects (33% quota)

       Recommended: B (maximize quota efficiency)

       Your choice? [A/B/C/D]
```

### Scenario: End of day with remaining quota

```
RALPH: 🌙 End of Day Optimization
       ─────────────────────────────
       Remaining quota: 45%
       Queued research: 2 tasks

       Suggested: Run queued research overnight
       Results will be ready tomorrow morning.

       Approve overnight execution? [Y/N]
```

---

## Technical Requirements

### For Phase A (Estimation)

- [ ] Token counting utility
- [ ] Cost estimation model
- [ ] Warning UI component

### For Phase B (Scheduling)

- [ ] Persistent task queue (SQLite or JSON)
- [ ] Background scheduler (cron job or daemon)
- [ ] Session handoff system
- [ ] Notification mechanism

### For Phase C (Full Ralph)

- [ ] Autonomous agent orchestration
- [ ] Multi-session state management
- [ ] Quality assessment module
- [ ] Budget optimization algorithm

---

## Next Steps

### Immediate (This Week)

1. Create estimation utility (Phase A)
2. Add warning prompts for heavy tasks
3. Document current token patterns

### Short-term (This Month)

1. Design scheduling system architecture
2. Prototype task queue
3. Test overnight execution flow

### Medium-term (Next Quarter)

1. Full Ralph module implementation
2. Integration with ACT Framework
3. User testing and refinement

---

## Related Files

- Session metrics: `docs/executive-summaries/01-multi-agent-research-metrics.md`
- Research results: `.epct/research/`
- Session handoff: `docs/handoffs/2026-01-10-parallel-research-analysis.md`
- Screenshots: `ideas/intelligence/inbox/` (debut, loop.jpg + fin, loop.jpg)

---

## Open Questions

1. **Storage**: Where to persist task queue? (Local SQLite vs. cloud)
2. **Execution**: How to run scheduled tasks? (Cron vs. always-on daemon)
3. **Notification**: How to notify user of completion? (Email, push, file)
4. **Pricing model**: How to adapt to different subscription tiers?

---

*Document created: January 10, 2026*
*Status: Concept - Ready for review*
*Priority: High - Key framework improvement*
