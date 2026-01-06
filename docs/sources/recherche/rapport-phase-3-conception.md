# Rapport de Recherche : Phase 3 - Conception
## "Designer & Architecturer"

**Version** : 1.0
**Date** : 29 décembre 2025
**Auteur** : Claude (Deep Research - OPUS 4.5)
**Statut** : Final

---

## Table des matières

1. [Introduction](#1-introduction)
2. [Design Thinking et Méthodologies](#2-design-thinking-et-méthodologies)
3. [Architecture de l'Information](#3-architecture-de-linformation)
4. [UX Design - Parcours Utilisateur](#4-ux-design---parcours-utilisateur)
5. [UI Design - Interface Utilisateur](#5-ui-design---interface-utilisateur)
6. [Prototypage et Validation](#6-prototypage-et-validation)
7. [Architecture Technique](#7-architecture-technique)
8. [Documentation de Conception](#8-documentation-de-conception)
9. [Questions Transversales](#9-questions-transversales)
10. [Métiers et Compétences](#10-métiers-et-compétences)
11. [Checklist de Phase Conception](#11-checklist-de-phase-conception)
12. [Red Flags et Anti-Patterns](#12-red-flags-et-anti-patterns)
13. [Quick Reference](#13-quick-reference)
14. [Glossaire](#14-glossaire)
15. [Bibliographie et Sources](#15-bibliographie-et-sources)

---

## Executive Summary

La phase de Conception constitue le pont crucial entre la stratégie et le développement. Elle transforme les insights utilisateur et les objectifs business en solutions tangibles et testables avant l'investissement massif du développement.

**Points clés de cette phase :**

1. **Méthodologies convergentes** : Le Design Thinking (IDEO/Stanford), le Double Diamond (Design Council UK) et le Design Sprint (Google Ventures) partagent une philosophie commune : diverger pour explorer, converger pour décider.

2. **L'architecture de l'information (IA)** est le squelette invisible de tout produit digital. Les méthodes de card sorting et tree testing permettent de valider la structure informationnelle avant la conception visuelle.

3. **UX et UI sont distincts mais interdépendants**. L'UX définit le "quoi" et le "pourquoi", l'UI définit le "comment".

4. **Le prototypage est un investissement, pas un coût**. Un prototype testé avec 5 utilisateurs révèle 85% des problèmes d'utilisabilité.

5. **L'architecture technique doit suivre les besoins, pas les modes**. 61% des entreprises ont adopté les microservices, mais 29% sont revenues au monolith.

6. **L'accessibilité n'est plus optionnelle**. WCAG 2.2 (ISO/IEC 40500:2025) est le standard légal.

**Livrables attendus :**
- Wireframes validés et mockups haute fidélité
- Design system (tokens et composants de base)
- Prototype interactif testé
- Documentation d'architecture technique (ADRs)
- Spécifications API (OpenAPI/Swagger)
- Handoff design-développement préparé

---

## 1. Introduction

### 1.1 Objectif de cette phase

La phase de Conception vise à **matérialiser la vision stratégique** en solutions concrètes, testables et développables. Elle répond à trois questions fondamentales :

1. **Comment l'utilisateur va-t-il interagir avec le produit ?** (UX/UI)
2. **Comment l'information sera-t-elle organisée ?** (Architecture de l'information)
3. **Comment le système sera-t-il construit ?** (Architecture technique)

### 1.2 Place dans le cycle de vie projet

```
Discovery → Stratégie → [CONCEPTION] → Développement → Qualité → Lancement → Croissance
                              ↑
                        PHASE ACTUELLE
```

### 1.3 Prérequis (outputs de Stratégie)

| Élément | Source | Criticité |
|---------|--------|-----------|
| Personas validés | Phase Discovery | Critique |
| Value Proposition Canvas | Phase Stratégie | Critique |
| User Stories priorisées | Phase Stratégie | Critique |
| Contraintes techniques identifiées | Phase Stratégie | Important |
| Budget et timeline | Phase Stratégie | Important |

### 1.4 Outputs attendus (inputs pour Développement)

| Livrable | Responsable | Consommateur |
|----------|-------------|--------------|
| Wireframes low/mid-fi | UX Designer | UI Designer, Développeurs |
| Mockups high-fi | UI Designer | Développeurs Frontend |
| Design System | Product Designer | Développeurs, QA |
| Prototype interactif | UX/UI Designer | Stakeholders, Utilisateurs |
| Documentation architecture | Solutions Architect | Développeurs Backend |
| Spécifications API | Technical Architect | Développeurs |

---

## 2. Design Thinking et Méthodologies

### 2.1 Design Thinking (IDEO/Stanford d.school)

#### Niveau 1 - Vulgarisation

Le Design Thinking est une **méthode de résolution de problèmes centrée sur l'humain**. Imaginez un médecin qui, au lieu de simplement prescrire un médicament, cherche d'abord à comprendre profondément votre mode de vie, vos peurs et vos habitudes avant de proposer un traitement.

#### Niveau 2 - Approfondissement Expert

**Origine et historique :**
Le terme "Design Thinking" a été popularisé par David Kelley et Tim Brown d'IDEO dans les années 1990. La Stanford d.school, fondée en 2005, a formalisé le processus en 5 phases.

**Les 5 phases :**

1. **Empathize (Empathie)** : Immersion dans le contexte utilisateur
   - Méthodes : interviews, observation terrain, shadowing
   - Output : empathy maps, verbatims, insights bruts

2. **Define (Définition)** : Synthèse des insights en problème actionnable
   - Méthodes : affinity diagrams, point of view statements
   - Output : "How Might We" (HMW) statements

3. **Ideate (Idéation)** : Génération massive d'idées
   - Méthodes : brainstorming, Crazy 8s, SCAMPER
   - Output : idées priorisées, concepts initiaux

4. **Prototype (Prototypage)** : Matérialisation rapide des concepts
   - Méthodes : paper prototypes, wireframes, mockups
   - Output : prototype testable

5. **Test (Test)** : Validation avec utilisateurs réels
   - Méthodes : usability testing, A/B testing
   - Output : feedback actionnable, itérations

**Variantes :**
- **IDEO Human-Centered Design** : Focus sur les contextes émergents
- **IBM Enterprise Design Thinking** : Adaptation aux grandes organisations
- **Google Design Sprint** : Version compressée sur 5 jours

#### Niveau 3 - Application Pratique

**Anti-patterns :**
- ❌ Sauter la phase Empathize ("on connaît déjà nos utilisateurs")
- ❌ Limiter l'idéation aux 3 premières idées venues
- ❌ Prototyper en haute fidélité avant validation du concept
- ❌ Tester avec des collègues au lieu d'utilisateurs réels

---

### 2.2 Double Diamond (Design Council UK)

#### Niveau 1 - Vulgarisation

Le Double Diamond représente visuellement le processus de design comme **deux losanges successifs**. Le premier losange aide à comprendre le vrai problème, le second à trouver la bonne solution.

#### Niveau 2 - Approfondissement Expert

**Origine :**
Formalisé par le [Design Council UK](https://www.designcouncil.org.uk/our-resources/the-double-diamond/) en 2005, basé sur le modèle de divergence-convergence de Béla H. Bánáthy (1996).

**Les 4 phases :**

**Premier diamant : Espace problème**
1. **Discover** : Phase divergente - Recherche utilisateur, benchmark
2. **Define** : Phase convergente - Synthèse, formulation du problème

**Second diamant : Espace solution**
3. **Develop** : Phase divergente - Idéation, prototypage
4. **Deliver** : Phase convergente - Sélection, implémentation

**Différences avec Design Thinking :**
| Aspect | Design Thinking | Double Diamond |
|--------|-----------------|----------------|
| Origine | IDEO/Stanford (USA) | Design Council (UK) |
| Structure | 5 phases | 4 phases |
| Focus | Processus itératif | Visualisation divergence/convergence |

---

### 2.3 Human-Centered Design (HCD) - ISO 9241-210

#### Niveau 1 - Vulgarisation

Le Human-Centered Design est l'approche officielle et normalisée pour concevoir des systèmes qui **mettent l'humain au centre**.

#### Niveau 2 - Approfondissement Expert

**Cadre normatif - ISO 9241-210:2019 :**

1. Comprendre et spécifier le contexte d'utilisation
2. Spécifier les exigences utilisateur
3. Produire des solutions de conception
4. Évaluer les conceptions

**Certifications associées :**
- **CPUX-F** (Foundation)
- **CPUX-UR** (User Requirements Engineering)
- **CPUX-DS** (Design of User Interfaces)
- **CPUX-UT** (Usability Testing and Evaluation)

---

### 2.4 Lean UX

#### Niveau 1 - Vulgarisation

Lean UX applique les principes du Lean Startup au design : **construire le minimum nécessaire, tester rapidement, apprendre et itérer**.

#### Niveau 2 - Approfondissement Expert

**Origine :**
Créé par [Jeff Gothelf et Josh Seiden](https://leanuxbook.com/), 3ème édition 2021.

**Principes fondamentaux :**
1. Cross-functional teams
2. Small, dedicated teams
3. Progress = outcomes, not outputs
4. Problem-focused teams
5. Remove waste
6. Small batch size
7. Continuous discovery
8. GOOB (Getting Out Of the Building)
9. Externalizing work
10. Making over analysis
11. Permission to fail
12. Getting out of the deliverables business

**Le Lean UX Canvas :**
1. Business Problem
2. Business Outcomes
3. Users
4. User Outcomes & Benefits
5. Solutions
6. Hypotheses
7. What's the most important thing we need to learn first?
8. What's the least amount of work to learn the next most important thing?

---

### 2.5 Design Sprint (Google Ventures)

#### Niveau 1 - Vulgarisation

Le Design Sprint est un **processus de 5 jours** pour répondre à des questions critiques via le design, le prototypage et les tests utilisateurs.

#### Niveau 2 - Approfondissement Expert

**Origine :**
[Jake Knapp](https://www.thesprintbook.com/) a créé le Design Sprint chez Google en 2010. Perfectionné chez Google Ventures avec plus de 200 sprints.

**Structure jour par jour :**

| Jour | Focus | Activités clés |
|------|-------|----------------|
| **Lundi** | Map | Définir le défi, cartographier le parcours |
| **Mardi** | Sketch | Revoir solutions existantes, Crazy 8s |
| **Mercredi** | Decide | Critique, vote, storyboard |
| **Jeudi** | Prototype | Construire un prototype réaliste |
| **Vendredi** | Test | 5 interviews utilisateurs |

**Rôles requis :**
- **Decider** : Personne ayant l'autorité de trancher
- **Facilitator** : Guide le processus
- **Team** : 5-7 personnes max, multidisciplinaire

**Utilisé par :** Slack, Airbnb, LEGO, Google, IDEO, McKinsey

---

## 3. Architecture de l'Information

### 3.1 Principes fondamentaux (Rosenfeld & Morville)

#### Niveau 1 - Vulgarisation

L'architecture de l'information (IA), c'est **organiser et structurer le contenu** pour qu'il soit trouvable et compréhensible. C'est comme organiser une bibliothèque.

#### Niveau 2 - Approfondissement Expert

**Ouvrage de référence :**
"[Information Architecture: For the Web and Beyond](https://www.oreilly.com/library/view/information-architecture-4th/9781491913529/)" de Rosenfeld, Morville et Arango (4ème édition, 2015), surnommé "Polar Bear Book".

**Les 4 piliers de l'IA :**

1. **Organisation** : Comment structurer l'information
   - Schémas exacts (alphabétique, chronologique, géographique)
   - Schémas ambigus (par sujet, par tâche, par audience)

2. **Labeling** (Étiquetage) : Comment nommer les choses

3. **Navigation** : Comment se déplacer
   - Navigation globale, locale, contextuelle

4. **Search** (Recherche) : Comment trouver

---

### 3.2 Card Sorting

#### Niveau 1 - Vulgarisation

Le card sorting consiste à **faire trier des cartes par des utilisateurs** pour comprendre comment ils organisent mentalement l'information.

#### Niveau 2 - Approfondissement Expert

**Définition [Nielsen Norman Group](https://www.nngroup.com/articles/card-sorting-definition/) :**
Méthode de recherche UX pour découvrir les modèles mentaux des utilisateurs.

**Types de card sorting :**

| Type | Description | Usage |
|------|-------------|-------|
| **Ouvert** | Participants créent leurs propres catégories | Exploration initiale |
| **Fermé** | Catégories pré-définies | Validation structure |
| **Hybride** | Mix des deux | Équilibre exploration/validation |

**Best practices :**
- 30-50 cartes maximum
- 15-30 participants
- Analyse de similarité

**Outils :** Optimal Workshop, UserZoom, UXMetrics, Maze

---

### 3.3 Tree Testing

#### Niveau 1 - Vulgarisation

Le tree testing vérifie si les utilisateurs **trouvent ce qu'ils cherchent** dans la structure proposée.

#### Niveau 2 - Approfondissement Expert

**Définition [NN/g](https://www.nngroup.com/articles/tree-testing/) :**
Évalue la findability des ressources sur des versions textuelles du site sans design.

**Métriques clés :**
- **Task success rate** : % trouvant la bonne réponse
- **Directness** : % sans backtracking
- **Time to complete** : Temps moyen
- **Path analysis** : Chemins empruntés

**Séquence optimale :**
1. Card sort ouvert → Découverte
2. Synthèse → Proposition de structure
3. Tree test → Validation
4. Itération → Ajustements

---

### 3.4 Taxonomies et Navigation

#### Niveau 1 - Vulgarisation

Une taxonomie est un **système de classification**. Pour un e-commerce, c'est l'arbre des catégories.

#### Niveau 2 - Approfondissement Expert

**Types de taxonomies :**
- **Hiérarchique** : Structure en arbre
- **Facettée** : Classifications multiples
- **Réseau** : Relations non-hiérarchiques (tags)

**Patterns de navigation :**

| Pattern | Description |
|---------|-------------|
| **Global navigation** | Header de site |
| **Local navigation** | Sidebar, sous-menus |
| **Faceted navigation** | Filtres e-commerce |
| **Breadcrumbs** | Chemin parcouru |
| **Mega menus** | Sites à large catalogue |

**Best practices e-commerce :**
- Profondeur max : 3-4 niveaux
- Niveau 1 : 5-9 items (règle de Miller 7±2)
- Labels orientés utilisateur

---

## 4. UX Design - Parcours Utilisateur

### 4.1 User Journey Mapping

#### Niveau 1 - Vulgarisation

Un User Journey Map est une **visualisation chronologique** de l'expérience utilisateur avec votre produit.

#### Niveau 2 - Approfondissement Expert

**Définition [NN/g](https://www.nngroup.com/articles/journey-mapping-101/) :**
Visualisation du processus qu'une personne traverse pour accomplir un objectif.

**Composants :**

| Composant | Description |
|-----------|-------------|
| **Persona** | L'utilisateur représenté |
| **Scenario** | La situation et l'objectif |
| **Phases** | Les grandes étapes |
| **Actions** | Ce que fait l'utilisateur |
| **Touchpoints** | Points de contact |
| **Emotions** | Courbe émotionnelle |
| **Pain points** | Points de friction |
| **Opportunities** | Améliorations possibles |

**Types :**
- Current state, Future state, Day in the life, Blueprint

**Outils :** Miro, Mural, Smaply, UXPressia

---

### 4.2 Service Blueprint

#### Niveau 1 - Vulgarisation

Un Service Blueprint étend le journey map en montrant **ce qui se passe en coulisses**.

#### Niveau 2 - Approfondissement Expert

**Définition [NN/g](https://www.nngroup.com/articles/service-blueprinting-faq/) :**
Visualise le processus de livraison depuis les perspectives client ET fournisseur.

**Couches :**
```
EVIDENCE PHYSIQUE
ACTIONS CLIENT
─── LIGNE D'INTERACTION ───
FRONTSTAGE (actions visibles)
─── LIGNE DE VISIBILITÉ ───
BACKSTAGE (actions invisibles)
─── LIGNE D'INTERACTION INTERNE ───
PROCESSUS DE SUPPORT
```

---

### 4.3 User Flows et Task Analysis

#### Niveau 1 - Vulgarisation

Un User Flow est un **diagramme montrant les chemins possibles** dans une application.

#### Niveau 2 - Approfondissement Expert

**Notations :**
| Symbole | Signification |
|---------|---------------|
| Rectangle | Page/Écran |
| Losange | Décision |
| Flèche | Transition |

**Task Analysis types :**
- **HTA** (Hierarchical Task Analysis)
- **CTA** (Cognitive Task Analysis)
- **GOMS** (Goals, Operators, Methods, Selection)

---

### 4.4 Use Cases vs User Stories

| Aspect | Use Case | User Story |
|--------|----------|------------|
| Origine | UML, années 90 | Agile, années 2000 |
| Formalisme | Élevé | Léger |
| Focus | Interaction système | Besoin utilisateur |

**User Story format :**
```
En tant que [persona]
Je veux [action]
Afin de [bénéfice]
```

---

## 5. UI Design - Interface Utilisateur

### 5.1 Wireframing

#### Niveau 1 - Vulgarisation

Un wireframe est un **schéma simplifié** d'une page montrant la structure sans les détails visuels.

#### Niveau 2 - Approfondissement Expert

**Niveaux de fidélité :**

| Niveau | Description | Usage | Outils |
|--------|-------------|-------|--------|
| **Low-fi** | Croquis papier | Exploration rapide | Papier, Balsamiq |
| **Mid-fi** | Structure précise, gris | Validation layout | Figma, Whimsical |
| **High-fi** | Design quasi-final | Design handoff | Figma, Adobe XD |

**Best practices :**
- Commencer low-fi pour éviter l'attachement prématuré
- Tester la structure avant d'investir dans le visuel
- Annoter les comportements interactifs

---

### 5.2 Design Systems

#### Niveau 1 - Vulgarisation

Un Design System est une **boîte à outils partagée** contenant tous les éléments visuels et règles d'un produit.

#### Niveau 2 - Approfondissement Expert

**Composants d'un design system :**

| Couche | Contenu |
|--------|---------|
| **Foundations** | Couleurs, typographie, espacement |
| **Design Tokens** | Variables partagées (CSS, JSON) |
| **Components** | Boutons, inputs, cards, modals |
| **Patterns** | Combinaisons de composants |
| **Guidelines** | Règles d'utilisation, accessibilité |

**Design systems de référence :**

| Système | Entreprise | Forces |
|---------|------------|--------|
| [Material Design](https://m3.material.io/) | Google | Complet, multiplateforme |
| [Carbon](https://carbondesignsystem.com/) | IBM | Accessibilité, enterprise |
| [Polaris](https://polaris.shopify.com/) | Shopify | E-commerce |
| [Ant Design](https://ant.design/) | Ant Financial | React, enterprise |
| [Fluent](https://fluent2.microsoft.design/) | Microsoft | Cross-platform |

---

### 5.3 Atomic Design

#### Niveau 1 - Vulgarisation

Atomic Design organise les éléments d'interface comme en chimie : **atomes → molécules → organismes → templates → pages**.

#### Niveau 2 - Approfondissement Expert

**Origine :**
[Brad Frost](https://atomicdesign.bradfrost.com/) (2013), livre "Atomic Design" (2017).

**Les 5 niveaux :**

1. **Atoms** : Boutons, inputs, labels, icons
2. **Molecules** : Groupes d'atomes (search form = input + button)
3. **Organisms** : Sections (header = logo + nav + search)
4. **Templates** : Agencement sans contenu réel
5. **Pages** : Templates avec contenu réel

---

### 5.4 Accessibilité (A11Y) - WCAG 2.2

#### Niveau 1 - Vulgarisation

L'accessibilité web garantit que **tout le monde peut utiliser votre site**, y compris les personnes avec des handicaps.

#### Niveau 2 - Approfondissement Expert

**Cadre normatif :**
[WCAG 2.2](https://www.w3.org/TR/WCAG22/) (5 octobre 2023), ISO/IEC 40500:2025.

**Les 3 niveaux :**

| Niveau | Description | Exigence |
|--------|-------------|----------|
| **A** | Minimum | Rarement suffisant |
| **AA** | Standard | Requis légalement |
| **AAA** | Maximum | Recommandé |

**Les 4 principes POUR :**
1. **Perceivable** : Information perceptible
2. **Operable** : Interface navigable
3. **Understandable** : Compréhensible
4. **Robust** : Interprétable par technologies d'assistance

**Nouveautés WCAG 2.2 :**
- Focus Not Obscured (AA)
- Target Size – Minimum 24x24px (AA)
- Accessible Authentication (AA)

**Outils de test :** Lighthouse, axe DevTools, WAVE, NVDA, VoiceOver

**Checklist minimum AA :**
- [ ] Contraste ≥ 4.5:1
- [ ] Navigation clavier complète
- [ ] Focus visible
- [ ] Alternatives textuelles (alt)
- [ ] Labels de formulaire
- [ ] Messages d'erreur explicites

---

### 5.5 Responsive Design

#### Niveau 1 - Vulgarisation

Le responsive design adapte l'interface à **toutes les tailles d'écran**. Mobile-first signifie concevoir d'abord pour mobile.

#### Niveau 2 - Approfondissement Expert

**Breakpoints standards (2024) :**
```css
/* Mobile first */
@media (min-width: 640px) { /* Tablet */ }
@media (min-width: 768px) { /* Tablet landscape */ }
@media (min-width: 1024px) { /* Desktop small */ }
@media (min-width: 1280px) { /* Desktop large */ }
```

**Mobile UX :**
- Touch targets : min 44x44px (iOS), 48x48dp (Android)
- Éviter hover states

---

## 6. Prototypage et Validation

### 6.1 Types de prototypes

| Niveau | Visuel | Interactivité | Usage |
|--------|--------|---------------|-------|
| **Paper** | Croquis | Simulée | Idéation |
| **Lo-fi** | Boîtes grises | Liens basiques | Structure |
| **Mid-fi** | Gris + typo | Clics | Validation UX |
| **Hi-fi** | Pixel-perfect | Animations | Tests, handoff |
| **Coded** | Code réel | Fonctionnel | Tests techniques |

**Outils (2024) :**
- Design + Prototype : Figma, Sketch, Adobe XD
- Prototype avancé : Axure, Principle, ProtoPie
- Prototype codé : Framer, Webflow, Storybook

---

### 6.2 Usability Testing

#### Niveau 1 - Vulgarisation

L'usability testing consiste à **observer de vraies personnes utiliser votre produit**. 5 utilisateurs révèlent 85% des problèmes.

#### Niveau 2 - Approfondissement Expert

**Types de tests :**

| Type | Description | Participants |
|------|-------------|--------------|
| [Modéré remote](https://www.nngroup.com/articles/remote-usability-tests/) | Facilitateur en visio | 5-8 |
| Unmodéré remote | Tâches auto-guidées | 20-50 |
| Guerrilla | Tests rapides informels | 5+ |

**Think-Aloud Protocol :**
Le participant verbalise ses pensées pendant l'utilisation.

**Métriques :**
- Task success rate
- Time on task
- Error rate
- SUS Score (/100)
- NPS

**Anti-patterns :**
- ❌ Tester avec collègues
- ❌ Aider quand le participant bloque
- ❌ Questions orientées

---

### 6.3 Heuristic Evaluation (10 Heuristiques de Nielsen)

**Origine :**
[Jakob Nielsen](https://www.nngroup.com/articles/ten-usability-heuristics/) (1990, raffinées 1994).

**Les 10 heuristiques :**

| # | Heuristique | Mot-clé |
|---|-------------|---------|
| 1 | Visibility of system status | Feedback |
| 2 | Match with real world | Langage utilisateur |
| 3 | User control and freedom | Undo/Exit |
| 4 | Consistency and standards | Conventions |
| 5 | Error prevention | Prévention |
| 6 | Recognition rather than recall | Visible |
| 7 | Flexibility and efficiency | Raccourcis |
| 8 | Aesthetic and minimalist design | Essentiel |
| 9 | Help recover from errors | Messages clairs |
| 10 | Help and documentation | Aide contextuelle |

**Échelle de sévérité :**
- 0 : Pas un problème
- 1 : Cosmétique
- 2 : Mineur
- 3 : Majeur
- 4 : Catastrophe

---

## 7. Architecture Technique

### 7.1 Architecture Patterns

#### Niveau 1 - Vulgarisation

L'architecture technique définit **comment le système sera construit** : quels composants, comment ils communiquent.

#### Niveau 2 - Approfondissement Expert

**1. Monolith**
- Application unique déployée comme un tout
- ✅ Simplicité, debugging facile, performance
- ❌ Scalabilité limitée, déploiement risqué

**2. Microservices**
- Services indépendants avec responsabilité unique
- ✅ Scalabilité granulaire, équipes autonomes
- ❌ Complexité opérationnelle, latence réseau

**3. Serverless**
- Functions as a Service (FaaS)
- ✅ Pas d'ops, scalabilité automatique
- ❌ Cold starts, vendor lock-in

**4. JAMstack**
- JavaScript, APIs, Markup
- ✅ Performance, sécurité, coût faible
- ❌ Build time, contenu dynamique limité

**Données 2024 ([O'Reilly](https://www.oreilly.com/), [AWS](https://aws.amazon.com/compare/the-difference-between-monolithic-and-microservices-architecture/)) :**
- 61% ont adopté microservices
- 29% sont revenus au monolith

**Matrice de décision :**

| Critère | Monolith | Microservices | Serverless |
|---------|----------|---------------|------------|
| Taille équipe | < 10 | > 10 | Toutes |
| Complexité | Simple | Complexe | Moyenne |
| Time-to-market | Rapide | Lent | Moyen |

---

### 7.2 Frontend Architecture

| Pattern | Rendu | Usage |
|---------|-------|-------|
| **MPA** | Serveur | SEO critique |
| **SPA** | Client | Apps complexes |
| **SSR** | Serveur + hydration | E-commerce |
| **SSG** | Build time | Blogs, docs |
| **ISR** | Build + revalidation | Grand catalogue |

**Frameworks (2024) :**
- **Next.js** : React, SSR/SSG/ISR
- **Nuxt** : Vue, SSR/SSG
- **SvelteKit** : Performance, DX
- **Astro** : Content sites

---

### 7.3 API Design

**REST vs GraphQL :**

| Aspect | REST | GraphQL |
|--------|------|---------|
| Endpoints | Multiples | Un seul |
| Over-fetching | Fréquent | Évité |
| Caching | HTTP natif | Custom |
| Learning curve | Faible | Modérée |

**Documentation :**
- REST → [OpenAPI/Swagger](https://swagger.io/)
- GraphQL → Schema introspection

---

### 7.4 Database Design

**SQL vs NoSQL :**

| Type | Exemples | Usage |
|------|----------|-------|
| **SQL** | PostgreSQL, MySQL | Transactions, relations |
| **Document** | MongoDB, Firestore | Flexibilité schéma |
| **Key-Value** | Redis, DynamoDB | Cache, sessions |
| **Graph** | Neo4j | Social, recommendations |

**Recommandation e-commerce :** PostgreSQL (ACID pour commandes)

---

### 7.5 Cloud et Scalabilité

**Providers :**
| Provider | Forces |
|----------|--------|
| **AWS** | Leader, complet |
| **GCP** | Data/ML, Kubernetes |
| **Azure** | Enterprise, Microsoft |
| **Vercel** | Frontend, DX |
| **Cloudflare** | Edge, performance |

**Patterns :**
- Load Balancing, CDN, Database replication
- Caching (Redis), Queue (RabbitMQ, SQS)
- Auto-scaling

**OWASP Top 10 (2021) :**
1. Broken Access Control
2. Cryptographic Failures
3. Injection
4. Insecure Design
5. Security Misconfiguration

---

## 8. Documentation de Conception

### 8.1 Technical Specification Document

**Structure type :**
1. Overview & Goals
2. Background & Context
3. Technical Requirements
4. System Architecture
5. API Specifications
6. Data Model
7. Security Considerations
8. Performance Requirements
9. Testing Strategy
10. Deployment Plan

### 8.2 Architecture Decision Records (ADR)

**Format :**
```markdown
# ADR-001: Choix de PostgreSQL

## Status
Accepted

## Context
Nous devons choisir une base de données.

## Decision
Nous utiliserons PostgreSQL.

## Consequences
- ✅ ACID compliance, support JSONB
- ❌ Pas de scaling horizontal natif
```

### 8.3 Design Handoff

**Éléments à transférer :**
- Figma files organisés
- Design tokens (JSON/CSS)
- Specs d'interaction
- Assets exportés
- Documentation des comportements
- Cas limites documentés

---

## 9. Questions Transversales

### 9.1 Comment mesurer la qualité d'un design avant développement ?

**Métriques quantitatives :**
- Task success rate : >80% cible
- SUS Score : >68 acceptable, >80 bon
- Findability (tree testing) : >70%

### 9.2 Design par comité : comment éviter les écueils ?

**Solutions :**
- Decider identifié
- Critères objectifs (data/tests)
- Timeboxing des décisions
- Design critique structuré

### 9.3 Quand impliquer les développeurs ?

- Dès le début pour contraintes techniques
- Pendant wireframing pour faisabilité
- Review des interactions complexes
- Avant handoff pour validation

### 9.4 Handoff design → dev efficace

- Checklist de handoff systématique
- Dev mode Figma activé
- Design tokens partagés
- Sessions de handoff (pas juste envoi de lien)
- Designer disponible pendant dev

### 9.5 Niveau de fidélité par contexte

| Contexte | Fidélité |
|----------|----------|
| Startup early stage | Lo-fi |
| Feature existante | Mid-fi |
| Nouveau produit mature | Hi-fi |
| Tests utilisateurs | Mid-fi minimum |

### 9.6 Architecture pour e-commerce

**Facteurs clés :**
- Trafic <10K/jour → Monolith suffisant
- Équipe <5 devs → Monolith
- Catalogue >100K → Headless + ISR
- SEO critique → SSR/SSG

**Stack type 2024 :**
- Frontend : Next.js
- Backend : Node.js / Python
- Database : PostgreSQL + Redis
- Search : Algolia / Elasticsearch
- CDN : Cloudflare
- Paiement : Stripe

---

## 10. Métiers et Compétences

### 10.1 UX Designer

**Responsabilités :** User flows, wireframes, tests utilisateurs, architecture de l'information

**Compétences :** Recherche utilisateur, wireframing (Figma), usability testing

**Certifications :** Nielsen Norman UX Certificate, Google UX Design, CPUX

**Salaire (2024-2025) :**
- France : 35-70K€
- USA : $80-160K

### 10.2 UI Designer

**Responsabilités :** Mockups haute fidélité, design system, style guides

**Compétences :** Visual design, Figma/Sketch, design systems, HTML/CSS basics

**Salaire :**
- France : 35-75K€
- USA : $75-150K

### 10.3 Product Designer

**Rôle hybride UX + UI + stratégie produit**

**Salaire :**
- France : 45-90K€
- USA : $100-200K

### 10.4 Solutions Architect

**Responsabilités :** Choix d'architecture, sélection technologies, documentation technique

**Certifications :** AWS Solutions Architect, Google Cloud Professional, Azure Expert, TOGAF

**Salaire :**
- France : 60-90K€
- USA : $140-200K+

---

## 11. Checklist de Phase Conception

### UX/UI
- [ ] User flows documentés
- [ ] Architecture de l'information validée
- [ ] Wireframes validés
- [ ] Mockups haute fidélité approuvés
- [ ] Prototype interactif créé
- [ ] Usability tests conduits (min 5 utilisateurs)
- [ ] Design system initié
- [ ] Accessibilité vérifiée (WCAG AA)
- [ ] Responsive design vérifié
- [ ] Design handoff préparé

### Architecture
- [ ] Architecture technique choisie et documentée
- [ ] ADRs rédigés
- [ ] API design documenté (OpenAPI)
- [ ] Database schema défini
- [ ] Infrastructure planifiée
- [ ] Security considerations documentées

---

## 12. Red Flags et Anti-Patterns

| Signal d'alerte | Action |
|-----------------|--------|
| Pas de tests utilisateur | Min 5 tests guerrilla |
| Design non responsive | Revoir mobile-first |
| Architecture sur-dimensionnée | Start simple |
| Wireframes sautés | Lo-fi obligatoire |
| Stakeholders absents | Invitations formelles |
| Développeurs exclus | Sessions pair design |
| Pas de documentation | ADRs courts mais systématiques |
| Accessibilité "plus tard" | A11y dès le wireframe |

---

## 13. Quick Reference

### Frameworks Design

| Framework | Source | Durée |
|-----------|--------|-------|
| Design Thinking | IDEO/Stanford | 2-4 semaines |
| Double Diamond | Design Council UK | Variable |
| Design Sprint | Google Ventures | 5 jours |
| Lean UX | Gothelf/Seiden | Continu |

### Architecture Matrix

| Critère | Monolith | Microservices | Serverless |
|---------|----------|---------------|------------|
| Complexité | Faible | Élevée | Moyenne |
| Scalabilité | Limitée | Excellente | Excellente |
| Coût ops | Faible | Élevé | Variable |
| Time-to-market | Rapide | Lent | Moyen |

---

## 14. Glossaire

| Terme | Définition |
|-------|------------|
| **A11Y** | Accessibility |
| **ADR** | Architecture Decision Record |
| **ARIA** | Accessible Rich Internet Applications |
| **CDN** | Content Delivery Network |
| **CTA** | Call To Action |
| **Design Tokens** | Variables de design partagées |
| **HMW** | How Might We |
| **IA** | Information Architecture |
| **ISR** | Incremental Static Regeneration |
| **MVP** | Minimum Viable Product |
| **NPS** | Net Promoter Score |
| **SPA** | Single Page Application |
| **SSG** | Static Site Generation |
| **SSR** | Server-Side Rendering |
| **SUS** | System Usability Scale |
| **UI** | User Interface |
| **UX** | User Experience |
| **WCAG** | Web Content Accessibility Guidelines |

---

## 15. Bibliographie et Sources

### Livres de référence

- Gothelf, J., & Seiden, J. (2021). *Lean UX* (3rd ed.). O'Reilly Media.
- Knapp, J., Zeratsky, J., & Kowitz, B. (2016). *Sprint*. Simon & Schuster.
- Frost, B. (2016). *Atomic Design*.
- Rosenfeld, L., Morville, P., & Arango, J. (2015). *Information Architecture* (4th ed.). O'Reilly.
- Krug, S. (2014). *Don't Make Me Think* (3rd ed.). New Riders.

### Documentation officielle

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) - W3C
- [Design Council - Double Diamond](https://www.designcouncil.org.uk/our-resources/the-double-diamond/)
- [Nielsen Norman Group - 10 Heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/)
- [Atomic Design](https://atomicdesign.bradfrost.com/)
- [The Sprint Book](https://www.thesprintbook.com/)
- [Lean UX Book](https://leanuxbook.com/)

### Design Systems

- [Material Design](https://m3.material.io/)
- [Carbon](https://carbondesignsystem.com/)
- [Polaris](https://polaris.shopify.com/)
- [Figma Examples](https://www.figma.com/resource-library/design-system-examples/)

### Architecture

- [AWS - Monolith vs Microservices](https://aws.amazon.com/compare/the-difference-between-monolithic-and-microservices-architecture/)
- [AWS - GraphQL vs REST](https://aws.amazon.com/compare/the-difference-between-graphql-and-rest/)
- [OpenAPI/Swagger](https://swagger.io/)

---

## Notes et Limitations

### Aspects non couverts
- Design multilingue/i18n
- Design pour IoT/wearables
- Voice UI design
- AR/VR design

### Points à vérifier [À VÉRIFIER]
- Évolution des salaires : confirmer annuellement
- Tendances frameworks : évolution rapide
- Réglementations accessibilité locales

---

**Fin du rapport**
