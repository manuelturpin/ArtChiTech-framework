# Fix Brainstorming Workflow - Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Fix issue #4 - Le skill `superpowers:brainstorming` doit être invoqué quand l'utilisateur reprend une phase via texte libre.

**Architecture:** Ajouter un Step 3b dans `act-project.md` qui détecte les intentions de l'utilisateur via mots-clés et propose/invoque le brainstorming selon le contexte.

**Tech Stack:** Markdown (Claude Code command file)

**Issue:** [#4](https://github.com/manuelturpin/ArtChiTech-framework/issues/4)

**Language Rule:** Per CLAUDE.md - Plugin code/docs in **English**, keywords bilingual (FR+EN) for intent detection.

---

## Context

### Problème actuel

Le fichier `plugin/commands/act-project.md` gère le hub principal ACT. Quand l'utilisateur tape du texte libre comme "reprenons la phase discovery", Claude ne sait pas qu'il doit invoquer `superpowers:brainstorming`.

### Comportement actuel (buggy)

```
User: "reprenons la phase discovery"
Claude: [Travaille directement sur la checklist sans brainstorming]
```

### Comportement attendu (fixed)

```
User: "reprenons la phase discovery"
Claude: [Détecte l'intention] → [Propose brainstorming] → [Si oui, spawn superpowers:brainstorming]
```

### Fichiers concernés

| Fichier | Action |
|---------|--------|
| `plugin/commands/act-project.md` | Modifier (ajouter Step 3b) |

---

## Task 1: Lire et comprendre le fichier actuel

**Files:**
- Read: `plugin/commands/act-project.md`

**Step 1: Lire le fichier complet**

```bash
cat plugin/commands/act-project.md
```

**Step 2: Identifier où insérer Step 3b**

Chercher la section "Step 3: Handle Choice" (ligne ~126-136).
Le nouveau Step 3b doit être inséré APRÈS la table des choix.

**Step 3: Noter la structure actuelle**

Structure actuelle :
- Step 0: Check Local Project State
- Step 0b: Resolve ACT Path
- Step 1: Context Detection
- Step 2: Determine Context
- Step 3: Handle Choice ← On ajoute Step 3b ici

**Verification:** Tu comprends où le Step 3b doit être inséré.

---

## Task 2: Écrire le Step 3b (détection d'intention)

**Files:**
- Modify: `plugin/commands/act-project.md:136` (après la table des choix)

**Step 1: Ajouter la section Step 3b**

Insérer après la ligne `| 6 | Execute /onboard |` :

```markdown
## Step 3b: Handle Free Text Input

When the user types free text instead of a number, detect their intention:

### Intent Detection Keywords

| Intent | Keywords | Action |
|--------|----------|--------|
| **Resume phase** | "reprendre", "continuer", "retourner", "travailler sur", "resume", "continue" | Go to Phase Work flow |
| **Improve/Refine** | "améliorer", "modifier", "affiner", "improve", "refine", "update" | Go to Refinement flow |
| **Question** | "comment", "pourquoi", "qu'est-ce", "how", "why", "what" | Answer directly |

### Phase Work Flow

When user wants to resume/continue a phase:

1. Read current state to get phase info
2. Display:
   ```
   🔄 Resume phase: [phase-name]

   Would you like to use structured brainstorming to guide your thinking?

   1. ✅ Yes - Launch superpowers:brainstorming
   2. ⏭️  No - Continue directly with the checklist
   ```
3. If choice 1 → Spawn `superpowers:brainstorming` with phase context
4. If choice 2 → Display phase checklist from `references/phases/`

### Refinement Flow

When user wants to improve/refine something:

1. **Always** spawn `superpowers:brainstorming`
2. Pass the current phase and user's refinement request as context
```

**Step 2: Vérifier la syntaxe Markdown**

Le code ajouté doit :
- [ ] Avoir les bons niveaux de headers (##, ###)
- [ ] Les tables sont bien formatées
- [ ] Les code blocks utilisent les bons backticks

**Verification:** Le Step 3b est ajouté au fichier.

---

## Task 3: Mettre à jour la section Dependencies

**Files:**
- Modify: `plugin/commands/act-project.md:139` (section Dependencies)

**Step 1: Vérifier la section Dependencies existante**

La section actuelle dit :
```markdown
## Dependencies

This hub requires the `superpowers` plugin for advanced workflows.
```

**Step 2: Enrichir la documentation**

Remplacer par :

```markdown
## Dependencies

This hub requires the `superpowers` plugin for advanced workflows.

### Required Skills

| Skill | Usage |
|-------|-------|
| `superpowers:brainstorming` | New feature (choice 1), Resume phase (Step 3b), Refinement (Step 3b) |

### Skill Invocation Rules

| Context | Brainstorming |
|---------|---------------|
| Choice 1 (Add feature) | **Always** invoke |
| Resume phase (free text) | **Propose** (user chooses) |
| Refinement (free text) | **Always** invoke |
| Choice 2 (Quick fix) | Never invoke |
```

**Verification:** La section Dependencies documente clairement quand brainstorming est invoqué.

---

## Task 4: Test manuel - Cas "reprendre phase"

**Step 1: Installer le plugin localement**

```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
./scripts/install-local.sh
```

**Step 2: Aller dans un projet test avec .epct/**

```bash
cd test-apps/bonsai-tracker
```

**Step 3: Tester le scénario**

Lancer une nouvelle session Claude et taper :
```
reprenons la phase discovery
```

**Expected behavior:**
```
🔄 Resume phase: Discovery

Would you like to use structured brainstorming to guide your thinking?

1. ✅ Yes - Launch superpowers:brainstorming
2. ⏭️  No - Continue directly with the checklist
```

**Step 4: Tester le choix 1**

Répondre "1" et vérifier que `superpowers:brainstorming` est invoqué.

**Verification:** Le workflow fonctionne comme attendu.

---

## Task 5: Test manuel - Cas "améliorer"

**Step 1: Nouvelle session dans le même projet test**

```bash
cd test-apps/bonsai-tracker
```

**Step 2: Tester le scénario amélioration**

Taper :
```
je veux améliorer la définition du projet
```

**Expected behavior:**
- Claude détecte "améliorer" → Refinement flow
- `superpowers:brainstorming` est invoqué automatiquement (pas de question)

**Verification:** Le brainstorming est invoqué automatiquement pour les refinements.

---

## Task 6: Commit et fermer l'issue

**Step 1: Vérifier les changements**

```bash
git diff plugin/commands/act-project.md
```

**Step 2: Commit**

```bash
git add plugin/commands/act-project.md
git commit -m "fix(act-project): invoke brainstorming on free text phase resume

- Add Step 3b for free text intent detection
- Resume phase: propose brainstorming (user choice)
- Refinement: always invoke brainstorming
- Document skill invocation rules in Dependencies

Fixes #4

Co-Authored-By: Claude <noreply@anthropic.com>"
```

**Step 3: Push**

```bash
git push origin main
```

**Step 4: Fermer l'issue via GitHub CLI**

```bash
gh issue close 4 --comment "Fixed in commit $(git rev-parse --short HEAD). Added Step 3b for free text handling with brainstorming invocation rules."
```

**Verification:**
- [ ] Commit créé
- [ ] Push réussi
- [ ] Issue #4 fermée

---

## Summary

| Task | Description | Time |
|------|-------------|------|
| 1 | Lire et comprendre le fichier | 5 min |
| 2 | Écrire Step 3b | 15 min |
| 3 | Mettre à jour Dependencies | 5 min |
| 4 | Test manuel - reprendre phase | 10 min |
| 5 | Test manuel - améliorer | 5 min |
| 6 | Commit et fermer issue | 5 min |
| **Total** | | **~45 min** |

---

## Rollback Plan

Si le fix cause des problèmes :

```bash
git revert HEAD
git push origin main
gh issue reopen 4
```
