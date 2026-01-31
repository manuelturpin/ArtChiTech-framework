# Analyse Approfondie : Planning with Files v2.13.0

**Date :** 2026-01-31  
**Repo :** https://github.com/OthmanAdi/planning-with-files  
**Auteur :** Ahmad Othman Ammar Adi  
**Priorité :** CRITIQUE (context engineering reference)

---

## 📊 Vue d'ensemble

**Type :** Context engineering skill basé sur Manus  
**Focus :** Fichiers persistants comme "mémoire de travail sur disque"  
**License :** MIT  
**Installation :** `claude plugins install OthmanAdi/planning-with-files`  
**Multi-IDE :** 14+ IDEs (Claude Code, Cursor, Gemini CLI, Moltbot, Kiro, Continue, Kilocode, OpenCode, Codex, FactoryAI, Antigravity, CodeBuddy, AdaL CLI)

**Origine :** Inspiré par Manus, l'agent IA acquis par Meta pour $2 milliards en décembre 2025.

---

## 🏗️ Architecture

### Structure des fichiers

```
planning-with-files/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── commands/
│   ├── plan.md            # /planning-with-files:plan
│   └── start.md           # /planning-with-files:start
├── skills/
│   └── planning-with-files/
│       ├── SKILL.md       # Skill principal avec hooks
│       ├── reference.md   # Principes Manus (6 principes)
│       ├── examples.md    # Exemples d'utilisation
│       ├── templates/     # 3 templates de fichiers
│       │   ├── task_plan.md
│       │   ├── findings.md
│       │   └── progress.md
│       └── scripts/
│           ├── init-session.sh
│           ├── init-session.ps1
│           ├── check-complete.sh
│           └── check-complete.ps1
├── scripts/
│   └── session-catchup.py  # Session recovery (v2.2.0+)
├── docs/                   # 17 guides par IDE
│   ├── quickstart.md
│   ├── workflow.md
│   ├── installation.md
│   ├── troubleshooting.md
│   ├── cursor.md
│   ├── gemini.md
│   ├── moltbot.md
│   ├── kiro.md
│   ├── continue.md
│   ├── kilocode.md
│   ├── opencode.md
│   ├── codex.md
│   ├── factory.md
│   ├── antigravity.md
│   ├── codebuddy.md
│   ├── adal.md
│   └── windows.md
├── .cursor/               # Cursor support
├── .gemini/               # Gemini CLI support
├── .moltbot/              # Moltbot support
├── .kiro/                 # Kiro steering files
├── .continue/             # Continue IDE support
├── .kilocode/             # Kilocode support
├── .opencode/             # OpenCode support
├── .codex/                # Codex support
├── .factory/              # FactoryAI Droid
├── .codebuddy/            # CodeBuddy
├── .adal/                 # AdaL CLI / Sylph AI
└── .agent/                # Generic agent format
```

---

## 📐 Le Core Pattern : 3-File System

### Philosophie

```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)

→ Anything important gets written to disk.
```

### Les 3 fichiers

| Fichier | Purpose | Quand mettre à jour |
|---------|---------|---------------------|
| `task_plan.md` | Phases, progress, decisions | Après chaque phase |
| `findings.md` | Research, discoveries | Après TOUTE découverte |
| `progress.md` | Session log, test results | Tout au long de la session |

### Template task_plan.md

```markdown
# Task Plan: [Brief Description]

## Goal
[One sentence describing the end state]

## Current Phase
Phase 1

## Phases
### Phase 1: Requirements & Discovery
- [ ] Understand user intent
- [ ] Identify constraints
- **Status:** in_progress

### Phase 2: Planning & Structure
- **Status:** pending

### Phase 3: Implementation
- **Status:** pending

### Phase 4: Testing & Verification
- **Status:** pending

### Phase 5: Delivery
- **Status:** pending

## Decisions Made
| Decision | Rationale |
|----------|-----------|

## Errors Encountered
| Error | Attempt | Resolution |
|-------|---------|------------|
```

### Template findings.md

```markdown
# Findings & Decisions

## Requirements
-

## Research Findings
-

## Technical Decisions
| Decision | Rationale |
|----------|-----------|

## Issues Encountered
| Issue | Resolution |
|-------|------------|

## Visual/Browser Findings
<!-- CRITICAL: Update after every 2 view/browser operations -->
-
```

### Template progress.md

```markdown
# Progress Log

## Session: [DATE]

### Phase 1: [Title]
- **Status:** in_progress
- **Started:** [timestamp]
- Actions taken:
  -
- Files created/modified:
  -

## Test Results
| Test | Input | Expected | Actual | Status |
|------|-------|----------|--------|--------|

## Error Log
| Timestamp | Error | Attempt | Resolution |
|-----------|-------|---------|------------|

## 5-Question Reboot Check
| Question | Answer |
|----------|--------|
| Where am I? | Phase X |
| Where am I going? | Remaining phases |
| What's the goal? | [goal statement] |
| What have I learned? | See findings.md |
| What have I done? | See above |
```

