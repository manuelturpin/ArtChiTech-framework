# User Story Template

> Use this template to document each dev-ready User Story.

## Output File

Save to: `.epct/stories/stories/story-{ID}.md`

---

## Template

```markdown
# {STORY_ID}: {story_title}

**Epic**: {EPIC_ID} - {epic_name}
**Size**: {XS / S / M / L / XL}
**Effort**: {effort_days}
**Priority**: {Must Have / Should Have / Could Have}
**PRD Feature**: {prd_feature_reference}
**Persona**: {primary_persona}

---

## User Story

> As a {persona/role},
> I want to {action/capability},
> so that {benefit/value}.

## Acceptance Criteria

- [ ] AC-1: {criterion_1}
- [ ] AC-2: {criterion_2}
- [ ] AC-3: {criterion_3}
- [ ] AC-4: {criterion_4}
- [ ] AC-5: {criterion_5}

## Technical Notes

{technical_implementation_notes}

### Files Likely Affected
- {file_or_component_1}
- {file_or_component_2}

### API Changes
{api_changes_if_any}

## Dependencies

| Depends On | Type | Notes |
|-----------|------|-------|
| {STORY_ID or external} | {blocks/needs} | {details} |

## Estimation Rationale

**Size**: {size} ({effort_days} days)
**Complexity**: {Low/Medium/High}
**Rationale**: {why_this_size}

## Traceability

| Source | Reference |
|--------|-----------|
| PRD Section | {section_number} - {section_name} |
| PRD Feature | {feature_name} |
| Epic | {EPIC_ID} - {epic_name} |
| Research Hypothesis | {hypothesis_id} (if applicable) |
| Persona | {persona_name} |
```
