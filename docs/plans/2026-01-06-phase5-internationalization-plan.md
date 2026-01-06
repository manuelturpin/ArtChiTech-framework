# Phase 5 - Internationalization EN - Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Translate all ACT Framework files from French to English for international market.

**Architecture:** Translate layer by layer (commands → skills → agents → references), commit after each batch, test after each batch.

**Tech Stack:** Markdown, JSON, Python scripts (no code changes, only text translation)

---

## Batch 1: Commands + Config (Priority: HIGH)

### Task 1.1: Translate plugin.json

**Files:**
- Modify: `plugin/.claude-plugin/plugin.json`

**Step 1: Update plugin.json description to English**

```json
{
  "name": "act",
  "version": "1.1.0",
  "description": "ACT (ArtChiTech) - 7-phase project management framework for Claude Code. From Discovery to Growth.",
  "author": {
    "name": "Manuel Turpin",
    "email": "manuel.turpin@gmail.com",
    "url": "https://github.com/manuelturpin"
  },
  "homepage": "https://github.com/manuelturpin/ArtChiTech-framework",
  "repository": "https://github.com/manuelturpin/ArtChiTech-framework",
  "license": "MIT",
  "keywords": [
    "framework",
    "project-management",
    "phases",
    "audit",
    "onboarding",
    "methodology",
    "tdd"
  ],
  "dependencies": {
    "plugins": ["superpowers"]
  }
}
```

**Step 2: Verify JSON is valid**

Run: `cat plugin/.claude-plugin/plugin.json | python3 -m json.tool`
Expected: Valid JSON output without errors

---

### Task 1.2: Translate README.md

**Files:**
- Modify: `plugin/README.md`

**Step 1: Translate entire README to English**

Key translations:
- "Framework de suivi et realisation de projets" → "7-phase project management framework"
- "Prerequis" → "Prerequisites"
- "Commandes" → "Commands"
- "Hub principal" → "Main hub"
- "Auditer et initialiser" → "Audit and initialize"
- "Voir l'etat complet" → "View complete status"
- "Passer a la phase suivante" → "Move to next phase"
- "Corriger les problemes" → "Fix issues"
- "Reprendre une session" → "Resume session"
- "Aide contextuelle" → "Contextual help"
- "Nouveau projet from scratch" → "New project from scratch"
- "Nouvelle fonctionnalite" → "New feature"
- "Bugfix ou refactoring" → "Bugfix or refactoring"
- "Etat courant" → "Current state"
- "Lancer les tests" → "Run tests"

---

### Task 1.3: Translate /project command (projet.md)

**Files:**
- Modify: `plugin/commands/projet.md`

**Step 1: Update frontmatter**

```yaml
---
name: project
description: ACT main hub - Single entry point for managing projects (new, feature, refactor, status)
---
```

**Step 2: Translate all French text to English**

Key translations:
- "Hub Principal ACT" → "ACT Main Hub"
- "Detection du Contexte" → "Context Detection"
- "Determiner le Contexte" → "Determine Context"
- "Nouveau Projet" → "New Project"
- "Aucun projet actif detecte" → "No active project detected"
- "Demarrer un nouveau projet" → "Start a new project"
- "En savoir plus sur le framework" → "Learn more about the framework"
- "Projet existant detecte" → "Existing project detected"
- "Lancement de l'audit initial" → "Launching initial audit"
- "Que voulez-vous faire ?" → "What would you like to do?"
- "Ajouter une feature" → "Add a feature"
- "Refactoring/Quick fix" → "Refactoring/Quick fix"
- "Voir checklist phase actuelle" → "View current phase checklist"
- "Passer a la phase suivante" → "Move to next phase"
- "Voir status complet" → "View complete status"
- "Re-auditer le projet" → "Re-audit project"

---

### Task 1.4: Translate /onboard command

**Files:**
- Modify: `plugin/commands/onboard.md`

**Step 1: Update frontmatter and translate content**

Key translations:
- All French UI text to English
- Keep technical terms (TDD, MVP, etc.)

---

### Task 1.5: Translate /status command

**Files:**
- Modify: `plugin/commands/status.md`

---

### Task 1.6: Translate /next command

**Files:**
- Modify: `plugin/commands/next.md`

---

### Task 1.7: Translate /fix command

**Files:**
- Modify: `plugin/commands/fix.md`

---

### Task 1.8: Translate /resume command

**Files:**
- Modify: `plugin/commands/resume.md`

---

### Task 1.9: Translate /help command

**Files:**
- Modify: `plugin/commands/help.md`

---

### Task 1.10: Commit Batch 1

**Step 1: Stage all changes**

```bash
git add plugin/.claude-plugin/plugin.json plugin/README.md plugin/commands/
```

**Step 2: Commit**

```bash
git commit -m "feat(i18n): translate commands and config to English"
```

---

