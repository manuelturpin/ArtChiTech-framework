# Test 7 — Model Selection

**Date:** 2025-06-03
**Statut:** ✅ PASS

---

## 7.1 Configuration Models

**Fichier:** `.act/config.yaml`

### Section Models

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

### Les 6 Agents Configurés

| Agent | Modèle | Rôle |
|-------|--------|------|
| `planner` | **opus** | Planification, architecture |
| `architect` | **opus** | Design système |
| `executor` | **sonnet** | Implémentation |
| `reviewer` | **opus** | Code review |
| `tester` | **sonnet** | Tests |
| `documenter` | **haiku** | Documentation |

### Stratégie de Sélection

> **Opus = PENSE et DÉCIDE | Sonnet = EXÉCUTE | Haiku = LIT et DOCUMENTE**

✅ **Config models lue et correcte**

---

## 7.2 Mapping planner → opus

**Fichier:** `agents/planner.md`

### Configuration Vérifiée

```markdown
**Model:** opus
**Role:** Planification de phase et décomposition de tâches
```

### Rôle du Planner

**Responsabilités:**
- Analyser les requirements et objectifs
- Décomposer les features en tâches atomiques
- Créer le plan de phase avec milestones
- Estimer la complexité et le temps
- Identifier les risques et dépendances
- Décider Quick vs Full mode

**Workflow:**
1. LIRE le contexte
2. ANALYSER la complexité
3. DÉCOMPOSER en tâches
4. DOCUMENTER le plan
5. VALIDER avec l'humain

**Outputs:**
- Plan de phase (`.act/plan.md`)
- Task list ordonnée
- Risk assessment
- Time estimate
- Mode decision (Quick/Full)

✅ **planner → opus vérifié**

---

## 7.3 Mapping executor → sonnet

**Fichier:** `agents/executor.md`

### Configuration Vérifiée

```markdown
**Model:** sonnet
**Role:** Implémentation et écriture de code production
```

### Rôle de l'Executor

**Responsabilités:**
- Implémenter le code selon le plan et le design
- Suivre les instructions explicitement
- Écrire du code propre et maintenable
- Respecter les conventions du projet
- Appliquer les Deviation Rules 1-3, 5
- Escalader Rule 4 à l'architect

**Workflow:**
1. LIRE la tâche courante
2. VÉRIFIER les prérequis
3. IMPLÉMENTER
4. TESTER localement
5. LOGGER le progress
6. COMMIT
7. PASSER à la tâche suivante

**Deviation Rules Handling:**
| Rule | Action |
|------|--------|
| 1: Bug | Auto-fix immédiatement |
| 2: Missing | Auto-add immédiatement |
| 3: Blocker | Auto-fix immédiatement |
| 4: Architectural | **STOP** → escalade architect |
| 5: Enhancement | Log dans ISSUES.md, continuer |

✅ **executor → sonnet vérifié**

---

## 7.4 Mapping documenter → haiku

**Fichier:** `agents/documenter.md`

### Configuration Vérifiée

```markdown
**Model:** haiku
**Role:** Documentation et mise à jour des fichiers
```

### Rôle du Documenter

**Responsabilités:**
- Écrire et maintenir la documentation
- Mettre à jour les READMEs
- Documenter les APIs
- Écrire les commentaires de code
- Maintenir les changelogs
- Documenter les décisions (light)

**Workflow:**
1. IDENTIFIER ce qui doit être documenté
2. METTRE À JOUR les docs existantes
3. AJOUTER la documentation manquante
4. CHANGELOG
5. VÉRIFIER la cohérence

**Pourquoi Haiku ?**
Le documenter :
- Suit des templates établis (peu de créativité requise)
- Travaille sur du contenu déjà finalisé (pas de décision)
- Produit du texte structuré (pas de raisonnement complexe)

→ Haiku est **suffisant et économique**

✅ **documenter → haiku vérifié**

---

## 7.5 Simulation Tâche Planning

### Tâche

> "Planifier l'architecture de TaskFlow"

### Analyse

| Critère | Évaluation |
|---------|------------|
| Type de tâche | Planification stratégique |
| Complexité cognitive | HAUTE |
| Décisions requises | Architecture, décomposition, risques |
| Créativité | HAUTE |
| Raisonnement | COMPLEXE |

