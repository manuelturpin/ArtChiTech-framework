# GitHub Pull Request Template (ACT)

> Template utilisé par `/act:handoff --format github-pr` pour générer des descriptions de PR.

## Format

```markdown
## 🎯 Objectif

{pr_objective}

## 📋 Changements

{changes_list}

## 🔗 Issues liées

{related_issues}

## ✅ Checklist

- [ ] Tests passent (`npm test` / `pytest` / etc.)
- [ ] Documentation mise à jour
- [ ] Code reviewé
- [ ] Pas de secrets/credentials dans le code
- [ ] CHANGELOG mis à jour (si applicable)

## 📊 Contexte ACT

| Attribut | Valeur |
|----------|--------|
| **Phase** | {current_phase}/7 ({phase_name}) |
| **Progrès** | {progress_percent}% |
| **Session** | {session_timestamp} |
| **Commits** | {commit_count} |

## 🧪 Tests

{test_summary}

## 📸 Screenshots (si UI)

{screenshots}

## 💡 Notes pour les reviewers

{reviewer_notes}

---
*🤖 Généré par [ACT Framework](https://github.com/your-org/act-framework) v2.5*
```

## Variables

| Variable | Source | Description |
|----------|--------|-------------|
| `{pr_objective}` | Handoff/plan.md | Objectif de la PR |
| `{changes_list}` | git diff | Liste des changements |
| `{related_issues}` | Commits | Issues liées (Closes #X) |
| `{current_phase}` | state.md | Phase actuelle |
| `{phase_name}` | plan.md | Nom de la phase |
| `{progress_percent}` | state.md | Pourcentage de complétion |
| `{session_timestamp}` | progress.md | Date de la session |
| `{commit_count}` | git | Nombre de commits dans la PR |
| `{test_summary}` | CI/Manual | Résumé des tests |
| `{screenshots}` | Manual | Screenshots si UI |
| `{reviewer_notes}` | Handoff | Notes spéciales |

## Exemple de sortie

```markdown
## 🎯 Objectif

Implémenter le système d'authentification utilisateur avec JWT.

## 📋 Changements

- ✨ Ajout endpoint `/auth/login`
- ✨ Ajout endpoint `/auth/register`
- ✨ Ajout endpoint `/auth/refresh`
- 🔧 Configuration JWT dans `config.yaml`
- 📝 Documentation API dans `docs/auth.md`
- ✅ Tests unitaires (couverture: 87%)

## 🔗 Issues liées

Closes #12 ([Phase 4] Development)
Relates to #8 ([Phase 3] Design)

## ✅ Checklist

- [x] Tests passent (`npm test`)
- [x] Documentation mise à jour
- [ ] Code reviewé
- [x] Pas de secrets/credentials dans le code
- [x] CHANGELOG mis à jour

## 📊 Contexte ACT

| Attribut | Valeur |
|----------|--------|
| **Phase** | 4/7 (Development) |
| **Progrès** | 65% |
| **Session** | 2026-02-02 14:30 UTC |
| **Commits** | 8 |

## 🧪 Tests

```
✓ 42 tests passed
✓ Coverage: 87%
✓ No regressions detected
```

## 📸 Screenshots

N/A (backend changes only)

## 💡 Notes pour les reviewers

- Le choix de JWT vs sessions est documenté dans `.act/findings.md`
- Le rate limiting sera ajouté dans une PR séparée
- Attention à la configuration des secrets en production

---
*🤖 Généré par [ACT Framework](https://github.com/your-org/act-framework) v2.5*
```

## Usage

### Génération automatique

```bash
# Générer la description de PR
/act:handoff --format github-pr

# Copier directement vers le clipboard
/act:handoff --format github-pr | pbcopy
```

### Intégration GitHub Actions

```yaml
# .github/workflows/pr-template.yml
name: ACT PR Description
on:
  pull_request:
    types: [opened]
jobs:
  add-description:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Generate ACT description
        run: |
          # Génère et ajoute la description ACT
          act handoff --format github-pr >> $GITHUB_STEP_SUMMARY
```

## Liaison automatique

Les commits avec le format suivant créent automatiquement des liens :

```
feat(auth): [Phase 4.2] Implement JWT validation

Relates to #12
```

- `[Phase N.X]` → Lie à l'Issue de la phase
- `Relates to #N` → Référence sans fermer
- `Closes #N` → Ferme l'Issue au merge
