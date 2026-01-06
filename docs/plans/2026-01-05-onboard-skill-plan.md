# Skill `/onboard` - Plan d'Implémentation

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Créer un skill `/onboard` qui analyse un projet existant et produit un diagnostic complet avec recommandations actionnables.

**Architecture:** Le skill est composé d'un SKILL.md principal avec des références séparées pour les critères de scoring, les templates de rapport, et les checklists par type de projet. Un script Python optionnel peut automatiser la détection de stack.

**Tech Stack:** Claude Code Skills (Markdown), Python (scripts optionnels), YAML (diagnostic output)

---

## Vue d'ensemble des tâches

| # | Tâche | Durée estimée |
|---|-------|---------------|
| 1 | Initialiser la structure du skill | 5 min |
| 2 | Écrire le SKILL.md principal | 15 min |
| 3 | Créer les références de scoring | 10 min |
| 4 | Créer les templates de rapport | 10 min |
| 5 | Créer le script de détection de stack | 15 min |
| 6 | Tester le skill sur un projet exemple | 10 min |
| 7 | Packager et installer le skill | 5 min |

---

## Task 1: Initialiser la structure du skill

**Files:**
- Create: `~/.claude/skills/onboard/SKILL.md`
- Create: `~/.claude/skills/onboard/references/`
- Create: `~/.claude/skills/onboard/scripts/`

**Step 1: Créer le dossier du skill**

```bash
mkdir -p ~/.claude/skills/onboard/{references,scripts}
```

**Step 2: Vérifier la structure**

Run: `ls -la ~/.claude/skills/onboard/`

Expected:
```
drwxr-xr-x  references
drwxr-xr-x  scripts
```

**Step 3: Créer le fichier SKILL.md vide avec frontmatter**

Create `~/.claude/skills/onboard/SKILL.md`:

```markdown
---
name: onboard
description: Analyse un projet existant et produit un diagnostic complet avec recommandations. Utiliser quand l'utilisateur veut (1) auditer un projet, (2) savoir où en est son projet, (3) obtenir des recommandations d'amélioration, (4) générer une checklist de prochaines étapes, ou (5) intégrer le framework projet à un projet existant. Triggers: /onboard, "audit mon projet", "analyse ce projet", "où en est mon projet", "que dois-je améliorer".
---

# Onboard - Audit et Diagnostic de Projet

TODO: Instructions à compléter
```

**Step 4: Commit initial**

```bash
cd ~/.claude/skills/onboard
git init
git add .
git commit -m "feat(onboard): initialize skill structure"
```

---

## Task 2: Écrire le SKILL.md principal

**Files:**
- Modify: `~/.claude/skills/onboard/SKILL.md`

**Step 1: Écrire la section Overview**

Replace content of `~/.claude/skills/onboard/SKILL.md`:

