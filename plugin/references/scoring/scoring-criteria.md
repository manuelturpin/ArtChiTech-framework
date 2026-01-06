# Criteres de Scoring par Categorie

> Reference detaillee pour l'evaluation des projets. Chaque categorie est notee sur 100 points.

---

## Documentation (100 points)

Evalue la qualite et la completude de la documentation du projet.

| Critere | Points | Description |
|---------|--------|-------------|
| README.md existe | +15 | Fichier README present a la racine |
| README.md > 500 mots | +10 | Documentation substantielle (pas juste un titre) |
| Description projet claire | +10 | Objectif, contexte, probleme resolu expliques |
| Instructions installation | +15 | Etapes claires pour installer/setup le projet |
| Instructions utilisation | +10 | Comment utiliser le projet (exemples, commandes) |
| Dossier docs/ existe | +10 | Documentation organisee dans un dossier dedie |
| Architecture documentee | +15 | Diagrammes ou explications de l'architecture |
| API documentee | +15 | Documentation des endpoints/fonctions (si applicable) |

**Seuils d'evaluation:**
- 80-100: Documentation excellente
- 60-79: Documentation adequate
- 40-59: Documentation minimale
- 0-39: Documentation insuffisante

---

## Tests (100 points)

Evalue la presence, qualite et couverture des tests.

| Critere | Points | Description |
|---------|--------|-------------|
| Tests presents | +20 | Au moins un fichier de test existe |
| Framework configure | +10 | vitest, jest, pytest, etc. dans les deps |
| Tests unitaires > 5 | +10 | Au moins 5 tests unitaires |
| Tests unitaires > 20 | +10 | Suite de tests substantielle |
| Tests E2E presents | +20 | Tests end-to-end (Playwright, Cypress, etc.) |
| Script test dans package.json | +10 | Commande `npm test` ou equivalent configuree |
| Coverage configure | +10 | Outil de coverage installe et configure |
| Coverage > 50% | +10 | Couverture de code superieure a 50% |

**Seuils d'evaluation:**
- 80-100: Tests excellents, projet bien couvert
- 60-79: Tests adequats, couverture partielle
- 40-59: Tests minimaux
- 0-39: Tests insuffisants ou absents

---

## CI/CD (100 points)

Evalue l'automatisation de l'integration et du deploiement.

| Critere | Points | Description |
|---------|--------|-------------|
| Fichier CI present | +25 | `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile` |
| Tests dans CI | +20 | Les tests s'executent automatiquement en CI |
| Lint/Format dans CI | +15 | ESLint, Prettier, etc. executes en CI |
| Build automatise | +15 | Build du projet en CI |
| Deploy automatise | +25 | Deploiement automatique (staging ou prod) |

**Fichiers a verifier:**
- `.github/workflows/*.yml`
- `.gitlab-ci.yml`
- `Jenkinsfile`
- `.circleci/config.yml`
- `vercel.json` (deploiement)
- `netlify.toml` (deploiement)

**Seuils d'evaluation:**
- 80-100: Pipeline CI/CD complet
- 60-79: CI fonctionnel, deploy manuel
- 40-59: CI basique
- 0-39: Pas de CI/CD

---

## Securite (100 points)

Evalue les bonnes pratiques de securite.

| Critere | Points | Description |
|---------|--------|-------------|
| .env dans .gitignore | +20 | Fichiers secrets exclus du repo |
| Pas de secrets dans code | +20 | Aucune API key, password en dur |
| Dependencies a jour | +15 | Packages mis a jour (< 6 mois) |
| Headers securite | +15 | CSP, X-Frame-Options, etc. (webapp) |
| Validation entrees | +15 | Zod, Joi, ou validation manuelle |
| HTTPS configure | +15 | SSL/TLS en production |

**Verification secrets:**
- Rechercher patterns: `apiKey`, `secret`, `password`, `token`
- Verifier `.env.example` existe (sans valeurs sensibles)
- Scanner avec `git-secrets` ou equivalent

**Seuils d'evaluation:**
- 80-100: Securite exemplaire
- 60-79: Securite adequate
- 40-59: Vulnerabilites mineures
- 0-39: Risques de securite majeurs

---

## Monitoring (100 points)

Evalue la capacite a observer et debugger le projet en production.

| Critere | Points | Description |
|---------|--------|-------------|
| Error tracking | +25 | Sentry, Bugsnag, etc. configure |
| Analytics configure | +20 | PostHog, GA4, Plausible, etc. |
| Logs structures | +20 | Logging avec niveaux (info, warn, error) |
| Health check endpoint | +15 | `/health` ou `/api/health` (si API) |
| Alertes configurees | +20 | Notifications sur erreurs critiques |

**Outils recherches:**
- Sentry, Bugsnag, Rollbar (error tracking)
- PostHog, Plausible, GA4 (analytics)
- Datadog, New Relic, Grafana (APM)
- PagerDuty, Opsgenie (alertes)

**Seuils d'evaluation:**
- 80-100: Observabilite complete
- 60-79: Monitoring basique
- 40-59: Quelques metriques
- 0-39: Aucune visibilite production

---

## Performance (100 points)

Evalue l'optimisation des performances.

