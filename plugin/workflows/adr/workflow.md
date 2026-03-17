---
name: act-adr
description: Internal ADR workflow for capturing architectural decisions with context, alternatives, and consequences
version: 1.0.0
---

# ACT ADR Workflow

## Purpose

Capture significant architectural decisions with their context, alternatives, and consequences using Architecture Decision Records (ADRs). Integrates with ACT Deviation Rule 4 to document decisions that require human approval.

## When to Use

- Choosing between frameworks or libraries
- Defining data storage patterns
- Selecting communication protocols
- Making infrastructure decisions
- Changing established patterns
- Any Rule 4 deviation (architectural change)
- After a `/act:party` discussion concludes with a decision

## Initialization

1. Set the workflow root path:
   ```
   ADR_ROOT="${ACT_ROOT}/workflows/adr"
   ```

2. Ensure the output directory exists:
   ```bash
   mkdir -p .act/architecture
   ```

3. Read the ADR template:
   ```
   ${ADR_ROOT}/template.md
   ```
   If `template.md` is missing, display an error and abort:
   ```
   ❌ ADR template not found at ${ADR_ROOT}/template.md
   💡 Reinstall ACT or verify the plugin installation.
   ```

## Workflow Sequence

Execute the 2 steps in order:

### Step 1: Create ADR
Read and follow `${ADR_ROOT}/steps/create.md`

Identify the decision, gather context, explore alternatives, document the decision using the template, and save the ADR to `.act/architecture/ADR-{NNN}-{slug}.md`.

### Step 2: Review ADR
Read and follow `${ADR_ROOT}/steps/review.md`

Verify completeness and quality of the ADR. Check that context, alternatives, and consequences are well-documented. Update status from "Proposed" to "Accepted" if approved.

## Naming Convention

ADRs are numbered sequentially:
- `ADR-001-choose-database.md`
- `ADR-002-api-authentication.md`
- `ADR-003-monorepo-structure.md`

## ADR States

```
Proposed → Accepted → [Deprecated | Superseded]
```

- **Proposed**: Under discussion
- **Accepted**: Decision made and active
- **Deprecated**: No longer relevant
- **Superseded**: Replaced by a newer ADR

## Integration with ACT Phases

| Phase | ADR Role |
|-------|----------|
| Discovery | Problem context documentation |
| Strategy | High-level architectural decisions |
| Design | Detailed technical decisions |
| Development | Implementation-level decisions |

## Key Principles

1. **Context-rich**: Every ADR explains the "why" behind the decision.
2. **Alternatives documented**: At least 2 alternatives must be considered.
3. **Consequences explicit**: Both positive and negative impacts are listed.
4. **Traceable**: ADRs link to relevant research, PRD sections, or discussions.
5. **Living documents**: ADRs can be superseded or deprecated as the project evolves.

## Resources

| Resource | Path |
|----------|------|
| ADR template | `${ADR_ROOT}/template.md` |
| Step 1: Create | `${ADR_ROOT}/steps/create.md` |
| Step 2: Review | `${ADR_ROOT}/steps/review.md` |
| ADR output | `.act/architecture/` |

---
*ACT v3.0 - Architecture Decision Records*
