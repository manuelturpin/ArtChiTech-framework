# Template: Observation JSONL

**Fichier:** `.act/observations.jsonl`
**Format:** JSON Lines (une observation par ligne)

## Schema

```json
{
  "timestamp": "ISO-8601",
  "type": "pattern|correction|preference|error|success",
  "context": {
    "task": "string",
    "file": "string (optional)",
    "phase": "planning|implementation|review|testing"
  },
  "observation": "string",
  "evidence": ["string"],
  "confidence": 0.0-1.0,
  "tags": ["string"]
}
```

## Champs requis

| Champ | Type | Description |
|-------|------|-------------|
| `timestamp` | ISO 8601 | `2026-02-02T06:00:00Z` |
| `type` | enum | Type d'observation |
| `context` | object | Contexte minimal |
| `observation` | string | Description claire et concise |
| `confidence` | float | Score entre 0.0 et 1.0 |

## Champs optionnels

| Champ | Type | Description |
|-------|------|-------------|
| `evidence` | array | Preuves supportant l'observation |
| `tags` | array | Tags pour catégorisation |
| `context.file` | string | Fichier concerné |
| `context.phase` | enum | Phase du workflow |

## Types d'observation

### `pattern`
Comportement récurrent détecté automatiquement.
```json
{"timestamp": "2026-02-02T06:00:00Z", "type": "pattern", "context": {"task": "refactoring", "phase": "implementation"}, "observation": "Utilise toujours des commits atomiques", "confidence": 0.5, "tags": ["workflow", "git"]}
```

### `correction`
L'utilisateur a corrigé une action de l'IA.
```json
{"timestamp": "2026-02-02T06:00:00Z", "type": "correction", "context": {"task": "naming", "file": "src/utils.ts"}, "observation": "Demande camelCase au lieu de snake_case", "evidence": ["user: 'utilise camelCase stp'"], "confidence": 0.6, "tags": ["code", "style"]}
```

### `preference`
Préférence exprimée ou déduite.
```json
{"timestamp": "2026-02-02T06:00:00Z", "type": "preference", "context": {"task": "documentation"}, "observation": "Préfère documentation inline aux README longs", "confidence": 0.4, "tags": ["docs", "style"]}
```

### `error`
Erreur commise par l'IA, identifiée après coup.
```json
{"timestamp": "2026-02-02T06:00:00Z", "type": "error", "context": {"task": "commit", "phase": "review"}, "observation": "Commit sans exécuter les tests - CI rouge", "evidence": ["CI failed", "user: 'lance les tests avant!'"], "confidence": 0.8, "tags": ["workflow", "testing"]}
```

### `success`
Action validée positivement par l'utilisateur.
```json
{"timestamp": "2026-02-02T06:00:00Z", "type": "success", "context": {"task": "code review", "phase": "review"}, "observation": "Format de PR apprécié avec checklist", "evidence": ["user: 'parfait, garde ce format'"], "confidence": 0.7, "tags": ["workflow", "pr"]}
```

## Confidence initiale par type

| Type | Confidence de base | Rationale |
|------|-------------------|-----------|
| `pattern` | 0.3-0.5 | Détection automatique, à confirmer |
| `correction` | 0.5-0.7 | Feedback explicite mais ponctuel |
| `preference` | 0.3-0.5 | Souvent déduit, pas explicite |
| `error` | 0.6-0.8 | Erreur factuelle, haute confiance |
| `success` | 0.5-0.7 | Validation positive explicite |

## Bonnes pratiques

### DO ✓
- Garder les observations courtes et spécifiques
- Inclure des preuves quand disponibles
- Utiliser des tags cohérents
- Logger immédiatement après l'événement

### DON'T ✗
- Ne pas inclure de données sensibles
- Ne pas logger chaque micro-action
- Ne pas dupliquer des observations identiques
- Ne pas mettre de confidence arbitrairement haute

## Gestion du fichier

### Limites
- Maximum 100 observations conservées
- Purge automatique > 90 jours
- Taille max: 50KB

### Rotation
Quand le fichier dépasse les limites:
1. Archiver dans `.act/observations-YYYY-MM.jsonl.gz`
2. Garder les 50 observations les plus récentes
3. Garder les observations avec confidence ≥ 0.7

## Exemple de fichier complet

```jsonl
{"timestamp": "2026-02-01T10:00:00Z", "type": "pattern", "context": {"task": "coding", "phase": "implementation"}, "observation": "Commits fréquents toutes les 15-20 min", "confidence": 0.4, "tags": ["workflow", "git"]}
{"timestamp": "2026-02-01T14:30:00Z", "type": "correction", "context": {"task": "naming", "file": "src/api.ts"}, "observation": "Préfère noms de fonctions verbeux et descriptifs", "evidence": ["renamed: get() → getUserById()"], "confidence": 0.5, "tags": ["code", "naming"]}
{"timestamp": "2026-02-01T16:00:00Z", "type": "success", "context": {"task": "testing", "phase": "testing"}, "observation": "Tests edge cases appréciés", "evidence": ["user: 'bien vu les edge cases'"], "confidence": 0.6, "tags": ["testing"]}
{"timestamp": "2026-02-02T09:00:00Z", "type": "error", "context": {"task": "deploy", "phase": "review"}, "observation": "Oublié de vérifier la version dans package.json", "confidence": 0.7, "tags": ["workflow", "release"]}
```
