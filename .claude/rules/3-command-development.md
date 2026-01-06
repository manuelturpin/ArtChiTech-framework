# Développement des Commandes

## Structure d'une Commande

Chaque commande est un fichier Markdown dans `plugin/commands/` avec un frontmatter YAML.

### Format

```markdown
---
description: Description courte de la commande
---

# Nom de la Commande

## Objectif

[Description de ce que fait la commande]

## Utilisation

[Comment utiliser la commande]

## Comportement

[Logique de la commande]
```

---

## Commandes Existantes

| Commande | Fichier | Description |
|----------|---------|-------------|
| `/onboard` | `onboard.md` | Auditer un projet existant |
| `/projet` | `projet.md` | Hub principal interactif |
| `/status` | `status.md` | Afficher l'état du projet |
| `/resume` | `resume.md` | Reprendre une session |
| `/fix` | `fix.md` | Corriger une erreur prioritaire |
| `/next` | `next.md` | Passer à l'étape suivante |
| `/help` | `help.md` | Aide contextuelle |

---

## Créer une Nouvelle Commande

### 1. Créer le fichier

```bash
touch plugin/commands/ma-commande.md
```

### 2. Ajouter le frontmatter

```yaml
---
description: Ma nouvelle commande fait X
---
```

### 3. Documenter la commande

- **Objectif** : Pourquoi cette commande existe
- **Utilisation** : Syntaxe et exemples
- **Comportement** : Ce que la commande fait étape par étape
- **Erreurs** : Cas d'erreur et comment les gérer

### 4. Tester la commande

- Installer le plugin localement
- Exécuter la commande dans un projet test
- Vérifier le comportement attendu

---

## Conventions de Nommage

### Fichiers

- Format : `kebab-case.md`
- Exemples : `fix.md`, `project-status.md`

### Commandes slash

- Format : `/nom-commande`
- Court et mémorisable
- Verbe d'action si possible

---

## Bonnes Pratiques

### DO

- Description claire en une ligne
- Exemples d'utilisation concrets
- Gestion des erreurs documentée
- Feedback utilisateur à chaque étape

### DON'T

- Commandes trop longues ou complexes
- Comportement silencieux (toujours informer l'utilisateur)
- Dépendances non documentées
- Actions destructives sans confirmation
