# Analyse Approfondie : TÂCHES Claude Code Resources

**Date :** 2026-01-31  
**Repo :** https://github.com/glittercowboy/taches-cc-resources  
**Auteur :** TÂCHES (glittercowboy)  
**Priorité :** HIGH (thinking models + meta-prompting)

---

## 📊 Vue d'ensemble

**Type :** Collection de ressources Claude Code pour workflows réels  
**Focus :** Meta-prompting, thinking models, skill creation  
**License :** MIT  
**Installation :** `/plugin marketplace add glittercowboy/taches-cc-resources`  
**Philosophie :** "Assume everything is possible. Dream big."

---

## 🏗️ Architecture

### Structure des fichiers

```
taches-cc-resources/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── commands/                   # 27 commands
│   ├── create-prompt.md        # Generate optimized prompts
│   ├── run-prompt.md           # Execute in sub-agent
│   ├── add-to-todos.md         # Capture tasks mid-work
│   ├── check-todos.md          # Resume captured tasks
│   ├── whats-next.md           # Context handoff
│   ├── create-plan.md          # Plan phases
│   ├── run-plan.md             # Execute plan
│   ├── create-agent-skill.md   # Build skills
│   ├── create-meta-prompt.md   # Staged workflow prompts
│   ├── create-slash-command.md
│   ├── create-subagent.md
│   ├── create-hook.md
│   ├── audit-skill.md          # Audit for best practices
│   ├── audit-slash-command.md
│   ├── audit-subagent.md
│   ├── heal-skill.md           # Fix broken skills
│   ├── debug.md                # Expert debugging
│   ├── setup-ralph.md          # Autonomous coding loop
│   ├── consider/               # 12 thinking models
│   │   ├── pareto.md           # 80/20 rule
│   │   ├── first-principles.md # Break down fundamentals
│   │   ├── inversion.md        # Solve backwards
│   │   ├── second-order.md     # Consequences of consequences
│   │   ├── 5-whys.md           # Root cause
│   │   ├── occams-razor.md     # Simplest explanation
│   │   ├── one-thing.md        # Highest-leverage action
│   │   ├── swot.md             # Strengths/Weaknesses
│   │   ├── eisenhower-matrix.md # Urgent/Important
│   │   ├── 10-10-10.md         # Time horizons
│   │   ├── opportunity-cost.md
│   │   └── via-negativa.md     # Improve by removing
│   └── research/               # Research commands
├── skills/                     # 10 skills
│   ├── create-plans/           # Hierarchical project planning
│   ├── create-agent-skills/    # Build new skills
│   ├── create-meta-prompts/    # Generate workflow prompts
│   ├── create-slash-commands/
│   ├── create-subagents/
│   ├── create-hooks/
│   ├── create-mcp-servers/     # Build MCP servers
│   ├── debug-like-expert/      # Systematic debugging
│   ├── expertise/              # Domain expertise
│   └── setup-ralph/            # Ralph Wiggum loop
├── agents/                     # 3 auditor agents
│   ├── skill-auditor.md
│   ├── slash-command-auditor.md
│   └── subagent-auditor.md
└── docs/
```

---

## 🧠 Les 12 Thinking Models (KILLER FEATURE)

### `/consider:*` Commands

| Command | Technique | Use When |
|---------|-----------|----------|
| `/consider:pareto` | 80/20 Rule | Focus on what matters most |
| `/consider:first-principles` | Fundamentals | Strip assumptions, rebuild |
| `/consider:inversion` | Solve backwards | "What guarantees failure?" |
| `/consider:second-order` | Consequences² | Think through ripple effects |
| `/consider:5-whys` | Root cause | Drill to underlying cause |
| `/consider:occams-razor` | Simplicity | Find simplest explanation |
| `/consider:one-thing` | Leverage | Identify highest-impact action |
| `/consider:swot` | Analysis | Map S/W/O/T |
| `/consider:eisenhower-matrix` | Priority | Urgent/Important matrix |
| `/consider:10-10-10` | Time horizons | 10min/10months/10years |
| `/consider:opportunity-cost` | Trade-offs | What are you giving up? |
| `/consider:via-negativa` | Subtraction | Improve by removing |

### Exemple : First Principles

```markdown
**Current Assumptions:**
- Assumption 1: [challenged: true/false/partially]
- Assumption 2: [challenged: true/false/partially]

**Fundamental Truths:**
- Truth 1: [why this is irreducible]
- Truth 2: [why this is irreducible]

**Rebuilt Understanding:**
Starting from fundamentals, here's what we can conclude...

**New Possibilities:**
Without legacy assumptions, these options emerge...
```

---

## 📋 Meta-Prompting Pattern

### Séparation Planning / Execution

1. **`/create-prompt`** — Generate optimized prompts with XML structure
2. **`/run-prompt`** — Execute saved prompts in sub-agent contexts

**Philosophie :** Séparer l'analyse de l'exécution. Claude génère un prompt rigoureux, puis l'exécute dans un contexte frais.

---

## 📁 create-plans Skill (Hierarchical Planning)

### Principes Essentiels

#### 1. Solo Developer + Claude
> "You are planning for ONE person (the user) and ONE implementer (Claude). No teams. No stakeholders. No ceremonies."

