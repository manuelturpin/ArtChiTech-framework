# Scoring Criteria by Category

> Detailed reference for project evaluation. Each category is scored out of 100 points.

---

## Documentation (100 points)

Evaluates the quality and completeness of project documentation.

| Criterion | Points | Description |
|-----------|--------|-------------|
| README.md exists | +15 | README file present at root |
| README.md > 500 words | +10 | Substantial documentation (not just a title) |
| Clear project description | +10 | Objective, context, problem solved explained |
| Installation instructions | +15 | Clear steps to install/setup the project |
| Usage instructions | +10 | How to use the project (examples, commands) |
| docs/ folder exists | +10 | Documentation organized in a dedicated folder |
| Architecture documented | +15 | Diagrams or architecture explanations |
| API documented | +15 | Endpoint/function documentation (if applicable) |

**Evaluation thresholds:**
- 80-100: Excellent documentation
- 60-79: Adequate documentation
- 40-59: Minimal documentation
- 0-39: Insufficient documentation

---

## Tests (100 points)

Evaluates the presence, quality and coverage of tests.

| Criterion | Points | Description |
|-----------|--------|-------------|
| Tests present | +20 | At least one test file exists |
| Framework configured | +10 | vitest, jest, pytest, etc. in deps |
| Unit tests > 5 | +10 | At least 5 unit tests |
| Unit tests > 20 | +10 | Substantial test suite |
| E2E tests present | +20 | End-to-end tests (Playwright, Cypress, etc.) |
| Test script in package.json | +10 | `npm test` or equivalent command configured |
| Coverage configured | +10 | Coverage tool installed and configured |
| Coverage > 50% | +10 | Code coverage above 50% |

**Evaluation thresholds:**
- 80-100: Excellent tests, well-covered project
- 60-79: Adequate tests, partial coverage
- 40-59: Minimal tests
- 0-39: Insufficient or absent tests

---

## CI/CD (100 points)

Evaluates integration and deployment automation.

| Criterion | Points | Description |
|-----------|--------|-------------|
| CI file present | +25 | `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile` |
| Tests in CI | +20 | Tests run automatically in CI |
| Lint/Format in CI | +15 | ESLint, Prettier, etc. executed in CI |
| Automated build | +15 | Project build in CI |
| Automated deploy | +25 | Automatic deployment (staging or prod) |

**Files to check:**
- `.github/workflows/*.yml`
- `.gitlab-ci.yml`
- `Jenkinsfile`
- `.circleci/config.yml`
- `vercel.json` (deployment)
- `netlify.toml` (deployment)

**Evaluation thresholds:**
- 80-100: Complete CI/CD pipeline
- 60-79: Functional CI, manual deploy
- 40-59: Basic CI
- 0-39: No CI/CD

---

## Security (100 points)

Evaluates security best practices.

| Criterion | Points | Description |
|-----------|--------|-------------|
| .env in .gitignore | +20 | Secret files excluded from repo |
| No secrets in code | +20 | No hardcoded API keys, passwords |
| Dependencies up to date | +15 | Packages updated (< 6 months) |
| Security headers | +15 | CSP, X-Frame-Options, etc. (webapp) |
| Input validation | +15 | Zod, Joi, or manual validation |
| HTTPS configured | +15 | SSL/TLS in production |

**Secrets verification:**
- Search patterns: `apiKey`, `secret`, `password`, `token`
- Check `.env.example` exists (without sensitive values)
- Scan with `git-secrets` or equivalent

**Evaluation thresholds:**
- 80-100: Exemplary security
- 60-79: Adequate security
- 40-59: Minor vulnerabilities
- 0-39: Major security risks

---

## Monitoring (100 points)

Evaluates the ability to observe and debug the project in production.

| Criterion | Points | Description |
|-----------|--------|-------------|
| Error tracking | +25 | Sentry, Bugsnag, etc. configured |
| Analytics configured | +20 | PostHog, GA4, Plausible, etc. |
| Structured logs | +20 | Logging with levels (info, warn, error) |
| Health check endpoint | +15 | `/health` or `/api/health` (if API) |
| Alerts configured | +20 | Notifications on critical errors |

**Tools searched:**
- Sentry, Bugsnag, Rollbar (error tracking)
- PostHog, Plausible, GA4 (analytics)
- Datadog, New Relic, Grafana (APM)
- PagerDuty, Opsgenie (alerts)

**Evaluation thresholds:**
- 80-100: Complete observability
- 60-79: Basic monitoring
- 40-59: Some metrics
- 0-39: No production visibility

---

## Performance (100 points)

Evaluates performance optimization.

