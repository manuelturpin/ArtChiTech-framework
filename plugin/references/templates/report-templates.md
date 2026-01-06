# Templates de Rapport

Templates pour les fichiers de sortie generes par le skill `/onboard`.

---

## Template 1: AUDIT-[DATE].md

Rapport d'audit complet au format Markdown.

```markdown
# Audit Projet - [NOM_PROJET]

**Date** : [DATE_ISO]
**Analyse par** : Claude Code (Skill /onboard)
**Version skill** : 1.0

---

## Resume Executif

| Element | Valeur |
|---------|--------|
| Type de projet | [webapp/api/cli/library/docs/research] |
| Stack principale | [stack] |
| Maturite | [prototype/mvp/production/mature] |
| Phase actuelle | [X]/9 ([Nom_Phase]) |
| Score global | [XX]/100 |

### Verdict

[PRET_PRODUCTION / AMELIORATIONS_REQUISES / REFACTORING_CONSEILLE]

---

## Informations Projet

### Structure detectee

```
[ARBORESCENCE_PROJET]
```

### Stack technique

| Categorie | Technologie |
|-----------|-------------|
| Langage | [langage] |
| Framework | [framework] |
| Runtime | [runtime] |
| Database | [database] |
| CI/CD | [ci_provider] |

### Dependances principales

| Package | Version | Statut |
|---------|---------|--------|
| [dep1] | [version] | [OK/OUTDATED/VULNERABLE] |
| [dep2] | [version] | [OK/OUTDATED/VULNERABLE] |

---

## Diagnostic Detaille

### Scores par Categorie

```
+------------------------------------------+
| Documentation    [========  ]  80/100    |
| Tests            [======    ]  60/100    |
| CI/CD            [========= ]  90/100    |
| Securite         [=======   ]  70/100    |
| Monitoring       [====      ]  40/100    |
| Performance      [========  ]  85/100    |
| Accessibilite    [=======   ]  75/100    |
| Identite visuelle[======    ]  60/100    |
+------------------------------------------+

Score global : [XX]/100
```

### Phase actuelle : [X]/9 - [NOM_PHASE]

**Criteres valides :**
- [x] [Critere 1]
- [x] [Critere 2]

**Criteres manquants pour phase [X+1] :**
- [ ] [Critere manquant 1]
- [ ] [Critere manquant 2]

---

## Analyse par Categorie

### Documentation ([XX]%)

**Points forts :**
- [Point positif 1]
- [Point positif 2]

**Points a ameliorer :**
- [Point a ameliorer 1]
- [Point a ameliorer 2]

**Fichiers analyses :**
- `README.md` - [PRESENT/ABSENT] ([XX] mots)
- `docs/` - [PRESENT/ABSENT] ([XX] fichiers)
- `CONTRIBUTING.md` - [PRESENT/ABSENT]

### Tests ([XX]%)

**Points forts :**
- [Point positif 1]

**Points a ameliorer :**
- [Point a ameliorer 1]

**Metriques :**
- Fichiers de test : [XX]
- Framework : [vitest/jest/pytest/none]
- Couverture : [XX%/non_configuree]

### CI/CD ([XX]%)

**Configuration detectee :**
- Provider : [github_actions/gitlab_ci/none]
- Workflows : [liste]
- Deploy : [auto/manuel/none]

### Securite ([XX]%)

**Verification :**
- [x] .env dans .gitignore
- [ ] Secrets scannes (aucun trouve)
- [ ] Dependances a jour

**Alertes :**
- [Alerte 1 si applicable]

### Monitoring ([XX]%)

**Outils detectes :**
- Error tracking : [sentry/none]
- Analytics : [posthog/ga4/none]
- Logs : [structures/basiques/none]

### Performance ([XX]%)

*Applicable si webapp*

**Metriques Lighthouse (si disponibles) :**
- Performance : [XX]
- Accessibilite : [XX]
- Best Practices : [XX]
- SEO : [XX]

### Accessibilite ([XX]%)

*Applicable si webapp*

**Verification :**
- [ ] Alt text images
- [ ] Labels formulaires
- [ ] Navigation clavier
- [ ] Contraste suffisant

### Identite Visuelle ([XX]%)

*Si applicable*

**Status :** [detectee/absente/non_applicable]
**Fichiers :** [liste ou "Aucun"]

---

## Recommandations

### [CRITICAL] Critique - Bloquant

> Actions a effectuer immediatement

**1. [Titre recommandation]** (Score actuel: [XX]%)

- **Probleme** : [Description du probleme]
- **Impact** : [Consequence si non resolu]
- **Action** : [Etapes concretes]
- **Effort** : [Faible/Moyen/Eleve]
- **Skill suggere** : `/[skill-name]`

### [HIGH] Haute priorite - Score < 50%

**2. [Titre recommandation]** (Score actuel: [XX]%)

- **Probleme** : [Description]
- **Impact** : [Consequence]
- **Action** : [Etapes]
- **Effort** : [Estimation]

### [MEDIUM] Moyenne priorite - Score 50-70%

**3. [Titre recommandation]** (Score actuel: [XX]%)

- **Probleme** : [Description]
- **Action** : [Etapes]
- **Effort** : [Estimation]

### [LOW] Nice-to-have

**4. [Titre recommandation]**

- [Description courte]

---

## Prochaines Etapes

### Objectif : Atteindre Phase [Y] - [NOM_PHASE_Y]

Pour passer de la phase [X] a la phase [Y], effectuer :

1. **[Action 1]** (Priorite: [CRITICAL/HIGH])
   - [Detail]
   - Effort estime : [duree]

2. **[Action 2]** (Priorite: [HIGH/MEDIUM])
   - [Detail]
   - Effort estime : [duree]

3. **[Action 3]** (Priorite: [MEDIUM])
   - [Detail]
   - Effort estime : [duree]

### Quick Wins (< 2h chacun)

- [ ] [Quick win 1]
- [ ] [Quick win 2]
- [ ] [Quick win 3]

---

## Checklist Complete

### Pour Phase [Y]

- [ ] [Action derivee recommandation 1]
- [ ] [Action derivee recommandation 2]
- [ ] [Action derivee recommandation 3]

### Ameliorations continues

- [ ] [Amelioration 1]
- [ ] [Amelioration 2]

---

## Annexes

### Fichiers analyses

| Fichier | Status | Notes |
|---------|--------|-------|
| [fichier1] | [OK/WARNING/ERROR] | [notes] |

### Commandes executees

```bash
# Audit structure
ls -la

