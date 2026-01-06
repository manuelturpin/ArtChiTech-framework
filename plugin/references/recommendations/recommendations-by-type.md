# Recommandations par Type de Projet

Guide de recommandations contextuelles selon le type de projet detecte.

---

## Webapp / Site Web

### Recommandations prioritaires

| Priorite | Domaine | Description | Effort |
|----------|---------|-------------|--------|
| 1 | **Performance** | Lighthouse score, lazy loading, optimisation images, bundle splitting | Moyen |
| 2 | **Accessibilite** | WCAG AA, contraste, navigation clavier, ARIA labels | Moyen |
| 3 | **SEO** | Meta tags, sitemap.xml, robots.txt, structured data | Faible |
| 4 | **Analytics** | PostHog, GA4, conversion tracking, heatmaps | Faible |
| 5 | **Securite** | HTTPS, CSP headers, XSS protection, CORS | Moyen |

### Criteres d'evaluation

- **Performance**
  - First Contentful Paint < 1.8s
  - Largest Contentful Paint < 2.5s
  - Cumulative Layout Shift < 0.1
  - Total Blocking Time < 200ms

- **Accessibilite**
  - Alt text sur toutes les images
  - Labels sur tous les champs de formulaire
  - Contraste minimum 4.5:1 (texte normal)
  - Navigation complete au clavier

- **SEO**
  - Title et meta description uniques par page
  - Headings hierarchiques (H1 unique)
  - Images avec alt descriptifs
  - URLs semantiques et propres

### Skills suggeres

| Skill | Fonction |
|-------|----------|
| `/lighthouse` | Audit performance automatise |
| `/a11y` | Audit accessibilite WCAG |
| `/seo` | Optimisation SEO complete |
| `/security-headers` | Configuration headers securite |

---

## API Backend

### Recommandations prioritaires

| Priorite | Domaine | Description | Effort |
|----------|---------|-------------|--------|
| 1 | **Documentation API** | OpenAPI/Swagger spec, exemples requests | Moyen |
| 2 | **Rate limiting** | Protection contre abuse, throttling | Moyen |
| 3 | **Versioning** | Strategie de versions (URL, header, query) | Faible |
| 4 | **Validation** | Schemas de validation (Zod, Joi, Pydantic) | Moyen |
| 5 | **Monitoring** | Logs structures, metriques, tracing distribue | Eleve |

### Criteres d'evaluation

- **Documentation API**
  - Spec OpenAPI 3.0+ complete
  - Exemples de requetes/reponses
  - Codes d'erreur documentes
  - Authentification expliquee

- **Validation**
  - Validation d'entree sur tous les endpoints
  - Messages d'erreur explicites
  - Types stricts (TypeScript/Pydantic)
  - Sanitization des inputs

- **Monitoring**
  - Request logging avec correlation ID
  - Metriques de latence par endpoint
  - Alertes sur erreurs 5xx
  - Health check endpoint

### Skills suggeres

| Skill | Fonction |
|-------|----------|
| `/openapi` | Generer documentation OpenAPI |
| `/security-audit` | Audit securite API (OWASP) |
| `/api-testing` | Tests d'integration API |

---

## CLI Tool

### Recommandations prioritaires

| Priorite | Domaine | Description | Effort |
|----------|---------|-------------|--------|
| 1 | **Help messages** | `--help` complet, exemples d'usage | Faible |
| 2 | **Man pages** | Documentation Unix standard | Moyen |
| 3 | **Autocompletion** | Scripts Bash/Zsh/Fish | Moyen |
| 4 | **Error messages** | Messages clairs, suggestions de correction | Faible |
| 5 | **Configuration** | Fichier config, variables d'environnement | Moyen |

### Criteres d'evaluation

- **Help messages**
  - Description claire de chaque commande
  - Options documentees avec valeurs par defaut
  - Exemples d'utilisation courants
  - Version affichable (`--version`)

- **Error messages**
  - Code de sortie semantique (0 = succes)
  - Messages d'erreur en stderr
  - Suggestions d'actions correctives
  - Debug mode verbose (`--debug`)

- **Configuration**
  - Fichier config (~/.config/app/ ou .apprc)
  - Variables d'environnement supportees
  - Priorite: CLI args > env > config file
  - Config par defaut sensee

