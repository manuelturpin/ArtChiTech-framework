# Rapport de Recherche : Phase 4 - Développement
## "Construire & Implémenter"

**Version** : 1.0
**Date** : 29 décembre 2024
**Auteur** : Claude (Deep Research - OPUS 4.5)
**Statut** : Final

---

## Table des matières

1. [Executive Summary](#executive-summary)
2. [Introduction](#1-introduction)
3. [Méthodologies de Développement](#2-méthodologies-de-développement)
   - 2.1 Agile Manifesto et Principes
   - 2.2 Scrum Framework
   - 2.3 Kanban Method
   - 2.4 Scrumban
   - 2.5 Extreme Programming (XP)
   - 2.6 SAFe (Scaled Agile Framework)
   - 2.7 Lean Software Development
   - 2.8 Shape Up
4. [Gestion du Backlog et User Stories](#3-gestion-du-backlog-et-user-stories)
5. [Pratiques d'Ingénierie Logicielle](#4-pratiques-dingénierie-logicielle)
6. [Gestion de Version et Collaboration](#5-gestion-de-version-et-collaboration)
7. [CI/CD et DevOps](#6-cicd-et-devops)
8. [Testing pendant le Développement](#7-testing-pendant-le-développement)
9. [Architecture et Patterns](#8-architecture-et-patterns)
10. [Collaboration Équipe](#9-collaboration-équipe)
11. [Questions Transversales](#10-questions-transversales)
12. [Métiers et Compétences](#11-métiers-et-compétences)
13. [Checklist de Phase Développement](#12-checklist-de-phase-développement)
14. [Red Flags et Anti-Patterns](#13-red-flags-et-anti-patterns)
15. [Quick Reference](#14-quick-reference)
16. [Glossaire](#glossaire)
17. [Bibliographie et Sources](#bibliographie-et-sources)
18. [Notes et Limitations](#notes-et-limitations)

---

## Executive Summary

La phase de Développement représente le cœur opérationnel de tout projet logiciel. C'est le moment où les spécifications et designs de la phase Conception se transforment en code fonctionnel, testable et déployable. Cette phase ne se limite pas à "écrire du code" — elle englobe l'orchestration des pratiques d'ingénierie, la gestion des flux de travail collaboratifs, et l'établissement d'une discipline de qualité continue.

**Points clés de ce rapport :**

**Méthodologies Agiles** : Le paysage méthodologique s'est considérablement diversifié depuis le Manifeste Agile de 2001. Scrum reste le framework le plus adopté (58% des équipes selon les rapports State of Agile), mais Kanban gagne en popularité pour les équipes de maintenance et ops. Les approches hybrides comme Scrumban et les alternatives comme Shape Up (Basecamp) offrent des réponses adaptées à des contextes spécifiques. **[À VÉRIFIER : statistiques exactes du dernier State of Agile Report]**

**Pratiques d'ingénierie** : Les principes Clean Code de Robert C. Martin et les principes SOLID constituent le socle de la qualité de code. Le Test-Driven Development (TDD), bien que controversé dans son adoption stricte, influence profondément la culture de qualité. La dette technique, longtemps ignorée, est désormais reconnue comme un risque stratégique à gérer explicitement.

**CI/CD et DevOps** : L'intégration continue et le déploiement continu ne sont plus optionnels — ils sont devenus des prérequis pour toute équipe souhaitant livrer de la valeur rapidement et de manière fiable. La philosophie DevOps a brouillé les frontières traditionnelles entre développement et opérations, créant de nouveaux rôles comme le Site Reliability Engineer (SRE).

**Collaboration et communication** : Les rituels agiles (daily standups, retrospectives) ont prouvé leur valeur, mais leur efficacité dépend de leur adaptation au contexte de l'équipe. Le travail distribué, accéléré par la pandémie de 2020, a profondément modifié les pratiques de collaboration, avec une importance accrue de la communication asynchrone et de la documentation.

**Pour les projets e-commerce B2B/B2C** : Les spécificités incluent la gestion de pics de charge (Black Friday, soldes), l'intégration de systèmes de paiement (conformité PCI-DSS), et la nécessité d'une haute disponibilité. Les feature flags deviennent essentiels pour les déploiements progressifs, et les tests de performance doivent être intégrés dès la phase de développement.

**Recommandations principales** :
1. Commencer simple (Scrum ou Kanban) et adapter progressivement
2. Investir dans l'automatisation des tests et du déploiement dès le début
3. Établir une Definition of Done rigoureuse et la faire respecter
4. Traiter la dette technique comme un item de backlog régulier
5. Mesurer pour améliorer, pas pour punir (attention à la Loi de Goodhart sur la vélocité)

---

## 1. Introduction

### 1.1 Objectif de cette phase

La phase de Développement a pour objectif de **transformer les spécifications et designs validés en logiciel fonctionnel**. Elle ne se limite pas à la production de code : elle englobe l'ensemble des activités nécessaires pour créer un produit de qualité, maintenable et évolutif.

Les objectifs spécifiques incluent :
- **Implémentation des fonctionnalités** définies dans le backlog produit
- **Établissement et maintien de la qualité** via tests automatisés, code reviews, et standards de code
- **Intégration continue** du travail de tous les développeurs
- **Gestion de la complexité technique** via architecture appropriée et patterns éprouvés
- **Collaboration efficace** entre tous les membres de l'équipe
- **Livraison incrémentale** de valeur au client/utilisateur

### 1.2 Place dans le cycle de vie projet

```
Discovery → Stratégie → Conception → [DÉVELOPPEMENT] → Qualité → Lancement → Croissance
```

La phase Développement est la **première phase véritablement "constructive"** du projet. Elle consomme généralement la plus grande partie du budget et des ressources, et sa qualité d'exécution détermine largement le succès des phases suivantes.

**Relations avec les autres phases :**
- **Inputs de Conception** : Architecture technique, spécifications fonctionnelles, wireframes/mockups validés, pile technologique choisie
- **Outputs vers Qualité** : Code fonctionnel, tests automatisés, documentation technique, artéfacts déployables

### 1.3 Prérequis (outputs de Conception)

Avant de démarrer le développement, les éléments suivants doivent être disponibles :

| Élément | Description | Niveau de détail requis |
|---------|-------------|------------------------|
| Architecture technique | Diagrammes de composants, choix technologiques justifiés | Décisions majeures figées, détails pouvant évoluer |
| Backlog initial | User stories priorisées avec critères d'acceptation | 2-3 sprints de travail refiné |
| Environnement de développement | Stack configurée, accès aux outils | Fonctionnel et documenté |
| Definition of Done | Critères de complétion d'une user story | Validée par l'équipe |
| Conventions de code | Standards de nommage, formatting | Documentées et outillées (linters) |

### 1.4 Outputs attendus (inputs pour Qualité)

À la fin de chaque itération, et cumulativement à la fin de la phase :

| Output | Description | Critères de qualité |
|--------|-------------|-------------------|
| Code source | Implémentation des fonctionnalités | Conforme aux standards, testé, reviewé |
| Tests automatisés | Unit, integration, E2E | Coverage défini, tous passants |
| Documentation | README, API docs, ADRs | À jour, accessible |
| Artéfacts de build | Binaires, containers, packages | Versionnés, reproductibles |
| Rapport de dette technique | État de la dette, plan de remboursement | Priorisé dans le backlog |

---

## 2. Méthodologies de Développement

### 2.1 Agile Manifesto et Principes

#### Vulgarisation

Le Manifeste Agile est né en février 2001 lorsque 17 développeurs de logiciels se sont réunis dans une station de ski de l'Utah (Snowbird) pour discuter des méthodes de développement. Frustrés par les approches "lourdes" de l'époque (comme le cycle en V), ils ont cherché ce qu'ils avaient en commun.

**Analogie** : Imaginez construire une maison. L'approche traditionnelle (Waterfall) consiste à tout planifier en détail avant de poser la première brique, sans possibilité de changer d'avis. L'approche Agile, c'est construire pièce par pièce, en permettant au propriétaire de voir chaque pièce et de demander des ajustements avant de continuer.

**Pourquoi c'est important** : L'Agile a révolutionné l'industrie du logiciel en reconnaissant que les besoins changent, que les humains sont plus importants que les processus, et que livrer régulièrement de la valeur est préférable à de longs cycles de développement.

#### Approfondissement Expert

**Origine et Historique**

Le Manifeste Agile a été signé le 11-13 février 2001 à Snowbird, Utah. Les 17 signataires incluaient :
- **Kent Beck** (créateur de l'Extreme Programming)
- **Martin Fowler** (auteur de Refactoring, Patterns of Enterprise Application Architecture)
- **Ken Schwaber** et **Jeff Sutherland** (créateurs de Scrum)
- **Alistair Cockburn** (Crystal Methods)
- **Jim Highsmith** (Adaptive Software Development)
- **Ward Cunningham** (inventeur du Wiki)
- Et 11 autres praticiens reconnus

**Les 4 Valeurs**

Le Manifeste énonce 4 valeurs fondamentales, formulées comme des préférences (pas des exclusions) :

1. **Les individus et leurs interactions** plus que les processus et les outils
2. **Un logiciel qui fonctionne** plus qu'une documentation exhaustive
3. **La collaboration avec les clients** plus que la négociation contractuelle
4. **L'adaptation au changement** plus que le suivi d'un plan

*Note importante* : Le Manifeste précise "nous reconnaissons la valeur des seconds éléments, mais privilégions les premiers".

**Les 12 Principes**

Les principes sous-jacents détaillent l'application des valeurs :

1. Satisfaire le client par la livraison rapide et continue de logiciel à valeur ajoutée
2. Accueillir les changements de besoins, même tard dans le projet
3. Livrer fréquemment un logiciel fonctionnel (semaines plutôt que mois)
4. Collaboration quotidienne entre métier et développeurs
5. Bâtir les projets autour d'individus motivés
6. Privilégier la conversation en face à face
7. Un logiciel fonctionnel est la principale mesure de progrès
8. Promouvoir un rythme de développement soutenable
9. Porter une attention continue à l'excellence technique
10. La simplicité — maximiser le travail non fait — est essentielle
11. Les meilleures architectures émergent d'équipes auto-organisées
12. À intervalles réguliers, l'équipe réfléchit aux moyens de devenir plus efficace

**Évolution depuis 2001**

- **2001-2010** : Adoption croissante, principalement Scrum et XP
- **2010-2015** : "Agile Industrial Complex" — commercialisation, certifications, parfois dévoiement des principes originaux
- **2015-2020** : Critiques internes (Ron Jeffries : "Developers Should Abandon Agile"), focus sur l'essence vs les rituels
- **2020-présent** : Post-Agile, adaptation au travail distribué, intégration avec DevOps, Software Craftsmanship

**Critiques et Limites**

| Critique | Source | Réponse / Nuance |
|----------|--------|------------------|
| "Agile est devenu une industrie de certifications" | Dave Thomas (signataire) | Distinguer Agile (mindset) d'Agile™ (framework commercial) |
| "Pas adapté aux grands projets réglementés" | Praticiens enterprise | SAFe et autres scaling frameworks tentent d'y répondre |
| "Documentation négligée" | Ops, nouveaux arrivants | Mauvaise interprétation du Manifeste (moins ≠ rien) |
| "Fatigue des rituels" | Équipes long-terme | Adapter les cérémonies, ne pas les suivre aveuglément |

**Références officielles** :
- Site officiel : agilemanifesto.org
- Histoire détaillée : "Agile Software Development" de Alistair Cockburn

#### Application Pratique

**Contexte optimal** : Projets avec exigences évolutives, besoin de feedback rapide, équipes de 3-9 personnes.

**Pour un e-commerce B2B/B2C** :
- ✅ Parfait pour les évolutions fonctionnelles (nouveau tunnel de paiement, refonte UX)
- ✅ Permet de réagir rapidement aux retours utilisateurs et aux KPIs
- ⚠️ Attention à l'intégration avec les contraintes réglementaires (PCI-DSS pour les paiements)

**Anti-patterns** :
- "Faire de l'Agile" sans changer la culture (sprints mais pas de vrai feedback client)
- Utiliser l'Agile comme excuse pour ne pas planifier ("on verra en cours de route")
- Imposer l'Agile sans buy-in de l'équipe

**Exemple concret** : Une équipe e-commerce adopte Scrum. Les sprints de 2 semaines permettent de livrer des améliorations du checkout régulièrement. Les A/B tests sur chaque release fournissent du feedback rapide. Le taux de conversion augmente de 12% en 6 mois grâce aux itérations guidées par les données.

---

### 2.2 Scrum Framework

#### Vulgarisation

Scrum est un cadre de travail (framework) pour gérer des projets complexes. Son nom vient du rugby : la "mêlée" (scrum) où l'équipe avance ensemble vers un objectif.

**Analogie** : Imaginez une équipe de cuisine préparant un menu dégustation. Chaque sprint est un service : l'équipe décide des plats (Sprint Planning), se coordonne en continu (Daily Scrum), livre les plats au client (Sprint Review), puis discute de ce qui pourrait être amélioré (Retrospective) avant le prochain service.

**Pourquoi c'est important** : Scrum fournit une structure claire et éprouvée pour le travail d'équipe. Il répond à la question "comment organiser notre travail au quotidien ?".

#### Approfondissement Expert

**Origine et Historique**

- **1986** : Article "The New New Product Development Game" de Takeuchi et Nonaka dans Harvard Business Review — décrit des équipes pluridisciplinaires et auto-organisées chez Honda et Canon
- **1995** : Ken Schwaber et Jeff Sutherland présentent Scrum à la conférence OOPSLA
- **2002** : Création de la Scrum Alliance par Ken Schwaber
- **2009** : Ken Schwaber quitte la Scrum Alliance pour fonder Scrum.org
- **2010** : Premier Scrum Guide officiel
- **2020** : Dernière mise à jour majeure du Scrum Guide (version actuelle)

**Le Scrum Guide 2020 — Version officielle de référence**

Source : scrumguides.org (Ken Schwaber & Jeff Sutherland)

**Les 3 Piliers Empiriques** :
1. **Transparence** : Le processus et le travail doivent être visibles
2. **Inspection** : Les artéfacts et le progrès doivent être inspectés fréquemment
3. **Adaptation** : Ajuster le processus dès qu'une déviation est détectée

**Les 5 Valeurs Scrum** :
- Engagement
- Courage
- Focus
- Ouverture
- Respect

**Les Accountabilities (ex-Rôles)** :

| Accountability | Responsabilités clés | Ce que ce n'est PAS |
|----------------|---------------------|---------------------|
| **Product Owner** | Maximiser la valeur du produit, gérer le Product Backlog, définir et communiquer le Product Goal | Un gestionnaire d'équipe, un secrétaire qui prend des commandes |
| **Scrum Master** | S'assurer que Scrum est compris et appliqué, éliminer les obstacles, coacher l'équipe et l'organisation | Un chef de projet, un coordinateur de réunions |
| **Developers** | Créer l'Increment, s'auto-organiser pour atteindre le Sprint Goal | Des exécutants qui attendent des ordres |

*Note Scrum Guide 2020* : Le terme "Development Team" a été remplacé par "Developers" pour clarifier qu'il n'y a pas d'équipe dans l'équipe.

**Les Événements** :

| Événement | Time-box | Objectif | Participants |
|-----------|----------|----------|--------------|
| **Sprint** | 1-4 semaines (fixe) | Container pour tous les événements, produit un Increment | Toute la Scrum Team |
| **Sprint Planning** | Max 8h (sprint 4 sem) | Définir le Sprint Goal, sélectionner les items, planifier le travail | Scrum Team complète |
| **Daily Scrum** | Max 15 min | Inspecter le progrès vers le Sprint Goal, adapter le plan | Developers (PO/SM optionnels) |
| **Sprint Review** | Max 4h (sprint 4 sem) | Inspecter l'Increment, adapter le Product Backlog | Scrum Team + stakeholders |
| **Sprint Retrospective** | Max 3h (sprint 4 sem) | Identifier des améliorations au processus | Scrum Team |

**Les Artéfacts et leurs Engagements** :

| Artéfact | Description | Engagement associé |
|----------|-------------|-------------------|
| **Product Backlog** | Liste ordonnée de tout ce qui pourrait être nécessaire | Product Goal |
| **Sprint Backlog** | Items du Product Backlog sélectionnés + plan pour les livrer | Sprint Goal |
| **Increment** | Somme de tous les items complétés pendant le Sprint + Increments précédents | Definition of Done |

**Definition of Done (DoD)** — Concept critique souvent mal compris :
- C'est la définition de ce que signifie "terminé" pour un item
- Elle s'applique à l'Increment, pas à chaque story individuellement
- Si l'organisation a des standards, ils constituent le minimum de la DoD
- L'équipe peut les renforcer, jamais les affaiblir

**Changements majeurs du Scrum Guide 2020** :
- Simplification : 13 pages vs 17 précédemment
- Moins prescriptif : suppression des questions spécifiques du Daily
- Emphasis sur le Product Goal comme engagement
- "Developers" au lieu de "Development Team"
- Accent sur l'auto-gestion plutôt que l'auto-organisation

**Certifications reconnues** :

| Organisation | Certifications | Notes |
|--------------|---------------|-------|
| Scrum.org | PSM I, II, III (Scrum Master), PSPO I, II, III (Product Owner), PSD (Developer) | Examen sans formation obligatoire |
| Scrum Alliance | CSM, A-CSM, CSP-SM (Scrum Master), CSPO, A-CSPO, CSP-PO (Product Owner) | Nécessite une formation accréditée |
| ICAgile | ICP, ICP-ATF, ICP-ACC | Focus coaching agile |

**Métriques courantes** :
- **Velocity** : Story points complétés par sprint (controversé — voir section Questions Transversales)
- **Sprint Burndown** : Travail restant dans le sprint
- **Release Burndown/Burnup** : Progrès vers un objectif de release
- **Cumulative Flow Diagram** : Visualisation du flux

**Critiques et Limites** :
- Peut devenir rigide si appliqué dogmatiquement
- Sprint Reviews souvent transformées en "démos" sans vrai feedback
- Confusion entre Scrum Master et Project Manager
- Difficile à scaler sans frameworks additionnels

#### Application Pratique

**Contexte optimal** :
- Équipes de 3-9 personnes
- Projets avec des besoins évolutifs
- Besoin de livraison régulière de valeur
- Organisation prête à s'engager dans la transparence

**Pour un e-commerce B2B/B2C** :

Configuration recommandée :
- **Sprint de 2 semaines** : Bon équilibre entre overhead des cérémonies et feedback rapide
- **Product Owner** : Idéalement une personne avec vision produit ET connaissance métier (B2B : comprend les workflows acheteurs pro, B2C : comprend les comportements consommateurs)
- **DoD exemple** :
  - Code reviewé par au moins 1 développeur
  - Tests unitaires avec >80% coverage
  - Tests E2E sur les flux critiques (checkout, login)
  - Déployé en staging
  - Documentation API mise à jour
  - Performance validée (temps de réponse <2s)

**Anti-patterns e-commerce** :
- Sprint Goal trop vague ("améliorer le site") — préférer "Augmenter le taux de conversion du panier de 5%"
- Oublier les contraintes techniques (PCI-DSS, RGPD) dans la DoD
- Ne pas inclure les équipes ops/support dans les Sprint Reviews

**Exemple concret documenté** : [À VÉRIFIER — étude de cas spécifique]
Zalando, géant du e-commerce européen, a publié des articles sur son adoption de Scrum à grande échelle, avec des équipes autonomes ("Radical Agility") qui possèdent leurs domaines fonctionnels de bout en bout.

---

### 2.3 Kanban Method

#### Vulgarisation

Kanban (看板 en japonais, signifie "panneau visuel") est une méthode de gestion du travail basée sur la visualisation du flux et la limitation du travail en cours.

**Analogie** : Imaginez un restaurant avec une cuisine ouverte. Les commandes arrivent sur des tickets, sont affichées sur un tableau, et l'équipe voit instantanément ce qui est en préparation, ce qui attend, et ce qui est terminé. Si trop de commandes s'accumulent à une étape, tout le monde le voit et peut aider.

**Pourquoi c'est important** : Kanban permet de gérer le flux de travail sans les contraintes des sprints fixes. Il est particulièrement adapté aux équipes de maintenance ou support où le travail arrive de manière imprévisible.

#### Approfondissement Expert

**Origine et Historique**

- **1940s** : Taiichi Ohno développe le système Kanban chez Toyota pour la gestion des stocks (just-in-time manufacturing)
- **2004** : David J. Anderson adapte le concept au développement logiciel chez Microsoft
- **2007** : Première présentation de la Kanban Method à la conférence Agile
- **2010** : Publication de "Kanban: Successful Evolutionary Change for Your Technology Business" par David Anderson

**Les 6 Pratiques Fondamentales** (David Anderson) :

1. **Visualiser le flux de travail** : Créer un tableau représentant les étapes du processus
2. **Limiter le travail en cours (WIP)** : Définir des limites explicites par colonne
3. **Gérer le flux** : Optimiser le mouvement des items à travers le système
4. **Rendre les politiques explicites** : Documenter les règles (Definition of Done par colonne, critères de priorisation)
5. **Implémenter des boucles de feedback** : Revues régulières (cadences)
6. **S'améliorer collaborativement, évoluer expérimentalement** : Utiliser les modèles scientifiques

**Les 4 Principes Fondamentaux** :

1. **Commencer là où vous êtes** : Pas de transformation radicale, évolution progressive
2. **S'engager à poursuivre un changement incrémental et évolutif** : Petits pas, pas de big bang
3. **Respecter le processus actuel, les rôles, responsabilités et titres** : Ne pas menacer les positions existantes
4. **Encourager les actes de leadership à tous les niveaux** : Tout le monde peut initier une amélioration

**Work In Progress (WIP) Limits — Le concept clé**

La limitation du WIP est ce qui distingue Kanban d'un simple tableau de tâches.

*Loi de Little* : Lead Time = WIP / Throughput

Implications :
- Réduire le WIP → Réduire le Lead Time (à throughput constant)
- Trop de WIP → Multitasking → Context switching → Inefficience

**Métriques Kanban** :

| Métrique | Définition | Usage |
|----------|------------|-------|
| **Lead Time** | Temps total depuis la demande jusqu'à la livraison | Performance du système complet |
| **Cycle Time** | Temps depuis le début du travail jusqu'à la complétion | Performance du processus de dev |
| **Throughput** | Nombre d'items complétés par unité de temps | Capacité de l'équipe |
| **WIP** | Nombre d'items en cours à un moment donné | Santé du système |

**Cadences (réunions régulières)** :

Contrairement à Scrum, Kanban ne prescrit pas d'événements obligatoires, mais suggère des "cadences" :
- **Daily Standup** : Synchronisation quotidienne (focus sur le flux, pas les personnes)
- **Replenishment Meeting** : Sélection des prochains items à traiter (fréquence variable)
- **Delivery Planning** : Coordination des releases
- **Service Delivery Review** : Analyse des métriques de flux (hebdomadaire ou bi-mensuelle)
- **Operations Review** : Vision stratégique (mensuelle)
- **Risk Review** : Identification et gestion des risques
- **Strategy Review** : Alignement avec les objectifs business (trimestrielle)

**Classes de Service** :

Kanban reconnaît que tous les items n'ont pas la même urgence :
- **Expedite** : Urgence absolue, passe devant tout (limiter à 1)
- **Fixed Date** : Deadline externe non négociable
- **Standard** : Travail normal, FIFO
- **Intangible** : Dette technique, améliorations non urgentes

**Certifications** :
- Kanban University : Team Kanban Practitioner (TKP), Kanban Management Professional (KMP)
- LeanKanban : Accredited Kanban Trainer (AKT)

**Critiques et Limites** :
- Peut manquer de structure pour les équipes débutantes
- Sans sprints, difficulté à s'engager sur des dates
- Risque de "flux infini" sans priorisation claire
- Limites WIP difficiles à calibrer initialement

#### Application Pratique

**Contexte optimal** :
- Équipes de maintenance/support
- Travail avec arrivée imprévisible (bugs, demandes client)
- Équipes matures cherchant plus de flexibilité que Scrum
- Transition progressive depuis un processus existant

**Pour un e-commerce B2B/B2C** :

Configuration recommandée :
- **Colonnes** : Inbox → Analyse → Développement → Code Review → Test → Staging → Production
- **WIP Limits** : Développement (équipe/2), Review (équipe/3), Test (3)
- **Classes de service** :
  - Expedite : Bug critique en production (site down, paiement KO)
  - Fixed Date : Feature pour Black Friday
  - Standard : Évolutions normales
  - Intangible : Refactoring, dette technique

**Anti-patterns** :
- Tableau sans limites WIP (juste un todo-list visuel)
- Ignorer les goulots d'étranglement visibles
- Ne jamais toucher aux items "intangibles"

**Exemple concret** : Une équipe support e-commerce gère les tickets via Kanban. La visualisation révèle que le code review est un goulot d'étranglement. L'équipe décide de limiter le WIP en dev et d'instaurer une règle "review before new work". Le lead time moyen passe de 5 jours à 2 jours.

---

### 2.4 Scrumban

#### Vulgarisation

Scrumban est une approche hybride combinant la structure de Scrum avec la flexibilité de Kanban. C'est comme avoir le meilleur des deux mondes : les sprints et les rituels pour la cadence, les limites WIP et le flux pour l'efficacité.

**Analogie** : Un restaurant qui fonctionne avec des services fixes (sprints) mais gère sa cuisine avec un système Kanban — permettant d'ajouter des commandes urgentes sans attendre le prochain service.

**Pourquoi c'est important** : Scrumban répond aux équipes qui trouvent Scrum trop rigide et Kanban trop fluide.

#### Approfondissement Expert

**Origine**

- **2009** : Corey Ladas publie "Scrumban: Essays on Kanban Systems for Lean Software Development"
- Le terme existait avant, mais Ladas a formalisé l'approche

**Caractéristiques typiques** :

| De Scrum | De Kanban |
|----------|-----------|
| Sprints (souvent plus courts : 1 semaine) | Tableau visuel avec colonnes |
| Daily Standup | Limites WIP |
| Retrospectives | Focus sur le flux |
| Roles (PO, SM) parfois conservés | Métriques de flux (Lead Time, Cycle Time) |

**Évolutions communes** :
- Sprint Planning "on-demand" plutôt que timeboxé
- Pas d'estimation (ou estimation légère)
- Replenishment quand le backlog ready atteint un seuil

**Quand migrer de Scrum à Scrumban ?**
- Sprints toujours interrompus par des urgences
- L'estimation ne fournit plus de valeur
- Équipe mature, processus stable
- Besoin de réactivité accrue

#### Application Pratique

**Pour un e-commerce B2B/B2C** :

Cas typique : Une équipe Scrum gère à la fois le développement de nouvelles features et le support niveau 3. Les bugs urgents perturbent constamment les sprints.

Solution Scrumban :
- Conserver les sprints de 1 semaine pour la planification
- Réserver 30% de la capacité pour le flux "support" (Kanban)
- Limiter le WIP total
- Mesurer le throughput plutôt que la vélocité

---

### 2.5 Extreme Programming (XP)

#### Vulgarisation

Extreme Programming (XP) est une méthodologie agile créée par Kent Beck qui pousse les bonnes pratiques de développement "à l'extrême". Si la code review est bonne, pourquoi ne pas coder en binôme tout le temps ? Si les tests sont importants, pourquoi ne pas les écrire avant le code ?

**Analogie** : XP, c'est comme un entraînement sportif intensif pour développeurs. Chaque exercice (pratique) renforce une qualité : le pair programming pour la qualité du code, le TDD pour la confiance, l'intégration continue pour la collaboration.

**Pourquoi c'est important** : XP a introduit des pratiques devenues standards : TDD, intégration continue, refactoring. Même si peu d'équipes font du "XP complet", ses pratiques sont omniprésentes.

#### Approfondissement Expert

**Origine et Historique**

- **1996** : Kent Beck commence le projet Chrysler Comprehensive Compensation System (C3), laboratoire de XP
- **1999** : Publication de "Extreme Programming Explained" (Kent Beck)
- **2004** : Deuxième édition du livre, avec des pratiques évoluées

**Les 5 Valeurs XP** :
1. **Communication** : Interaction constante équipe/client
2. **Simplicité** : Faire la chose la plus simple qui puisse fonctionner
3. **Feedback** : Boucles courtes à tous les niveaux
4. **Courage** : Refactorer, jeter du code, dire la vérité
5. **Respect** : Entre membres de l'équipe

**Les 12 Pratiques (version originale)** :

| Pratique | Description |
|----------|-------------|
| **Planning Game** | Planification collaborative client/dev |
| **Small Releases** | Releases fréquentes en production |
| **Metaphor** | Vision partagée du système (terme souvent remplacé) |
| **Simple Design** | YAGNI — pas de complexité anticipée |
| **Testing** | Tests unitaires automatisés, TDD |
| **Refactoring** | Amélioration continue du design |
| **Pair Programming** | Deux développeurs, un clavier |
| **Collective Ownership** | Tout le monde peut modifier tout le code |
| **Continuous Integration** | Intégration plusieurs fois par jour |
| **40-Hour Week** | Rythme soutenable |
| **On-Site Customer** | Client disponible pour l'équipe |
| **Coding Standards** | Conventions de code partagées |

**Évolution (XP 2ème édition, 2004)** :

Pratiques primaires :
- Sit Together (équipe co-localisée)
- Whole Team (équipe pluridisciplinaire)
- Informative Workspace (radiateurs d'information)
- Energized Work (équilibre vie/travail)
- Pair Programming
- Stories
- Weekly Cycle
- Quarterly Cycle
- Slack (marge dans la planification)
- Ten-Minute Build
- Continuous Integration
- Test-First Programming
- Incremental Design

Pratiques corollaires (pour équipes matures) :
- Real Customer Involvement
- Incremental Deployment
- Team Continuity
- Shrinking Teams
- Root-Cause Analysis
- Shared Code
- Code and Tests
- Single Code Base
- Daily Deployment
- Negotiated Scope Contract
- Pay-Per-Use

**Critiques** :
- Pair programming 100% du temps : coûteux, fatigant
- On-site customer : rarement réalisable
- Peut être perçu comme "extrémiste"
- Moins populaire que Scrum car plus exigeant

#### Application Pratique

**Contexte optimal** :
- Projets critiques où la qualité est primordiale
- Équipes avec développeurs expérimentés
- Environnements où le changement est constant

**Pour un e-commerce B2B/B2C** :

Pratiques XP particulièrement pertinentes :
- **TDD** pour le code de paiement et checkout (zéro défaut toléré)
- **Pair Programming** pour les fonctionnalités complexes (calcul de prix B2B, promotions)
- **Continuous Integration** indispensable
- **Small Releases** avec feature flags pour les A/B tests

Pratiques à adapter :
- On-site customer → Product Owner disponible + analytics en temps réel
- 40-hour week → Attention particulière pendant les pics (Black Friday)

---

### 2.6 SAFe (Scaled Agile Framework)

#### Vulgarisation

SAFe (prononcé "safe") est un framework pour faire de l'Agile à grande échelle — quand une seule équipe Scrum ne suffit plus et que des dizaines, voire des centaines de personnes doivent coordonner leur travail.

**Analogie** : Si Scrum est une équipe de cuisine dans un restaurant, SAFe est le système de gestion d'une chaîne de restaurants avec une cuisine centrale, des établissements locaux, et une coordination entre tous.

**Pourquoi c'est important** : Les grandes organisations (banques, assurances, retailers) ont besoin de méthodes pour coordonner des centaines de développeurs tout en gardant l'agilité.

#### Approfondissement Expert

**Origine**

- **2011** : Dean Leffingwell publie "Agile Software Requirements" et lance SAFe
- **Versions** : SAFe 1.0 (2011), 2.0 (2012), 3.0 (2014), 4.0 (2016), 4.5 (2018), 5.0 (2020), 6.0 (2023)

**Les 4 Configurations SAFe** :

1. **Essential SAFe** : Base minimale (Team + Program level)
2. **Large Solution SAFe** : Pour solutions complexes multi-ART
3. **Portfolio SAFe** : Stratégie et financement lean
4. **Full SAFe** : Configuration complète

**Concepts clés** :

| Concept | Description |
|---------|-------------|
| **Agile Release Train (ART)** | Équipe de 50-125 personnes, alignée sur une cadence |
| **Program Increment (PI)** | Période de 8-12 semaines, 4-6 sprints |
| **PI Planning** | Événement de 2 jours, toute l'équipe planifie ensemble |
| **Solution Train** | Coordination de plusieurs ARTs |
| **Portfolio Kanban** | Gestion du flux stratégique |

**Rôles SAFe** (nombreux) :
- Release Train Engineer (RTE)
- Solution Train Engineer (STE)
- Product Management
- System Architect
- Epic Owners
- Lean-Agile Center of Excellence (LACE)

**Certifications** (Scaled Agile, Inc.) :
- SAFe Agilist (SA)
- SAFe Practitioner (SP)
- SAFe Scrum Master (SSM)
- SAFe Product Owner/Product Manager (POPM)
- SAFe for Architects
- SAFe Release Train Engineer (RTE)

**Critiques majeures** :
- Complexité : "Scrum with more meetings"
- Coût des certifications et formations
- Peut imposer une uniformité contre-productive
- Martin Fowler et autres agilistes : "Flaccid Agile", éloigné des principes originaux
- Risque de "SAFe Theater" : les rituels sans la culture

**Quand SAFe fait sens** :
- Grande organisation (>100 développeurs sur un produit)
- Besoin de coordination inter-équipes forte
- Contexte réglementé nécessitant traçabilité
- Gouvernance corporate existante à intégrer

#### Application Pratique

**Pour un e-commerce B2B/B2C de grande envergure** :

SAFe peut être pertinent si :
- Plusieurs équipes travaillent sur le même produit (>50 personnes)
- Dépendances fortes entre équipes (ex: équipe catalogue, équipe checkout, équipe search)
- Besoin de roadmap coordonnée pour les stakeholders

Configuration typique :
- 1 ART pour la plateforme e-commerce
- Équipes : Catalogue, Search, Cart, Checkout, Account, Mobile, Data
- PI de 10 semaines avec PI Planning trimestriel
- Architecture runway pour les sujets transverses (performance, sécurité)

**Alternatives à considérer** :
- **LeSS** (Large Scale Scrum) : Plus minimaliste
- **Spotify Model** : Squads, Tribes, Chapters, Guilds
- **Nexus** (Scrum.org) : Extension de Scrum pour 3-9 équipes

---

### 2.7 Lean Software Development

#### Vulgarisation

Le Lean Software Development adapte les principes du Lean Manufacturing (Toyota) au développement logiciel. L'idée centrale : éliminer le gaspillage pour livrer plus de valeur avec moins d'efforts.

**Analogie** : Dans une usine Lean, chaque mouvement inutile est du gaspillage. En développement, chaque feature non utilisée, chaque réunion sans valeur, chaque attente de validation est du gaspillage.

**Pourquoi c'est important** : Le Lean fournit un cadre de pensée pour optimiser les processus et se concentrer sur ce qui a vraiment de la valeur.

#### Approfondissement Expert

**Origine**

- **1988** : John Krafcik invente le terme "Lean" dans son article sur le Toyota Production System
- **2003** : Mary et Tom Poppendieck publient "Lean Software Development: An Agile Toolkit"
- **2006** : "Implementing Lean Software Development" (Poppendieck)

**Les 7 Principes Lean Software Development** :

1. **Eliminate Waste (Éliminer le gaspillage)**
   - Les 7 gaspillages : travail partiellement fait, fonctionnalités non nécessaires, réapprentissage, transferts (handoffs), changements de contexte, retards, défauts

2. **Build Quality In (Intégrer la qualité)**
   - Ne pas "tester la qualité à la fin", l'intégrer dès le début (TDD, pair programming)

3. **Create Knowledge (Créer des connaissances)**
   - Le développement est un processus d'apprentissage, pas juste d'exécution

4. **Defer Commitment (Différer les engagements)**
   - Garder les options ouvertes le plus longtemps possible, décider au dernier moment responsable

5. **Deliver Fast (Livrer rapidement)**
   - Réduire le cycle time, small batches, flux continu

6. **Respect People (Respecter les personnes)**
   - Autonomie, confiance, développement des compétences

7. **Optimize the Whole (Optimiser le tout)**
   - Éviter les optimisations locales au détriment du système global

**Outils associés** :
- Value Stream Mapping
- Kanban (héritier direct du Lean)
- A3 Problem Solving
- 5 Whys (analyse de cause racine)

#### Application Pratique

**Pour un e-commerce B2B/B2C** :

Principes Lean appliqués :
- **Eliminate Waste** : Tracker les features non utilisées via analytics. Si <5% d'usage, considérer la suppression.
- **Build Quality In** : Tests automatisés sur le checkout dès le premier commit
- **Defer Commitment** : Ne pas sur-architecturer pour des besoins futurs hypothétiques
- **Deliver Fast** : Deployment pipeline <15 min, releases quotidiennes

---

### 2.8 Shape Up

#### Vulgarisation

Shape Up est une méthodologie développée par Basecamp (ex-37signals), présentée comme une alternative à Scrum. Au lieu de sprints courts avec un backlog infini, Shape Up utilise des cycles de 6 semaines avec des "bets" (paris) sur des projets bien définis.

**Analogie** : Plutôt que de cuisiner en continu (Kanban) ou par services courts (Scrum), Shape Up c'est comme préparer un menu complet avec un budget temps fixe. Si le plat n'est pas prêt à la fin du cycle, on ne rallonge pas — on fait un choix.

**Pourquoi c'est important** : Shape Up offre une alternative crédible aux méthodologies dominantes, avec un focus sur l'autonomie des équipes et l'élimination de l'estimation continue.

#### Approfondissement Expert

**Origine**

- **2019** : Ryan Singer (Basecamp) publie "Shape Up: Stop Running in Circles and Ship Work that Matters" (gratuit en ligne : basecamp.com/shapeup)

**Les concepts clés** :

**Cycles de 6 semaines** :
- Plus long qu'un sprint (permet des projets substantiels)
- Pas de prolongation : si pas fini, circuit breaker

**Cooldown (2 semaines)** :
- Entre les cycles
- Pas de travail planifié : maintenance, exploration, préparation

**Shaping vs Building** :

| Phase | Qui | Quoi |
|-------|-----|------|
| **Shaping** | Seniors, PMs | Définir le problème, la solution (outline), les "rabbit holes" à éviter, appetite (1, 2 ou 6 semaines) |
| **Betting** | Leadership | Choisir les projets pour le prochain cycle |
| **Building** | Équipes | Implémenter avec autonomie totale |

**Le concept d'"Appetite"** :
- Contrairement à l'estimation ("combien de temps ça prend ?")
- L'appetite est un budget : "combien sommes-nous prêts à investir ?"
- Inverse la question : le scope s'adapte à l'appetite, pas l'inverse

**Pitches** :
- Document de shaping présentant le projet
- Contient : Problem, Appetite, Solution, Rabbit Holes, No-Gos

**Fat Marker Sketches** :
- Wireframes grossiers (pas de haute fidélité)
- Laissent de la place à l'interprétation des builders

**Hill Charts** :
- Visualisation unique de l'avancement
- Deux phases : "Figuring it out" (montée) et "Making it happen" (descente)
- Permet de voir où l'équipe en est vraiment (pas de % trompeur)

**Critiques** :
- 6 semaines peut être trop long pour du feedback rapide
- Moins de structure peut dérouter les équipes junior
- "Betting" peut sembler opaque si mal communiqué
- Demande des seniors capables de "shaper" correctement

#### Application Pratique

**Contexte optimal** :
- Équipes matures, autonomes
- Produits établis (pas de startup en discovery)
- Fatigue du Scrum
- Besoin de projets plus substantiels que des incréments de 2 semaines

**Pour un e-commerce B2B/B2C** :

Shape Up peut convenir pour :
- Refonte du tunnel d'achat (projet 6 semaines)
- Nouveau module B2B (gestion des devis, multi-utilisateurs)
- Amélioration majeure de la recherche

Moins adapté pour :
- Maintenance quotidienne (combiner avec Kanban pour les bugs)
- Équipes junior sans seniors pour shaper
- Contexte réglementé avec reporting fréquent

**Configuration hybride possible** :
- Shape Up pour les features majeures
- Kanban pour le support et les bugs
- Tech leads shapent pendant le cooldown

---

## 3. Gestion du Backlog et User Stories

### 3.1 User Stories

#### Vulgarisation

Une User Story est une façon de décrire une fonctionnalité du point de vue de l'utilisateur. Au lieu d'une spécification technique froide, on raconte une petite histoire : "En tant que [type d'utilisateur], je veux [action] afin de [bénéfice]".

**Analogie** : C'est comme laisser un mot sur le frigo : "Chéri, en tant qu'amateur de café, je voudrais une nouvelle machine, afin de ne plus boire du café tiède le matin." C'est plus engageant qu'une liste de spécifications techniques sur les watts et les bars de pression.

**Pourquoi c'est important** : Les User Stories forcent l'équipe à penser à la valeur pour l'utilisateur, pas juste aux détails techniques. Elles facilitent la conversation entre le métier et les développeurs.

#### Approfondissement Expert

**Origine**

- **1998** : Kent Beck introduit les User Stories dans Extreme Programming
- **2001** : Ron Jeffries formalise les "3 C's"
- **2004** : Mike Cohn publie "User Stories Applied"

**Le Format Classique**

```
As a [type of user]
I want [goal/desire]
So that [benefit/value]
```

En français :
```
En tant que [type d'utilisateur]
Je veux [objectif]
Afin de [bénéfice]
```

**Les 3 C (Ron Jeffries)** :

1. **Card** : La story tient sur une carte (physique ou virtuelle)
2. **Conversation** : La carte déclenche une conversation, elle ne contient pas toutes les réponses
3. **Confirmation** : Les critères d'acceptation confirment que la story est terminée

**Exemples par qualité** :

| Mauvaise | Meilleure | Excellente |
|----------|-----------|------------|
| "Ajouter un bouton de recherche" | "En tant qu'utilisateur, je veux rechercher des produits" | "En tant qu'acheteur pressé, je veux rechercher un produit par nom ou référence, afin de le trouver en moins de 5 secondes" |

**Types de stories** :
- **User Story** : Fonctionnalité utilisateur
- **Technical Story** : Travail technique sans valeur utilisateur directe (souvent contesté — mieux vaut intégrer dans les stories)
- **Enabler Story** (SAFe) : Infrastructure, architecture, exploration
- **Spike** : Recherche time-boxée pour réduire l'incertitude

**User Story Mapping** (Jeff Patton) :
- Technique pour organiser les stories en "carte"
- Axe horizontal : parcours utilisateur (activités → tâches)
- Axe vertical : priorité (MVP en haut, améliorations en dessous)
- Permet de visualiser le produit complet, pas juste une liste

**Epic, Feature, Story** — Hiérarchie commune :

| Niveau | Scope | Exemple e-commerce |
|--------|-------|-------------------|
| **Epic** | Initiative majeure, plusieurs sprints | "Checkout one-page" |
| **Feature** | Fonctionnalité délivrable | "Paiement par carte bancaire" |
| **User Story** | Incrément implémentable en 1 sprint | "En tant qu'acheteur, je veux sauvegarder ma carte pour mes prochains achats" |
| **Task** | Travail technique pour réaliser la story | "Intégrer l'API Stripe pour le vault de carte" |

#### Application Pratique

**Pour un e-commerce B2B/B2C** :

Exemples de stories bien formées :

**B2C** :
```
En tant que client fidèle
Je veux voir mes points de fidélité sur la page panier
Afin de décider si je veux les utiliser pour cette commande
```

**B2B** :
```
En tant que responsable achat
Je veux pouvoir créer un devis à partir de mon panier
Afin de le soumettre à validation interne avant commande
```

**Anti-patterns** :
- Stories trop grosses ("En tant qu'admin, je veux un back-office complet")
- Stories techniques déguisées ("En tant que développeur, je veux refactorer le code")
- Pas de "so that" (perte de la raison d'être)
- Stories qui sont des tâches ("Ajouter le champ email")

---

### 3.2 Critères INVEST

#### Vulgarisation

INVEST est un acronyme mnémotechnique pour vérifier si une User Story est bien écrite. Une bonne story doit être : Indépendante, Négociable, avoir de la Valeur, être Estimable, de taille adaptée (Small), et Testable.

**Analogie** : C'est comme une checklist pour un bon article de journal : complet, factuel, intéressant, vérifiable. INVEST est la checklist des stories.

#### Approfondissement Expert

**Origine** : Bill Wake, 2003

| Critère | Signification | Test |
|---------|---------------|------|
| **I** - Independent | Pas de dépendance forte avec d'autres stories | Peut être planifiée et livrée seule |
| **N** - Negotiable | Pas un contrat gravé dans le marbre | Le "comment" peut évoluer via la conversation |
| **V** - Valuable | Apporte de la valeur à l'utilisateur ou au business | Le "so that" est clair et pertinent |
| **E** - Estimable | L'équipe peut en évaluer l'effort | Assez claire pour être estimée, pas forcément précisément |
| **S** - Small | Taille adaptée pour tenir dans un sprint | Généralement 1-3 jours de travail |
| **T** - Testable | Peut être validée objectivement | Critères d'acceptation définissables |

**Dépendances (le "I" en pratique)** :
- L'indépendance totale est souvent impossible
- Objectif : minimiser les dépendances, les rendre explicites
- Techniques : story splitting, story mapping

#### Application Pratique

**Checklist INVEST pour une story e-commerce** :

```markdown
Story: "En tant qu'acheteur, je veux filtrer les produits par prix"

☑️ Independent: Oui (peut être livrée sans les autres filtres)
☑️ Negotiable: Oui (slider vs champs min/max, à discuter)
☑️ Valuable: Oui (aide à trouver des produits dans son budget)
☑️ Estimable: Oui (l'équipe voit le scope)
☑️ Small: Oui (estimée à 3 points)
☑️ Testable: Oui (voir critères d'acceptation)
```

---

### 3.3 Acceptance Criteria (Critères d'Acceptation)

#### Vulgarisation

Les critères d'acceptation définissent "comment savoir que c'est terminé". Ce sont les conditions de succès d'une User Story, comme une recette de cuisine dit "doré à l'extérieur, moelleux à l'intérieur".

**Pourquoi c'est important** : Sans critères d'acceptation clairs, développeurs et métier peuvent avoir des interprétations différentes. Les AC éliminent l'ambiguïté.

#### Approfondissement Expert

**Deux formats principaux** :

**Format Checklist (simple)** :
```markdown
Critères d'acceptation :
- [ ] Le filtre prix affiche un slider
- [ ] Les valeurs min et max sont pré-remplies avec les extrêmes du catalogue
- [ ] Le filtrage est instantané (sans rechargement de page)
- [ ] Le nombre de résultats s'affiche en temps réel
- [ ] Sur mobile, le slider est remplacé par deux champs numériques
```

**Format Given/When/Then (BDD - Gherkin)** :
```gherkin
Feature: Filtrage par prix

Scenario: Filtrer les produits dans une fourchette de prix
  Given je suis sur la page catalogue avec 100 produits
  And les prix vont de 10€ à 500€
  When je déplace le curseur minimum à 50€
  And je déplace le curseur maximum à 200€
  Then je vois uniquement les produits entre 50€ et 200€
  And le nombre de résultats affichés est mis à jour

Scenario: Réinitialiser le filtre prix
  Given j'ai filtré les produits entre 50€ et 200€
  When je clique sur "Réinitialiser les filtres"
  Then tous les produits sont affichés
  And les curseurs reviennent aux valeurs min/max du catalogue
```

**Bonnes pratiques** :
- Écrits AVANT le développement (pas après coup)
- Collaboratifs : PO écrit, développeurs et QA enrichissent
- Focus sur le QUOI, pas le COMMENT
- Éviter le jargon technique
- Testables automatiquement si possible

**Quantité recommandée** : 3-8 critères par story. Plus → story trop grosse, à découper.

---

### 3.4 Definition of Done (DoD)

#### Vulgarisation

La Definition of Done est une checklist partagée par l'équipe qui définit quand un travail est réellement "terminé". Ce n'est pas "ça marche sur ma machine", c'est "ça marche, c'est testé, documenté, reviewé, et déployable".

**Analogie** : Dans un restaurant, "plat terminé" ne veut pas dire "cuisiné". Ça veut dire : cuisiné, dressé, vérifié par le chef, et prêt à servir. La DoD, c'est ça.

**Pourquoi c'est important** : Sans DoD explicite, "terminé" devient subjectif. La dette technique s'accumule quand chacun a sa propre définition de "fini".

#### Approfondissement Expert

**Scrum Guide 2020 sur la DoD** :
> "The Definition of Done is a formal description of the state of the Increment when it meets the quality measures required for the product."

**Différence DoD vs Acceptance Criteria** :

| Definition of Done | Acceptance Criteria |
|-------------------|---------------------|
| S'applique à TOUTES les stories | Spécifiques à UNE story |
| Critères de qualité généraux | Critères fonctionnels spécifiques |
| Stable dans le temps | Change avec chaque story |
| Exemple : "Tests unitaires passants" | Exemple : "Le filtre affiche 0-100 résultats" |

**Évolution de la DoD** :
- Commence simple, s'enrichit avec la maturité de l'équipe
- Ne doit JAMAIS régresser (on n'enlève pas de critères)
- Révisée en rétrospective quand des problèmes de qualité surviennent

**Exemple de DoD évolutive** :

**Équipe débutante** :
```markdown
Definition of Done :
- [ ] Code commité sur la branche feature
- [ ] Tests unitaires écrits et passants
- [ ] Code review effectuée
- [ ] Déployé en environnement de test
```

**Équipe mature** :
```markdown
Definition of Done :
- [ ] Code commité et mergé dans main
- [ ] Tests unitaires (coverage >80%)
- [ ] Tests d'intégration passants
- [ ] Code review approuvée par 2 développeurs
- [ ] Documentation API mise à jour (si applicable)
- [ ] Pas de régression de performance (benchmark automatisé)
- [ ] Déployé en staging
- [ ] Tests exploratoires effectués
- [ ] Metrics de monitoring configurées
- [ ] Feature flag en place (si progressive rollout)
```

#### Application Pratique

**DoD recommandée pour e-commerce B2B/B2C** :

```markdown
Definition of Done - E-commerce :

Code Quality :
- [ ] Code review approuvée (min 1 reviewer)
- [ ] Lint/format passants (ESLint, Prettier)
- [ ] Pas de TODO/FIXME laissés
- [ ] Tests unitaires (>80% coverage nouveau code)

Testing :
- [ ] Tests d'intégration passants
- [ ] Tests E2E sur flux impactés (checkout, login)
- [ ] Tests de compatibilité navigateur (Chrome, Firefox, Safari, Edge)
- [ ] Tests responsive (Mobile, Tablet, Desktop)

Performance :
- [ ] Lighthouse score >90 (ou pas de régression)
- [ ] Core Web Vitals conformes
- [ ] Pas de requête >500ms (hors cas justifiés)

Sécurité :
- [ ] Scan de sécurité passant (OWASP ZAP, Snyk)
- [ ] Pas de données sensibles en clair dans le code

Documentation :
- [ ] README mis à jour si nouvelle config
- [ ] API doc générée (Swagger/OpenAPI) si changement API

Deployment :
- [ ] Déployé et vérifié en staging
- [ ] Smoke tests passants
- [ ] Rollback testé (si feature majeure)

Business :
- [ ] Analytics/tracking configurés (GA, Segment)
- [ ] Accepté par PO
```

---

### 3.5 Definition of Ready (DoR)

#### Vulgarisation

La Definition of Ready définit quand une User Story est prête à être prise en développement. C'est l'inverse de la DoD : pas "quand c'est fini", mais "quand on peut commencer".

**Analogie** : Un chef ne commence pas une recette si tous les ingrédients ne sont pas prêts. La DoR, c'est la liste des ingrédients nécessaires avant de cuisiner.

**Pourquoi c'est important** : Prendre une story mal définie en sprint garantit des interruptions, des questions, et du retard.

#### Approfondissement Expert

**Controverse** :

La DoR est controversée dans la communauté agile :
- **Pour** : Évite de prendre des stories incomplètes, réduit les interruptions
- **Contre** : Peut créer une "barrière" anti-agile, ralentir le flux, encourager la sur-spécification

**Position du Scrum Guide** : Pas de DoR officielle, mais le Backlog Refinement vise à rendre les stories "ready".

**Quand l'utiliser** :
- Équipes avec problèmes récurrents de stories mal définies
- Contexte avec dépendances externes (designs, specs API)
- Temporairement, pour instaurer de la discipline

**Exemple de DoR** :

```markdown
Definition of Ready :
- [ ] User Story au format standard avec "so that"
- [ ] Critères d'acceptation définis (3-8)
- [ ] Designs/maquettes disponibles (si UI)
- [ ] Dépendances techniques identifiées
- [ ] Questions clarifiées avec le PO
- [ ] Estimée par l'équipe
- [ ] Taille ≤ 8 story points (sinon, découper)
```

---

### 3.6 Backlog Refinement (Grooming)

#### Vulgarisation

Le Backlog Refinement (anciennement "grooming") est l'activité de préparation des User Stories : clarification, estimation, découpage. C'est le moment où l'équipe "cuisine" le backlog pour le rendre digeste.

**Pourquoi c'est important** : Un Sprint Planning avec un backlog non préparé est un Sprint Planning de 4 heures de chaos.

#### Approfondissement Expert

**Scrum Guide 2020** :
> "Product Backlog refinement is the act of breaking down and further defining Product Backlog items into smaller more precise items."

**Activités typiques** :
- Clarification des stories avec le PO
- Ajout/révision des critères d'acceptation
- Estimation (story points, t-shirt sizes)
- Découpage des stories trop grosses
- Identification des dépendances et risques
- Priorisation/réorganisation

**Fréquence et durée** :
- Scrum Guide : "ongoing activity", pas d'événement prescrit
- Pratique courante : 1 session par semaine, 1-2 heures
- Ou 2 sessions courtes de 45 min
- Objectif : avoir 2-3 sprints de travail "ready"

**Participants** :
- Product Owner (obligatoire)
- Developers (tout ou partie)
- Scrum Master (facilitation)
- Optionnel : UX, QA, experts techniques

**Anti-patterns** :
- Ne pas faire de refinement → Sprint Planning marathon
- Toute l'équipe sur chaque refinement → coûteux, rotatif peut marcher
- Refinement = mini-sprint planning (pas d'engagement)
- PO absent ou ne préparant rien

#### Application Pratique

**Format efficace pour e-commerce** :

```
Session Refinement (1h30) :

1. Review des items "In Progress" (5 min)
   - Le PO présente les retours utilisateurs

2. Deep dive sur 2-3 stories prioritaires (60 min)
   - Lecture de la story
   - Questions/clarifications
   - Discussion des critères d'acceptation
   - Validation du design (maquettes)
   - Estimation

3. Quick review des stories suivantes (20 min)
   - Identification des stories à préparer
   - Assignation des actions (designs à demander, specs à clarifier)

4. Wrap-up (5 min)
   - Résumé des décisions
   - Prochaine session
```

---

### 3.7 Estimation : Story Points, Heures, No Estimates

#### Vulgarisation

L'estimation consiste à évaluer l'effort nécessaire pour réaliser une User Story. Trois écoles existent : les Story Points (unité abstraite de complexité), les heures (temps réel), et le "No Estimates" (ne pas estimer du tout).

**Analogie** :
- **Heures** : "Ce gâteau prendra 2 heures à préparer"
- **Story Points** : "Ce gâteau est un '5' sur notre échelle de difficulté"
- **No Estimates** : "On fait les gâteaux par ordre de priorité, sans estimer"

#### Approfondissement Expert

**Story Points** (Mike Cohn, 2004)

Origine : Adaptation de l'estimation par complexité de XP

Caractéristiques :
- Unité abstraite, pas de conversion directe en heures
- Relative : compare les stories entre elles
- Fibonacci modifiée : 1, 2, 3, 5, 8, 13, 21, ?
- Inclut : effort, complexité, incertitude

Avantages :
- Évite l'illusion de précision des heures
- Encourage la conversation
- Permet la vélocité de l'équipe

Critiques :
- Peut être détourné en pseudo-heures
- "Vélocité" peut devenir une métrique de performance (danger)
- Courbe d'apprentissage pour les nouveaux

**Planning Poker** :
- Technique d'estimation collaborative (James Grenning, 2002)
- Chaque membre estime en secret, puis révélation simultanée
- Discussion des écarts, re-estimation si nécessaire
- Évite l'effet d'ancrage

**T-Shirt Sizes** :
- Alternative simplifiée : XS, S, M, L, XL
- Plus rapide, moins de débats sur les chiffres
- Conversion possible en fourchettes de story points

**No Estimates** (Woody Zuill, Neil Killick, 2010s)

Philosophie : L'estimation est du gaspillage si elle ne guide pas de meilleures décisions.

Arguments :
- Le temps passé à estimer pourrait être passé à développer
- Les estimations sont souvent fausses (optimisme, incertitude)
- Si les stories sont petites et de taille similaire, compter suffit
- Le throughput (items/sprint) est une meilleure métrique

Conditions nécessaires :
- Stories systématiquement petites (1-3 jours)
- Confiance de la direction (pas de demande de dates)
- Maturité de l'équipe

**Recommandation pragmatique** :

| Contexte | Approche suggérée |
|----------|-------------------|
| Nouvelle équipe, nouveau projet | Story Points (apprentissage, calibration) |
| Équipe mature, stories petites | No Estimates ou T-Shirt rapide |
| Stakeholders exigeant des dates | Story Points + vélocité pour projection |
| Équipe distribuée | Planning Poker asynchrone |

#### Application Pratique

**Pour un e-commerce B2B/B2C** :

**Si estimation nécessaire** (stakeholders, roadmap) :
- Story Points avec Planning Poker
- Échelle : 1, 2, 3, 5, 8, 13 (21+ = à découper)
- Story de référence : "En tant qu'utilisateur, je veux ajouter un produit au panier" = 3 points
- Vélocité moyenne après 4-5 sprints = projection fiable

**Si équipe mature** :
- No Estimates + découpage systématique
- Règle : aucune story ne dépasse 3 jours de travail
- Throughput : 12-15 stories par sprint = capacité de planification

---

### 3.8 Sprint Planning

#### Vulgarisation

Le Sprint Planning est la réunion où l'équipe décide ce qu'elle va accomplir pendant le sprint. C'est le moment de transformer le backlog en engagement concret.

#### Approfondissement Expert

**Scrum Guide 2020** :
> "Sprint Planning initiates the Sprint by laying out the work to be performed for the Sprint."

**Les 3 questions du Sprint Planning** :
1. **Pourquoi ce Sprint a-t-il de la valeur ?** → Sprint Goal
2. **Que peut-on accomplir ?** → Sélection des items
3. **Comment le travail sera-t-il fait ?** → Plan pour livrer l'Increment

**Sprint Goal** — Souvent négligé, critique :
- Objectif cohérent, pas une liste de stories
- Donne une direction, permet les arbitrages
- Exemple : "Permettre aux clients B2B de gérer leurs utilisateurs" (pas "finir les 5 stories de gestion utilisateur")

**Capacity-based vs Commitment-based** :

| Approche | Description | Avantages | Inconvénients |
|----------|-------------|-----------|---------------|
| **Capacity-based** | Calcul : (jours dispo × story points/jour) | Prévisible, objectif | Peut ignorer les imprévus |
| **Commitment-based** | L'équipe s'engage sur ce qu'elle peut faire | Flexible, ownership | Risque de sous/sur-engagement |

**Pratique recommandée** : Hybride
- Calculer la capacité comme guide
- L'équipe décide du commitment final
- Garder 20% de marge pour imprévus

#### Application Pratique

**Sprint Planning e-commerce (sprint 2 semaines)** :

```
Durée : 2-4 heures

1. Contexte business (15 min)
   - PO présente les priorités
   - Métriques du sprint précédent
   - Événements à venir (promo, pic de charge)

2. Sprint Goal (15 min)
   - Discussion et accord sur l'objectif
   - Exemple : "Améliorer le taux de conversion checkout de 2%"

3. Sélection des stories (60 min)
   - Revue des stories prêtes
   - Vérification capacité équipe
   - Sélection par priorité jusqu'à capacité

4. Planification détaillée (60-90 min)
   - Découpage en tâches techniques
   - Identification des dépendances
   - Assignation initiale (ou non, selon l'équipe)

5. Wrap-up (15 min)
   - Récap du Sprint Backlog
   - Risques identifiés
   - Questions ouvertes
```

---

## 4. Pratiques d'Ingénierie Logicielle

### 4.1 Clean Code Principles

#### Vulgarisation

Le "Clean Code" (code propre) désigne un code qui est facile à lire, à comprendre et à modifier. Un code propre se lit comme une histoire bien écrite : chaque partie a sa place, le vocabulaire est clair, et on comprend l'intention de l'auteur.

**Analogie** : Un code propre, c'est comme une cuisine bien organisée : chaque ustensile a sa place, les ingrédients sont étiquetés, et n'importe qui peut préparer un repas sans chercher pendant des heures.

**Pourquoi c'est important** : On passe plus de temps à lire du code qu'à en écrire. Un code illisible, c'est de la dette technique qui coûte cher en maintenance et en bugs.

#### Approfondissement Expert

**Origine**

- **2008** : Robert C. Martin (Uncle Bob) publie "Clean Code: A Handbook of Agile Software Craftsmanship"
- S'inscrit dans le mouvement Software Craftsmanship (manifeste 2009)

**Principes fondamentaux** :

**1. Nommage (Naming)**

```javascript
// ❌ Mauvais
const d; // elapsed time in days
const theList = [];
function genymdhms() {}

// ✅ Bon
const elapsedTimeInDays;
const accounts = [];
function generateTimestamp() {}
```

Règles :
- Noms révélateurs d'intention
- Éviter les abréviations cryptiques
- Noms prononçables et recherchables
- Une classe = nom, une méthode = verbe
- Éviter les préfixes inutiles (IInterface, AbstractClass)

**2. Fonctions (Functions)**

```javascript
// ❌ Mauvais : fonction qui fait tout
function processOrder(order, user, paymentInfo, shippingAddress, discountCodes) {
  // 200 lignes de code...
}

// ✅ Bon : fonctions qui font UNE chose
function validateOrder(order) { /* ... */ }
function calculateTotal(order, discounts) { /* ... */ }
function processPayment(paymentInfo, amount) { /* ... */ }
function createShipment(order, address) { /* ... */ }
```

Règles :
- Petites fonctions (20 lignes max, idéalement <10)
- Font UNE seule chose (Single Responsibility)
- Un niveau d'abstraction par fonction
- Nombre d'arguments minimal (0-2 idéal, 3 max)
- Pas d'effets de bord cachés
- Command-Query Separation : une fonction soit modifie l'état, soit retourne une valeur, pas les deux

**3. Commentaires**

```javascript
// ❌ Mauvais : commentaire qui répète le code
// Increment i
i++;

// ❌ Mauvais : code commenté laissé en place
// function oldImplementation() { ... }

// ✅ Bon : commentaire qui explique le POURQUOI
// Workaround for Safari bug #12345 - fixed in Safari 16
if (isSafari && version < 16) { /* ... */ }

// ✅ Bon : JSDoc pour API publique
/**
 * Calculates the total price including taxes and discounts.
 * @param {CartItem[]} items - Cart items
 * @param {string} [couponCode] - Optional discount code
 * @returns {Money} Total amount with currency
 */
function calculateTotal(items, couponCode) { /* ... */ }
```

Règles :
- Le meilleur commentaire est le code qui se documente lui-même
- Commenter le POURQUOI, pas le QUOI
- Éviter le code commenté (le VCS conserve l'historique)
- Mettre à jour les commentaires avec le code
- TODO/FIXME avec issue tracker référencé

**4. Formatage**

- Indentation cohérente (tabs ou spaces, mais pas les deux)
- Ligne de longueur maximale (80-120 caractères)
- Espacement vertical pour séparer les concepts
- Fichiers organisés : constantes en haut, publique avant privé
- Utiliser des outils automatiques (Prettier, ESLint, Black)

**5. Gestion des erreurs**

```javascript
// ❌ Mauvais : exceptions silencieuses
try {
  await processPayment(order);
} catch (e) {
  // Silently ignore
}

// ❌ Mauvais : codes de retour magiques
function findUser(id) {
  if (!user) return -1; // What does -1 mean?
}

// ✅ Bon : exceptions explicites avec contexte
try {
  await processPayment(order);
} catch (error) {
  logger.error('Payment failed', { orderId: order.id, error });
  throw new PaymentFailedError(order.id, error);
}

// ✅ Bon : types explicites (Option/Result pattern)
function findUser(id): User | null { /* ... */ }
```

**Métriques associées** :
- **Cyclomatic Complexity** : Nombre de chemins dans le code (idéal <10)
- **Cognitive Complexity** : Difficulté à comprendre le code (SonarQube)
- **Maintainability Index** : Score composite de maintenabilité

**Outils** :
- Linters : ESLint (JS/TS), Pylint (Python), RuboCop (Ruby)
- Formatters : Prettier, Black, gofmt
- Analyseurs : SonarQube, Code Climate, Codacy

**Critiques et nuances** :
- "Clean Code" peut mener à l'over-engineering
- La lisibilité est parfois subjective
- Les fonctions très courtes peuvent nuire à la performance (inlining)
- Certaines règles sont dépassées (ex: longueur de ligne stricte sur écrans modernes)

#### Application Pratique

**Pour un e-commerce B2B/B2C** :

Exemple de refactoring :

```javascript
// ❌ Avant : fonction monolithique
function checkout(cart, user, payment) {
  if (cart.items.length === 0) throw new Error('Empty cart');
  let total = 0;
  for (let i of cart.items) {
    let price = i.price;
    if (i.discount) price = price * (1 - i.discount);
    if (user.isPremium) price = price * 0.95;
    total += price * i.qty;
  }
  if (payment.type === 'card') {
    // 50 lignes de traitement carte...
  } else if (payment.type === 'paypal') {
    // 50 lignes de traitement PayPal...
  }
  // ... etc
}

// ✅ Après : fonctions décomposées
function checkout(cart, user, payment) {
  validateCart(cart);
  const total = calculateTotal(cart, user);
  const paymentResult = processPayment(payment, total);
  return createOrder(cart, user, paymentResult);
}

function calculateTotal(cart, user) {
  return cart.items
    .map(item => calculateItemPrice(item, user))
    .reduce((sum, price) => sum.add(price), Money.zero());
}

function calculateItemPrice(item, user) {
  let price = item.price;
  if (item.discount) price = price.applyDiscount(item.discount);
  if (user.isPremium) price = price.applyDiscount(PREMIUM_DISCOUNT);
  return price.multiply(item.quantity);
}
```

---

### 4.2 SOLID Principles

#### Vulgarisation

SOLID est un acronyme pour 5 principes de design orienté objet qui rendent le code plus flexible, maintenable et testable. Ce sont les "lois de la physique" de la programmation orientée objet.

**Analogie** : Les principes SOLID sont comme les règles d'une bonne construction : chaque pièce a un rôle précis (S), on peut agrandir sans démolir (O), les prises sont interchangeables (L, I), et l'électricité ne dépend pas du modèle de lampe (D).

#### Approfondissement Expert

**Origine** :
- Acronyme inventé par Michael Feathers ~2004
- Principes formalisés par Robert C. Martin dans les années 2000
- Publiés dans "Agile Software Development" (2002) et "Clean Architecture" (2017)

**S — Single Responsibility Principle (SRP)**

> "A class should have only one reason to change."

Une classe ne devrait avoir qu'une seule responsabilité, qu'une seule raison de changer.

```typescript
// ❌ Violation SRP : User fait trop de choses
class User {
  name: string;
  email: string;

  save() { /* Persiste en BDD */ }
  sendEmail(message: string) { /* Envoie un email */ }
  generateReport() { /* Génère un PDF */ }
}

// ✅ SRP respecté : responsabilités séparées
class User {
  constructor(public name: string, public email: string) {}
}

class UserRepository {
  save(user: User) { /* Persiste en BDD */ }
  findById(id: string): User { /* Récupère de BDD */ }
}

class EmailService {
  send(to: string, message: string) { /* Envoie un email */ }
}

class UserReportGenerator {
  generate(user: User): PDF { /* Génère un PDF */ }
}
```

**O — Open/Closed Principle (OCP)**

> "Software entities should be open for extension, but closed for modification."

Le code existant ne devrait pas être modifié pour ajouter de nouvelles fonctionnalités.

```typescript
// ❌ Violation OCP : modifier la classe pour chaque nouveau type
class PaymentProcessor {
  process(payment: Payment) {
    if (payment.type === 'card') {
      // Traitement carte
    } else if (payment.type === 'paypal') {
      // Traitement PayPal
    } else if (payment.type === 'crypto') { // Nouvelle modification !
      // Traitement crypto
    }
  }
}

// ✅ OCP respecté : extension sans modification
interface PaymentMethod {
  process(amount: Money): PaymentResult;
}

class CardPayment implements PaymentMethod {
  process(amount: Money) { /* ... */ }
}

class PayPalPayment implements PaymentMethod {
  process(amount: Money) { /* ... */ }
}

class CryptoPayment implements PaymentMethod { // Extension !
  process(amount: Money) { /* ... */ }
}

class PaymentProcessor {
  constructor(private method: PaymentMethod) {}

  process(amount: Money) {
    return this.method.process(amount);
  }
}
```

**L — Liskov Substitution Principle (LSP)**

> "Subtypes must be substitutable for their base types."

Une classe dérivée doit pouvoir remplacer sa classe parente sans casser le programme.

```typescript
// ❌ Violation LSP : Square casse le contrat de Rectangle
class Rectangle {
  constructor(protected width: number, protected height: number) {}

  setWidth(w: number) { this.width = w; }
  setHeight(h: number) { this.height = h; }
  area() { return this.width * this.height; }
}

class Square extends Rectangle {
  setWidth(w: number) { this.width = w; this.height = w; } // Viole LSP !
  setHeight(h: number) { this.width = h; this.height = h; } // Viole LSP !
}

// Ce code casse avec Square :
function doubleWidth(rect: Rectangle) {
  rect.setWidth(rect.width * 2);
  // Avec Rectangle : area devient width*2 * height
  // Avec Square : area devient (width*2)² - comportement différent !
}

// ✅ LSP respecté : pas de hiérarchie forcée
interface Shape {
  area(): number;
}

class Rectangle implements Shape {
  constructor(private width: number, private height: number) {}
  area() { return this.width * this.height; }
}

class Square implements Shape {
  constructor(private side: number) {}
  area() { return this.side ** 2; }
}
```

**I — Interface Segregation Principle (ISP)**

> "Clients should not be forced to depend on interfaces they do not use."

Plusieurs interfaces spécifiques valent mieux qu'une grosse interface générale.

```typescript
// ❌ Violation ISP : interface trop grosse
interface Worker {
  work(): void;
  eat(): void;
  sleep(): void;
}

class Robot implements Worker {
  work() { /* OK */ }
  eat() { throw new Error('Robots cannot eat'); } // Forcé d'implémenter !
  sleep() { throw new Error('Robots cannot sleep'); } // Forcé d'implémenter !
}

// ✅ ISP respecté : interfaces ségrégées
interface Workable {
  work(): void;
}

interface Eatable {
  eat(): void;
}

interface Sleepable {
  sleep(): void;
}

class Human implements Workable, Eatable, Sleepable {
  work() { /* ... */ }
  eat() { /* ... */ }
  sleep() { /* ... */ }
}

class Robot implements Workable {
  work() { /* ... */ }
}
```

**D — Dependency Inversion Principle (DIP)**

> "High-level modules should not depend on low-level modules. Both should depend on abstractions."

Les modules de haut niveau ne doivent pas dépendre des modules de bas niveau. Les deux doivent dépendre d'abstractions.

```typescript
// ❌ Violation DIP : OrderService dépend directement de MySQLDatabase
class MySQLDatabase {
  save(data: any) { /* ... */ }
}

class OrderService {
  private db = new MySQLDatabase(); // Couplage fort !

  createOrder(order: Order) {
    // Logique métier
    this.db.save(order);
  }
}

// ✅ DIP respecté : dépendance sur abstraction
interface OrderRepository {
  save(order: Order): void;
  findById(id: string): Order;
}

class MySQLOrderRepository implements OrderRepository {
  save(order: Order) { /* Implémentation MySQL */ }
  findById(id: string) { /* ... */ }
}

class MongoOrderRepository implements OrderRepository {
  save(order: Order) { /* Implémentation MongoDB */ }
  findById(id: string) { /* ... */ }
}

class OrderService {
  constructor(private repository: OrderRepository) {} // Injection !

  createOrder(order: Order) {
    // Logique métier
    this.repository.save(order);
  }
}

// Usage avec injection
const service = new OrderService(new MySQLOrderRepository());
// Ou pour les tests :
const testService = new OrderService(new MockOrderRepository());
```

**Critiques des principes SOLID** :
- Peuvent mener à une sur-abstraction
- Parfois YAGNI l'emporte sur SOLID pour les petits projets
- LSP et OCP sont souvent mal compris
- Le "Single Responsibility" est interprété différemment selon les auteurs

#### Application Pratique

**Pour un e-commerce B2B/B2C** :

**SRP** : Séparer la logique de calcul de prix (PriceCalculator), de la gestion du panier (CartService), et de la communication (NotificationService).

**OCP** : Système de promotions extensible via interface `DiscountStrategy` — ajout d'un nouveau type de promo sans modifier le code existant.

**LSP** : Si `B2BCustomer` hérite de `Customer`, s'assurer que les méthodes marchent identiquement (ex: pas de `getDiscount()` qui retourne null pour B2B).

**ISP** : Interface `PaymentGateway` minimale. Stripe et PayPal n'implémentent que ce dont ils ont besoin.

**DIP** : L'OrderService dépend d'une interface `InventoryService`, pas directement de l'API du warehouse.

---

### 4.3 DRY, KISS, YAGNI

#### Vulgarisation

Ces trois acronymes sont les mantras des développeurs pragmatiques :
- **DRY** : Don't Repeat Yourself — Ne te répète pas
- **KISS** : Keep It Simple, Stupid — Fais simple
- **YAGNI** : You Ain't Gonna Need It — Tu n'en auras pas besoin

**Analogie** : En cuisine, DRY c'est avoir UNE recette de sauce tomate réutilisable, pas la réécrire dans chaque plat. KISS c'est faire des pâtes al dente plutôt qu'une construction moléculaire. YAGNI c'est ne pas acheter un robot pâtissier avant d'avoir fait un seul gâteau.

#### Approfondissement Expert

**DRY — Don't Repeat Yourself** (Andy Hunt & Dave Thomas, "The Pragmatic Programmer", 1999)

> "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system."

```javascript
// ❌ Violation DRY
function validateEmailSignup(email) {
  return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(email);
}

function validateEmailContact(email) {
  return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(email);
}

// ✅ DRY
const EMAIL_REGEX = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

function validateEmail(email) {
  return EMAIL_REGEX.test(email);
}
```

**Attention** : DRY ne veut pas dire "éliminer toute duplication". Parfois deux morceaux de code similaires ont des raisons de changer différentes.

**KISS — Keep It Simple, Stupid** (Origine : US Navy, 1960s, attribué à Kelly Johnson)

```javascript
// ❌ Over-engineering
class DateFormatterFactory {
  createFormatter(locale, format, timezone) {
    return new DateFormatterBuilder()
      .withLocale(locale)
      .withFormat(format)
      .withTimezone(timezone)
      .build();
  }
}

// ✅ KISS
function formatDate(date, locale = 'fr-FR') {
  return date.toLocaleDateString(locale);
}
```

**YAGNI — You Ain't Gonna Need It** (XP, Kent Beck, 1990s)

> "Always implement things when you actually need them, never when you just foresee that you need them."

```javascript
// ❌ Violation YAGNI : fonctionnalités "au cas où"
class ShoppingCart {
  constructor() {
    this.items = [];
    this.savedForLater = []; // "On en aura sûrement besoin"
    this.wishlist = []; // "Les concurrents l'ont"
    this.giftOptions = {}; // "Pour Noël, peut-être"
    this.subscriptionFrequency = null; // "Un jour on fera de l'abo"
  }
}

// ✅ YAGNI : uniquement ce qui est demandé
class ShoppingCart {
  constructor() {
    this.items = [];
  }
}
```

**Tensions entre ces principes** :

| Situation | DRY dit | KISS dit | YAGNI dit |
|-----------|---------|----------|-----------|
| 2 fonctions similaires | Abstraire ! | Pas si c'est plus compliqué | Quand ça se répète 3x |
| Architecture flexible | Pattern réutilisable | Si ça marche, ok | Quand c'est nécessaire |
| Configuration externalisée | Single source of truth | Hardcoder peut suffire | Quand y'a 2 environnements |

**Règle pratique** : "Rule of Three" — Dupliquer est OK jusqu'à 3 fois, puis abstraire.

---

### 4.4 Code Review

#### Vulgarisation

La Code Review est le processus où un ou plusieurs développeurs relisent le code écrit par un collègue avant qu'il soit intégré. C'est comme la relecture d'un article avant publication : on cherche les erreurs, les améliorations, et on partage les connaissances.

**Pourquoi c'est important** : Deux paires d'yeux valent mieux qu'une. La code review attrape des bugs, améliore la qualité, et diffuse les connaissances dans l'équipe.

#### Approfondissement Expert

**Objectifs de la code review** :

1. **Trouver des bugs** (moins important qu'on pense — les tests font mieux)
2. **Améliorer la qualité du code** (lisibilité, maintenabilité)
3. **Partager les connaissances** (le reviewer apprend le code, l'auteur reçoit des conseils)
4. **Assurer la cohérence** (standards de l'équipe)
5. **Mentoring** (juniors apprennent des seniors)

**Processus typique** :

```
[Développeur] Push sur feature branch
      ↓
[Développeur] Crée Pull Request / Merge Request
      ↓
[CI] Tests automatiques, linting
      ↓
[Reviewer(s)] Revue du code
      ↓
[Cycle] Commentaires ↔ Corrections
      ↓
[Reviewer] Approbation
      ↓
[Merge] Intégration dans main
```

**Bonnes pratiques — Pour l'auteur** :

- PRs petites (idéal : <400 lignes, max : <800)
- Description claire : quoi, pourquoi, comment tester
- Auto-review avant de soumettre
- Tests inclus
- Linting/formatting passés

**Bonnes pratiques — Pour le reviewer** :

- Prioriser la review (ne pas bloquer l'équipe)
- Commencer par comprendre l'intention
- Distinguer : bloquant / suggestion / question
- Être constructif, pas critique
- Proposer des alternatives, pas juste pointer les problèmes
- Complimenter les bonnes idées

**Format des commentaires** :

```markdown
# Bloquant (doit être corrigé)
🔴 **Bloquant** : Cette requête SQL est vulnérable à l'injection.
Utiliser des paramètres préparés.

# Suggestion (amélioration recommandée)
🟡 **Suggestion** : Ce code serait plus lisible avec une early return.

# Question (clarification)
🔵 **Question** : Pourquoi utiliser `any` ici plutôt qu'un type spécifique ?

# Nitpick (mineur, optionnel)
⚪ **Nit** : Typo dans le commentaire ligne 42.

# Compliment
🟢 **Nice!** Bonne utilisation du pattern Strategy ici.
```

**Conventional Comments** (format standardisé) :

```
<label>: <sujet>

<label>(<decoration>): <sujet>

Labels: praise, nitpick, suggestion, issue, question, thought, chore
Decorations: non-blocking, blocking, if-minor
```

**Métriques de code review** :
- **Time to first review** : Temps avant la première review
- **PR cycle time** : Temps total jusqu'au merge
- **Review depth** : Nombre de commentaires par PR
- **Reviewer distribution** : Éviter le "reviewer unique"

**Anti-patterns** :
- PRs gigantesques (>1000 lignes)
- Rubber stamping (approuver sans lire)
- Review comme gatekeeper (blocage systématique)
- Commentaires toxiques ou personnels
- Bikeshedding (débattre des détails insignifiants)

#### Application Pratique

**Template de PR pour e-commerce** :

```markdown
## Description
[Résumé en 1-2 phrases]

## Type de changement
- [ ] Bug fix
- [ ] Nouvelle fonctionnalité
- [ ] Refactoring
- [ ] Documentation

## Tickets liés
- JIRA-123

## Comment tester
1. Aller sur la page produit
2. Ajouter au panier
3. Vérifier que le prix est correct

## Checklist
- [ ] Tests unitaires ajoutés/mis à jour
- [ ] Tests E2E passants
- [ ] Documentation mise à jour
- [ ] Pas de console.log oubliés
- [ ] Migrations reversibles

## Screenshots (si UI)
[Avant/Après]
```

---

### 4.5 Pair Programming et Mob Programming

#### Vulgarisation

Le **Pair Programming** consiste à coder à deux sur un même ordinateur : un "driver" (qui tape) et un "navigator" (qui réfléchit et guide). Le **Mob Programming** étend ce concept à toute l'équipe sur un seul écran.

**Analogie** : Le pair programming, c'est comme conduire avec un co-pilote en rallye. Le mob programming, c'est comme une salle de contrôle spatiale où tout le monde collabore sur une mission.

#### Approfondissement Expert

**Pair Programming** (XP, Kent Beck)

**Styles de pairing** :

| Style | Description | Usage |
|-------|-------------|-------|
| **Driver-Navigator** | Classique — un tape, l'autre guide | Standard |
| **Ping-Pong** | Alternance rapide, souvent avec TDD | TDD strict |
| **Strong-style** | "Pour qu'une idée aille au clavier, elle doit passer par quelqu'un d'autre" | Mentoring |
| **Tour guide** | Expert guide un junior dans son code | Onboarding |

**Bénéfices documentés** :
- Réduction des bugs (études montrent 15-40% de moins)
- Diffusion des connaissances
- Focus accru (moins de distractions)
- Meilleur design (discussion continue)

**Défis** :
- Fatiguant (4-6h max/jour recommandées)
- Pas adapté à toutes les personnalités
- Peut être perçu comme inefficient (2 devs pour 1 code)
- Difficile en remote (latence, fatigue écran)

**Mob Programming** (Woody Zuill, 2012)

"All the brilliant minds working together on the same thing, at the same time, in the same space, and at the same computer." — Woody Zuill

**Format typique** :
- 1 driver (tourne toutes les 5-15 min)
- N navigators (toute l'équipe)
- 1 facilitateur (optionnel)
- Rotations régulières

**Quand l'utiliser** :
- Problèmes complexes nécessitant plusieurs expertises
- Onboarding d'équipe sur un nouveau sujet
- Alignement sur les standards de code
- Formation collective

#### Application Pratique

**Pour un e-commerce** :

**Pair programming recommandé pour** :
- Intégration d'un nouveau moyen de paiement
- Refactoring d'un module critique (checkout)
- Code touchant à la sécurité (authentification, tokens)

**Mob programming recommandé pour** :
- Définition de l'architecture d'une nouvelle fonctionnalité majeure
- Résolution d'un bug complexe multi-composants
- Onboarding d'un nouveau développeur sur le projet

---

### 4.6 Refactoring

#### Vulgarisation

Le Refactoring est l'art d'améliorer la structure interne du code sans changer son comportement externe. C'est comme réorganiser votre maison : les meubles sont mieux placés, mais c'est toujours votre maison.

**Pourquoi c'est important** : Le code se dégrade naturellement avec le temps (entropy). Le refactoring combat cette dégradation et garde le code maintenable.

#### Approfondissement Expert

**Origine** : Martin Fowler, "Refactoring: Improving the Design of Existing Code" (1999, 2018 2ème édition)

**Définition formelle** : "A change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its observable behavior."

**Techniques de refactoring courantes** :

| Technique | Description | Signal |
|-----------|-------------|--------|
| **Extract Method** | Extraire du code dans une nouvelle méthode | Méthode trop longue |
| **Inline Method** | Intégrer le corps d'une méthode | Méthode triviale |
| **Extract Variable** | Nommer une expression complexe | Expression difficile à lire |
| **Rename** | Renommer variable/méthode/classe | Nom peu clair |
| **Move Method** | Déplacer vers une classe plus appropriée | Feature Envy |
| **Extract Class** | Séparer une classe trop grosse | Classe avec trop de responsabilités |
| **Replace Conditional with Polymorphism** | Utiliser le polymorphisme au lieu de if/else | Long switch/if |
| **Introduce Parameter Object** | Regrouper des paramètres liés | Trop de paramètres |

**Code Smells** (signes qu'un refactoring est nécessaire) :

- **Long Method** : Méthode trop longue
- **Large Class** : Classe faisant trop de choses
- **Feature Envy** : Méthode plus intéressée par une autre classe
- **Data Clumps** : Données toujours ensemble
- **Primitive Obsession** : Utilisation excessive de types primitifs
- **Divergent Change** : Une classe modifiée pour des raisons différentes
- **Shotgun Surgery** : Un changement impacte de nombreux fichiers
- **Comments** : Commentaires compensant un mauvais code

**Règles de refactoring** :
1. Avoir des tests AVANT de refactorer
2. Petits pas (commit fréquents)
3. Un refactoring = un commit
4. Ne pas mélanger refactoring et changement fonctionnel

#### Application Pratique

**Exemple e-commerce** :

```javascript
// Avant : Code smell "Long Method" + "Feature Envy"
function processOrder(order) {
  // Calcul du total (60 lignes)
  let subtotal = 0;
  for (const item of order.items) {
    let price = item.product.price;
    if (item.product.category === 'electronics') {
      price = price * 0.9; // 10% off electronics
    }
    if (order.customer.membershipLevel === 'gold') {
      price = price * 0.95;
    }
    subtotal += price * item.quantity;
  }

  // Calcul des frais de port (40 lignes)
  let shipping = 0;
  if (order.shippingAddress.country === 'FR') {
    if (subtotal > 50) {
      shipping = 0;
    } else {
      shipping = 4.99;
    }
  } else {
    // ... international shipping logic
  }

  // ... encore 100 lignes
}

// Après : Refactoring Extract Method
function processOrder(order) {
  const subtotal = calculateSubtotal(order);
  const shipping = calculateShipping(order, subtotal);
  const tax = calculateTax(subtotal, order.shippingAddress);
  const total = subtotal + shipping + tax;

  return createInvoice(order, { subtotal, shipping, tax, total });
}

function calculateSubtotal(order) {
  return order.items
    .map(item => calculateItemPrice(item, order.customer))
    .reduce((sum, price) => sum + price, 0);
}

function calculateItemPrice(item, customer) {
  let price = item.product.price;
  price = applyCategoryDiscount(price, item.product.category);
  price = applyMembershipDiscount(price, customer.membershipLevel);
  return price * item.quantity;
}
```

---

### 4.7 Dette Technique

#### Vulgarisation

La dette technique, c'est comme les intérêts d'un emprunt : quand on prend des raccourcis dans le code pour aller vite, on "emprunte" du temps futur. Tôt ou tard, il faudra "rembourser" en corrigeant le code, et plus on attend, plus les intérêts (la complexité) s'accumulent.

**Analogie** : Acheter à crédit permet d'avoir une maison tout de suite, mais on paiera plus au total. La dette technique permet de livrer vite, mais le code coûtera plus cher à maintenir.

#### Approfondissement Expert

**Origine** : Ward Cunningham, 1992 (rapport OOPSLA)

> "Shipping first time code is like going into debt. A little debt speeds development so long as it is paid back promptly with a rewrite."

**Les Quadrants de la Dette Technique** (Martin Fowler, 2009)

|  | Délibérée | Involontaire |
|--|-----------|--------------|
| **Prudente** | "On sait qu'on fait un raccourci, on le paiera plus tard" | "Maintenant on sait comment on aurait dû faire" |
| **Imprudente** | "On n'a pas le temps pour le design" | "C'est quoi les patterns ?" |

**Types de dette** :
- **Code debt** : Mauvais code, duplication, complexité
- **Design debt** : Architecture inadaptée
- **Test debt** : Tests manquants ou insuffisants
- **Documentation debt** : Documentation absente ou obsolète
- **Infrastructure debt** : Outils/environnements vieillissants

**Gestion de la dette technique** :

1. **Identifier** : Code reviews, métriques (complexité, duplication), feedback équipe
2. **Documenter** : Tracker (Jira, etc.), ADRs pour les décisions
3. **Prioriser** : Impact × effort, couplage avec features
4. **Planifier** : % du sprint dédié (10-20%), "Boy Scout Rule"
5. **Communiquer** : Expliquer aux stakeholders le coût de l'ignorer

**Boy Scout Rule** (Robert C. Martin) :
> "Always leave the code better than you found it."

Chaque passage dans le code = petite amélioration.

**Métriques** :
- **Code coverage** : Indicateur de test debt
- **Technical Debt Ratio** (SonarQube) : Temps de remédiation / temps de développement
- **Cyclomatic Complexity** : Complexité du code
- **Duplication** : Pourcentage de code dupliqué

#### Application Pratique

**Pour un e-commerce** :

**Dette typique** :
- Logique de prix hardcodée (devrait être configurable)
- Tests E2E manquants sur le checkout
- API monolithique (devrait être découplée)
- Pas de cache sur les requêtes produits fréquentes

**Stratégie recommandée** :
- 20% du sprint pour la dette technique
- Prioriser la dette sur les composants les plus modifiés
- Ne jamais laisser la dette augmenter pendant les pics (Black Friday = gel des changements risqués)

---

### 4.8 Documentation as Code

#### Vulgarisation

"Documentation as Code" signifie traiter la documentation comme du code : versionnée, reviewée, automatisée, et proche du code qu'elle documente.

**Pourquoi c'est important** : Une documentation séparée devient rapidement obsolète. Une documentation "as code" évolue avec le code.

#### Approfondissement Expert

**Principes** :
- Documentation dans le repo (pas un wiki séparé)
- Format texte (Markdown, AsciiDoc)
- Versionnée avec Git
- Générée automatiquement quand possible
- Reviewée dans les PRs

**Types de documentation** :

| Type | Format | Contenu |
|------|--------|---------|
| **README** | Markdown | Quick start, overview |
| **API Docs** | OpenAPI/Swagger | Endpoints, paramètres |
| **ADR** | Markdown template | Décisions architecturales |
| **Code comments** | JSDoc, docstrings | API publique, complexité |
| **Guides** | Markdown | How-to, tutorials |
| **CHANGELOG** | Markdown | Historique des versions |

**Architecture Decision Records (ADRs)**

Format proposé par Michael Nygard (2011) :

```markdown
# ADR-001: Utilisation de GraphQL pour l'API produits

## Status
Accepted

## Context
L'API REST actuelle nécessite plusieurs appels pour récupérer un produit avec ses variantes, son stock, et ses images. Le frontend mobile souffre de latence.

## Decision
Nous adopterons GraphQL pour l'API produits, permettant au client de demander exactement les données nécessaires en un seul appel.

## Consequences
- ✅ Réduction des appels réseau
- ✅ Flexibilité pour différents clients (web, mobile)
- ❌ Complexité accrue côté serveur
- ❌ Formation nécessaire pour l'équipe
```

**Outils** :
- **Générateurs de docs** : Docusaurus, MkDocs, Sphinx
- **API docs** : Swagger UI, Redoc, Stoplight
- **Diagrammes** : Mermaid, PlantUML (dans Markdown)
- **ADR tools** : adr-tools, log4brains

#### Application Pratique

**Structure recommandée pour un projet e-commerce** :

```
/docs
  /adr                    # Architecture Decision Records
    ADR-001-graphql.md
    ADR-002-payment-gateway.md
  /api                    # Documentation API
    openapi.yaml
  /guides
    deployment.md
    onboarding.md
  architecture.md         # Vue d'ensemble architecture
README.md                 # Quick start
CHANGELOG.md             # Historique des versions
CONTRIBUTING.md          # Guide de contribution
```

---

## 5. Gestion de Version et Collaboration

### 5.1 Git Workflows

#### Vulgarisation

Un Git Workflow est une convention sur comment utiliser Git en équipe : comment créer des branches, quand merger, comment nommer les commits. C'est le "code de la route" du travail collaboratif sur le code.

**Analogie** : Sans workflow, c'est comme une cuisine où chacun range ses ustensiles où il veut. Avec un workflow, tout le monde sait où trouver les casseroles et où les ranger.

#### Approfondissement Expert

**Les principaux workflows** :

**1. GitFlow** (Vincent Driessen, 2010)

```
main ─────────────────────────────────────────────────────→
   ↑                          ↑                      ↑
   └── release/1.0 ──────────┘                      │
         ↑                                           │
develop ─┴───────────────────────────────────────────┴───→
   ↑ ↑ ↑
   │ │ └── feature/cart
   │ └── feature/search
   └── feature/login
```

Branches :
- **main** : Production stable
- **develop** : Intégration des features
- **feature/*** : Nouvelles fonctionnalités
- **release/*** : Préparation des releases
- **hotfix/*** : Corrections urgentes en prod

Avantages :
- Structure claire pour les releases planifiées
- Séparation nette entre prod et dev

Inconvénients :
- Complexe pour les petites équipes
- Long cycle de feedback
- Merges fréquents et complexes

**2. GitHub Flow** (GitHub, ~2011)

```
main ───●───●───●───●───●───●───●───●───●───→
        │       ↑       │       ↑
        └──────┬┘       └──────┬┘
           feature           feature
```

Règles simples :
1. `main` est toujours déployable
2. Créer une branche pour chaque changement
3. Ouvrir une PR dès que possible
4. Merger dans `main` après review et CI verte
5. Déployer immédiatement après merge

Avantages :
- Simple, facile à apprendre
- Adapté au déploiement continu
- Feedback rapide

Inconvénients :
- Pas de staging intégré au workflow
- Nécessite une CI/CD robuste
- Pas adapté aux releases planifiées

**3. Trunk-Based Development** (Paul Hammant et al.)

```
main ───●───●───●───●───●───●───●───●───●───→
        │   │   │   │   │   │   │   │   │
       (très courtes branches ou commits directs)
```

Principes :
- Branches très courtes (<1-2 jours)
- Ou commits directs sur trunk (avec feature flags)
- CI plusieurs fois par jour
- Feature flags pour le code non terminé

Avantages :
- Intégration continue réelle
- Pas de merge hell
- Feedback immédiat

Inconvénients :
- Nécessite maturité et discipline
- Feature flags obligatoires
- CI/CD très robuste requise

**Comparaison** :

| Critère | GitFlow | GitHub Flow | Trunk-Based |
|---------|---------|-------------|-------------|
| Complexité | Haute | Faible | Moyenne |
| Fréquence release | Planifiée | Continue | Continue |
| Taille équipe | Grande | Petite-Moyenne | Mature |
| CI/CD requis | Optionnel | Nécessaire | Critique |
| Feature flags | Optionnel | Optionnel | Nécessaire |

#### Application Pratique

**Recommandation pour e-commerce B2B/B2C** :

**Petite équipe (1-5 devs), déploiement fréquent** → GitHub Flow
- Simple et efficace
- main = production
- PRs courtes et reviews rapides

**Équipe moyenne (5-15 devs), releases planifiées** → GitFlow simplifié
- Sans la branche develop (main + features + releases)
- Releases pour les jalons majeurs (Black Friday, etc.)

**Équipe mature, CD** → Trunk-Based
- Avec feature flags obligatoires
- CI/CD très solide
- Pour les équipes expérimentées

---

### 5.2 Branching Strategies et Conventions de Nommage

#### Vulgarisation

Les conventions de nommage des branches permettent de savoir immédiatement ce que contient une branche juste en lisant son nom.

#### Approfondissement Expert

**Conventions courantes** :

```
<type>/<ticket-id>-<description-courte>

Exemples :
feature/SHOP-123-add-wishlist
bugfix/SHOP-456-fix-cart-total
hotfix/SHOP-789-payment-crash
refactor/SHOP-101-cleanup-checkout
chore/update-dependencies
```

**Types courants** :
- `feature/` : Nouvelle fonctionnalité
- `bugfix/` ou `fix/` : Correction de bug
- `hotfix/` : Correction urgente production
- `refactor/` : Refactoring sans changement fonctionnel
- `chore/` : Tâches techniques, maintenance
- `docs/` : Documentation
- `experiment/` : Explorations, POCs

**Bonnes pratiques** :
- Noms en anglais (ou cohérent avec l'équipe)
- Kebab-case (mots séparés par des tirets)
- Référence au ticket (traçabilité)
- Court mais descriptif

---

### 5.3 Commit Conventions

#### Vulgarisation

Les messages de commit bien formatés permettent de comprendre l'historique du projet, de générer des changelogs, et d'automatiser le versioning.

#### Approfondissement Expert

**Conventional Commits** (conventionalcommits.org)

Format :
```
<type>(<scope>): <description>

[body optionnel]

[footer(s) optionnel(s)]
```

**Types standard** :
- `feat` : Nouvelle fonctionnalité (→ MINOR en semver)
- `fix` : Correction de bug (→ PATCH en semver)
- `docs` : Documentation uniquement
- `style` : Formatage, pas de changement de code
- `refactor` : Ni fix ni feature
- `perf` : Amélioration de performance
- `test` : Ajout ou correction de tests
- `chore` : Tâches de maintenance
- `ci` : Configuration CI
- `build` : Système de build, dépendances

**Breaking changes** :
- `!` après le type : `feat!: change API`
- Ou footer : `BREAKING CHANGE: description`

**Exemples** :

```
feat(cart): add quantity selector to cart items

Add +/- buttons to modify quantities directly from cart page.
Closes #234

---

fix(checkout): correct tax calculation for EU countries

Tax was calculated on shipping cost incorrectly for EU orders.

Fixes #456

---

feat(api)!: change response format for product endpoint

BREAKING CHANGE: Product endpoint now returns nested 'data' object.
Migration guide: https://docs.example.com/migration/v2

---

chore(deps): update lodash to 4.17.21

Security patch for prototype pollution vulnerability.
```

**Semantic Versioning (SemVer)**

Format : `MAJOR.MINOR.PATCH`
- MAJOR : Breaking changes
- MINOR : Nouvelles fonctionnalités (backward compatible)
- PATCH : Bug fixes

Automatisation avec conventional commits :
- `feat` → bump MINOR
- `fix` → bump PATCH
- `BREAKING CHANGE` → bump MAJOR

**Outils** :
- **Commitlint** : Valide les messages de commit
- **Husky** : Git hooks pour validation
- **Standard-version** / **semantic-release** : Release automatisé
- **Commitizen** : Helper interactif pour écrire des commits

---

### 5.4 Pull Request / Merge Request Best Practices

#### Vulgarisation

Une Pull Request (GitHub) ou Merge Request (GitLab) est une demande pour intégrer votre code dans la branche principale. C'est le moment de la code review et des vérifications automatiques.

#### Approfondissement Expert

**Taille optimale** :
- Idéal : < 400 lignes de diff
- Acceptable : < 800 lignes
- À éviter : > 1000 lignes (découper en plusieurs PRs)

Études : PRs plus petites = reviews plus rapides et de meilleure qualité.

**Structure d'une bonne PR** :

```markdown
## Résumé
[1-2 phrases décrivant le changement]

## Motivation
[Pourquoi ce changement est nécessaire]

## Changements
- [Changement 1]
- [Changement 2]

## Comment tester
1. [Étape 1]
2. [Étape 2]

## Checklist
- [ ] Tests ajoutés
- [ ] Documentation mise à jour
- [ ] Migration reversible

## Screenshots (si UI)
[Avant / Après]

## Tickets liés
Closes #123
```

**Draft PRs / WIP** :
- Ouvrir tôt pour feedback précoce
- Marquer comme "Draft" ou "[WIP]"
- Demander une review partielle si besoin

**Auto-merge** :
- Merger automatiquement quand :
  - CI passe
  - Reviews approuvées
  - Pas de conflits
- Évite d'attendre manuellement

**Squash, Merge ou Rebase ?**

| Stratégie | Résultat | Quand l'utiliser |
|-----------|----------|------------------|
| **Merge commit** | Conserve tout l'historique | Historique détaillé important |
| **Squash and merge** | 1 commit par PR | Historique propre, PRs atomiques |
| **Rebase and merge** | Historique linéaire | Puristes de l'historique |

Recommandation : **Squash and merge** pour la plupart des équipes — chaque PR = 1 commit clair dans main.

---

### 5.5 Code Review Guidelines (Détail)

#### Application Pratique pour e-commerce

**Checklist de review e-commerce** :

```markdown
## Fonctionnel
- [ ] Le comportement correspond aux critères d'acceptation
- [ ] Cas limites gérés (panier vide, stock 0, etc.)

## Performance
- [ ] Pas de N+1 queries
- [ ] Requêtes optimisées (index, pagination)
- [ ] Assets optimisés (images, bundles)

## Sécurité
- [ ] Pas d'injection SQL/XSS
- [ ] Validation des inputs
- [ ] Autorisation vérifiée (un user ne peut pas voir les commandes d'un autre)
- [ ] Données sensibles non loggées

## SEO (si applicable)
- [ ] Meta tags appropriés
- [ ] URLs propres
- [ ] Schema markup si pertinent

## Accessibilité
- [ ] Labels sur les inputs
- [ ] Alt text sur les images
- [ ] Navigation clavier possible
```

---

## 6. CI/CD et DevOps

### 6.1 Continuous Integration (CI)

#### Vulgarisation

L'intégration continue (CI) est la pratique d'intégrer le code de tous les développeurs dans une branche commune plusieurs fois par jour, avec des tests automatiques à chaque intégration.

**Analogie** : Au lieu d'assembler toutes les pièces d'un puzzle à la fin (et découvrir qu'elles ne s'emboîtent pas), on assemble progressivement et on vérifie que chaque pièce s'ajuste.

**Pourquoi c'est important** : Détecte les problèmes tôt, quand ils sont faciles à corriger. Évite le "merge hell" du vendredi soir.

#### Approfondissement Expert

**Origine** : Grady Booch (années 1990), popularisé par XP (Kent Beck), formalisé par Martin Fowler.

**Article de référence** : "Continuous Integration" de Martin Fowler (2006, mis à jour régulièrement)

**Principes fondamentaux** (Martin Fowler) :
1. Maintenir un repository unique
2. Automatiser le build
3. Rendre le build auto-testant
4. Commit quotidien sur main (ou branche partagée)
5. Chaque commit déclenche un build
6. Build rapide (<10 min idéal)
7. Tester dans un environnement clone de production
8. Rendre les artéfacts facilement accessibles
9. Tout le monde voit les résultats du build
10. Automatiser le déploiement

**Pipeline CI typique** :

```
[Push] → [Build] → [Unit Tests] → [Lint/Format] → [Security Scan] → [✅/❌]
```

Étapes détaillées :
1. **Checkout** : Récupérer le code
2. **Install** : Installer les dépendances
3. **Lint** : Vérifier le style de code
4. **Build** : Compiler/bundler
5. **Unit Tests** : Tests unitaires
6. **Integration Tests** : Tests d'intégration
7. **Security Scan** : Analyse de vulnérabilités (SAST)
8. **Artifacts** : Générer les artéfacts déployables

**Métriques CI** :
- **Build success rate** : % de builds verts
- **Build duration** : Temps moyen de build
- **Time to fix** : Temps pour corriger un build cassé
- **Flakiness** : Taux de tests instables

**Bonnes pratiques** :
- "Fix broken builds immediately" — priorité absolue
- Ne pas committer sur un build cassé
- Build < 10 minutes (sinon, paralléliser)
- Résultats visibles par tous (radiateur d'information)

**Outils CI** :
- **SaaS** : GitHub Actions, GitLab CI, CircleCI, Travis CI
- **Self-hosted** : Jenkins, Drone, Concourse
- **Cloud providers** : AWS CodeBuild, Azure DevOps, Google Cloud Build

#### Application Pratique

**Pipeline CI pour e-commerce Next.js/Node.js** :

```yaml
# .github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Lint
        run: npm run lint

      - name: Type check
        run: npm run typecheck

      - name: Unit tests
        run: npm run test:unit -- --coverage

      - name: Build
        run: npm run build

      - name: E2E tests
        run: npm run test:e2e

      - name: Security scan
        run: npm audit --audit-level=high
```

---

### 6.2 Continuous Delivery vs Continuous Deployment

#### Vulgarisation

- **Continuous Delivery** : Le code est toujours prêt à être déployé (un clic suffit)
- **Continuous Deployment** : Le code est automatiquement déployé en production

**Analogie** : Continuous Delivery, c'est avoir le paquet cadeau prêt à être envoyé. Continuous Deployment, c'est l'envoyer automatiquement dès qu'il est emballé.

#### Approfondissement Expert

**Distinction clé** :

```
Continuous Integration
        ↓
    [Build + Test]
        ↓
Continuous Delivery
        ↓
    [Deploy to Staging]
        ↓
    [Manual Approval] ← DIFFÉRENCE
        ↓
Continuous Deployment
        ↓
    [Auto Deploy to Production]
```

| Aspect | Continuous Delivery | Continuous Deployment |
|--------|--------------------|-----------------------|
| Déploiement prod | Manuel (1 clic) | Automatique |
| Contrôle | Plus de contrôle | Plus de vitesse |
| Risque | Contrôlé | Nécessite confiance haute |
| Rollback | Manuel ou auto | Automatique |
| Exemple | Banques, healthcare | Netflix, Etsy |

**Prérequis pour Continuous Deployment** :
- Tests automatisés très fiables
- Feature flags
- Monitoring et alerting robustes
- Rollback automatique
- Culture blameless

---

### 6.3 Pipeline Design

#### Vulgarisation

Le pipeline est la séquence d'étapes automatisées qui transforme le code en application déployée. Bien conçu, il garantit qualité et rapidité.

#### Approfondissement Expert

**Stages typiques** :

```
[Source] → [Build] → [Test] → [Security] → [Staging] → [Approval] → [Production]
```

**Détail des stages** :

1. **Source**
   - Déclencheur (push, PR, schedule, webhook)
   - Checkout du code

2. **Build**
   - Installation des dépendances
   - Compilation/transpilation
   - Bundling
   - Génération d'artéfacts

3. **Test**
   - Unit tests
   - Integration tests
   - E2E tests (sur environnement éphémère)
   - Performance tests (optionnel)

4. **Security**
   - SAST (Static Application Security Testing)
   - Dependency scanning
   - Secret detection
   - Container scanning

5. **Deploy Staging**
   - Déploiement sur environnement de staging
   - Smoke tests
   - Tests d'acceptation automatisés

6. **Deploy Production**
   - Blue-green / Canary / Rolling
   - Smoke tests post-deploy
   - Monitoring renforcé

**Patterns de déploiement** :

| Pattern | Description | Rollback |
|---------|-------------|----------|
| **Rolling** | Mise à jour progressive des instances | Lent |
| **Blue-Green** | Deux environnements, switch DNS | Instantané |
| **Canary** | Déploiement progressif (1%, 10%, 50%, 100%) | Rapide |
| **Feature Flags** | Code déployé mais fonctionnalité désactivée | Instantané |

---

### 6.4 Infrastructure as Code (IaC)

#### Vulgarisation

L'Infrastructure as Code consiste à définir l'infrastructure (serveurs, réseaux, bases de données) dans des fichiers de code, versionné et automatisé.

**Analogie** : Au lieu de configurer chaque serveur à la main (comme monter un meuble IKEA sans notice), vous avez un fichier qui décrit exactement ce que vous voulez, et un outil qui l'assemble automatiquement.

#### Approfondissement Expert

**Principes** :
- **Déclaratif** : Décrire l'état souhaité, pas les étapes
- **Versionné** : Git comme source de vérité
- **Idempotent** : Appliquer plusieurs fois = même résultat
- **Automatisé** : Pas d'intervention manuelle

**Outils principaux** :

| Outil | Type | Langage | Forces |
|-------|------|---------|--------|
| **Terraform** | Multi-cloud | HCL | Standard de l'industrie |
| **Pulumi** | Multi-cloud | TypeScript, Python, Go | Langages familiers |
| **AWS CloudFormation** | AWS | YAML/JSON | Intégré AWS |
| **Ansible** | Config management | YAML | Simple, agentless |
| **Kubernetes** | Container orchestration | YAML | Standard conteneurs |

**Exemple Terraform** :

```hcl
# main.tf
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  tags = {
    Name        = "ecommerce-web"
    Environment = "production"
  }
}

resource "aws_rds_instance" "db" {
  allocated_storage = 100
  engine           = "postgres"
  engine_version   = "14"
  instance_class   = "db.r5.large"
}
```

---

### 6.5 GitOps

#### Vulgarisation

GitOps utilise Git comme source unique de vérité pour l'infrastructure ET les applications. Tout changement passe par Git, et des outils automatiques synchronisent l'état décrit dans Git avec l'infrastructure réelle.

#### Approfondissement Expert

**Principes** (Weaveworks, 2017) :
1. **Déclaratif** : Tout est décrit déclarativement
2. **Versionné** : Git comme source de vérité
3. **Automatisé** : Réconciliation automatique
4. **Observable** : État actuel vs état souhaité visible

**Flux typique** :

```
[Dev] → [Git Push] → [Git Repo] ← [GitOps Operator] → [Kubernetes]
                                   (ArgoCD, Flux)
```

**Outils** :
- **ArgoCD** : CD pour Kubernetes
- **Flux** : GitOps toolkit
- **Jenkins X** : CI/CD cloud-native

**Avantages** :
- Audit trail complet (Git history)
- Rollback = git revert
- Review via PR avant changement infra
- Self-healing (réconciliation continue)

---

## 7. Testing pendant le Développement

### 7.1 Test-Driven Development (TDD)

#### Vulgarisation

Le TDD (Test-Driven Development) est une pratique où l'on écrit le test AVANT le code. Le cycle est : écrire un test qui échoue (Rouge), écrire le code minimal pour le faire passer (Vert), puis améliorer le code (Refactor).

**Analogie** : Avant de construire un pont, vous définissez les tests de résistance qu'il devra passer. Puis vous construisez le pont pour qu'il passe ces tests, pas plus, pas moins.

**Pourquoi c'est important** : Le TDD garantit que chaque ligne de code a une raison d'exister (passer un test) et que le code reste testable par design.

#### Approfondissement Expert

**Origine** : Kent Beck, "Test Driven Development: By Example" (2002)

**Le cycle Red-Green-Refactor** :

```
    ┌──────────────────┐
    │   RED            │
    │ Write failing    │
    │ test             │
    └────────┬─────────┘
             │
    ┌────────▼─────────┐
    │   GREEN          │
    │ Write minimal    │
    │ code to pass     │
    └────────┬─────────┘
             │
    ┌────────▼─────────┐
    │   REFACTOR       │
    │ Improve code     │
    │ (keep tests      │
    │  passing)        │
    └────────┬─────────┘
             │
             └──────→ Repeat
```

**Les 3 lois du TDD** (Uncle Bob) :
1. N'écrivez pas de code de production avant d'avoir un test qui échoue
2. N'écrivez pas plus de test que nécessaire pour échouer
3. N'écrivez pas plus de code que nécessaire pour faire passer le test

**Exemple concret** :

```javascript
// 1. RED - Le test échoue (la fonction n'existe pas)
describe('calculateShipping', () => {
  it('should return 0 for orders over 50€', () => {
    expect(calculateShipping(60)).toBe(0);
  });
});

// 2. GREEN - Code minimal pour passer
function calculateShipping(orderTotal) {
  if (orderTotal > 50) return 0;
  return 4.99;
}

// 3. REFACTOR - Améliorer (extraire constantes, etc.)
const FREE_SHIPPING_THRESHOLD = 50;
const STANDARD_SHIPPING_COST = 4.99;

function calculateShipping(orderTotal) {
  return orderTotal > FREE_SHIPPING_THRESHOLD ? 0 : STANDARD_SHIPPING_COST;
}

// 4. Nouveau test, nouveau cycle
it('should return 4.99 for orders under 50€', () => {
  expect(calculateShipping(30)).toBe(4.99);
});
```

**Bénéfices** :
- Code testable par design
- Documentation vivante (tests = specs)
- Confiance pour refactorer
- Design émergent
- Moins de debugging

**Challenges** :
- Courbe d'apprentissage
- Peut sembler lent au début
- Difficile pour certains types de code (UI, legacy)
- Tests peuvent devenir trop couplés à l'implémentation

**Variantes** :
- **TDD classique** (Chicago/Detroit school) : Bottom-up, focus sur le state
- **Outside-in TDD** (London school) : Top-down, mocks, focus sur le behavior

**Critiques et nuances** :
- TDD n'est pas adapté à tout (exploration, prototypage)
- "Test after" peut être suffisant si discipliné
- Importance de tester le comportement, pas l'implémentation
- David Heinemeier Hansson (DHH) : critique du TDD dogmatique

#### Application Pratique

**Pour un e-commerce** :

TDD particulièrement recommandé pour :
- Calculs de prix (remises, taxes, shipping)
- Logique métier complexe (éligibilité promotions)
- Validation de formulaires
- API endpoints

Moins critique pour :
- Composants UI simples (tester visuellement)
- Code exploratoire/prototype
- Intégrations tierces (mieux couvert par tests d'intégration)

---

### 7.2 Behavior-Driven Development (BDD)

#### Vulgarisation

Le BDD étend le TDD en utilisant un langage naturel compréhensible par tous (métier, QA, devs) pour écrire les tests. Les scénarios décrivent le comportement attendu du point de vue de l'utilisateur.

**Analogie** : Au lieu de dire "si x > 50, return 0", on écrit "Étant donné un panier de 60€, quand je calcule les frais de port, alors ils sont gratuits".

#### Approfondissement Expert

**Origine** : Dan North, 2006. Article "Introducing BDD".

**Gherkin Syntax** :

```gherkin
Feature: Calcul des frais de livraison
  En tant qu'acheteur
  Je veux connaître mes frais de livraison
  Afin de décider si j'ajoute des articles pour atteindre la livraison gratuite

  Background:
    Given je suis sur le site français
    And je suis connecté en tant que client standard

  Scenario: Livraison gratuite au-dessus de 50€
    Given mon panier contient des articles pour un total de 60€
    When je vais sur la page panier
    Then les frais de livraison affichés sont de 0€
    And je vois le message "Livraison gratuite !"

  Scenario: Frais de livraison standard sous 50€
    Given mon panier contient des articles pour un total de 30€
    When je vais sur la page panier
    Then les frais de livraison affichés sont de 4.99€
    And je vois le message "Plus que 20€ pour la livraison gratuite"

  Scenario Outline: Frais selon le montant
    Given mon panier contient des articles pour un total de <montant>€
    When je calcule les frais de livraison
    Then les frais sont de <frais>€

    Examples:
      | montant | frais |
      | 30      | 4.99  |
      | 49.99   | 4.99  |
      | 50      | 0     |
      | 100     | 0     |
```

**Three Amigos** :
Session de collaboration pour écrire les scénarios :
- **Business** (PO) : Définit la valeur et les règles
- **Development** : Considérations techniques
- **Testing** (QA) : Cas limites et edge cases

**Living Documentation** :
Les fichiers Gherkin servent de :
- Spécifications exécutables
- Documentation toujours à jour
- Base de communication

**Outils** :
- **Cucumber** : Original (Ruby, puis multi-langage)
- **SpecFlow** : .NET
- **Behave** : Python
- **Jest-Cucumber** : JavaScript

---

### 7.3 Testing Pyramid

#### Vulgarisation

La pyramide des tests (Mike Cohn) recommande d'avoir beaucoup de tests unitaires (rapides, isolés), moins de tests d'intégration, et encore moins de tests end-to-end (lents, fragiles).

**Analogie** : C'est comme vérifier une voiture. Tests unitaires = vérifier chaque pièce individuellement. Intégration = vérifier que le moteur et la transmission fonctionnent ensemble. E2E = faire un tour complet sur route.

#### Approfondissement Expert

```
                    /\
                   /  \
                  / E2E \      ← Peu, lents, coûteux
                 /________\
                /          \
               / Intégration \   ← Modéré
              /______________\
             /                \
            /    Unitaires     \   ← Beaucoup, rapides
           /____________________\
```

**Caractéristiques par niveau** :

| Niveau | Quantité | Vitesse | Coût | Fiabilité |
|--------|----------|---------|------|-----------|
| **Unit** | Beaucoup (70%) | Très rapide | Faible | Haute |
| **Integration** | Modéré (20%) | Moyen | Moyen | Moyenne |
| **E2E** | Peu (10%) | Lent | Élevé | Fragile |

**Évolutions du modèle** :

**Testing Trophy** (Kent C. Dodds) :
```
         🏆
        /  \
       / E2E \
      /________\
     /          \
    / Integration \   ← Focus principal
   /______________\
  /    Static      \
 /__________________\
```

Argument : Les tests d'intégration offrent le meilleur ROI.

**Testing Honeycomb** (Spotify) :
Pour les microservices, focus sur les tests d'intégration et contrats.

---

### 7.4 Unit Testing Best Practices

#### Vulgarisation

Les tests unitaires vérifient qu'une petite unité de code (fonction, méthode) fonctionne correctement en isolation.

#### Approfondissement Expert

**Propriétés FIRST** :
- **Fast** : Exécution en millisecondes
- **Independent** : Pas de dépendance entre tests
- **Repeatable** : Même résultat à chaque exécution
- **Self-validating** : Pass/fail automatique
- **Timely** : Écrits au bon moment (idéalement avant le code)

**AAA Pattern** (Arrange-Act-Assert) :

```javascript
describe('CartService', () => {
  describe('addItem', () => {
    it('should add item to empty cart', () => {
      // Arrange
      const cart = new CartService();
      const item = { id: '123', price: 29.99, quantity: 1 };

      // Act
      cart.addItem(item);

      // Assert
      expect(cart.items).toHaveLength(1);
      expect(cart.items[0]).toEqual(item);
    });
  });
});
```

**Given-When-Then** (alternative BDD-style) :

```javascript
it('adds item to empty cart', () => {
  // Given
  const cart = new CartService();
  const item = { id: '123', price: 29.99 };

  // When
  cart.addItem(item);

  // Then
  expect(cart.items).toContain(item);
});
```

**Mocking** :

```javascript
// Mock d'une dépendance externe
jest.mock('./paymentService');
import { processPayment } from './paymentService';

it('should call payment service with correct amount', async () => {
  // Arrange
  processPayment.mockResolvedValue({ success: true });
  const order = { total: 99.99 };

  // Act
  await checkoutService.complete(order);

  // Assert
  expect(processPayment).toHaveBeenCalledWith(99.99);
});
```

**Test coverage** :

```bash
npm test -- --coverage
```

Métriques :
- **Line coverage** : % de lignes exécutées
- **Branch coverage** : % de branches (if/else) couvertes
- **Function coverage** : % de fonctions appelées

**Objectif raisonnable** : 80% de couverture sur le nouveau code, sans chercher 100% (rendements décroissants).

---

### 7.5 Integration Testing

#### Vulgarisation

Les tests d'intégration vérifient que plusieurs composants fonctionnent correctement ensemble (par exemple : API + base de données).

#### Approfondissement Expert

**Scope** :
- Module + dépendances réelles (DB, cache)
- Plusieurs services ensemble
- API avec vraie base de données

**Stratégies** :

| Stratégie | Description | Avantage | Inconvénient |
|-----------|-------------|----------|--------------|
| **In-process** | Tout dans le même processus | Rapide | Moins réaliste |
| **Container-based** | Dépendances dans Docker | Réaliste | Plus lent |
| **Testcontainers** | Containers éphémères | Isolation | Setup complexe |

**Exemple avec Testcontainers** :

```javascript
// integration/order.test.js
import { PostgreSqlContainer } from '@testcontainers/postgresql';

describe('OrderRepository', () => {
  let container;
  let db;

  beforeAll(async () => {
    container = await new PostgreSqlContainer().start();
    db = await connectToDb(container.getConnectionUri());
    await runMigrations(db);
  });

  afterAll(async () => {
    await container.stop();
  });

  it('should persist and retrieve order', async () => {
    const repo = new OrderRepository(db);
    const order = { customerId: '123', total: 99.99 };

    const saved = await repo.save(order);
    const retrieved = await repo.findById(saved.id);

    expect(retrieved.total).toBe(99.99);
  });
});
```

---

### 7.6 Contract Testing

#### Vulgarisation

Les tests de contrat vérifient que deux services (par exemple, un frontend et une API) sont d'accord sur le format des données échangées.

#### Approfondissement Expert

**Consumer-Driven Contracts** :

```
[Consumer]                    [Provider]
    │                             │
    │ ←─ Contrat défini par ──── │
    │    le consommateur          │
    │                             │
    │ ── Utilisé pour tester ──→ │
    │    le provider              │
```

**Outils** :
- **Pact** : Standard pour CDC
- **Spring Cloud Contract** : Java/Spring
- **Specmatic** (ex-Qontract) : OpenAPI-based

**Exemple Pact** :

```javascript
// Consumer side
const { PactV3 } = require('@pact-foundation/pact');

describe('Product API', () => {
  const provider = new PactV3({
    consumer: 'WebApp',
    provider: 'ProductService',
  });

  it('returns product by id', async () => {
    await provider
      .given('product 123 exists')
      .uponReceiving('a request for product 123')
      .withRequest({
        method: 'GET',
        path: '/products/123',
      })
      .willRespondWith({
        status: 200,
        body: {
          id: '123',
          name: 'Widget',
          price: 29.99,
        },
      });

    await provider.executeTest(async (mockServer) => {
      const response = await fetch(`${mockServer.url}/products/123`);
      const product = await response.json();
      expect(product.name).toBe('Widget');
    });
  });
});
```

---

## 8. Architecture et Patterns

### 8.1 Design Patterns (Gang of Four Essentials)

#### Vulgarisation

Les Design Patterns sont des solutions éprouvées à des problèmes de conception récurrents. C'est comme avoir un livre de recettes : plutôt que de réinventer la roue, on utilise une solution qui a fait ses preuves.

**Pourquoi c'est important** : Les patterns fournissent un vocabulaire commun et des solutions testées. Quand un développeur dit "utilisons un Observer ici", toute l'équipe comprend immédiatement.

#### Approfondissement Expert

**Origine** : "Design Patterns: Elements of Reusable Object-Oriented Software" (1994), par Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides — le "Gang of Four" (GoF).

**Catégories** :
- **Creational** : Comment créer des objets
- **Structural** : Comment composer des objets
- **Behavioral** : Comment les objets communiquent

**Patterns essentiels pour le développement web** :

**CREATIONAL**

**Factory Method / Abstract Factory**

```typescript
// Factory Method - Créer des objets sans spécifier la classe exacte
interface PaymentProcessor {
  process(amount: number): Promise<PaymentResult>;
}

class StripeProcessor implements PaymentProcessor {
  process(amount: number) { /* ... */ }
}

class PayPalProcessor implements PaymentProcessor {
  process(amount: number) { /* ... */ }
}

class PaymentProcessorFactory {
  static create(type: string): PaymentProcessor {
    switch (type) {
      case 'stripe': return new StripeProcessor();
      case 'paypal': return new PayPalProcessor();
      default: throw new Error(`Unknown payment type: ${type}`);
    }
  }
}

// Usage
const processor = PaymentProcessorFactory.create('stripe');
await processor.process(99.99);
```

**Singleton** (avec prudence)

```typescript
// Singleton - Une seule instance partagée
// ⚠️ À utiliser avec parcimonie (difficile à tester, état global)
class ConfigService {
  private static instance: ConfigService;
  private config: Record<string, any>;

  private constructor() {
    this.config = this.loadConfig();
  }

  static getInstance(): ConfigService {
    if (!ConfigService.instance) {
      ConfigService.instance = new ConfigService();
    }
    return ConfigService.instance;
  }
}

// En JS/TS moderne, préférer un module exporté
// config.ts
export const config = loadConfig(); // Singleton implicite via module
```

**Builder**

```typescript
// Builder - Construction complexe étape par étape
class OrderBuilder {
  private order: Partial<Order> = {};

  withCustomer(customerId: string): this {
    this.order.customerId = customerId;
    return this;
  }

  withItems(items: CartItem[]): this {
    this.order.items = items;
    return this;
  }

  withShipping(address: Address): this {
    this.order.shippingAddress = address;
    return this;
  }

  build(): Order {
    if (!this.order.customerId || !this.order.items) {
      throw new Error('Customer and items required');
    }
    return this.order as Order;
  }
}

// Usage
const order = new OrderBuilder()
  .withCustomer('123')
  .withItems(cartItems)
  .withShipping(address)
  .build();
```

**STRUCTURAL**

**Adapter**

```typescript
// Adapter - Faire collaborer des interfaces incompatibles
// Ancien système de paiement
interface LegacyPayment {
  doPayment(cents: number): boolean;
}

// Nouvelle interface attendue
interface ModernPayment {
  process(amount: Money): Promise<PaymentResult>;
}

// Adapter
class LegacyPaymentAdapter implements ModernPayment {
  constructor(private legacy: LegacyPayment) {}

  async process(amount: Money): Promise<PaymentResult> {
    const cents = amount.toCents();
    const success = this.legacy.doPayment(cents);
    return { success, transactionId: 'legacy-' + Date.now() };
  }
}
```

**Decorator**

```typescript
// Decorator - Ajouter des responsabilités dynamiquement
interface PriceCalculator {
  calculate(basePrice: number): number;
}

class BasePriceCalculator implements PriceCalculator {
  calculate(basePrice: number) { return basePrice; }
}

class TaxDecorator implements PriceCalculator {
  constructor(private wrapped: PriceCalculator, private taxRate: number) {}

  calculate(basePrice: number) {
    const price = this.wrapped.calculate(basePrice);
    return price * (1 + this.taxRate);
  }
}

class DiscountDecorator implements PriceCalculator {
  constructor(private wrapped: PriceCalculator, private discount: number) {}

  calculate(basePrice: number) {
    const price = this.wrapped.calculate(basePrice);
    return price * (1 - this.discount);
  }
}

// Usage - composition flexible
let calculator: PriceCalculator = new BasePriceCalculator();
calculator = new DiscountDecorator(calculator, 0.10); // 10% off
calculator = new TaxDecorator(calculator, 0.20); // 20% TVA

const finalPrice = calculator.calculate(100); // 100 - 10% + 20% TVA
```

**Facade**

```typescript
// Facade - Interface simplifiée pour un sous-système complexe
class CheckoutFacade {
  constructor(
    private inventory: InventoryService,
    private payment: PaymentService,
    private shipping: ShippingService,
    private notification: NotificationService
  ) {}

  async processOrder(cart: Cart, paymentInfo: PaymentInfo): Promise<Order> {
    // Orchestration complexe cachée derrière une interface simple
    await this.inventory.reserve(cart.items);

    try {
      const paymentResult = await this.payment.charge(paymentInfo, cart.total);
      const shipment = await this.shipping.createShipment(cart);
      const order = await this.createOrder(cart, paymentResult, shipment);

      await this.notification.sendConfirmation(order);

      return order;
    } catch (error) {
      await this.inventory.release(cart.items);
      throw error;
    }
  }
}
```

**BEHAVIORAL**

**Observer**

```typescript
// Observer - Notification automatique des changements
interface Observer<T> {
  update(data: T): void;
}

class CartSubject {
  private observers: Observer<Cart>[] = [];
  private cart: Cart;

  subscribe(observer: Observer<Cart>) {
    this.observers.push(observer);
  }

  unsubscribe(observer: Observer<Cart>) {
    this.observers = this.observers.filter(o => o !== observer);
  }

  updateCart(cart: Cart) {
    this.cart = cart;
    this.observers.forEach(o => o.update(cart));
  }
}

// Observers
class CartTotalDisplay implements Observer<Cart> {
  update(cart: Cart) {
    console.log('Total:', cart.total);
  }
}

class CartBadge implements Observer<Cart> {
  update(cart: Cart) {
    console.log('Items:', cart.items.length);
  }
}
```

**Strategy**

```typescript
// Strategy - Famille d'algorithmes interchangeables
interface ShippingStrategy {
  calculate(order: Order): Money;
  getEstimatedDays(): number;
}

class StandardShipping implements ShippingStrategy {
  calculate(order: Order) {
    return order.total.isGreaterThan(Money.of(50)) ? Money.zero() : Money.of(4.99);
  }
  getEstimatedDays() { return 5; }
}

class ExpressShipping implements ShippingStrategy {
  calculate(order: Order) { return Money.of(14.99); }
  getEstimatedDays() { return 2; }
}

class SameDayShipping implements ShippingStrategy {
  calculate(order: Order) { return Money.of(29.99); }
  getEstimatedDays() { return 0; }
}

// Usage
class ShippingService {
  constructor(private strategy: ShippingStrategy) {}

  setStrategy(strategy: ShippingStrategy) {
    this.strategy = strategy;
  }

  getShippingCost(order: Order) {
    return this.strategy.calculate(order);
  }
}
```

**Command**

```typescript
// Command - Encapsuler une action comme un objet
interface Command {
  execute(): void;
  undo(): void;
}

class AddToCartCommand implements Command {
  constructor(private cart: Cart, private item: CartItem) {}

  execute() {
    this.cart.addItem(this.item);
  }

  undo() {
    this.cart.removeItem(this.item.id);
  }
}

// Command history pour undo/redo
class CommandHistory {
  private history: Command[] = [];

  execute(command: Command) {
    command.execute();
    this.history.push(command);
  }

  undo() {
    const command = this.history.pop();
    command?.undo();
  }
}
```

---

### 8.2 Architecture Patterns pour le Web

#### Vulgarisation

Les patterns d'architecture définissent comment organiser le code à grande échelle. MVC, Clean Architecture, Hexagonal... chacun propose une façon de structurer l'application pour la rendre maintenable.

#### Approfondissement Expert

**MVC (Model-View-Controller)**

```
[User] → [Controller] → [Model]
              ↓            ↓
           [View] ← ← ← ← ←
```

- **Model** : Données et logique métier
- **View** : Interface utilisateur
- **Controller** : Coordination

**Variantes** :
- **MVP** (Model-View-Presenter) : Le Presenter contrôle la Vue
- **MVVM** (Model-View-ViewModel) : Data binding bidirectionnel

**Clean Architecture** (Robert C. Martin)

```
┌─────────────────────────────────────┐
│           Frameworks & Drivers       │  ← External (DB, Web, UI)
├─────────────────────────────────────┤
│           Interface Adapters         │  ← Controllers, Presenters, Gateways
├─────────────────────────────────────┤
│           Application Business       │  ← Use Cases
├─────────────────────────────────────┤
│           Enterprise Business        │  ← Entities
└─────────────────────────────────────┘
```

**Règle de dépendance** : Les dépendances pointent vers l'intérieur. Le domaine ne connaît pas les frameworks.

**Hexagonal Architecture (Ports & Adapters)** — Alistair Cockburn

```
                 ┌─────────────────┐
    [UI] ─────→  │    Application  │  ←───── [Tests]
                 │                 │
   [API] ─────→  │     Domain      │  ←───── [External API]
                 │                 │
  [CLI] ─────→   │                 │  ←───── [Database]
                 └─────────────────┘
                   Ports & Adapters
```

- **Domain** : Logique métier pure
- **Ports** : Interfaces définies par le domain
- **Adapters** : Implémentations concrètes

**Exemple pour e-commerce** :

```typescript
// Domain (au centre)
interface OrderRepository {  // Port
  save(order: Order): Promise<void>;
  findById(id: string): Promise<Order>;
}

class CreateOrderUseCase {
  constructor(
    private orderRepo: OrderRepository,  // Port
    private paymentGateway: PaymentGateway  // Port
  ) {}

  async execute(request: CreateOrderRequest): Promise<Order> {
    // Logique métier pure
    const order = Order.create(request);
    await this.paymentGateway.charge(order.total);
    await this.orderRepo.save(order);
    return order;
  }
}

// Adapters (à l'extérieur)
class PostgresOrderRepository implements OrderRepository {
  async save(order: Order) { /* SQL */ }
  async findById(id: string) { /* SQL */ }
}

class StripePaymentGateway implements PaymentGateway {
  async charge(amount: Money) { /* Stripe API */ }
}
```

---

### 8.3 State Management Patterns (Frontend)

#### Vulgarisation

Le State Management gère l'état de l'application côté frontend : panier, utilisateur connecté, filtres sélectionnés... Les patterns aident à garder cet état cohérent et prévisible.

#### Approfondissement Expert

**Flux / Redux Pattern**

```
[Action] → [Dispatcher] → [Store] → [View]
    ↑                                  │
    └──────────────────────────────────┘
```

- **Unidirectional data flow**
- **Single source of truth** (store unique)
- **State immutable** (changé via reducers)

**Exemple simplifié** :

```typescript
// Actions
type CartAction =
  | { type: 'ADD_ITEM'; payload: CartItem }
  | { type: 'REMOVE_ITEM'; payload: string }
  | { type: 'CLEAR_CART' };

// Reducer
function cartReducer(state: Cart, action: CartAction): Cart {
  switch (action.type) {
    case 'ADD_ITEM':
      return { ...state, items: [...state.items, action.payload] };
    case 'REMOVE_ITEM':
      return { ...state, items: state.items.filter(i => i.id !== action.payload) };
    case 'CLEAR_CART':
      return { ...state, items: [] };
    default:
      return state;
  }
}
```

**Alternatives modernes** :
- **Context + useReducer** (React) : Pour état local/médium
- **Zustand** : Simple, hooks-based
- **Jotai/Recoil** : Atomic state
- **TanStack Query** : Server state (différent de UI state)

---

### 8.4 Feature Flags / Feature Toggles

#### Vulgarisation

Les Feature Flags permettent d'activer ou désactiver des fonctionnalités sans redéployer. C'est comme avoir des interrupteurs pour chaque feature du site.

**Pourquoi c'est important** : Permet le déploiement continu (code en prod mais feature off), les A/B tests, le rollout progressif, et le kill switch d'urgence.

#### Approfondissement Expert

**Types de Feature Flags** (Pete Hodgson / Martin Fowler)

| Type | Durée de vie | Dynamique | Exemple |
|------|--------------|-----------|---------|
| **Release Toggle** | Courte | Non | Nouvelle fonctionnalité en développement |
| **Experiment Toggle** | Courte | Oui | A/B test |
| **Ops Toggle** | Longue | Oui | Désactiver feature en cas de charge |
| **Permission Toggle** | Longue | Oui | Feature réservée aux premium |

**Implémentation** :

```typescript
// Simple (pour commencer)
const FEATURES = {
  NEW_CHECKOUT: process.env.FEATURE_NEW_CHECKOUT === 'true',
  WISHLIST: process.env.FEATURE_WISHLIST === 'true',
};

if (FEATURES.NEW_CHECKOUT) {
  // Nouveau checkout
} else {
  // Ancien checkout
}

// Avec SDK (LaunchDarkly, Unleash, etc.)
const showNewCheckout = await ldClient.variation('new-checkout', user, false);

if (showNewCheckout) {
  // Nouveau checkout
}
```

**Outils** :
- **LaunchDarkly** : SaaS, très complet
- **Unleash** : Open source, self-hosted
- **Flagsmith** : Open source + SaaS
- **ConfigCat** : Simple, affordable

**Bonnes pratiques** :
- Nettoyer les flags obsolètes (dette technique)
- Nommer clairement (pas `flag1`)
- Documenter la raison et l'owner
- Avoir une stratégie de sunset

---

## 9. Collaboration Équipe

### 9.1 Daily Standup / Daily Scrum

#### Vulgarisation

Le Daily Standup est une courte réunion quotidienne (15 min max) où l'équipe se synchronise. Historiquement debout pour rester court.

#### Approfondissement Expert

**Scrum Guide 2020** : Le Daily Scrum est réservé aux Developers. Le Scrum Master s'assure qu'il a lieu, mais n'y participe pas nécessairement.

**Format classique (3 questions)** :
1. Qu'ai-je fait hier ?
2. Que vais-je faire aujourd'hui ?
3. Y a-t-il des obstacles ?

**Formats alternatifs** :

| Format | Description | Avantage |
|--------|-------------|----------|
| **Walk the board** | Parcourir le Kanban de droite à gauche | Focus sur le flux |
| **Focus on Sprint Goal** | "Comment progressons-nous vers le goal ?" | Alignement |
| **Round robin** | Tour de table rapide | Équitable |
| **Async standup** | Slack/Discord bot | Équipes distribuées |

**Anti-patterns** :
- Rapport au Scrum Master/manager (pas une réunion de reporting)
- Monologues de 5 minutes par personne
- Résolution de problèmes (à faire après)
- Personnes en retard
- Discussions techniques approfondies

**Pour équipes distribuées** :
- Async standup via bot (Geekbot, Daily Bot)
- Vidéo optionnelle si async
- Fuseau horaire qui convient à tous (ou rotatif)

---

### 9.2 Sprint Review vs Sprint Demo

#### Vulgarisation

La **Sprint Review** est une réunion pour inspecter l'Increment et adapter le Product Backlog. La **Sprint Demo** est souvent une version réduite (montrer ce qui a été fait) mais manque le volet feedback et adaptation.

#### Approfondissement Expert

**Sprint Review (Scrum Guide)** :
- Pas juste une démo, c'est une **working session**
- Participants : Scrum Team + stakeholders clés
- Activités :
  - Présenter l'Increment
  - Discuter du Product Backlog
  - Recueillir le feedback
  - Adapter le backlog en conséquence

**Différence pratique** :

| Aspect | Sprint Demo | Sprint Review |
|--------|-------------|---------------|
| Focus | Montrer le travail | Inspecter + adapter |
| Participants | Équipe → audience | Collaboration active |
| Output | Applaudissements | Backlog mis à jour |
| Durée | 30 min | Jusqu'à 4h (sprint 4 sem) |

---

### 9.3 Formats de Rétrospective

#### Vulgarisation

La rétrospective est le moment où l'équipe réfléchit à comment travailler mieux ensemble. C'est le moteur de l'amélioration continue.

#### Approfondissement Expert

**Formats populaires** :

**Start/Stop/Continue**
```
┌─────────────┬─────────────┬─────────────┐
│   START     │    STOP     │  CONTINUE   │
│             │             │             │
│ Ce qu'on    │ Ce qu'on    │ Ce qui      │
│ devrait     │ devrait     │ marche bien │
│ commencer   │ arrêter     │             │
└─────────────┴─────────────┴─────────────┘
```

**4Ls** (Liked, Learned, Lacked, Longed for)
```
┌─────────────┬─────────────┐
│   LIKED     │  LEARNED    │
│ Ce qu'on a  │ Ce qu'on a  │
│ aimé        │ appris      │
├─────────────┼─────────────┤
│   LACKED    │ LONGED FOR  │
│ Ce qui a    │ Ce qu'on    │
│ manqué      │ aurait voulu│
└─────────────┴─────────────┘
```

**Sailboat**
```
        🌴 Île = Objectif
         \
          \     ☀️ Soleil = Ce qui nous aide
           \
    ┌───────────┐
    │  ⛵       │  ← Bateau = L'équipe
    └───────────┘
         |
        ⚓ Ancre = Ce qui nous ralentit
         |
        🪨 Rochers = Risques
```

**KALM** (Keep, Add, Less, More)
- **Keep** : Ce qu'on garde
- **Add** : Ce qu'on ajoute
- **Less** : Ce qu'on fait moins
- **More** : Ce qu'on fait plus

**Facilitation** :
- Varier les formats (éviter la routine)
- Time-box chaque phase
- Prioriser les actions (max 1-3 par rétro)
- Follow-up sur les actions précédentes
- Safe space (Vegas rule)

**Outils** :
- **FunRetro / EasyRetro** : Simple, visuel
- **Miro/Mural** : Boards collaboratifs
- **Retrium** : Facilitation guidée
- **TeamRetro** : Gamifié

---

### 9.4 Team Topologies

#### Vulgarisation

Team Topologies est un modèle pour structurer les équipes de développement. Il définit 4 types d'équipes et leurs modes d'interaction.

#### Approfondissement Expert

**Origine** : Matthew Skelton & Manuel Pais, "Team Topologies" (2019)

**Les 4 types d'équipes** :

1. **Stream-aligned Team** : Alignée sur un flux de valeur (ex: équipe Checkout)
2. **Enabling Team** : Aide les autres à monter en compétence (ex: DevOps enablers)
3. **Complicated Subsystem Team** : Gère un composant techniquement complexe (ex: moteur de recherche, ML)
4. **Platform Team** : Fournit des services self-service (ex: CI/CD platform)

**Les 3 modes d'interaction** :

| Mode | Description | Durée |
|------|-------------|-------|
| **Collaboration** | Travail étroit, discovery | Temporaire |
| **X-as-a-Service** | Consommation d'un service | Longue durée |
| **Facilitating** | Coaching, enablement | Temporaire |

**Conway's Law** :
> "Organizations which design systems are constrained to produce designs which are copies of the communication structures of these organizations."

→ Structurer les équipes pour obtenir l'architecture souhaitée (Inverse Conway Maneuver).

---

### 9.5 Developer Experience (DX)

#### Vulgarisation

La Developer Experience (DX) mesure la qualité de vie des développeurs : outillage, documentation, temps de build, friction quotidienne. Une bonne DX = développeurs productifs et satisfaits.

#### Approfondissement Expert

**Dimensions de la DX** :

1. **Onboarding** : Temps pour être productif
2. **Tooling** : IDE, CLI, debug, build
3. **Documentation** : Qualité, accessibilité
4. **Feedback loop** : Temps entre code et feedback
5. **Cognitive load** : Complexité à gérer

**Métriques** :
- **Time to first commit** : Onboarding
- **Build time** : Feedback loop
- **Deployment frequency** : Fluidité du processus
- **Developer satisfaction surveys** : Perception

**Améliorations courantes** :
- Hot reload / HMR
- Tests rapides
- Good error messages
- Dev containers (environnement reproductible)
- Feature flags pour tester en local
- Self-service pour créer des environnements

---

## 10. Questions Transversales

### 10.1 Comment maintenir la qualité sous pression de delivery ?

**Le problème** : Deadline proche, stakeholders qui poussent, tentation de "livrer et on verra".

**Stratégies** :

1. **DoD non-négociable** : La DoD est un contrat. Si le temps manque, réduire le scope, pas la qualité.

2. **Tests automatisés** : L'investissement initial paie car ils permettent de livrer en confiance.

3. **Refus du scope creep** : Le PO priorise. Si on ajoute, on retire autre chose.

4. **Communication transparente** : "On peut livrer A et B, pas C. Ou A, B et C mais sans tests automatisés — voici les risques."

5. **Slack dans le sprint** : Ne pas planifier à 100% de capacité.

**Ce qu'il ne faut PAS faire** :
- Supprimer les tests "pour cette fois"
- Skipper la code review
- Committer sur main sans CI
- Promettre des délais irréalistes

---

### 10.2 Comment gérer la dette technique sans bloquer les features ?

**Approches** :

1. **Budget régulier** : 15-20% du sprint pour la dette

2. **Boy Scout Rule** : Améliorer le code touché par une feature

3. **Tech Debt Items dans le backlog** : Visibilité pour le PO, négociation explicite

4. **Quadrant de priorisation** :
```
                 Impact High
                     │
    ┌────────────────┼────────────────┐
    │  Quick wins    │  Strategic     │
    │  (faire vite)  │  (planifier)   │
    │                │                │
────┼────────────────┼────────────────┼─── Effort
    │  Ignorer       │  Éviter        │
    │  (accepter)    │  (trop coûteux)│
    │                │                │
    └────────────────┼────────────────┘
                 Impact Low
```

5. **Couplage avec features** : "Cette feature sera 3x plus rapide si on refactore d'abord le module X."

---

### 10.3 Vélocité : métrique utile ou dangereuse ?

**Loi de Goodhart** :
> "When a measure becomes a target, it ceases to be a good measure."

**Le problème** : Si la vélocité devient un objectif, les équipes :
- Gonflent les estimations
- Réduisent la qualité pour "livrer plus de points"
- Se comparent entre équipes (absurde)

**Usages légitimes** :
- **Planification interne** : Projection de capacité (pas promesse)
- **Tendance dans le temps** : Stabilité, pas augmentation infinie
- **Détection d'anomalies** : Chute brutale = signal

**Usages dangereux** :
- Objectif de performance
- Comparaison entre équipes
- Reporting au management

**Alternative : Throughput**
- Nombre d'items livrés par sprint
- Nécessite des items de taille similaire
- Plus difficile à gamer

---

### 10.4 Comment onboarder efficacement de nouveaux développeurs ?

**Phases d'onboarding** :

| Jour | Objectif | Activités |
|------|----------|-----------|
| 1 | Setup | Accès, outils, environnement local |
| 2-3 | Contexte | Architecture, domaine métier, équipe |
| 4-5 | First contribution | PR simple (typo, petit bug) |
| Semaine 2 | Autonomie guidée | Story simple avec buddy |
| Mois 1 | Autonomie | Stories standard, code reviews |
| Mois 3 | Ownership | Responsabilité d'un module/feature |

**Bonnes pratiques** :
- **Buddy system** : Un référent dédié
- **Documentation à jour** : README, onboarding guide
- **First PR in day 1** : Symbole d'appartenance
- **Pair programming** : Apprentissage accéléré
- **No stupid questions culture** : Safe space

**Checklist onboarding** :
- [ ] Accès : GitHub, Jira, Slack, AWS, etc.
- [ ] Environnement local fonctionnel
- [ ] Comprend l'architecture high-level
- [ ] Connaît les conventions de l'équipe
- [ ] A mergé une première PR
- [ ] A participé à un sprint planning
- [ ] A reçu/donné une code review

---

### 10.5 Pratiques pour solo developer

**Adaptation des pratiques** :

| Pratique | En équipe | Solo |
|----------|-----------|------|
| Code review | Reviewer externe | Self-review après pause, ou AI-assisted |
| Daily standup | Équipe | Journal quotidien, or /skip |
| Sprint planning | Équipe | Planification hebdomadaire perso |
| Retrospective | Équipe | Review mensuelle perso |
| Pair programming | Collègue | Rubber duck, AI pair |

**Recommandations** :
- **Tests automatisés** : Encore plus importants (pas de filet humain)
- **CI/CD** : Automatiser au maximum
- **Documentation** : Pour soi-même dans 6 mois
- **Time-boxing** : Éviter les rabbit holes
- **Communauté** : Meetups, Discord, pour feedback externe
- **Versioning** : Même seul, branches et PRs pour structure

---

### 10.6 Comment choisir entre Scrum, Kanban, et autres ?

**Arbre de décision** :

```
Travail prévisible et planifiable ?
├─ OUI → Équipe nouvelle ou < 6 mois ensemble ?
│         ├─ OUI → Scrum (structure aide)
│         └─ NON → Kanban ou Shape Up (plus flexible)
│
└─ NON (support, maintenance, flux imprévisible)
          → Kanban (flux continu, pas de sprints)
```

**Facteurs de choix** :

| Critère | Scrum | Kanban | Shape Up |
|---------|-------|--------|----------|
| Maturité équipe | Toute | Moyenne+ | Haute |
| Type de travail | Features | Flux mixte | Features |
| Besoin de cadence | Oui | Non | Oui (6 sem) |
| Estimation | Story points | Optionnel | Appetite |
| Overhead ceremonies | Moyen | Faible | Faible |

**Conseil** : Commencer par Scrum (structure claire), évoluer vers Kanban ou Shape Up avec la maturité.

---

## 11. Métiers et Compétences

### 11.1 Software Engineer / Developer (niveaux)

#### Junior Software Engineer

**Définition** : Développeur en début de carrière (0-2 ans), travaille sous supervision.

**Responsabilités** :
- Implémenter des tâches bien définies
- Écrire des tests pour son code
- Participer aux code reviews (recevoir et apprendre)
- Poser des questions, apprendre le codebase

**Compétences requises** :
- Maîtrise d'un langage/framework
- Git basics
- Tests unitaires
- Compréhension des fondamentaux (HTTP, REST, SQL)

**Salaire indicatif France** : 32-42k€ brut/an **[À VÉRIFIER selon sources récentes]**

#### Mid-level Software Engineer

**Définition** : Développeur autonome (2-5 ans), peut mener des features de A à Z.

**Responsabilités** :
- Implémenter des features complètes
- Participer à la conception technique
- Mentorer les juniors
- Contribuer aux décisions techniques

**Compétences additionnelles** :
- Design patterns
- Performance et scaling basics
- CI/CD
- Communication technique

**Salaire indicatif France** : 42-55k€ brut/an **[À VÉRIFIER]**

#### Senior Software Engineer

**Définition** : Développeur expérimenté (5+ ans), leader technique, impact au-delà de son équipe.

**Responsabilités** :
- Architecture et design des systèmes
- Mentoring actif
- Code reviews approfondies
- Résolution de problèmes complexes
- Influence sur la direction technique

**Compétences additionnelles** :
- Architecture distribuée
- Trade-offs techniques
- Communication cross-functional
- Leadership sans autorité

**Salaire indicatif France** : 55-75k€ brut/an **[À VÉRIFIER]**

#### Staff / Principal Engineer

**Définition** : Expert technique (10+ ans), impact à l'échelle de l'organisation.

**Responsabilités** :
- Définir la vision technique
- Standards et pratiques à l'échelle org
- Projets stratégiques cross-team
- Représenter l'engineering auprès de l'exécutif

**Salaire indicatif France** : 75-120k€+ brut/an **[À VÉRIFIER]**

**Parcours type** :
```
Junior (0-2 ans)
    ↓
Mid (2-5 ans)
    ↓
Senior (5-10 ans)
    ↓
    ├─→ Staff/Principal (IC track)
    │
    └─→ Engineering Manager (Management track)
```

---

### 11.2 Tech Lead vs Engineering Manager

#### Tech Lead

**Définition** : Développeur senior responsable de la direction technique d'une équipe. Reste proche du code.

**Responsabilités** :
- Décisions d'architecture pour l'équipe
- Code review, mentoring technique
- Qualité du code et des pratiques
- ~50% coding, ~50% leadership

**Ce n'est PAS** :
- Un manager (pas de 1:1 carrière, pas d'évaluations)
- Un chef de projet (pas de gestion de planning)

#### Engineering Manager

**Définition** : Manager responsable des personnes et de la delivery d'une équipe.

**Responsabilités** :
- Carrière et développement des membres
- Recrutement, onboarding, offboarding
- 1:1 réguliers
- Interface avec le reste de l'organisation
- Peu ou pas de code

**Distinction clé** :

| Aspect | Tech Lead | Engineering Manager |
|--------|-----------|---------------------|
| Focus | Code & Architecture | People & Process |
| Coding | 30-70% | 0-20% |
| Reports directs | Non (influence) | Oui |
| Évaluations perf | Non | Oui |
| Recrutement | Entretiens techniques | Décision finale, process |

Certaines organisations combinent les rôles. D'autres les séparent strictement.

---

### 11.3 Scrum Master (en phase Dev)

**Définition** : Facilitateur et coach Scrum pour l'équipe.

**Responsabilités en phase Développement** :
- Faciliter les événements Scrum
- Éliminer les obstacles (impediments)
- Coacher l'équipe sur les pratiques agiles
- Protéger l'équipe des interruptions
- Promouvoir l'amélioration continue

**Ce n'est PAS** :
- Un chef de projet
- Un manager
- Un secrétaire qui prend des notes

**Certifications** :
- PSM I, II, III (Scrum.org)
- CSM, A-CSM, CSP-SM (Scrum Alliance)
- SAFe Scrum Master (Scaled Agile)

**Salaire indicatif France** : 45-70k€ brut/an **[À VÉRIFIER]**

---

### 11.4 DevOps Engineer

**Définition** : Ingénieur spécialisé dans l'automatisation, l'infrastructure, et les pratiques DevOps.

**Responsabilités** :
- CI/CD pipelines
- Infrastructure as Code
- Monitoring et alerting
- Cloud management
- Sécurité des déploiements

**Compétences** :
- Scripting (Bash, Python)
- Docker, Kubernetes
- Terraform, Ansible
- Cloud (AWS, GCP, Azure)
- Monitoring (Prometheus, Grafana, Datadog)

**Certifications** :
- AWS Solutions Architect
- CKA (Certified Kubernetes Administrator)
- Terraform Associate
- Docker Certified Associate

**Salaire indicatif France** : 50-80k€ brut/an **[À VÉRIFIER]**

---

### 11.5 Site Reliability Engineer (SRE)

**Définition** : Ingénieur qui applique les pratiques de software engineering aux problèmes d'opérations. Concept créé par Google.

**Différence DevOps vs SRE** :
- DevOps : Culture et pratiques
- SRE : Implémentation spécifique de ces pratiques

**Responsabilités** :
- Fiabilité des systèmes (SLOs, SLIs)
- Incident management
- Capacity planning
- Performance optimization
- Toil reduction (automatisation)

**Concepts clés** :
- **SLO** : Service Level Objective (objectif interne)
- **SLI** : Service Level Indicator (métrique mesurée)
- **Error Budget** : Budget d'indisponibilité acceptable

**Références** : "Site Reliability Engineering" (Google, 2016) — gratuit en ligne

**Salaire indicatif France** : 55-90k€ brut/an **[À VÉRIFIER]**

---

### 11.6 QA Engineer intégré

**Définition** : Ingénieur qualité intégré à l'équipe de développement (pas dans un silo QA séparé).

**Responsabilités** :
- Tests automatisés (E2E, intégration)
- Test strategy
- Exploratory testing
- Collaboration sur les critères d'acceptation
- Feedback sur la testabilité du code

**Évolution** : Le rôle évolue vers "Quality Engineer" ou "SDET" (Software Development Engineer in Test), avec plus de compétences en développement.

**Compétences** :
- Automatisation (Selenium, Playwright, Cypress)
- Scripting
- CI/CD integration
- Testing strategy
- Domain knowledge

**Salaire indicatif France** : 40-60k€ brut/an **[À VÉRIFIER]**

---

## 12. Checklist de Phase Développement

### Méthodologie
- [ ] Framework choisi (Scrum/Kanban/autre) et configuré
- [ ] Outils de gestion (Jira, Linear, Trello) en place
- [ ] Definition of Done établie et validée par l'équipe
- [ ] Definition of Ready établie (optionnel mais recommandé)
- [ ] Backlog refinement planifié régulièrement
- [ ] Sprint Planning / Cycle planning en place
- [ ] Daily standups (ou alternative) fonctionnels
- [ ] Sprint Reviews avec stakeholders
- [ ] Rétrospectives régulières avec actions suivies

### Code Quality
- [ ] Standards de code documentés
- [ ] ESLint/Prettier (ou équivalent) configuré
- [ ] Pre-commit hooks (Husky, lint-staged)
- [ ] Code review process en place
- [ ] Template de PR défini
- [ ] Conventional commits adoptés
- [ ] Métriques de code (SonarQube ou similaire)

### Testing
- [ ] Framework de test choisi et configuré
- [ ] Tests unitaires écrits pour le code métier
- [ ] Tests d'intégration pour les APIs
- [ ] Tests E2E pour les flux critiques
- [ ] Coverage minimum défini et mesuré
- [ ] Tests dans la CI pipeline

### CI/CD
- [ ] Pipeline CI opérationnel
- [ ] Build automatisé
- [ ] Tests automatisés dans la pipeline
- [ ] Lint/format dans la pipeline
- [ ] Security scanning (SAST, dependencies)
- [ ] Déploiement automatisé vers staging
- [ ] Déploiement vers production (manuel ou auto)
- [ ] Rollback testé

### Infrastructure
- [ ] Environnements définis (dev, staging, prod)
- [ ] Infrastructure as Code (si applicable)
- [ ] Secrets management en place
- [ ] Monitoring et alerting configurés
- [ ] Logging centralisé

### Documentation
- [ ] README à jour avec instructions de setup
- [ ] Architecture documentée
- [ ] ADRs pour décisions importantes
- [ ] API documentation (Swagger/OpenAPI)
- [ ] Runbooks pour incidents courants

### Sécurité
- [ ] OWASP Top 10 considéré
- [ ] Dependency scanning automatisé
- [ ] Secrets non committés (gitignore, pre-commit)
- [ ] HTTPS everywhere
- [ ] Authentication/Authorization en place

---

## 13. Red Flags et Anti-Patterns

| Signal d'alerte | Cause probable | Action recommandée |
|-----------------|----------------|-------------------|
| Sprints toujours en échec | Mauvaise estimation ou scope creep | Réduire scope, améliorer refinement, dire non |
| Code reviews négligées | Pression temporelle | Time-box, prioriser, pair programming |
| Pas de tests | "Pas le temps" | TDD, coverage gates dans CI |
| Feature branches longues | Fear of merge, trop grosse PR | Trunk-based ou short-lived branches, feature flags |
| Daily standups de 30+ min | Status meeting, pas standup | Recentrer, walk the board, timeboxer |
| Vélocité qui chute | Fatigue, dette technique, turnover | Rétrospective approfondie, pause, investir dans la DX |
| Builds cassés ignorés | Normalisation de la déviance | "Stop the line", fix immediately |
| Un seul reviewer | Dépendance, bus factor | Rotation, pair review |
| Documentation absente | "Le code est la doc" | README obligatoire, ADRs, API docs |
| Meetings constants | Mauvaise organisation, manque de focus | No-meeting days, async first |
| Développeur héros | Mauvaise répartition des connaissances | Pair programming, rotation, documentation |
| Estimations toujours fausses | Optimisme, scope mal compris | Refinement, découpage, no estimates |

---

## 14. Quick Reference

### Méthodologies comparées

| Critère | Scrum | Kanban | XP | Shape Up |
|---------|-------|--------|-----|----------|
| Cadence | Sprint fixe (1-4 sem) | Flux continu | Itérations courtes | Cycles 6 sem + 2 sem cooldown |
| Rôles | PO, SM, Developers | Pas de rôles prescrits | Coach, Tracker, Programmers | Shapers, Builders |
| Estimation | Story Points | Optionnel | Souvent heures | Appetite (budget) |
| Réunions | Planifiées (5 events) | Minimales (cadences) | Nombreuses (standups, pairing) | Betting table, kickoff |
| Changements en cours | Protégé (Sprint) | Acceptés | Acceptés | Fixe (pas d'ajout) |
| Artéfacts | Product/Sprint Backlog, Increment | Board Kanban | User stories, tests | Pitches, Hill Charts |
| Adapté pour | Feature development, nouveaux projets | Maintenance, support, flux mixte | Projets critiques, équipes XP | Produits établis, équipes matures |

### SOLID Principles (résumé)

| Lettre | Principe | En une phrase |
|--------|----------|---------------|
| **S** | Single Responsibility | Une classe = une raison de changer |
| **O** | Open/Closed | Ouvert à l'extension, fermé à la modification |
| **L** | Liskov Substitution | Les sous-types remplacent les types parents |
| **I** | Interface Segregation | Interfaces petites et spécifiques |
| **D** | Dependency Inversion | Dépendre des abstractions, pas des concrétions |

### Git Workflows comparés

| Workflow | Best for | Complexité | Feature flags |
|----------|----------|------------|---------------|
| GitHub Flow | Petites équipes, CD | Simple | Optionnel |
| GitFlow | Releases planifiées | Complexe | Non requis |
| Trunk-Based | Équipes matures, CD | Moyenne | Requis |

### Conventional Commits

```
feat: nouvelle fonctionnalité
fix: correction de bug
docs: documentation
style: formatage (pas de changement de code)
refactor: ni fix ni feat
perf: amélioration performance
test: ajout/correction de tests
chore: maintenance
ci: changements CI
build: système de build
```

### Testing Pyramid

```
        E2E (10%)    - Peu, lents, coûteux
    Integration (20%)  - Modéré
      Unit (70%)       - Beaucoup, rapides
```

---

## Glossaire

| Terme | Définition |
|-------|------------|
| **Agile** | Philosophie de développement itérative et collaborative basée sur le Manifeste Agile (2001) |
| **Backlog** | Liste ordonnée des travaux à réaliser |
| **BDD** | Behavior-Driven Development - Tests en langage naturel (Given/When/Then) |
| **CD** | Continuous Delivery (prêt à déployer) ou Continuous Deployment (déploiement auto) |
| **CI** | Continuous Integration - Intégration fréquente avec build et tests automatisés |
| **Clean Code** | Code lisible, maintenable, suivant les principes de Robert C. Martin |
| **Definition of Done (DoD)** | Critères de qualité pour considérer un item comme terminé |
| **Definition of Ready (DoR)** | Critères pour qu'un item soit prêt à être développé |
| **DevOps** | Culture et pratiques unissant développement et opérations |
| **DRY** | Don't Repeat Yourself - Éviter la duplication de logique |
| **Feature Flag** | Interrupteur permettant d'activer/désactiver une fonctionnalité |
| **GitOps** | Pratique utilisant Git comme source de vérité pour l'infrastructure |
| **IaC** | Infrastructure as Code - Définir l'infrastructure dans des fichiers de code |
| **INVEST** | Critères d'une bonne User Story : Independent, Negotiable, Valuable, Estimable, Small, Testable |
| **Kanban** | Méthode de gestion du flux basée sur la visualisation et les limites WIP |
| **KISS** | Keep It Simple, Stupid - Préférer la simplicité |
| **Lead Time** | Temps entre la demande et la livraison |
| **Mob Programming** | Toute l'équipe sur un seul ordinateur |
| **Pair Programming** | Deux développeurs sur un seul ordinateur |
| **PR / MR** | Pull Request (GitHub) / Merge Request (GitLab) |
| **Refactoring** | Améliorer la structure du code sans changer son comportement |
| **Scrum** | Framework agile avec sprints, rôles définis, et événements |
| **SOLID** | 5 principes de design orienté objet |
| **Sprint** | Itération timeboxée dans Scrum (1-4 semaines) |
| **SRE** | Site Reliability Engineering - Pratiques de fiabilité inspirées de Google |
| **TDD** | Test-Driven Development - Écrire le test avant le code |
| **Technical Debt** | Coût futur des raccourcis techniques pris aujourd'hui |
| **Velocity** | Nombre de story points livrés par sprint |
| **WIP** | Work In Progress - Travail en cours |
| **YAGNI** | You Ain't Gonna Need It - Ne pas anticiper les besoins futurs |

---

## Bibliographie et Sources

### Livres de référence

- **Beck, K.** (2002). *Test Driven Development: By Example*. Addison-Wesley.
- **Beck, K.** (2004). *Extreme Programming Explained* (2nd ed.). Addison-Wesley.
- **Cohn, M.** (2004). *User Stories Applied*. Addison-Wesley.
- **Fowler, M.** (2018). *Refactoring: Improving the Design of Existing Code* (2nd ed.). Addison-Wesley.
- **Gamma, E., Helm, R., Johnson, R., & Vlissides, J.** (1994). *Design Patterns: Elements of Reusable Object-Oriented Software*. Addison-Wesley.
- **Hunt, A., & Thomas, D.** (2019). *The Pragmatic Programmer* (20th Anniversary ed.). Addison-Wesley.
- **Kim, G., Humble, J., Debois, P., & Willis, J.** (2016). *The DevOps Handbook*. IT Revolution Press.
- **Martin, R. C.** (2008). *Clean Code: A Handbook of Agile Software Craftsmanship*. Prentice Hall.
- **Martin, R. C.** (2017). *Clean Architecture*. Prentice Hall.
- **Poppendieck, M., & Poppendieck, T.** (2003). *Lean Software Development*. Addison-Wesley.
- **Schwaber, K., & Sutherland, J.** (2020). *The Scrum Guide*. Scrum.org.
- **Singer, R.** (2019). *Shape Up*. Basecamp. (Gratuit : basecamp.com/shapeup)
- **Skelton, M., & Pais, M.** (2019). *Team Topologies*. IT Revolution Press.

### Documentation officielle

- **Agile Manifesto** : agilemanifesto.org
- **Scrum Guide** : scrumguides.org
- **Kanban Guide** : kanban.university
- **Conventional Commits** : conventionalcommits.org
- **Semantic Versioning** : semver.org

### Articles et ressources en ligne

- **Fowler, M.** - martinfowler.com (articles sur Refactoring, CI, Microservices, Architecture)
- **State of Agile Report** - digital.ai/state-of-agile (rapport annuel sur l'adoption agile)
- **State of DevOps Report** - puppet.com/resources/state-of-devops-report
- **DORA Metrics** - cloud.google.com/devops
- **ThoughtWorks Technology Radar** - thoughtworks.com/radar

### Certifications mentionnées

- **Scrum.org** : PSM, PSPO, PSD - scrum.org
- **Scrum Alliance** : CSM, CSPO - scrumalliance.org
- **SAFe** : SA, SSM, POPM - scaledagile.com
- **AWS** : Solutions Architect - aws.amazon.com/certification
- **Kubernetes** : CKA, CKAD - cncf.io/certification

---

## Notes et Limitations

### Points couverts avec confiance élevée
- Frameworks Agile (Scrum Guide 2020 officiel vérifié)
- Principes SOLID et Clean Code (sources primaires)
- Git Workflows (documentation officielle)
- Pratiques TDD/BDD (sources primaires Kent Beck, Dan North)

### Points nécessitant vérification [À VÉRIFIER]
- Statistiques du State of Agile Report (vérifier la version la plus récente)
- Salaires indicatifs (varient selon localisation, entreprise, période)
- Parts de marché des outils (évoluent rapidement)

### Points non couverts
- Détails d'implémentation spécifiques à chaque langage/framework
- Outils spécifiques (focus sur les catégories plutôt que les produits)
- Aspects légaux et contractuels
- Gestion budgétaire détaillée

### Recommandations de mise à jour
Ce rapport devrait être revu et mis à jour :
- Annuellement pour les statistiques et tendances
- À chaque nouvelle version majeure du Scrum Guide
- Lors de changements significatifs dans les pratiques de l'industrie

---

**Fin du rapport**

*Document généré par Claude (Opus 4.5) dans le cadre d'une recherche approfondie sur le cycle de vie projet.*
