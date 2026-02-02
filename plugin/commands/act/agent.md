# Command: /act:agent

## Purpose

Charge le contexte d'un agent spécialisé pour bénéficier de son expertise et de ses règles de comportement.

---

## Syntax

```
/act:agent <name>
/act:agent reset
```

### Arguments

| Argument | Description |
|----------|-------------|
| `<name>` | Nom de l'agent à charger |
| `reset` | Désactive l'agent courant |

---

## Agents Disponibles

| Agent | Model | Rôle | Quand l'utiliser |
|-------|-------|------|------------------|
| `planner` | opus | Planification, décomposition | Nouvelle feature, roadmap |
| `architect` | opus | Architecture, design | Décisions techniques |
| `executor` | sonnet | Implémentation | Écrire du code |
| `reviewer` | opus | Code review, validation | Avant merge |
| `tester` | sonnet | Tests, qualité | Écrire des tests |
| `documenter` | haiku | Documentation | READMEs, docs |

---

## Usage Examples

### Charger un agent

```bash
# Charger le planner pour planifier
/act:agent planner

# Charger l'executor pour implémenter
/act:agent executor

# Charger le reviewer pour review
/act:agent reviewer
```

### Désactiver l'agent

```bash
/act:agent reset
```

---

## Execution Steps

### Step 1: Parse Argument

```
IF arg is empty THEN
  Display list of available agents
  EXIT

IF arg == "reset" THEN
  Clear agent context
  Display: "Agent context cleared"
  EXIT

agent_name = normalize(arg)
```

### Step 2: Validate Agent

```
valid_agents = ["planner", "architect", "executor", "reviewer", "tester", "documenter"]

IF agent_name NOT IN valid_agents THEN
  Display: "Unknown agent: {agent_name}"
  Display: "Available: {valid_agents}"
  EXIT
```

### Step 3: Load Agent Context

Read the agent definition from `agents/{agent_name}.md`:

```
agent_content = read("agents/{agent_name}.md")

Extract:
- Role
- Model recommendation
- Responsibilities
- Rules
- Workflow
```

### Step 4: Apply Agent Context

Announce agent activation:

```markdown
## 🤖 Agent Activated: {agent_name}

**Model:** {recommended_model}
**Role:** {role}

### Responsibilities
{responsibilities}

### Active Rules
{rules}

---

Agent will remain active until `/act:agent reset` or session end.
```

### Step 5: Modify Behavior

While agent is active:

1. **Planner** (opus)
   - Focus on decomposition and planning
   - Ask clarifying questions
   - Create detailed plans before implementation

2. **Architect** (opus)
   - Consider system-wide impacts
   - Propose multiple approaches
   - Document trade-offs

3. **Executor** (sonnet)
   - Follow TDD Iron Law strictly
   - Write clean, minimal code
   - Don't over-engineer

4. **Reviewer** (opus)
   - Check for bugs and edge cases
   - Verify test coverage
   - Suggest improvements

5. **Tester** (sonnet)
   - Write comprehensive tests
   - Cover edge cases
   - Ensure high coverage

6. **Documenter** (haiku)
   - Write clear, concise docs
   - Include examples
   - Keep it maintainable

---

## Output Format

### Agent Loaded

```markdown
## 🤖 Agent Activated: executor

**Model:** sonnet
**Role:** Implementation specialist

### Responsibilities
- Write clean, tested code
- Follow existing patterns
- Implement features incrementally

### Active Rules
- TDD Iron Law applies
- Minimal code principle
- No premature optimization

---

Ready to implement. Describe the feature or point me to the spec.
```

### Agent Reset

```markdown
## 🔄 Agent Context Cleared

No specialized agent active. Using default behavior.
```

### Unknown Agent

```markdown
## ❌ Unknown Agent

Agent "xyz" not found.

**Available agents:**
| Agent | Model | Role |
|-------|-------|------|
| planner | opus | Planification |
| architect | opus | Architecture |
| executor | sonnet | Implementation |
| reviewer | opus | Code review |
| tester | sonnet | Tests |
| documenter | haiku | Documentation |

Usage: `/act:agent <name>`
```

### No Argument

```markdown
## 🤖 Available Agents

| Agent | Model | Use When |
|-------|-------|----------|
| `planner` | opus | Starting a feature, creating roadmap |
| `architect` | opus | Design decisions, technical choices |
| `executor` | sonnet | Writing code, implementing features |
| `reviewer` | opus | Reviewing code, validating quality |
| `tester` | sonnet | Writing tests, ensuring coverage |
| `documenter` | haiku | Writing docs, READMEs |

### Usage

```
/act:agent <name>    # Load an agent
/act:agent reset     # Clear agent context
```

### Currently Active

{current_agent or "None"}
```

---

## Integration

### With Model Selection

Les agents ont des recommandations de modèle :
- **opus** : planner, architect, reviewer (pensée profonde)
- **sonnet** : executor, tester (implémentation)
- **haiku** : documenter (tâches simples)

### With Deviation Rules

Quand l'agent est actif :
- **Rule 4** (architectural) → Déclenche l'architecte
- **Rules 1-3** (fixes) → L'executor peut gérer
- **Rule 5** (enhancement) → Le planner peut évaluer

### With Iron Laws

Tous les agents respectent les Iron Laws :
- **TDD** : Surtout executor et tester
- **Debugging** : Surtout reviewer
- **Verification** : Tous

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:status` | View current state |
| `/act:party` | Multi-perspective discussion |
| `/act:reflect` | Reflect on work done |

---

*Command version: 1.0*
*ACT version: 2.5*