```markdown
---
name: onboard
description: Analyse un projet existant et produit un diagnostic complet avec recommandations. Utiliser quand l'utilisateur veut (1) auditer un projet, (2) savoir où en est son projet, (3) obtenir des recommandations d'amélioration, (4) générer une checklist de prochaines étapes, ou (5) intégrer le framework projet à un projet existant. Triggers: /onboard, "audit mon projet", "analyse ce projet", "où en est mon projet", "que dois-je améliorer".
---

# Onboard - Audit et Diagnostic de Projet

Analyser un projet existant et produire un diagnostic complet avec des recommandations actionnables.

## Flux d'exécution

1. **AUDIT** - Analyser la structure, stack, tests, CI/CD, docs
2. **BRANDBOOK** - Détecter/proposer l'identité visuelle (adaptatif)
3. **DIAGNOSTIC** - Évaluer la phase actuelle et scorer par catégorie
4. **RECOMMANDATIONS** - Générer des actions priorisées
5. **CHECKLIST** - Créer des todos actionnables

## Étape 1: Audit Automatique

### Analyser ces éléments

| Catégorie | Commandes/Fichiers à vérifier |
|-----------|------------------------------|
| Structure | `ls -la`, présence de src/, tests/, docs/ |
| Stack | `package.json`, `requirements.txt`, `go.mod`, `Cargo.toml` |
| Type | Indices dans dependencies et structure |
| Tests | `**/test*`, `**/*.test.*`, `**/*.spec.*` |
| CI/CD | `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile` |
| Documentation | `README.md`, `docs/`, `*.md` |
| Sécurité | `.env*`, `.gitignore`, headers config |
| Database | `prisma/`, `migrations/`, `*.sql` |
| Monitoring | Sentry, PostHog, analytics config |

### Déterminer le type de projet

```
webapp     → src/pages/ OR src/app/ OR src/components/ + framework web
api        → Uniquement routes/endpoints, pas de composants UI
cli        → bin/, commander/yargs deps, --help patterns
library    → main/exports dans package.json, pas d'app
docs       → docs/ sans src/, majoritairement .md
research   → Fichiers .md majoritaires, pas de code
```

### Output de l'audit

Générer mentalement:

```yaml
type_projet: [webapp|api|cli|library|docs|research]
stack: [detected-stack]
identite_visuelle: [requise|optionnelle|ignorée]
maturite: [prototype|mvp|production|mature]
```

## Étape 2: Gestion Brandbook

### Comportement adaptatif selon le type

| Type | Identité visuelle |
|------|-------------------|
| webapp, mobile | **Requise** → Brandbook complet |
| docs, research | **Optionnelle** → Charte légère |
| api, cli, library | **Ignorée** → Skip automatique |

### Si identité visuelle requise ou optionnelle

1. Rechercher des fichiers existants:
   - `docs/brand/`, `docs/design/`, `.brand/`
   - `BRAND.md`, `BRANDBOOK.md`, `STYLE_GUIDE.md`
   - `figma.json`, `design-tokens.json`, `tailwind.config.*`

2. **Si trouvé**: Annoncer et charger dans le contexte

3. **Si absent**: Proposer à l'utilisateur:
   ```
   Aucune identité visuelle détectée.

   A) Créer un brandbook (lance /create-brandbook)
   B) Utiliser une charte légère (choix de thème)
   C) Ignorer pour l'instant
   ```

## Étape 3: Diagnostic

### Évaluer la phase actuelle (1-9)

| Phase | Nom | Critères de validation |
|-------|-----|------------------------|
| 1 | Discovery | README existe, problème défini |
| 2 | Stratégie | Objectifs clairs, scope MVP |
| 3 | Conception | Architecture documentée, types définis |
| 4 | MVP Core | Code fonctionnel, features de base |
| 5 | Qualité | Tests présents, error handling |
| 6 | Lancement | CI/CD configuré, déployé |
| 7 | Polish | Performance optimisée, a11y |
| 8 | Production Ready | Monitoring complet, scaling |
| 9 | Amélioration Continue | Analytics, feedback loop |

### Scorer chaque catégorie (0-100)

Voir `references/scoring-criteria.md` pour les critères détaillés.

Catégories à scorer:
- Documentation
- Tests
- CI/CD
- Sécurité
- Monitoring
- Performance
- Accessibilité (si webapp)
- Identité visuelle (si applicable)

### Générer le rapport visuel

```
📊 DIAGNOSTIC PROJET : [NOM]

Phase actuelle : X/9 ([Nom Phase])

┌─────────────────────────────────────────┐
│ Documentation    ████████░░  80%        │
│ Tests            ██████░░░░  60%        │
│ CI/CD            █████████░  90%        │
│ ...                                     │
└─────────────────────────────────────────┘

Score global : XX/100

Points forts:
- [Point fort 1]
- [Point fort 2]

