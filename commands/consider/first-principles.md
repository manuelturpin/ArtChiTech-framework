# /consider:first-principles

Break down a problem or assumption to its fundamental truths, then rebuild understanding from scratch.

## Usage

```
/consider:first-principles [topic]
```

## Description

First Principles Thinking helps you escape conventional wisdom by questioning assumptions. Instead of reasoning by analogy ("how do others do it?"), you reason from basics ("what is fundamentally true?").

Use when:
- Conventional approaches feel wrong
- You need innovation, not iteration
- Assumptions are limiting options
- Facing "impossible" constraints

## Process

1. **Identify assumptions** — List what you're taking for granted
2. **Break to fundamentals** — What is undeniably true?
3. **Question each assumption** — Is this actually necessary?
4. **Rebuild from basics** — What solutions emerge from fundamentals?

## Example

```
/consider:first-principles "We need microservices for scale"

ASSUMPTIONS:
- Microservices are necessary for scale
- Monoliths don't scale
- Big companies know best

FUNDAMENTALS:
- We need X requests/second
- We have Y developers
- We need Z deployment frequency

REBUILD:
Our scale: 1000 req/s → Monolith handles easily
Our team: 5 devs → Can coordinate on monolith
Conclusion: Modular monolith serves us better
```

## Related

- **Full skill:** [skills/thinking/models/01-first-principles.md](../../skills/thinking/models/01-first-principles.md)
- **Combines well with:** `/consider:inversion`, `/consider:5-whys`
