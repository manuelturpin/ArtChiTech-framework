# /act:sync-github

Synchronise l'état du projet ACT avec GitHub Issues.

## Syntaxe

```
/act:sync-github [options]
```

## Options

| Option | Description |
|--------|-------------|
| `--push` | Pousse l'état local vers GitHub Issues |
| `--pull` | Récupère l'état des Issues vers local |
| `--dry-run` | Affiche les changements sans les appliquer |
| `--labels` | Crée/met à jour les labels automatiquement |
| `--force` | Force la synchronisation en cas de conflit |

## Description

Cette commande permet de synchroniser bidirectionnellement l'état de votre projet ACT avec les Issues GitHub.

### Mode Push (Local → GitHub)

```bash
/act:sync-github --push
```

Crée ou met à jour les Issues GitHub depuis `.act/plan.md` :
- Chaque phase devient une Issue `[Phase N] Name`
- Les tâches deviennent des checkboxes dans le body
- Les labels sont assignés selon l'état
- Les Issues complétées sont fermées

### Mode Pull (GitHub → Local)

```bash
/act:sync-github --pull
```

Met à jour `.act/plan.md` depuis les Issues GitHub :
- Les checkboxes cochées sur GitHub sont reflétées
- Les Issues fermées marquent la phase complète
- Les commentaires importants sont ajoutés à `progress.md`

### Mode Diff (par défaut)

```bash
/act:sync-github
```

Affiche les différences entre l'état local et GitHub sans appliquer de changements.

## Exemples

### Initialisation complète

```bash
# Créer les labels et Issues pour toutes les phases
/act:sync-github --push --labels
```

### Mise à jour après travail

```bash
# Pousser l'état actuel
/act:sync-github --push
```

### Prévisualisation

```bash
# Voir ce qui serait synchronisé
/act:sync-github --push --dry-run
```

### Récupération collaborative

```bash
# Récupérer les changements faits sur GitHub
/act:sync-github --pull
```

### Forcer en cas de conflit

```bash
# L'état local gagne
/act:sync-github --push --force

# L'état GitHub gagne
/act:sync-github --pull --force
```

## Output

### Mode Dry-run

```
📊 ACT ↔ GitHub Sync (dry-run)

Changes to apply:

[CREATE] Issue: [Phase 1] Discovery
  Labels: phase-1, act-managed, completed
  Status: Will be created and closed

[UPDATE] Issue #12: [Phase 2] Strategy
  - Label change: pending → in-progress
  - Tasks: 2 newly checked

[SKIP] Issue #13: [Phase 3] Design
  - No changes detected

Summary:
  Create: 1
  Update: 1
  Skip: 1
  Close: 0

Run without --dry-run to apply.
```

### Mode Push

```
📊 ACT → GitHub Sync

✅ Created Issue #14: [Phase 1] Discovery
✅ Updated Issue #12: [Phase 2] Strategy
   - Added label: in-progress
   - Removed label: pending
⏭️ Skipped Issue #13: [Phase 3] Design (no changes)

Sync complete: 1 created, 1 updated, 1 skipped
```

### Mode Pull

```
📊 GitHub → ACT Sync

📥 Updated plan.md:
   - Phase 2: Checked 2 tasks
   - Phase 3: Unchecked 1 task

📥 Updated progress.md:
   - Added 3 comments from Issue #12

Sync complete. Local state updated.
```

## Configuration

Requiert une configuration dans `.act/config.yaml` :

```yaml
github:
  enabled: true
  repo: owner/repo        # Auto-détecté si non spécifié
  sync:
    issues: true          # Sync phases comme Issues
    labels: true          # Créer/mettre à jour labels
    milestones: false     # Sync comme Milestones
    comments: false       # Sync progress comme commentaires
```

## Prérequis

### Token GitHub

```bash
# Via variable d'environnement (recommandé)
export GITHUB_TOKEN=ghp_xxxxx

# Ou via GitHub CLI
gh auth login
```

### Permissions requises

- `repo` scope pour les dépôts privés
- `public_repo` scope pour les dépôts publics uniquement

## Comportement

### Détection des Issues existantes

ACT identifie les Issues existantes par leur titre `[Phase N]`. Si le titre a été modifié, une nouvelle Issue sera créée.

### Gestion des conflits

Sans `--force`, la commande s'arrête si des conflits sont détectés :
- Tâche cochée localement mais décochée sur GitHub
- Phase marquée complète localement mais Issue ouverte

### Labels créés

Avec `--labels`, les labels suivants sont créés s'ils n'existent pas :
- `phase-1` à `phase-7`
- `in-progress`, `pending`, `blocked`
- `act-managed`

## Voir aussi

- [SPEC-github-integration](../../specs/SPEC-github-integration.md)
- [Skill: github-integration](../../skills/github-integration/SKILL.md)
- [/act:handoff](./handoff.md) — Pour générer des descriptions de PR
