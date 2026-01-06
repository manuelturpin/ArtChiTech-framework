# ArtChiTech Framework (ACT)

> Claude Code plugin for 7-phase project management.

## Language

- **Project language**: English (all code, docs, comments)
- **Conversation language**: French (discuss with user in French)

## Identity

- **Name**: ArtChiTech Framework
- **Shortcut**: ACT
- **Type**: Claude Code Plugin

## Rules

@.claude/rules/0-behavior.md

## Documentation

| Topic | File |
|-------|------|
| Framework & Phases | @.claude/rules/1-framework-overview.md |
| Architecture | @.claude/rules/2-architecture.md |
| Commands | @.claude/rules/3-command-development.md |
| Conventions | @.claude/rules/4-conventions.md |
| Tests | @.claude/rules/5-testing.md |
| Troubleshooting | @.claude/rules/6-troubleshooting.md |

## Quick Start

```bash
# Edit plugin
plugin/

# Test
cd test-apps/[app-name] && /onboard

# Commit
git commit -m "feat: description"
```

## Main Commands

| Command | Description |
|---------|-------------|
| `/project` | Main interactive hub |
| `/onboard` | Audit a project |
| `/status` | Project state |
| `/next` | Next step |
| `/fix` | Fix issues |
| `/resume` | Resume session |
| `/help` | Contextual help |
