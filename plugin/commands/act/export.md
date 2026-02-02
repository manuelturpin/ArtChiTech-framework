# /act:export

Export ACT configuration to other IDEs and AI coding assistants.

## Usage

```bash
/act:export [--ide <cursor|windsurf|aider|continue|copilot>] [--all] [--force] [--dry-run]
```

## Options

| Option | Description |
|--------|-------------|
| `--ide <name>` | Export for a specific IDE |
| `--all` | Export for all supported IDEs |
| `--force` | Overwrite existing files (creates backup) |
| `--dry-run` | Preview export without writing files |

## Supported IDEs

| IDE | Config Directory | Format |
|-----|-----------------|--------|
| Claude Code | `.claude/` | CLAUDE.md (native, no export needed) |
| Cursor | `.cursor/rules/` | Markdown rules |
| Windsurf | `.windsurf/rules/` | Markdown rules |
| Aider | `.aider/` | YAML config + conventions |
| Continue | `.continue/` | JSON config + instructions |
| Copilot | `.github/` | Markdown instructions |

## Examples

### Export for Cursor

```bash
/act:export --ide cursor
```

Creates:
```
.cursor/
└── rules/
    └── act-rules.md
```

### Export for Aider

```bash
/act:export --ide aider
```

Creates:
```
.aider/
├── .aider.conf.yml
└── conventions.md
```

### Export for All IDEs

```bash
/act:export --all
```

Creates configurations for all supported IDEs.

### Preview Without Writing

```bash
/act:export --ide cursor --dry-run
```

Shows what would be created without actually writing files.

### Force Overwrite

```bash
/act:export --ide cursor --force
```

Overwrites existing files (creates `.bak` backup first).

## Output

### Success

```markdown
## /act:export Complete

**IDE:** Cursor
**Date:** 2026-02-02

### Files Created
| File | Status |
|------|--------|
| `.cursor/rules/act-rules.md` | ✅ Created |

### Next Steps
1. Review generated files
2. Customize for your project needs
3. Commit to repository
```

### Conflict Warning

```markdown
## /act:export Warning

**IDE:** Cursor

### Conflicts Detected
| File | Status |
|------|--------|
| `.cursor/rules/act-rules.md` | ⚠️ Exists |

Use `--force` to overwrite (backup will be created).
```

## What Gets Exported

Each export includes:

### Core Concepts (Always)
- **Iron Laws** — TDD, Debugging, Verification rules
- **Deviation Rules** — Autonomous vs human decision rules

### Recommended Concepts
- **Session Recovery** — 5-question context check
- **Reflexion Pattern** — Quality improvement process

### IDE-Specific Adaptations
- **Cursor/Windsurf** — Rules in Markdown format
- **Aider** — YAML config with conventions file
- **Continue** — JSON config with custom commands
- **Copilot** — Single comprehensive Markdown file

## Template Variables

Exports use variables from `.act/config.yaml`:

| Variable | Source | Fallback |
|----------|--------|----------|
| `project_name` | config.yaml | Directory name |
| `project_type` | config.yaml | "generic" |
| `date` | Current date | — |

## Customization

After export, you can:

1. **Edit generated files** — Customize for your workflow
2. **Add project-specific rules** — Extend the base configuration
3. **Remove unnecessary sections** — Simplify if needed

The exported files are starting points, not locked configurations.

## Implementation

```
1. Parse command options
2. Validate IDE name if --ide specified
3. Load project config from .act/config.yaml (if exists)
4. For each target IDE:
   a. Load template from templates/ide/<ide>/
   b. Process template variables
   c. Check for conflicts
   d. Write files (or preview if --dry-run)
5. Generate summary report
```

## Related

- **Spec:** `specs/SPEC-multi-ide.md`
- **Templates:** `templates/ide/`
- **Tools:** `tools/ide-export/`

## Notes

- Claude Code uses ACT natively; no export needed
- Exports are one-way (IDE → Claude Code migration not supported)
- Re-running export updates files (use `--force` if they exist)
