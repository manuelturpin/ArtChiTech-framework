# Session Handoff - Fix GitHub Workflows

> Date: 2026-01-07

## Problème

**Tous les workflows GitHub Actions échouent** depuis plusieurs commits.

```
Error: Dependencies lock file is not found
Supported file patterns: package-lock.json, npm-shrinkwrap.json, yarn.lock
```

## Cause

Les workflows (`ci.yml` et `deploy.yml`) sont configurés pour un **projet Node.js** :
- `npm ci`
- `npm run build`
- `npm test`

Mais ACT Framework **n'est PAS un projet Node.js**. C'est un plugin Claude Code avec :
- Scripts Python (`detect_stack.py`, `generate_claudemd.py`)
- Fichiers Markdown (commandes, agents)
- Pas de `package.json`

## État actuel

| Fichier | Problème |
|---------|----------|
| `.github/workflows/ci.yml` | Configure Node.js, npm ci, npm test |
| `.github/workflows/deploy.yml` | Configure Node.js, npm ci, npm build |

## Solutions possibles

### Option 1 : Supprimer les workflows
Si pas besoin de CI pour l'instant, supprimer les fichiers.

### Option 2 : Adapter les workflows
Créer des workflows appropriés pour ACT :
- **Lint Markdown** - Vérifier la syntaxe des fichiers .md
- **Test Python** - Exécuter pytest sur les scripts Python
- **Validate Structure** - Vérifier que les fichiers requis existent

### Option 3 : Workflows minimaux
Juste une validation basique sans tests.

## Workflows suggérés (Option 2)

### ci.yml (nouveau)
```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Install test dependencies
        run: pip install pytest

      - name: Run Python tests
        run: |
          cd plugin/skills/claudemd-generator
          python -m pytest tests/ -v

      - name: Validate structure
        run: |
          # Check required files exist
          test -f plugin/.claude-plugin/plugin.json
          test -f plugin/README.md
          test -d plugin/commands
          test -d plugin/agents
          echo "✓ Structure valid"
```

### deploy.yml
Peut être supprimé ou simplifié (pas de déploiement pour un plugin).

## TODO Prochaine Session

1. [ ] Décider : Option 1, 2 ou 3 ?
2. [ ] Implémenter la solution choisie
3. [ ] Vérifier que les workflows passent
4. [ ] Optionnel : Ajouter badge "CI passing" au README

## Fichiers à modifier

- `.github/workflows/ci.yml`
- `.github/workflows/deploy.yml` (supprimer ou adapter)

## Prompt de relance

```
Fix les workflows GitHub Actions qui échouent.

Contexte:
- docs/handoffs/2026-01-07-workflow-fix.md
- Les workflows actuels sont pour Node.js mais ACT est un plugin Python/Markdown
- Erreur: "Dependencies lock file is not found"

Options:
1. Supprimer les workflows
2. Adapter pour Python/Markdown (recommandé)
3. Workflows minimaux

Choisis l'option 2 et implémente.
```

## Notes

- 10+ runs en échec consécutifs
- Les workflows ont été copiés d'un template Node.js par erreur
- Le repo fonctionne, c'est juste la CI qui est cassée
