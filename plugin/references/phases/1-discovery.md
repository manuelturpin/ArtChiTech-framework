# Phase 1: Discovery

**Objective**: Validate the problem and define the value proposition

**Active skills**: `superpowers:brainstorming`
**Workflows**: `research`, `brainstorming`
**Produces**: Research synthesis, Problem Statement, initial PRD draft

## Checklist

- [ ] Problem Statement validated (clear, measurable)
- [ ] Jobs-To-Be-Done documented (3-5 main JTBD)
- [ ] Personas defined (3-5 personas)
- [ ] Value Proposition Canvas completed
- [ ] TAM/SAM/SOM estimated
- [ ] Competitor benchmark (5+ analyzed)
- [ ] Opportunity Solution Tree created
- [ ] Hypotheses prioritized (impact × uncertainty)
- [ ] User interviews (5-10 minimum)
- [ ] Sean Ellis Test planned
- [ ] Go/No-Go documented
- [ ] Pivot or persevere decided

## Superpowers Integration

| Superpower | Role in Discovery |
|------------|-------------------|
| `superpowers:brainstorming` | Explore problem space, validate assumptions, diverge/converge on solutions |

**Entry point**: ACT orchestrates the brainstorming skill — use `/act:full` or `/act:quick`, NOT the raw brainstorming skill directly.

## BMAD Workflows

### Research Workflow
Use `workflows/research/` to:
1. Prepare research questions
2. Understand the domain
3. Explore competitors and alternatives
4. Validate hypotheses
5. Make Go/No-Go decision

### Brainstorming Workflow
Use `workflows/brainstorming/` to:
1. Set up the problem frame
2. Execute divergent techniques
3. Organize and cluster ideas
4. Select and validate winners

## Anti-Patterns

⚠️ **Building before validation**: Do not code before validating the problem with real users.

⚠️ **Solution-first thinking**: Starting from "I want to build X" instead of "what problem am I solving?".

⚠️ **Confirmation bias**: Looking for evidence that confirms your hypotheses instead of testing them.

⚠️ **Skipping user research**: Assuming you know the needs without talking to users.

## Recommended Tools

- **Miro/FigJam**: Value Proposition Canvas, Opportunity Solution Tree
- **Notion**: JTBD documentation, Personas
- **Typeform/Tally**: User surveys
- **Calendly**: Interview scheduling

## Key Metrics

| Metric | Target |
|--------|--------|
| User interviews | 5-10 |
| Sean Ellis Test | > 40% "very disappointed" |
| Problem-Solution Fit | Validated |

## Artefacts Produced

| Artefact | Location | Description |
|----------|----------|-------------|
| Research Synthesis | `.act/findings.md` | Key discoveries and insights |
| Problem Statement | `.act/prd.md` (Section 1) | Validated problem definition |
| Personas | `.act/prd.md` (Section 2) | Target user profiles |
| Competitive Analysis | `.act/findings.md` | Market landscape |

## Transition → Phase 2

Go Conditions:
- Problem Statement validated by users
- JTBD clearly defined
- Differentiating Value Proposition identified
