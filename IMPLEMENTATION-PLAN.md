# Framework Projet Claude Code - Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.
>
> **For Session Resume:** This project uses git worktrees. See "Session Resume Instructions" section below.

**Goal:** Créer un framework de gestion de projet complet pour Claude Code qui transforme 167K mots de recherche en 6 commandes utilisateur simples avec persistance de contexte entre sessions.

**Architecture:** Framework basé sur skills Claude Code avec orchestrateur central, gestion de session persistante (.epct/state.json), pattern chunk-test-fix, et intégration automatique des skills superpowers. Le framework guide les utilisateurs à travers 7 phases (Discovery → Croissance) avec documentation condensée chargée contextuellement.

**Tech Stack:**
- Claude Code skills (Markdown + YAML frontmatter)
- JSON pour persistance d'état (.epct/)
- Skills superpowers existants (brainstorming, TDD, code-review, etc.)
- Git worktrees pour isolation développement

---

## Session Resume Instructions

**À CHAQUE DÉBUT DE SESSION, LIRE CECI :**

1. **Vérifier le worktree actuel** :
   ```bash
   pwd  # Doit être dans le worktree, pas le repo principal
   git branch  # Doit être sur la branche feature
   ```

2. **Lire l'état d'avancement** :
   - Lire `.epct/implementation-state.json` pour voir où nous en sommes
   - Lire la dernière section complétée dans ce fichier (chercher ✅)
   - Reprendre à la première tâche marquée ⏸️ PAUSE

3. **Contexte rapide** :
   - Framework = 6 commandes (/projet, /resume, /status, /fix, /next, /help)
   - Architecture = Orchestrateur + Skills + Persistance
   - Pattern = Chunk-Test-Fix avec TDD automatique

4. **Continuer l'implémentation** :
   - Suivre les tâches dans l'ordre
   - Marquer ✅ DONE quand terminé
   - Marquer ⏸️ PAUSE si interruption
   - Commit fréquemment

---

## Documents de Référence

**Design complet** : `plan-framework-projet.md` (634 lignes)

**Recherche et réconciliation** :
- `/extractions/` : 7 fichiers d'extraction (phases 1-7)
- `/reconciliation/mapping-recherche-framework.md` : Gaps identifiés
- `/reconciliation/plan-framework-projet-v2.md` : Framework enrichi (559 lignes)
- `/reconciliation/todo-implementation.md` : 18 tâches priorisées

**Plan Claude** : `/Users/manuelturpin/.claude/plans/sprightly-nibbling-meadow.md`

---

## Phase 0 : Setup Worktree

### Task 0.1: Create Worktree for Development

**Files:**
- Create worktree directory outside main repo

**Step 1: Create worktree branch**

```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
git worktree add ../lab-13-framework-dev -b framework/implementation
```

Expected: Nouvelle branche créée, worktree dans `../lab-13-framework-dev`

**Step 2: Navigate to worktree**

```bash
cd ../lab-13-framework-dev
pwd
```

Expected: `/Users/manuelturpin/Desktop/bonsai974/claude/lab-13-framework-dev`

**Step 3: Verify clean state**

```bash
git status
git branch
```

Expected: Sur branche `framework/implementation`, working tree clean

**Step 4: Create implementation state tracker**

Create: `.epct/implementation-state.json`

```json
{
  "project": "framework-projet-claude-code",
  "worktree": "../lab-13-framework-dev",
  "branch": "framework/implementation",
  "startedAt": "2026-01-04T00:00:00Z",
  "currentPhase": 1,
  "currentTask": "1.1",
  "completedTasks": [],
  "status": "in_progress"
}
```

**Step 5: Commit setup**

```bash
git add .epct/implementation-state.json
git commit -m "chore: setup worktree and implementation tracking"
```

---

## Phase 1 : Fondations - Gestion Session & Contexte

**Objectif** : Système de persistance fonctionnel pour préserver le contexte entre sessions

### Task 1.1: Create .epct/ Directory Structure

**Files:**
- Create: `.epct/state.json`
- Create: `.epct/checkpoints/.gitkeep`
- Create: `.epct/errors/active/.gitkeep`
- Create: `.epct/errors/resolved/.gitkeep`
- Create: `.epct/session/current.json`
- Create: `.epct/session/recovery.json`
- Create: `.epct/history/.gitkeep`
- Create: `.epct/context/.gitkeep`

**Step 1: Create directory structure**

```bash
mkdir -p .epct/{checkpoints,errors/{active,resolved},session,history,context}
```

**Step 2: Create state.json template**

Create: `.epct/state.json`

```json
{
  "project": {
    "name": "",
    "type": "",
    "created": ""
  },
  "currentPhase": 0,
  "phaseName": "",
  "progress": {
    "phase": 0,
    "overall": 0
  },
  "currentChunk": null,
  "errors": {
    "active": 0,
    "blocking": false
  },
  "lastAction": null,
  "session": {
    "tokensEstimated": 0,
    "contextRemaining": "100%"
  }
}
```

**Step 3: Create session tracking files**

Create: `.epct/session/current.json`

```json
{
  "sessionId": "",
  "startedAt": "",
  "tokensUsed": 0,
  "commandsExecuted": [],
  "active": true
}
```

Create: `.epct/session/recovery.json`

```json
{
  "lastCheckpoint": null,
  "canRecover": false,
  "recoveryInstructions": ""
}
```

**Step 4: Create .gitkeep files**

```bash
touch .epct/checkpoints/.gitkeep
touch .epct/errors/active/.gitkeep
touch .epct/errors/resolved/.gitkeep
touch .epct/history/.gitkeep
touch .epct/context/.gitkeep
```

**Step 5: Commit structure**

```bash
git add .epct/
git commit -m "feat: create .epct/ directory structure for state persistence"
```

### Task 1.2: Create Context Manager Skill

**Files:**
- Create: `src/skills/context-manager.md`

**Step 1: Create src/skills directory**

```bash
mkdir -p src/skills
```

**Step 2: Write context-manager skill**

Create: `src/skills/context-manager.md`

