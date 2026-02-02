# Synthèse : Patterns à Intégrer dans ACT v2

**Date :** 2026-02-01
**Phase :** 2c - Synthèse des 9 frameworks analysés

---

## 📊 Grille Comparative

### Par Catégorie de Feature

| Feature | Superpowers | BMAD | GSD | Planning Files | Everything CC | CEK | TÂCHES | Claude-Flow | CCPM |
|---------|:-----------:|:----:|:---:|:--------------:|:-------------:|:---:|:------:|:-----------:|:----:|
| **Context Engineering** |
| Fichiers persistants | ❌ | ⚠️ | ✅ | ✅ | ❌ | ❌ | ✅ | ✅ | ✅ |
| Session Recovery | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ | ⚠️ | ✅ | ❌ |
| Context Handoff | ❌ | ❌ | ✅ | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Automatisation** |
| Hooks (Pre/Post/Stop) | ⚠️ | ❌ | ❌ | ✅ | ✅ | ❌ | ❌ | ✅ | ❌ |
| Cross-platform | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ | ❌ | ✅ | ❌ |
| **Learning** |
| Continuous Learning | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ | ✅ | ❌ |
| Confidence Scoring | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ | ✅ | ❌ |
| Reflexion/Self-improve | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | ✅ | ❌ |
| **Agents & Models** |
| Agents spécialisés | ✅ | ✅ | ✅ | ❌ | ✅ | ⚠️ | ⚠️ | ✅ | ✅ |
| Model Selection | ❌ | ❌ | ✅ | ❌ | ✅ | ❌ | ❌ | ✅ | ❌ |
| **Scale & Workflow** |
| Scale-Adaptive | ❌ | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ |
| Deviation Rules | ❌ | ❌ | ✅ | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| Thinking Models | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ | ❌ |
| **Quality** |
| Iron Laws / Rules | ✅ | ❌ | ❌ | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ |
| TDD Intégré | ✅ | ✅ | ✅ | ❌ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Verification | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ | ✅ |
| **Multi-IDE** |
| Multi-IDE Support | ⚠️ | ❌ | ⚠️ | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| **Integration** |
| GitHub Integration | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |

**Légende :** ✅ = Complet | ⚠️ = Partiel | ❌ = Absent

---

## 🏆 Patterns Tier 1 (MUST HAVE)

### 1. Context Engineering (Planning Files + GSD)

**Pattern : 3-File System**
```
project/
├── task_plan.md      # Phases, progress, decisions
├── findings.md       # Research, discoveries  
└── progress.md       # Session log, test results
```

**Principe :**
```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
```

**Source :** Planning Files, GSD

---

### 2. Hooks System (Planning Files + Everything CC)

**3 Hooks essentiels :**

| Hook | Déclencheur | Action |
|------|-------------|--------|
| **PreToolUse** | Avant Write/Edit/Bash | Relire task_plan.md (refresh goals) |
| **PostToolUse** | Après Write/Edit | Rappeler de mettre à jour status |
| **Stop** | Avant d'arrêter | Vérifier que toutes phases sont complètes |

**Pourquoi :** Hooks sont 100% reliable (vs skills ~50-80%).

**Source :** Planning Files, Everything CC

---

### 3. Model Selection (Everything CC + GSD)

**Stratégie par complexité :**

| Model | Usage | Coût |
|-------|-------|------|
| **Opus** | Décisions architecturales, planning | $$$ |
| **Sonnet** | Exécution, suit instructions explicites | $$ |
| **Haiku** | Tâches simples, lecture seule | $ |

**Exemple agents :**
- `planner` → opus
- `executor` → sonnet
- `mapper` → haiku

**Source :** Everything CC, GSD

---

### 4. Scale-Adaptive (BMAD + GSD)

**Quick Mode vs Full Mode :**

| Mode | Quand | Process |
|------|-------|---------|
| **Quick** | Bug fixes, small features, refactoring | Skip research, 1-3 tasks, fast |
| **Full** | New products, major features, multi-team | All phases, research, verification |

**Source :** BMAD (Quick Flow), GSD (Quick Mode)

---

### 5. Deviation Rules (GSD + TÂCHES)

**5 règles d'auto-handling :**

| Rule | Trigger | Action |
|------|---------|--------|
| 1 | Bugs | Auto-fix immediately |
| 2 | Missing critical | Auto-add immediately |
| 3 | Blockers | Auto-fix immediately |
| 4 | Architectural | **STOP, ask user** |
| 5 | Enhancements | Log to ISSUES.md, continue |

**Autonomie contrôlée :** Rules 1-3, 5 = auto. Rule 4 = human decision.

**Source :** GSD, TÂCHES

---

### 6. Iron Laws (Superpowers)

**TDD Iron Law :**
> `NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST`

**Debugging Iron Law :**
> `NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST`

**Verification Iron Law :**
> `NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE`

**Pattern :** Evidence before claims.

**Source :** Superpowers

---

### 7. Session Recovery (Planning Files)

**Quand le contexte se remplit :**
1. Détecte les sessions précédentes
2. Trouve la dernière mise à jour des planning files
3. Extrait les conversations depuis
4. Affiche un "catchup report"

**Source :** Planning Files

---

## 🟠 Patterns Tier 2 (SHOULD HAVE)

### 8. Continuous Learning v2 (Everything CC)

**Architecture instincts :**
```
Session → Hooks (observe) → observations.jsonl → Pattern Detection → instincts/
                                                                        ↓
                                                                   /evolve
                                                                        ↓
                                                                   skills/
```

**Confidence scoring :** 0.3 (tentative) → 0.9 (certain)

---

