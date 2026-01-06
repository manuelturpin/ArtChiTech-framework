# Design : Skill `/onboard` - Framework Projet Claude Code

**Date** : 2026-01-05
**Statut** : Validé
**Version** : 1.0

---

## Objectif

Créer un skill `/onboard` qui analyse un projet existant et produit un diagnostic complet avec des recommandations actionnables, en respectant l'identité visuelle si elle existe.

---

## Flux Principal

```
/onboard
    │
    ├─→ 1. AUDIT : Analyse automatique du projet
    │       - Structure, stack, tests, CI/CD, docs...
    │
    ├─→ 2. BRANDBOOK : Détection identité visuelle (adaptatif)
    │       ├─ Trouvé → Intégrer au contexte
    │       ├─ Absent → Proposer création (skill)
    │       └─ Ignorer → Proposer thèmes génériques
    │
    ├─→ 3. DIAGNOSTIC : Où en est le projet ?
    │       - Phase actuelle (Discovery → Production)
    │       - Score par catégorie
    │
    ├─→ 4. RECOMMANDATIONS : Que faire ensuite ?
    │       - Priorisées par impact
    │       - Adaptées au contexte
    │
    └─→ 5. CHECKLIST : Actions concrètes
            - Générée selon le diagnostic
            - Intégrée aux todos Claude Code
```

---

## Section 1 : Audit Automatique

### Éléments analysés

| Catégorie | Éléments détectés |
|-----------|-------------------|
| **Structure** | Monorepo, dossiers standards, organisation |
| **Stack** | Langage, framework, runtime, dépendances |
| **Type de projet** | Webapp, API, CLI, bibliothèque, docs, recherche |
| **Tests** | Présence, framework, couverture estimée |
| **CI/CD** | GitHub Actions, scripts de deploy |
| **Documentation** | README, docs/, commentaires |
| **Sécurité** | .env, secrets, headers, validations |
| **Base de données** | Type, ORM, migrations |
| **Monitoring** | Logs, analytics, error tracking |

### Détection du type de projet

```
Indices analysés :
├─ package.json → scripts, dependencies
├─ Présence de src/pages ou src/app → Webapp
├─ Présence de src/components → Interface visuelle
├─ Présence uniquement routes API → Backend pur
├─ Présence de bin/ ou CLI flags → CLI tool
├─ Présence de docs/ sans src/ → Documentation/Recherche
└─ Fichiers .md majoritaires → Projet recherche
```

### Output de l'audit

```yaml
type_projet: webapp          # webapp | api | cli | library | docs | research
stack: next.js-typescript    # détecté automatiquement
identite_visuelle: requise   # requise | optionnelle | ignorée
maturite: production         # prototype | mvp | production | mature
```

---

## Section 2 : Gestion Brandbook / Identité Visuelle

### Comportement adaptatif

| Type projet | Identité visuelle | Ce qui est proposé |
|-------------|-------------------|---------------------|
| **Webapp / Site** | Requise | Brandbook complet |
| **App mobile** | Requise | Brandbook complet |
| **Documentation** | Optionnelle | Charte légère |
| **Recherche** | Optionnelle | Charte légère |
| **API backend** | Ignorée | Rien (skip auto) |
| **CLI / Library** | Ignorée | Rien (skip auto) |

### Flux de décision

```
Identité visuelle requise/optionnelle ?
    │
    ├─→ Recherche dans le projet :
    │       - docs/brand/, docs/design/, .brand/
    │       - BRAND.md, BRANDBOOK.md, STYLE_GUIDE.md
    │       - figma.json, design-tokens.json
    │
    ├─→ SI TROUVÉ :
    │       → "Brandbook détecté : docs/brand/BRANDBOOK.md"
    │       → Charger et intégrer au contexte projet
    │
    └─→ SI ABSENT :
            │
            ├─→ Question à l'utilisateur :
            │
            │   "Aucune identité visuelle détectée."
            │
            │   A) Créer un brandbook (lance /create-brandbook)
            │   B) Utiliser une charte légère (choix thème)
            │   C) Ignorer pour l'instant
```

### Brandbook complet vs Charte légère

| Élément | Brandbook complet | Charte légère |
|---------|-------------------|---------------|
| Couleurs | Palette complète + sémantique | 2-3 couleurs principales |
| Typographie | Fonts + hiérarchie | Font système ou 1 font |
| Logo | Requis + variantes | Non requis |
| Ton de voix | Guidelines rédaction | Non inclus |
| Composants | Design system | Non inclus |
| Fichier généré | `BRANDBOOK.md` | `STYLE.md` |

---

## Section 3 : Diagnostic

### Phases évaluées (1-9)

| Phase | Nom | Ce qui est vérifié |
|-------|-----|---------------------|
| 1 | Discovery | Docs de contexte, README, problème défini |
| 2 | Stratégie | Roadmap, MVP scope, objectifs clairs |
| 3 | Conception | Architecture, types, modèle de données |
| 4 | MVP Core | Code fonctionnel, features de base |
| 5 | Qualité | Tests, validation, error handling |
| 6 | Lancement | CI/CD, deploy, monitoring basique |
| 7 | Polish | UX, performance, accessibilité |
| 8 | Production Ready | Scaling, monitoring complet, runbooks |
| 9 | Amélioration Continue | Analytics, feedback loop, KPIs |