## Batch 2: Skills (Priority: HIGH)

### Task 2.1: Review skills (already in English)

**Files:**
- Review: `plugin/skills/project-detection/SKILL.md` ✓ Already English
- Review: `plugin/skills/state-management/SKILL.md`
- Review: `plugin/skills/phase-scoring/SKILL.md`
- Review: `plugin/skills/phase-scoring/references/scoring-rules.md`

**Step 1: Check if any French text remains**

Run: `grep -r "Objectif\|Utilisation\|Resultat" plugin/skills/`

**Step 2: Translate any remaining French text**

---

### Task 2.2: Commit Batch 2

```bash
git add plugin/skills/
git commit -m "feat(i18n): ensure skills are fully in English"
```

---

## Batch 3: Agents (Priority: MEDIUM)

### Task 3.1: Translate chunk-manager.md

**Files:**
- Modify: `plugin/agents/chunk-manager.md`

---

### Task 3.2: Translate context-manager.md

**Files:**
- Modify: `plugin/agents/context-manager.md`

---

### Task 3.3: Translate error-tracker.md

**Files:**
- Modify: `plugin/agents/error-tracker.md`

---

### Task 3.4: Translate phase-controller.md

**Files:**
- Modify: `plugin/agents/phase-controller.md`

---

### Task 3.5: Translate projet-orchestrator.md → project-orchestrator.md

**Files:**
- Rename: `plugin/agents/projet-orchestrator.md` → `plugin/agents/project-orchestrator.md`
- Modify: content to English

**Step 1: Rename file**

```bash
mv plugin/agents/projet-orchestrator.md plugin/agents/project-orchestrator.md
```

**Step 2: Translate content**

---

### Task 3.6: Translate tips-engine.md

**Files:**
- Modify: `plugin/agents/tips-engine.md`

---

### Task 3.7: Commit Batch 3

```bash
git add plugin/agents/
git commit -m "feat(i18n): translate agents to English"
```

---

## Batch 4: References (Priority: MEDIUM)

### Task 4.1: Rename and translate phase files

**Files to rename:**
- `2-strategie.md` → `2-strategy.md`
- `3-conception.md` → `3-design.md`
- `4-developpement.md` → `4-development.md`
- `5-qualite.md` → `5-quality.md`
- `6-lancement.md` → `6-launch.md`
- `7-croissance.md` → `7-growth.md`

**Step 1: Rename files**

```bash
cd plugin/references/phases
mv 2-strategie.md 2-strategy.md
mv 3-conception.md 3-design.md
mv 4-developpement.md 4-development.md
mv 5-qualite.md 5-quality.md
mv 6-lancement.md 6-launch.md
mv 7-croissance.md 7-growth.md
```

**Step 2: Translate each file content**

Phase name translations:
| French | English |
|--------|---------|
| Stratégie | Strategy |
| Conception | Design |
| Développement | Development |
| Qualité | Quality |
| Lancement | Launch |
| Croissance | Growth |

Common translations:
- "Objectif" → "Objective"
- "Checklist" → "Checklist"
- "Anti-Patterns" → "Anti-Patterns"
- "Outils Recommandés" → "Recommended Tools"
- "Métriques Clés" → "Key Metrics"
- "Transition" → "Transition"
- "Conditions Go" → "Go Conditions"

---

### Task 4.2: Translate scoring-criteria.md

**Files:**
- Modify: `plugin/references/scoring/scoring-criteria.md`

---

### Task 4.3: Translate recommendations-by-type.md

**Files:**
- Modify: `plugin/references/recommendations/recommendations-by-type.md`

---

### Task 4.4: Translate report-templates.md

**Files:**
- Modify: `plugin/references/templates/report-templates.md`

---

### Task 4.5: Commit Batch 4

```bash
git add plugin/references/
git commit -m "feat(i18n): translate references to English"
```

---

## Final: Verification & Tag

### Task 5.1: Run all tests

```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
bash plugin/tests/run_all_tests.sh
```

Expected: All tests pass

---

### Task 5.2: Test plugin manually

```bash
./scripts/install-local.sh
```

Then test:
- `/project` - Should show English menu
- `/status` - Should show English output
- `/help` - Should show English help

---

### Task 5.3: Final commit and tag

```bash
git add -A
git commit -m "feat(i18n): complete Phase 5 internationalization to English"
git tag -a v1.1.0 -m "v1.1.0 - Full English internationalization"
```

---

## Summary

| Batch | Files | Tasks |
|-------|-------|-------|
| 1: Commands + Config | 9 | 1.1 - 1.10 |
| 2: Skills | 4 | 2.1 - 2.2 |
| 3: Agents | 6 | 3.1 - 3.7 |
| 4: References | 10 | 4.1 - 4.5 |
| 5: Verification | - | 5.1 - 5.3 |

**Total: ~29 files, 19 tasks**
