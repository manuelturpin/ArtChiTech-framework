> ⚠️ **DOCUMENT HISTORIQUE** — Rédigé avant ACT v2.7
> 
> Ce document décrit l'état du framework **avant** la migration vers les skills natifs.
> Depuis v2.7, ACT n'a plus de dépendance à `superpowers` — tous les skills sont intégrés.
> Voir `docs/MIGRATION-FROM-SUPERPOWERS.md` pour les détails.

---

# Audit Comparatif : ACT Framework vs BMAD-METHOD

> **Date**: 2025-01-27
> **Objectif**: Identifier les forces/faiblesses de chaque framework et recommandations d'amélioration pour ACT

---

## 1. Vue d'Ensemble

### ACT (ArtChiTech Framework)
- **Type**: Plugin Claude Code pour gestion de projet en 7 phases
- **Focus**: Cycle de vie complet produit (Discovery → Growth)
- **Architecture**: Phases + Agents + Commands + Skills externes (superpowers)
- **Cible**: Développeurs solo ou petites équipes

### BMAD-METHOD (Breakthrough Method of Agile AI Driven Development)
- **Type**: Framework agile AI-driven avec agents spécialisés
- **Focus**: Planification + Implémentation agile
- **Architecture**: Modules + Agents + Workflows + Steps
- **Cible**: Équipes de toutes tailles, projets variés

---

## 2. Comparaison des Phases

| ACT Phase | BMAD Equivalent | Différences Clés |
|-----------|-----------------|------------------|
| **1. Discovery** | 1-analysis (Research + Product Brief) | BMAD sépare brainstorming, recherche et brief. ACT les fusionne avec dépendance `superpowers:brainstorming` |
| **2. Strategy** | 2-plan (PRD + UX Design) | BMAD a des workflows dédiés PRD (Create/Validate/Edit), UX séparé. ACT fusionne en une phase |
| **3. Design** | 3-solutioning (Architecture + Epics/Stories) | BMAD lie architecture aux epics/stories. ACT a design technique + UX combinés |
| **4. Development** | 4-implementation (Dev Story + Code Review + Sprint) | BMAD a workflows agile complets (Sprint Planning, Stories, Retrospectives). ACT a TDD via skill externe |
| **5. Quality** | *(Intégré dans workflows)* | BMAD intègre qualité dans chaque workflow. ACT a phase dédiée |
| **6. Launch** | *(Non couvert)* | ACT couvre explicitement le déploiement. BMAD s'arrête à l'implémentation |
| **7. Growth** | *(Non couvert)* | ACT couvre itération post-launch. Absent de BMAD |

### Analyse
- **ACT** couvre le cycle complet produit (discovery → growth)
- **BMAD** excelle dans la planification et l'implémentation agile mais ne couvre pas launch/growth
- **Opportunité ACT**: S'inspirer des workflows détaillés BMAD pour phases 1-4

---

## 3. Comparaison des Agents

### Agents ACT (7)

| Agent | Rôle |
|-------|------|
| `project-orchestrator` | Hub principal, coordination |
| `phase-controller` | Transitions Go/No-Go |
| `chunk-manager` | Découpage tâches TDD |
| `error-tracker` | Suivi erreurs |
| `loop-executor` | Exécution autonome |
| `context-manager` | Gestion contexte long |
| `tips-engine` | Conseils contextuels |

### Agents BMAD (9+ avec personas)

| Agent | Nom/Persona | Rôle |
|-------|-------------|------|
| `analyst` | Mary 📊 | Business Analyst - Recherche, brainstorming |
| `pm` | John 📋 | Product Manager - PRD, roadmap |
| `architect` | Winston 🏗️ | System Architect - Architecture technique |
| `ux-designer` | Sally 🎨 | UX Designer - Design UX/UI |
| `dev` | Amelia 💻 | Developer - Implémentation |
| `sm` | Bob 🏃 | Scrum Master - Sprint, stories |
| `tea` | *(Testarch)* | Test Engineering Agent |
| `tech-writer` | *(Writer)* | Documentation |
| `quick-flow-solo-dev` | *(Solo)* | Mode rapide solo |