```markdown
---
name: context-manager
description: Gère le contexte de session et la persistance d'état pour éviter la perte de contexte entre sessions Claude Code
---

# Context Manager

## Responsabilités

1. **Lecture/Écriture état** : Gestion de `.epct/state.json`
2. **Estimation tokens** : Tracking utilisation contexte
3. **Checkpoints** : Sauvegarde automatique à intervalles critiques
4. **Recovery** : Restauration contexte après interruption

## Utilisation Interne

Appelé automatiquement par :
- `/resume` : Restaure contexte session précédente
- `/status` : Lit état actuel + crée checkpoint
- Orchestrateur : Updates état après chaque action

## État Management

### Lire l'état actuel

```typescript
function readState(): ProjectState {
  const statePath = '.epct/state.json'
  if (!fileExists(statePath)) {
    return initializeNewState()
  }
  return JSON.parse(readFile(statePath))
}
```

### Mettre à jour l'état

```typescript
function updateState(updates: Partial<ProjectState>): void {
  const current = readState()
  const updated = { ...current, ...updates }
  writeFile('.epct/state.json', JSON.stringify(updated, null, 2))
}
```

### Créer un checkpoint

```typescript
function createCheckpoint(name: string): void {
  const state = readState()
  const timestamp = new Date().toISOString()
  const checkpointPath = `.epct/checkpoints/${timestamp}-${name}.json`

  writeFile(checkpointPath, JSON.stringify({
    name,
    timestamp,
    state,
    context: getCurrentContext()
  }, null, 2))

  updateRecoveryInfo(checkpointPath)
}
```

### Estimer tokens utilisés

```typescript
function estimateTokens(): number {
  // Heuristique simple : 1 token ≈ 4 caractères
  const session = readFile('.epct/session/current.json')
  const sessionData = JSON.parse(session)
  return sessionData.commandsExecuted.reduce((total, cmd) => {
    return total + (cmd.outputLength / 4)
  }, 0)
}
```

## Événements de Checkpoint

| Événement | Trigger | Nom checkpoint |
|-----------|---------|----------------|
| Chunk complété | Après tests verts | `chunk-${chunkName}` |
| Commande /status | Utilisateur explicite | `user-status` |
| Transition phase | Avant Go/No-Go | `phase-${n}-complete` |
| Erreur détectée | Nouveau fichier erreur | `error-${errorId}` |
| Contexte < 30% | Estimation tokens | `low-context` |

## Tips Contextuels

```typescript
function shouldShowTip(): TipType | null {
  const state = readState()
  const tokens = estimateTokens()
  const contextRemaining = (200000 - tokens) / 200000

  if (contextRemaining < 0.3) {
    return 'LOW_CONTEXT'
  }

  if (state.errors.active > 0 && hoursSinceLastError() > 1) {
    return 'PENDING_ERROR'
  }

  if (isPhaseChecklistComplete() && !state.lastAction?.type.includes('go-no-go')) {
    return 'READY_FOR_NEXT'
  }

  return null
}
```

## Recovery Process

1. Lire `.epct/session/recovery.json`
2. Si `canRecover === true`, charger dernier checkpoint
3. Afficher résumé : phase, dernier chunk, erreurs
4. Proposer continuation ou nouveau départ

```typescript
function recoverSession(): RecoveryInfo {
  const recovery = JSON.parse(readFile('.epct/session/recovery.json'))

  if (!recovery.canRecover) {
    return { success: false, message: 'No recovery point available' }
  }

  const checkpoint = JSON.parse(readFile(recovery.lastCheckpoint))

  return {
    success: true,
    phase: checkpoint.state.phaseName,
    lastChunk: checkpoint.state.currentChunk,
    errors: checkpoint.state.errors.active,
    instructions: recovery.recoveryInstructions
  }
}
```

</markdown>
```

**Step 3: Commit skill**

```bash
git add src/skills/context-manager.md
git commit -m "feat(skills): add context-manager for session persistence"
```

### Task 1.3: Create /resume Command

**Files:**
- Create: `src/cli/resume.md`

**Step 1: Create cli directory**

```bash
mkdir -p src/cli
```

**Step 2: Write /resume command**

Create: `src/cli/resume.md`

```markdown
---
name: resume
command: /resume
description: Reprend la session précédente en restaurant le contexte et l'état du projet
---

# /resume - Reprendre Session

## Comportement

1. Lit `.epct/session/recovery.json`
2. Charge le dernier checkpoint si disponible
3. Affiche résumé de la dernière session
4. Propose de continuer ou recommencer

## Affichage

```
📍 Dernière session : il y a 2h
   Phase : Développement (4/7)
   Dernier chunk : UserService.update ✅
   Prochain : UserService.delete
   Erreurs en attente : 0

   Continuer avec UserService.delete ? (o/n)
```

## Implémentation

```typescript
async function executeResumeCommand() {
  // 1. Utiliser context-manager pour recovery
  const recovery = await skillCall('context-manager', 'recoverSession')

  if (!recovery.success) {
    print("Aucune session précédente trouvée.")
    print("Utilisez /projet pour démarrer un nouveau projet.")
    return
  }

  // 2. Afficher résumé
  const timeSince = getTimeSince(recovery.checkpoint.timestamp)
  print(`📍 Dernière session : ${timeSince}`)
  print(`   Phase : ${recovery.phase}`)

  if (recovery.lastChunk) {
    print(`   Dernier chunk : ${recovery.lastChunk.method} ✅`)
    print(`   Prochain : ${getNextChunk()}`)
  }

  print(`   Erreurs en attente : ${recovery.errors}`)
  print()

  // 3. Proposer continuation
  if (recovery.errors > 0) {
    print(`   ⚠️  Il y a ${recovery.errors} erreur(s) en attente.`)
    print(`   Recommandation : /fix avant de continuer`)
    print()
  }

  const answer = await askUser("Continuer où vous en étiez ? (o/n)")

  if (answer === 'o') {
    await skillCall('context-manager', 'restoreContext', recovery.checkpoint)
    print("✅ Contexte restauré. Prêt à continuer.")

    if (recovery.errors === 0 && recovery.nextChunk) {
      print(`💡 Prochain : implémenter ${recovery.nextChunk}`)
    }
  } else {
    print("Session non restaurée. Utilisez /projet pour démarrer.")
  }
}
```

## Cas Spéciaux

### Aucune session précédente

```
Aucune session précédente trouvée.
Utilisez /projet pour démarrer un nouveau projet.
```

### Erreurs en attente

```
📍 Dernière session : il y a 30 min
   Phase : Développement
   Dernier chunk : UserService.create ❌

   ⚠️  1 erreur en attente : assertion failed

   Recommandation : /fix avant de continuer

   Voir l'erreur maintenant ? (o/n)
```

### Contexte incomplet (> 7 jours)

```
📍 Session trouvée mais ancienne (il y a 8 jours)

   ⚠️  Le contexte peut être incomplet.
   Recommander : /status pour voir l'état puis décider.

   Tenter restauration ? (o/n)
```

</markdown>
```

**Step 3: Commit command**

```bash
git add src/cli/resume.md
git commit -m "feat(cli): add /resume command for session recovery"
```

### Task 1.4: Create /status Command

**Files:**
- Create: `src/cli/status.md`

**Step 1: Write /status command**

Create: `src/cli/status.md`

```markdown
---
name: status
command: /status
description: Affiche l'état actuel du projet, la progression, et crée un checkpoint
---

# /status - État du Projet

## Comportement

1. Lit `.epct/state.json`
2. Calcule progression phase et globale
3. Liste tâches en cours, erreurs, prochaines étapes
4. Crée checkpoint automatique
5. Affiche tips contextuels si pertinent

## Affichage

```
╭─────────────────────────────────────────────────────╮
│  🚀 mon-app | Phase: Développement (4/7)           │
├─────────────────────────────────────────────────────┤
│  Progression phase : ████████░░░░░░░░ 52%          │
│  Santé projet      : 🟢 Vert (0 bloqueurs)         │
├─────────────────────────────────────────────────────┤
│  EN COURS (2)                                       │
│  ├─ 🔄 Implémenter UserService [chunk 2/4]         │
│  └─ 🔄 Tests unitaires auth module                 │
│                                                     │
│  ERREURS À CORRIGER (0)                            │
│                                                     │
│  PROCHAINES (3)                                    │
│  ├─ ○ Integration tests UserService                │
│  ├─ ○ Implémenter ProductService                   │
│  └─ ○ ...                                          │
╰─────────────────────────────────────────────────────╯

