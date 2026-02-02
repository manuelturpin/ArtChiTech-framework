---
description: Genere prd.json depuis un PRD markdown pour la boucle autonome
---

# /stories-generate

## Objectif

Convertir un PRD markdown en fichier `prd.json` structure pour la boucle autonome.

## Usage

```
/stories-generate [fichier-prd.md]
```

Si aucun fichier specifie, cherche dans l'ordre :
1. `.act/prd.md`
2. `docs/prd.md`
3. `PRD.md`

## Comportement

1. **Lire** le fichier PRD markdown
2. **Extraire** les informations :
   - Nom du projet (titre H1)
   - Description (premier paragraphe)
   - User Stories (sections ## ou listes)
3. **Generer** `.act/session/prd.json`
4. **Afficher** resume des stories creees

## Format PRD Markdown Attendu

```markdown
# Nom du Projet

Description du projet ou de la feature.

## Stories

### US-001: Titre de la story

En tant que [role], je veux [action], afin de [benefice].

**Criteres d'acceptation:**
- [ ] Critere 1
- [ ] Critere 2

**Priorite:** 1
```

## Format prd.json Genere

```json
{
  "project": "Nom du Projet",
  "branchName": "[branch-courante]",
  "description": "Description...",
  "userStories": [
    {
      "id": "US-001",
      "title": "Titre de la story",
      "description": "En tant que...",
      "acceptanceCriteria": ["Critere 1", "Critere 2"],
      "priority": 1,
      "passes": false,
      "notes": ""
    }
  ]
}
```

## Output

```
Stories generees: 5
Fichier: .act/session/prd.json

US-001 [P1] Titre story 1
US-002 [P2] Titre story 2
...

Lancez /loop pour executer les stories.
```

## Erreurs

| Erreur | Cause | Solution |
|--------|-------|----------|
| Fichier non trouve | PRD inexistant | Specifier le chemin ou creer le fichier |
| Format invalide | PRD mal structure | Verifier le format attendu |
| Pas de stories | Aucune story detectee | Ajouter des sections ## ou listes |
