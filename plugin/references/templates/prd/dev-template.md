# PRD Template : Developpement

> **Type** : Product Requirements Document
> **Usage** : Projets techniques, features, applications

---

## Structure prd.json

```json
{
  "project": "[NOM_PROJET]",
  "branchName": "[TYPE]/[FEATURE]",
  "description": "[DESCRIPTION_FEATURE]",
  "userStories": [
    {
      "id": "US-001",
      "title": "[TITRE_COURT]",
      "description": "En tant que [ROLE], je veux [ACTION], afin de [BENEFICE]",
      "acceptanceCriteria": ["[CRITERE_1]", "[CRITERE_2]"],
      "priority": 1,
      "passes": false,
      "notes": ""
    }
  ]
}
```

---

## Champs

| Champ | Obligatoire | Description |
|-------|-------------|-------------|
| project | Oui | Nom du projet |
| branchName | Oui | Branche git (ex: feature/auth) |
| description | Oui | Vision de la feature |
| userStories | Oui | Liste des stories |

---

## User Story Format

```
En tant que [ROLE],
Je veux [ACTION],
Afin de [BENEFICE].
```

**Exemples de roles** : utilisateur, API, admin, developpeur, pipeline CI

---

## Acceptance Criteria

- Verbe d'action au debut
- Specifique et testable
- Inclure cas d'erreur

```json
"acceptanceCriteria": [
  "Retourne 200 avec JSON valide",
  "Retourne 401 si token invalide",
  "Temps de reponse < 200ms"
]
```

---

## Priority

| Niveau | Usage |
|--------|-------|
| 1 | Bloque les autres stories |
| 2 | Fonctionnalite core |
| 3 | Amelioration |
| 4 | Nice to have |

---

## Exemple Complet

```json
{
  "project": "TaskManager",
  "branchName": "feature/task-priority",
  "description": "Ajouter la gestion des priorites sur les taches",
  "userStories": [
    {
      "id": "US-001",
      "title": "Champ priority sur Task",
      "description": "En tant que developpeur, je veux un champ priority, afin de trier les taches",
      "acceptanceCriteria": [
        "Enum: low, medium, high, critical",
        "Default: medium",
        "Migration creee"
      ],
      "priority": 1,
      "passes": false,
      "notes": ""
    },
    {
      "id": "US-002",
      "title": "Endpoint PATCH priority",
      "description": "En tant que frontend, je veux PATCH /tasks/:id/priority",
      "acceptanceCriteria": [
        "Accepte { priority: string }",
        "Retourne 200 avec tache mise a jour",
        "Retourne 400 si priority invalide"
      ],
      "priority": 2,
      "passes": false,
      "notes": ""
    }
  ]
}
```

---

*Template PRD Dev - ACT Framework*
