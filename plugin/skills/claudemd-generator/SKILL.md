---
name: claudemd-generator
description: Generate optimized CLAUDE.md based on project stack
---

# CLAUDE.md Generator

> Intelligent CLAUDE.md generation based on project analysis.

## When to Use

- During `/act-onboard` for new projects
- When user requests CLAUDE.md optimization
- After significant stack changes

## Capabilities

1. **Detection**: Reads stack info from detect_stack.py output
2. **Selection**: Chooses templates based on project type
3. **Generation**: Creates optimized CLAUDE.md
4. **Enhancement**: Adds to existing CLAUDE.md without overwriting

## Strategies

| Strategy | When | Output |
|----------|------|--------|
| **SINGLE** | Complexity < 5 | Single CLAUDE.md (~150 lines) |
| **MODULAR** | Complexity >= 5 | CLAUDE.md + .claude/rules/ |
| **ENHANCE** | Existing file | Add sections to existing |

## Generation Process

1. **Analyze** stack info from `.epct/stack.json`
2. **Calculate** complexity score (technologies count)
3. **Select** strategy (SINGLE, MODULAR, ENHANCE)
4. **Load** appropriate templates
5. **Generate** content with project-specific data
6. **Preview** to user for confirmation
7. **Write** files to project

## Templates

| Type | File | Description |
|------|------|-------------|
| Base | `templates/base.md.tmpl` | Main CLAUDE.md structure |
| Webapp | `templates/sections/webapp.md.tmpl` | Web app specifics |
| API | `templates/sections/api.md.tmpl` | API development |
| CLI | `templates/sections/cli.md.tmpl` | CLI tools |
| Library | `templates/sections/library.md.tmpl` | Libraries |
| Behavior | `templates/rules/behavior.md.tmpl` | Anti-hallucination rules |
| Conventions | `templates/rules/conventions.md.tmpl` | Code conventions |

## Usage

### Automatic (via /act-onboard)

Called automatically in Step 6.5 of the onboarding process.

### Manual

```
Generate an optimized CLAUDE.md for this project
```

## Quality Rules

### Limits

- Single mode: < 300 lines
- Modular: CLAUDE.md < 100 lines + rules files

### Keywords

Use strong keywords for instructions:
- `MUST` / `IMPORTANT` for requirements
- `DO NOT` / `NEVER` for prohibitions
- `ALWAYS` for systematic rules

### Avoid

- Linter rules (use ESLint/Prettier instead)
- Inline code (use @file references)
- Verbose explanations
