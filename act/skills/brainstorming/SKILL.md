# Skill: Brainstorming

> **"75 techniques, 4 modes, structured creativity on demand."**

## Purpose

Facilitate structured brainstorming sessions with a comprehensive library of techniques. This skill wraps the internal brainstorming workflow, providing 75 techniques, 4 selection modes, and a built-in anti-bias protocol.

---

## When to Use

| Situation | Why |
|-----------|-----|
| Starting a new project | Explore possibilities before committing |
| Adding a new feature | Generate diverse approaches |
| Stuck on a problem | Break out of tunnel vision |
| Exploring architecture options | Consider multiple designs |
| Any creative thinking needed | Structured > chaotic |

---

## Workflow Reference

This skill wraps: `${ACT_ROOT}/workflows/brainstorming/`

### Key Resources

| Resource | Path |
|----------|------|
| Main workflow | `workflows/brainstorming/workflow.md` |
| Techniques library | `workflows/brainstorming/techniques.csv` |
| Output template | `workflows/brainstorming/template.md` |
| Setup step | `workflows/brainstorming/steps/setup.md` |
| Selection step | `workflows/brainstorming/steps/selection.md` |
| Execution step | `workflows/brainstorming/steps/execution.md` |
| Organization step | `workflows/brainstorming/steps/organization.md` |

---

## 4 Modes Available

### 1. AI-Recommended (Default)
- 2-4 techniques auto-selected based on current phase
- Best for: Quick sessions, trust the system

### 2. Browse Library
- Explore all 75 techniques, filtered by phase
- Best for: Learning what's available, specific needs

### 3. Random Selection
- Anti-bias random pick from different categories
- Best for: Breaking out of patterns, fresh perspectives

### 4. Progressive Flow
- 3-round structured session: Creative → Analytical → Convergent
- Best for: Deep exploration, comprehensive coverage

---

## Quick Start

### Full Session
```
/brainstorm [topic]
```
Runs complete 4-step workflow: Setup → Selection → Execution → Organization

### Quick Mode
```
/brainstorm:quick [topic]
```
Uses single technique, minimal output. For narrow, well-defined needs.

---

## The 4-Step Process

### Step 1: Setup
- Read project state and context
- Gather topic and constraints
- Create session file in `.act/brainstorming/`

### Step 2: Selection
- Choose brainstorming mode
- Select appropriate techniques
- Consider phase requirements

### Step 3: Execution
- Facilitate using selected techniques
- Apply anti-bias protocol:
  - Domain rotation (~every 10 ideas)
  - Perspective shifts (~every 20 ideas)
  - Plateau busters (when stuck)
- Target: 50+ ideas

### Step 4: Organization
- Organize ideas into themes
- Prioritize with phase-appropriate criteria
- Extract insights and next steps
- Save output document

---

## Anti-Bias Protocol

Built-in mechanisms prevent tunnel vision:

| Mechanism | Trigger | Action |
|-----------|---------|--------|
| Domain Rotation | Every ~10 ideas | Shift to different domain |
| Perspective Shift | Every ~20 ideas | Change viewpoint (user/dev/business) |
| Plateau Buster | When stuck | Random technique injection |

---

## Key Principles

1. **Facilitate, don't generate** — Coach the user through techniques, they do the thinking
2. **Anti-bias by design** — Prevent tunnel vision automatically
3. **Phase-aware** — Techniques adapt to current ACT phase
4. **Output-driven** — Every session produces structured, actionable results
5. **Flexible depth** — From quick single-technique to deep progressive flow

---

## Output

Sessions produce structured documents in `.act/brainstorming/`:

```markdown
# Brainstorming: [Topic]

## Session Info
- Date: [timestamp]
- Mode: [mode used]
- Techniques: [techniques applied]

## Ideas
### Theme 1: [name]
- Idea 1
- Idea 2

### Theme 2: [name]
- Idea 3
- Idea 4

## Top Priorities
1. [highest priority idea]
2. [second priority]
3. [third priority]

## Next Steps
- [ ] Action 1
- [ ] Action 2
```

---

## Commands

| Command | Description |
|---------|-------------|
| `/brainstorm [topic]` | Full brainstorming session |
| `/brainstorm:quick [topic]` | Quick single-technique session |
| `/brainstorm:modes` | Show available modes |
| `/brainstorm:techniques` | Browse technique library |

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
