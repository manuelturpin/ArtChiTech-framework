# Skill: Continuous Learning

**Version:** 1.0.0
**Confidence:** N/A (meta-skill)

## Description

Ce skill permet à l'IA d'observer et d'apprendre continuellement des interactions avec l'utilisateur, détectant des patterns de comportement, préférences et corrections pour améliorer automatiquement ses réponses futures.

## Pattern Detection

### Quand observer

Observer et potentiellement logger une observation quand:

1. **Correction explicite**
   - L'utilisateur dit "non", "pas comme ça", "plutôt..."
   - Une modification manuelle est faite après une action de l'IA
   - Un revert ou undo est effectué

2. **Validation positive**
   - L'utilisateur dit "parfait", "bien", "garde ça"
   - L'utilisateur réutilise un pattern proposé
   - Pas de correction après une action significative

3. **Répétition de comportement**
   - L'utilisateur fait la même chose ≥3 fois
   - Une séquence d'actions se répète
   - Un choix est fait de manière consistante

4. **Erreur identifiée**
   - CI/tests échouent après une action
   - L'utilisateur signale un problème
   - Un rollback est nécessaire

5. **Feedback implicite**
   - Temps de réponse (longue pause = hésitation?)
   - Questions de clarification (confusion?)
   - Modification du scope (ajustement?)

### Comment observer

```markdown
## Checklist d'observation

Lors de chaque interaction significative, se poser:

1. [ ] Y a-t-il eu une correction? (type: correction)
2. [ ] Y a-t-il eu une validation? (type: success)
3. [ ] Est-ce un pattern déjà vu? (type: pattern)
4. [ ] Y a-t-il eu une erreur? (type: error)
5. [ ] Une préférence est-elle exprimée? (type: preference)

Si oui à l'une de ces questions → Logger une observation
```

### Quand NE PAS observer

- Actions triviales (navigation, lecture)
- Informations sensibles ou personnelles
- Contexte insuffisant pour être utile
- Duplication d'une observation récente (< 24h)

## Types de Patterns

### 1. Code Patterns

Patterns liés au code et à l'architecture.

| Pattern | Indicateurs | Exemple |
|---------|-------------|---------|
| **Style de nommage** | Corrections de noms, conventions | camelCase vs snake_case |
| **Structure fichiers** | Organisation du code | Un fichier par classe |
| **Patterns architecturaux** | Choix de design | Repository pattern |
| **Gestion erreurs** | Try/catch, Either, Result | Préfère Result<T, E> |
| **Commentaires** | Style de documentation | JSDoc vs inline |

**Exemple d'observation code:**
```json
{
  "type": "correction",
  "context": {"task": "naming", "file": "src/user.ts"},
  "observation": "Renommage: getData → fetchUserProfile (noms descriptifs)",
  "confidence": 0.5,
  "tags": ["code", "naming"]
}
```

### 2. Workflow Patterns

Patterns liés au processus de travail.

| Pattern | Indicateurs | Exemple |
|---------|-------------|---------|
| **Fréquence commits** | Timing des commits | Commit après chaque fonction |
| **Style commits** | Format des messages | Conventional commits |
| **Ordre opérations** | Séquence d'actions | Tests avant refactoring |
| **Revue de code** | Points de validation | Checklist avant PR |
| **Branching** | Stratégie git | Feature branches |

**Exemple d'observation workflow:**
```json
{
  "type": "pattern",
  "context": {"task": "git workflow", "phase": "implementation"},
  "observation": "Commits atomiques: une seule responsabilité par commit",
  "evidence": ["3 commits séparés pour 1 feature", "demande de split commit"],
  "confidence": 0.6,
  "tags": ["workflow", "git"]
}
```

### 3. Error Patterns

Patterns d'erreurs récurrentes à éviter.

| Pattern | Indicateurs | Exemple |
|---------|-------------|---------|
| **Oublis récurrents** | Mêmes erreurs répétées | Oubli de mise à jour version |
| **Edge cases manqués** | Bugs sur cas limites | Null handling |
| **Assumptions fausses** | Mauvaises suppositions | API change non détecté |
| **Tests insuffisants** | CI rouge après commit | Coverage insuffisante |

**Exemple d'observation erreur:**
```json
{
  "type": "error",
  "context": {"task": "release", "phase": "review"},
  "observation": "Oubli de bump version dans package.json avant tag",
  "evidence": ["version 1.0.0 alors que tag v1.1.0"],
  "confidence": 0.8,
  "tags": ["workflow", "release", "version"]
}
```

### 4. Success Patterns

Patterns qui fonctionnent bien à reproduire.

| Pattern | Indicateurs | Exemple |
|---------|-------------|---------|
| **Formats appréciés** | Validation positive | Format de PR avec checklist |
| **Approches efficaces** | Réutilisation | TDD pour bugs |
| **Communication** | Feedback positif | Résumés concis |
| **Proactivité** | Anticipation validée | Suggérer des tests |

**Exemple d'observation succès:**
```json
{
  "type": "success",
  "context": {"task": "documentation", "file": "README.md"},
  "observation": "Structure README avec exemples de code appréciée",
  "evidence": ["user: 'parfait ce format, garde-le'"],
  "confidence": 0.7,
  "tags": ["docs", "format"]
}
```

## Processus d'observation

### 1. Détection

```
Événement → Analyse → Catégorisation → Décision de logger
```

### 2. Contextualisation

Capturer le contexte minimal mais suffisant:
- Tâche en cours
- Fichier(s) concerné(s)
- Phase du workflow
- Preuves disponibles

### 3. Scoring initial

Assigner une confidence basée sur:
- Type d'observation (voir table confidence)
- Force des preuves
- Clarté du signal

### 4. Logging

Écrire dans `.act/observations.jsonl`:
```bash
echo '{"timestamp": "...", ...}' >> .act/observations.jsonl
```

## Intégration avec les Hooks

Les hooks peuvent automatiser certaines observations:

```yaml
# hooks/post-commit.yaml
observe:
  - type: pattern
    when: commit_count > 5 in last hour
    observation: "Commits fréquents détectés"
    confidence: 0.4

# hooks/post-test.yaml
observe:
  - type: error
    when: tests_failed after ai_change
    observation: "Tests échoués après modification IA"
    confidence: 0.7
```

## Commandes associées

- `/act:evolve` - Analyse les observations et fait évoluer le système
- `/act:status` - Voir les patterns détectés

## Métriques

Suivre:
- Observations par jour
- Distribution par type
- Taux de conversion en instincts
- Précision des patterns (feedback)