| Critere | Points | Description |
|---------|--------|-------------|
| Lazy loading | +20 | Chargement differe des modules/images |
| Images optimisees | +15 | next/image, sharp, WebP, compression |
| Caching configure | +20 | Cache-Control, SWR, React Query, etc. |
| Bundle size raisonnable | +15 | JS < 500KB gzipped pour webapp |
| Lighthouse > 80 | +15 | Score Performance Lighthouse |
| Lighthouse > 95 | +15 | Score Performance excellence |

**Outils de verification:**
- `npx lighthouse URL` (audit complet)
- `npx bundle-analyzer` (taille bundle)
- Chrome DevTools Network tab

**Seuils d'evaluation:**
- 80-100: Performance optimale
- 60-79: Performance acceptable
- 40-59: Lenteurs notables
- 0-39: Performance critique

---

## Accessibilite (100 points)

> **Applicable uniquement aux webapps et sites web.**

Evalue la conformite aux standards d'accessibilite.

| Critere | Points | Description |
|---------|--------|-------------|
| Alt text sur images | +20 | Toutes les images ont un alt significatif |
| Labels sur formulaires | +20 | Tous les inputs ont des labels associes |
| Contraste suffisant | +20 | Ratio de contraste >= 4.5:1 |
| Navigation clavier | +20 | Tous les elements interactifs accessibles au clavier |
| ARIA labels | +10 | Roles et labels ARIA sur elements complexes |
| Lighthouse a11y > 90 | +10 | Score Accessibility Lighthouse |

**Standards de reference:**
- WCAG 2.1 niveau AA (minimum recommande)
- WCAG 2.1 niveau AAA (excellence)

**Outils de verification:**
- Lighthouse Accessibility audit
- axe DevTools extension
- WAVE Web Accessibility Evaluator

**Seuils d'evaluation:**
- 80-100: Accessibilite excellente (WCAG AA)
- 60-79: Accessibilite partielle
- 40-59: Problemes d'accessibilite
- 0-39: Non accessible

---

## Identite Visuelle (100 points)

> **Applicable selon le type de projet:**
> - **Requise:** webapp, mobile app, site marketing
> - **Optionnelle:** documentation, research
> - **Ignoree:** API, CLI, library

Evalue la coherence et la qualite de l'identite visuelle.

| Critere | Points | Description |
|---------|--------|-------------|
| Palette de couleurs | +20 | Couleurs definies et coherentes |
| Typographie coherente | +20 | Fonts definis, hierarchie claire |
| Logo present | +15 | Logo en plusieurs formats (SVG, PNG) |
| Design system | +20 | Composants UI reutilisables et documentes |
| Variables CSS/tokens | +15 | CSS custom properties ou design tokens |
| Documentation design | +10 | Brandbook ou guide de style |

**Fichiers recherches:**
- `docs/brand/`, `docs/design/`, `.brand/`
- `BRAND.md`, `BRANDBOOK.md`, `STYLE_GUIDE.md`
- `figma.json`, `design-tokens.json`
- `tailwind.config.*` (theme section)

**Seuils d'evaluation:**
- 80-100: Identite visuelle forte et coherente
- 60-79: Charte graphique partielle
- 40-59: Elements visuels basiques
- 0-39: Aucune identite definie

---

## Calcul du Score Global

### Formule

```
Score Global = Moyenne ponderee des categories applicables
```

### Ponderations par defaut

| Type Projet | Doc | Tests | CI/CD | Secu | Monit | Perf | A11y | Visual |
|-------------|-----|-------|-------|------|-------|------|------|--------|
| webapp | 10% | 15% | 15% | 15% | 10% | 15% | 10% | 10% |
| api | 15% | 20% | 20% | 20% | 15% | 10% | - | - |
| cli | 20% | 20% | 15% | 15% | 10% | 20% | - | - |
| library | 25% | 25% | 15% | 15% | 10% | 10% | - | - |
| docs | 40% | 10% | 15% | 10% | 5% | 10% | 5% | 5% |

### Interpretation du Score Global

| Score | Niveau | Description |
|-------|--------|-------------|
| 90-100 | Excellent | Projet production-ready, maintenance exemplaire |
| 80-89 | Tres bien | Projet solide, quelques ameliorations possibles |
| 70-79 | Bien | Projet fonctionnel, axes d'amelioration identifies |
| 60-69 | Acceptable | Base solide mais travail necessaire |
| 50-59 | Passable | Manques significatifs a combler |
| 40-49 | Insuffisant | Projet necessite attention immediate |
| 0-39 | Critique | Projet a risque, action urgente requise |

---

## Notes d'Implementation

### Comment scorer

1. Parcourir chaque categorie applicable
2. Verifier chaque critere (present/absent)
3. Additionner les points obtenus
4. Calculer le pourcentage (points / 100)
5. Appliquer la ponderation pour le score global

### Cas particuliers

- **Criteres non applicables:** Si un critere ne s'applique pas (ex: API doc pour un CLI simple), ignorer et recalculer sur la base reduite
- **Bonus:** Aucun bonus au-dela de 100 par categorie
- **Penalites:** Les secrets dans le code = score Securite plafonne a 20%
