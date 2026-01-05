# Installation Framework Projet

## Prérequis

- Claude Code installé
- Git
- Superpowers plugin activé

## Installation

### 1. Copier le framework dans votre projet

```bash
# Depuis votre projet
mkdir -p .claude/framework
cp -r /path/to/framework/src .claude/framework/
cp -r /path/to/framework/.epct .epct-template
```

### 2. Initialiser l'état

```bash
mkdir -p .epct
cp .epct-template/* .epct/
```

### 3. Configurer claude.md

Ajouter dans votre `claude.md` ou `.claude/claude.md` :

```markdown
## Framework Projet Actif

Ce projet utilise le framework de gestion de projet.

### Commandes disponibles
- /projet : Hub principal
- /resume : Reprendre session
- /status : État actuel
- /fix : Corriger erreur
- /next : Étape suivante
- /help : Aide contextuelle

### Skills framework
- Located in: .claude/framework/src/skills/
- Auto-activated selon phase
```

### 4. Premier lancement

```bash
# Dans Claude Code
/projet
# Choisir "Démarrer un nouveau projet"
```

## Structure Ajoutée

```
votre-projet/
├── .claude/
│   └── framework/
│       └── src/
│           ├── skills/
│           │   ├── context-manager.md
│           │   ├── chunk-manager.md
│           │   ├── error-tracker.md
│           │   ├── phase-controller.md
│           │   ├── projet-orchestrator.md
│           │   └── tips-engine.md
│           ├── cli/
│           │   ├── projet.md
│           │   ├── resume.md
│           │   ├── status.md
│           │   ├── fix.md
│           │   ├── next.md
│           │   └── help.md
│           └── reference/
│               └── phases/
│                   ├── 1-discovery.md
│                   ├── 2-strategie.md
│                   ├── ...
│                   └── 7-croissance.md
├── .epct/
│   ├── state.json
│   ├── implementation-state.json
│   ├── checkpoints/
│   ├── errors/
│   │   ├── active/
│   │   └── resolved/
│   ├── session/
│   │   ├── current.json
│   │   └── recovery.json
│   ├── history/
│   └── context/
└── claude.md (modifié)
```

## Utilisation Quotidienne

1. **Démarrer** : `/projet`
2. **Reprendre session** : `/resume`
3. **Voir progression** : `/status`
4. **Corriger erreurs** : `/fix`
5. **Avancer** : `/next`
6. **Aide** : `/help`

## Troubleshooting

### "Commande /projet non trouvée"

Vérifier que `.claude/framework/src/cli/projet.md` existe et que claude.md référence le framework.

### "Erreur state.json"

Réinitialiser :
```bash
cp .epct-template/state.json .epct/state.json
```

### "Skills non activés"

1. Vérifier Superpowers plugin installé
2. Vérifier que les skills sont dans le bon dossier
3. Redémarrer Claude Code

### "Contexte perdu entre sessions"

1. Toujours utiliser `/status` avant de quitter (crée checkpoint)
2. Utiliser `/resume` au démarrage
3. Vérifier que `.epct/` n'est pas dans `.gitignore`

## Mise à jour

Pour mettre à jour le framework :

```bash
# Sauvegarder état actuel
cp -r .epct .epct-backup

# Mettre à jour les fichiers
cp -r /path/to/new-framework/src .claude/framework/

# Garder votre état
# (Ne pas écraser .epct/)
```
