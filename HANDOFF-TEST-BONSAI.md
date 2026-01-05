# Handoff : Test Framework sur App Bonsaï

## Contexte

Le **Framework Projet Claude Code v1.0** a été implémenté avec succès :
- 6 commandes : `/projet`, `/resume`, `/status`, `/fix`, `/next`, `/help`
- 6 skills : context-manager, chunk-manager, error-tracker, phase-controller, projet-orchestrator, tips-engine
- 7 phases documentées : Discovery → Croissance
- Tests de validation : `make test`

## Prochaine étape : Tester le framework

Un worktree propre a été créé pour tester le framework sur un vrai projet :

```
lab/
├── lab-13/                  ← Framework source (ne pas modifier)
└── lab-13-test-bonsai/      ← Test : App de suivi de bonsaïs
```

## Prompt pour nouvelle session

```
Je veux tester le Framework Projet Claude Code sur une app de suivi de bonsaïs.

**Worktree :** /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13-test-bonsai
**Branche :** test/bonsai-app
**État :** Installation propre du framework, projet vierge

**Objectif :**
1. Simuler le flow complet du framework (7 phases)
2. Tester les 6 commandes (/projet, /resume, /status, /fix, /next, /help)
3. Identifier les ajustements nécessaires
4. Documenter les problèmes dans lab-13 original

**App Bonsaï - Scope suggéré :**
- Suivi de collection de bonsaïs
- Historique soins (arrosage, taille, rempotage)
- Photos évolution
- Rappels d'entretien
- Stack : à définir en Phase 3

**Commencer par :** Simuler /projet → choix "Démarrer un nouveau projet"

**Tracking :** Les ajustements au framework seront notés dans lab-13/FEEDBACK-TEST.md
```

## Structure worktree test (propre)

```
lab-13-test-bonsai/
├── .epct/              ← État vierge
├── src/
│   ├── skills/         ← 6 skills
│   ├── cli/            ← 6 commandes
│   └── reference/      ← 7 phases docs
├── README.md
├── docs/installation.md
├── Makefile
└── tests/
```

## Commandes git

```bash
# Voir les worktrees
git worktree list

# Aller au test
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13-test-bonsai

# Vérifier branche
git branch
```
