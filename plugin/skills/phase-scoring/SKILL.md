---
name: phase-scoring
description: This skill should be used when the user needs to "calculate project score", "determine current phase", "evaluate project progress", or when /onboard needs to assess project maturity.
version: 1.0.0
---

# Phase Scoring Skill

## Purpose

Evaluate a project's progress through ACT's 7 phases and calculate scores for each.

## Scoring Process

1. **Gather Evidence**: Check for presence of artifacts per phase
2. **Calculate Scores**: 0-100 per phase based on completeness
3. **Determine Current Phase**: First phase with score < 70%
4. **Generate Recommendations**: Top 3 actions to improve

## Phase Indicators

See `references/scoring-rules.md` for detailed scoring criteria per phase.

## Usage

After running project-detection, evaluate:

1. **Discovery (Phase 1)**
   - Problem statement documented?
   - Target users defined?
   - Validation interviews done?

2. **Stratégie (Phase 2)**
   - Roadmap exists?
   - Business model defined?
   - KPIs identified?

3. **Conception (Phase 3)**
   - Architecture documented?
   - Tech stack chosen?
   - UI/UX mockups?

4. **Développement (Phase 4)**
   - Code exists?
   - Tests written?
   - CI/CD configured?

5. **Qualité (Phase 5)**
   - Test coverage > 60%?
   - No critical bugs?
   - Performance validated?

6. **Lancement (Phase 6)**
   - Deployed to production?
   - Monitoring in place?
   - Launch checklist complete?

7. **Croissance (Phase 7)**
   - Analytics tracking?
   - Feedback loop?
   - Iteration cycle?

## Output Format

```json
{
  "scores": {
    "discovery": 85,
    "strategy": 70,
    "conception": 90,
    "development": 45,
    "quality": 0,
    "launch": 0,
    "growth": 0
  },
  "current_phase": 4,
  "current_phase_name": "Développement",
  "recommendations": [
    "Augmenter la couverture de tests (actuellement ~30%)",
    "Configurer CI/CD pour les tests automatiques",
    "Documenter les API endpoints"
  ]
}
```
