# GitHub Issue Template (ACT Phase)

> Template utilisé par `/act:sync-github` pour créer les Issues de phase.

## Format

```markdown
## 🎯 Objectif

{phase_description}

## 📋 Tâches

{tasks_checklist}

## 📊 Contexte ACT

| Attribut | Valeur |
|----------|--------|
| **Phase** | {phase_number}/7 |
| **Projet** | {project_name} |
| **Type** | {project_type} |
| **Dernière sync** | {sync_timestamp} |

## 📎 Liens

- [plan.md]({repo_url}/blob/{branch}/.act/plan.md)
- [progress.md]({repo_url}/blob/{branch}/.act/progress.md)

---
*🤖 Géré automatiquement par [ACT Framework](https://github.com/your-org/act-framework) v2.5*
```

## Variables

| Variable | Source | Description |
|----------|--------|-------------|
| `{phase_description}` | plan.md | Description de la phase |
| `{tasks_checklist}` | plan.md | Liste des tâches `- [ ]` / `- [x]` |
| `{phase_number}` | plan.md | Numéro de la phase (1-7) |
| `{project_name}` | config.yaml | Nom du projet |
| `{project_type}` | config.yaml | Type (product, cli, etc.) |
| `{sync_timestamp}` | Auto | Date/heure de sync |
| `{repo_url}` | git remote | URL du dépôt |
| `{branch}` | git branch | Branche actuelle |

## Exemple de sortie

```markdown
## 🎯 Objectif

Définir l'architecture technique et le design UX du produit.

## 📋 Tâches

- [x] Créer les diagrammes d'architecture
- [x] Définir le schéma de base de données
- [ ] Prototyper l'interface utilisateur
- [ ] Valider avec les stakeholders

## 📊 Contexte ACT

| Attribut | Valeur |
|----------|--------|
| **Phase** | 3/7 |
| **Projet** | Mon Application |
| **Type** | product |
| **Dernière sync** | 2026-02-02 14:30 UTC |

## 📎 Liens

- [plan.md](https://github.com/owner/repo/blob/main/.act/plan.md)
- [progress.md](https://github.com/owner/repo/blob/main/.act/progress.md)

---
*🤖 Géré automatiquement par [ACT Framework](https://github.com/your-org/act-framework) v2.5*
```

## Labels assignés

L'Issue créée avec ce template reçoit automatiquement :
- `phase-{N}` — Label de la phase
- `act-managed` — Identifie les Issues gérées par ACT
- `in-progress` ou `pending` — Selon l'état

## Notes

- Le titre de l'Issue suit le format : `[Phase {N}] {phase_name}`
- Les tâches sont synchronisées bidirectionnellement
- L'Issue est fermée automatiquement quand toutes les tâches sont complétées
