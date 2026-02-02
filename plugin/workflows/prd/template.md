# PRD Template

> Use this template to structure the Product Requirements Document.

## Output File

Save to: `.epct/prd/prd-{YYYY-MM-DD}.md`

---

## Template

```markdown
# PRD: {project_name}

**Version**: {version_number}
**Date**: {YYYY-MM-DD}
**Author**: {author}
**Phase**: {phase_number} - {phase_name}
**Status**: {Draft/Review/Approved}

---

## 1. Vision & Objectives

### Vision
{project_vision}

### Problem Statement
{problem_statement_from_research}

### Objectives
| # | Objective | KPI | Target | Timeline |
|---|-----------|-----|--------|----------|
| 1 | {objective} | {kpi} | {target} | {timeline} |
| 2 | {objective} | {kpi} | {target} | {timeline} |
| 3 | {objective} | {kpi} | {target} | {timeline} |

### Source References
- Research synthesis: {path}
- Brainstorming session: {path}

---

## 2. Users & Personas

### Target Segments
| Segment | Size Estimate | Priority |
|---------|-------------|----------|
| {segment_1} | {size} | {Primary/Secondary} |
| {segment_2} | {size} | {Primary/Secondary} |

### Personas
{For each persona, reference .epct/research/personas/ files}

#### {persona_name}
- **Goal**: {primary_goal}
- **Pain**: {primary_pain}
- **JTBD**: {job_statement}
- **Source**: {persona_file_path}

### Source References
- Personas: {paths}
- Empathy Maps: {session_reference}

---

## 3. Features

### MoSCoW Prioritization

#### Must Have
| Feature | User Need | Acceptance Criteria |
|---------|-----------|-------------------|
| {feature} | {need} | {criteria} |

#### Should Have
| Feature | User Need | Acceptance Criteria |
|---------|-----------|-------------------|
| {feature} | {need} | {criteria} |

#### Could Have
| Feature | User Need | Acceptance Criteria |
|---------|-----------|-------------------|
| {feature} | {need} | {criteria} |

#### Won't Have (this version)
| Feature | Reason for Exclusion |
|---------|---------------------|
| {feature} | {reason} |

### Source References
- Brainstorming top ideas: {session_reference}
- Research validated hypotheses: {hypothesis_ids}

---

## 4. Technical Requirements

### Tech Stack
| Layer | Technology | Rationale |
|-------|-----------|-----------|
| Frontend | {tech} | {reason} |
| Backend | {tech} | {reason} |
| Database | {tech} | {reason} |
| Infrastructure | {tech} | {reason} |

### Integration Requirements
{list_of_integrations}

### Performance Targets
| Metric | Target |
|--------|--------|
| Page load | {target} |
| API response | {target} |
| Uptime | {target} |

### Security Requirements
{security_requirements}

---

## 5. Success Metrics

| KPI | Baseline | Target | Measurement Method | Frequency |
|-----|----------|--------|-------------------|-----------|
| {kpi_1} | {baseline} | {target} | {method} | {frequency} |
| {kpi_2} | {baseline} | {target} | {method} | {frequency} |
| {kpi_3} | {baseline} | {target} | {method} | {frequency} |

---

## 6. Risks & Mitigations

| Risk | Probability | Impact | Severity | Mitigation |
|------|------------|--------|----------|------------|
| {risk_1} | {H/M/L} | {H/M/L} | {score} | {mitigation} |
| {risk_2} | {H/M/L} | {H/M/L} | {score} | {mitigation} |
| {risk_3} | {H/M/L} | {H/M/L} | {score} | {mitigation} |

### Source References
- Pre-Mortem (BT-039): {session_reference}
- Research red flags: {flag_ids}

---

## 7. Timeline

| Milestone | Target Date | Dependencies | Status |
|-----------|------------|-------------|--------|
| {milestone_1} | {date} | {deps} | {status} |
| {milestone_2} | {date} | {deps} | {status} |
| {milestone_3} | {date} | {deps} | {status} |

---

## Approval

| Role | Name | Status | Date |
|------|------|--------|------|
| Product Owner | {name} | {Pending/Approved} | {date} |
| Tech Lead | {name} | {Pending/Approved} | {date} |
| Stakeholder | {name} | {Pending/Approved} | {date} |
```
