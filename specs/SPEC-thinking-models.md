# Specification: Thinking Models

**Version:** 1.0  
**Phase:** 4.3 - Thinking Models  
**Status:** Draft  
**Source:** Mental models, problem-solving frameworks

---

## Overview

Thinking Models are structured mental frameworks that improve reasoning, decision-making, and problem-solving. The `/consider:*` commands help apply these models systematically.

## Problem Statement

When facing complex decisions or problems, we often:

1. **Jump to conclusions** → Miss important factors
2. **Think linearly** → Ignore second-order effects
3. **Stay shallow** → Never reach root causes
4. **Follow biases** → Make predictable errors

## Solution: 12 Thinking Models

| # | Command | Technique | Use Case |
|---|---------|-----------|----------|
| 1 | `/consider:first-principles` | Décomposer aux fondamentaux | Innovation, challenging assumptions |
| 2 | `/consider:5-whys` | Root cause analysis | Debugging, problem diagnosis |
| 3 | `/consider:pareto` | Focus sur l'essentiel (80/20) | Prioritization, efficiency |
| 4 | `/consider:inversion` | Résoudre à l'envers | Avoiding failures, risk management |
| 5 | `/consider:second-order` | Conséquences des conséquences | Strategic thinking, long-term planning |
| 6 | `/consider:regret-minimization` | Décision long-terme | Life decisions, career choices |
| 7 | `/consider:opportunity-cost` | Coût des alternatives | Resource allocation, trade-offs |
| 8 | `/consider:circle-of-competence` | Connaître ses limites | Self-awareness, delegation |
| 9 | `/consider:map-territory` | Modèle vs réalité | Avoiding overconfidence, testing assumptions |
| 10 | `/consider:probabilistic` | Raisonner en probabilités | Uncertainty, risk assessment |
| 11 | `/consider:pre-mortem` | Anticiper l'échec | Project planning, risk mitigation |
| 12 | `/consider:reversibility` | Décisions réversibles vs non | Decision urgency, commitment level |

## Model Categories

### Analysis Models (Understanding)
- **First Principles** — Break down to fundamentals
- **5 Whys** — Find root causes
- **Map vs Territory** — Distinguish model from reality

### Decision Models (Choosing)
- **Pareto** — Focus on what matters
- **Opportunity Cost** — Understand trade-offs
- **Reversibility** — Calibrate commitment
- **Regret Minimization** — Long-term perspective
- **Probabilistic** — Handle uncertainty

### Thinking Models (Perspective)
- **Inversion** — Think backwards
- **Second-Order** — Think forward
- **Pre-Mortem** — Think failure
- **Circle of Competence** — Think limits

## Implementation Requirements

### R1: Skill Documentation
- Create `skills/thinking/SKILL.md` with overview
- Organize models in `skills/thinking/models/`
- Each model has: Description, Process, Example, Template

### R2: Commands
- Create `commands/consider/` directory
- One file per model: `first-principles.md`, etc.
- Each command links to detailed skill

### R3: Quick Reference
- Summary table in SKILL.md
- Decision tree for which model to use
- Common combinations

## Acceptance Criteria

- [ ] `skills/thinking/SKILL.md` exists with all 12 models
- [ ] `skills/thinking/models/` has 12 individual files
- [ ] `commands/consider/` has 12 command files
- [ ] Each model has:
  - [ ] Clear description
  - [ ] When to use
  - [ ] Step-by-step process
  - [ ] Concrete example
  - [ ] Template/prompt
- [ ] README.md updated with models table
- [ ] CLAUDE.md references thinking models

## Usage Examples

### Example 1: Architecture Decision
```
/consider:first-principles
"We need a database. What are our fundamental requirements?"
→ Break down to: data shape, access patterns, scale, consistency needs
→ Decision emerges from fundamentals, not "what everyone uses"
```

### Example 2: Bug Investigation
```
/consider:5-whys
"Tests fail intermittently"
Why? → Race condition
Why? → Shared state
Why? → Global singleton
Why? → Legacy design
Why? → No architecture review
→ Root cause: process issue, not just code
```

### Example 3: Feature Prioritization
```
/consider:pareto
"20 features requested"
→ Which 20% will deliver 80% of value?
→ Focus on 4 high-impact features
```

## Related Specifications

- SPEC-iron-laws.md (Debugging uses 5 Whys)
- SPEC-context-engineering.md (Clear thinking aids context)

## References

- Charlie Munger's Mental Models
- First Principles Thinking (Elon Musk)
- Toyota Production System (5 Whys)
- Jeff Bezos's Regret Minimization Framework

---

*Specification created for ACT v2.5*
