---
name: onboard
description: Analyse un projet existant et produit un diagnostic complet avec recommandations. Utiliser quand l'utilisateur veut (1) auditer un projet, (2) savoir où en est son projet, (3) obtenir des recommandations d'amélioration, (4) générer une checklist de prochaines étapes, ou (5) intégrer le framework projet à un projet existant. Triggers: /onboard, "audit mon projet", "analyse ce projet", "où en est mon projet", "que dois-je améliorer".
---

# Onboard - Audit et Diagnostic de Projet

Analyser un projet existant et produire un diagnostic complet avec des recommandations actionnables.

## Modes de Déclenchement

| Mode | Contexte | Description |
|------|----------|-------------|
| Automatique | Spawnée par `/projet` | Projet existant détecté sans `.epct/` |
| Manuel | Appelée directement | Ré-audit ou utilisateurs avancés |

**Note** : Dans les deux cas, le comportement est identique. La différence est uniquement dans le déclenchement.

## Flux d'exécution

1. **AUDIT** - Analyser la structure, stack, tests, CI/CD, docs
2. **BRANDBOOK** - Detecter/proposer l'identite visuelle (adaptatif)
3. **DIAGNOSTIC** - Evaluer la phase actuelle et scorer par categorie
4. **RECOMMANDATIONS** - Generer des actions priorisees
5. **CHECKLIST** - Creer des todos actionnables

---

## Etape 1: Audit Automatique

### Analyser ces elements

| Categorie | Commandes/Fichiers a verifier |
|-----------|------------------------------|
| Structure | `ls -la`, presence de src/, tests/, docs/ |
| Stack | `package.json`, `requirements.txt`, `go.mod`, `Cargo.toml` |
| Type | Indices dans dependencies et structure |
| Tests | `**/test*`, `**/*.test.*`, `**/*.spec.*` |
| CI/CD | `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile` |
| Documentation | `README.md`, `docs/`, `*.md` |
| Securite | `.env*`, `.gitignore`, headers config |
| Database | `prisma/`, `migrations/`, `*.sql` |
| Monitoring | Sentry, PostHog, analytics config |

### Determiner le type de projet

```
webapp     -> src/pages/ OR src/app/ OR src/components/ + framework web
api        -> Uniquement routes/endpoints, pas de composants UI
cli        -> bin/, commander/yargs deps, --help patterns
library    -> main/exports dans package.json, pas d'app
docs       -> docs/ sans src/, majoritairement .md
research   -> Fichiers .md majoritaires, pas de code
```

### Output de l'audit

Generer mentalement:

```yaml
type_projet: [webapp|api|cli|library|docs|research]
stack: [detected-stack]
identite_visuelle: [requise|optionnelle|ignoree]
maturite: [prototype|mvp|production|mature]
```

---

## Etape 2: Gestion Brandbook

### Comportement adaptatif selon le type

| Type | Identite visuelle |
|------|-------------------|
| webapp, mobile | **Requise** -> Brandbook complet |
| docs, research | **Optionnelle** -> Charte legere |
| api, cli, library | **Ignoree** -> Skip automatique |

### Si identite visuelle requise ou optionnelle

1. Rechercher des fichiers existants:
   - `docs/brand/`, `docs/design/`, `.brand/`
   - `BRAND.md`, `BRANDBOOK.md`, `STYLE_GUIDE.md`
   - `figma.json`, `design-tokens.json`, `tailwind.config.*`
   - Skills utilisateur avec "brand" dans le nom

2. **Si trouve**: Annoncer et charger dans le contexte

3. **Si absent**: Proposer a l'utilisateur:
   ```
   Aucune identite visuelle detectee.

   A) Creer un brandbook (lance /create-brandbook)
   B) Utiliser une charte legere (choix de theme)
   C) Ignorer pour l'instant
   ```

---

## Etape 3: Diagnostic

### Evaluer la phase actuelle (1-9)

| Phase | Nom | Criteres de validation |
|-------|-----|------------------------|
| 1 | Discovery | README existe, probleme defini |
| 2 | Strategie | Objectifs clairs, scope MVP |
| 3 | Conception | Architecture documentee, types definis |
| 4 | MVP Core | Code fonctionnel, features de base |
| 5 | Qualite | Tests presents, error handling |
| 6 | Lancement | CI/CD configure, deploye |
| 7 | Polish | Performance optimisee, a11y |
| 8 | Production Ready | Monitoring complet, scaling |
| 9 | Amelioration Continue | Analytics, feedback loop |

### Scorer chaque categorie (0-100)

Voir `references/scoring-criteria.md` pour les criteres detailles.

Categories a scorer:
- Documentation
- Tests
- CI/CD
- Securite
- Monitoring
- Performance
- Accessibilite (si webapp)
- Identite visuelle (si applicable)

### Generer le rapport visuel

```
DIAGNOSTIC PROJET : [NOM]

Phase actuelle : X/9 ([Nom Phase])

+------------------------------------------+
| Documentation    [========  ]  80%       |
| Tests            [======    ]  60%       |
| CI/CD            [========= ]  90%       |
| ...                                      |
+------------------------------------------+

Score global : XX/100

Points forts:
- [Point fort 1]
- [Point fort 2]

Points faibles:
- [Point faible 1]
- [Point faible 2]
```

---

## Etape 4: Recommandations

### Priorisation

| Priorite | Critere | Symbole |
|----------|---------|---------|
| Critique | Bloque phase suivante ou risque prod | [CRITICAL] |
| Haute | Score categorie < 50% | [HIGH] |
| Moyenne | Score categorie 50-70% | [MEDIUM] |
| Basse | Nice-to-have | [LOW] |

### Format de chaque recommandation

```markdown
N. **[Titre]** (Score: XX%)
   - Probleme : [Description courte]
   - Impact : [Pourquoi c'est important]
   - Action : [Quoi faire concretement]
   - Effort : [Estimation]
   - Skill suggere : [Si applicable]
```

### Recommandations contextuelles

Voir `references/recommendations-by-type.md` pour les recommandations specifiques par type de projet.

---

## Etape 5: Checklist

### Generer la checklist

```markdown
## CHECKLIST ONBOARDING - [PROJET]

Generee le : [DATE]
Phase actuelle : X/9 ([Nom])
Prochaine phase cible : Y ([Nom])

### Pour atteindre Phase Y

- [ ] [Action 1 derivee des recommandations critiques/hautes]
- [ ] [Action 2]
- [ ] ...

### Quick wins (< 2h chacun)

- [ ] [Quick win 1]
- [ ] [Quick win 2]
```

### Proposer l'integration TodoWrite

```
Checklist generee avec N items.

Veux-tu charger cette checklist dans tes todos ?
  A) Oui, tout charger
  B) Seulement les critiques/hautes
  C) Non, juste le rapport markdown
```

Si A ou B: Utiliser TodoWrite pour creer les todos.

### Sauvegarder les fichiers

Creer dans le projet:
- `docs/onboarding/AUDIT-[DATE].md` - Rapport complet
- `docs/onboarding/CHECKLIST-[DATE].md` - Checklist standalone
- `docs/onboarding/DIAGNOSTIC.yaml` - Donnees machine-readable

---

## References

- Criteres de scoring detailles: `references/scoring-criteria.md`
- Recommandations par type: `references/recommendations-by-type.md`
- Templates de rapport: `references/report-templates.md`
