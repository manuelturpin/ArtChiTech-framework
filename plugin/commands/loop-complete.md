---
description: Termine une boucle et propose la curation des learnings vers AGENTS.md
---

# /loop-complete

## Objectif

Finaliser une feature apres completion de la boucle : curer les learnings vers AGENTS.md et archiver la session.

## Usage

```
/loop-complete
```

## Prerequis

- Toutes stories de `.act/session/prd.json` ont `passes: true`
- Ou l'utilisateur decide de terminer manuellement

## Comportement

### 1. Verifier Completion

```bash
PENDING=$(jq '[.userStories[] | select(.passes == false)] | length' .act/session/prd.json)
if [ "$PENDING" -gt 0 ]; then
  echo "⚠️ $PENDING stories encore pending. Voulez-vous terminer quand meme? [y/n]"
fi
```

### 2. Lire les Patterns

Analyser `.act/logs/patterns.md` et extraire les patterns generaux.

### 3. Proposer Curation

Afficher :
```
=== Curation des Learnings ===

Patterns decouverts dans cette feature:

1. [Pattern 1]
   → Pertinent pour AGENTS.md? [y/n/edit]

2. [Pattern 2]
   → Pertinent pour AGENTS.md? [y/n/edit]

Points d'attention:
- [Point 1] → Ajouter a AGENTS.md? [y/n]
```

### 4. Mettre a Jour AGENTS.md

Pour chaque pattern valide par l'utilisateur :
- Ajouter a la section appropriee de AGENTS.md
- Format standardise avec date et feature source

```markdown
## Pattern: [Nom]

**Source**: Feature [branch] - [date]
**Description**: [description]
**Exemple**: [exemple si applicable]
```

### 5. Archiver la Session

```bash
ARCHIVE_DIR=".act/logs/archive/$(date +%Y-%m-%d)-$(basename $BRANCH)"
mkdir -p "$ARCHIVE_DIR"
mv .act/session/prd.json "$ARCHIVE_DIR/"
mv .act/logs/progress.md "$ARCHIVE_DIR/"
mv .act/logs/patterns.md "$ARCHIVE_DIR/"
```

### 6. Reset pour Prochaine Feature

```bash
# Garder la structure, vider le contenu
echo "# Loop Progress" > .act/logs/progress.md
echo "# Patterns" > .act/logs/patterns.md
rm -f .act/session/prd.json
```

## Output Final

```
=== Feature Complete ===

Branch: feat/ralph-integration
Stories: 7/7 passed
Duration: 2h30

Learnings curated: 3 patterns added to AGENTS.md
Archive: .act/logs/archive/2026-01-10-ralph-integration/

Ready for next feature!
```

## Note Importante

**AGENTS.md est utilise a la place de CLAUDE.md** pour cette implementation.
Cela permet d'isoler les learnings de la boucle autonome.

A terme, evaluer si les patterns devraient aller dans CLAUDE.md ou rester dans AGENTS.md.
