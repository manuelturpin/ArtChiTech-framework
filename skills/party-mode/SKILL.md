# Skill: Party Mode

## Vue d'Ensemble

Party Mode permet d'explorer un sujet via **plusieurs perspectives simulées**. L'agent incarne successivement 5 personas différentes pour révéler tensions, trade-offs et angles morts.

## Comment Lancer une Discussion

### Commande de Base

```
/act:party "<topic>"
```

### Avec Options

```
/act:party "<topic>" [--agents <list>] [--rounds <n>] [--format <type>] [--summary]
```

### Exemples

```bash
# Discussion complète (5 agents, 3 rounds)
/act:party "Should we rewrite the authentication module?"

# Agents sélectionnés
/act:party "API design: REST vs GraphQL" --agents architect,developer

# Format synthétique
/act:party "Is TDD worth it here?" --format table --summary

# Discussion courte
/act:party "Naming convention for this module" --rounds 1
```

## Les 5 Personas

| Emoji | Persona | Perspective |
|-------|---------|-------------|
| 🏛️ | Architect | Vue système, patterns, scalabilité |
| 💻 | Developer | Code, pragmatisme, effort |
| 🔍 | Reviewer | Qualité, bugs, tests |
| 👤 | User Advocate | UX, simplicité, adoption |
| 😈 | Devil's Advocate | Risques, alternatives |

→ Voir `personas/` pour les descriptions complètes.

## Règles de la Discussion

### 1. Séparation des Perspectives

Chaque persona répond **indépendamment** :
- Pas d'influence croisée dans le même round
- Chaque voix authentique à son rôle
- Contradictions bienvenues

### 2. Format des Interventions

- **Longueur** : 2-4 phrases par persona
- **Ton** : Direct, orienté action
- **Focus** : Sur le topic, pas sur les autres personas

### 3. Progression des Rounds

| Round | Focus |
|-------|-------|
| 1 | Réaction initiale au topic |
| 2 | Approfondissement, réponse aux tensions |
| 3 | Convergence ou clarification des désaccords |

### 4. Pas de Consensus Forcé

Le but n'est pas l'unanimité mais la **clarté** :
- Tensions explicites = meilleures décisions
- Désaccords = trade-offs à considérer

## Comment Synthétiser les Résultats

### Format de Synthèse (--summary)

```markdown
## 📊 Synthèse

### ✅ Consensus
- [Points d'accord entre personas]

### ⚖️ Tensions
- [Désaccords et trade-offs identifiés]

### 💡 Recommandation
[Action suggérée basée sur la discussion]
```

### Critères de Synthèse

1. **Identifier les patterns** : Quelles personas sont d'accord ?
2. **Nommer les tensions** : Où sont les vrais trade-offs ?
3. **Extraire l'actionable** : Que faire concrètement ?

## When to Use

| Situation | Recommended |
|-----------|-------------|
| Architecture decision | Full party (all 5) |
| Implementation choice | architect, developer |
| Quality concern | developer, reviewer |
| UX question | developer, user-advocate |
| Risk assessment | All + devil's advocate focus |

## Bonnes Pratiques

### ✅ Faire

- Topics ouverts nécessitant exploration
- Décisions avec trade-offs
- Quand vous voulez challenger vos assumptions

### ❌ Éviter

- Questions factuelles simples
- Topics sans réelle tension
- Remplacement de vraies reviews

## Intégration

Party Mode fonctionne avec :
- `/act:consider` → Exploration solo avant party
- `/act:decide` → Décision après party
- `/act:party` → Exploration multi-perspectives

## Fichiers Associés

```
skills/party-mode/
├── SKILL.md              # Ce fichier
└── personas/
    ├── architect.md      # 🏛️ Perspective système
    ├── developer.md      # 💻 Perspective code
    ├── reviewer.md       # 🔍 Perspective qualité
    ├── user-advocate.md  # 👤 Perspective UX
    └── devils-advocate.md # 😈 Perspective critique
```