### 9. Reflexion Pattern (CEK)

**Impact prouvé :** +8-21% quality (papers peer-reviewed)

**Process :**
1. Complete task
2. `/reflexion:reflect` (auto-triggered par "reflect" dans prompt)
3. Improve output
4. `/reflexion:memorize` (save insights to CLAUDE.md)

---

### 10. Thinking Models (TÂCHES)

**12 mental frameworks :**

| Command | Technique |
|---------|-----------|
| `/consider:first-principles` | Break down to fundamentals |
| `/consider:5-whys` | Root cause |
| `/consider:pareto` | 80/20 rule |
| `/consider:inversion` | Solve backwards |
| `/consider:second-order` | Consequences² |
| ... | ... |

---

### 11. Context Handoff (TÂCHES + Planning Files)

**Format `/whats-next` :**
```xml
<original_task>...</original_task>
<work_completed>...</work_completed>
<work_remaining>...</work_remaining>
<attempted_approaches>...</attempted_approaches>
<critical_context>...</critical_context>
<current_state>...</current_state>
```

---

### 12. 5-Question Reboot Test (Planning Files)

| Question | Source |
|----------|--------|
| Where am I? | Current phase in task_plan.md |
| Where am I going? | Remaining phases |
| What's the goal? | Goal statement |
| What have I learned? | findings.md |
| What have I done? | progress.md |

---

## 🟢 Patterns Tier 3 (NICE TO HAVE)

### 13. Multi-IDE Support (Planning Files)
- Un dossier par IDE (`.cursor/`, `.gemini/`, `.opencode/`, etc.)
- Même contenu, format adapté

### 14. GitHub Integration (CCPM)
- Issues = project state
- PRD → Epic → Tasks → Issues
- Parallel execution avec git worktrees

### 15. Party Mode (BMAD)
- Tous les agents dans une conversation
- Multi-perspective discussion

### 16. Agent Auditors (TÂCHES)
- `/audit-skill`, `/audit-command`, `/audit-agent`
- `/heal-skill` pour auto-repair

---

## 📐 Architecture Cible ACT v2

### Structure proposée

```
ACT-v2/
├── .act/                           # ACT workspace
│   ├── config.yaml                 # Configuration
│   ├── state.md                    # Current state (like GSD STATE.md)
│   ├── plan.md                     # Current phase plan
│   ├── findings.md                 # Research & discoveries
│   └── progress.md                 # Session log
│
├── skills/
│   ├── core/                       # Core ACT skills
│   │   ├── phases/                 # 7 phases (existing)
│   │   ├── planning/               # Planning patterns
│   │   ├── execution/              # Execution patterns
│   │   └── verification/           # Verification patterns
│   │
│   ├── context-engineering/        # From Planning Files
│   │   ├── 3-file-pattern/
│   │   ├── session-recovery/
│   │   └── context-handoff/
│   │
│   ├── learning/                   # From Everything CC
│   │   ├── continuous-learning/
│   │   └── instincts/
│   │
│   ├── quality/                    # From Superpowers + CEK
│   │   ├── iron-laws/
│   │   ├── reflexion/
│   │   └── tdd/
│   │
│   └── thinking/                   # From TÂCHES
│       └── models/                 # 12 thinking models
│
├── agents/                         # Specialized agents
│   ├── planner.md                  # (opus)
│   ├── architect.md                # (opus)
│   ├── executor.md                 # (sonnet)
│   ├── reviewer.md                 # (opus)
│   ├── tester.md                   # (sonnet)
│   └── documenter.md               # (haiku)
│
├── commands/
│   ├── act/                        # Main ACT commands
│   │   ├── init.md
│   │   ├── plan.md
│   │   ├── execute.md
│   │   ├── verify.md
│   │   └── complete.md
│   │
│   ├── quick/                      # Quick mode commands
│   │   └── quick.md
│   │
│   └── consider/                   # Thinking models
│       └── *.md
│
├── hooks/
│   └── hooks.json                  # Pre/Post/Stop hooks
│
├── rules/                          # Modular rules
│   ├── iron-laws.md
│   ├── deviation-rules.md
│   ├── tdd.md
│   └── verification.md
│
└── templates/                      # File templates
    ├── task_plan.md
    ├── findings.md
    └── progress.md
```

---

## ✅ Checklist d'Implémentation

### Phase 1 : Core (Tier 1)
- [ ] 3-File Pattern (context engineering)
- [ ] Hooks system (Pre/Post/Stop)
- [ ] Iron Laws (TDD, Debug, Verification)
- [ ] Scale-Adaptive (Quick vs Full)
- [ ] Deviation Rules (5 rules)
- [ ] Session Recovery
- [ ] Model Selection per agent

### Phase 2 : Enhanced (Tier 2)
- [ ] Continuous Learning v2
- [ ] Reflexion pattern
- [ ] Thinking Models (12)
- [ ] Context Handoff format
- [ ] 5-Question Reboot Test

### Phase 3 : Extended (Tier 3)
- [ ] Multi-IDE Support
- [ ] GitHub Integration
- [ ] Party Mode
- [ ] Agent Auditors

---

## 📝 Notes

1. **ACT reste "solo dev + Claude"** — Pas besoin des features enterprise de Claude-Flow
2. **Priorité = autonomie contrôlée** — L'agent peut avancer mais demande pour l'architectural
3. **Context engineering = fondation** — Sans ça, tout le reste s'effondre
4. **Multi-IDE = reach** — Plus d'utilisateurs potentiels

---

*Synthèse réalisée le 2026-02-01 par Archi*
*Basée sur l'analyse approfondie de 9 frameworks*
