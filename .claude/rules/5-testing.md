# Tests

## Philosophie

> **Tout changement doit être vérifié.** Même une petite modification peut avoir un impact sur l'ensemble du projet.

---

## Frameworks de Test

### Tests Unitaires : Vitest

- **Usage** : Tester les fonctions et services isolément
- **Emplacement** : `test-apps/[app]/tests/`
- **Extension** : `*.test.ts`

```bash
# Lancer les tests
cd test-apps/[app-name]
npm test

# Mode watch
npm test -- --watch

# Avec couverture
npm test -- --coverage
```

### Tests E2E : Playwright

- **Usage** : Tester les parcours utilisateur complets
- **Emplacement** : `test-apps/[app]/tests/e2e/`
- **Extension** : `test_*.py`

```bash
# Lancer les tests E2E
cd test-apps/[app-name]
python -m pytest tests/e2e/
```

---

## Structure des Tests

### Tests Unitaires

```typescript
import { describe, it, expect } from 'vitest';
import { maFonction } from '../services/MonService';

describe('MonService', () => {
  describe('maFonction', () => {
    it('should return expected result', () => {
      const result = maFonction(input);
      expect(result).toBe(expected);
    });

    it('should handle edge case', () => {
      // ...
    });
  });
});
```

### Tests E2E

```python
import pytest
from playwright.sync_api import Page

def test_user_flow(page: Page):
    page.goto('http://localhost:3000')
    page.click('button#action')
    assert page.locator('#result').is_visible()
```

---

## Bonnes Pratiques

### DO

- Tester les cas nominaux ET les cas d'erreur
- Nommer les tests de manière descriptive
- Un test = une assertion principale
- Vérifier l'impact global après chaque changement

### DON'T

- Tests qui dépendent de l'ordre d'exécution
- Tests avec des données en dur non reproductibles
- Ignorer les tests qui échouent
- Supposer que "ça marche" sans exécuter les tests

---

## Vérification Globale

Après toute modification, même mineure :

1. **Lancer les tests unitaires** : `npm test`
2. **Vérifier la compilation** : `npm run build` (si applicable)
3. **Tester manuellement** le comportement modifié
4. **Vérifier les effets de bord** sur les fonctionnalités liées

### Checklist avant commit

- [ ] Tests unitaires passent
- [ ] Pas de régression sur les tests existants
- [ ] Comportement vérifié manuellement
- [ ] Impact sur le projet global évalué

---

## Tests dans le Loop Autonome

### Contexte

Le loop autonome (`loop.sh`) exécute du code sans supervision. Les tests deviennent critiques pour détecter les erreurs avant qu'elles ne s'accumulent.

### Vérifications Automatiques

Le loop vérifie automatiquement après chaque story :

1. **Build** : `npm run build` doit passer
2. **Types** : `tsc --noEmit` doit passer (si TypeScript)

### Workflow de Test

```
Avant story → Analyser patterns existants
    ↓
Pendant story → Suivre les conventions
    ↓
Après story → Build vérifié automatiquement
    ↓
Si échec → Story marquée `passes: false`
    ↓
Itération suivante → Tenter de corriger
```

### Ne JAMAIS marquer `passes: true` si :

- Le build échoue
- Des erreurs TypeScript existent
- Les tests existants échouent
- Le schema DB ne correspond pas au code

### Logs de Vérification

Le loop écrit les erreurs dans :
- `.act/logs/build-errors.log` - Erreurs de build
- `.act/logs/type-errors.log` - Erreurs TypeScript

### Récupération

Si des erreurs s'accumulent :

```bash
# Voir les erreurs de build
cat .act/logs/build-errors.log

# Voir les erreurs de type
cat .act/logs/type-errors.log

# Revenir à un état sain
git checkout -- .
```

### Best Practices Loop

| DO | DON'T |
|----|-------|
| Analyser patterns avant de coder | Coder sans comprendre le contexte |
| Vérifier le schema avant queries DB | Supposer les noms de champs |
| Utiliser dépendances installées | Installer de nouvelles dépendances |
| Marquer failed si build échoue | Marquer passed sans vérification |
| Logger les erreurs rencontrées | Ignorer les warnings |
