# Guide de Test du Framework ACT

> Ce guide explique comment tester le framework ACT après les améliorations "production-ready".

## Quick Start - Tester en 5 minutes

```bash
# 1. Vérifier les dépendances
cd plugin/scripts
./verify_dependencies.sh

# 2. Lancer tous les tests automatisés
cd ../tests
./run_all_tests.sh
```

Si tout passe ✅, le framework est opérationnel.

---

## Tests Détaillés

### 1. Test des Guard-Rails Loop

**Objectif** : Vérifier que le loop refuse de s'exécuter sur des branches protégées.

```bash
# Dans un projet de test
cd test-apps/bonsai-app  # ou tout projet avec git

# Test 1: Sur une branche protégée (devrait échouer)
git checkout main
../../plugin/scripts/loop.sh --target . --stories 1
# Attendu: ERROR - Cannot run loop on protected branch 'main'

# Test 2: Avec --force (devrait passer avec warning)
../../plugin/scripts/loop.sh --target . --stories 1 --force
# Attendu: WARNING mais continue

# Test 3: Sur une feature branch (devrait passer)
git checkout -b test/loop-safety-test
../../plugin/scripts/loop.sh --target . --stories 1
# Attendu: Démarre normalement
```

### 2. Test de la Vérification Build

**Objectif** : Vérifier que le loop vérifie le build après chaque story.

```bash
# Créer un projet avec une erreur de build intentionnelle
mkdir /tmp/test-build-check && cd /tmp/test-build-check
git init

# Créer un package.json avec un script build qui échoue
cat > package.json << 'EOF'
{
  "name": "test-build-check",
  "scripts": {
    "build": "exit 1"
  }
}
EOF

# Créer un PRD minimal
cat > prd.md << 'EOF'
# Test PRD
## Story 1
Add a feature
EOF

# Lancer le loop
/path/to/plugin/scripts/loop.sh --target . --stories 1

# Attendu: Build failed after story - devrait logger l'échec
```

### 3. Test des Agents Refactorisés

**Objectif** : Vérifier que les agents fonctionnent avec les commandes ACT.

```bash
# Dans un projet de test
cd test-apps/bonsai-app

# Initialiser un projet ACT
python3 ../../plugin/skills/state-management/scripts/state_manager.py init \
  --name "test-project" \
  --type "webapp" \
  --stack "react,typescript"

# Vérifier le state
python3 ../../plugin/skills/state-management/scripts/state_manager.py read
# Attendu: JSON avec phase: 1, name: "Discovery"

# Tester transition de phase
python3 ../../plugin/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": 2, "name": "Strategy"}}'

# Vérifier
python3 ../../plugin/skills/state-management/scripts/state_manager.py read
# Attendu: phase.current = 2
```

### 4. Test du Error Tracker

**Objectif** : Vérifier le tracking et la résolution des erreurs.

```bash
# Utiliser le test d'intégration dédié
cd plugin/tests/integration
./test_error_fix_flow.sh

# Ou manuellement:
cd /tmp && mkdir test-errors && cd test-errors

# Init projet
python3 /path/to/plugin/skills/state-management/scripts/state_manager.py init \
  --name "test-errors" --type "webapp" --stack "react"

# Créer structure erreurs
mkdir -p .epct/errors/active .epct/errors/resolved

# Ajouter une erreur
cat > .epct/errors/active/001.json << 'EOF'
{
  "id": "001",
  "type": "type_error",
  "severity": "critical",
  "blocking": true,
  "message": "Test error"
}
EOF

# Mettre à jour state
python3 /path/to/plugin/skills/state-management/scripts/state_manager.py update \
  --updates '{"errors": {"active": 1, "blocking": true}}'

# Vérifier blocage
python3 /path/to/plugin/skills/state-management/scripts/state_manager.py read | grep blocking
# Attendu: "blocking": true
```

### 5. Test des JSON Schemas

**Objectif** : Vérifier que les schemas valident correctement.

```bash
# Installer ajv-cli si nécessaire
npm install -g ajv-cli

# Valider un state valide
cd plugin/references/schemas
ajv validate -s state.schema.json -d /path/to/.epct/state.json
# Attendu: valid

# Tester avec un state invalide
echo '{"invalid": true}' > /tmp/bad-state.json
ajv validate -s state.schema.json -d /tmp/bad-state.json
# Attendu: invalid (missing required fields)
```

---

## Tests avec Claude Code

### Test 1: Commande /act-project

```
# Dans Claude Code, ouvrir un nouveau projet
cd /tmp/test-act && mkdir test-act && cd test-act
git init

# Exécuter
/act-project

# Attendu:
# - Détection "nouveau projet"
# - Menu avec options (Create, Cancel)
# - Si Create: demande nom/type, init state, lance brainstorming
```

### Test 2: Commande /act-status

```
# Dans un projet ACT initialisé
/act-status

# Attendu:
# - Affichage phase actuelle
# - Score de progression
# - Erreurs actives (si présentes)
# - Tip contextuel
```

### Test 3: Commande /act-fix

```
# Avec des erreurs actives
/act-fix

# Attendu:
# - Liste des erreurs prioritisées
# - Détails de l'erreur critique
# - Invocation de systematic-debugging
```

### Test 4: Commande /act-next

```
# Dans un projet en phase 1
/act-next

# Attendu:
# - Checklist de la phase actuelle
# - Go/No-Go status
# - Si OK: transition vers phase 2
# - Si KO: liste des blockers
```

---

## Matrice de Tests

| Test | Commande | Résultat Attendu | ✓/✗ |
|------|----------|------------------|-----|
| Dépendances | `./verify_dependencies.sh` | All dependencies verified | |
| Tests unitaires | `python3 unit/test_*.py` | All passed | |
| Tests intégration | `./integration/*.sh` | All passed | |
| Loop branch guard | `loop.sh` sur main | ERROR | |
| Loop build check | `loop.sh` avec build fail | Build failed logged | |
| State init | `state_manager.py init` | .epct/state.json créé | |
| State update | `state_manager.py update` | State modifié | |
| Checkpoint | `state_manager.py checkpoint` | Fichier créé | |
| Error tracking | Créer erreur + vérifier | blocking: true | |
| Schema validation | `ajv validate` | valid/invalid correct | |

---

## Troubleshooting

### Les tests échouent avec "python3 not found"

```bash
# Vérifier Python
which python3
python3 --version

# Si absent, installer
brew install python3  # macOS
```

### Les tests échouent avec "Permission denied"

```bash
# Rendre les scripts exécutables
chmod +x plugin/scripts/*.sh
chmod +x plugin/tests/**/*.sh
```

### Le loop ne détecte pas la branche

```bash
# Vérifier git
git branch --show-current
# Si vide, vous n'êtes pas dans un repo git
```

### Les schemas ne valident pas

```bash
# Installer ajv-cli
npm install -g ajv-cli

# Ou utiliser Python jsonschema
pip install jsonschema
python3 -c "
import json
from jsonschema import validate
schema = json.load(open('state.schema.json'))
data = json.load(open('.epct/state.json'))
validate(data, schema)
print('Valid!')
"
```

---

## Rapport de Test

Après avoir exécuté les tests, noter les résultats :

```
Date: ___________
Testeur: ___________

Tests automatisés:
- [ ] verify_dependencies.sh : ___
- [ ] run_all_tests.sh : ___ passed, ___ failed

Tests manuels:
- [ ] Loop guard-rails : ___
- [ ] Build verification : ___
- [ ] Claude Code commands : ___

Notes:
_________________________________
_________________________________
```
