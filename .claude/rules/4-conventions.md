# Conventions

## Code

### Langages

- **TypeScript** : Code applicatif
- **Python** : Scripts utilitaires
- **Markdown** : Documentation, commandes, agents

### Formatage

| Élément | Convention |
|---------|------------|
| Indentation | 2 espaces |
| Guillemets | Simple (`'`) pour JS/TS |
| Point-virgule | Optionnel (cohérent dans le projet) |
| Longueur ligne | 100 caractères max |

### Nommage

| Type | Convention | Exemple |
|------|------------|---------|
| Fichiers | kebab-case | `chunk-manager.md` |
| Variables | camelCase | `projectStatus` |
| Constantes | UPPER_SNAKE | `MAX_RETRIES` |
| Classes | PascalCase | `ProjectManager` |
| Fonctions | camelCase | `getProjectStatus()` |

---

## Git

### Conventional Commits

Format : `type: description courte`

| Type | Usage |
|------|-------|
| `feat` | Nouvelle fonctionnalité |
| `fix` | Correction de bug |
| `docs` | Documentation uniquement |
| `refactor` | Refactoring sans changement fonctionnel |
| `test` | Ajout ou modification de tests |
| `chore` | Maintenance, dépendances |

### Exemples

```bash
feat: add /status command for project progress
fix: resolve phase transition validation error
docs: update architecture documentation
refactor: simplify command parsing logic
test: add unit tests for BonsaiService
chore: update dependencies
```

### Branches

| Type | Format | Exemple |
|------|--------|---------|
| Feature | `feature/description` | `feature/add-onboard-command` |
| Fix | `fix/description` | `fix/phase-validation` |
| Docs | `docs/description` | `docs/update-readme` |

---

## Documentation

### Fichiers Markdown

```markdown
# Titre Principal

> Citation ou résumé (optionnel)

## Section

Contenu...

### Sous-section

Contenu...
```

### Frontmatter YAML

Pour les commandes et agents :

```yaml
---
description: Description courte
version: 1.0.0
author: Nom (optionnel)
---
```

### Tables

```markdown
| Colonne 1 | Colonne 2 |
|-----------|-----------|
| Valeur 1  | Valeur 2  |
```

---

## Commentaires

### Quand commenter

- Logique complexe non évidente
- Décisions architecturales importantes
- TODOs avec contexte

### Format

```typescript
// Commentaire court sur une ligne

/**
 * Commentaire long pour fonctions/classes
 * @param param Description du paramètre
 * @returns Description du retour
 */
```

### Ne pas commenter

- Code évident (`i++; // incrémente i`)
- Code mort (supprimer plutôt)
- Historique des changements (utiliser git)
