# Recommendations by Project Type

Contextual recommendation guide based on detected project type.

---

## Webapp / Website

### Priority recommendations

| Priority | Domain | Description | Effort |
|----------|--------|-------------|--------|
| 1 | **Performance** | Lighthouse score, lazy loading, image optimization, bundle splitting | Medium |
| 2 | **Accessibility** | WCAG AA, contrast, keyboard navigation, ARIA labels | Medium |
| 3 | **SEO** | Meta tags, sitemap.xml, robots.txt, structured data | Low |
| 4 | **Analytics** | PostHog, GA4, conversion tracking, heatmaps | Low |
| 5 | **Security** | HTTPS, CSP headers, XSS protection, CORS | Medium |

### Evaluation criteria

- **Performance**
  - First Contentful Paint < 1.8s
  - Largest Contentful Paint < 2.5s
  - Cumulative Layout Shift < 0.1
  - Total Blocking Time < 200ms

- **Accessibility**
  - Alt text on all images
  - Labels on all form fields
  - Minimum contrast 4.5:1 (normal text)
  - Full keyboard navigation

- **SEO**
  - Unique title and meta description per page
  - Hierarchical headings (unique H1)
  - Images with descriptive alt
  - Clean semantic URLs

### Suggested skills

| Skill | Function |
|-------|----------|
| `/lighthouse` | Automated performance audit |
| `/a11y` | WCAG accessibility audit |
| `/seo` | Complete SEO optimization |
| `/security-headers` | Security headers configuration |

---

## API Backend

### Priority recommendations

| Priority | Domain | Description | Effort |
|----------|--------|-------------|--------|
| 1 | **API Documentation** | OpenAPI/Swagger spec, request examples | Medium |
| 2 | **Rate limiting** | Abuse protection, throttling | Medium |
| 3 | **Versioning** | Version strategy (URL, header, query) | Low |
| 4 | **Validation** | Validation schemas (Zod, Joi, Pydantic) | Medium |
| 5 | **Monitoring** | Structured logs, metrics, distributed tracing | High |

### Evaluation criteria

- **API Documentation**
  - Complete OpenAPI 3.0+ spec
  - Request/response examples
  - Documented error codes
  - Authentication explained

- **Validation**
  - Input validation on all endpoints
  - Explicit error messages
  - Strict types (TypeScript/Pydantic)
  - Input sanitization

- **Monitoring**
  - Request logging with correlation ID
  - Latency metrics per endpoint
  - Alerts on 5xx errors
  - Health check endpoint

### Suggested skills

| Skill | Function |
|-------|----------|
| `/openapi` | Generate OpenAPI documentation |
| `/security-audit` | API security audit (OWASP) |
| `/api-testing` | API integration tests |

---

## CLI Tool

### Priority recommendations

| Priority | Domain | Description | Effort |
|----------|--------|-------------|--------|
| 1 | **Help messages** | Complete `--help`, usage examples | Low |
| 2 | **Man pages** | Standard Unix documentation | Medium |
| 3 | **Autocompletion** | Bash/Zsh/Fish scripts | Medium |
| 4 | **Error messages** | Clear messages, correction suggestions | Low |
| 5 | **Configuration** | Config file, environment variables | Medium |

### Evaluation criteria

- **Help messages**
  - Clear description of each command
  - Options documented with default values
  - Common usage examples
  - Version displayable (`--version`)

- **Error messages**
  - Semantic exit codes (0 = success)
  - Error messages to stderr
  - Corrective action suggestions
  - Verbose debug mode (`--debug`)

- **Configuration**
  - Config file (~/.config/app/ or .apprc)
  - Environment variables supported
  - Priority: CLI args > env > config file
  - Sensible default config

### Suggested skills

| Skill | Function |
|-------|----------|
| `/cli-polish` | Improve CLI UX |
| `/man-page` | Generate man pages |
| `/shell-completion` | Create autocompletion scripts |

---

## Library / Package

### Priority recommendations

| Priority | Domain | Description | Effort |
|----------|--------|-------------|--------|
| 1 | **Documentation** | Complete README, API docs, examples | Medium |
| 2 | **Types** | TypeScript definitions, JSDoc, type hints | Medium |
| 3 | **Tests** | High coverage (>80%), regression tests | High |
| 4 | **Changelog** | CHANGELOG.md, semantic versioning | Low |
| 5 | **Multi-version CI** | Tests on Node 18/20/22, Python 3.9-3.12 | Medium |

### Evaluation criteria

- **Documentation**
  - README with installation, basic usage
  - Complete API reference
  - Copyable/executable examples
  - Contributing guide

- **Types**
  - TypeScript declarations (.d.ts)
  - Correct exports in package.json
  - Complex types documented
  - Generics documented

- **Tests**
  - Coverage > 80%
  - Exhaustive unit tests
  - Integration tests
  - Regression tests on fixed bugs

- **Changelog**
  - Keep a Changelog format
  - Semantic Versioning (semver)
  - Breaking changes documented
  - Migration guides if needed

### Suggested skills

| Skill | Function |
|-------|----------|
| `/docs-gen` | Generate API documentation |
| `/typedoc` | TypeScript documentation |
| `/changelog` | Generate automatic changelog |

---

## Documentation / Research

### Priority recommendations

| Priority | Domain | Description | Effort |
|----------|--------|-------------|--------|
| 1 | **Structure** | Clear navigation, TOC, hierarchy | Low |
| 2 | **Search** | Full-text search, indexing | Medium |
| 3 | **Citations** | Sourced references, bibliography | Low |
| 4 | **Export** | PDF, multiple formats (EPUB, HTML) | Medium |
| 5 | **Versioning** | Modification history, branches | Low |

### Evaluation criteria

- **Structure**
  - Automatic table of contents
  - Logical section hierarchy
  - Prev/next navigation
  - Breadcrumbs

- **Search**
  - Fast full-text search
  - Automatic indexing
  - Results with context
  - Filters by section/tag

- **Citations**
  - Standard citation format (APA, MLA)
  - Links to original sources
  - Footnotes/endnotes
  - Automatic bibliography

- **Export**
  - Clean PDF export
  - Static HTML export
  - Markdown export
  - Print themes

### Suggested skills

| Skill | Function |
|-------|----------|
| `/docs-site` | Generate documentation site (Docusaurus, VitePress) |
| `/pdf-export` | Professional PDF export |
| `/search-index` | Algolia/Typesense indexing |

---

## Cross-priority matrix

| Type | P1 | P2 | P3 | P4 | P5 |
|------|----|----|----|----|-----|
| **Webapp** | Performance | A11y | SEO | Analytics | Security |
| **API** | API Docs | Rate Limit | Versioning | Validation | Monitoring |
| **CLI** | Help | Man | Autocompl. | Errors | Config |
| **Library** | Docs | Types | Tests | Changelog | Multi-CI |
| **Docs** | Structure | Search | Citations | Export | Versioning |

---

## Universal Quick Wins (< 2h)

Applicable to all project types:

1. **Complete README.md** - Installation, usage, contribution
2. **LICENSE** - Choose and add a license
3. **.gitignore** - Ignore node_modules, .env, builds
4. **Basic CI** - GitHub Actions for tests + lint
5. **EditorConfig** - Team indentation consistency
6. **Pre-commit hooks** - Lint and format before commit

---

## Effort estimation

| Label | Typical duration |
|-------|------------------|
| Low | < 2 hours |
| Medium | 2-8 hours |
| High | 1-3 days |
| Very High | > 3 days |
