# Handoff - Session Skill /onboard

**Date** : 2026-01-05
**Durée** : ~1h
**Statut** : Skill `/onboard` implémenté et prêt à utiliser

---

## Résumé de la Session

### Objectif Initial

Améliorer le Framework Projet Claude Code basé sur la synthèse `FRAMEWORK-SYNTHESIS.md` après le Test #1 (Bonsai Tracker).

### Ce qui a été fait

#### 1. Brainstorming et Design (Skill superpowers:brainstorming)

Questions explorées :
- Quel objectif ? → Framework plus complet + onboarding rapide
- Quel usage ? → Projets web modernes + vision généraliste future (recherche)
- Qu'est-ce qui manque ? → Audit + Diagnostic + Recommandations + Checklist

**Design validé** : Skill `/onboard` en 5 étapes :
1. AUDIT - Analyse automatique du projet
2. BRANDBOOK - Détection/proposition identité visuelle (adaptatif par type)
3. DIAGNOSTIC - Phase actuelle (1-9) + scores par catégorie
4. RECOMMANDATIONS - Priorisées (Critique/Haute/Moyenne/Basse)
5. CHECKLIST - Actions concrètes + intégration TodoWrite

#### 2. Plan d'Implémentation (Skill superpowers:writing-plans)

7 tâches définies avec détails bite-sized :
- Task 1: Structure du skill
- Task 2: SKILL.md principal
- Task 3: Références de scoring
- Task 4: Références de recommandations + templates
- Task 5: Script de détection de stack
- Task 6: Tests sur projets exemples
- Task 7: Finalisation

#### 3. Exécution (Skill superpowers:subagent-driven-development)

Toutes les tâches complétées via subagents :

| Tâche | Statut | Output |
|-------|--------|--------|
| Structure | ✅ | Dossiers créés |
| SKILL.md | ✅ | 225 lignes |
| scoring-criteria.md | ✅ | 269 lignes |
| recommendations-by-type.md | ✅ | 262 lignes |
| report-templates.md | ✅ | 597 lignes |
| detect_stack.py | ✅ | 472 lignes, testé |
| Finalisation | ✅ | Skill actif |

### Fichiers Créés

```
~/.claude/skills/onboard/           # SKILL INSTALLÉ
├── SKILL.md                        # Instructions principales (225 lignes)
├── references/
│   ├── scoring-criteria.md         # Critères détaillés (269 lignes)
│   ├── recommendations-by-type.md  # Par type de projet (262 lignes)
│   └── report-templates.md         # Templates rapports (597 lignes)
└── scripts/
    └── detect_stack.py             # Détection auto (472 lignes)

lab-13/docs/plans/                  # DOCUMENTATION
├── 2026-01-05-onboard-skill-design.md   # Design validé
└── 2026-01-05-onboard-skill-plan.md     # Plan d'implémentation
```

### Tests Effectués

| Projet | Type détecté | Stack |
|--------|--------------|-------|
| lab-13 (Bonsai Tracker) | api | typescript/express/sqlite |
| VPS-b974.fr | webapp | javascript/node |

---

## Comment Utiliser le Skill

Le skill `/onboard` est maintenant actif. Pour l'invoquer :

```
/onboard
```

Ou phrases naturelles :
- "audit mon projet"
- "analyse ce projet"
- "où en est mon projet"
- "que dois-je améliorer"

Le skill va :
1. Analyser la structure et stack du projet
2. Détecter/proposer l'identité visuelle (si webapp)
3. Évaluer la phase actuelle (1-9)
4. Scorer chaque catégorie (0-100)
5. Générer des recommandations priorisées
6. Créer une checklist actionnable

---

## Prochaines Étapes Possibles

### Priorité Haute

| Action | Description |
|--------|-------------|
| **Tester /onboard sur B974** | Valider le skill sur un vrai projet en production |
| **Créer skill /create-brandbook** | Compléter le flux quand aucun brandbook n'existe |
| **Améliorer detect_stack.py** | Détecter Next.js et autres frameworks spécifiques |

### Priorité Moyenne

| Action | Description |
|--------|-------------|
| **Mode recherche** | Ajouter un profil "research" au diagnostic |
| **Intégration GitHub Issues** | Créer des issues depuis les recommandations |
| **Dashboard HTML** | Générer un rapport visuel interactif |

### Priorité Basse

| Action | Description |
|--------|-------------|
| **Support multi-langage** | Python, Go, Rust (actuellement focus JS/TS) |
| **Historique des audits** | Comparer les évolutions entre sessions |
| **CLI autonome** | Script standalone sans Claude Code |

---

## Notes Importantes

### Vision Généraliste

Le framework doit rester généraliste :
- **Actuellement** : Optimisé pour projets web/applications modernes
- **Future** : Extensible vers recherche, documentation, autres domaines
- Le skill `/onboard` a été conçu avec cette flexibilité en tête (types: webapp, api, cli, library, docs, research)

### Brandbook Adaptatif

Comportement selon le type de projet :
- **webapp/mobile** → Brandbook complet requis
- **docs/research** → Charte légère optionnelle
- **api/cli/library** → Ignoré automatiquement

### Fichiers de Référence

Les critères de scoring et recommandations sont dans des fichiers séparés pour :
1. Garder SKILL.md léger (<500 lignes)
2. Permettre des mises à jour indépendantes
3. Faciliter l'ajout de nouveaux types de projets

---

## Commandes Utiles

```bash
# Voir la structure du skill
ls -laR ~/.claude/skills/onboard/

# Tester la détection de stack
python3 ~/.claude/skills/onboard/scripts/detect_stack.py /chemin/vers/projet

# Lire le SKILL.md
cat ~/.claude/skills/onboard/SKILL.md
```

---

## Contexte pour Prochaine Session

Pour reprendre :
1. Lire ce fichier : `docs/HANDOFF-SKILL-ONBOARD.md`
2. Tester `/onboard` sur le projet B974 (`/Users/manuelturpin/Desktop/bonsai974/VPS-b974.fr`)
3. Décider des prochaines améliorations selon les résultats

Le skill existant `b974-brand-guidelines` dans `~/.claude/skills/` devrait être détecté automatiquement lors de l'onboarding de B974.

---

**Généré le** : 2026-01-05
**Skill créé** : `/onboard` v1.0
**Lignes totales** : 1825
