# Phase 2: Strategy

**Objective**: Define the roadmap and business model

**Active skills**: `superpowers:writing-plans`, `superpowers:brainstorming`
**Workflows**: `prd`
**Produces**: Complete PRD, Implementation Plan, Story decomposition

## Checklist

- [ ] PRD completed (using `workflows/prd/`)
- [ ] Business Model Canvas completed
- [ ] Revenue streams identified
- [ ] Pricing strategy defined
- [ ] Go-to-Market strategy documented
- [ ] Product roadmap (3-6-12 months)
- [ ] MVP scope defined (must-have vs nice-to-have)
- [ ] Success metrics (KPIs) defined
- [ ] Risks identified and mitigation planned
- [ ] Required resources estimated
- [ ] Realistic timeline established
- [ ] Stakeholders aligned
- [ ] Go/No-Go documented

## Superpowers Integration

| Superpower | Role in Strategy |
|------------|------------------|
| `superpowers:brainstorming` | Define MVP scope, explore business models |
| `superpowers:writing-plans` | Create structured implementation roadmap |

**Entry point**: ACT orchestrates these skills — the PRD workflow and writing-plans skill work together to produce the complete strategy.

## BMAD Workflows

### PRD Workflow
Use `workflows/prd/` to formalize the Product Requirements Document:
1. **Create** — Build PRD from research data (7 sections)
2. **Validate** — Score PRD against criteria
3. **Edit** — Update sections as needed

### Story Decomposition
Use `workflows/stories/` to break the PRD into implementable stories:
1. Parse PRD features into Epics
2. Decompose Epics into Stories
3. Estimate effort per Story
4. Prioritize the backlog

## Anti-Patterns

⚠️ **Feature creep**: Adding features to the MVP that are not essential.

⚠️ **Unrealistic timelines**: Underestimating development time.

⚠️ **Ignoring competition**: Not analyzing how to differentiate yourself.

⚠️ **Vague success metrics**: "More users" instead of "1000 DAU in 3 months".

## Recommended Tools

- **Notion**: Roadmap, Business Model Canvas
- **Miro**: Strategy workshops
- **Spreadsheet**: Financial projections
- **Jira/Linear**: Backlog prioritization

## Key Metrics

| Metric | Target |
|--------|--------|
| MVP features | 3-5 core |
| Time to MVP | < 3 months |
| Estimated CAC | Defined |
| Estimated LTV | > 3× CAC |

## Artefacts Produced

| Artefact | Location | Description |
|----------|----------|-------------|
| PRD | `.act/prd.md` | Complete Product Requirements Document |
| Implementation Plan | `.act/plan.md` | Phased implementation roadmap |
| Stories | `.act/stories/` | Epic → Story decomposition |
| Business Model | `.act/findings.md` | Business model decisions |

## Transition → Phase 3

Go Conditions:
- PRD validated (score ≥ 70%)
- MVP scope locked
- Viable business model
- Roadmap approved by stakeholders
