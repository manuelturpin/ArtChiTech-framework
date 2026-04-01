---
name: github-integration
description: Generate structured PR descriptions and manage GitHub workflow
---

# Skill: GitHub Integration

**Type:** Flexible

> **Self-Announcement:** When using this skill, announce: "Using GitHub Integration skill to synchronize project state with GitHub Issues."

> Synchronise ton projet ACT avec GitHub Issues pour une gestion intégrée.

## Vue d'ensemble

Ce skill permet de :
- **Créer** des Issues GitHub depuis les phases de `plan.md`
- **Mettre à jour** les Issues depuis l'état du projet
- **Lier** les commits aux phases automatiquement
- **Générer** des descriptions de PR structurées

---

## Configuration

### 1. Prérequis

- Un dépôt GitHub (public ou privé)
- Un token GitHub avec scope `repo`
- ACT initialisé dans le projet

### 2. Token GitHub

```bash
# Option 1: Variable d'environnement (recommandé)
export GITHUB_TOKEN=ghp_xxxxx

# Option 2: GitHub CLI
gh auth login
```

### 3. Configuration ACT

Dans `.act/config.yaml` :

```yaml
github:
  enabled: true
  repo: owner/repo  # Optionnel, auto-détecté depuis git remote
  sync:
    issues: true
    labels: true
    milestones: false
    comments: false
```

---

## Workflow de synchronisation

### Initialisation (une fois)

```bash
# 1. Créer les labels ACT sur GitHub
/act:sync-github --push --labels

# 2. Créer les Issues pour chaque phase
/act:sync-github --push
```

### Usage quotidien

```bash
# Après avoir avancé sur une phase
/act:sync-github --push

# Pour voir l'état sans modifier
/act:sync-github --dry-run
```

### Collaboration

```bash
# Récupérer les changements faits sur GitHub
/act:sync-github --pull
```

---

## Extraction des phases

### Format attendu dans plan.md

```markdown
## Phases

### Phase 1: Discovery ✅
Description de la phase...

- [x] Tâche complétée
- [x] Autre tâche complétée

### Phase 2: Strategy 🔄
Description de la phase...

- [x] Tâche faite
- [ ] Tâche en cours
- [ ] Tâche à faire

### Phase 3: Design ⏳
- [ ] Pas encore commencé
```

### Marqueurs d'état

| Marqueur | Signification | Issue Status |
|----------|---------------|--------------|
| `✅` | Complété | Closed |
| `🔄` | En cours | Open + `in-progress` |
| `⏳` | En attente | Open + `pending` |
| (aucun) | Non défini | Open |

### Algorithme d'extraction

```
1. Parser plan.md avec regex
2. Extraire les phases (### Phase N: Name)
3. Détecter l'état via emoji ou complétion des tâches
4. Collecter les sous-tâches (- [ ] ou - [x])
5. Générer le body de l'Issue
```

---

## Création/Mise à jour des Issues

### Titre de l'Issue

```
[Phase N] Nom de la phase
```

Exemple : `[Phase 3] Design`

### Body de l'Issue

```markdown
## Objectif

Description extraite de plan.md

## Tâches

- [x] Tâche complétée
- [ ] Tâche en cours
- [ ] Tâche à faire

## Contexte ACT

- **Phase:** 3/7
- **Projet:** Mon Projet
- **Dernière sync:** 2026-02-02 14:30

---
*Géré par ACT Framework v2.5*
```

### Labels assignés

Chaque Issue reçoit automatiquement :
- `phase-N` (ex: `phase-3`)
- État actuel (`in-progress` ou `pending`)
- `act-managed` (pour identifier les Issues ACT)

---

## Labels recommandés

### Créer les labels

```bash
/act:sync-github --push --labels
```

Ceci crée les labels suivants :

| Label | Couleur | Usage |
|-------|---------|-------|
| `phase-1` | #1d76db | Discovery |
| `phase-2` | #0e8a16 | Strategy |
| `phase-3` | #fbca04 | Design |
| `phase-4` | #d93f0b | Development |
| `phase-5` | #5319e7 | Quality |
| `phase-6` | #006b75 | Launch |
| `phase-7` | #b60205 | Growth |
| `in-progress` | #0e8a16 | Phase active |
| `pending` | #c5def5 | Phase en attente |
| `blocked` | #b60205 | Phase bloquée |
| `act-managed` | #ededed | Géré par ACT |

---

## Mapping état → Issue status

### Fermeture automatique

Une Issue est **fermée** quand :
- Toutes les tâches sont cochées (`- [x]`)
- OU le marqueur `✅` est présent

### Réouverture automatique

Une Issue est **réouverte** quand :
- Une tâche est décochée
- OU le marqueur change de `✅` à `🔄`

### Mise à jour des labels

| État local | Labels appliqués |
|------------|------------------|
| Phase en cours | Remove `pending`, add `in-progress` |
| Phase complète | Remove `in-progress`, `pending` |
| Phase bloquée | Add `blocked` |

---

## Exemples d'utilisation

### Exemple 1 : Nouveau projet

```bash
# Initialiser ACT
/act:init --type product --name "Mon App"

# Définir les phases dans plan.md
# ...

# Synchroniser avec GitHub
/act:sync-github --push --labels
```

Résultat : 7 Issues créées, une par phase, avec les labels appropriés.

### Exemple 2 : Avancer une phase

```bash
# Compléter les tâches de Phase 2 dans plan.md
# Changer 🔄 en ✅

# Synchroniser
/act:sync-github --push
```

Résultat : Issue Phase 2 fermée, Issue Phase 3 passe `in-progress`.

### Exemple 3 : Collaboration

Un collègue coche des tâches directement sur GitHub.

```bash
# Récupérer les changements
/act:sync-github --pull
```

Résultat : `plan.md` mis à jour avec les tâches cochées sur GitHub.

---

## Bonnes pratiques

### ✅ Do

- Synchroniser régulièrement (`--push` après chaque milestone)
- Utiliser `--dry-run` avant les premiers syncs
- Configurer le token via variable d'environnement
- Garder `plan.md` comme source de vérité

### ❌ Don't

- Ne pas modifier les Issues `act-managed` manuellement (sauf urgence)
- Ne pas supprimer les labels `act-*`
- Ne pas committer le token dans config.yaml

---

## Dépannage

### "Token not found"

```bash
# Vérifier la variable
echo $GITHUB_TOKEN

# Ou utiliser gh cli
gh auth status
```

### "Repository not found"

```bash
# Vérifier le remote
git remote -v

# Ou spécifier explicitement
# Dans .act/config.yaml:
github:
  repo: owner/repo
```

### "Issue already exists"

ACT détecte les Issues existantes par leur titre `[Phase N]`. Si une Issue a été renommée, créer une nouvelle ou restaurer le titre.

---

## Intégration avec autres features

### Context Handoff

```bash
# Générer un handoff au format PR
/act:handoff --format github-pr
```

### Commits liés

Format de commit recommandé pour liaison automatique :

```
feat(project): [Phase 3.2] Implement user auth

Relates to #12
```

Le `#12` crée un lien vers l'Issue Phase 3.

---

## Référence API

Ce skill utilise l'API GitHub REST v3 :
- `POST /repos/{owner}/{repo}/issues` — Créer Issue
- `PATCH /repos/{owner}/{repo}/issues/{issue_number}` — Mettre à jour
- `POST /repos/{owner}/{repo}/labels` — Créer labels
- `GET /repos/{owner}/{repo}/issues` — Lister Issues

Rate limits : 5000 requests/heure avec token.