💡 Contexte : 65% restant. Bon pour continuer.

✅ Checkpoint créé : user-status
```

## Implémentation

```typescript
async function executeStatusCommand() {
  // 1. Lire état
  const state = await skillCall('context-manager', 'readState')

  // 2. Calculer métriques
  const phaseProgress = calculatePhaseProgress(state)
  const overallProgress = calculateOverallProgress(state)
  const health = determineProjectHealth(state)

  // 3. Afficher status box
  printBox({
    title: `🚀 ${state.project.name} | Phase: ${state.phaseName} (${state.currentPhase}/7)`,
    sections: [
      {
        label: 'Progression phase',
        value: progressBar(phaseProgress) + ` ${phaseProgress}%`
      },
      {
        label: 'Santé projet',
        value: healthIndicator(health)
      }
    ]
  })

  // 4. Lister tâches
  const inProgress = await getTasks('in_progress')
  const errors = await getErrors('active')
  const upcoming = await getTasks('upcoming', 3)

  printSection('EN COURS', inProgress)
  printSection('ERREURS À CORRIGER', errors)
  printSection('PROCHAINES', upcoming)

  // 5. Tips contextuels
  const tip = await skillCall('context-manager', 'shouldShowTip')
  if (tip) {
    print()
    printTip(tip)
  }

  // 6. Créer checkpoint
  await skillCall('context-manager', 'createCheckpoint', 'user-status')
  print()
  print('✅ Checkpoint créé : user-status')
}
```

## Calculs

### Progression Phase

```typescript
function calculatePhaseProgress(state: ProjectState): number {
  const checklist = getPhaseChecklist(state.currentPhase)
  const completed = checklist.filter(item => item.done).length
  return Math.round((completed / checklist.length) * 100)
}
```

### Santé Projet

```typescript
type Health = 'green' | 'yellow' | 'red'

function determineProjectHealth(state: ProjectState): Health {
  const blocking = state.errors.active > 0 && state.errors.blocking
  const stale = hoursSinceLastAction() > 24
  const contextLow = getContextRemaining() < 0.2

  if (blocking) return 'red'
  if (stale || contextLow) return 'yellow'
  return 'green'
}
```

## Indicateurs Santé

- 🟢 **Vert** : 0 bloqueurs, contexte OK, actif < 24h
- 🟡 **Jaune** : Avertissements (contexte bas, inactif, erreurs non-bloquantes)
- 🔴 **Rouge** : Bloqueurs actifs (erreurs critiques, tests fail, etc.)

</markdown>
```

**Step 2: Commit command**

```bash
git add src/cli/status.md
git commit -m "feat(cli): add /status command for project state visibility"
```

**Step 3: Update implementation state**

Modify: `.epct/implementation-state.json`

```json
{
  "project": "framework-projet-claude-code",
  "worktree": "../lab-13-framework-dev",
  "branch": "framework/implementation",
  "startedAt": "2026-01-04T00:00:00Z",
  "currentPhase": 1,
  "currentTask": "2.1",
  "completedTasks": ["0.1", "1.1", "1.2", "1.3", "1.4"],
  "status": "in_progress",
  "lastUpdated": "2026-01-04T01:00:00Z"
}
```

**Step 4: Commit progress**

```bash
git add .epct/implementation-state.json
git commit -m "chore: update implementation progress (Phase 1 complete)"
```

---

## Phase 2 : Workflow Dev - Pattern Chunk-Test-Fix

**Objectif** : Pattern chunk-test-fix opérationnel avec intégration TDD automatique

### Task 2.1: Create Chunk Manager Skill

**Files:**
- Create: `src/skills/chunk-manager.md`

**Step 1: Write chunk-manager skill**

Create: `src/skills/chunk-manager.md`

```markdown
---
name: chunk-manager
description: Découpe le travail en chunks testables et gère le workflow chunk-test-fix avec intégration TDD automatique
---

# Chunk Manager

## Responsabilités

1. **Découpage automatique** : Identifier chunks (fonctions/méthodes ~50 lignes)
2. **Workflow TDD** : Orchestrer RED → GREEN → REFACTOR par chunk
3. **Tracking progression** : Suivre chunks complétés vs restants
4. **Blocage sur erreur** : Empêcher avancement si tests échouent

## Définition d'un Chunk

Un chunk est :
- 1 fonction OU 1 méthode
- Maximum ~50 lignes de code
- Testable de manière isolée
- Responsabilité unique (SRP)

## Workflow par Chunk

```
┌─────────────┐    ┌─────────┐    ┌─────────┐
│ Implémenter │───▶│ Tester  │───▶│  Vert?  │
│  1 chunk    │    │ le chunk│    │         │
└─────────────┘    └─────────┘    └────┬────┘
                                       │
                         ┌─────────────┴─────────────┐
                         │                           │
                        OUI                         NON
                         │                           │
                         ▼                           ▼
                   ┌───────────┐            ┌──────────────┐
                   │  Chunk    │            │ Fix erreur   │
                   │  suivant  │            │ avant suite  │
                   └───────────┘            └──────────────┘
```

## Implémentation

### Identifier les chunks

```typescript
function identifyChunks(file: string, feature: string): Chunk[] {
  // Analyse du code pour identifier méthodes/fonctions
  const ast = parseFile(file)
  const methods = extractMethods(ast)

  return methods.map(method => ({
    file,
    name: method.name,
    lineStart: method.lineStart,
    lineEnd: method.lineEnd,
    size: method.lineEnd - method.lineStart,
    dependencies: method.dependencies,
    status: 'pending'
  }))
}
```

### Exécuter workflow chunk

```typescript
async function executeChunkWorkflow(chunk: Chunk): Promise<ChunkResult> {
  // 1. Activer TDD skill
  await skillCall('superpowers:test-driven-development', 'activate')

  // 2. RED : Écrire test qui échoue
  print(`\n🔴 RED: Writing failing test for ${chunk.name}`)
  const testFile = await writeTest(chunk)
  const redResult = await runTest(testFile)

  if (redResult.passed) {
    throw new Error('Test should fail initially (RED phase)')
  }

  // 3. GREEN : Implémenter minimum
  print(`\n🟢 GREEN: Implementing ${chunk.name}`)
  await implementChunk(chunk)
  const greenResult = await runTest(testFile)

  if (!greenResult.passed) {
    // Erreur détectée → bloquer
    await skillCall('error-tracker', 'recordError', {
      chunk: chunk.name,
      test: testFile,
      error: greenResult.error
    })
    return { status: 'failed', error: greenResult.error }
  }

  // 4. REFACTOR (optionnel si simple)
  print(`\n🔧 REFACTOR: Reviewing ${chunk.name}`)
  const needsRefactor = await shouldRefactor(chunk)
  if (needsRefactor) {
    await refactorChunk(chunk)
    await runTest(testFile) // Re-verify after refactor
  }

  // 5. Commit
  await gitCommit([chunk.file, testFile], `feat: implement ${chunk.name}`)

  // 6. Update state
  await skillCall('context-manager', 'updateState', {
    currentChunk: {
      file: chunk.file,
      method: chunk.name,
      status: 'completed'
    }
  })

  return { status: 'success' }
}
```

### Proposer chunk suivant

```typescript
function getNextChunk(): Chunk | null {
  const chunks = loadChunks()
  const pending = chunks.filter(c => c.status === 'pending')

  if (pending.length === 0) {
    return null
  }

  // Prioriser par dépendances (chunks sans dépendances d'abord)
  const independent = pending.filter(c => c.dependencies.length === 0)
  return independent[0] || pending[0]
}
```

## Intégration avec Error Tracker

Si test échoue :
1. Créer fichier erreur dans `.epct/errors/active/`
2. Bloquer progression (ne pas proposer chunk suivant)
3. Afficher message : "❌ Tests failed. Use /fix to resolve before continuing."

## Messages Utilisateur

### Chunk démarré

```
🔄 Starting chunk: UserService.create
   File: src/services/UserService.ts:42-89
   Size: 47 lines
   Dependencies: 0

