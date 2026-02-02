# Command: /act:evolve

**Version:** 1.0.0
**Category:** Learning

## Description

Analyse les observations accumulées, détecte les patterns récurrents, et fait évoluer le système en générant des instincts ou en mettant à jour des skills existants.

## Syntaxe

```
/act:evolve [options]
```

## Options

| Option | Type | Défaut | Description |
|--------|------|--------|-------------|
| `--dry-run` | flag | false | Montre ce qui serait fait sans appliquer |
| `--since` | duration | 7d | Période à analyser (7d, 14d, 30d) |
| `--min-confidence` | float | 0.5 | Seuil minimum de confidence |
| `--verbose` | flag | false | Affiche les détails du calcul |
| `--force` | flag | false | Force la création même si peu de données |

## Processus

### 1. Chargement des observations

```
.act/observations.jsonl → Filtrer par --since → Observations récentes
```

Lire le fichier JSONL et filtrer:
- Observations dans la période spécifiée
- Observations avec confidence ≥ `--min-confidence`

### 2. Groupement par pattern

Grouper les observations par similarité:
- Même type + tags similaires
- Même contexte (task/file)
- Observation textuelle similaire (fuzzy matching)

```
Observations → Clustering → Pattern Groups
```

### 3. Calcul de confidence agrégée

Pour chaque groupe de patterns:

```
confidence_group = weighted_average(confidences) × frequency_bonus × consistency

Où:
- weighted_average: moyenne pondérée par recency
- frequency_bonus: min(1.3, 1 + count × 0.05)
- consistency: 1.0 si alignés, 0.7-0.9 si variations
```

### 4. Filtrage des patterns significatifs

Un pattern est significatif si:
- ≥3 occurrences
- Confidence agrégée ≥ seuil (défaut 0.5)
- Pas de contradiction récente (< 7 jours)

### 5. Génération des évolutions

| Confidence | Action |
|------------|--------|
| 0.5-0.7 | Créer un **instinct** (suggestion) |
| ≥0.7 | Mettre à jour un **skill** ou créer une règle |

### 6. Application (si pas --dry-run)

- Écrire les nouveaux instincts dans `instincts/`
- Mettre à jour les skills concernés dans `skills/`
- Logger l'évolution dans `.act/evolution-log.jsonl`

## Output

### Format standard

```markdown
## 🧬 Évolution détectée

**Période analysée:** 2026-01-26 → 2026-02-02 (7 jours)
**Observations traitées:** 23

### 📈 Nouveaux instincts (3)

| Confidence | Pattern | Source |
|------------|---------|--------|
| 0.62 | Préférence pour commits atomiques | 4 observations |
| 0.55 | Tests avant tout refactoring | 3 observations |
| 0.51 | Documentation inline > README | 3 observations |

**Fichiers créés:**
- `instincts/prefer-atomic-commits.md`
- `instincts/tests-before-refactor.md`
- `instincts/inline-docs-preferred.md`

### 🎯 Skills mis à jour (1)

| Skill | Modification | Confidence |
|-------|--------------|------------|
| context-engineering | +règle "max 3 fichiers par contexte" | 0.74 |

**Fichiers modifiés:**
- `skills/context-engineering/SKILL.md`

### 📊 Statistiques

- Observations ignorées (confidence < 0.5): 8
- Patterns insuffisants (< 3 occurrences): 5
- Contradictions détectées: 2

### 💡 Recommandations

- Pattern "préférence tabs vs spaces" proche du seuil (0.48) - 1 validation de plus suffirait
- Considérer `/act:evolve --since=14d` pour plus de contexte
```

### Format --dry-run

```markdown
## 🧬 Évolution (DRY RUN - pas de modification)

**Serait créé:**
- `instincts/prefer-atomic-commits.md` (confidence: 0.62)

**Serait modifié:**
- `skills/context-engineering/SKILL.md`

**Aucun fichier n'a été modifié.**
```

### Format --verbose

Ajoute les détails de calcul:

```markdown
### Détail: prefer-atomic-commits

**Observations:**
1. [2026-02-01] correction: "Sépare en 2 commits" (conf: 0.6)
2. [2026-02-01] success: "Commit unique validé" (conf: 0.5)
3. [2026-02-02] pattern: "Toujours commits séparés" (conf: 0.5)
4. [2026-02-02] correction: "Split ce commit" (conf: 0.6)

**Calcul:**
- Base average: 0.55
- Recency weight: 0.95
- Frequency bonus: 1.20 (4 occurrences)
- Consistency: 1.0
- **Final: 0.55 × 0.95 × 1.20 × 1.0 = 0.627**
```

## Génération d'instincts

### Template instinct

```markdown
# Instinct: [Nom dérivé du pattern]

**Confidence:** [score]
**Détecté:** [date]
**Dernière validation:** [date]
**Occurrences:** [count]

## Pattern observé

[Description générée à partir des observations]

## Preuves

[Liste des observations sources]

## Suggestion

[Action recommandée basée sur le pattern]

## Statut

- [x] En observation
- [ ] Suggéré à l'utilisateur
- [ ] Validé par l'utilisateur
- [ ] Promu en skill
```

## Mise à jour de skills

### Critères

Un skill est mis à jour quand:
- Pattern confidence ≥ 0.7
- Pattern lié à un skill existant (par tags ou contexte)
- Pas de contradiction avec les règles existantes

### Processus

1. Identifier le skill cible
2. Générer la règle à ajouter
3. Insérer dans la section appropriée du SKILL.md
4. Logger la modification

## Fichier d'évolution

Chaque exécution est loggée dans `.act/evolution-log.jsonl`:

```json
{
  "timestamp": "2026-02-02T06:00:00Z",
  "command": "/act:evolve --since=7d",
  "observations_processed": 23,
  "instincts_created": ["prefer-atomic-commits", "tests-before-refactor"],
  "skills_updated": ["context-engineering"],
  "dry_run": false
}
```

## Exemples d'utilisation

### Analyse standard (7 derniers jours)

```
/act:evolve
```

### Analyse sans modification

```
/act:evolve --dry-run
```

### Analyse étendue (30 jours)

```
/act:evolve --since=30d --min-confidence=0.4
```

### Debug avec détails

```
/act:evolve --verbose --dry-run
```

## Intégration

### Automatisation suggérée

Exécuter périodiquement (ex: fin de semaine):

```yaml
# Dans les hooks ou via cron
schedule:
  - cron: "0 18 * * 5"  # Vendredi 18h
    command: /act:evolve --dry-run
    notify: true
```

### Avant une session de travail

```
/act:evolve --dry-run --verbose
```

Permet de voir les évolutions potentielles avant de commencer.

## Limites

- Maximum 20 instincts créés par exécution
- Maximum 5 skills modifiés par exécution
- Cooldown de 1h entre exécutions (sauf --force)

## Rollback

Si une évolution est incorrecte:

```bash
# Supprimer un instinct
rm instincts/nom-incorrect.md

# Revert une modification de skill
git checkout skills/nom-skill/SKILL.md

# Ou utiliser le log pour identifier la modification
cat .act/evolution-log.jsonl | tail -1
```

## Voir aussi

- `skills/continuous-learning/SKILL.md` - Skill de pattern detection
- `templates/act/observation.jsonl.md` - Format des observations
- `instincts/README.md` - Documentation des instincts
- `specs/SPEC-continuous-learning.md` - Spécification complète