#### 2. Plans ARE Prompts
> "PLAN.md IS the prompt. It contains Objective, Context, Tasks, Verification, Success criteria, Output."

#### 3. Scope Control (Context Quality Degradation)

| Context Usage | Quality |
|---------------|---------|
| 0-30% | Peak (comprehensive, thorough) |
| 30-50% | Good (engaged, manageable) |
| 50-70% | Degrading (efficiency mode) |
| 70%+ | Poor (rushed work) |

**Critical insight :** Claude dégrade à ~40-50%, pas à 80%. Solution = aggressive atomicity (2-3 tasks max per plan).

#### 4. Deviation Rules (Auto-handling)

| Rule | Trigger | Action |
|------|---------|--------|
| Rule 1 | Bugs | Auto-fix immediately |
| Rule 2 | Missing critical | Auto-add immediately |
| Rule 3 | Blockers | Auto-fix immediately |
| Rule 4 | Architectural | STOP, ask user |
| Rule 5 | Enhancements | Log to ISSUES.md |

### Structure

```
.planning/
├── BRIEF.md                    # Human vision
├── ROADMAP.md                  # Phase structure
└── phases/
    └── 01-foundation/
        ├── 01-01-PLAN.md       # Executable prompt
        ├── 01-01-SUMMARY.md    # Outcome
        └── .continue-here.md   # Handoff
```

---

## 🔍 debug-like-expert Skill

### Methodologie Systematic Debugging

**Philosophie :** Traiter le code que tu as écrit avec PLUS de scepticisme que le code inconnu.

**Process :**
1. Context scan (détecter le type de projet)
2. Domain expertise loading (si disponible)
3. Evidence gathering
4. Hypothesis testing
5. Rigorous verification

---

## 📝 whats-next Command (Context Handoff)

**Purpose :** Créer un document de handoff complet pour continuer dans un contexte frais.

**Sections :**
- `<original_task>` — Ce qui était demandé
- `<work_completed>` — Tout ce qui a été accompli
- `<work_remaining>` — Ce qui reste à faire
- `<attempted_approaches>` — Ce qui n'a pas marché
- `<critical_context>` — Connaissances essentielles
- `<current_state>` — État exact actuel

---

## 🤖 Les 3 Auditor Agents

| Agent | Purpose |
|-------|---------|
| **skill-auditor** | Reviews skills for best practices |
| **slash-command-auditor** | Reviews command structure |
| **subagent-auditor** | Reviews agent effectiveness |

Pattern `/heal-skill` : Auto-fix skills based on audit findings.

---

## ✅ Forces

1. **12 Thinking Models** : Mental frameworks intégrés directement
2. **Meta-Prompting** : Séparer planning de execution
3. **Context Handoff** : `/whats-next` pour fresh context
4. **Auditor pattern** : Self-healing skills
5. **Deviation Rules** : Auto-handling des problèmes (1-3, 5)
6. **Scope Control** : Aggressive atomicity (2-3 tasks)
7. **Domain Expertise** : Chargement intelligent par domaine
8. **Plans ARE Prompts** : PLAN.md = executable prompt

---

## ❌ Faiblesses

1. **Pas de Multi-IDE** : Claude Code only
2. **Pas de continuous learning** : Pas d'instincts
3. **Pas de hooks** : Pas d'automatisation Pre/Post
4. **Pas de session recovery** : Seulement handoff manuel
5. **Complexité** : Beaucoup de workflows différents

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Thinking Models** | 12 mental frameworks | 🔴 |
| **Context Handoff** | whats-next format | 🔴 |
| **Deviation Rules** | Auto-handling (1-3, 5) | 🔴 |
| **Scope Control** | 2-3 tasks max per plan | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Meta-Prompting** | Create → Run separation | 🟠 |
| **Auditor pattern** | Self-healing skills | 🟠 |
| **Plans ARE Prompts** | PLAN.md = executable | 🟠 |
| **Domain Expertise** | Intelligent loading | 🟠 |

### Tier 3 (COULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Todo capture** | Mid-work task capture | 🟢 |
| **Ralph setup** | Autonomous coding loop | 🟢 |
| **/heal-skill** | Auto-fix broken skills | 🟢 |

---

## 📝 Comparaison avec ACT Actuel

| Feature | TÂCHES | ACT | Gap |
|---------|--------|-----|-----|
| Thinking Models | ✅ 12 | ❌ | À implémenter |
| Context Handoff | ✅ | ⚠️ Basic | À enrichir |
| Deviation Rules | ✅ | ❌ | À implémenter |
| Auditors | ✅ | ❌ | À implémenter |
| Phases | ⚠️ (via plans) | ✅ 7 fixes | Comparable |
| Hooks | ❌ | ❌ | Planning Files better |
| Multi-IDE | ❌ | ❌ | Planning Files better |

---

## 📁 Fichiers à Étudier Plus Tard

- `skills/create-plans/workflows/` — All planning workflows
- `skills/create-plans/references/` — Supporting documentation
- `skills/expertise/` — Domain expertise examples
- `skills/setup-ralph/SKILL.md` — Autonomous coding loop

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 7/9 — TÂCHES Claude Code Resources*
