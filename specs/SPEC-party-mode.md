# SPEC: Party Mode

## Concept

Party Mode est un mécanisme de **discussion multi-perspectives** où l'agent simule plusieurs personas distinctes pour explorer un problème sous différents angles. Plutôt qu'une réponse monolithique, l'utilisateur obtient un débat interne riche qui révèle tensions, trade-offs et consensus.

### Pourquoi Party Mode ?

Les décisions complexes nécessitent plusieurs perspectives :
- Un architecte pense différemment d'un développeur
- Un reviewer voit des angles morts que les autres ignorent
- Un avocat du diable challenge les assumptions

En simulant ces voix, on évite :
- Les biais de confirmation
- Les angles morts techniques
- Les décisions précipitées

## Les 5 Personas

| Persona | Perspective | Focus Principal |
|---------|-------------|-----------------|
| **Architect** | Vue système | Structure, patterns, scalabilité, cohérence globale |
| **Developer** | Implémentation | Code concret, pragmatisme, faisabilité, effort |
| **Reviewer** | Qualité | Bugs potentiels, edge cases, tests, maintenabilité |
| **User Advocate** | UX | Utilisabilité, simplicité, expérience, adoption |
| **Devil's Advocate** | Critique | Risques, problèmes cachés, alternatives ignorées |

### Dynamique des Personas

```
           Architect
          (big picture)
              ↕
Developer ←→ Topic ←→ Reviewer
(pragmatic)          (quality)
              ↕
        User Advocate
         (simplicity)
              ↕
       Devil's Advocate
         (challenge)
```

## Format de Discussion

### Structure d'un Round

```markdown
## 🎭 Round [N]

### 🏛️ Architect
[Perspective architecture]

### 💻 Developer  
[Perspective développeur]

### 🔍 Reviewer
[Perspective qualité]

### 👤 User Advocate
[Perspective utilisateur]

### 😈 Devil's Advocate
[Perspective critique]
```

### Règles de Discussion

1. **Indépendance** : Chaque persona répond sans connaître les autres réponses du même round
2. **Réponse directe** : Au topic, pas aux autres personas (sauf rounds de réaction)
3. **Authenticité** : Chaque persona reste dans son rôle
4. **Concision** : 2-4 phrases par intervention

### Modes de Format

| Mode | Description | Usage |
|------|-------------|-------|
| `discussion` | Format conversationnel complet | Exploration approfondie |
| `table` | Tableau comparatif | Vue synthétique rapide |
| `summary` | Synthèse des positions | Décision finale |

## Exemples d'Utilisation

### Décision Architecture

```
/act:party "Microservices vs Monolith for our new project"
```

**Output attendu :**
- Architect : Préfère microservices pour scalabilité future
- Developer : Préfère monolith pour vélocité initiale
- Reviewer : Inquiet sur la complexité de debug des microservices
- User Advocate : Veut ce qui ship le plus vite
- Devil's Advocate : Challenge si on a vraiment besoin de scale

### Choix de Design Pattern

```
/act:party "How should we handle error propagation?" --rounds 2
```

### Discussion Ciblée

```
/act:party "Is this refactoring worth it?" --agents architect,developer,reviewer
```

## Synthèse Automatique

Avec `--summary`, une synthèse finale est générée :

```markdown
## 📊 Synthèse

### Consensus
- [Points où tous/majorité sont d'accord]

### Tensions
- [Points de désaccord et trade-offs identifiés]

### Recommandation
[Suggestion basée sur la discussion]
```

## Intégration avec /act

Party Mode complète les autres commandes :
- `/act:consider` pour explorer seul
- `/act:decide` pour trancher
- `/act:party` pour perspectives multiples

## Limitations

- Ne remplace pas de vraies reviews par de vraies personnes
- Les personas sont simulées, pas de vraie diversité cognitive
- Utile pour exploration, pas pour validation finale
