# SPEC: Continuous Learning System

**Version:** 2.5.0-beta.1
**Status:** Implementation
**Date:** 2026-02-02

## Objectif

Permettre à l'IA d'apprendre continuellement de ses interactions avec l'utilisateur, en observant les patterns de comportement, les préférences et les corrections pour améliorer automatiquement ses réponses futures.

## Architecture

```
┌──────────────────────────────────────────────────────────────────────┐
│                         Session de travail                           │
└──────────────────────────────────────────────────────────────────────┘
                                   │
                                   ▼
┌──────────────────────────────────────────────────────────────────────┐
│                    Hooks (observe automatiquement)                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐ │
│  │ post-commit │  │ post-error  │  │ post-success│  │ user-feedback│ │
│  └─────────────┘  └─────────────┘  └─────────────┘  └─────────────┘ │
└──────────────────────────────────────────────────────────────────────┘
                                   │
                                   ▼
┌──────────────────────────────────────────────────────────────────────┐
│                    .act/observations.jsonl                           │
│  {"timestamp": "...", "type": "pattern", "observation": "...",       │
│   "context": "...", "confidence": 0.5}                               │
└──────────────────────────────────────────────────────────────────────┘
                                   │
                     ┌─────────────┼─────────────┐
                     ▼             ▼             ▼
              ┌──────────┐  ┌──────────┐  ┌──────────┐
              │ Pattern  │  │Confidence│  │  Decay   │
              │Detection │  │ Scoring  │  │ System   │
              └──────────┘  └──────────┘  └──────────┘
                                   │
                                   ▼
┌──────────────────────────────────────────────────────────────────────┐
│                         /act:evolve                                   │
│  - Analyse observations récentes                                      │
│  - Détecte patterns récurrents (≥3 occurrences)                      │
│  - Calcule confidence agrégée                                         │
│  - Génère instincts ou met à jour skills                             │
└──────────────────────────────────────────────────────────────────────┘
                     │                           │
                     ▼                           ▼
              ┌──────────────┐           ┌──────────────┐
              │  instincts/  │           │   skills/    │
              │  (patterns   │           │  (mise à     │
              │  émergents)  │           │   jour)      │
              └──────────────┘           └──────────────┘
```

## Format des Observations

### Schema JSONL

Fichier: `.act/observations.jsonl`

```json
{
  "timestamp": "2026-02-02T06:00:00Z",
  "type": "pattern|correction|preference|error|success",
  "context": {
    "task": "description courte de la tâche",
    "file": "chemin/fichier.md",
    "phase": "planning|implementation|review"
  },
  "observation": "Description de ce qui a été observé",
  "evidence": ["élément 1", "élément 2"],
  "confidence": 0.5,
  "tags": ["code", "workflow", "style"]
}
```

### Types d'observations

| Type | Description | Exemple |
|------|-------------|---------|
| `pattern` | Comportement récurrent détecté | "L'utilisateur préfère les commits atomiques" |
| `correction` | L'utilisateur a corrigé l'IA | "Demande de simplifier le code" |
| `preference` | Préférence explicite ou implicite | "Toujours utiliser TypeScript strict" |
| `error` | Erreur commise par l'IA | "Tests non exécutés avant commit" |
| `success` | Action validée par l'utilisateur | "Format de documentation apprécié" |

### Champs

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| `timestamp` | ISO 8601 | ✓ | Moment de l'observation |
| `type` | enum | ✓ | Catégorie de l'observation |
| `context` | object | ✓ | Contexte de l'observation |
| `observation` | string | ✓ | Description claire |
| `evidence` | array | - | Preuves supportant l'observation |
| `confidence` | float | ✓ | Score de confiance 0.0-1.0 |
| `tags` | array | - | Tags pour catégorisation |

## Pattern Detection

### Types de patterns

1. **Code patterns**
   - Style de nommage
   - Structure de fichiers
   - Patterns architecturaux

2. **Workflow patterns**
   - Ordre des opérations
   - Points de validation
   - Fréquence des commits

3. **Error patterns**
   - Erreurs récurrentes
   - Sources de confusion
   - Edge cases manqués

4. **Success patterns**
   - Ce qui fonctionne bien
   - Approches validées
   - Formats appréciés

### Critères de détection

Un pattern est considéré significatif quand:
- **≥3 occurrences** du même comportement
- **Confidence moyenne ≥0.5** sur les occurrences
- **Pas de contradiction** récente (derniers 7 jours)

## Confidence Scoring

### Échelle de confiance