🔴 RED phase: Writing failing test...
```

### Chunk réussi

```
✅ Chunk complete: UserService.create
   Tests: ✅ PASSING
   Committed: feat: implement UserService.create

💡 Next chunk: UserService.update (3 remaining)
```

### Chunk échoué

```
❌ Chunk failed: UserService.create
   Tests: ❌ FAILING
   Error: Expected user.email to be defined

⚠️  Fix required before continuing.
   Use /fix to debug and resolve.
```

</markdown>
```

**Step 2: Commit skill**

```bash
git add src/skills/chunk-manager.md
git commit -m "feat(skills): add chunk-manager for TDD workflow automation"
```

### Task 2.2: Create Error Tracker Skill

**Files:**
- Create: `src/skills/error-tracker.md`

**Step 1: Write error-tracker skill**

Create: `src/skills/error-tracker.md`

```markdown
---
name: error-tracker
description: Track et priorise les erreurs, empêche progression tant qu'erreurs critiques non résolues
---

# Error Tracker

## Responsabilités

1. **Enregistrement erreurs** : Créer fichiers `.epct/errors/active/`
2. **Priorisation** : Déterminer si erreur bloquante
3. **Historique** : Déplacer vers `resolved/` quand fixé
4. **Alerts** : Notifier si erreurs anciennes non traitées

## Structure Erreur

```json
{
  "id": "001",
  "type": "assertion_failed",
  "chunk": "UserService.create",
  "file": "src/services/UserService.ts",
  "line": 42,
  "message": "Expected user.email to be defined",
  "stackTrace": "...",
  "context": {
    "phase": 4,
    "attemptedFixes": 0
  },
  "severity": "critical",
  "blocking": true,
  "created": "2026-01-04T14:30:00Z"
}
```

## Implémentation

### Enregistrer erreur

```typescript
async function recordError(error: ErrorInfo): Promise<string> {
  const errorId = generateErrorId()
  const errorPath = `.epct/errors/active/${errorId}.json`

  const errorRecord = {
    id: errorId,
    type: classifyError(error),
    chunk: error.chunk,
    file: error.file,
    line: error.line,
    message: error.message,
    stackTrace: error.stackTrace,
    context: {
      phase: getCurrentPhase(),
      attemptedFixes: 0
    },
    severity: determineSeverity(error),
    blocking: isBlocking(error),
    created: new Date().toISOString()
  }

  await writeFile(errorPath, JSON.stringify(errorRecord, null, 2))

  // Update state
  await skillCall('context-manager', 'updateState', {
    errors: {
      active: countActiveErrors() + 1,
      blocking: errorRecord.blocking
    }
  })

  return errorId
}
```

### Résoudre erreur

```typescript
async function resolveError(errorId: string): Promise<void> {
  const activePath = `.epct/errors/active/${errorId}.json`
  const resolvedPath = `.epct/errors/resolved/${errorId}.json`

  const error = JSON.parse(await readFile(activePath))
  error.resolved = new Date().toISOString()

  await writeFile(resolvedPath, JSON.stringify(error, null, 2))
  await deleteFile(activePath)

  await skillCall('context-manager', 'updateState', {
    errors: {
      active: countActiveErrors() - 1,
      blocking: hasBlockingErrors()
    }
  })
}
```

### Lister erreurs actives

```typescript
function listActiveErrors(): ErrorRecord[] {
  const errorFiles = listFiles('.epct/errors/active/')
  return errorFiles
    .map(file => JSON.parse(readFile(file)))
    .sort((a, b) => {
      // Prioriser : blocking > severity > age
      if (a.blocking !== b.blocking) return a.blocking ? -1 : 1
      if (a.severity !== b.severity) {
        const severityOrder = { critical: 0, major: 1, minor: 2 }
        return severityOrder[a.severity] - severityOrder[b.severity]
      }
      return new Date(a.created).getTime() - new Date(b.created).getTime()
    })
}
```

## Sévérité et Blocage

```typescript
function determineSeverity(error: ErrorInfo): Severity {
  if (error.type === 'syntax_error') return 'critical'
  if (error.type === 'assertion_failed') return 'critical'
  if (error.type === 'type_error') return 'major'
  if (error.type === 'lint_warning') return 'minor'
  return 'major'
}

function isBlocking(error: ErrorInfo): boolean {
  return error.severity === 'critical'
}
```

## Alerts

```typescript
function shouldAlertOldErrors(): boolean {
  const errors = listActiveErrors()
  const oneHourAgo = Date.now() - (60 * 60 * 1000)

  return errors.some(err =>
    new Date(err.created).getTime() < oneHourAgo &&
    err.blocking
  )
}
```

</markdown>
```

**Step 2: Commit skill**

```bash
git add src/skills/error-tracker.md
git commit -m "feat(skills): add error-tracker for error management"
```

### Task 2.3: Create /fix Command

**Files:**
- Create: `src/cli/fix.md`

**Step 1: Write /fix command**

Create: `src/cli/fix.md`

```markdown
---
name: fix
command: /fix
description: Affiche l'erreur prioritaire et guide le debugging avec systematic-debugging skill
---

# /fix - Corriger Erreur Prioritaire

## Comportement

1. Lit `.epct/errors/active/` et priorise
2. Affiche erreur détaillée
3. Active `superpowers:systematic-debugging`
4. Guide investigation → fix → vérification
5. Marque erreur comme résolue

## Affichage

```
❌ Erreur #001 - CRITIQUE

Chunk : UserService.create
File  : src/services/UserService.ts:42
Type  : assertion_failed

Message:
Expected user.email to be defined

Stack trace:
  at UserService.create (src/services/UserService.ts:42:15)
  at test_user_creation (tests/services/UserService.test.ts:15:28)

Context:
  Phase: Développement (4/7)
  Tentatives de fix: 0
  Créée: il y a 15 min

