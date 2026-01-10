# AGENTS.md - Conventions pour Claude et Agents IA

> Ce fichier documente les conventions et règles pour le travail avec des agents IA sur ce repo.

---

## Convention Sandbox

### Contexte

Ce repo est **public**. Tout ce qui est push est visible par tout le monde.

Pour les tests, recherches et expérimentations, utiliser des **branches sandbox** qui :
- Sont temporaires
- Ne sont jamais mergées dans main
- Peuvent être purgées périodiquement
- Peuvent être transférées vers un repo privé pour analyse

### Branches

| Préfixe | Usage | Merge dans main |
|---------|-------|:---------------:|
| `main` | Production | - |
| `feat/*` | Features | ✅ Oui |
| `fix/*` | Corrections | ✅ Oui |
| `sandbox/*` | Tests/Recherches | ❌ Jamais |
| `claude/*` | Tests lancés par Claude | ❌ Jamais |

### Workflow Sandbox

```
1. CRÉER      → git checkout -b sandbox/mon-test
2. TRAVAILLER → commits normaux
3. PUSH       → git push origin sandbox/mon-test
4. ANALYSER   → examiner les résultats
5. ARCHIVER   → exporter si intéressant (vers repo privé)
6. PURGER     → supprimer la branche
```

### Purge d'une branche sandbox

```bash
# Supprimer local + remote
git branch -d sandbox/mon-test
git push origin --delete sandbox/mon-test
```

### Archiver avant purge (optionnel)

```bash
# Exporter les fichiers en zip
git archive sandbox/mon-test --output=archive-mon-test.zip

# Ou copier vers repo privé
# (manuel : copier les fichiers intéressants)
```

### Nommage recommandé

```
sandbox/[sujet]-[date]
sandbox/pocket-watch-2026-01-10
sandbox/test-loop-ralph

claude/test-[sujet]-[id]
claude/test-deepsearch-pocket-watch-P5EDF
```

---

## Convention Mémoire (Loop Ralph)

### Structure fichiers

Quand une boucle Ralph est lancée, les fichiers sont créés dans :

```
.epct/
├── session/     # Données feature courante
│   └── prd.json
├── loop/        # Historique et learnings
│   ├── progress.md
│   ├── patterns.md
│   └── archive/
└── research/    # Résultats de recherche (si applicable)
```

### Learnings permanents

Les patterns découverts pendant une boucle :
1. Sont d'abord stockés dans `.epct/loop/patterns.md`
2. À la fin, les patterns pertinents sont proposés pour AGENTS.md
3. L'utilisateur valide avant ajout

---

## Règles de Synchronisation

### Depuis téléphone (Claude mobile)

- Accès via GitHub uniquement
- Peut créer/modifier des branches
- Les fichiers gitignored ne sont PAS accessibles

### Depuis ordinateur (Claude Code local)

- Accès local + GitHub
- Peut accéder aux fichiers gitignored
- Synchronisation via git push/pull

### Conséquence

Pour que le travail soit synchronisé entre téléphone et ordinateur :
- **Utiliser des branches** (pas des fichiers gitignored)
- Push régulièrement pour synchroniser

---

## Patterns Découverts

_Section pour capitaliser les learnings des boucles._

### Structure commande standard (2026-01-10)
**Source**: feat/ralph-integration

Les commandes ACT suivent un format consistant :
- Frontmatter YAML (description)
- Section Objectif
- Section Usage
- Section Comportement (étapes numérotées)
- Section Output (exemple concret)
- Section Erreurs/Cas particuliers

### Séparation session/loop (2026-01-10)
**Source**: feat/ralph-integration

- `.epct/session/` : Données de la feature courante (prd.json)
- `.epct/loop/` : Historique et learnings (progress.md, patterns.md)
- Permet de reset session sans perdre les patterns

---

*Dernière mise à jour : 2026-01-10*
