# /consider:map-territory

Check whether your mental model (map) accurately reflects reality (territory).

## Usage

```
/consider:map-territory [belief or assumption]
```

## Description

The Map vs Territory distinction reminds us that mental models are not reality itself. Maps are useful simplifications, but they omit details, become outdated, and may be wrong. Confusing the map for the territory leads to costly errors.

Use when:
- Predictions don't match reality
- Relying heavily on models or abstractions
- Experts disagree (they have different maps)
- Something "should" work but doesn't

## Process

1. **Identify your map** — What model/assumption are you using?
2. **Acknowledge it's a map** — It's a simplification, not reality
3. **Check for discrepancies** — Where does your map diverge from observations?
4. **Update or replace** — Adjust your map or accept limitations
5. **Test against territory** — Validate with real data

## Example

```
/consider:map-territory "User surveys say they want Feature Y"

THE MAP:
- 80% of surveyed users want Feature Y
- Most requested feature
- Building it will increase satisfaction

THE TERRITORY:
- Users SAY they want Feature Y
- But behavior shows they rarely use similar features
- What they say ≠ what they do

DISCREPANCY:
Feature Y built, usage is 5%

LESSON:
Surveys (map) capture stated preferences
Behavior (territory) reveals true preferences

UPDATED APPROACH:
Prototype and observe behavior before full build
```

## Map Failure Types

- **Outdated** — Map was accurate but reality changed
- **Incomplete** — Map omits important details
- **Wrong** — Map was never accurate
- **Wrong-level** — Too detailed or too abstract

## George Box's Law

> "All models are wrong, but some are useful."

## Related

- **Full skill:** [skills/thinking/models/09-map-territory.md](../../skills/thinking/models/09-map-territory.md)
- **Combines well with:** `/consider:first-principles`, `/consider:probabilistic`
