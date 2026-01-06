# Phase 4 : Développement

**Objectif** : Implémenter le MVP avec qualité

**Skills actifs** : `superpowers:test-driven-development`, `superpowers:code-review`

## Checklist

- [ ] Environment setup (dev, staging, prod)
- [ ] CI/CD pipeline configuré
- [ ] Core features implémentées
- [ ] Tests unitaires (> 80% coverage)
- [ ] Tests d'intégration
- [ ] Code reviews systématiques
- [ ] Documentation code (JSDoc, etc.)
- [ ] Error handling robuste
- [ ] Logging et monitoring
- [ ] Performance baseline établie
- [ ] Security audit passé
- [ ] Go/No-Go documenté

## Workflow Chunk-Test-Fix

```
Pour chaque feature :
1. Découper en chunks (~50 lignes)
2. Pour chaque chunk :
   🔴 RED   : Écrire test qui échoue
   🟢 GREEN : Implémenter minimum
   🔧 REFACTOR : Nettoyer si nécessaire
3. Commit après chaque chunk vert
4. Code review avant merge
```

## Anti-Patterns

⚠️ **Skipping tests** : "Je testerai plus tard" → jamais.

⚠️ **Big bang commits** : Commits massifs difficiles à review.

⚠️ **Cowboy coding** : Merge sans review.

⚠️ **Technical debt denial** : Accumuler sans tracker.

## Outils Recommandés

- **Jest/Vitest** : Unit testing
- **Playwright/Cypress** : E2E testing
- **GitHub Actions** : CI/CD
- **SonarQube** : Code quality

## Métriques Clés

| Métrique | Cible |
|----------|-------|
| Test coverage | > 80% |
| Build time | < 5 min |
| Code review time | < 24h |
| Bug escape rate | < 5% |

## Transition → Phase 5

Conditions Go :
- Toutes features MVP implémentées
- Tests passent (> 80% coverage)
- 0 bugs critiques
- Code reviews approuvées