Points faibles:
- [Point faible 1]
- [Point faible 2]
```

## Étape 4: Recommandations

### Priorisation

| Priorité | Critère | Symbole |
|----------|---------|---------|
| Critique | Bloque phase suivante ou risque prod | 🔴 |
| Haute | Score catégorie < 50% | 🟠 |
| Moyenne | Score catégorie 50-70% | 🟡 |
| Basse | Nice-to-have | 🟢 |

### Format de chaque recommandation

```markdown
N. **[Titre]** (Score: XX%)
   - Problème : [Description courte]
   - Impact : [Pourquoi c'est important]
   - Action : [Quoi faire concrètement]
   - Effort : [Estimation]
   - Skill suggéré : [Si applicable]
```

### Recommandations contextuelles

Voir `references/recommendations-by-type.md` pour les recommandations spécifiques par type de projet.

## Étape 5: Checklist

### Générer la checklist

```markdown
## ✅ CHECKLIST ONBOARDING - [PROJET]

Générée le : [DATE]
Phase actuelle : X/9 ([Nom])
Prochaine phase cible : Y ([Nom])

### Pour atteindre Phase Y

- [ ] [Action 1 dérivée des recommandations critiques/hautes]
- [ ] [Action 2]
- [ ] ...

### Quick wins (< 2h chacun)

- [ ] [Quick win 1]
- [ ] [Quick win 2]
```

### Proposer l'intégration TodoWrite

```
📋 Checklist générée avec N items.

Veux-tu charger cette checklist dans tes todos ?
  A) Oui, tout charger
  B) Seulement les critiques/hautes
  C) Non, juste le rapport markdown
```

Si A ou B: Utiliser TodoWrite pour créer les todos.

### Sauvegarder les fichiers

Créer dans le projet:
- `docs/onboarding/AUDIT-[DATE].md` - Rapport complet
- `docs/onboarding/CHECKLIST-[DATE].md` - Checklist standalone
- `docs/onboarding/DIAGNOSTIC.yaml` - Données machine-readable

## Références

- Critères de scoring détaillés: `references/scoring-criteria.md`
- Recommandations par type: `references/recommendations-by-type.md`
- Templates de rapport: `references/report-templates.md`
```

**Step 2: Commit**

```bash
cd ~/.claude/skills/onboard
git add SKILL.md
git commit -m "feat(onboard): write main SKILL.md with full workflow"
```

---

## Task 3: Créer les références de scoring

**Files:**
- Create: `~/.claude/skills/onboard/references/scoring-criteria.md`

**Step 1: Créer le fichier de critères de scoring**

Create `~/.claude/skills/onboard/references/scoring-criteria.md`:

```markdown
# Critères de Scoring par Catégorie

## Documentation (100 points)

| Critère | Points |
|---------|--------|
| README.md existe | +15 |
| README.md > 500 mots | +10 |
| Description du projet claire | +10 |
| Instructions d'installation | +15 |
| Instructions d'utilisation | +10 |
| Dossier docs/ existe | +10 |
| Architecture documentée | +15 |
| API documentée (si applicable) | +15 |

## Tests (100 points)

| Critère | Points |
|---------|--------|
| Tests présents (any) | +20 |
| Framework de test configuré | +10 |
| Tests unitaires > 5 | +10 |
| Tests unitaires > 20 | +10 |
| Tests E2E présents | +20 |
| Script test dans package.json | +10 |
| Coverage configuré | +10 |
| Coverage > 50% | +10 |

## CI/CD (100 points)

| Critère | Points |
|---------|--------|
| Fichier CI présent (.github/workflows/, etc.) | +25 |
| Tests automatisés dans CI | +20 |
| Lint/Format dans CI | +15 |
| Build automatisé | +15 |
| Deploy automatisé | +25 |

## Sécurité (100 points)

| Critère | Points |
|---------|--------|
| .env dans .gitignore | +20 |
| Pas de secrets dans le code | +20 |
| Dépendances à jour (< 6 mois) | +15 |
| Headers de sécurité (si webapp) | +15 |
| Validation des entrées | +15 |
| HTTPS configuré | +15 |

## Monitoring (100 points)

| Critère | Points |
|---------|--------|
| Error tracking (Sentry, etc.) | +25 |
| Analytics configuré | +20 |
| Logs structurés | +20 |
| Health check endpoint (si API) | +15 |
| Alertes configurées | +20 |

## Performance (100 points)

| Critère | Points |
|---------|--------|
| Lazy loading implémenté | +20 |
| Images optimisées | +15 |
| Caching configuré | +20 |
| Bundle size raisonnable | +15 |
| Lighthouse > 80 | +15 |
| Lighthouse > 95 | +15 |

## Accessibilité (100 points) - Webapp uniquement

| Critère | Points |
|---------|--------|
| Alt text sur images | +20 |
| Labels sur formulaires | +20 |
| Contraste suffisant | +20 |
| Navigation clavier | +20 |
| ARIA labels | +10 |
| Lighthouse a11y > 90 | +10 |

## Identité Visuelle (100 points) - Si applicable

| Critère | Points |
|---------|--------|
| Palette de couleurs définie | +20 |
| Typographie cohérente | +20 |
| Logo présent | +15 |
| Design system/composants | +20 |
| Variables CSS/tokens | +15 |
| Documentation design | +10 |
```