# Detection stack
cat package.json | jq '.dependencies'

# Verification tests
find . -name "*.test.*" -o -name "*.spec.*"
```

---

*Rapport genere automatiquement par le skill `/onboard` v1.0*
*Pour re-executer: `/onboard` ou "audit mon projet"*
```

---

## Template 2: DIAGNOSTIC.yaml

Sortie machine-readable au format YAML.

```yaml
# DIAGNOSTIC.yaml
# Genere par: Claude Code - Skill /onboard
# Date: [DATE_ISO]
# Version: 1.0

# ============================================
# INFORMATIONS PROJET
# ============================================

project:
  name: "[NOM_PROJET]"
  path: "[CHEMIN_ABSOLU]"
  type: "[webapp|api|cli|library|docs|research]"

stack:
  language: "[javascript|typescript|python|go|rust|other]"
  framework: "[next.js|react|vue|express|fastify|django|flask|null]"
  runtime: "[node|deno|bun|python|go|rust|null]"
  database: "[prisma|drizzle|sqlalchemy|gorm|null]"

maturity: "[prototype|mvp|production|mature]"

# ============================================
# DIAGNOSTIC
# ============================================

diagnosis:
  current_phase: [1-9]
  phase_name: "[Discovery|Strategie|Conception|MVP_Core|Qualite|Lancement|Polish|Production_Ready|Amelioration_Continue]"
  next_phase: [2-9]
  next_phase_name: "[Nom_Phase_Suivante]"
  global_score: [0-100]
  verdict: "[PRET_PRODUCTION|AMELIORATIONS_REQUISES|REFACTORING_CONSEILLE]"

# ============================================
# SCORES PAR CATEGORIE
# ============================================

scores:
  documentation:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
  tests:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
  ci_cd:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
  security:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
  monitoring:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
  performance:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
    applicable: [true|false]
  accessibility:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical]"
    applicable: [true|false]
  visual_identity:
    value: [0-100]
    status: "[excellent|good|acceptable|poor|critical|not_applicable]"
    applicable: [true|false]

# Score status mapping:
# excellent: 90-100
# good: 70-89
# acceptable: 50-69
# poor: 30-49
# critical: 0-29

# ============================================
# ANALYSE
# ============================================

strengths:
  - category: "[documentation|tests|ci_cd|security|monitoring|performance|accessibility|visual_identity]"
    description: "[Point fort 1]"
  - category: "[category]"
    description: "[Point fort 2]"

weaknesses:
  - category: "[category]"
    description: "[Point faible 1]"
    impact: "[high|medium|low]"
  - category: "[category]"
    description: "[Point faible 2]"
    impact: "[high|medium|low]"

# ============================================
# RECOMMANDATIONS
# ============================================

recommendations:
  critical:
    - id: "rec_001"
      title: "[Titre recommandation critique]"
      category: "[category]"
      current_score: [XX]
      problem: "[Description du probleme]"
      impact: "[Consequence si non resolu]"
      action: "[Action concrete a effectuer]"
      effort: "[low|medium|high|very_high]"
      suggested_skill: "[skill_name|null]"

  high:
    - id: "rec_002"
      title: "[Titre recommandation haute priorite]"
      category: "[category]"
      current_score: [XX]
      problem: "[Description]"
      action: "[Action]"
      effort: "[low|medium|high]"
      suggested_skill: "[skill_name|null]"

  medium:
    - id: "rec_003"
      title: "[Titre]"
      category: "[category]"
      current_score: [XX]
      action: "[Action]"
      effort: "[low|medium|high]"

  low:
    - id: "rec_004"
      title: "[Titre nice-to-have]"
      action: "[Action]"

# ============================================
# CHECKLIST
# ============================================

checklist:
  target_phase: [Y]
  target_phase_name: "[Nom Phase Y]"

  blocking_items:
    - id: "chk_001"
      task: "[Tache bloquante 1]"
      from_recommendation: "rec_001"
      effort: "[low|medium|high]"
      completed: false

  priority_items:
    - id: "chk_002"
      task: "[Tache prioritaire]"
      from_recommendation: "rec_002"
      effort: "[low|medium|high]"
      completed: false

  quick_wins:
    - id: "qw_001"
      task: "[Quick win 1]"
      effort: "low"
      estimated_time: "< 2h"
      completed: false
    - id: "qw_002"
      task: "[Quick win 2]"
      effort: "low"
      estimated_time: "< 2h"
      completed: false

# ============================================
# METADATA
# ============================================

metadata:
  generated:
    date: "[DATE_ISO]"
    timestamp: [UNIX_TIMESTAMP]
    by: "claude-code/onboard"
    version: "1.0"

  files_analyzed:
    count: [XX]
    list:
      - path: "[chemin/fichier1]"
        type: "[config|source|test|doc]"
      - path: "[chemin/fichier2]"
        type: "[type]"

  commands_executed:
    - command: "ls -la"
      purpose: "Structure detection"
    - command: "cat package.json"
      purpose: "Stack detection"

# ============================================
# INTEGRATIONS
# ============================================

integrations:
  todowrite:
    enabled: false
    items_count: 0

  github_issues:
    enabled: false
    issues_created: []
```

