# /act:party - Multi-Perspective Discussion

## Synopsis

```
/act:party "<topic>" [--agents <list>] [--rounds <n>] [--summary] [--format <type>]
```

## Description

Lance une discussion multi-perspectives où 5 personas explorent le topic sous différents angles. Utile pour les décisions complexes nécessitant plusieurs points de vue.

## Options

| Option | Description | Défaut |
|--------|-------------|--------|
| `--agents <list>` | Liste des agents à inclure (séparés par virgule) | Tous les 5 |
| `--rounds <n>` | Nombre de tours de discussion | 3 |
| `--summary` | Générer une synthèse à la fin | false |
| `--format <type>` | Format de sortie | discussion |

### Valeurs de --agents

- `architect` - 🏛️ Vue système
- `developer` - 💻 Implémentation
- `reviewer` - 🔍 Qualité
- `user` - 👤 UX (alias: user-advocate)
- `devil` - 😈 Critique (alias: devils-advocate)

### Valeurs de --format

| Format | Description |
|--------|-------------|
| `discussion` | Format conversationnel complet |
| `table` | Tableau comparatif des positions |
| `summary` | Synthèse uniquement (implique --summary) |

## Exemples

### Discussion Complète

```
/act:party "Should we migrate to microservices?"
```

Output :
```markdown
## 🎭 Party Mode: Should we migrate to microservices?

### Round 1

🏛️ **Architect**: Les microservices offrent une meilleure scalabilité...
💻 **Developer**: En termes d'effort, c'est 6 mois minimum...
🔍 **Reviewer**: Je vois des risques de debugging distribué...
👤 **User Advocate**: Peu importe l'archi si ça ship plus vite...
😈 **Devil's Advocate**: Et si on restait monolith encore 2 ans ?

[Rounds 2-3...]
```

### Agents Sélectionnés

```
/act:party "REST vs GraphQL for our API" --agents architect,developer
```

Seulement Architect et Developer participent.

### Format Table

```
/act:party "Error handling strategy" --format table
```

Output :
```markdown
| Persona | Position | Argument Principal |
|---------|----------|-------------------|
| 🏛️ Architect | Favor Result types | Cohérence système |
| 💻 Developer | Favor exceptions | Plus simple à implémenter |
| 🔍 Reviewer | Favor Result types | Meilleur pour tests |
| 👤 User Advocate | Neutre | Veut bons messages d'erreur |
| 😈 Devil's Advocate | Challenge | On over-engineer peut-être |
```

### Avec Synthèse

```
/act:party "Should we add this feature?" --summary
```

Ajoute à la fin :
```markdown
## 📊 Synthèse

### ✅ Consensus
- La feature a de la valeur pour les utilisateurs
- L'effort est raisonnable (~2 semaines)

### ⚖️ Tensions
- Architect vs Developer sur le niveau d'abstraction
- Reviewer inquiet sur les edge cases auth

### 💡 Recommandation
Procéder avec une v1 simple, itérer après feedback.
```

### Discussion Courte

```
/act:party "Naming: UserService vs UserManager" --rounds 1
```

Un seul tour pour les questions légères.

## Comportement

### Règles de Discussion

1. Chaque persona répond **indépendamment** (pas d'influence croisée)
2. Réponses de **2-4 phrases** (concises)
3. Les **désaccords sont bienvenus** (révèlent les trade-offs)
4. Pas de **consensus forcé**

### Flow

```
Topic → Round 1 → Round 2 → Round 3 → [Summary]
         ↓          ↓          ↓
       Initial   Deepen    Converge
       reaction  analysis  or clarify
```

## Voir Aussi

- `/act:consider` - Exploration solo structurée
- `/act:decide` - Framework de décision
- `specs/SPEC-party-mode.md` - Spécification complète
- `skills/party-mode/` - Définition des personas