| Criterion | Points | Description |
|-----------|--------|-------------|
| Lazy loading | +20 | Deferred loading of modules/images |
| Optimized images | +15 | next/image, sharp, WebP, compression |
| Caching configured | +20 | Cache-Control, SWR, React Query, etc. |
| Reasonable bundle size | +15 | JS < 500KB gzipped for webapp |
| Lighthouse > 80 | +15 | Lighthouse Performance score |
| Lighthouse > 95 | +15 | Excellence Performance score |

**Verification tools:**
- `npx lighthouse URL` (full audit)
- `npx bundle-analyzer` (bundle size)
- Chrome DevTools Network tab

**Evaluation thresholds:**
- 80-100: Optimal performance
- 60-79: Acceptable performance
- 40-59: Notable slowdowns
- 0-39: Critical performance

---

## Accessibility (100 points)

> **Applicable only to webapps and websites.**

Evaluates compliance with accessibility standards.

| Criterion | Points | Description |
|-----------|--------|-------------|
| Alt text on images | +20 | All images have meaningful alt text |
| Labels on forms | +20 | All inputs have associated labels |
| Sufficient contrast | +20 | Contrast ratio >= 4.5:1 |
| Keyboard navigation | +20 | All interactive elements keyboard accessible |
| ARIA labels | +10 | ARIA roles and labels on complex elements |
| Lighthouse a11y > 90 | +10 | Lighthouse Accessibility score |

**Reference standards:**
- WCAG 2.1 level AA (minimum recommended)
- WCAG 2.1 level AAA (excellence)

**Verification tools:**
- Lighthouse Accessibility audit
- axe DevTools extension
- WAVE Web Accessibility Evaluator

**Evaluation thresholds:**
- 80-100: Excellent accessibility (WCAG AA)
- 60-79: Partial accessibility
- 40-59: Accessibility issues
- 0-39: Not accessible

---

## Visual Identity (100 points)

> **Applicable depending on project type:**
> - **Required:** webapp, mobile app, marketing site
> - **Optional:** documentation, research
> - **Ignored:** API, CLI, library

Evaluates the coherence and quality of visual identity.

| Criterion | Points | Description |
|-----------|--------|-------------|
| Color palette | +20 | Defined and coherent colors |
| Consistent typography | +20 | Defined fonts, clear hierarchy |
| Logo present | +15 | Logo in multiple formats (SVG, PNG) |
| Design system | +20 | Reusable and documented UI components |
| CSS variables/tokens | +15 | CSS custom properties or design tokens |
| Design documentation | +10 | Brandbook or style guide |

**Files searched:**
- `docs/brand/`, `docs/design/`, `.brand/`
- `BRAND.md`, `BRANDBOOK.md`, `STYLE_GUIDE.md`
- `figma.json`, `design-tokens.json`
- `tailwind.config.*` (theme section)

**Evaluation thresholds:**
- 80-100: Strong and coherent visual identity
- 60-79: Partial style guide
- 40-59: Basic visual elements
- 0-39: No defined identity

---

## Global Score Calculation

### Formula

```
Global Score = Weighted average of applicable categories
```

### Default weights

| Project Type | Doc | Tests | CI/CD | Sec | Monit | Perf | A11y | Visual |
|--------------|-----|-------|-------|-----|-------|------|------|--------|
| webapp | 10% | 15% | 15% | 15% | 10% | 15% | 10% | 10% |
| api | 15% | 20% | 20% | 20% | 15% | 10% | - | - |
| cli | 20% | 20% | 15% | 15% | 10% | 20% | - | - |
| library | 25% | 25% | 15% | 15% | 10% | 10% | - | - |
| docs | 40% | 10% | 15% | 10% | 5% | 10% | 5% | 5% |

### Global Score Interpretation

| Score | Level | Description |
|-------|-------|-------------|
| 90-100 | Excellent | Production-ready project, exemplary maintenance |
| 80-89 | Very Good | Solid project, some improvements possible |
| 70-79 | Good | Functional project, improvement areas identified |
| 60-69 | Acceptable | Solid foundation but work needed |
| 50-59 | Passable | Significant gaps to address |
| 40-49 | Insufficient | Project requires immediate attention |
| 0-39 | Critical | At-risk project, urgent action required |

---

## Implementation Notes

### How to score

1. Go through each applicable category
2. Check each criterion (present/absent)
3. Add up points obtained
4. Calculate percentage (points / 100)
5. Apply weighting for global score

### Special cases

- **Non-applicable criteria:** If a criterion doesn't apply (e.g., API docs for a simple CLI), ignore and recalculate on reduced base
- **Bonus:** No bonus beyond 100 per category
- **Penalties:** Secrets in code = Security score capped at 20%