### Analyse Comparative

| Aspect | ACT | BMAD |
|--------|-----|------|
| **Nombre** | 7 agents techniques | 9+ agents avec personas |
| **Personnalité** | Fonctionnels uniquement | Noms + identités + styles de communication |
| **Spécialisation** | Orchestration/contrôle | Rôles métier distincts (PM, Architect, Dev...) |
| **Interaction** | Invocation directe | Menus interactifs par agent |

### Recommandations pour ACT

1. **Ajouter personas aux agents** - Rendre les agents plus engageants avec noms et styles
2. **Créer agents métier** - Séparer PM, Architect, Dev au lieu d'agents techniques
3. **Agent UX dédié** - Actuellement absent dans ACT
4. **Agent Test/Quality** - BMAD a un agent TEA complet pour les tests

---

## 4. Comparaison des Workflows

### Structure des Workflows

| Aspect | ACT | BMAD |
|--------|-----|------|
| **Architecture** | Commands simples (Markdown) | Micro-file architecture avec steps séquentiels |
| **État** | `.epct/state.json` | Frontmatter dans documents + config.yaml |
| **Templates** | Checklists dans phases | Templates détaillés pour chaque livrable |
| **Validation** | Go/No-Go manuel | Workflows de validation dédiés (validate-prd) |

### Workflows Clés BMAD Absents d'ACT

| Workflow BMAD | Description | Intérêt pour ACT |
|---------------|-------------|------------------|
| **brainstorming** (Core) | 60+ techniques créatives, 4 modes | ⭐⭐⭐ Remplace dépendance superpowers |
| **create-prd** (tri-modal) | Create/Validate/Edit en un workflow | ⭐⭐⭐ Structure PRD manquante |
| **create-ux-design** | 14 steps UX complets | ⭐⭐ Phase Design à enrichir |
| **create-epics-and-stories** | PRD → Stories prêtes dev | ⭐⭐⭐ Lien manquant ACT |
| **check-implementation-readiness** | Validation avant dev | ⭐⭐ Go/No-Go à améliorer |
| **party-mode** | Multi-agents conversation | ⭐⭐ Fonctionnalité fun/utile |
| **quick-dev** / **quick-spec** | Mode rapide bugfix/feature | ⭐⭐⭐ Mode QUICK ACT à enrichir |
| **sprint-planning** / **create-story** | Gestion agile complète | ⭐⭐ Phase 4 à enrichir |
| **document-project** | Génération documentation | ⭐⭐ Utile pour handoff |

---

## 5. Focus : Le Brainstorming

### BMAD Brainstorming (Intégré)
- **60+ techniques** créatives (CSV avec méthodes)
- **4 modes de sélection** :
  1. User-Selected - Parcourir la bibliothèque
  2. AI-Recommended - Suggestions personnalisées
  3. Random Selection - Découverte
  4. Progressive Flow - Du large au précis
- **Anti-bias protocol** - Rotation domaines toutes les 10 idées
- **Objectif 100+ idées** avant organisation
- **Facilitation interactive** - Coaching, pas génération
- **Output** - Document structuré avec idées catégorisées

### ACT Brainstorming (Externe via Superpowers)
- Dépendance au plugin `superpowers`
- Invocation simple : `superpowers:brainstorming`
- Pas de contrôle sur le workflow
- Fallback : "discussion manuelle"

### Recommandation : Internaliser le Brainstorming

**Arguments pour internaliser** :
1. **Autonomie** - Plus de dépendance externe
2. **Personnalisation** - Adapter aux 7 phases ACT
3. **Intégration** - Lier au state management ACT
4. **Cohérence** - Même architecture que le reste du plugin

**Proposition d'implémentation** :

