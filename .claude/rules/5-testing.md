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