🔍 Activation systematic-debugging skill...
```

## Implémentation

```typescript
async function executeFixCommand() {
  // 1. Lister erreurs et prioriser
  const errors = await skillCall('error-tracker', 'listActiveErrors')

  if (errors.length === 0) {
    print("✅ Aucune erreur en attente. Tout est vert!")
    return
  }

  const priorityError = errors[0] // Déjà triée par priorité

  // 2. Afficher erreur
  printError(priorityError)

  // 3. Activer systematic-debugging
  print("\n🔍 Activation systematic-debugging skill...")

  await skillCall('superpowers:systematic-debugging', 'investigate', {
    error: priorityError,
    file: priorityError.file,
    line: priorityError.line,
    context: priorityError.context
  })

  // Systematic-debugging skill guide automatiquement :
  // - Root cause investigation
  // - Pattern analysis
  // - Hypothesis testing
  // - Implementation

  // 4. Après fix, vérifier tests
  print("\n✅ Fix implémenté. Vérification tests...")
  const testResult = await runTests(priorityError.chunk)

  if (testResult.passed) {
    print("✅ Tests PASSING")

    // 5. Marquer comme résolu
    await skillCall('error-tracker', 'resolveError', priorityError.id)

    // 6. Commit
    await gitCommit([priorityError.file], `fix: resolve ${priorityError.chunk} error`)

    print(`\n✅ Erreur ${priorityError.id} résolue`)

    // 7. Suggérer suite
    const remainingErrors = errors.length - 1
    if (remainingErrors > 0) {
      print(`\n💡 ${remainingErrors} erreur(s) restante(s). /fix à nouveau ?`)
    } else {
      print(`\n💡 Toutes les erreurs résolues ! Reprendre avec /next`)
    }
  } else {
    print("❌ Tests still FAILING")
    print("💡 Continue debugging ou demander de l'aide")
  }
}
```

## Intégration Systematic-Debugging

Le skill `superpowers:systematic-debugging` suit le processus :

**Phase 1 - Root Cause Investigation** :
- Traces back through call stack
- Adds instrumentation if needed
- Identifies source of invalid data

**Phase 2 - Pattern Analysis** :
- Checks for similar errors in codebase
- Identifies common patterns

**Phase 3 - Hypothesis Testing** :
- Forms hypotheses about cause
- Tests each hypothesis
- Confirms root cause

**Phase 4 - Implementation** :
- Implements fix
- Ensures fix doesn't break other tests
- Commits with clear message

</markdown>
```

**Step 2: Commit command**

```bash
git add src/cli/fix.md
git commit -m "feat(cli): add /fix command with systematic-debugging integration"
```

**Step 3: Update implementation state**

Modify: `.epct/implementation-state.json`

```json
{
  "project": "framework-projet-claude-code",
  "worktree": "../lab-13-framework-dev",
  "branch": "framework/implementation",
  "startedAt": "2026-01-04T00:00:00Z",
  "currentPhase": 2,
  "currentTask": "3.1",
  "completedTasks": ["0.1", "1.1", "1.2", "1.3", "1.4", "2.1", "2.2", "2.3"],
  "status": "in_progress",
  "lastUpdated": "2026-01-04T02:00:00Z"
}
```

**Step 4: Commit progress**

```bash
git add .epct/implementation-state.json
git commit -m "chore: update implementation progress (Phase 2 complete)"
```

---

## Phase 3 : Hub et Navigation

**Objectif** : Interface utilisateur complète avec /projet hub et transitions de phase

### Task 3.1: Create Phase Controller Skill

**Files:**
- Create: `src/skills/phase-controller.md`

**Step 1: Write phase-controller skill**

Create: `src/skills/phase-controller.md`

```markdown
---
name: phase-controller
description: Gère les transitions entre phases avec Go/No-Go validation et chargement contextuel de documentation
---

# Phase Controller

## Responsabilités

1. **Validation checklist** : Vérifier complétion phase actuelle
2. **Go/No-Go** : Décision utilisateur avant transition
3. **Chargement doc** : Charger condensé phase suivante
4. **Update état** : Transitionner vers nouvelle phase

## Les 7 Phases

| # | Phase | Skills Principaux |
|---|-------|-------------------|
| 1 | Discovery | brainstorming |
| 2 | Stratégie | writing-plans, brainstorming |
| 3 | Conception | writing-plans, brainstorming |
| 4 | Développement | test-driven-development, code-review |
| 5 | Qualité | verification-before-completion, systematic-debugging |
| 6 | Lancement | verification-before-completion |
| 7 | Croissance | root-cause-tracing, systematic-debugging |

## Implémentation

### Vérifier checklist phase

```typescript
function checkPhaseChecklist(phase: number): ChecklistResult {
  const checklist = loadPhaseChecklist(phase)
  const completed = checklist.filter(item => item.done)
  const missing = checklist.filter(item => !item.done)

  return {
    total: checklist.length,
    completed: completed.length,
    percentage: (completed.length / checklist.length) * 100,
    missing,
    ready: missing.length === 0
  }
}
```

### Go/No-Go décision

```typescript
async function goNoGoDecision(phase: number): Promise<boolean> {
  const checklist = checkPhaseChecklist(phase)
  const errors = await skillCall('error-tracker', 'listActiveErrors')
  const blocking = errors.filter(e => e.blocking)

  // Conditions pour GO
  const checklistOK = checklist.ready
  const noBlockers = blocking.length === 0
  const testsPass = await runAllTests()

  // Afficher status
  print(`╭─────────────────────────────────────────────────╮`)
  print(`│  Phase ${getPhaseNameF(phase)} terminée ?`)
  print(`├─────────────────────────────────────────────────┤`)
  print(`│  ✅ Checklist : ${checklist.completed}/${checklist.total} items`)
  print(`│  ${noBlockers ? '✅' : '❌'} Bloqueurs : ${blocking.length}`)
  print(`│  ${testsPass ? '✅' : '❌'} Tests : ${testsPass ? 'PASSING' : 'FAILING'}`)
  print(`╰─────────────────────────────────────────────────╯`)

  if (!checklistOK) {
    print(`\n⚠️  Items manquants :`)
    checklist.missing.forEach(item => print(`   - ${item.description}`))
  }

  if (blocking.length > 0) {
    print(`\n❌ ${blocking.length} bloqueur(s). Utiliser /fix avant transition.`)
    return false
  }

  if (!testsPass) {
    print(`\n❌ Tests échouent. Corriger avant transition.`)
    return false
  }

  if (!checklistOK) {
    const answer = await askUser(`\n⚠️  Checklist incomplète. Continuer quand même ? (o/n)`)
    return answer === 'o'
  }

  const answer = await askUser(`\nPasser à Phase ${getPhaseNameF(phase + 1)} ? (o/n)`)
  return answer === 'o'
}
```

### Transition vers phase suivante

```typescript
async function transitionToPhase(nextPhase: number): Promise<void> {
  const phaseName = getPhaseNameF(nextPhase)

  // 1. Checkpoint avant transition
  await skillCall('context-manager', 'createCheckpoint', `phase-${nextPhase - 1}-complete`)

  // 2. Charger doc condensée phase suivante
  const phaseDoc = await loadFile(`src/reference/phases/${nextPhase}-${phaseName.toLowerCase()}.md`)
  print(`\n📖 Chargement documentation : ${phaseName}...`)

  // 3. Update état
  await skillCall('context-manager', 'updateState', {
    currentPhase: nextPhase,
    phaseName,
    progress: {
      phase: 0,
      overall: ((nextPhase - 1) / 7) * 100
    }
  })

  // 4. Afficher résumé phase
  print(`\n✅ Transition vers Phase ${nextPhase} : ${phaseName}`)
  print(`\n📋 Checklist phase (${getChecklistLength(nextPhase)} items)`)
  print(`🔧 Skills actifs : ${getPhaseSkills(nextPhase).join(', ')}`)
  print(`\n💡 Utilisez /help pour voir la documentation complète de cette phase`)
}
```

## Chargement Contextuel

Seul le condensé de la phase actuelle est chargé en contexte :
- Phase 4 active → `4-developpement.md` chargé
- Économie tokens (7 fichiers × ~500 mots = 3500 mots, vs 1 × 500 = économie de 6× tokens)

## Messages Go/No-Go

### Prêt à avancer

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 12/12 items                     │
│  ✅ Bloqueurs : 0                               │
│  ✅ Tests : PASSING                             │
╰─────────────────────────────────────────────────╯

Passer à Phase Qualité ? (o/n)
```