**Step 2: Commit**

```bash
cd ~/.claude/skills/onboard
git add references/scoring-criteria.md
git commit -m "feat(onboard): add scoring criteria reference"
```

---

## Task 4: Créer les références de recommandations par type

**Files:**
- Create: `~/.claude/skills/onboard/references/recommendations-by-type.md`

**Step 1: Créer le fichier**

Create `~/.claude/skills/onboard/references/recommendations-by-type.md`:

```markdown
# Recommandations par Type de Projet

## Webapp / Site Web

### Recommandations prioritaires
1. **Performance** - Lighthouse, lazy loading, optimisation images
2. **Accessibilité** - WCAG AA, contraste, navigation clavier
3. **SEO** - Meta tags, sitemap, robots.txt
4. **Analytics** - PostHog, GA4, conversion tracking
5. **Sécurité** - HTTPS, CSP, headers sécurité

### Skills suggérés
- `/lighthouse` - Audit performance
- `/a11y` - Audit accessibilité
- `/seo` - Optimisation SEO

## API Backend

### Recommandations prioritaires
1. **Documentation API** - OpenAPI/Swagger
2. **Rate limiting** - Protection contre abuse
3. **Versioning** - Stratégie de versions
4. **Validation** - Schemas de validation (Zod, Joi)
5. **Monitoring** - Logs, métriques, tracing

### Skills suggérés
- `/openapi` - Générer documentation
- `/security-audit` - Audit sécurité API

## CLI Tool

### Recommandations prioritaires
1. **Help messages** - `--help` complet et clair
2. **Man pages** - Documentation Unix
3. **Autocompletion** - Bash/Zsh/Fish
4. **Error messages** - Messages clairs et actionnables
5. **Configuration** - Fichier config, env vars

### Skills suggérés
- `/cli-polish` - Améliorer UX CLI

## Library / Package

### Recommandations prioritaires
1. **Documentation** - README, API docs, exemples
2. **Types** - TypeScript definitions
3. **Tests** - Couverture élevée (>80%)
4. **Changelog** - Historique des versions
5. **CI** - Tests sur multiple versions Node/Python

### Skills suggérés
- `/docs-gen` - Générer documentation

## Documentation / Research

### Recommandations prioritaires
1. **Structure** - Navigation claire, TOC
2. **Search** - Recherche full-text
3. **Citations** - Références sourcées
4. **Export** - PDF, formats multiples
5. **Versioning** - Historique des modifications

### Skills suggérés
- `/docs-site` - Générer site de documentation
```

**Step 2: Créer le fichier de templates de rapport**

Create `~/.claude/skills/onboard/references/report-templates.md`:

```markdown
# Templates de Rapport

## Template AUDIT-[DATE].md

```markdown
# Audit Projet - [NOM]

**Date** : [DATE]
**Analysé par** : Claude Code (Skill /onboard)

---

## Informations Générales

