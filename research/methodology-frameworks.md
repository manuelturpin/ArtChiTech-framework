# Frameworks Méthodologiques pour l'IA Development

**Date :** 2026-01-31
**Focus :** Frameworks qui structurent le travail avec l'IA (pas les outils eux-mêmes)

---

## 📊 Catégories de frameworks méthodologiques

| Type | Exemples |
|------|----------|
| **Méthodologie complète** | BMAD-METHOD, ACT (toi!) |
| **Rules/Instructions** | .cursorrules, CLAUDE.md, .windsurfrules |
| **Prompt Libraries** | prompts.chat, awesome-cursorrules |
| **Agent Personas** | BMAD agents, preprompts |
| **Workflow Systems** | Phase-based, agile-driven |

---

## 🎯 Framework #1 : BMAD-METHOD

**Repo :** https://github.com/bmad-code-org/BMAD-METHOD
**Slogan :** "Breakthrough Method of Agile AI Driven Development"
**Stars :** Très populaire

### Philosophie
> "Traditional AI tools do the thinking for you, producing average results. BMad agents act as expert collaborators who guide you through a structured process."

### Features clés

1. **21+ Agents spécialisés**
   - PM, Architect, Developer, UX, Scrum Master, QA...
   - Chaque agent a une expertise et un style propre

2. **50+ Workflows guidés**
   - Discovery → Planning → Architecture → Implementation

3. **Scale-Domain-Adaptive**
   - S'adapte à la complexité du projet
   - SaaS vs système médical = besoins différents

4. **Party Mode** 🎉
   - Plusieurs agents dans une session
   - Débat, collaboration, perspectives multiples

5. **AI-Assisted Help**
   - `/bmad-help` guide de bout en bout

### Workflows

**Simple Path (Quick Flow)** — Bug fixes, petites features :
```
/quick-spec → /dev-story → /code-review
```

**Full Planning Path** — Produits, plateformes :
```
/product-brief → /create-prd → /create-architecture 
→ /create-epics-and-stories → /sprint-planning 
→ /create-story → /dev-story → /code-review
```

### Modules officiels

| Module | Purpose |
|--------|---------|
| **BMM** (Core) | 34+ workflows, 4 phases |
| **BMB** (Builder) | Créer ses propres agents/workflows |
| **TEA** (Test) | Stratégie de test enterprise |
| **BMGD** (Game Dev) | Unity, Unreal, Godot |
| **CIS** (Creative) | Innovation, brainstorming |

### Installation
```bash
npx bmad-method install
```

### Ce qu'ACT peut apprendre de BMAD
- ✅ **Agents spécialisés par domaine**
- ✅ **Help interactif** (`/bmad-help`)
- ✅ **Scale-adaptive** (s'adapte au projet)
- ✅ **Party mode** (multi-agents)
- ✅ **Modules extensibles**
- ✅ **Workflows courts vs complets**

---

## 🎯 Framework #2 : .cursorrules System

**Site :** cursor.directory / awesome-cursorrules
**Type :** Configuration par projet

### Concept
Un fichier `.cursorrules` à la racine du projet définit :
- Comportement de l'IA
- Standards de code
- Contexte du projet
- Bibliothèques utilisées

### Pourquoi ?
- **Customized AI Behavior** : adapté au projet
- **Consistency** : même style partout
- **Context Awareness** : l'IA connaît le projet
- **Team Alignment** : tous les devs ont la même IA

### Exemples de règles disponibles

**Frontend :**
- Next.js (Tailwind, TypeScript, SEO)
- React (TypeScript, shadcn/ui)
- Vue 3, Svelte, Solid.js, Qwik

**Backend :**
- Node.js, Go, Elixir, Python
- Laravel, Django, FastAPI
- Java Springboot

**Mobile :**
- React Native, Flutter, Swift

### Structure typique
```
# Projet Next.js + Tailwind
- Use TypeScript strict mode
- Follow Next.js App Router conventions
- Use Tailwind for styling
- Prefer server components
- Use shadcn/ui for UI components
```

### Ce qu'ACT peut apprendre
- ✅ **Configuration par projet** simple
- ✅ **Réutilisable entre projets** similaires
- ✅ **Partage communautaire** (directories)
- ✅ **Stack-specific rules**

---

## 🎯 Framework #3 : CLAUDE.md Pattern

**Source :** Anthropic / Claude Code
**Type :** Instructions project-level

### Concept
Un fichier `CLAUDE.md` à la racine définit :
- Contexte du projet
- Conventions de code
- Architecture
- Workflow préféré

### Structure recommandée
```markdown
# Project: [Name]

## Language
- Code: English
- Conversation: [Your language]

## Architecture
[Description de l'architecture]

## Conventions
[Standards de code]

## Commands
[Commandes slash disponibles]
```

### Ce qu'ACT peut apprendre
- ✅ **Séparation langue code/conversation**
- ✅ **Documentation intégrée**
- ✅ **Pattern déjà adopté** par Claude Code

---

## 🎯 Framework #4 : prompts.chat

**Repo :** https://github.com/f/prompts.chat
**Type :** Bibliothèque de prompts
**Stars :** 143k+

### Concept
Collection de prompts réutilisables pour différents rôles :
- Act as Expert Developer
- Act as Code Reviewer
- Act as Architect
- etc.

### Intégrations
- CLI : `npx prompts.chat`
- Claude Code Plugin
- MCP Server

### Ce qu'ACT peut apprendre
- ✅ **Personas/rôles prédéfinis**
- ✅ **Format MCP pour intégration**
- ✅ **Contribution communautaire**

---

## 📋 Comparaison ACT vs BMAD

| Aspect | ACT (actuel) | BMAD |
|--------|--------------|------|
| **Phases** | 7 phases linéaires | Adaptatif au projet |
| **Agents** | Implicites via skills | 21+ agents explicites |
| **Help** | Commandes manuelles | `/bmad-help` intelligent |
| **Dépendances** | Superpowers (à supprimer) | Aucune externe |
| **Installation** | curl + bash | npx simple |
| **Extensibilité** | Skills | Modules officiels |
| **Multi-agents** | Non | Party Mode |

---

## 🚀 Patterns clés à intégrer dans ACT

### 1. Agents explicites
- Donner un nom et une personnalité à chaque phase
- Ex: "Discovery Danny", "Architect Alex"

### 2. Help intelligent
- `/act-help` contextuel qui guide
- Sait où on en est, propose la suite

### 3. Scale-adaptive
- Détecter la complexité du projet
- Adapter les phases requises

### 4. Quick vs Full paths
- Quick : `/quick-spec → /dev → /review`
- Full : toutes les phases

### 5. Multi-perspectives (Party mode)
- Débat entre agents
- Ex: Dev vs Architect sur une décision

### 6. Zero dependencies
- Supprimer Superpowers
- Tout natif

---

## 📁 Prochaines recherches

- [ ] Analyser en détail les agents BMAD
- [ ] Étudier la structure des .cursorrules populaires
- [ ] Comparer les workflows BMAD vs ACT
- [ ] Identifier les patterns MCP pour extensibilité

---

*Document généré le 2026-01-31 par Archi*
