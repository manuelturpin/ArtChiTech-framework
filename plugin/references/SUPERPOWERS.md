# Superpowers Dependency

> ACT Framework depends on the [superpowers](https://github.com/superpowers-ai/superpowers) plugin.

## Required Skills

The following superpowers skills are used throughout the ACT framework:

| Skill | Used In | Purpose |
|-------|---------|---------|
| `brainstorming` | Discovery, Strategy, Design | Explore ideas and validate problems |
| `writing-plans` | Strategy, Design | Create structured implementation plans |
| `test-driven-development` | Development, `/act-fix` | Write tests before implementation |
| `code-review` | Development | Review code quality and patterns |
| `verification-before-completion` | Quality, Launch | Verify work is complete before claiming done |
| `systematic-debugging` | Quality, Growth, Error Tracker | Debug issues methodically |

---

## Skills by Phase

### Phase 1: Discovery
- **`superpowers:brainstorming`** - Validate problem, explore user needs

### Phase 2: Strategy
- **`superpowers:brainstorming`** - Define MVP scope
- **`superpowers:writing-plans`** - Create roadmap

### Phase 3: Design
- **`superpowers:brainstorming`** - Explore architecture options
- **`superpowers:writing-plans`** - Document technical specifications

### Phase 4: Development
- **`superpowers:test-driven-development`** - Write tests first, implement after
- **`superpowers:code-review`** - Review implementation quality

### Phase 5: Quality
- **`superpowers:verification-before-completion`** - Ensure all tests pass
- **`superpowers:systematic-debugging`** - Debug failing tests

### Phase 6: Launch
- **`superpowers:verification-before-completion`** - Pre-launch checklist

### Phase 7: Growth
- **`superpowers:systematic-debugging`** - Debug production issues

---

## Skills by Agent/Command

### Agents

| Agent | Skills Used |
|-------|-------------|
| `project-orchestrator` | `brainstorming`, `writing-plans`, `test-driven-development`, `code-review`, `verification-before-completion`, `systematic-debugging` |
| `chunk-manager` | `systematic-debugging` (for test failures) |
| `error-tracker` | `systematic-debugging` (for `/act-fix`) |

### Commands

| Command | Skills Used |
|---------|-------------|
| `/act-project` | `brainstorming` |
| `/act-fix` | `systematic-debugging`, `test-driven-development` |

---

## Installation Verification

To verify superpowers is installed, check for its presence:

```bash
# Check if superpowers plugin is installed
ls ~/.claude/plugins/cache/ | grep superpowers
```

If not installed, ACT will work with reduced functionality:
- Manual brainstorming instead of structured skill
- No TDD enforcement
- No systematic debugging workflow

---

## Fallback Behavior

When superpowers is not available, ACT will:

1. **Log a warning** at startup:
   ```
   ⚠️  superpowers plugin not found. Some features may be limited.
   ```

2. **Skip skill invocations** but continue workflow:
   - Brainstorming → Manual discussion
   - TDD → User-driven testing
   - Debugging → Standard investigation

3. **Recommend installation**:
   ```
   💡 Install superpowers for enhanced ACT capabilities:
      See: https://github.com/superpowers-ai/superpowers
   ```

---

## Why Superpowers?

Superpowers provides structured workflows that complement ACT's 7-phase methodology:

| ACT Need | Superpowers Solution |
|----------|---------------------|
| Validate ideas before building | `brainstorming` skill with structured exploration |
| Plan before coding | `writing-plans` with implementation blueprints |
| Test-first development | `test-driven-development` enforces RED→GREEN→REFACTOR |
| Quality gates | `verification-before-completion` prevents false claims |
| Bug investigation | `systematic-debugging` follows scientific method |

The combination of ACT phases + superpowers skills creates a comprehensive development methodology.
