# Session Handoff - Install.sh Fix Pending

> Date: 2026-01-06

## Contexte

Bug identifié sur `install.sh` : l'installation en mode `--project` ne fonctionnait pas correctement car le script utilisait le mauvais répertoire.

## Ce qui a été fait

### Script install.sh corrigé (NON COMMITÉ)

Le fichier `scripts/install.sh` a été modifié pour :

1. **Utiliser `$PWD`** (où l'utilisateur se trouve) au lieu du dossier du script
2. **Accepter un chemin optionnel** : `--project [PATH]`
3. **Détecter si dans le repo ACT** et avertir l'utilisateur
4. **Afficher le vrai chemin** dans le menu

### Flow correct maintenant

```bash
# Être dans son projet
cd ~/mon-projet/

# Cloner ACT
git clone https://github.com/manuelturpin/ArtChiTech-framework.git

# Installer DEPUIS son projet (pas depuis le repo ACT!)
./ArtChiTech-framework/scripts/install.sh --project
```

## TODO pour la prochaine session

### 1. Mettre à jour les READMEs

Fichiers à modifier :
- `README.md` (partiellement fait)
- `plugin/README.md`
- `docs/starter-project/README.md`

### 2. Tester le flow complet

```bash
# Créer un dossier test propre
mkdir ~/Desktop/test-act-install
cd ~/Desktop/test-act-install

# Cloner
git clone https://github.com/manuelturpin/ArtChiTech-framework.git

# Installer en mode project
./ArtChiTech-framework/scripts/install.sh --project

# Vérifier
ls -la .claude/plugins/act/

# Tester dans Claude Code
claude
/projet
```

### 3. Commit et push

```bash
git add scripts/install.sh README.md plugin/README.md docs/starter-project/README.md
git commit -m "fix(install): use PWD for --project mode installation"
git push
```

### 4. Fermer l'issue #1

L'issue GitHub #1 (symlink bug) devrait être résolue par ce fix.

## Fichiers modifiés (non commités)

- `scripts/install.sh` - Script d'installation corrigé
- `README.md` - Section installation mise à jour (partiellement)
- `docs/starter-project/README.md` - Tutoriel mis à jour (session précédente)

## Prompt de relance

```
Reprends le fix du script install.sh.

Contexte:
- docs/handoffs/2026-01-06-install-fix-pending.md
- Le script install.sh a été corrigé mais pas commité
- Les READMEs doivent être mis à jour (plugin/README.md notamment)

TODO:
1. Mettre à jour plugin/README.md avec le bon flow d'installation
2. Tester le flow complet dans un dossier isolé
3. Commit et push
4. Fermer l'issue #1 sur GitHub
```
