# Analyse Approfondie : Superpowers v4.1.1

**Date :** 2026-01-31  
**Repo :** https://github.com/obra/superpowers  
**Auteur :** Jesse Vincent  
**Priorité :** CRITIQUE (dépendance actuelle d'ACT)

---

## 📊 Vue d'ensemble

**Type :** Core skills library pour Claude Code  
**Focus :** TDD, debugging, collaboration, workflows  
**License :** MIT  
**Multi-IDE :** Oui (Claude Code, Codex, OpenCode)

---

## 🏗️ Architecture

### Structure des fichiers

```
superpowers/
├── .claude-plugin/
│   ├── plugin.json        # Manifest du plugin
│   └── marketplace.json   # Config marketplace
├── skills/                # 14 skills
│   ├── brainstorming/
│   ├── writing-plans/
│   ├── executing-plans/
│   ├── test-driven-development/
│   ├── systematic-debugging/
│   ├── verification-before-completion/
│   ├── requesting-code-review/
│   ├── receiving-code-review/
│   ├── using-git-worktrees/
│   ├── finishing-a-development-branch/
│   ├── dispatching-parallel-agents/
│   ├── subagent-driven-development/
│   ├── using-superpowers/
│   └── writing-skills/
├── commands/              # 3 commands
│   ├── brainstorm.md
│   ├── write-plan.md
│   └── execute-plan.md
├── agents/                # 1 agent
│   └── code-reviewer.md
├── hooks/                 # SessionStart hook
│   └── hooks.json
├── .codex/                # Support Codex
├── .opencode/             # Support OpenCode
└── docs/
```

### Skills Inventory (14 total)

| Skill | Description | Utilisé par ACT |
|-------|-------------|-----------------|
| brainstorming | Design collaboratif avant implémentation | ✅ Discovery, Strategy, Design |
| writing-plans | Plans d'implémentation détaillés | ✅ Strategy, Design |
| executing-plans | Exécution batch avec checkpoints | ❌ |
| test-driven-development | RED-GREEN-REFACTOR | ✅ Development |
| systematic-debugging | 4 phases investigation root cause | ✅ Quality, Growth |
| verification-before-completion | Evidence before claims | ✅ Quality, Launch |
| requesting-code-review | Demande de review | ❌ |
| receiving-code-review | Réception de feedback | ❌ |
| using-git-worktrees | Workspaces isolés | ❌ |
| finishing-a-development-branch | Merge/PR decision | ❌ |
| dispatching-parallel-agents | Subagents parallèles | ❌ |
| subagent-driven-development | Fresh subagent per task | ❌ |
| using-superpowers | Intro au système | ❌ |
| writing-skills | Créer de nouveaux skills | ❌ |

---

## 🔍 Analyse Détaillée des Skills Critiques

### 1. brainstorming

**Objectif :** Transformer les idées en designs validés via dialogue collaboratif.

**Process :**
1. Comprendre le contexte projet (fichiers, docs, commits)
2. Poser des questions **une à la fois**
3. Préférer questions à choix multiples
4. Proposer 2-3 approches avec trade-offs
5. Présenter le design en sections (200-300 mots)
6. Valider chaque section avant de continuer

**Output :** `docs/plans/YYYY-MM-DD-<topic>-design.md`

**Principes clés :**
- One question at a time
- YAGNI ruthlessly
- Incremental validation
- Multiple choice preferred

**🔥 À intégrer dans ACT :**
- Pattern "1 question à la fois"
- Sections de 200-300 mots avec validation
- Fichier design.md versionné

---

### 2. writing-plans

**Objectif :** Plans d'implémentation pour ingénieur avec zéro contexte.

**Granularité :** Chaque étape = 2-5 minutes
- "Write the failing test" - step
- "Run it to make sure it fails" - step
- "Implement minimal code" - step
- "Run tests" - step
- "Commit" - step

**Structure de tâche :**
```markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/exact/path/to/test.py`

**Step 1: Write the failing test**
[Complete code]

**Step 2: Run test to verify it fails**
Run: `pytest tests/path/test.py::test_name -v`
Expected: FAIL with "function not defined"

**Step 3: Write minimal implementation**
[Complete code]

**Step 4: Run test to verify it passes**
Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS

**Step 5: Commit**
```bash
git add ...
git commit -m "feat: ..."
```
```

**Execution handoff :**
- Subagent-Driven : Fresh subagent per task
- Parallel Session : Batch avec checkpoints

**🔥 À intégrer dans ACT :**
- Format de plan avec exact file paths
- Steps de 2-5 min
- Complete code in plan (pas "add validation")
- Execution handoff pattern

---

### 3. test-driven-development

**Iron Law :** `NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST`

**Règle absolue :** Code écrit avant test ? **DELETE IT. Start over.**

**Cycle RED-GREEN-REFACTOR :**

```
RED → Verify fails correctly → GREEN → Verify passes → REFACTOR → Stay green
```

**Qualités d'un bon test :**
- Minimal (un seul comportement)
- Clear (nom décrit le comportement)
- Real code (pas de mocks sauf si inévitable)

**Rationalizations à éviter :**
| Excuse | Réalité |
|--------|---------|
| "Too simple to test" | Simple code breaks. 30 sec test. |
| "I'll test after" | Tests passing immediately prove nothing. |
| "TDD will slow me down" | TDD faster than debugging. |
| "Keep as reference" | You'll adapt it. Delete means delete. |

**Verification Checklist :**
- [ ] Every function has a test
- [ ] Watched each test fail before implementing
- [ ] Each test failed for expected reason
- [ ] Minimal code to pass
- [ ] All tests pass
- [ ] Tests use real code

**🔥 À intégrer dans ACT :**
- Iron Law enforcement
- Delete code written before test
- Verification checklist
- Common rationalizations table

---

### 4. systematic-debugging

**Iron Law :** `NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST`

**4 Phases OBLIGATOIRES :**

**Phase 1: Root Cause Investigation**
1. Read error messages carefully
2. Reproduce consistently
3. Check recent changes
4. Gather evidence (multi-component systems)
5. Trace data flow

**Phase 2: Pattern Analysis**
1. Find working examples
2. Compare against references
3. Identify differences
4. Understand dependencies

**Phase 3: Hypothesis and Testing**
1. Form single hypothesis
2. Test minimally (one variable)
3. Verify before continuing
4. If 3+ fixes failed → Question architecture

**Phase 4: Implementation**
1. Create failing test case
2. Implement single fix
3. Verify fix
4. If ≥3 fixes failed → STOP, question architecture

**Red Flags :**
- "Quick fix for now"
- "Just try changing X"
- "I'm confident" without evidence
- "One more fix attempt" after 2+ failures

**🔥 À intégrer dans ACT :**
- 4 phases obligatoires
- Rule of 3 (3+ fixes = architecture problem)
- Red flags detection
- Evidence gathering pattern

---

### 5. verification-before-completion

**Iron Law :** `NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE`

**Gate Function :**
```
1. IDENTIFY: What command proves this claim?
2. RUN: Execute the FULL command
3. READ: Full output, check exit code
4. VERIFY: Does output confirm the claim?
5. ONLY THEN: Make the claim
```

**Pattern :**
```
✅ [Run test] [See: 34/34 pass] "All tests pass"
❌ "Should pass now" / "Looks correct"
```

**Rationalizations :**
| Excuse | Reality |
|--------|---------|
| "Should work now" | RUN the verification |
| "I'm confident" | Confidence ≠ evidence |
| "Agent said success" | Verify independently |

**🔥 À intégrer dans ACT :**
- Evidence before claims pattern
- Gate function
- No shortcuts for verification

---

### 6. executing-plans

**Process :**
1. Load and review plan critically
2. Execute batch (default: 3 tasks)
3. Report and wait for feedback
4. Apply changes if needed
5. Complete with finishing-a-development-branch

**When to stop :**
- Blocker mid-batch
- Plan has critical gaps
- Instruction unclear
- Verification fails repeatedly

**🔥 À intégrer dans ACT :**
- Batch execution with checkpoints
- Stop when blocked pattern
- Review → Execute → Report → Continue

---

## 📐 Patterns Architecturaux

### 1. Skill Structure

```
skill-name/
├── SKILL.md           # Main skill definition
├── references/        # Supporting docs (optional)
└── tests/             # Test files (optional)
```

**SKILL.md Format :**
```yaml
---
name: skill-name
description: "When to use this skill"
---

# Skill Title

## Overview
[Core principle and purpose]

## The Iron Law
[Non-negotiable rule]

## The Process
[Step-by-step instructions]

## Red Flags
[When to stop]

## Common Rationalizations
[Excuses to avoid]
```

### 2. Cross-Skill References

Pattern : `superpowers:skill-name`

Exemple :
```markdown
**REQUIRED SUB-SKILL:** Use superpowers:test-driven-development
```

### 3. Hooks

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup|resume|clear|compact",
        "hooks": [{ "type": "command", "command": "..." }]
      }
    ]
  }
}
```

### 4. Multi-IDE Support

- `.claude-plugin/` → Claude Code
- `.codex/` → Codex
- `.opencode/` → OpenCode

---

## ✅ Forces

1. **Iron Laws clairs** : Règles non-négociables avec enforcement
2. **Rationalizations tables** : Anticipe les excuses communes
3. **Evidence-based** : Verification before completion
4. **Skill interconnection** : References croisées entre skills
5. **Documentation exemplaire** : Chaque skill est auto-documenté
6. **Multi-IDE** : Support Claude Code, Codex, OpenCode

---

## ❌ Faiblesses

1. **Pas de context engineering** : Pas de fichiers persistants
2. **Pas de session recovery** : Seulement SessionStart hook
3. **Pas de scale-adaptive** : Même process pour petit/gros projet
4. **Pas de learning** : Pas d'extraction de patterns
5. **Dependencies** : Skills interdépendants (chain of skills)

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Source | Priorité |
|---------|--------|----------|
| Iron Laws | TDD, debugging, verification | 🔴 |
| Rationalizations tables | TDD, debugging | 🔴 |
| Evidence before claims | verification-before-completion | 🔴 |
| Bite-sized steps (2-5 min) | writing-plans | 🔴 |
| Complete code in plans | writing-plans | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Source | Priorité |
|---------|--------|----------|
| 4-phase debugging | systematic-debugging | 🟠 |
| Rule of 3 (architecture) | systematic-debugging | 🟠 |
| One question at a time | brainstorming | 🟠 |
| Batch execution + checkpoints | executing-plans | 🟠 |

### Tier 3 (COULD)

| Pattern | Source | Priorité |
|---------|--------|----------|
| Cross-skill references | all skills | 🟢 |
| Multi-IDE structure | .claude-plugin, .codex, .opencode | 🟢 |
| Red flags detection | TDD, debugging | 🟢 |

---

## 📁 Fichiers à Étudier Plus Tard

- `skills/writing-skills/SKILL.md` — Comment créer de nouveaux skills
- `skills/subagent-driven-development/SKILL.md` — Pattern subagent
- `agents/code-reviewer.md` — Agent de review
- `docs/testing.md` — Guide de test

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 1/9 — Superpowers v4.1.1*