```
plugin/
├── workflows/
│   └── brainstorming/
│       ├── workflow.md
│       ├── techniques.csv        (60+ techniques BMAD-inspired)
│       ├── steps/
│       │   ├── step-01-setup.md
│       │   ├── step-02a-user-selected.md
│       │   ├── step-02b-ai-recommended.md
│       │   ├── step-02c-random.md
│       │   ├── step-02d-progressive.md
│       │   ├── step-03-execution.md
│       │   └── step-04-organization.md
│       └── template.md
```

---

## 6. Fonctionnalités Uniques

### BMAD a, ACT n'a pas

| Feature | Description | Priorité pour ACT |
|---------|-------------|-------------------|
| **Party Mode** | Multi-agents discussion | Moyenne |
| **Scale-Domain-Adaptive** | Adapte profondeur selon complexité | Haute |
| **Module System** | Extensions (Game Dev, Creative Suite) | Basse |
| **Agent Personas** | Noms, personnalités, styles | Haute |
| **Tri-modal workflows** | Create/Validate/Edit | Haute |
| **Micro-file architecture** | Steps atomiques séquentiels | Haute |
| **60+ brainstorming techniques** | Bibliothèque créativité | Haute |
| **Help AI-assisté** | `/bmad-help` contextuel | Moyenne |
| **Installation CLI** | `npx bmad-method install` | Basse |

### ACT a, BMAD n'a pas

| Feature | Description | Valeur |
|---------|-------------|--------|
| **Phase 5-7** | Quality, Launch, Growth | Haute |
| **Loop autonome** | Exécution sans supervision | Moyenne |
| **Error tracking** | Système de suivi erreurs | Moyenne |
| **Checkpoints** | Sauvegarde état avant transition | Moyenne |
| **Anti-patterns** | Warnings explicites par phase | Haute |
| **Scoring** | Score de progression par phase | Moyenne |

---

## 7. Architecture Comparée

### BMAD Micro-File Architecture

```
workflow.md                 # Entry point + initialization
├── steps/
│   ├── step-01-init.md    # Setup + continuation detection
│   ├── step-01b-continue.md
│   ├── step-02-discovery.md
│   ├── step-03-xxx.md
│   └── step-N-complete.md
├── templates/
│   └── output-template.md
└── data/
    └── reference-data.csv
```

**Principes** :
- Un seul step en mémoire à la fois
- Frontmatter pour état
- Append-only document building
- Menus avec halt pour input utilisateur

### ACT Architecture Actuelle

```
plugin/
├── commands/*.md          # Entry points
├── agents/*.md            # Logique agents
└── references/
    ├── phases/*.md        # Documentation phases
    └── scoring/*.md       # Critères scoring
```

**Limites** :
- Commands monolithiques
- Pas de steps atomiques
- État géré externement (scripts Python)

### Recommandation

Adopter la **micro-file architecture** pour les workflows complexes :
- Phase transitions
- Brainstorming
- Feature development
- Onboarding

---

## 8. Recommandations Prioritaires

### Haute Priorité ⭐⭐⭐

1. **Internaliser le brainstorming**
   - Créer `plugin/workflows/brainstorming/` basé sur BMAD
   - 60+ techniques avec modes de sélection
   - Éliminer dépendance superpowers

2. **Adopter micro-file architecture**
   - Refactorer workflows complexes en steps
   - Améliorer gestion état dans frontmatter
   - Meilleure traçabilité

3. **Ajouter workflow PRD**
   - Create/Validate/Edit modes
   - Template PRD structuré
   - Lien avec phase Strategy

4. **Ajouter workflow Epics/Stories**
   - Transformer PRD en stories dev-ready
   - Critères d'acceptance clairs
   - Lien avec phase Development

### Moyenne Priorité ⭐⭐

5. **Personas pour agents**
   - Noms, icônes, styles de communication
   - Rendre ACT plus engageant

6. **Agent UX/Design dédié**
   - Workflow UX structuré
   - Templates wireframes/mockups

7. **Mode Party (optionnel)**
   - Multi-agents discussion
   - Utile pour brainstorming collaboratif