| Élément | Valeur |
|---------|--------|
| Type de projet | [type] |
| Stack | [stack] |
| Maturité | [maturité] |
| Phase actuelle | [X]/9 ([Nom]) |

---

## Diagnostic Détaillé

### Scores par Catégorie

[Tableau visuel des scores]

### Points Forts

- [Point 1]
- [Point 2]

### Points à Améliorer

- [Point 1]
- [Point 2]

---

## Recommandations

### 🔴 Critique

[Recommandations critiques ou "Aucune"]

### 🟠 Haute Priorité

[Recommandations haute priorité]

### 🟡 Moyenne Priorité

[Recommandations moyenne priorité]

### 🟢 Nice-to-have

[Recommandations basse priorité]

---

## Prochaines Étapes

Pour atteindre la phase [Y] ([Nom]) :

1. [Action 1]
2. [Action 2]
3. [Action 3]

---

*Généré automatiquement par le skill /onboard*
```

## Template DIAGNOSTIC.yaml

```yaml
project:
  name: "[NOM]"
  type: "[type]"
  stack: "[stack]"
  maturity: "[maturité]"

diagnosis:
  current_phase: [X]
  phase_name: "[Nom]"
  global_score: [XX]

scores:
  documentation: [XX]
  tests: [XX]
  ci_cd: [XX]
  security: [XX]
  monitoring: [XX]
  performance: [XX]
  accessibility: [XX]
  visual_identity: [XX]

strengths:
  - "[Point fort 1]"
  - "[Point fort 2]"

weaknesses:
  - "[Point faible 1]"
  - "[Point faible 2]"

recommendations:
  critical: []
  high:
    - title: "[Titre]"
      score: [XX]
      problem: "[Description]"
      action: "[Action]"
      effort: "[Estimation]"
  medium: []
  low: []

generated:
  date: "[DATE]"
  by: "claude-code/onboard"
```
```

**Step 3: Commit**

```bash
cd ~/.claude/skills/onboard
git add references/
git commit -m "feat(onboard): add recommendations and report templates"
```

---

## Task 5: Créer le script de détection de stack (optionnel)

**Files:**
- Create: `~/.claude/skills/onboard/scripts/detect_stack.py`

**Step 1: Créer le script**

Create `~/.claude/skills/onboard/scripts/detect_stack.py`:

```python
#!/usr/bin/env python3
"""
Détecte automatiquement la stack technologique d'un projet.
Usage: python detect_stack.py [path]
"""

import json
import os
import sys
from pathlib import Path

def detect_stack(project_path: str = ".") -> dict:
    """Analyse un projet et retourne sa stack détectée."""
    path = Path(project_path)
    result = {
        "type": "unknown",
        "language": "unknown",
        "framework": None,
        "runtime": None,
        "database": None,
        "has_tests": False,
        "has_ci": False,
        "has_docker": False,
    }

    # Detect language and framework
    if (path / "package.json").exists():
        result["language"] = "javascript/typescript"
        with open(path / "package.json") as f:
            pkg = json.load(f)
            deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}

            if "next" in deps:
                result["framework"] = "next.js"
                result["type"] = "webapp"
            elif "react" in deps:
                result["framework"] = "react"
                result["type"] = "webapp"
            elif "vue" in deps:
                result["framework"] = "vue"
                result["type"] = "webapp"
            elif "express" in deps:
                result["framework"] = "express"
                result["type"] = "api"
            elif "fastify" in deps:
                result["framework"] = "fastify"
                result["type"] = "api"

            if "vitest" in deps or "jest" in deps:
                result["has_tests"] = True

            if "prisma" in deps:
                result["database"] = "prisma"

    elif (path / "requirements.txt").exists() or (path / "pyproject.toml").exists():
        result["language"] = "python"
        result["runtime"] = "python"

    elif (path / "go.mod").exists():
        result["language"] = "go"
        result["runtime"] = "go"

    elif (path / "Cargo.toml").exists():
        result["language"] = "rust"
        result["runtime"] = "rust"

    # Detect CI
    if (path / ".github" / "workflows").exists():
        result["has_ci"] = True
    elif (path / ".gitlab-ci.yml").exists():
        result["has_ci"] = True

    # Detect Docker
    if (path / "Dockerfile").exists() or (path / "docker-compose.yml").exists():
        result["has_docker"] = True

    # Detect project type by structure
    if result["type"] == "unknown":
        if (path / "src" / "pages").exists() or (path / "src" / "app").exists():
            result["type"] = "webapp"
        elif (path / "src" / "components").exists():
            result["type"] = "webapp"
        elif (path / "bin").exists():
            result["type"] = "cli"
        elif list(path.glob("*.md")) and not (path / "src").exists():
            result["type"] = "docs"

    return result

if __name__ == "__main__":
    project_path = sys.argv[1] if len(sys.argv) > 1 else "."
    result = detect_stack(project_path)
    print(json.dumps(result, indent=2))
```

