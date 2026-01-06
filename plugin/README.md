# ACT Framework

> 7-phase project management framework for Claude Code.

## Installation

### Prerequisites

| Dependency | Version | Required |
|------------|---------|----------|
| Claude Code | Latest | Yes |
| Plugin `superpowers` | 3.6.0+ | Yes |
| Python | 3.8+ | Yes |
| Git | Any | Yes |

### Install dependencies

```bash
# 1. Install the superpowers plugin
claude plugins:install superpowers-marketplace/superpowers

# 2. Verify Python
python3 --version  # Must be >= 3.8
```

### Install ACT

**Option A: Git clone (recommended for development)**

```bash
git clone https://github.com/manuelturpin/ArtChiTech-framework.git ~/projects/act
cd ~/projects/act
./scripts/install.sh
```

**Option B: Local installation**

```bash
./scripts/install.sh
```

### Verify installation

Restart Claude Code, then type `/projet`.

## Usage

### Commands

| Command | Description |
|---------|-------------|
| `/projet` | Main hub - single entry point |
| `/onboard` | Audit and initialize a project |
| `/status` | View complete project status |
| `/next` | Move to next phase |
| `/fix` | Fix issues |
| `/resume` | Resume a session |
| `/help` | Contextual help |

### The 7 Phases

1. **Discovery** - Validate the problem and needs
2. **Strategy** - Define roadmap and business model
3. **Design** - Design architecture and UX
4. **Development** - Implement with TDD
5. **Quality** - Test and validate
6. **Launch** - Deploy and acquire users
7. **Growth** - Iterate and optimize

### The 3 Modes

| Mode | Usage |
|------|-------|
| COMPLETE | New project from scratch |
| FEATURE | New feature |
| QUICK | Bugfix or refactoring |

## .epct/ Structure

ACT creates a `.epct/` folder in your project:

```
.epct/
├── state.json          # Current state
├── session/            # Session data
└── history/
    └── checkpoints/    # Checkpoints
```

Add `.epct/` to your `.gitignore` if you don't want to version ACT state.

## Superpowers Integration

ACT uses superpowers skills based on the phase:

| Phase | Skill |
|-------|-------|
| Discovery | `superpowers:brainstorming` |
| Strategy | `superpowers:brainstorming` |
| Design | `superpowers:writing-plans` |
| Development | `superpowers:test-driven-development` |
| Quality | `superpowers:code-reviewer` |

## Development

```bash
# Run tests
bash plugin/tests/run_all_tests.sh

# Structure
plugin/
├── commands/      # Slash commands
├── skills/        # Reusable skills
├── references/    # Reference documentation
└── tests/         # Automated tests
```

## License

MIT - Manuel Turpin
