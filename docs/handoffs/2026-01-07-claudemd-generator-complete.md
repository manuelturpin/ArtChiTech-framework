# Session Handoff - CLAUDE.md Generator

> Date: 2026-01-07

## Resume

Implementation complete du generateur intelligent CLAUDE.md integre au framework ACT.

## Travail Effectue

### 1. Generateur CLAUDE.md (`plugin/skills/claudemd-generator/`)

- **SKILL.md** : Definition de la skill
- **generate_claudemd.py** : Script Python (~350 lignes)
  - Analyse de complexite (1-10)
  - Selection de strategie (SINGLE/MODULAR/ENHANCE)
  - Generation par type de projet
  - Support CLI avec --dry-run

### 2. Templates

| Fichier | Description |
|---------|-------------|
| `base.md.tmpl` | Structure de base |
| `sections/webapp.md.tmpl` | Performance, accessibilite |
| `sections/api.md.tmpl` | REST, validation, erreurs |
| `sections/cli.md.tmpl` | Exit codes, output |
| `sections/library.md.tmpl` | Exports, versioning |
| `sections/common.md.tmpl` | Conventions generales |
| `rules/behavior.md.tmpl` | Anti-hallucination |
| `rules/conventions.md.tmpl` | Code style |

### 3. Integration `/act-onboard`

- Step 6 ajoute : CLAUDE.md Generation
- Step 7 renomme : Confirmation
- Detection CLAUDE.md existant
- Preview avant generation
- Options : generer / ameliorer / ignorer

## Commits

| SHA | Message |
|-----|---------|
| `9d236e2` | feat(install): add CLAUDE.md setup during installation |
| `de535c4` | feat(claudemd): add intelligent CLAUDE.md generator |

## TODO Prochaine Session

### 1. Tester `/act-onboard` complet

```bash
# Creer un projet test vierge
mkdir ~/Desktop/test-onboard && cd ~/Desktop/test-onboard
npm init -y
mkdir src tests
echo "console.log('Hello');" > src/index.js

# Installer ACT
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash -s -- --project

# Lancer Claude Code
claude

# Tester
/act-onboard
```

### 2. Verifier

- [ ] Detection stack fonctionne
- [ ] Scoring s'affiche
- [ ] Step 6 propose generation CLAUDE.md
- [ ] CLAUDE.md genere est de qualite
- [ ] .epct/state.json cree correctement

### 3. Ameliorations potentielles

- [ ] Ajouter plus de frameworks dans detect_stack.py
- [ ] Templates pour `docs` et `research` types
- [ ] Mode MODULAR : generer aussi .claude/rules/

## Fichiers Cles

| Fichier | Role |
|---------|------|
| `plugin/commands/act-onboard.md` | Commande principale |
| `plugin/skills/claudemd-generator/scripts/generate_claudemd.py` | Generateur |
| `plugin/skills/project-detection/scripts/detect_stack.py` | Detection stack |

## Prompt de Relance

```
Teste la commande /act-onboard complete.

Contexte:
- docs/handoffs/2026-01-07-claudemd-generator-complete.md
- Generateur CLAUDE.md implemente et commit
- Integration dans Step 6 de /act-onboard

TODO:
1. Creer un projet test vierge (Node.js ou Python)
2. Installer ACT en mode project
3. Lancer /act-onboard
4. Verifier que le CLAUDE.md genere est de qualite
5. Reporter les bugs eventuels
```
