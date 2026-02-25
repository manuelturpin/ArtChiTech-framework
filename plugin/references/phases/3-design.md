# Phase 3: Design

**Objective**: Design the technical architecture and UX

**Active skills**: `superpowers:writing-plans`, `superpowers:brainstorming`
**Workflows**: `adr`
**Produces**: Architecture Decision Records, Technical Specifications, API Design

## Checklist

- [ ] Technical architecture defined
- [ ] ADRs created for key decisions (using `workflows/adr/`)
- [ ] Technology stack chosen (with ADR)
- [ ] Data model designed
- [ ] API design (REST/GraphQL)
- [ ] User flows documented
- [ ] Wireframes/Mockups created
- [ ] Design system initiated
- [ ] Security considerations documented
- [ ] Scalability plan
- [ ] Infrastructure plan (cloud, CI/CD)
- [ ] Technical debt strategy
- [ ] Go/No-Go documented

## Superpowers Integration

| Superpower | Role in Design |
|------------|----------------|
| `superpowers:brainstorming` | Explore architecture options, evaluate trade-offs |
| `superpowers:writing-plans` | Document technical specifications and design decisions |

**Entry point**: Use `/act:party` with architect/developer/reviewer personas to explore architecture decisions, then document with ADRs.

## BMAD Workflows

### ADR Workflow (NEW in v3.0)
Use `workflows/adr/` to document Architecture Decision Records:
1. Identify the decision point (often triggered by Deviation Rule 4)
2. Gather context and constraints
3. Explore alternatives (use `/act:party` or `/consider:first-principles`)
4. Document the decision with template
5. Store in `.act/architecture/`
6. Review with `architect` agent

### When to Create an ADR
- Choosing between frameworks or libraries
- Defining data storage patterns
- Selecting communication protocols
- Making infrastructure decisions
- Changing established patterns
- Any Deviation Rule 4 situation

## Anti-Patterns

⚠️ **Over-engineering**: Architecting for 1M users when you will have 100.

⚠️ **Shiny object syndrome**: Choosing a tech because it's new, not because it fits.

⚠️ **Skipping security**: "We'll add security later".

⚠️ **No design system**: Reinventing components for each screen.

⚠️ **Undocumented decisions**: Making architectural choices without recording the rationale.

## Recommended Tools

- **Figma**: UI/UX design, Design system
- **Excalidraw**: Architecture diagrams
- **dbdiagram.io**: Data modeling
- **Swagger**: API documentation

## Key Metrics

| Metric | Target |
|--------|--------|
| User flows | All documented |
| API endpoints | Specified |
| Components | Design system |
| Security | OWASP checklist |
| ADRs | 1+ per major decision |

## Artefacts Produced

| Artefact | Location | Description |
|----------|----------|-------------|
| ADRs | `.act/architecture/ADR-*.md` | Architecture Decision Records |
| Tech Spec | `.act/plan.md` (detailed) | Technical implementation spec |
| API Spec | project-specific | API endpoints and contracts |
| Data Model | project-specific | Database schema and relations |

## Transition → Phase 4

Go Conditions:
- Architecture validated
- Tech stack decided (with ADR)
- Mockups approved
- API spec complete
- Key ADRs documented
