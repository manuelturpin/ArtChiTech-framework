# /consider:5-whys

Find the root cause of a problem by asking "why?" repeatedly until you reach the underlying issue.

## Usage

```
/consider:5-whys [problem]
```

## Description

The 5 Whys technique drills down from symptoms to root cause. Each answer becomes the subject of the next "why?" until you reach an actionable root cause (usually systemic or process-related).

Use when:
- Bug investigation
- Production incidents
- Process failures
- Understanding customer complaints

## Process

1. **State the problem clearly** — Be specific
2. **Ask "Why?"** — Give a factual answer
3. **Repeat 4+ more times** — Each answer feeds the next why
4. **Identify root cause** — Usually systemic/process-related
5. **Implement countermeasure** — Fix root cause, not symptoms

## Example

```
/consider:5-whys "App crashes on startup"

Problem: App crashes on startup

Why? → Null pointer exception
Why? → Config object is null  
Why? → Config file failed to load
Why? → File path hardcoded to Windows format
Why? → Never tested on Mac/Linux

ROOT CAUSE: No cross-platform testing
COUNTERMEASURE: Add CI tests on all platforms
```

## Tips

- Use facts, not guesses
- Don't stop at blame ("John made a mistake")
- Sometimes it's more than 5 whys
- Branch if multiple valid answers exist

## Related

- **Full skill:** [skills/thinking/models/02-five-whys.md](../../skills/thinking/models/02-five-whys.md)
- **Combines well with:** `/consider:first-principles`, `/consider:pre-mortem`
