# Epic Template

> Use this template to document each Epic.

## Output File

Save to: `.epct/stories/epics/epic-{ID}.md`

---

## Template

```markdown
# {EPIC_ID}: {epic_name}

**Priority**: {Must Have / Should Have / Could Have}
**Estimated Size**: {total_effort_estimate}
**Stories**: {story_count}
**PRD Section**: {prd_section_reference}

---

## Description

{epic_description}

## User Value

> Why does this epic matter to the user?

{user_value_statement}

## Scope

### In Scope
- {scope_item_1}
- {scope_item_2}
- {scope_item_3}

### Out of Scope
- {exclusion_1}
- {exclusion_2}

## Features (from PRD)

| Feature | PRD Priority | Acceptance Criteria |
|---------|-------------|-------------------|
| {feature_1} | {Must/Should/Could} | {criteria} |
| {feature_2} | {Must/Should/Could} | {criteria} |

## Stories

| Story ID | Title | Size | Status |
|----------|-------|------|--------|
| {STORY_ID} | {title} | {XS-XL} | {Pending} |
| {STORY_ID} | {title} | {XS-XL} | {Pending} |

## Dependencies

| Depends On | Type | Notes |
|-----------|------|-------|
| {EPIC_ID or external} | {blocks/needs} | {details} |

## Personas

| Persona | Relevance |
|---------|-----------|
| {persona_name} | {how this epic serves them} |
```
