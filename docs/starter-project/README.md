# ACT - Test Manuel

> Guide pas-à-pas pour tester ACT Framework de zéro.

## Prérequis

Avant de commencer, vérifie que tu as :

- [ ] Claude Code installé (v2.7+ recommandé pour les skills natives)
- [ ] Python 3.8+
- [ ] Git

> **Note :** ACT v2.7+ utilise les skills natives de Claude Code. Aucune dépendance externe n'est requise.

## Étape 1 : Créer le projet test

```bash
# Depuis n'importe où sur ta machine
cd ~/Desktop  # ou autre dossier de ton choix

# Lancer le setup
bash /chemin/vers/ArtChiTech-framework/docs/starter-project/setup.sh
```

Ou manuellement :

```bash
mkdir mon-projet-test
cd mon-projet-test
npm init -y
mkdir src tests
echo "console.log('Hello ACT');" > src/main.js
```

## Étape 2 : Installer ACT

```bash
# Depuis le dossier de ton projet test
cd ~/Desktop/mon-projet-test

# One-liner
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash

# Choisir :
# 1. Global → pour tous tes projets
# 2. Project → pour ce projet uniquement
```

## Étape 3 : Ouvrir Claude Code

```bash
cd ~/Desktop/mon-projet-test  # ou starter-webapp si tu as utilisé setup.sh
claude
```

## Étape 4 : Tester les commandes

### Test 1 : `/act-project`

```
/act-project
```

**Résultat attendu :**
- ACT détecte un nouveau projet
- Propose de démarrer avec la Phase 1 : Discovery
- Demande le nom du projet

### Test 2 : `/act-status`

```
/act-status
```

**Résultat attendu :**
- Affiche Phase 1/7
- Scores à 0%
- Liste des critères Go/No-Go

### Test 3 : `/act-onboard`

```
/act-onboard
```

**Résultat attendu :**
- Audit du projet
- Création du dossier `.act/`
- Détection de la stack (Node.js, etc.)

### Test 4 : `/act-next`

```
/act-next
```

**Résultat attendu :**
- Affiche les critères pour passer à la Phase 2
- Guide vers l'étape suivante

### Test 5 : `/act-help`

```
/act-help
```

**Résultat attendu :**
- Aide contextuelle selon la phase actuelle

### Test 6 : `/act-feedback`

```
/act-feedback
```

**Résultat attendu :**
- Formulaire pour signaler un bug ou suggestion
- Crée une issue GitHub automatiquement

## Checklist de validation

| Commande | Fonctionne | Notes |
|----------|:----------:|-------|
| `/act-project` | [ ] | |
| `/act-status` | [ ] | |
| `/act-onboard` | [ ] | |
| `/act-next` | [ ] | |
| `/act-help` | [ ] | |
| `/act-feedback` | [ ] | |
| `/act-resume` | [ ] | |
| `/act-fix` | [ ] | |

## En cas de problème

1. **Commande non reconnue** → Redémarre Claude Code
2. **Skills non détectées** → Vérifie que Claude Code est v2.7+ (`claude --version`)
3. **Erreur Python** → Vérifie `python3 --version`

Pour signaler un bug :
```
/act-feedback
```

Ou ouvre une issue sur [GitHub](https://github.com/manuelturpin/ArtChiTech-framework/issues).

---

**Bon test !**