---

## Template 3: CHECKLIST-[DATE].md

Checklist standalone extraite du rapport.

```markdown
# Checklist Onboarding - [NOM_PROJET]

**Generee le** : [DATE]
**Phase actuelle** : [X]/9 ([Nom_Phase])
**Phase cible** : [Y]/9 ([Nom_Phase_Y])

---

## Bloquant - A faire en premier

- [ ] **[Tache 1]** - [CRITICAL]
  - Detail: [description]
  - Effort: [estimation]

- [ ] **[Tache 2]** - [CRITICAL]
  - Detail: [description]
  - Effort: [estimation]

---

## Haute priorite

- [ ] **[Tache 3]** - [HIGH]
  - [description courte]

- [ ] **[Tache 4]** - [HIGH]
  - [description courte]

---

## Quick Wins (< 2h chacun)

- [ ] [Quick win 1]
- [ ] [Quick win 2]
- [ ] [Quick win 3]

---

## Ameliorations continues

- [ ] [Amelioration 1]
- [ ] [Amelioration 2]

---

## Progression

| Categorie | Avant | Cible |
|-----------|-------|-------|
| Documentation | [XX]% | [YY]% |
| Tests | [XX]% | [YY]% |
| CI/CD | [XX]% | [YY]% |

---

*Checklist generee par `/onboard` - [DATE]*
```

---

## Usage des templates

### Generation automatique

Le skill `/onboard` genere ces fichiers dans:

```
[PROJET]/docs/onboarding/
├── AUDIT-[DATE].md      # Rapport complet
├── CHECKLIST-[DATE].md  # Checklist standalone
└── DIAGNOSTIC.yaml      # Donnees machine-readable
```

### Variables a remplacer

| Variable | Description | Exemple |
|----------|-------------|---------|
| `[NOM_PROJET]` | Nom du projet | "Bonsai Tracker" |
| `[DATE]` | Date format court | "2026-01-05" |
| `[DATE_ISO]` | Date ISO 8601 | "2026-01-05T14:30:00Z" |
| `[X]` | Phase actuelle (1-9) | 6 |
| `[Y]` | Phase cible (X+1) | 7 |
| `[XX]` | Score numerique | 75 |

### Integration TodoWrite

Si l'utilisateur accepte, les items de checklist sont convertis en todos:

```javascript
// Conversion checklist -> TodoWrite
{
  content: "[Tache]",
  status: "pending",
  activeForm: "[Tache en cours]"
}
```
