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

## Confidence Scoring

Le confidence scoring est au cœur du système d'apprentissage. Il détermine comment l'IA doit réagir à chaque pattern détecté.

### Échelle de confiance

| Score | Niveau | Action | Comportement IA |
|-------|--------|--------|-----------------|
| **0.0-0.3** | Bruit | Ignorer | Ne pas agir, continuer d'observer |
| **0.3-0.5** | Tentative | Suggérer | Mentionner en passant, demander confirmation |
| **0.5-0.7** | Probable | Proposer | Proposer activement, appliquer si pas d'objection |
| **0.7-0.9** | Certain | Appliquer | Appliquer automatiquement, informer |
| **0.9-1.0** | Établi | Règle | Toujours appliquer, ne plus mentionner |

### Calcul du score

#### Formule de base

```
confidence_final = confidence_base × recency_weight × frequency_bonus - contradictions_penalty
```

#### Composants

**1. Confidence de base (par type)**

| Type | Range | Justification |
|------|-------|---------------|
| `pattern` | 0.3-0.5 | Détection automatique, besoin de validation |
| `correction` | 0.5-0.7 | Feedback explicite de l'utilisateur |
| `preference` | 0.3-0.5 | Souvent déduit, pas toujours explicite |
| `error` | 0.6-0.8 | Erreur factuelle, signal fort |
| `success` | 0.5-0.7 | Validation positive explicite |

**2. Recency weight (décroissance temporelle)**

```
recency_weight = e^(-days_old / 30)
```

| Âge | Weight | Interprétation |
|-----|--------|----------------|
| 0 jours | 1.00 | Poids maximum |
| 7 jours | 0.79 | Encore très pertinent |
| 14 jours | 0.63 | Pertinent |
| 30 jours | 0.37 | Poids réduit |
| 60 jours | 0.14 | Faible influence |
| 90 jours | 0.05 | Quasi-ignoré |

**3. Frequency bonus (répétition)**

```
frequency_bonus = min(1.3, 1 + occurrences × 0.05)
```

| Occurrences | Bonus | Total multiplier |
|-------------|-------|------------------|
| 1 | +0% | ×1.00 |
| 3 | +15% | ×1.15 |
| 5 | +25% | ×1.25 |
| 6+ | +30% | ×1.30 (cap) |

**4. Contradictions penalty**

```
contradictions_penalty = 0.15 × recent_contradictions
```

Une contradiction récente (< 14 jours) réduit significativement le score.

### Exemples de calcul

#### Exemple 1: Pattern récent avec répétitions

```
Type: pattern (base: 0.4)
Âge: 3 jours (recency: 0.90)
Occurrences: 4 (bonus: 1.20)
Contradictions: 0

confidence = 0.4 × 0.90 × 1.20 - 0 = 0.43
→ Niveau: Tentative (suggérer)
```

#### Exemple 2: Correction explicite

```
Type: correction (base: 0.6)
Âge: 1 jour (recency: 0.97)
Occurrences: 2 (bonus: 1.10)
Contradictions: 0

confidence = 0.6 × 0.97 × 1.10 - 0 = 0.64
→ Niveau: Probable (proposer)
```

#### Exemple 3: Pattern établi mais ancien

```
Type: success (base: 0.7)
Âge: 45 jours (recency: 0.22)
Occurrences: 8 (bonus: 1.30)
Contradictions: 0

confidence = 0.7 × 0.22 × 1.30 - 0 = 0.20
→ Niveau: Bruit (ignorer ou re-valider)
```

#### Exemple 4: Pattern avec contradiction

```
Type: pattern (base: 0.5)
Âge: 5 jours (recency: 0.85)
Occurrences: 5 (bonus: 1.25)
Contradictions: 1 (penalty: 0.15)

confidence = 0.5 × 0.85 × 1.25 - 0.15 = 0.38
→ Niveau: Tentative (besoin de clarification)
```

### Ajustements manuels

Certains événements ajustent directement le score:

| Événement | Ajustement |
|-----------|------------|
| Validation explicite ("oui, fais ça") | +0.20 |
| Rejet explicite ("non, pas ça") | -0.30 |
| Réutilisation du pattern | +0.10 |
| Modification silencieuse (rollback) | -0.15 |
| Demande de rappel ("rappelle-moi") | +0.15 |

### Agrégation pour patterns similaires

Quand plusieurs observations concernent le même pattern:

```
confidence_aggregated = weighted_average(confidences) × consistency_factor

Où:
- weighted_average: moyenne pondérée par recency
- consistency_factor: 1.0 si tous alignés, 0.7 si variations
```

### Seuils de décision

```
if confidence < 0.3:
    # Bruit - ne rien faire
    pass

elif confidence < 0.5:
    # Tentative - suggérer discrètement
    "Au fait, j'ai remarqué que tu préfères X. Veux-tu que je continue ainsi?"

elif confidence < 0.7:
    # Probable - proposer activement
    "Basé sur tes préférences, je propose de faire X. OK?"

elif confidence < 0.9:
    # Certain - appliquer et informer
    "J'applique X comme d'habitude."

else:
    # Établi - appliquer silencieusement
    # (pas besoin de mentionner)
```

### Évolution des seuils

Les seuils peuvent être ajustés par projet dans `.act/config.yaml`:

```yaml
confidence:
  thresholds:
    ignore: 0.3
    suggest: 0.5
    apply: 0.7
    permanent: 0.9
  
  decay:
    half_life_days: 30
  
  bonus:
    max_frequency: 1.3
```

## Métriques

Suivre:
- Observations par jour
- Distribution par type
- Taux de conversion en instincts
- Précision des patterns (feedback)
- Distribution des confidence scores
