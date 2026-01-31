# Analyse Approfondie : BMAD-METHOD v6.0.0-Beta.4

**Date :** 2026-01-31  
**Repo :** https://github.com/bmad-code-org/BMAD-METHOD  
**Auteur :** Brian (BMad) Madison  
**Priorité :** HIGH (référence pour scale-adaptive)

---

## 📊 Vue d'ensemble

**Type :** AI-driven agile development framework  
**Focus :** Méthodologie complète avec agents, workflows, phases  
**Version :** 6.0.0-Beta.4  
**License :** MIT  
**Installation :** `npx bmad-method install`

---

## 🏗️ Architecture

### Structure des fichiers

```
BMAD-METHOD/
├── src/
│   ├── core/                    # Core platform
│   │   ├── agents/
│   │   │   └── bmad-master.agent.yaml
│   │   ├── workflows/
│   │   │   ├── brainstorming/
│   │   │   ├── party-mode/
│   │   │   └── advanced-elicitation/
│   │   ├── tasks/
│   │   └── resources/
│   │
│   └── bmm/                     # BMad Method Module
│       ├── agents/              # 9 agents spécialisés
│       │   ├── pm.agent.yaml
│       │   ├── architect.agent.yaml
│       │   ├── dev.agent.yaml
│       │   ├── ux-designer.agent.yaml
│       │   ├── analyst.agent.yaml
│       │   ├── quinn.agent.yaml      # QA
│       │   ├── sm.agent.yaml         # Scrum Master
│       │   ├── quick-flow-solo-dev.agent.yaml
│       │   └── tech-writer/
│       │
│       ├── workflows/           # 4 phases + Quick Flow
│       │   ├── 1-analysis/
│       │   ├── 2-plan-workflows/
│       │   ├── 3-solutioning/
│       │   ├── 4-implementation/
│       │   ├── bmad-quick-flow/
│       │   ├── document-project/
│       │   ├── excalidraw-diagrams/
│       │   └── qa/
│       │
│       └── teams/
│           └── team-fullstack.yaml
│
├── tools/
│   └── cli/                     # CLI installer
│
└── docs/                        # Documentation complète
```

### Les 4 Phases + Quick Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                    FULL BMAD METHOD                              │
├─────────────────────────────────────────────────────────────────┤
│  Phase 1: Analysis (Optional)                                    │
│  ├── brainstorm → brainstorming-report.md                       │
│  ├── research → Research findings                                │
│  └── create-product-brief → product-brief.md                    │
├─────────────────────────────────────────────────────────────────┤
│  Phase 2: Planning                                               │
│  ├── create-prd → PRD.md                                        │
│  └── create-ux-design → ux-spec.md                              │
├─────────────────────────────────────────────────────────────────┤
│  Phase 3: Solutioning                                            │
│  ├── create-architecture → architecture.md + ADRs               │
│  ├── create-epics-and-stories → Epic files with stories         │
│  └── check-implementation-readiness → PASS/CONCERNS/FAIL        │
├─────────────────────────────────────────────────────────────────┤
│  Phase 4: Implementation                                         │
│  ├── sprint-planning → sprint-status.yaml                       │
│  ├── create-story → story-[slug].md                             │
│  ├── dev-story → Working code + tests                           │
│  ├── automate (QA) → Test suite                                 │
│  ├── code-review → Approved or changes requested                │
│  ├── correct-course → Updated plan                              │
│  └── retrospective → Lessons learned                            │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                    QUICK FLOW (Skip Phases 1-3)                  │
├─────────────────────────────────────────────────────────────────┤
│  quick-spec → tech-spec.md                                      │
│  quick-dev → Working code + tests                               │
└─────────────────────────────────────────────────────────────────┘
```

---

## 👥 Les 9 Agents Spécialisés

| Agent | Icon | Rôle | Workflows principaux |
|-------|------|------|---------------------|
| **BMad Master** | 🧙 | Orchestrateur principal | Tout |
| **PM (John)** | 📋 | Product Manager | create-prd, validate-prd |
| **Architect** | 🏗️ | Architecte technique | create-architecture |
| **Dev** | 💻 | Développeur | dev-story, quick-dev |
| **UX Designer** | 🎨 | Designer UX | create-ux-design |
| **Analyst** | 📊 | Analyste | research, brainstorm |
| **Quinn** | 🧪 | QA Agent | automate (tests) |
| **SM** | 🏃 | Scrum Master | sprint-planning, retrospective |
| **Tech Writer** | 📝 | Documentation | document-project |

### Structure d'un Agent (YAML)

```yaml
agent:
  metadata:
    id: "_bmad/bmm/agents/pm.md"
    name: John
    title: Product Manager
    icon: 📋
    module: bmm
    hasSidecar: false

  persona:
    role: "Product Manager specializing in..."
    identity: "Product management veteran with 8+ years..."
    communication_style: "Asks 'WHY?' relentlessly..."
    principles: |
      - Channel expert product manager thinking
      - PRDs emerge from user interviews
      - Ship the smallest thing that validates

  menu:
    - trigger: CP or fuzzy match on create-prd
      exec: "{project-root}/_bmad/bmm/workflows/2-plan-workflows/create-prd/workflow.md"
      description: "[CP] Create PRD"