**Step 2: Rendre exécutable**

```bash
chmod +x ~/.claude/skills/onboard/scripts/detect_stack.py
```

**Step 3: Tester le script**

Run: `python ~/.claude/skills/onboard/scripts/detect_stack.py /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13`

Expected output (exemple):
```json
{
  "type": "webapp",
  "language": "javascript/typescript",
  "framework": "next.js",
  ...
}
```

**Step 4: Commit**

```bash
cd ~/.claude/skills/onboard
git add scripts/
git commit -m "feat(onboard): add stack detection script"
```

---

## Task 6: Tester le skill sur un projet exemple

**Step 1: Tester sur lab-13 (Bonsai Tracker)**

Lancer manuellement le workflow du skill sur `/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13`:

1. Exécuter l'audit (lire structure, package.json, etc.)
2. Vérifier la détection de type (devrait être "webapp")
3. Vérifier la détection de brandbook (absent → proposer)
4. Générer un diagnostic (phase estimée: 6-7)
5. Générer des recommandations
6. Générer une checklist

**Step 2: Tester sur B974 (projet existant)**

Lancer manuellement le workflow sur `/Users/manuelturpin/Desktop/bonsai974/VPS-b974.fr`:

1. Vérifier que le type est bien détecté (webapp)
2. Vérifier que le brandbook b974-brand-guidelines est détecté
3. Vérifier que la phase est bien estimée (7-8 production)

**Step 3: Ajuster si nécessaire**

Si des ajustements sont nécessaires au SKILL.md ou aux références, les effectuer et committer.

---

## Task 7: Packager et finaliser le skill

**Step 1: Vérifier la structure finale**

```bash
ls -laR ~/.claude/skills/onboard/
```

Expected:
```
onboard/
├── SKILL.md
├── references/
│   ├── scoring-criteria.md
│   ├── recommendations-by-type.md
│   └── report-templates.md
└── scripts/
    └── detect_stack.py
```

**Step 2: Commit final**

```bash
cd ~/.claude/skills/onboard
git add .
git commit -m "feat(onboard): complete skill implementation v1.0"
```

**Step 3: Vérifier que le skill est disponible**

Le skill devrait maintenant apparaître dans la liste des skills disponibles dans Claude Code.

Run: Dans Claude Code, taper `/onboard` ou demander "audit mon projet"

Expected: Le skill se déclenche et commence l'analyse.

---

## Résumé des fichiers créés

```
~/.claude/skills/onboard/
├── SKILL.md                              # Instructions principales (500 lignes)
├── references/
│   ├── scoring-criteria.md               # Critères de scoring détaillés
│   ├── recommendations-by-type.md        # Recommandations par type de projet
│   └── report-templates.md               # Templates de rapport
└── scripts/
    └── detect_stack.py                   # Script de détection de stack
```

---

## Évolutions futures (hors scope v1)

- [ ] Skill `/create-brandbook` complémentaire
- [ ] Support multi-langage (Python, Go, Rust)
- [ ] Intégration avec GitHub Issues pour créer les tâches
- [ ] Mode "recherche" avec critères spécifiques
- [ ] Dashboard HTML généré
