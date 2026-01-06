# ACT Framework - Claude Code Memory

> **lab-13 = Atelier de développement du plugin ACT (ArtChiTech)**
>
> Ce dossier contient le code source du framework ACT, un plugin Claude Code pour la gestion de projets.

## Contexte Projet

- **Nom** : ACT (ArtChiTech)
- **Type** : Plugin Claude Code standalone
- **Objectif** : Framework de suivi et réalisation de projets (7 phases : Discovery → Croissance)
- **Auteur** : Manuel Turpin (Bonsai974)

## Architecture

```
lab-13/
├── CLAUDE.md            # Instructions pour Claude
├── README.md            # Documentation du plugin
├── plugin/              # Source du plugin ACT (à distribuer)
│   ├── .claude-plugin/  # Configuration plugin
│   ├── commands/        # Commandes slash (/onboard, /projet, /status...)
│   ├── agents/          # Agents spécialisés (context-manager, chunk-manager...)
│   ├── references/      # Documentation de référence (phases, scoring, templates)
│   └── scripts/         # Scripts utilitaires (detect_stack.py)
├── test-apps/           # Applications de test
│   └── bonsai-tracker/  # Test #1 : SaaS B2B traçabilité bonsaïs
│       ├── api/         # API Express
│       ├── db/          # SQLite database
│       ├── services/    # Business logic
│       ├── tests/       # Tests unitaires et E2E
│       └── ...          # Config (package.json, Dockerfile, etc.)
├── docs/                # Documentation développement
│   ├── sources/         # Fichiers sources originaux (recherche, extractions)
│   ├── plans/           # Plans d'implémentation
│   ├── handoffs/        # Handoffs de sessions
│   └── architecture/    # Documentation architecture
└── scripts/             # Scripts de build/installation
```

## Fichiers Clés

- @plugin/.claude-plugin/plugin.json - Configuration du plugin
- @docs/sources/FRAMEWORK-SYNTHESIS.md - Synthèse complète du framework
- @docs/sources/recherche/ - Rapports de recherche originaux (7 phases)
- @docs/sources/extractions/ - Extractions condensées des phases
- @README.md - Documentation du plugin

## Conventions

### Code

- **Langages** : TypeScript, Python, Markdown
- **Indentation** : 2 espaces
- **Nommage fichiers** : kebab-case (`chunk-manager.md`)
- **Nommage variables** : camelCase

### Git

- **Commits** : Conventional commits (`feat:`, `fix:`, `docs:`, `refactor:`)
- **Branches** : `feature/description`, `fix/description`
- **Message format** : `type: description courte`

### Documentation

- **Skills/Agents** : Format YAML frontmatter + Markdown
- **Commandes** : Format `---\ndescription: ...\n---`

## Commandes Fréquentes

```bash
# Installation locale du plugin
./scripts/install-local.sh

# Tester le plugin
cd test-apps/bonsai-tracker && /onboard

# Lancer les tests de l'app test
cd test-apps/bonsai-tracker && npm test
```

## Workflow de Développement

1. **Modifier** le plugin dans `plugin/`
2. **Tester** sur `test-apps/bonsai-tracker/`
3. **Documenter** les changements dans `docs/`
4. **Commit** avec message conventionnel
5. **Mettre à jour** README.md si nécessaire

## Les 7 Phases du Framework

| Phase | Nom | Objectif |
|-------|-----|----------|
| 1 | Discovery | Valider le problème et les besoins |
| 2 | Stratégie | Définir roadmap et business model |
| 3 | Conception | Designer architecture et UX |
| 4 | Développement | Implémenter avec TDD |
| 5 | Qualité | Tester et valider |
| 6 | Lancement | Déployer et acquérir |
| 7 | Croissance | Itérer et optimiser |

## Les 3 Modes d'Utilisation

| Mode | Quand l'utiliser | Durée |
|------|------------------|-------|
| **COMPLET** | Nouveau projet/SaaS | Semaines/mois |
| **FEATURE** | Nouvelle fonctionnalité | Jours |
| **QUICK** | Petite modification | Heures |

## Commandes du Plugin ACT

| Commande | Description |
|----------|-------------|
| `/onboard` | Auditer un projet existant et générer diagnostic |
| `/projet` | Hub principal interactif |
| `/resume` | Reprendre session précédente |
| `/status` | État et progression du projet |
| `/fix` | Corriger erreur prioritaire |
| `/next` | Passer à l'étape suivante |
| `/help` | Aide contextuelle |

## Tests

- **Framework** : Vitest (unitaires)
- **E2E** : Playwright
- **Emplacement** : `test-apps/bonsai-tracker/tests/`
- **Lancer** : `cd test-apps/bonsai-tracker && npm test`

## Troubleshooting

### Plugin non reconnu

```bash
# Vérifier l'installation
ls ~/.claude/plugins/cache/
# Réinstaller
./scripts/install-local.sh
```

### Commande /onboard non trouvée

1. Vérifier que le plugin est installé
2. Redémarrer Claude Code
3. Vérifier `plugin/.claude-plugin/plugin.json`

---

**Dernière mise à jour** : 2026-01-06
**Version** : 1.0.0