```

**🔥 Pattern clé :** Agents avec persona, communication_style, et principles explicites.

---

## 🚀 Quick Flow : Le Pattern Scale-Adaptive

**Principe :** Skip les phases 1-3 pour les petits changements.

**Quand utiliser Quick Flow :**
- Bug fixes
- Refactoring
- Small features
- Prototyping

**Quand utiliser Full BMad Method :**
- New products
- Major features
- Multiple teams involved
- Stakeholder alignment needed

**Workflow Quick Flow :**
1. `quick-spec` → génère tech-spec.md
2. `quick-dev` → implémente

**🔥 C'est exactement le pattern Scale-Adaptive qu'on veut pour ACT !**

---

## 🎉 Party Mode : Multi-Agent Collaboration

**Concept :** Tous les agents dans une seule conversation.

**Comment ça marche :**
1. Run `party-mode`
2. BMad Master orchestre, sélectionne agents pertinents par message
3. Agents répondent en caractère, discutent entre eux
4. Conversation continue tant que nécessaire

**Use cases :**
- Big decisions avec tradeoffs
- Brainstorming sessions
- Post-mortems
- Sprint retrospectives

**Exemple :**
```
You: "Monolith or microservices for MVP?"

Architect: "Start monolith. Microservices add complexity..."
PM: "Agree. Time to market matters more..."
Dev: "Monolith with clear module boundaries..."
```

**🔥 Pattern unique que personne d'autre n'a !**

---

## 📐 Context Management

**Principe :** Chaque document devient contexte pour la phase suivante.

```
PRD → tells Architect constraints
Architecture → tells Dev patterns to follow
Story files → focused, complete context for implementation
```

**Document project-context.md :**
- Créé par `document-project` workflow
- Chargé par tous les workflows d'implémentation
- Contient : structure codebase, règles, patterns existants

**Context par workflow :**

| Workflow | Contexte chargé |
|----------|-----------------|
| create-story | epics, PRD, architecture, UX |
| dev-story | story file |
| code-review | architecture, story file |
| quick-spec | planning docs (if exist) |
| quick-dev | tech-spec |

---

## 📁 Configuration Module (YAML)

```yaml
code: bmm
name: "BMad Method Agile-AI Driven-Development"
default_selected: true

# User variables
project_name:
  prompt: "What is your project called?"
  default: "{directory_name}"

user_skill_level:
  prompt: "What is your development experience level?"
  default: "intermediate"
  single-select:
    - value: "beginner"
      label: "Beginner - Explain things clearly"
    - value: "intermediate"
      label: "Intermediate - Balance detail with speed"
    - value: "expert"
      label: "Expert - Be direct and technical"

# Output folders
planning_artifacts:
  prompt: "Where should planning artifacts be stored?"
  default: "{output_folder}/planning-artifacts"

implementation_artifacts:
  prompt: "Where should implementation artifacts be stored?"
  default: "{output_folder}/implementation-artifacts"
```

**🔥 Pattern :** Configuration interactive avec prompts et defaults.

---

## 🔧 CLI & Installation

**Installation :**
```bash
npx bmad-method install
```

**Structure créée :**
```
{project-root}/
├── _bmad/
│   ├── _config/
│   │   ├── task-manifest.csv
│   │   └── workflow-manifest.csv
│   ├── bmm/
│   │   ├── agents/
│   │   ├── workflows/
│   │   └── config.yaml
│   └── core/
└── {output_folder}/
    ├── planning-artifacts/
    └── implementation-artifacts/
```

---

## ✅ Forces

1. **Scale-Adaptive** : Quick Flow vs Full Method
2. **Party Mode** : Multi-agent collaboration unique
3. **9 agents spécialisés** : Personas, communication styles
4. **4 phases structurées** : Analysis → Planning → Solutioning → Implementation
5. **Context management** : Documents progressifs
6. **Configuration interactive** : user_skill_level adapte le ton
7. **Modules extensibles** : TEA (testing), Game Dev, Creative Suite
8. **Documentation exemplaire** : Workflow map complet
9. **CLI moderne** : npx installation

---

## ❌ Faiblesses

1. **Complexité** : Beaucoup de concepts à apprendre
2. **Mono-IDE** : Principalement Claude Code (support limité autres)
3. **Pas de context engineering** : Pas de 3-file pattern
4. **Pas de session recovery** : Pas de récupération après crash
5. **Pas de learning** : Pas de compound learning
6. **Dépendance YAML** : Format spécifique BMAD

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Scale-Adaptive** | Quick Flow vs Full Method | 🔴 |
| **Phase structure** | 4 phases claires avec gates | 🔴 |
| **Agent personas** | role, identity, communication_style | 🔴 |
| **Context progression** | Documents informent les suivants | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **user_skill_level** | Adapter le ton (beginner/expert) | 🟠 |
| **Workflow YAML** | Configuration déclarative | 🟠 |
| **Sprint tracking** | sprint-status.yaml | 🟠 |
| **Correct-course** | Gérer changements mid-sprint | 🟠 |

### Tier 3 (COULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Party Mode** | Multi-agent collaboration | 🟢 |
| **Excalidraw diagrams** | Génération de diagrammes | 🟢 |
| **Module system** | Extensions (TEA, Game Dev) | 🟢 |

---

## 📝 Comparaison avec ACT Actuel

| Feature | BMAD | ACT | Gap |
|---------|------|-----|-----|
| Phases | 4 | 7 | ACT plus granulaire |
| Scale-adaptive | ✅ Quick Flow | ❌ | À implémenter |
| Agents | 9 | 7 | Comparable |
| Party Mode | ✅ | ❌ | Nice-to-have |
| User skill level | ✅ | ❌ | À implémenter |
| CLI installer | ✅ | ✅ | Équivalent |
| Context progression | ✅ | ⚠️ partiel | À améliorer |

---

## 📁 Fichiers à Étudier Plus Tard

- `src/bmm/workflows/4-implementation/dev-story/instructions.xml` — Instructions détaillées
- `src/core/workflows/party-mode/` — Implementation Party Mode
- `src/bmm/agents/quick-flow-solo-dev.agent.yaml` — Agent Quick Flow
- `docs/how-to/customize-bmad.md` — Customization guide

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 2/9 — BMAD-METHOD v6.0.0-Beta.4*
