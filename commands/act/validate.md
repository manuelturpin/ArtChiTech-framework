# /act:validate

## Usage

```bash
/act:validate [--fix] [--verbose]
```

## Description

Vérifie la conformité des fichiers `.act/` du projet.

Cette commande effectue un audit complet de la structure ACT pour s'assurer que tous les fichiers sont présents, correctement formatés, et cohérents entre eux.

## Checks effectués

1. **Présence des fichiers requis**
   - `config.yaml` — Configuration du projet
   - `state.md` — État actuel
   - `plan.md` — Phases et progression
   - `findings.md` — Recherches et découvertes
   - `progress.md` — Journal de session

2. **Validation structure YAML** de `config.yaml`
   - Syntaxe YAML valide
   - Champs requis présents (`project.name`, `project.version`, `project.mode`)
   - Valeurs valides (mode: quick|full)

3. **Cohérence state.md ↔ plan.md**
   - Même numéro de phase
   - Même nom de phase
   - Progression logique

4. **Format correct de chaque fichier**
   - Sections attendues présentes
   - Structure markdown valide
   - Timestamps au bon format

5. **Présence du dossier history/**
   - Dossier existe
   - Fichiers suivent la convention de nommage

## Output

### Tout OK

```
✅ ACT Validation Passed

- config.yaml: ✅
- state.md: ✅
- plan.md: ✅
- findings.md: ✅
- progress.md: ✅
- history/: ✅
```

### Avec erreurs

```
⚠️ ACT Validation: 2 issues found

- config.yaml: ✅
- state.md: ❌ Missing phase field
- plan.md: ✅
- findings.md: ⚠️ Empty file
- progress.md: ✅
- history/: ✅

Run `/act:validate --fix` to auto-fix minor issues.
```

## Status Icons

| Icon | Signification |
|:----:|---------------|
| ✅ | Valide |
| ⚠️ | Warning (non-bloquant) |
| ❌ | Erreur (bloquant) |

## Options

### `--fix`

Tente de corriger automatiquement les problèmes mineurs :
- Crée les sections optionnelles manquantes
- Corrige les problèmes de formatage
- Crée le dossier `history/` s'il n'existe pas
- Initialise les fichiers vides avec des templates

**Ne corrige PAS :**
- Champs requis manquants dans config.yaml
- Incohérences de phase (nécessite décision humaine)

### `--verbose`

Affiche plus de détails :
- Chaque check effectué
- Temps par check
- Suggestions d'amélioration

## Exemples

### Validation simple

```bash
/act:validate
```

### Validation avec auto-fix

```bash
/act:validate --fix
```

### Validation détaillée

```bash
/act:validate --verbose
```

### Combiné

```bash
/act:validate --fix --verbose
```

## Exit Codes

| Code | Signification |
|:----:|---------------|
| 0 | Tous les checks passent |
| 1 | Warnings uniquement |
| 2 | Erreurs trouvées |

## Cas d'usage

### Avant de commencer une session

```bash
/act:validate
# Si OK → /act:resume
```

### Après modifications manuelles

Si vous avez édité les fichiers `.act/` manuellement :

```bash
/act:validate --fix
```

### En CI/CD

Intégrable dans un pipeline pour valider la structure projet.

### Pre-commit hook

Peut servir de hook pre-commit pour garantir la validité des fichiers `.act/`.

## Voir aussi

- `/act:init` — Crée la structure `.act/` initiale
- `/act:resume` — Reprend une session (utilise validate)
- `/act:status` — Affiche l'état courant
- `@specs/SPEC-act-validate.md` — Spécification complète