### Skills suggeres

| Skill | Fonction |
|-------|----------|
| `/cli-polish` | Ameliorer UX CLI |
| `/man-page` | Generer man pages |
| `/shell-completion` | Creer scripts autocompletion |

---

## Library / Package

### Recommandations prioritaires

| Priorite | Domaine | Description | Effort |
|----------|---------|-------------|--------|
| 1 | **Documentation** | README complet, API docs, exemples | Moyen |
| 2 | **Types** | TypeScript definitions, JSDoc, type hints | Moyen |
| 3 | **Tests** | Couverture elevee (>80%), tests de regression | Eleve |
| 4 | **Changelog** | CHANGELOG.md, semantic versioning | Faible |
| 5 | **CI Multi-version** | Tests sur Node 18/20/22, Python 3.9-3.12 | Moyen |

### Criteres d'evaluation

- **Documentation**
  - README avec installation, usage basique
  - API reference complete
  - Exemples copiables/executables
  - Contributing guide

- **Types**
  - TypeScript declarations (.d.ts)
  - Exports corrects dans package.json
  - Documentation des types complexes
  - Generics documentes

- **Tests**
  - Couverture > 80%
  - Tests unitaires exhaustifs
  - Tests d'integration
  - Tests de regression sur bugs fixes

- **Changelog**
  - Format Keep a Changelog
  - Semantic Versioning (semver)
  - Breaking changes documentes
  - Migration guides si necessaire

### Skills suggeres

| Skill | Fonction |
|-------|----------|
| `/docs-gen` | Generer documentation API |
| `/typedoc` | Documentation TypeScript |
| `/changelog` | Generer changelog automatique |

---

## Documentation / Research

### Recommandations prioritaires

| Priorite | Domaine | Description | Effort |
|----------|---------|-------------|--------|
| 1 | **Structure** | Navigation claire, TOC, hierarchie | Faible |
| 2 | **Search** | Recherche full-text, indexation | Moyen |
| 3 | **Citations** | References sourcees, bibliographie | Faible |
| 4 | **Export** | PDF, formats multiples (EPUB, HTML) | Moyen |
| 5 | **Versioning** | Historique des modifications, branches | Faible |

### Criteres d'evaluation

- **Structure**
  - Table des matieres automatique
  - Hierarchie logique des sections
  - Navigation prev/next
  - Breadcrumbs

- **Search**
  - Recherche full-text rapide
  - Indexation automatique
  - Resultats avec contexte
  - Filtres par section/tag

- **Citations**
  - Format citation standard (APA, MLA)
  - Liens vers sources originales
  - Footnotes/endnotes
  - Bibliographie automatique

- **Export**
  - Export PDF propre
  - Export HTML statique
  - Export Markdown
  - Themes d'impression

### Skills suggeres

| Skill | Fonction |
|-------|----------|
| `/docs-site` | Generer site documentation (Docusaurus, VitePress) |
| `/pdf-export` | Export PDF professionnel |
| `/search-index` | Indexation Algolia/Typesense |

---

## Matrice de priorites croisees

| Type | P1 | P2 | P3 | P4 | P5 |
|------|----|----|----|----|-----|
| **Webapp** | Performance | A11y | SEO | Analytics | Securite |
| **API** | API Docs | Rate Limit | Versioning | Validation | Monitoring |
| **CLI** | Help | Man | Autocompl. | Errors | Config |
| **Library** | Docs | Types | Tests | Changelog | Multi-CI |
| **Docs** | Structure | Search | Citations | Export | Versioning |

---

## Quick Wins universels (< 2h)

Applicables a tous les types de projets:

1. **README.md complet** - Installation, usage, contribution
2. **LICENSE** - Choisir et ajouter une licence
3. **.gitignore** - Ignorer node_modules, .env, builds
4. **CI basique** - GitHub Actions pour tests + lint
5. **EditorConfig** - Coherence indentation equipe
6. **Pre-commit hooks** - Lint et format avant commit

---

## Effort estimation

| Label | Duree typique |
|-------|---------------|
| Faible | < 2 heures |
| Moyen | 2-8 heures |
| Eleve | 1-3 jours |
| Tres eleve | > 3 jours |
