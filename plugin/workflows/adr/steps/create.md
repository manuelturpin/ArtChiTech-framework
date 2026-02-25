# Step: Create ADR

## Trigger
- Deviation Rule 4 detected (architectural change)
- User explicitly requests architectural documentation
- `/act:party` discussion concludes with a decision

## Process

1. **Determine next ADR number**
   - List existing ADRs in `.act/architecture/`
   - Increment the highest number

2. **Generate slug from title**
   - Lowercase, hyphen-separated
   - Example: "Choose Database Engine" → `choose-database-engine`

3. **Fill template**
   - Copy from `workflows/adr/template.md`
   - Fill all sections with decision context
   - Mark status as "Proposed"

4. **Save to project**
   - Path: `.act/architecture/ADR-{NNN}-{slug}.md`
   - Update `.act/findings.md` with reference

5. **Request review**
   - If architect agent available, request review
   - Otherwise, present to user for validation

## Output
- ADR file created in `.act/architecture/`
- Reference added to findings.md