### Agent Attendu

**→ planner (opus)**

### Pourquoi Opus est Approprié

1. **Raisonnement complexe requis**
   - Analyse multi-dimensionnelle (technique, temps, risques)
   - Décomposition hiérarchique en tâches
   - Identification des dépendances

2. **Prise de décision stratégique**
   - Choix Quick vs Full mode
   - Priorisation des tâches
   - Évaluation des risques

3. **Vision holistique nécessaire**
   - Comprendre le projet dans son ensemble
   - Anticiper les problèmes futurs
   - Planifier sur plusieurs phases

4. **Pas d'exécution directe**
   - Le planner PENSE, il ne fait pas
   - Il produit un plan, pas du code

> **Opus excelle dans les tâches de réflexion profonde et de décision architecturale.**

✅ **Tâche planning → opus**

---

## 7.6 Simulation Tâche Execution

### Tâche

> "Implémenter la fonction list_tasks()"

### Analyse

| Critère | Évaluation |
|---------|------------|
| Type de tâche | Implémentation code |
| Complexité cognitive | MOYENNE |
| Décisions requises | Peu (design déjà fait) |
| Créativité | FAIBLE |
| Raisonnement | LINÉAIRE |

### Agent Attendu

**→ executor (sonnet)**

### Pourquoi Sonnet est Approprié

1. **Exécution selon un plan établi**
   - Le design existe déjà (via planner/architect)
   - L'executor suit les instructions
   - Pas de décision architecturale

2. **Tâche bien définie**
   - Input clair : "implémenter list_tasks()"
   - Output attendu : fonction fonctionnelle
   - Critères de done explicites

3. **Équilibre coût/performance**
   - Sonnet est plus rapide et moins cher qu'Opus
   - Suffisamment capable pour l'implémentation
   - Le surcoût d'Opus n'apporterait rien

4. **Mode "suivre le plan"**
   - L'executor ne décide pas, il fait
   - Deviation Rule 4 = STOP si décision architecturale
   - Escalade vers architect si nécessaire

> **Sonnet excelle dans l'exécution rapide de tâches bien définies.**

✅ **Tâche execution → sonnet**

---

## Synthèse du Système de Sélection

### Matrice Agent × Modèle × Justification

| Agent | Modèle | Justification |
|-------|--------|---------------|
| **planner** | opus | Décisions stratégiques, raisonnement complexe |
| **architect** | opus | Design système, décisions techniques majeures |
| **reviewer** | opus | Analyse critique, qualité code |
| **executor** | sonnet | Exécution selon plan, implémentation |
| **tester** | sonnet | Écriture de tests, vérification |
| **documenter** | haiku | Templates, texte structuré, économique |

### Règle Générale

```
┌─────────────────────────────────────────────────────────┐
│  OPUS     = PENSE et DÉCIDE (stratégie, architecture)   │
│  SONNET   = EXÉCUTE (code, tests)                       │
│  HAIKU    = LIT et DOCUMENTE (docs, commentaires)       │
└─────────────────────────────────────────────────────────┘
```

### Économie du Système

- **Opus** : Réservé aux moments critiques (planification, review)
- **Sonnet** : Workhorse pour le travail quotidien
- **Haiku** : Tâches simples et répétitives

→ Optimisation du rapport qualité/coût

---

## Critères de Succès

| Critère | Statut |
|---------|--------|
| Config models lue et correcte | ✅ |
| planner → opus vérifié | ✅ |
| executor → sonnet vérifié | ✅ |
| documenter → haiku vérifié | ✅ |
| Tâche planning → opus | ✅ |
| Tâche execution → sonnet | ✅ |

---

## Conclusion

**Test 7 : ✅ PASS**

Le système de sélection de modèles par agent fonctionne correctement :

1. **Configuration claire** : 6 agents avec mapping explicite
2. **Stratégie cohérente** : Opus/Sonnet/Haiku selon le type de tâche
3. **Documentation complète** : Chaque agent a son rôle et justification
4. **Simulation validée** : Les tâches sont bien routées vers les bons modèles

Le framework ACT v2.5 implémente une sélection de modèles intelligente qui optimise le rapport qualité/coût tout en garantissant que chaque type de tâche est traité par le modèle le plus approprié.