### Bloqueurs présents

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 12/12 items                     │
│  ❌ Bloqueurs : 2                               │
│  ❌ Tests : FAILING                             │
╰─────────────────────────────────────────────────╯

❌ 2 bloqueur(s). Utiliser /fix avant transition.
```

</markdown>
```

**Step 2: Commit skill**

```bash
git add src/skills/phase-controller.md
git commit -m "feat(skills): add phase-controller for Go/No-Go transitions"
```

### Task 3.2: Create /next Command

**Files:**
- Create: `src/cli/next.md`

**Step 1: Write /next command**

Create: `src/cli/next.md`

```markdown
---
name: next
command: /next
description: Passe à l'étape suivante (chunk ou phase) avec validation Go/No-Go
---

# /next - Étape Suivante

## Comportement Contextuel

### Si dans un chunk
- Proposer chunk suivant
- Vérifier tests du chunk actuel
- Bloquer si erreurs

### Si fin de phase
- Déclencher Go/No-Go
- Valider checklist
- Transitionner si approuvé

## Implémentation

```typescript
async function executeNextCommand() {
  const state = await skillCall('context-manager', 'readState')

  // 1. Déterminer contexte
  const inChunk = state.currentChunk !== null
  const phaseComplete = await isPhaseComplete(state.currentPhase)

  if (inChunk) {
    await handleNextChunk()
  } else if (phaseComplete) {
    await handleNextPhase(state.currentPhase)
  } else {
    print("💡 Continuez le travail en cours. Utilisez /status pour voir progression.")
  }
}

async function handleNextChunk() {
  // 1. Vérifier chunk actuel terminé
  const state = await skillCall('context-manager', 'readState')
  const currentChunk = state.currentChunk

  if (currentChunk.status !== 'completed') {
    print(`⚠️  Chunk actuel (${currentChunk.method}) non terminé`)
    print(`💡 Terminez-le ou utilisez /fix si erreur`)
    return
  }

  // 2. Récupérer chunk suivant
  const nextChunk = await skillCall('chunk-manager', 'getNextChunk')

  if (!nextChunk) {
    print("✅ Tous les chunks de cette tâche sont terminés!")
    print("💡 Utilisez /next à nouveau pour passer à la phase suivante")
    return
  }

  // 3. Proposer chunk suivant
  print(`\n📍 Chunk suivant : ${nextChunk.name}`)
  print(`   File: ${nextChunk.file}`)
  print(`   Lines: ${nextChunk.lineStart}-${nextChunk.lineEnd}`)
  print(`   Size: ${nextChunk.size} lines`)

  const answer = await askUser("Commencer ce chunk ? (o/n)")

  if (answer === 'o') {
    await skillCall('chunk-manager', 'executeChunkWorkflow', nextChunk)
  }
}

async function handleNextPhase(currentPhase: number) {
  // 1. Go/No-Go
  const approved = await skillCall('phase-controller', 'goNoGoDecision', currentPhase)

  if (!approved) {
    print("\n❌ Transition refusée ou conditions non remplies")
    print("💡 Complétez les items manquants puis /next à nouveau")
    return
  }

  // 2. Transition
  await skillCall('phase-controller', 'transitionToPhase', currentPhase + 1)
}
```

## Messages

### Chunk suivant disponible

```
📍 Chunk suivant : UserService.delete
   File: src/services/UserService.ts
   Lines: 120-165
   Size: 45 lines
   Dependencies: 0

Commencer ce chunk ? (o/n)
```

### Tous chunks terminés

```
✅ Tous les chunks de cette tâche sont terminés!

💡 Utilisez /next à nouveau pour passer à la phase suivante
```

### Go/No-Go transition

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 12/12 items                     │
│  ✅ Bloqueurs : 0                               │
│  ✅ Tests : PASSING                             │
╰─────────────────────────────────────────────────╯

Passer à Phase Qualité ? (o/n)
```

</markdown>
```

**Step 2: Commit command**

```bash
git add src/cli/next.md
git commit -m "feat(cli): add /next command for progression control"
```

### Task 3.3: Create /projet Hub Command

**Files:**
- Create: `src/cli/projet.md`
- Create: `src/skills/projet-orchestrator.md`

**Step 1: Write projet-orchestrator skill**

Create: `src/skills/projet-orchestrator.md`

```markdown
---
name: projet-orchestrator
description: Orchestrateur principal qui coordonne tous les skills et gère le menu interactif /projet
---

# Projet Orchestrator

## Responsabilités

1. **Menu interactif** : Interface principale /projet
2. **Coordination skills** : Active skills selon phase et contexte
3. **Workflow global** : Gère flux discovery → croissance
4. **Initialisation projet** : Setup nouveau projet

## Menu /projet

```
╭─────────────────────────────────────────────────────╮
│  Que voulez-vous faire ?                            │
│                                                     │
│  1. 🆕 Démarrer un nouveau projet                   │
│  2. ➕ Ajouter une feature                          │
│  3. 🔧 Refactoring/optimisation                     │
│  4. 📋 Voir checklist phase actuelle                │
│  5. ⏭️  Passer à la phase suivante                  │
│                                                     │
│  Tapez le numéro ou décrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

## Implémentation

### Menu principal

```typescript
async function showProjetMenu() {
  const state = await skillCall('context-manager', 'readState')
  const hasProject = state.project.name !== ''

  const options = hasProject ?
    getActiveProjectOptions(state) :
    getNewProjectOptions()

  displayMenu(options)

  const choice = await getUserInput()
  await handleMenuChoice(choice, state)
}

function getActiveProjectOptions(state: ProjectState): MenuOption[] {
  return [
    { id: 1, label: '➕ Ajouter une feature', action: 'add_feature' },
    { id: 2, label: '🔧 Refactoring/optimisation', action: 'refactor' },
    { id: 3, label: '📋 Voir checklist phase actuelle', action: 'show_checklist' },
    { id: 4, label: '⏭️  Passer à la phase suivante', action: 'next_phase' },
    { id: 5, label: '📊 Voir status complet', action: 'status' }
  ]
}

