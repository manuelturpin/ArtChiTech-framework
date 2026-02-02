# Findings

## Research

### 2025-02-02: Initial Research
- argparse is best for simple Python CLIs
- click library is more powerful but overkill for this project
- JSON storage is fine for MVP, can migrate to SQLite later

---

## Discoveries

### Unexpected Findings
- Empty string validation needed even with argparse (it passes through)
- Task IDs should be UUIDs not incrementing integers (avoid conflicts)

### Technical Insights
- argparse subparsers allow clean command structure
- json.dumps with indent=2 keeps tasks.json readable
- Path.home() / '.taskflow' is standard config location

---

## References
- Python argparse docs: https://docs.python.org/3/library/argparse.html
- XDG Base Directory spec for config location

---

---

## Memorized Insights

### [2025-02-02 14:30] Insight
> argparse est plus simple que click pour les CLI simples

**Context:** Test T2 - Reflexion Pattern
**Category:** tooling
**Important:** No

---

*Last updated: 2025-02-02*
