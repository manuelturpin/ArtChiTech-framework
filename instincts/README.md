# Instincts

Les instincts sont des **patterns émergents** détectés par le système de continuous learning, mais pas encore suffisamment validés pour devenir des skills établis.

## Concept

```
Observations → Pattern Detection → Instincts → Validation → Skills
     (0.3)         (≥3 occ)         (0.5+)      (user)      (0.7+)
```

Un instinct est une **suggestion** basée sur des patterns observés. Contrairement aux skills qui sont des règles établies, les instincts sont:
- Provisoires
- À confirmer par l'utilisateur
- Susceptibles d'évoluer ou disparaître

## Structure

Chaque instinct est un fichier markdown simple:

```
instincts/
├── README.md
├── prefer-camelcase.md
├── tests-before-commit.md
└── atomic-commits.md
```

## Format d'un instinct

```markdown
# Instinct: [Nom court]

**Confidence:** 0.XX
**Détecté:** YYYY-MM-DD
**Dernière validation:** YYYY-MM-DD
**Occurrences:** N

## Pattern observé

Description du pattern détecté.

## Preuves

- [Date] Evidence 1
- [Date] Evidence 2
- [Date] Evidence 3

## Suggestion

Ce que l'IA devrait faire quand ce pattern est applicable.

## Statut

- [ ] En observation
- [ ] Suggéré à l'utilisateur
- [ ] Validé par l'utilisateur
- [ ] Promu en skill
```

## Cycle de vie

### 1. Création
Un instinct est créé par `/act:evolve` quand:
- Un pattern a ≥3 occurrences
- La confidence moyenne est ≥0.5
- Aucun instinct similaire n'existe déjà

### 2. Suggestion
L'instinct influence le comportement de l'IA:
- Proposé comme suggestion (pas appliqué automatiquement)
- Demande de confirmation implicite ou explicite

### 3. Évolution
- **Validation positive:** +0.1 à +0.2 confidence
- **Validation négative:** -0.2 confidence ou suppression
- **Timeout (30j sans validation):** Décroissance progressive

### 4. Promotion en Skill
Quand confidence ≥0.7 après validation:
- Création d'un skill dans `skills/`
- Suppression de l'instinct
- Application automatique du pattern

### 5. Suppression
Un instinct est supprimé si:
- Confidence tombe sous 0.3
- Contradiction explicite de l'utilisateur
- Inactif pendant 60 jours

## Commandes utiles

```bash
# Lister les instincts actifs
ls instincts/*.md

# Voir un instinct
cat instincts/prefer-camelcase.md

# Supprimer un instinct (l'utilisateur peut toujours)
rm instincts/prefer-camelcase.md

# Forcer l'évolution
/act:evolve --dry-run
```

## Interaction avec les Skills

Les instincts sont le **stade embryonnaire** des skills:

| Aspect | Instinct | Skill |
|--------|----------|-------|
| Confidence | 0.5-0.7 | ≥0.7 |
| Application | Suggestion | Automatique |
| Format | Simple markdown | SKILL.md structuré |
| Durée de vie | Temporaire | Permanent |

## Bonnes pratiques

1. **Ne pas modifier manuellement** les instincts (le système les gère)
2. **Valider ou rejeter** les suggestions pour améliorer l'apprentissage
3. **Supprimer** les instincts incorrects plutôt que les ignorer
4. **Réviser régulièrement** avec `/act:evolve --dry-run`

## Exemple concret

```markdown
# Instinct: Commits atomiques préférés

**Confidence:** 0.62
**Détecté:** 2026-02-01
**Dernière validation:** 2026-02-02
**Occurrences:** 4

## Pattern observé

L'utilisateur tend à demander des commits séparés pour chaque
changement logique plutôt que des commits groupés.

## Preuves

- [2026-02-01] "Sépare ça en deux commits"
- [2026-02-01] Validation d'un commit unique par feature
- [2026-02-02] Correction: commit trop gros splitté
- [2026-02-02] Approbation de commits atomiques

## Suggestion

Lors d'une tâche avec plusieurs changements logiques:
1. Proposer de séparer en commits distincts
2. Demander confirmation du découpage
3. Faire un commit par unité logique

## Statut

- [x] En observation
- [x] Suggéré à l'utilisateur
- [ ] Validé par l'utilisateur
- [ ] Promu en skill
```
