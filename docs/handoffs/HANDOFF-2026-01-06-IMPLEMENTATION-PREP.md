# Handoff Session - 2026-01-06 - Préparation Implémentation

## Résumé de la Session

Session de clarification de l'architecture des commandes ACT :
1. Brainstorming sur la hiérarchie `/projet` vs `/onboard`
2. Validation du design avec `/projet` comme point d'entrée unique
3. Documentation de l'architecture dans tous les fichiers concernés
4. Push sur GitHub

## Décisions Clés

### Architecture des Commandes

```
/projet (Point d'entrée UNIQUE)
    │
    ├─ Nouveau projet (aucun code)
    │       → Guide création (Mode COMPLET)
    │
    ├─ Projet existant non-ACT (code sans .epct/)
    │       → Spawn /onboard automatiquement
    │       → Retour menu après audit
    │
    └─ Projet ACT connu (code + .epct/)
            → Menu normal (6 options)
```

### Les 3 Modes

| Mode | Déclencheur | Description |
|------|-------------|-------------|
| COMPLET | Nouveau projet | 7 phases complètes |
| FEATURE | Feature sur projet existant | Phases adaptées |
| QUICK | Refacto/bugfix | Vérification globale |

## Commits de la Session

1. `e1d08e5` - docs: add commands architecture reference
2. `023d24f` - docs: add auto-detection logic and re-audit option to /projet
3. `14edc02` - docs: clarify /onboard trigger modes
4. `e87efd8` - docs: clarify /projet as single entry point
5. `67473f6` - docs: update README with /projet as entry point

## État Actuel du Framework

### Ce qui est PRÊT (Documentation)

| Composant | Fichier | Status |
|-----------|---------|--------|
| Architecture commandes | `docs/architecture/COMMANDS-ARCHITECTURE.md` | ✅ |
| Spec `/projet` | `plugin/commands/projet.md` | ✅ |
| Spec `/onboard` | `plugin/commands/onboard.md` | ✅ |
| Spec `/status` | `plugin/commands/status.md` | ✅ |
| Spec `/next` | `plugin/commands/next.md` | ✅ |
| Spec `/fix` | `plugin/commands/fix.md` | ✅ |
| Spec `/resume` | `plugin/commands/resume.md` | ✅ |
| Spec `/help` | `plugin/commands/help.md` | ✅ |
| 6 Agents specs | `plugin/agents/*.md` | ✅ |
| 7 Phases refs | `plugin/references/phases/*.md` | ✅ |
| Script détection | `plugin/scripts/detect_stack.py` | ✅ Fonctionnel |

### Ce qui MANQUE (Implémentation)

| Composant | Description | Priorité |
|-----------|-------------|----------|
| Commandes exécutables | Convertir les specs MD en skills Claude Code | P0 |
| Agents exécutables | Convertir les specs MD en skills Claude Code | P0 |
| Gestion état `.epct/` | Créer/lire/écrire state.json | P0 |
| Intégration plugin | Câbler au système de plugins Claude Code | P0 |

---

## Prochaine Session : Implémentation

### Objectif

Rendre le framework **fonctionnel** - pouvoir utiliser `/projet` et `/onboard` réellement.

### Stratégie Recommandée

**Approche incrémentale** : Implémenter commande par commande, en commençant par le flux minimal.

#### Phase 1 : Flux Minimal (MVP)

```
/projet → détection → /onboard (si besoin) → menu
```

**Tâches :**

1. **Implémenter `/projet` (base)**
   - Détection du contexte (detect_stack.py)
   - Vérification `.epct/` existant
   - Affichage menu adaptatif
   - Spawn `/onboard` si nécessaire

2. **Implémenter `/onboard` (base)**
   - Exécution detect_stack.py
   - Diagnostic simple (phase actuelle)
   - Création `.epct/state.json`
   - Affichage rapport

3. **Implémenter gestion état**
   - Structure `.epct/`
   - Lecture/écriture state.json
   - Checkpoints basiques

#### Phase 2 : Commandes Secondaires

4. `/status` - Afficher l'état
5. `/next` - Navigation phases
6. `/help` - Aide contextuelle

#### Phase 3 : Commandes Avancées

7. `/fix` - Gestion erreurs
8. `/resume` - Reprise session

#### Phase 4 : Agents

9. `context-manager`
10. `phase-controller`
11. `chunk-manager`
12. `error-tracker`
13. `projet-orchestrator`
14. `tips-engine`

### Questions à Clarifier

1. **Format des skills** : Les commandes doivent-elles être des fichiers MD (comme actuellement) ou du code TypeScript/Python ?

2. **Stockage état** : `.epct/` dans le projet cible ou dans `~/.claude/` ?

3. **Scope MVP** : Implémenter tout ou seulement `/projet` + `/onboard` d'abord ?

### Estimation

| Phase | Tâches | Effort estimé |
|-------|--------|---------------|
| Phase 1 | /projet + /onboard + état | 1-2 jours |
| Phase 2 | /status + /next + /help | 1 jour |
| Phase 3 | /fix + /resume | 1 jour |
| Phase 4 | 6 agents | 2-3 jours |
| **Total** | | **5-7 jours** |

---

## Fichiers Clés

| Fichier | Rôle |
|---------|------|
| `docs/architecture/COMMANDS-ARCHITECTURE.md` | Architecture de référence |
| `plugin/commands/projet.md` | Spec complète de /projet |
| `plugin/commands/onboard.md` | Spec complète de /onboard |
| `plugin/scripts/detect_stack.py` | Seul code fonctionnel (472 lignes) |
| `.claude/rules/1-framework-overview.md` | Vue d'ensemble framework |

## Commande de Démarrage

```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13

# Lire ce handoff
cat docs/handoffs/HANDOFF-2026-01-06-IMPLEMENTATION-PREP.md

# Commencer par implémenter /projet
```

## Notes

- Le design est **validé et documenté** - pas besoin de re-brainstormer
- `detect_stack.py` est déjà fonctionnel et peut être réutilisé tel quel
- Les specs dans `plugin/commands/*.md` contiennent le pseudo-code et la logique détaillée
- Test app `bonsai-tracker` disponible pour valider l'implémentation