function getNewProjectOptions(): MenuOption[] {
  return [
    { id: 1, label: '🆕 Démarrer un nouveau projet', action: 'new_project' },
    { id: 2, label: '📖 En savoir plus sur le framework', action: 'help' }
  ]
}
```

### Nouveau projet (Discovery)

```typescript
async function startNewProject() {
  print("🆕 Nouveau Projet\n")

  // 1. Collecter infos basiques
  const name = await askUser("Nom du projet ?")
  const type = await askUser("Type ? (webapp/mobile/feature/refacto)")

  // 2. Initialiser état
  await skillCall('context-manager', 'updateState', {
    project: {
      name,
      type,
      created: new Date().toISOString()
    },
    currentPhase: 1,
    phaseName: 'Discovery'
  })

  // 3. Activer brainstorming pour Discovery
  print("\n🎯 Phase Discovery : Validation du problème\n")
  print("Activation skill brainstorming...\n")

  await skillCall('superpowers:brainstorming', {
    context: `Nouveau projet ${type} : ${name}`,
    goal: 'Valider le problème et définir la proposition de valeur'
  })

  // Brainstorming guidera vers JTBD, Value Proposition Canvas, etc.
}
```

### Ajouter feature (current phase)

```typescript
async function addFeature() {
  const state = await skillCall('context-manager', 'readState')

  print(`\n➕ Ajouter Feature - Phase ${state.phaseName}\n`)

  const featureName = await askUser("Nom de la feature ?")
  const featureDesc = await askUser("Description courte ?")

  // Activer skills selon phase
  const phaseSkills = getPhaseSkills(state.currentPhase)

  if (state.currentPhase <= 3) {
    // Discovery/Stratégie/Conception : brainstorming
    await skillCall('superpowers:brainstorming', {
      feature: featureName,
      description: featureDesc
    })
  } else if (state.currentPhase === 4) {
    // Développement : chunk-manager + TDD
    await skillCall('chunk-manager', 'planFeature', {
      name: featureName,
      description: featureDesc
    })
  }
}
```

## Activation Skills Automatique

```typescript
function getPhaseSkills(phase: number): string[] {
  const skillMap = {
    1: ['superpowers:brainstorming'],
    2: ['superpowers:writing-plans', 'superpowers:brainstorming'],
    3: ['superpowers:writing-plans', 'superpowers:brainstorming'],
    4: ['superpowers:test-driven-development', 'superpowers:code-review'],
    5: ['superpowers:verification-before-completion', 'superpowers:systematic-debugging'],
    6: ['superpowers:verification-before-completion'],
    7: ['superpowers:root-cause-tracing', 'superpowers:systematic-debugging']
  }
  return skillMap[phase] || []
}

async function activatePhaseSkills(phase: number) {
  const skills = getPhaseSkills(phase)
  for (const skill of skills) {
    await skillCall(skill, 'activate')
  }
}
```

</markdown>
```

**Step 2: Write /projet command**

Create: `src/cli/projet.md`

```markdown
---
name: projet
command: /projet
description: Hub principal interactif pour gérer le projet (nouveau, feature, refacto, status)
---

# /projet - Hub Principal

## Comportement

Point d'entrée principal du framework. Menu adaptatif selon :
- Existence d'un projet actif
- Phase actuelle
- État (erreurs, progression, etc.)

## Implémentation

```typescript
async function executeProjetCommand(args?: string) {
  // Si argument direct (ex: /projet status)
  if (args) {
    return await executeShortcut(args)
  }

  // Sinon, menu interactif
  await skillCall('projet-orchestrator', 'showProjetMenu')
}

function executeShortcut(command: string) {
  const shortcuts = {
    'status': () => executeStatusCommand(),
    'fix': () => executeFixCommand(),
    'resume': () => executeResumeCommand(),
    'next': () => executeNextCommand(),
    'help': () => executeHelpCommand()
  }

  return shortcuts[command]?.() || print(`Commande inconnue: ${command}`)
}
```

## Raccourcis

```bash
/projet status  →  /status
/projet fix     →  /fix
/projet resume  →  /resume
/projet next    →  /next
/projet help    →  /help
```

</markdown>
```

**Step 3: Commit hub**

```bash
git add src/skills/projet-orchestrator.md src/cli/projet.md
git commit -m "feat: add /projet hub with orchestrator"
```

**Step 4: Update implementation state**

Modify: `.epct/implementation-state.json`

```json
{
  "project": "framework-projet-claude-code",
  "worktree": "../lab-13-framework-dev",
  "branch": "framework/implementation",
  "startedAt": "2026-01-04T00:00:00Z",
  "currentPhase": 3,
  "currentTask": "4.1",
  "completedTasks": ["0.1", "1.1", "1.2", "1.3", "1.4", "2.1", "2.2", "2.3", "3.1", "3.2", "3.3"],
  "status": "in_progress",
  "lastUpdated": "2026-01-04T03:00:00Z"
}
```

**Step 5: Commit progress**

```bash
git add .epct/implementation-state.json
git commit -m "chore: update implementation progress (Phase 3 complete)"
```

---

## Phase 4 : Documentation et Polish

**Objectif** : Framework complet, documenté, et utilisable sur d'autres projets

### Task 4.1: Create Condensed Phase Documentation (7 files)

**Files:**
- Create: `src/reference/phases/1-discovery.md`
- Create: `src/reference/phases/2-strategie.md`
- Create: `src/reference/phases/3-conception.md`
- Create: `src/reference/phases/4-developpement.md`
- Create: `src/reference/phases/5-qualite.md`
- Create: `src/reference/phases/6-lancement.md`
- Create: `src/reference/phases/7-croissance.md`

**Step 1: Create reference/phases directory**

```bash
mkdir -p src/reference/phases
```

**Step 2: Generate condensed docs from research**

Ces fichiers doivent être générés à partir des documents de réconciliation :
- Source : `/reconciliation/plan-framework-projet-v2.md` sections par phase
- Format : ~500 mots par phase, checklist actionnable, anti-patterns, outils

**Note** : Génération détaillée dans tâche séparée (trop long pour ce plan)

Exemple structure `1-discovery.md` :

```markdown
# Phase 1 : Discovery

**Objectif** : Valider le problème et définir la proposition de valeur

## Checklist (12 items)

- [ ] Problem Statement validé
- [ ] JTBD documentés
- [ ] Personas définis (3-5)
- [ ] Value Proposition Canvas complété
- [ ] TAM/SAM/SOM estimés
- [ ] Benchmark concurrents (5+)
- [ ] Opportunity Solution Tree créé
- [ ] Hypothèses priorisées
- [ ] Go/No-Go documenté
- [ ] ...

## Anti-Patterns

⚠️  **Building before validation** : Ne pas commencer à coder avant...
⚠️  **Solution-first thinking** : Partir de la solution au lieu du problème...
...

## Outils Recommandés

- Miro/FigJam : Value Proposition Canvas, OST
- Notion : Documentation JTBD, Personas
- ...

## Métriques

- Nombre d'interviews utilisateurs : 5-10 minimum
- Sean Ellis Test (cible) : > 40% "très déçus"
- ...
```

**Step 3: Commit condensed docs**

```bash
git add src/reference/phases/
git commit -m "docs: add condensed phase documentation (7 phases)"
```

### Task 4.2: Create /help Command

**Files:**
- Create: `src/cli/help.md`
- Create: `src/skills/tips-engine.md`

**Step 1: Write tips-engine skill**

Create: `src/skills/tips-engine.md`

```markdown
---
name: tips-engine
description: Génère tips contextuels et anti-patterns selon phase et situation
---

# Tips Engine

## Responsabilités

1. **Tips contextuels** : Afficher aide selon situation
2. **Anti-patterns** : Alerter sur erreurs courantes
3. **Recommendations** : Suggérer prochaine action

## Tips par Situation

```typescript
type TipSituation =
  | 'LOW_CONTEXT'
  | 'PENDING_ERROR'
  | 'READY_FOR_NEXT'
  | 'LONG_SESSION'
  | 'FIRST_SESSION'

