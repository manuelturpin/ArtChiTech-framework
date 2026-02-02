# SPEC: Model Selection

**Version:** 2.5.0-alpha.7
**Status:** Draft → Implementing
**Source:** Everything CC, GSD
**Phase:** 3.7

---

## Objectif

Optimiser le ratio coût/qualité en sélectionnant automatiquement le modèle approprié selon la tâche via des agents spécialisés.

---

## Problème

Utiliser Opus pour tout = coût excessif pour tâches simples.
Utiliser Haiku pour tout = qualité insuffisante pour tâches complexes.

**Solution :** Model Selection par agent spécialisé.

---

## Stratégie de Sélection

### Par Complexité de Tâche

| Model | Cas d'usage | Caractéristiques | Coût |
|-------|-------------|------------------|------|
| **Opus** | Décisions architecturales, planning, review | Raisonnement profond, autonomie | $$$ |
| **Sonnet** | Exécution, implémentation | Suit instructions explicites, fiable | $$ |
| **Haiku** | Tâches simples, lecture seule, mapping | Rapide, économique | $ |

### Principe Directeur

```
Opus = PENSE et DÉCIDE
Sonnet = EXÉCUTE
Haiku = LIT et DOCUMENTE
```

---

## Agents de Base

### Architecture

```
agents/
├── planner.md      # opus - Planification de phase, architecture
├── architect.md    # opus - Design système, décisions techniques
├── executor.md     # sonnet - Implémentation, code production
├── reviewer.md     # opus - Code review, validation qualité
├── tester.md       # sonnet - Écriture et exécution des tests
└── documenter.md   # haiku - Documentation, mise à jour fichiers
```

### Mapping Agent → Model

| Agent | Model | Rôle Principal | Quand l'utiliser |
|-------|-------|----------------|------------------|
| `planner` | opus | Planification, décomposition | Début de phase, nouvelles features |
| `architect` | opus | Design système, patterns | Décisions architecturales |
| `executor` | sonnet | Implémentation | Écriture de code production |
| `reviewer` | opus | Code review | Avant merge, validation qualité |
| `tester` | sonnet | Tests | TDD, couverture |
| `documenter` | haiku | Documentation | READMEs, commentaires, specs |

---

## Configuration

### Schema config.yaml

```yaml
models:
  default: sonnet        # Modèle par défaut si pas d'agent spécifié
  
  agents:
    planner: opus        # Planification, architecture
    architect: opus      # Design système
    executor: sonnet     # Implémentation
    reviewer: opus       # Code review
    tester: sonnet       # Tests
    documenter: haiku    # Documentation
```

### Extension possible

```yaml
models:
  default: sonnet
  
  # Override par type de tâche
  tasks:
    planning: opus
    implementation: sonnet
    documentation: haiku
    debugging: opus      # Root cause = complexe
    refactoring: sonnet
    
  agents:
    # ... (comme ci-dessus)
```

---

## Format Agent

Chaque agent suit le template :

```markdown
# Agent: {name}

**Model:** {opus|sonnet|haiku}
**Role:** {description courte}

## Responsabilités
- {responsabilité 1}
- {responsabilité 2}
...

## Inputs
- {ce dont l'agent a besoin}

## Outputs
- {ce que l'agent produit}

## Règles
- {règle 1}
- {règle 2}

## Workflow
1. {étape 1}
2. {étape 2}
...
```

---

## Intégration avec ACT

### Hooks + Model Selection

```
PreToolUse hook
    ├── Détecte type d'action
    ├── Sélectionne agent approprié
    └── Applique le modèle de l'agent
```

### Scale-Adaptive + Model Selection

| Mode | Agents actifs |
|------|---------------|
| Quick | executor, tester |
| Full | Tous les 6 agents |

### Deviation Rules + Model Selection

- **Rule 1-3 (auto-fix):** `executor` (sonnet)
- **Rule 4 (architectural):** `architect` (opus) + human
- **Rule 5 (logging):** `documenter` (haiku)

---

## Workflow Typique

### Feature Development (Full Mode)

```
1. /act:full "New feature X"
   └── planner (opus) → Crée le plan

2. Phase Design
   └── architect (opus) → Design système

3. Phase Implementation
   └── executor (sonnet) → Code production

4. Phase Testing
   └── tester (sonnet) → Tests

5. Phase Review
   └── reviewer (opus) → Validation

6. Phase Documentation
   └── documenter (haiku) → Docs
```

### Bug Fix (Quick Mode)

```
1. /act:quick "Fix bug Y"
   └── executor (sonnet) → Plan + Fix

2. Test
   └── tester (sonnet) → Verify fix

3. Done
   └── documenter (haiku) → Update changelog
```

---

## Anti-Patterns

### ❌ À éviter

| Anti-Pattern | Problème |
|--------------|----------|
| Opus pour tout | Coût excessif |
| Haiku pour architecture | Qualité insuffisante |
| Changer de modèle mid-task | Perte de contexte |
| Ignorer les agents | Revenir au chaos |

### ✅ Bonnes pratiques

| Pratique | Bénéfice |
|----------|----------|
| Un agent = une responsabilité | Clarté |
| Respecter le mapping | Coût optimisé |
| Transitions explicites | Traçabilité |
| Logging par agent | Debugging facilité |

---

## Métriques

### Coût estimé par session

| Mode | Distribution | Coût relatif |
|------|--------------|--------------|
| Quick | 80% sonnet, 10% haiku, 10% opus | $ |
| Full | 50% sonnet, 30% opus, 20% haiku | $$ |
| Opus-only | 100% opus | $$$$$ |

### ROI attendu

- **Coût:** -40% vs Opus-only
- **Qualité:** Maintenue (opus sur décisions critiques)
- **Vitesse:** +20% (haiku pour tâches simples)

---

## Checklist Implémentation

- [x] Spécification (ce fichier)
- [x] Config models section
- [x] Agent: planner.md
- [x] Agent: architect.md
- [x] Agent: executor.md
- [x] Agent: reviewer.md
- [x] Agent: tester.md
- [x] Agent: documenter.md
- [x] Documentation README
- [x] Integration CLAUDE.md

---

## Références

- **Everything CC:** Model selection strategy
- **GSD:** Agent specialization
- **SYNTHESIS.md:** Section "Model Selection"

---

*Spec créée: 2026-02-02*
*ACT v2.5 Phase 3.7*
