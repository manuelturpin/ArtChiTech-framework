# ACT Framework

![Version](https://img.shields.io/badge/version-2.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-purple)

> **Ship better projects.** From idea to production, guided by AI.

You start a project. Three weeks later, you're lost in your own code. Sound familiar?

ACT gives your projects structure without the overhead. 7 phases. Clear milestones. No more "where was I?"

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
```

Then in Claude Code:

```
/act-project
```

That's it. ACT detects your context and guides you from there.

## Why ACT?

| Without ACT | With ACT |
|-------------|----------|
| Start coding, figure it out later | Discovery → Strategy → Ship |
| "Is this ready?" — No idea | Clear phases + progress score |
| Reinvent the wheel each project | Built-in TDD, reviews, audits |

## The 7 Phases

```
1. Discovery    →  Validate the problem
2. Strategy     →  Define the roadmap
3. Design       →  Architecture & UX
4. Development  →  Build with TDD
5. Quality      →  Test & validate
6. Launch       →  Deploy & ship
7. Growth       →  Iterate & improve
```

Each phase has **Go/No-Go criteria**. No skipping steps.

## Commands

| Command | What it does |
|---------|--------------|
| `/act-project` | Your project hub — start here |
| `/act-status` | See where you are |
| `/act-onboard` | Audit an existing project |
| `/act-next` | Move to next phase |
| `/act-fix` | Fix blocking issues |
| `/act-feedback` | Report bugs or ideas |

## Requirements

- [Claude Code](https://claude.ai/code)
- [Superpowers plugin](https://github.com/superpowers-marketplace/superpowers) (3.6.0+)
- Python 3.8+
- Git

```bash
# Install superpowers first
claude plugins:install superpowers-marketplace/superpowers
```

## Installation

ACT installs locally in your project:

```bash
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
```

Structure created:
- `.claude/commands/` - Commands (Claude Code reads these)
- `.claude/act/` - ACT resources (scripts, skills, etc.)

## How It Works

ACT uses the right tool for each phase:

| Phase | Skill |
|-------|-------|
| Discovery & Strategy | `superpowers:brainstorming` |
| Design | `superpowers:writing-plans` |
| Development | `superpowers:test-driven-development` |
| Quality | `superpowers:code-reviewer` |

## Project State

ACT stores progress in `.epct/`:

```
.epct/
├── state.json       # Current phase
└── history/         # Checkpoints
```

Add to `.gitignore` if you don't want to track it.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Quick version:
1. Fork → Branch → Code → Test → PR

## License

[MIT](LICENSE) — Manuel Turpin

---

<p align="center">
  <strong>Stop winging it. Start shipping.</strong>
</p>
