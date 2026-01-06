---
name: onboard
description: Auditer un projet existant et l'initialiser dans le framework ACT
---

# /onboard - Audit de Projet

Tu audites le projet courant et l'initialises dans ACT.

## Étape 1: DÉTECTION

Exécute le script de détection de stack :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/project-detection/scripts/detect_stack.py
```

Capture et analyse le résultat JSON contenant :
- `stack` : Technologies détectées
- `type` : Type de projet (webapp, api, cli, library)
- `structure` : Analyse des dossiers

## Étape 2: SCORING

Utilise le skill `phase-scoring` pour évaluer le projet.

Pour chaque phase (1-7), vérifie les critères selon `references/scoring-rules.md` :

1. **Discovery** : README, problème défini, users
2. **Stratégie** : Roadmap, business model
3. **Conception** : Architecture, specs
4. **Développement** : Code, tests, CI
5. **Qualité** : Coverage, bugs
6. **Lancement** : Deploy, monitoring
7. **Croissance** : Analytics, feedback

Calcule un score 0-100 par phase.
La phase actuelle = première phase avec score < 70%.

## Étape 3: RAPPORT

Affiche le rapport visuel :

```
╭───────────────────────────────────────────────────────────────╮
│  📊 Audit ACT : [nom-projet]                                  │
│                                                               │
│  Stack détectée : [technologies]                              │
│  Type : [type]                                                │
│                                                               │
│  ═══════════════════════════════════════════════════════════  │
│                                                               │
│  Phases                              Score                    │
│  ───────────────────────────────────────────                  │
│  ✅ 1. Discovery                     [██████████] 85%         │
│  ✅ 2. Stratégie                     [███████░░░] 70%         │
│  ✅ 3. Conception                    [█████████░] 90%         │
│  🔄 4. Développement                 [████░░░░░░] 45%  ←      │
│  ⬚ 5. Qualité                       [░░░░░░░░░░] 0%          │
│  ⬚ 6. Lancement                     [░░░░░░░░░░] 0%          │
│  ⬚ 7. Croissance                    [░░░░░░░░░░] 0%          │
│                                                               │
│  Score global : 42%                                           │
│  Phase actuelle : Développement (4/7)                         │
╰───────────────────────────────────────────────────────────────╯
```

## Étape 4: RECOMMANDATIONS

Génère les 3 recommandations prioritaires :

```
📋 Actions Recommandées :

1. 🔴 [Haute] Augmenter la couverture de tests
   → Actuellement ~30%, objectif 60%

2. 🟡 [Moyenne] Configurer CI/CD
   → Ajouter GitHub Actions pour tests auto

3. 🟢 [Basse] Documenter les API
   → Ajouter OpenAPI specs
```

## Étape 5: INITIALISATION

Crée ou met à jour `.epct/state.json` :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py init \
  --name "[nom-projet]" \
  --type "[type]" \
  --stack "[stack-comma-separated]"
```

Puis met à jour avec les scores :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [phase], "name": "[phase-name]"}, "scores": {...}}'
```

## Étape 6: CONFIRMATION

Affiche :
```
✅ Projet initialisé dans ACT !

📁 État sauvegardé dans .epct/state.json
🎯 Phase actuelle : [phase-name]
💡 Prochaine action : [première recommandation]

Tapez /projet pour accéder au menu principal.
```
