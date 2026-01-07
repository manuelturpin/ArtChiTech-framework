# Contributing to ACT Framework

Thanks for your interest in ACT! Here's how you can help.

## Quick Ways to Contribute

- 🐛 **Report bugs** — Use `/act-feedback` in Claude Code or [open an issue](https://github.com/manuelturpin/ArtChiTech-framework/issues)
- 💡 **Suggest features** — We love new ideas
- 📖 **Improve docs** — Typos, clarifications, examples
- 🔧 **Submit code** — Bug fixes, new features

## Development Setup

```bash
# Clone the repo
git clone https://github.com/manuelturpin/ArtChiTech-framework.git
cd ArtChiTech-framework

# Install locally for testing
./scripts/install.sh --project

# Test your changes
claude
/act-project
```

## Pull Request Process

1. **Fork** the repo
2. **Create a branch** — `git checkout -b feature/amazing-feature`
3. **Make changes** — Keep them focused
4. **Test locally** — Run `/act-project` to verify
5. **Commit** — Use conventional commits (see below)
6. **Push** — `git push origin feature/amazing-feature`
7. **Open a PR** — Describe what and why

## Commit Convention

We follow [Conventional Commits](https://conventionalcommits.org):

| Prefix | Usage |
|--------|-------|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `refactor:` | Code restructuring |
| `test:` | Adding tests |
| `chore:` | Maintenance |

Example: `feat: add project export command`

## Code Style

- Keep it simple and readable
- Follow existing patterns in the codebase
- Comments for "why", not "what"

## Questions?

- Open a [Discussion](https://github.com/manuelturpin/ArtChiTech-framework/discussions)
- Use `/act-help` in Claude Code

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