const tips: Record<TipSituation, string> = {
  LOW_CONTEXT: "💡 Contexte limité. Terminez le chunk actuel puis /status pour sauvegarder.",
  PENDING_ERROR: "💡 Erreur en attente. /fix recommandé avant de continuer.",
  READY_FOR_NEXT: "💡 Checklist phase complète. /next pour valider et avancer.",
  LONG_SESSION: "💡 Session longue. Un /status créera un point de sauvegarde.",
  FIRST_SESSION: "💡 Bienvenue ! Dernière action : [X]. Tapez /resume pour continuer."
}
```

</markdown>
```

**Step 2: Write /help command**

Create: `src/cli/help.md`

```markdown
---
name: help
command: /help
description: Affiche l'aide contextuelle (phase actuelle, commandes, anti-patterns)
---

# /help - Aide Contextuelle

## Comportement

Affiche aide selon phase actuelle :
- Documentation phase condensée
- Liste des commandes
- Tips et anti-patterns pertinents

## Implémentation

```typescript
async function executeHelpCommand(topic?: string) {
  const state = await skillCall('context-manager', 'readState')

  if (topic) {
    return await showSpecificHelp(topic)
  }

  // Aide générale
  print(`\n📖 Aide - Phase ${state.phaseName}\n`)

  // 1. Documentation phase
  const phaseDoc = await loadFile(`src/reference/phases/${state.currentPhase}-*.md`)
  print(formatPhaseDoc(phaseDoc))

  // 2. Commandes disponibles
  print(`\n## Commandes\n`)
  printCommands()

  // 3. Tips pertinents
  const tips = await skillCall('tips-engine', 'getPhaseAntiPatterns', state.currentPhase)
  print(`\n## Anti-Patterns à Éviter\n`)
  tips.forEach(tip => print(`⚠️  ${tip}`))
}
```

</markdown>
```

**Step 3: Commit help**

```bash
git add src/skills/tips-engine.md src/cli/help.md
git commit -m "feat: add /help command with contextual documentation"
```

### Task 4.3: Create Installation Documentation

**Files:**
- Create: `docs/installation.md`
- Create: `README.md`

**Step 1: Write installation guide**

Create: `docs/installation.md`

```markdown
# Installation Framework Projet

## Prérequis

- Claude Code installé
- Git
- Superpowers plugin activé

## Installation

### 1. Copier le framework dans votre projet

\`\`\`bash
# Depuis votre projet
mkdir -p .claude/framework
cp -r /path/to/lab-13/src .claude/framework/
cp -r /path/to/lab-13/.epct .epct-template
\`\`\`

### 2. Initialiser l'état

\`\`\`bash
cp .epct-template/* .epct/
\`\`\`

### 3. Configurer claude.md

Ajouter dans votre `claude.md` ou `.claude/claude.md` :

\`\`\`markdown
## Framework Projet Actif

Ce projet utilise le framework de gestion de projet.

### Commandes disponibles
- /projet : Hub principal
- /resume : Reprendre session
- /status : État actuel
- /fix : Corriger erreur
- /next : Étape suivante
- /help : Aide contextuelle

### Skills framework
- Located in: .claude/framework/src/skills/
- Auto-activated selon phase
\`\`\`

### 4. Premier lancement

\`\`\`bash
# Dans Claude Code
/projet
# Choisir "Démarrer un nouveau projet"
\`\`\`

## Structure Ajoutée

\`\`\`
votre-projet/
├── .claude/
│   └── framework/
│       └── src/
│           ├── skills/
│           ├── cli/
│           └── reference/
├── .epct/
│   ├── state.json
│   ├── checkpoints/
│   ├── errors/
│   └── session/
└── claude.md (modifié)
\`\`\`

## Utilisation

1. Démarrer : \`/projet\`
2. Reprendre session : \`/resume\`
3. Voir progression : \`/status\`
4. Corriger erreurs : \`/fix\`
5. Avancer : \`/next\`
6. Aide : \`/help\`

## Troubleshooting

### "Commande /projet non trouvée"
Vérifier que `.claude/framework/src/cli/projet.md` existe

### "Erreur state.json"
Réinitialiser : `cp .epct-template/state.json .epct/state.json`

### "Skills non activés"
Vérifier Superpowers plugin installé et actif
\`\`\`

**Step 2: Write README**

Create: `README.md`

```markdown
# Framework Projet Claude Code

Framework de gestion de projet pour Claude Code qui transforme 167K mots de recherche en 6 commandes simples.

## Caractéristiques

- **6 commandes** : /projet, /resume, /status, /fix, /next, /help
- **Persistance** : Contexte préservé entre sessions (.epct/)
- **7 phases** : Discovery → Croissance
- **TDD automatique** : Pattern chunk-test-fix
- **Intégration Superpowers** : Skills activés selon phase

## Installation

Voir [docs/installation.md](docs/installation.md)

## Documentation

- [Plan de design](plan-framework-projet.md)
- [Plan d'implémentation](IMPLEMENTATION-PLAN.md)
- [Réconciliation recherche](reconciliation/)

## Développement

Ce framework s'auto-utilise pour son développement (meta-framework).

\`\`\`bash
cd lab-13-framework-dev  # Worktree
git branch  # framework/implementation
/projet  # Utiliser le framework
\`\`\`

## Licence

MIT
\`\`\`

**Step 3: Commit docs**

```bash
git add docs/installation.md README.md
git commit -m "docs: add installation guide and README"
```

**Step 4: Update implementation state - COMPLETE**

Modify: `.epct/implementation-state.json`

```json
{
  "project": "framework-projet-claude-code",
  "worktree": "../lab-13-framework-dev",
  "branch": "framework/implementation",
  "startedAt": "2026-01-04T00:00:00Z",
  "currentPhase": 4,
  "currentTask": "COMPLETE",
  "completedTasks": ["0.1", "1.1", "1.2", "1.3", "1.4", "2.1", "2.2", "2.3", "3.1", "3.2", "3.3", "4.1", "4.2", "4.3"],
  "status": "completed",
  "completedAt": "2026-01-04T04:00:00Z"
}
```

**Step 5: Final commit**

```bash
git add .epct/implementation-state.json
git commit -m "chore: mark implementation complete 🎉"
```

---

## Post-Implementation : Merge et Distribution

### Task 5.1: Merge to Main

**Step 1: Review all changes**

```bash
git log --oneline
git diff main...framework/implementation
```

**Step 2: Merge to main**

```bash
git checkout main
git merge framework/implementation
```

**Step 3: Tag release**

```bash
git tag -a v1.0.0 -m "Framework Projet v1.0 - Initial Release"
git push origin main --tags
```

### Task 5.2: Clean Up Worktree

```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
git worktree remove ../lab-13-framework-dev
git branch -d framework/implementation  # Si mergé
```

---

## Execution Options

**Plan complete and saved to `IMPLEMENTATION-PLAN.md`.**

**Two execution options:**

**1. Subagent-Driven (this session)**
- Stay in this session
- Dispatch fresh subagent per task
- Code review between tasks
- Fast iteration

**2. Parallel Session (separate)**
- Open new session in worktree
- Use superpowers:executing-plans
- Batch execution with checkpoints

**Which approach do you prefer?**
