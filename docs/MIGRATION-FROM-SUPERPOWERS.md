# Migration from Superpowers to Native Skills

> **ACT v2.7+** — Superpowers are now built-in

## What Changed

Starting with ACT v2.7, the external `superpowers` plugin is no longer required. All superpowers functionality has been integrated directly into ACT as **native skills**.

### Before (ACT < 2.7)
```
# Required external plugin
npm install -g act-superpowers

# Referenced as:
superpowers:brainstorming
```

### After (ACT ≥ 2.7)
```
# No installation needed — skills are built-in

# Referenced as:
@skills/brainstorming/SKILL.md
```

---

## Skill Mapping

| Old (superpowers:*)                        | New (@skills/*)                      |
|--------------------------------------------|--------------------------------------|
| `superpowers:brainstorming`                | `@skills/brainstorming/SKILL.md`     |
| `superpowers:writing-plans`                | `@skills/writing-plans/SKILL.md`     |
| `superpowers:test-driven-development`      | `@skills/tdd/SKILL.md`               |
| `superpowers:code-review`                  | `@skills/code-review/SKILL.md`       |
| `superpowers:verification-before-completion` | `@skills/verification/SKILL.md`    |
| `superpowers:systematic-debugging`         | `@skills/debugging/SKILL.md`         |

---

## Migration Steps

### 1. Update Your References

Search your project for `superpowers:` and replace with the corresponding `@skills/` path:

```bash
# Find all superpowers references
grep -r "superpowers:" --include="*.md" .
```

### 2. Update Configuration Files

If you have any ACT configuration files referencing superpowers:

```yaml
# Before
skills:
  - superpowers:brainstorming
  - superpowers:code-review

# After
skills:
  - @skills/brainstorming/SKILL.md
  - @skills/code-review/SKILL.md
```

### 3. (Optional) Uninstall Superpowers Plugin

The old plugin won't conflict with native skills, but you can remove it to clean up:

```bash
# npm
npm uninstall -g act-superpowers

# yarn
yarn global remove act-superpowers

# pnpm
pnpm remove -g act-superpowers
```

---

## Benefits of Native Skills

| Feature | Superpowers Plugin | Native Skills |
|---------|-------------------|---------------|
| External dependency | ✗ Required | ✓ None |
| Offline capability | ✗ May require network | ✓ Fully offline |
| Customization | ✗ Limited | ✓ Fork & modify freely |
| Updates | Manual npm update | Bundled with ACT |
| Version conflicts | Possible | Impossible |

### Key Advantages

- **Zero Dependencies** — No npm install, no version management, no supply chain concerns
- **Offline-First** — All skills work without network access
- **Fully Customizable** — Copy any skill to your workspace and modify it to fit your workflow
- **Always Compatible** — Native skills are tested and released with each ACT version

---

## Troubleshooting

### "Skill not found" errors

Ensure you're using the full path format: `@skills/<name>/SKILL.md`

### Custom superpowers not migrating

If you created custom superpowers, copy them to your workspace's `skills/` directory and reference them as local paths:

```
./skills/my-custom-skill/SKILL.md
```

---

## Questions?

If you encounter issues during migration, check the [ACT documentation](https://github.com/your-org/act) or open an issue.