| Score | Niveau | Action recommandée |
|-------|--------|-------------------|
| 0.0-0.3 | Bruit | Ignorer |
| 0.3-0.5 | Tentative | Suggérer (demander confirmation) |
| 0.5-0.7 | Probable | Proposer (appliquer si pas d'objection) |
| 0.7-0.9 | Certain | Appliquer automatiquement |
| 0.9-1.0 | Établi | Règle permanente |

### Calcul du score

```
confidence_base = f(type, evidence)
confidence_adjusted = confidence_base × recency_weight × frequency_bonus

Où:
- recency_weight = exp(-days_old / 30)  # Décroît avec le temps
- frequency_bonus = min(1.3, 1 + occurrences × 0.1)  # Bonus fréquence
```

### Facteurs influençant le score

| Facteur | Impact |
|---------|--------|
| Feedback explicite utilisateur | +0.3 |
| Répétition du pattern | +0.1 par occurrence |
| Correction par l'utilisateur | +0.2 (pour la correction) |
| Âge de l'observation | -0.02 par semaine |
| Contradiction détectée | -0.3 |

## Commandes

### /act:evolve

Analyse les observations et fait évoluer le système.

**Syntaxe:**
```
/act:evolve [--dry-run] [--since=7d] [--min-confidence=0.5]
```

**Options:**
- `--dry-run`: Montre ce qui serait fait sans appliquer
- `--since`: Période à analyser (défaut: 7 jours)
- `--min-confidence`: Seuil minimum (défaut: 0.5)

**Processus:**
1. Charge les observations récentes
2. Groupe par pattern similaire
3. Calcule la confidence agrégée
4. Pour chaque pattern significatif:
   - Si confidence < 0.7: Crée un instinct (suggestion)
   - Si confidence ≥ 0.7: Met à jour un skill existant ou crée une règle

**Output:**
```markdown
## Évolution détectée

### Nouveaux instincts (3)
- [0.6] Préférence pour commits atomiques
- [0.5] Tests avant tout refactoring
- [0.5] Documentation inline > README

### Skills mis à jour (1)
- context-engineering: Ajout règle "max 3 fichiers par contexte"

### Observations ignorées (5)
- Confidence trop basse ou contradictions
```

## Instincts vs Skills

### Instincts (`instincts/`)
- Patterns émergents, pas encore établis
- Suggestions, pas des règles
- Évoluent en skills si confidence augmente
- Format: fichiers markdown simples

### Skills (`skills/`)
- Patterns établis et validés
- Règles appliquées automatiquement
- Documentation complète
- Format: `SKILL.md` structuré

## Intégration avec les Hooks

Les hooks observent automatiquement:

```yaml
# hooks/observe.yaml
triggers:
  - post-commit
  - post-test
  - user-feedback

observe:
  - pattern: commit message style
  - pattern: test coverage changes
  - pattern: user corrections
```

## Cycle de vie d'un pattern

```
Observation initiale (0.3-0.4)
         │
         ▼
Répétitions (+0.1 chacune)
         │
         ▼
Instinct créé (≥0.5)
         │
         ▼
Validation utilisateur (+0.2)
         │
         ▼
Skill établi (≥0.7)
         │
         ▼
Règle permanente (≥0.9)
```

## Exemples

### Exemple 1: Détection de préférence de style

```json
// Observation 1
{"timestamp": "2026-02-01T10:00:00Z", "type": "correction", "observation": "Utilisateur demande nommage camelCase", "confidence": 0.4}

// Observation 2
{"timestamp": "2026-02-01T14:00:00Z", "type": "correction", "observation": "Correction: snake_case → camelCase", "confidence": 0.5}

// Observation 3
{"timestamp": "2026-02-02T09:00:00Z", "type": "pattern", "observation": "Tout le code utilise camelCase", "confidence": 0.6}

// Résultat /act:evolve
→ Instinct créé: "Utiliser camelCase pour les variables" (confidence: 0.65)
```

### Exemple 2: Pattern workflow

```json
// Plusieurs observations de succès
{"type": "success", "observation": "Tests exécutés avant commit", "confidence": 0.7}
{"type": "success", "observation": "CI verte après commit", "confidence": 0.7}
{"type": "error", "observation": "Commit sans tests = CI rouge", "confidence": 0.8}

// Résultat /act:evolve
→ Skill mis à jour: session-recovery + règle "toujours exécuter tests avant commit"
```

## Sécurité et Limites

### Limites
- Maximum 100 observations conservées
- Purge automatique des observations > 90 jours
- Maximum 20 instincts actifs

### Protection
- Les observations ne contiennent jamais de secrets
- Les patterns ne sont pas partagés entre projets
- L'utilisateur peut supprimer toute observation

## Métriques

Suivre dans `.act/metrics.json`:
- Nombre d'observations par type
- Taux de conversion instinct → skill
- Précision des suggestions (feedback utilisateur)
