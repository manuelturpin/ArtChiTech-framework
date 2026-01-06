# ArtChiTech Framework (ACT)

[![Version](https://img.shields.io/badge/version-1.2.0-blue.svg)](https://github.com/manuelturpin/ArtChiTech-framework/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-purple.svg)](https://claude.ai/code)

> A 7-phase project management framework for Claude Code. From idea to production, structured and guided.

## What is ACT?

**ACT** transforms how you build software with Claude Code. Instead of diving straight into code, ACT guides you through a structured 7-phase methodology that ensures you're building the right thing, the right way.

```
/projet
```

That's it. One command to start. ACT automatically detects your context and guides you.

## Features

- **Structured Phases** - 7 proven phases from Discovery to Growth
- **Smart Detection** - Automatically recognizes new vs existing projects
- **TDD Integration** - Test-driven development built into the workflow
- **Superpowers Skills** - Leverages brainstorming, planning, and review skills
- **Progress Tracking** - Visual status and checkpoints
- **Feedback Loop** - Built-in issue reporting to GitHub

## The 7 Phases

| Phase | Name | Goal |
|:-----:|------|------|
| 1 | **Discovery** | Validate the problem and user needs |
| 2 | **Strategy** | Define roadmap and business model |
| 3 | **Design** | Architect the solution and UX |
| 4 | **Development** | Implement with TDD methodology |
| 5 | **Quality** | Test, review, and validate |
| 6 | **Launch** | Deploy and release |
| 7 | **Growth** | Iterate based on feedback |

Each phase has clear **Go/No-Go criteria** before advancing to the next.

## Installation

### Prerequisites

| Dependency | Version | Required |
|------------|---------|:--------:|
| [Claude Code](https://claude.ai/code) | Latest | Yes |
| [Superpowers Plugin](https://github.com/superpowers-marketplace/superpowers) | 3.6.0+ | Yes |
| Python | 3.8+ | Yes |
| Git | Any | Yes |

### Install Dependencies

```bash
# Install the superpowers plugin
claude plugins:install superpowers-marketplace/superpowers

# Verify Python
python3 --version  # Must be >= 3.8
```

### Install ACT

```bash
git clone https://github.com/manuelturpin/ArtChiTech-framework.git
cd ArtChiTech-framework
./scripts/install.sh
```

The installer will ask where to install:

| Scope | Location | Availability |
|-------|----------|--------------|
| **Global** | `~/.claude/plugins/act/` | All your projects |
| **Project** | `./.claude/plugins/act/` | This project only |

You can also use flags: `--global` or `--project`

### Verify Installation

Restart Claude Code, then run:

```
/projet
```

## Usage

### Commands

| Command | Description |
|---------|-------------|
| `/projet` | **Main hub** - Start here |
| `/onboard` | Audit and initialize a project |
| `/status` | View project progress |
| `/next` | Move to next phase |
| `/fix` | Fix blocking issues |
| `/resume` | Resume previous session |
| `/help` | Contextual help |
| `/feedback` | Report bugs or suggestions |
| `/triage` | View open issues |

### Workflow Modes

| Mode | When to Use |
|------|-------------|
| **COMPLETE** | New project from scratch - all 7 phases |
| **FEATURE** | Adding a feature to existing project |
| **QUICK** | Bugfix or small refactoring |

### Project Structure

ACT creates a `.epct/` folder in your project to track state:

```
your-project/
└── .epct/
    ├── state.json          # Current phase and progress
    ├── session/            # Session data
    └── history/
        └── checkpoints/    # Phase checkpoints
```

> **Tip**: Add `.epct/` to `.gitignore` if you don't want to version ACT state.

## Superpowers Integration

ACT automatically uses the right superpowers skill for each phase:

| Phase | Skill Used |
|-------|------------|
| Discovery | `superpowers:brainstorming` |
| Strategy | `superpowers:brainstorming` |
| Design | `superpowers:writing-plans` |
| Development | `superpowers:test-driven-development` |
| Quality | `superpowers:code-reviewer` |

## Example Session

```
You: /projet

ACT: Welcome! I detect this is a new project.
     Let's start with Phase 1: Discovery.

     What problem are you trying to solve?

You: I want to build a CLI tool for managing dotfiles

ACT: Great! Let me use brainstorming to explore this further...
     [Guides through discovery questions]

     Phase 1 complete! Ready for Phase 2: Strategy?
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Setup

```bash
# Clone and install locally for development
git clone https://github.com/manuelturpin/ArtChiTech-framework.git
cd ArtChiTech-framework
./scripts/install.sh --project  # Install in project scope
```

### Project Structure

```
ArtChiTech-framework/
├── plugin/                 # ACT plugin source
│   ├── commands/           # Slash commands
│   ├── agents/             # Specialized agents
│   ├── references/         # Phase documentation
│   └── scripts/            # Utility scripts
├── scripts/                # Installation scripts
├── docs/                   # Documentation
└── test-apps/              # Test applications
```

## Reporting Issues

Use the built-in feedback command:

```
/feedback
```

Or open an issue on [GitHub](https://github.com/manuelturpin/ArtChiTech-framework/issues).

## License

MIT - [Manuel Turpin](https://github.com/manuelturpin)

---

<p align="center">
  Built with Claude Code
</p>