### Scoring par catégorie (0-100)

```
📊 DIAGNOSTIC PROJET : [NOM]

Phase actuelle : X/9 (Nom Phase)

┌─────────────────────────────────────────┐
│ Documentation    ████████░░  80%        │
│ Tests            ██████░░░░  60%        │
│ CI/CD            █████████░  90%        │
│ Sécurité         █████████░  90%        │
│ Monitoring       ███████░░░  70%        │
│ Performance      ████████░░  80%        │
│ Accessibilité    ██████░░░░  60%        │
│ Identité visuelle████████░░  80%        │
└─────────────────────────────────────────┘

Score global : XX/100
```

### Critères de scoring (exemple Tests)

| Critère | Points |
|---------|--------|
| Tests présents | +20 |
| Framework configuré (vitest, jest...) | +10 |
| Tests unitaires > 10 | +20 |
| Tests E2E présents | +20 |
| Coverage > 50% | +15 |
| Coverage > 80% | +15 |
| **Total possible** | **100** |

### Output du diagnostic

```yaml
phase_actuelle: 7
phase_nom: "Polish"
score_global: 76
scores:
  documentation: 80
  tests: 60
  ci_cd: 90
  securite: 90
  monitoring: 70
  performance: 80
  accessibilite: 60
  identite_visuelle: 80
points_forts:
  - "CI/CD complet avec GitHub Actions"
  - "Sécurité production bien configurée"
points_faibles:
  - "Couverture de tests insuffisante"
  - "Accessibilité à améliorer"
```

---

## Section 4 : Recommandations

### Logique de priorisation

| Priorité | Critère | Exemple |
|----------|---------|---------|
| 🔴 **Critique** | Bloque la phase suivante ou risque prod | Pas de tests, secrets exposés |
| 🟠 **Haute** | Score catégorie < 50% | Tests à 40%, docs manquantes |
| 🟡 **Moyenne** | Score catégorie 50-70% | Accessibilité à 60% |
| 🟢 **Basse** | Amélioration nice-to-have | Polish UX, optimisations |

### Format des recommandations

```markdown
## 📋 RECOMMANDATIONS POUR [PROJET]

### 🔴 Critique (à faire maintenant)

Aucune - le projet est stable en production ✅

### 🟠 Haute (prochaine étape)

1. **Augmenter la couverture de tests** (Score: 60%)
   - Problème : Pas de tests unitaires automatisés détectés
   - Impact : Risque de régression lors des évolutions
   - Action : Ajouter tests Vitest pour les composants critiques
   - Effort : ~2-3 jours
   - Skill suggéré : `/test-setup`

### 🟡 Moyenne

2. **Compléter le monitoring** (Score: 70%)
   - Problème : Pas d'alertes automatiques configurées
   - Impact : Détection tardive des incidents
   - Action : Configurer Uptime Robot ou équivalent
   - Effort : ~2 heures

### 🟢 Basse (quand tu as le temps)

3. **Ajouter des runbooks opérationnels**
   - Les procédures existent mais pas formalisées
```

### Recommandations contextuelles selon le type

| Type projet | Recommandations spécifiques |
|-------------|----------------------------|
| **Webapp** | Performance, accessibilité, SEO, analytics |
| **API** | Documentation OpenAPI, rate limiting, versioning |
| **CLI** | Help messages, man pages, autocompletion |
| **Docs/Research** | Structure, navigation, citations, export |

---

## Section 5 : Checklist Générée

### Format de la checklist

```markdown
## ✅ CHECKLIST ONBOARDING - [PROJET]

Générée le : YYYY-MM-DD
Phase actuelle : X/9 (Nom)
Prochaine phase cible : Y (Nom)

### Pour atteindre Phase Y

- [ ] Action concrète 1
- [ ] Action concrète 2
- [ ] Action concrète 3

### Quick wins (< 2h chacun)

- [ ] Quick win 1
- [ ] Quick win 2
```

### Intégration TodoWrite

```
📋 Checklist générée avec N items.

Veux-tu charger cette checklist dans tes todos ?
  A) Oui, tout charger
  B) Seulement les critiques/hautes
  C) Non, juste le rapport markdown
```

### Fichiers générés

```
docs/onboarding/
├── AUDIT-YYYY-MM-DD.md        # Rapport complet
├── CHECKLIST-YYYY-MM-DD.md    # Checklist standalone
└── DIAGNOSTIC.yaml            # Données machine-readable
```

---

## Vision Future

Le skill `/onboard` est conçu pour être généraliste :
- Actuellement optimisé pour projets web/applications modernes
- Architecture extensible pour d'autres types (recherche, documentation)
- Les profils de scoring peuvent être ajoutés selon les besoins

---

## Prochaine Étape

Voir le plan d'implémentation : `2026-01-05-onboard-skill-plan.md`
