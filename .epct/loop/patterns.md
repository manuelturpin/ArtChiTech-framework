# Patterns - Feature Ralph Integration

> Patterns reusables decouverts pendant cette feature.
> A la fin, proposer curation vers AGENTS.md.

---

## Patterns

### 1. Structure Commande Standard
Les commandes ACT suivent un format consistant :
- Frontmatter YAML (description)
- Section Objectif
- Section Usage
- Section Comportement (etapes numerotees)
- Section Output (exemple concret)
- Section Erreurs/Cas particuliers

### 2. Separation Session vs Loop
- `.epct/session/` : Donnees de la feature courante (prd.json)
- `.epct/loop/` : Historique et learnings (progress.md, patterns.md)
- Cela permet de reset session sans perdre les patterns

### 3. Signal de Completion XML
Format `<signal>COMPLETE</signal>` permet detection facile via grep.
Plus robuste que texte libre.

---

## Points d'Attention

### 1. AGENTS.md vs CLAUDE.md
Pour cette implementation, AGENTS.md est utilise pour isoler les learnings Ralph.
A evaluer : merge eventuel avec CLAUDE.md ou garder separe.

### 2. Gestion des Stories Skipped
Le mecanisme de skip apres 2 echecs evite les boucles infinies.
Mais attention a ne pas skip trop facilement - verifier la raison de l'echec.

---

## Decisions Techniques

| Decision | Choix | Raison |
|----------|-------|--------|
| Format PRD | JSON | Compatible avec jq, facile a parser |
| Signal completion | XML tag | Detection fiable via grep |
| Archive | Par date + branche | Tracabilite complete |
| Curation | Interactive | Controle qualite humain |

