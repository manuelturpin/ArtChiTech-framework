# SPEC: Multi-IDE Support

> Export ACT configurations to various IDEs and AI coding assistants.

## Version

- **Status:** Draft
- **Version:** 1.0.0
- **Date:** 2026-02-02

## Overview

ACT is designed for Claude Code but the methodology works with any AI coding assistant. This spec defines how to export ACT configurations to other IDEs.

## Supported IDEs

| IDE | Config Directory | Primary File | Format |
|-----|-----------------|--------------|--------|
| Claude Code | `.claude/` | `CLAUDE.md` | Markdown |
| Cursor | `.cursor/` | `rules/*.md` | Markdown rules |
| Windsurf | `.windsurf/` | `rules/*.md` | Markdown rules |
| Aider | `.aider/` | `.aider.conf.yml` | YAML |
| Continue | `.continue/` | `config.json` | JSON |
| Copilot | `.github/` | `copilot-instructions.md` | Markdown |

## ACT Concepts Mapping

### Core Concepts

Each IDE export must include:

| ACT Concept | Description | Priority |
|-------------|-------------|----------|
| Iron Laws | TDD, Debug, Verification | **Required** |
| Deviation Rules | Autonomous vs human decisions | **Required** |
| Session Recovery | Context persistence | Recommended |
| Reflexion Pattern | Quality improvement | Recommended |
| Thinking Models | Mental models | Optional |

### Mapping Per IDE

#### Cursor

```
.cursor/
├── rules/
│   ├── act-iron-laws.md
│   ├── act-deviation-rules.md
│   └── act-workflow.md
└── .cursorrules
```

- Uses Markdown rules in `.cursor/rules/`
- Rules are automatically loaded by Cursor AI
- Can include multiple files (split by topic)

#### Windsurf

```
.windsurf/
├── rules/
│   ├── act-iron-laws.md
│   ├── act-deviation-rules.md
│   └── act-workflow.md
└── .windsurfrules
```

- Similar to Cursor format
- Rules in `.windsurf/rules/`
- Supports cascading rules (project > workspace > global)

#### Aider

```
.aider/
├── .aider.conf.yml
└── conventions.md
```

- Configuration via YAML
- Conventions referenced in config
- Supports model selection, conventions file

#### Continue

```
.continue/
├── config.json
└── act-instructions.md
```

- JSON configuration with instructions file
- Supports custom system prompts
- Can reference external docs

#### Copilot

```
.github/
└── copilot-instructions.md
```

- Single Markdown file
- Located in `.github/` directory
- Automatically loaded by GitHub Copilot

## Export Command

### Syntax

```bash
/act:export [--ide <cursor|windsurf|aider|continue|copilot>] [--all] [--force]
```

### Options

| Option | Description |
|--------|-------------|
| `--ide <name>` | Export for a specific IDE |
| `--all` | Export for all supported IDEs |
| `--force` | Overwrite existing files |
| `--dry-run` | Preview without writing |

### Examples

```bash
# Export for Cursor
/act:export --ide cursor

# Export for all IDEs
/act:export --all

# Preview export
/act:export --ide aider --dry-run
```

## Export Process

### 1. Detect Project Configuration

```
IF .act/ exists:
  - Read config.yaml for project settings
  - Read iron-laws, deviation-rules customizations
ELSE:
  - Use default ACT configuration
```

### 2. Generate IDE-Specific Files

```
FOR each target IDE:
  1. Load template from templates/ide/<ide>/
  2. Inject project-specific values:
     - Project name
     - Custom Iron Laws
     - Custom Deviation Rules
  3. Write to IDE config directory
```

### 3. Output Report

```markdown
## Export Complete

**IDE:** Cursor
**Files created:**
- .cursor/rules/act-iron-laws.md
- .cursor/rules/act-deviation-rules.md
- .cursor/rules/act-workflow.md

**Next steps:**
1. Review generated files
2. Customize as needed
3. Commit to repository
```

## Template Variables

Templates support these variables:

| Variable | Description |
|----------|-------------|
| `{{project_name}}` | From config.yaml or directory name |
| `{{project_type}}` | product, cli, library, etc. |
| `{{iron_laws}}` | Custom Iron Laws or defaults |
| `{{deviation_rules}}` | Custom Deviation Rules or defaults |
| `{{date}}` | Export date |

## File Structure

```
templates/ide/
├── cursor/
│   └── rules.md
├── windsurf/
│   └── rules.md
├── aider/
│   └── aider.conf.yml
├── continue/
│   └── config.json
└── copilot/
    └── copilot-instructions.md
```

## Conflict Resolution

When exporting:

1. **File exists + no --force** → Skip with warning
2. **File exists + --force** → Backup to `.bak`, overwrite
3. **Directory doesn't exist** → Create directory

```
⚠️ File exists: .cursor/rules/act-iron-laws.md
   Use --force to overwrite (backup created)
```

## Validation

After export, validate:

1. Files are syntactically correct
2. Required sections present
3. No placeholder variables remaining

```bash
/act:validate --ide cursor
```

## Migration Notes

### From Claude Code to Cursor

1. Run `/act:export --ide cursor`
2. Review `.cursor/rules/` files
3. Remove Claude-specific references
4. Test with Cursor AI

### From Claude Code to Aider

1. Run `/act:export --ide aider`
2. Configure `.aider.conf.yml` model settings
3. Reference conventions.md in config
4. Test with `aider --config .aider/.aider.conf.yml`

## Future IDEs

Potential future support:

- **Zed** — `.zed/` config
- **Codeium** — Custom format
- **Sourcegraph Cody** — `.cody/` config
- **Amazon Q** — AWS-specific format

Adding new IDEs requires:
1. Research IDE's configuration format
2. Create template in `templates/ide/<ide>/`
3. Update export logic
4. Document in this spec