8. **Scale-adaptive**
   - Détecter complexité projet
   - Adapter profondeur planification

### Basse Priorité ⭐

9. **Module system**
   - Extensions domaine-spécifiques
   - Game dev, Creative, etc.

10. **Installation CLI**
    - Package npm
    - Installation simplifiée

---

## 9. Proposition : Brainstorming ACT Autonome

### Structure Proposée

```markdown
# plugin/workflows/brainstorming/workflow.md
---
name: act-brainstorming
description: Facilitation créative structurée pour les phases ACT
---

# Brainstorming ACT

**Goal:** Faciliter des sessions créatives pour valider problèmes et explorer solutions

**Contexte ACT:**
- Phase 1 Discovery → Validation problème
- Phase 2 Strategy → Définition MVP
- Phase 3 Design → Exploration architecture

## INITIALIZATION

### Load ACT Context
- Lire `.epct/state.json` pour phase courante
- Adapter techniques à la phase

### Paths
- `techniques_path` = `plugin/workflows/brainstorming/techniques.csv`
- `output_path` = `.epct/brainstorming/session-{date}.md`

## EXECUTION

Read: `steps/step-01-setup.md`
```

### Techniques Par Phase ACT

| Phase | Techniques Recommandées |
|-------|------------------------|
| Discovery | Jobs-To-Be-Done, 5 Whys, Empathy Map, Customer Journey |
| Strategy | Business Model Canvas, Lean Canvas, Value Proposition |
| Design | Architecture Decision Records, C4 Model, Trade-off Analysis |

### Intégration État ACT

```javascript
// Lier brainstorming output à state.json
{
  "phase": {
    "current": 1,
    "name": "discovery",
    "brainstorming_sessions": [
      {
        "date": "2025-01-27",
        "topic": "Problem validation",
        "ideas_count": 42,
        "top_3": ["Idea 1", "Idea 2", "Idea 3"]
      }
    ]
  }
}
```

---

## 10. Conclusion

### Forces ACT
- ✅ Cycle complet (7 phases jusqu'à Growth)
- ✅ Scoring et checkpoints
- ✅ Anti-patterns documentés
- ✅ Loop autonome

### Faiblesses ACT
- ❌ Dépendance forte à superpowers
- ❌ Workflows monolithiques
- ❌ Pas de personas agents
- ❌ PRD/Stories workflow manquant

### Opportunités d'Amélioration
- 📈 Internaliser brainstorming (priorité 1)
- 📈 Micro-file architecture (priorité 2)
- 📈 Workflows PRD et Stories (priorité 3)

### Risques à Éviter
- ⚠️ Ne pas copier BMAD aveuglément (contextes différents)
- ⚠️ Garder la simplicité ACT (éviter over-engineering BMAD)
- ⚠️ Maintenir focus sur cycle complet (phases 5-7 = différenciateur)

---

## Annexes

### A. Sources Analysées

**BMAD-METHOD v6** (cloné 2025-01-27)
- `/tmp/bmad-method/src/bmm/` - Module principal
- `/tmp/bmad-method/src/core/` - Core workflows
- `/tmp/bmad-method/docs/` - Documentation

**ACT Framework** (local)
- `plugin/references/phases/` - 7 phases
- `plugin/agents/` - 7 agents
- `plugin/commands/` - 14 commandes

### B. Métriques Comparatives

| Métrique | ACT | BMAD |
|----------|-----|------|
| Phases/Workflows | 7 phases | 4 phases principales |
| Agents | 7 | 9+ |
| Commandes | 14 | 50+ workflows |
| Templates | ~10 | 30+ |
| Techniques brainstorming | 0 (externe) | 60+ |
| Lignes documentation | ~2000 | ~15000 |

### C. Prochaines Étapes Suggérées

1. [ ] Valider priorités avec équipe
2. [ ] Créer spike brainstorming interne
3. [ ] Refactorer un workflow en micro-files
4. [ ] Tester avec projet pilote
5. [ ] Itérer basé sur feedback