---

## 🔧 Hooks System

### Configuration dans SKILL.md

```yaml
hooks:
  PreToolUse:
    - matcher: "Write|Edit|Bash|Read|Glob|Grep"
      hooks:
        - type: command
          command: "cat task_plan.md 2>/dev/null | head -30 || true"
  PostToolUse:
    - matcher: "Write|Edit"
      hooks:
        - type: command
          command: "echo '[planning-with-files] File updated. If this completes a phase, update task_plan.md status.'"
  Stop:
    - hooks:
        - type: command
          command: |
            # Cross-platform script (bash/powershell)
            sh "$SCRIPT_DIR/check-complete.sh"
```

### Fonction de chaque hook

| Hook | Déclencheur | Action | Impact |
|------|-------------|--------|--------|
| **PreToolUse** | Avant Write/Edit/Bash/Read/Glob/Grep | Lit les 30 premières lignes de task_plan.md | **Rafraîchit les objectifs dans la fenêtre d'attention** |
| **PostToolUse** | Après Write/Edit | Rappelle de mettre à jour le status | Empêche d'oublier les mises à jour |
| **Stop** | Avant d'arrêter | Vérifie que toutes les phases sont complètes | **Empêche d'arrêter prématurément** |

### Importance du PreToolUse hook

**Problème résolu :** Après ~50 tool calls, le modèle oublie les objectifs originaux ("lost in the middle" effect).

**Solution :** Re-lire task_plan.md avant chaque action importante → les objectifs apparaissent en fin de contexte → reçoivent l'ATTENTION du modèle.

```
Début du contexte: [Objectif original - loin, oublié]
...beaucoup de tool calls...
Fin du contexte: [task_plan.md récemment lu - ATTENTION maximale!]
```

---

## 🔄 Session Recovery (v2.2.0+)

### Le problème

Quand le contexte se remplit et qu'on fait `/clear`, on perd tout ce qui a été fait depuis la dernière mise à jour des fichiers de planning.

### La solution : session-catchup.py

**Process :**
1. Détecte les sessions précédentes dans `~/.claude/projects/`
2. Trouve la dernière mise à jour des fichiers de planning
3. Extrait les conversations qui sont arrivées après
4. Affiche un rapport de "catchup"

**Usage :**
```bash
python3 ${CLAUDE_PLUGIN_ROOT}/scripts/session-catchup.py "$(pwd)"
```

**Workflow recommandé :**
1. Désactiver auto-compact dans Claude Code settings
2. Travailler jusqu'à ce que le contexte se remplisse
3. Faire `/clear`
4. Lancer `/planning-with-files` → récupère automatiquement le contexte perdu

---

## 📏 Les 6 Principes Manus

### Principe 1: Design Around KV-Cache

> "KV-cache hit rate is THE single most important metric for production AI agents."

**Statistiques :**
- Ratio input/output tokens : ~100:1
- Cached tokens : $0.30/MTok vs Uncached : $3/MTok
- **Différence de coût 10x !**

**Implémentation :**
- Garder les préfixes de prompt STABLES
- PAS de timestamps dans system prompts
- Contexte APPEND-ONLY avec sérialisation déterministe

### Principe 2: Mask, Don't Remove

Ne pas retirer dynamiquement les outils (casse le KV-cache). Utiliser logit masking à la place.

### Principe 3: Filesystem as External Memory

> "Markdown is my 'working memory' on disk."

```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
```

### Principe 4: Manipulate Attention Through Recitation

> "Creates and updates todo.md throughout tasks to push global plan into model's recent attention span."

Re-lire `task_plan.md` avant chaque décision → objectifs dans la fenêtre d'attention.

### Principe 5: Keep the Wrong Stuff In

> "Leave the wrong turns in the context."

**Pourquoi :**
- Les actions échouées avec stack traces permettent au modèle de mettre à jour ses croyances
- Réduit la répétition d'erreurs
- Error recovery = "signal le plus clair de VRAI comportement agentique"

### Principe 6: Don't Get Few-Shotted

> "Uniformity breeds fragility."

Introduire de la variation contrôlée dans les patterns répétitifs.

---

## 📋 Règles Critiques

### 1. Create Plan First (NON-NÉGOCIABLE)
Jamais commencer une tâche complexe sans `task_plan.md`.

### 2. The 2-Action Rule
> "After every 2 view/browser/search operations, IMMEDIATELY save key findings to text files."

Empêche la perte d'information visuelle/multimodale.

### 3. Read Before Decide
Avant les décisions majeures, relire le fichier plan. Garde les objectifs dans la fenêtre d'attention.

### 4. Update After Act
Après chaque phase :
- Marquer le status : `in_progress` → `complete`
- Logger les erreurs
- Noter les fichiers créés/modifiés

### 5. Log ALL Errors
Chaque erreur va dans le fichier plan. Construit la connaissance et empêche la répétition.

### 6. Never Repeat Failures
```
if action_failed:
    next_action != same_action
```

### 3-Strike Error Protocol

```
ATTEMPT 1: Diagnose & Fix
  → Read error carefully
  → Identify root cause
  → Apply targeted fix

ATTEMPT 2: Alternative Approach
  → Same error? Try different method
  → NEVER repeat exact same failing action

ATTEMPT 3: Broader Rethink
  → Question assumptions
  → Search for solutions

AFTER 3 FAILURES: Escalate to User
```

---

## 🔍 5-Question Reboot Test

Si vous pouvez répondre à ces questions, votre context management est solide :

| Question | Source de réponse |
|----------|-------------------|
| Where am I? | Current phase dans task_plan.md |
| Where am I going? | Remaining phases |
| What's the goal? | Goal statement dans task_plan.md |
| What have I learned? | findings.md |
| What have I done? | progress.md |

---

## 🌐 Support Multi-IDE (14+ IDEs)

| IDE | Format | Status |
|-----|--------|--------|
| Claude Code | Plugin + SKILL.md | ✅ Native |
| Cursor | Skills | ✅ Full |
| Gemini CLI | Agent Skills | ✅ Full |
| Moltbot | Workspace/Local Skills | ✅ Full |
| Kiro | Steering Files | ✅ Full |
| Continue | Skills + Prompt files | ✅ Full |
| Kilocode | Skills | ✅ Full |
| OpenCode | Personal/Project Skill | ✅ Full |
| Codex | Personal Skill | ✅ Full |
| FactoryAI Droid | Workspace/Personal | ✅ Full |
| Antigravity | Workspace/Personal | ✅ Full |
| CodeBuddy | Workspace/Personal | ✅ Full |
| AdaL CLI | Personal/Project Skills | ✅ Full |

**Pattern unique :** Un dossier par IDE avec le même contenu adapté au format spécifique.

---

## ✅ Forces

1. **Context Engineering** : 3 fichiers persistants comme mémoire externe
2. **Hooks automatiques** : PreToolUse/PostToolUse/Stop (100% reliable)
3. **Session Recovery** : Récupération automatique après /clear
4. **Multi-IDE** : 14+ IDEs supportés avec le même pattern
5. **Manus-backed** : Basé sur le framework à $2B
6. **Templates détaillés** : Avec commentaires explicatifs
7. **5-Question Reboot Test** : Vérification rapide du contexte
8. **3-Strike Protocol** : Gestion des erreurs structurée
9. **Cross-platform** : Scripts bash + PowerShell

---

## ❌ Faiblesses

1. **Pas de scale-adaptive** : Même pattern pour petit/gros projet
2. **Pas d'agents spécialisés** : Un seul skill, pas de multi-agent
3. **Pas de model profiles** : Pas de sélection de modèle par tâche
4. **Pas de learning** : Pas de continuous learning
5. **Manual updates required** : Doit penser à mettre à jour les fichiers
6. **2-Action Rule rigide** : Peut être overkill pour certains workflows

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **3-File Pattern** | task_plan.md, findings.md, progress.md | 🔴 |
| **PreToolUse hook** | Relire le plan avant actions | 🔴 |
| **Stop hook** | Vérifier completion avant d'arrêter | 🔴 |
| **5-Question Reboot Test** | Vérification rapide du contexte | 🔴 |
| **3-Strike Protocol** | Gestion des erreurs structurée | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Session Recovery** | Récupération après /clear | 🟠 |
| **Error Logging** | Log ALL errors with attempts | 🟠 |
| **Attention Manipulation** | Relire pour refresh goals | 🟠 |
| **Multi-IDE structure** | Un dossier par IDE | 🟠 |

### Tier 3 (COULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **2-Action Rule** | Save après 2 browser ops | 🟢 |
| **Visual/Browser Findings** | Section spécifique | 🟢 |
| **KV-Cache optimization** | Append-only context | 🟢 |

---

## 📝 Comparaison avec ACT Actuel

| Feature | Planning Files | ACT | Gap |
|---------|---------------|-----|-----|
| Fichiers persistants | ✅ 3 fichiers | ⚠️ .epct/ basic | À enrichir |
| Hooks | ✅ Pre/Post/Stop | ❌ | À implémenter |
| Session Recovery | ✅ | ❌ | À implémenter |
| Multi-IDE | ✅ 14+ | ❌ Claude Code only | À implémenter |
| Templates détaillés | ✅ | ⚠️ Basic | À enrichir |
| Phases | ✅ Dynamic (3-7) | ✅ 7 fixes | Comparable |
| Scale-adaptive | ❌ | ❌ | À implémenter |
| Agents | ❌ | ✅ via Superpowers | ACT ahead |

---

## 📁 Fichiers à Étudier Plus Tard

- `scripts/session-catchup.py` — Full session recovery implementation
- `.kiro/` — Steering files format (nouveau format)
- `.continue/` — Continue IDE integration patterns
- `docs/workflow.md` — Visual workflow diagram

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 4/9 — Planning with Files v2.13.0*
