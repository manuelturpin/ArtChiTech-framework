# Rapport de Recherche : Phase 1 - Discovery
## "Comprendre & Explorer"

**Version** : 1.0
**Date** : 29 décembre 2024
**Auteur** : Claude (Deep Research - OPUS 4.5)
**Statut** : Final

---

## Table des matières

1. [Executive Summary](#executive-summary)
2. [Introduction](#1-introduction)
   - 1.1 Objectif de cette phase
   - 1.2 Place dans le cycle de vie projet
   - 1.3 Prérequis (inputs nécessaires)
   - 1.4 Outputs attendus
3. [Identification et Cadrage du Problème](#2-identification-et-cadrage-du-problème)
   - 2.1 Problem Statement / Problem Framing
   - 2.2 Jobs-to-be-Done (JTBD)
   - 2.3 Root Cause Analysis
   - 2.4 Opportunity Assessment
4. [Recherche Utilisateur](#3-recherche-utilisateur)
   - 3.1 Méthodologies qualitatives
   - 3.2 Méthodologies quantitatives
   - 3.3 Recrutement et échantillonnage
   - 3.4 Synthèse et analyse des données
   - 3.5 Personas
   - 3.6 Empathy Maps
5. [Analyse de Marché](#4-analyse-de-marché)
   - 4.1 Analyse concurrentielle
   - 4.2 Blue Ocean Strategy
   - 4.3 TAM/SAM/SOM
   - 4.4 Porter's Five Forces
   - 4.5 PESTEL Analysis
6. [Vision Produit](#5-vision-produit)
   - 5.1 Product Vision Board
   - 5.2 North Star Metric
   - 5.3 Value Proposition Canvas
   - 5.4 Lean Canvas vs Business Model Canvas
7. [Validation de l'Opportunité](#6-validation-de-lopportunité)
   - 6.1 Frameworks de priorisation (RICE, ICE)
   - 6.2 Go/No-Go Decision
   - 6.3 Assumption Mapping
   - 6.4 PoC vs Prototype vs MVP
   - 6.5 Lean Startup : Build-Measure-Learn
   - 6.6 Design Sprint
8. [Livrables et Documentation](#7-livrables-et-documentation)
   - 7.1 Project Charter / Brief de projet
   - 7.2 Research Repository
   - 7.3 Stakeholder Mapping
9. [Questions Transversales](#8-questions-transversales)
10. [Métiers et Compétences](#9-métiers-et-compétences)
11. [Checklist de Phase Discovery](#10-checklist-de-phase-discovery)
12. [Red Flags et Anti-Patterns](#11-red-flags-et-anti-patterns)
13. [Quick Reference](#12-quick-reference)
14. [Glossaire](#glossaire)
15. [Bibliographie et Sources](#bibliographie-et-sources)
16. [Notes et Limitations](#notes-et-limitations)

---

## Executive Summary

La phase Discovery constitue le **fondement critique** de tout projet digital réussi. Elle représente l'investissement le plus rentable du cycle de vie d'un projet : chaque euro investi en Discovery peut en économiser dix à cent en développement et corrections ultérieures.

### Objectif principal
Valider qu'un problème mérite d'être résolu **avant** d'investir des ressources significatives dans sa solution. Cette phase répond à trois questions fondamentales :
1. **Le problème existe-t-il réellement ?** (Problem-Solution Fit)
2. **Le marché est-il suffisant ?** (Market Opportunity)
3. **Sommes-nous capables de le résoudre ?** (Feasibility)

### Méthodologies clés identifiées
- **Jobs-to-be-Done (JTBD)** : Framework conceptualisé par Tony Ulwick (1990) et popularisé par Clayton Christensen, permettant de comprendre les motivations profondes des utilisateurs
- **Value Proposition Canvas** : Outil développé par Alexander Osterwalder (Strategyzer) pour aligner offre et besoins clients
- **Lean Startup** : Méthodologie d'Eric Ries basée sur le cycle Build-Measure-Learn
- **Design Sprint** : Processus de 5 jours créé par Jake Knapp chez Google (2010)

### Livrables essentiels
La phase Discovery doit produire :
- Un **Problem Statement** clair et validé
- Des **Personas** basées sur des données réelles
- Une analyse **TAM/SAM/SOM** documentée
- Un **Value Proposition Canvas** complété
- Une décision **Go/No-Go** argumentée
- Un **Brief de projet** ou Project Charter

### Métriques de succès
- Nombre d'utilisateurs cibles interviewés (minimum recommandé : 5-8 pour patterns qualitatifs)
- Taux de validation des hypothèses critiques
- Clarté du Problem Statement (testable via reformulation par parties prenantes)
- Alignement des stakeholders sur la vision

### Erreurs coûteuses à éviter
1. **Biais de confirmation** : Ne chercher que les données qui confirment l'idée initiale
2. **Solution-first thinking** : Partir de la solution plutôt que du problème
3. **Échantillonnage biaisé** : N'interroger que des proches ou early adopters enthousiastes
4. **Skip de validation** : Passer directement au développement par impatience

### Adaptation contextuelle
- **Startup solo** : Discovery allégée (2-4 semaines), focus sur interviews et validation rapide
- **PME (5-20 personnes)** : Discovery standard (4-8 semaines), méthodologies complètes
- **Enterprise** : Discovery approfondie (8-16 semaines), gouvernance et alignement stakeholders

### Spécificités e-commerce
- **B2C** : Focus sur l'expérience utilisateur, parcours d'achat, émotions
- **B2B** : Focus sur le cycle de décision, multiple stakeholders, ROI démontrable
- **SaaS** : Focus sur l'onboarding, rétention, North Star Metric

Ce rapport détaille chaque concept avec une structure en 3 niveaux (Vulgarisation → Expert → Application pratique) pour permettre une compréhension progressive et une mise en œuvre immédiate.

---

## 1. Introduction

### 1.1 Objectif de cette phase

La phase Discovery — également appelée "Phase de Découverte" ou "Phase 0" — a pour mission de **réduire l'incertitude** avant tout engagement significatif de ressources.

Elle vise à :
- **Comprendre profondément** le problème à résoudre et son contexte
- **Identifier et caractériser** les utilisateurs cibles
- **Évaluer l'opportunité** de marché
- **Valider les hypothèses** fondamentales du projet
- **Définir une vision** claire et partagée
- **Prendre une décision éclairée** Go/No-Go

> "Falling in love with the problem, not the solution" — Uri Levine, co-fondateur de Waze

### 1.2 Place dans le cycle de vie projet

La Discovery s'inscrit comme **première phase opérationnelle** du cycle de vie projet :

```
[Idée] → [DISCOVERY] → [Stratégie] → [Conception] → [Développement] → [Qualité] → [Lancement] → [Croissance]
              ↑
         NOUS SOMMES ICI
```

**Position stratégique** :
- **Avant** : Une idée brute, une intuition, un besoin perçu
- **Pendant** : Investigation, validation, cadrage
- **Après** : Décision Go/No-Go et brief de projet pour la phase Stratégie

**Relation avec les autres phases** :
- Alimente la phase **Stratégie** avec des données validées
- Réduit les risques de la phase **Conception** en clarifiant les besoins
- Minimise les itérations coûteuses en **Développement**

### 1.3 Prérequis (inputs nécessaires)

Pour démarrer une phase Discovery efficace, les éléments suivants sont nécessaires :

| Input | Description | Criticité |
|-------|-------------|-----------|
| **Idée ou opportunité** | Description initiale du projet envisagé | Obligatoire |
| **Sponsor identifié** | Personne ou entité finançant/soutenant le projet | Obligatoire |
| **Budget Discovery** | Ressources allouées à cette phase (temps, argent) | Obligatoire |
| **Accès aux utilisateurs** | Capacité à contacter et interviewer des utilisateurs cibles | Critique |
| **Données existantes** | Analytics, études antérieures, feedback clients | Recommandé |
| **Contexte marché** | Connaissance sectorielle de base | Recommandé |

### 1.4 Outputs attendus (livrables pour les phases suivantes)

La phase Discovery doit produire les livrables suivants pour alimenter la phase Stratégie :

**Livrables obligatoires** :
1. **Problem Statement validé** : Définition claire et documentée du problème
2. **Personas utilisateurs** : 2-4 profils types basés sur recherche réelle
3. **Analyse concurrentielle** : Cartographie des alternatives existantes
4. **Value Proposition Canvas** : Proposition de valeur articulée
5. **Décision Go/No-Go** : Recommandation argumentée avec critères
6. **Brief de projet** : Document de synthèse pour la phase suivante

**Livrables recommandés** :
- Empathy Maps par persona
- Estimation TAM/SAM/SOM
- Hypothèses priorisées et plan de validation
- Stakeholder Map
- Research Repository (base documentaire des insights)

**Format de transmission** :
- Documents synthétiques (pas plus de 20 pages hors annexes)
- Présentations visuelles pour alignement stakeholders
- Données brutes accessibles en annexe ou repository

---

## 2. Identification et Cadrage du Problème

L'identification et le cadrage du problème constituent la **pierre angulaire** de la phase Discovery. Un problème mal défini conduit invariablement à une solution inadaptée, quel que soit le talent de l'équipe de développement.

> "If I had an hour to solve a problem, I'd spend 55 minutes thinking about the problem and 5 minutes thinking about solutions." — Attribué à Albert Einstein

### 2.1 Problem Statement / Problem Framing

#### Niveau 1 - Vulgarisation

**Définition simple** : Un Problem Statement (énoncé du problème) est une description claire et concise du problème que votre projet cherche à résoudre. C'est comme le diagnostic d'un médecin avant de prescrire un traitement.

**Analogie** : Imaginez que vous êtes perdu en forêt. Avant de décider quelle direction prendre (la solution), vous devez d'abord comprendre où vous êtes et où vous voulez aller (le problème). Le Problem Framing, c'est prendre le temps de sortir sa carte et sa boussole avant de courir.

**Pourquoi c'est important** : Sans problème clairement défini, les équipes construisent souvent des solutions à des problèmes qui n'existent pas, ou résolvent le mauvais problème. C'est la cause n°1 d'échec des projets digitaux.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : Le Problem Framing est un processus structuré issu du Design Thinking permettant de définir, contextualiser et prioriser les problèmes complexes avant d'entamer la recherche de solutions. Il transforme une situation floue en un défi actionnable.

**Origine et historique** :
- Racines dans la **réflexion sur les "wicked problems"** (Rittel & Webber, 1973)
- Formalisé dans le **Design Thinking** par la d.school de Stanford et IDEO (années 2000)
- Popularisé par le **Double Diamond** du Design Council UK (2005)
- Affiné par la **Design Sprint Academy** avec le Problem Framing Workshop

**Évolution** :
- 2005-2010 : Adoption dans les agences de design
- 2010-2015 : Intégration dans les méthodes Agile
- 2015-2020 : Démocratisation dans les startups tech
- 2020-2025 : Standard dans les équipes produit, émergence d'outils dédiés

**Structure d'un bon Problem Statement** :

Le format recommandé suit le template **"How Might We" (HMW)** ou la structure en 5 parties :

```
[UTILISATEUR CIBLE] a besoin de [BESOIN/OBJECTIF]
parce que [INSIGHT/RAISON]
mais actuellement [OBSTACLE/FRICTION]
ce qui entraîne [CONSÉQUENCE NÉGATIVE].
```

**Exemple e-commerce B2B** :
> Les acheteurs professionnels de fournitures industrielles ont besoin de réapprovisionner rapidement leur stock parce que les ruptures causent des arrêts de production coûteux, mais actuellement le processus de commande nécessite 45 minutes et de multiples validations, ce qui entraîne des commandes d'urgence plus chères et du stress opérationnel.

**Variantes et écoles de pensée** :

| Framework | Focus | Source |
|-----------|-------|--------|
| **HMW (How Might We)** | Questions ouvertes | IDEO, d.school |
| **5W1H** | Exhaustivité contextuelle | Journalisme, Six Sigma |
| **POV (Point of View)** | Centré utilisateur | d.school Stanford |
| **Problem Tree** | Causes et effets | Analyse logique |

**Méthodologies formelles** :
- **Problem Framing Workshop** (Design Sprint Academy) : Session structurée de 1-2 jours
- **Double Diamond** (Design Council) : Diverger-Converger sur le problème puis la solution
- **Cynefin Framework** (Dave Snowden) : Classifier le type de problème (simple, compliqué, complexe, chaotique)

**Critères d'un bon Problem Statement** (SMART adapté) :
- **Spécifique** : Pas de généralités
- **Mesurable** : Impact quantifiable
- **Actionnable** : L'équipe peut agir dessus
- **Réaliste** : Dans le périmètre du projet
- **Timeboxé** : Contexte temporel clair

**Outils de référence** :
- Miro, Mural (collaboration visuelle)
- Notion, Confluence (documentation)
- Templates Problem Framing Canvas

**Tendances 2024-2025** :
- Intégration de l'IA pour analyser les données de feedback et identifier les patterns de problèmes
- Problem Framing distribué pour équipes remote
- Lien renforcé avec les OKRs (Objectives & Key Results)

**Critiques et limites** :
- Risque de "paralysis by analysis" si le cadrage s'éternise
- Peut devenir un exercice théorique déconnecté du terrain
- Nécessite des données utilisateurs réelles pour être valide

**Métriques associées** :
- Temps passé en cadrage vs. développement (ratio recommandé : 10-20%)
- Nombre d'itérations sur le Problem Statement avant stabilisation
- Score d'alignement des stakeholders sur le problème

#### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Début de tout nouveau projet ou fonctionnalité majeure
- Quand l'équipe n'est pas alignée sur "quel problème on résout"
- Après un échec de projet pour identifier la vraie cause
- Lors d'un pivot stratégique

**Anti-patterns et erreurs communes** :

| Anti-pattern | Exemple | Solution |
|--------------|---------|----------|
| **Solution déguisée** | "Le problème est qu'on n'a pas d'app mobile" | Reformuler en termes de besoin utilisateur |
| **Trop vague** | "Les clients ne sont pas satisfaits" | Préciser qui, quand, pourquoi |
| **Trop étroit** | Focus sur un symptôme plutôt que la cause | Utiliser les 5 Whys |
| **Sans données** | Basé uniquement sur intuition | Valider avec interviews |
| **Sans utilisateur** | Problème business uniquement | Inclure la perspective utilisateur |

**Exemple concret - E-commerce B2C** :

**Mauvais Problem Statement** :
> "Nous devons améliorer notre taux de conversion."

**Bon Problem Statement** :
> "Les primo-acheteurs de notre site e-commerce mode (25-35 ans, mobile-first) abandonnent leur panier à 73% au moment du choix de livraison parce qu'ils découvrent tardivement des frais de port jugés excessifs (>5€), ce qui génère une perte estimée de 45 000€/mois et une frustration mesurée à 2.1/5 dans les enquêtes post-abandon."

**Template recommandé pour e-commerce** :

```markdown
## Problem Statement Canvas

### 1. Contexte
- Secteur : [B2B/B2C/SaaS]
- Produit/Service : [Description]
- Phase actuelle : [Lancement/Croissance/Maturité]

### 2. Utilisateur cible
- Qui : [Persona principal]
- Situation : [Contexte d'utilisation]

### 3. Problème
- Besoin : [Ce que l'utilisateur cherche à accomplir]
- Obstacle actuel : [Ce qui l'en empêche]
- Impact : [Conséquence mesurable]

### 4. Evidence
- Source 1 : [Donnée quantitative]
- Source 2 : [Verbatim utilisateur]
- Source 3 : [Observation terrain]

### 5. Scope
- Dans le périmètre : [Ce qu'on adresse]
- Hors périmètre : [Ce qu'on n'adresse pas]
```

---

### 2.2 Jobs-to-be-Done (JTBD)

#### Niveau 1 - Vulgarisation

**Définition simple** : Le framework Jobs-to-be-Done part d'une idée simple : les gens n'achètent pas des produits, ils les "embauchent" pour accomplir un travail dans leur vie. Comprendre ce "travail" permet de créer des produits vraiment utiles.

**Analogie** : Quand vous achetez une perceuse, vous n'achetez pas vraiment la perceuse — vous "embauchez" cette perceuse pour faire un trou dans le mur. Et en réalité, vous voulez accrocher un tableau. Le vrai "job", c'est décorer votre intérieur et vous sentir bien chez vous.

**Pourquoi c'est important** : JTBD permet de voir au-delà des fonctionnalités pour comprendre les vraies motivations. Cela évite de créer des produits techniquement parfaits mais que personne n'utilise.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : Jobs-to-be-Done est un framework d'innovation qui définit les marchés non pas par les caractéristiques démographiques ou les produits, mais par les "jobs" (travaux fonctionnels, émotionnels et sociaux) que les clients cherchent à accomplir.

**Origine et historique** :

| Année | Événement | Acteur |
|-------|-----------|--------|
| 1990 | Conceptualisation initiale | **Tony Ulwick** (Strategyn) |
| 1992 | Premier succès majeur (Cordis Corporation : 1% → 20% part de marché) | Ulwick + Cordis |
| 2003 | Popularisation grand public | **Clayton Christensen** (*The Innovator's Solution*) |
| 2005 | Formalisation ODI (Outcome-Driven Innovation) | Strategyn |
| 2016 | *Competing Against Luck* | Christensen, Hall, Dillon, Duncan |
| 2017 | *Jobs to be Done* (approche Demand-Side) | **Bob Moesta** |

**Les deux écoles principales** :

**1. ODI - Outcome-Driven Innovation (Tony Ulwick/Strategyn)**
- Focus sur les **outcomes** (résultats désirés) mesurables
- Très structuré et quantitatif
- Identifie les "underserved outcomes" via enquêtes
- Formule : `Importance × (1 - Satisfaction) = Opportunity Score`

**2. Switch/Demand-Side (Bob Moesta/Clayton Christensen)**
- Focus sur le **contexte de décision** et les forces en jeu
- Plus qualitatif et narratif
- Analyse les "Four Forces" : Push, Pull, Anxiety, Habit
- Utilise les entretiens "Switch Interview"

**Structure d'un Job Statement** :

```
Verbe d'action + Objet + Clarificateur contextuel
```

**Exemples** :
- ❌ "Utiliser Spotify" (c'est un produit, pas un job)
- ✅ "Découvrir de nouvelles musiques qui correspondent à mon humeur actuelle"
- ✅ "Me sentir productif pendant mon trajet domicile-travail"

**Les trois dimensions d'un Job** :

| Dimension | Description | Exemple (e-commerce) |
|-----------|-------------|----------------------|
| **Fonctionnel** | La tâche pratique à accomplir | "Réapprovisionner mon stock rapidement" |
| **Émotionnel** | Comment l'utilisateur veut se sentir | "Me sentir en contrôle de mes achats" |
| **Social** | Comment il veut être perçu | "Être vu comme un acheteur avisé par ma hiérarchie" |

**Le modèle des "Four Forces" (Bob Moesta)** :

```
Forces POUSSANT vers le changement :
├── PUSH : Frustration avec la situation actuelle
└── PULL : Attraction vers la nouvelle solution

Forces RETENANT dans le statu quo :
├── ANXIETY : Peur du changement, incertitude
└── HABIT : Confort de l'existant, inertie
```

**Méthodologies formelles** :
- **ODI (Outcome-Driven Innovation)** : 84 étapes formalisées par Strategyn
- **Switch Interview** : Entretien narratif de 45-60 min sur une décision d'achat récente
- **Job Mapping** : Cartographie des étapes du job en 8 phases universelles

**Les 8 étapes universelles d'un Job (Job Map)** :
1. Define (Définir le besoin)
2. Locate (Trouver les inputs nécessaires)
3. Prepare (Préparer l'exécution)
4. Confirm (Valider qu'on est prêt)
5. Execute (Exécuter le job)
6. Monitor (Surveiller l'exécution)
7. Modify (Ajuster si nécessaire)
8. Conclude (Terminer et ranger)

**Certifications** :
- Strategyn propose des formations certifiantes ODI
- JTBD+ Community offre des ressources et formations
- Pas de certification universellement reconnue type PMI/Scrum

**Tendances 2024-2025** :
- Intégration JTBD + Product Analytics pour validation quantitative
- JTBD appliqué à l'IA et aux interfaces conversationnelles
- Combinaison JTBD + OKRs pour alignement stratégique

**Critiques et limites** :
- Peut sembler abstrait pour les équipes techniques
- Risque de sur-interpréter les jobs émotionnels
- Nécessite des compétences d'interview avancées
- Deux écoles parfois contradictoires créent de la confusion

#### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Lancement d'un nouveau produit/service
- Redesign d'un produit existant qui stagne
- Compréhension d'un marché avant d'y entrer
- Identification d'opportunités d'innovation

**Anti-patterns JTBD** :

| Anti-pattern | Problème | Solution |
|--------------|----------|----------|
| **Confondre job et solution** | "Mon job est d'utiliser Excel" | Chercher le job sous-jacent |
| **Jobs trop vagues** | "Être heureux" | Préciser le contexte |
| **Ignorer les dimensions émotionnelles** | Focus uniquement fonctionnel | Explorer les 3 dimensions |
| **Un seul job** | Réalité simplifiée | Identifier le cluster de jobs |

**Exemple concret - E-commerce B2B (Fournitures industrielles)** :

**Job fonctionnel principal** :
> "Maintenir mes lignes de production opérationnelles sans interruption due aux ruptures de stock"

**Jobs associés** :
- "Anticiper mes besoins en consommables pour les 2 prochaines semaines"
- "Obtenir rapidement des pièces de remplacement en cas de panne"
- "Optimiser mon budget achats tout en garantissant la qualité"

**Job émotionnel** :
> "Me sentir serein sur ma capacité à tenir mes engagements de production"

**Job social** :
> "Être reconnu par ma direction comme un gestionnaire efficace"

**Forces en jeu (Four Forces)** :

```
PUSH (frustrations actuelles) :
- Processus de commande trop long (45 min)
- Pas de visibilité sur les délais réels
- Interface fournisseur actuel datée

PULL (attracteurs) :
- Promesse de commande en 3 clics
- Livraison garantie J+1
- Tableau de bord prédictif

ANXIETY (freins au changement) :
- "Et si la qualité n'est pas au rendez-vous ?"
- "Mon ERP est-il compatible ?"
- "Quid du support en cas de problème ?"

HABIT (inertie) :
- "Je connais mon commercial actuel"
- "J'ai mes références habituelles"
- "Le processus actuel fonctionne, même s'il est lent"
```

**Template d'interview JTBD (Switch Interview)** :

```markdown
## Guide d'entretien JTBD - Switch Interview (45-60 min)

### Introduction (5 min)
"Je voudrais comprendre comment vous avez pris votre dernière décision de [achat/changement]. Il n'y a pas de bonne ou mauvaise réponse."

### Timeline (15 min)
1. "Racontez-moi la dernière fois que vous avez [acheté X / changé de fournisseur]"
2. "Quand avez-vous commencé à y penser pour la première fois ?"
3. "Que s'est-il passé entre ce moment et l'achat ?"

### Forces (20 min)
**Push** : "Qu'est-ce qui n'allait pas avant ?"
**Pull** : "Qu'est-ce qui vous a attiré vers [nouvelle solution] ?"
**Anxiety** : "Qu'est-ce qui vous faisait hésiter ?"
**Habit** : "Qu'est-ce qui vous retenait dans votre ancienne solution ?"

### Outcomes (10 min)
"Maintenant que vous utilisez [solution], qu'est-ce qui a changé ?"
"Qu'est-ce qui pourrait être encore mieux ?"

### Clôture (5 min)
"Y a-t-il quelque chose que je n'ai pas demandé et que vous aimeriez ajouter ?"
```

---

### 2.3 Root Cause Analysis (Analyse des causes racines)

#### Niveau 1 - Vulgarisation

**Définition simple** : L'analyse des causes racines est une méthode pour trouver la vraie source d'un problème, pas juste ses symptômes. C'est comme un médecin qui cherche pourquoi vous avez de la fièvre, plutôt que de simplement vous donner un antipyrétique.

**Analogie** : Votre voiture fait un bruit étrange. Vous pourriez mettre la radio plus fort (traiter le symptôme) ou ouvrir le capot pour trouver ce qui ne va pas (trouver la cause racine). La deuxième option évite la panne sur l'autoroute.

**Pourquoi c'est important** : Résoudre les symptômes crée un cycle sans fin de corrections. Trouver la cause racine permet de régler le problème une fois pour toutes.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : La Root Cause Analysis (RCA) est un ensemble de méthodologies structurées visant à identifier les causes fondamentales d'un problème ou d'un événement indésirable, plutôt que ses manifestations superficielles.

**Origine et historique** :
- Années 1950 : Développement dans l'industrie aérospatiale et nucléaire
- 1960-70 : Formalisation chez Toyota (Toyota Production System)
- 1980-90 : Adoption dans le management de la qualité (TQM, Six Sigma)
- 2000+ : Application au développement logiciel et UX

**Principales méthodes** :

**1. Les 5 Pourquoi (5 Whys)**
- **Origine** : Sakichi Toyoda, Toyota Production System
- **Principe** : Poser "Pourquoi ?" successivement (généralement 5 fois) jusqu'à atteindre la cause racine
- **Format** : Linéaire, une chaîne causale

**Exemple e-commerce** :
```
Problème : Le taux de conversion a chuté de 15%

1. Pourquoi ? → Les utilisateurs abandonnent au checkout
2. Pourquoi ? → Le temps de chargement du checkout est de 8 secondes
3. Pourquoi ? → Une nouvelle intégration de paiement alourdit la page
4. Pourquoi ? → Le script tiers charge toutes ses ressources upfront
5. Pourquoi ? → L'équipe dev n'a pas optimisé l'intégration (deadline serrée)

→ Cause racine : Processus de validation technique insuffisant avant mise en prod
```

**2. Diagramme d'Ishikawa (Fishbone / Arête de poisson)**
- **Origine** : Kaoru Ishikawa, 1968, Japon
- **Principe** : Catégoriser les causes possibles selon les "6M"
- **Format** : Visuel, arborescent, multi-causal

**Les 6M (adaptés au digital)** :
| Catégorie | Traditionnel | Adapté Digital |
|-----------|--------------|----------------|
| Main d'œuvre | Personnel | Équipe, compétences |
| Matériel | Équipements | Infrastructure, outils |
| Méthode | Processus | Process, workflows |
| Matière | Matières premières | Données, contenus |
| Milieu | Environnement | Contexte marché, concurrence |
| Mesure | Instruments de mesure | Analytics, KPIs |

**3. Fault Tree Analysis (FTA)**
- **Origine** : Bell Labs, 1962 (programme Minuteman)
- **Principe** : Arbre logique descendant (AND/OR) des causes
- **Usage** : Systèmes complexes, risques critiques

**4. Pareto Analysis (80/20)**
- **Origine** : Vilfredo Pareto, adapté par Joseph Juran
- **Principe** : 80% des effets proviennent de 20% des causes
- **Usage** : Prioriser les causes à traiter

**Métriques associées** :
- Temps moyen de résolution après RCA vs. sans RCA
- Taux de récurrence du problème après correction
- Nombre de causes racines identifiées par analyse

**Outils** :
- Miro, Mural (diagrammes collaboratifs)
- Lucidchart (diagrammes Ishikawa)
- Excel/Sheets (Pareto)

**Limites et critiques** :
- 5 Whys peut être trop linéaire pour problèmes multi-causaux
- Risque de biais de confirmation (trouver ce qu'on cherche)
- Nécessite des données factuelles, pas des opinions
- Peut pointer vers des causes "confortables" plutôt que dérangeantes

#### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Après un incident ou une dégradation de KPI
- Lors de la Discovery pour comprendre un problème récurrent
- Post-mortem de projet
- Amélioration continue

**Anti-patterns RCA** :

| Anti-pattern | Exemple | Solution |
|--------------|---------|----------|
| **S'arrêter trop tôt** | "C'est la faute du dev" | Continuer à creuser : pourquoi cette erreur ? |
| **Blâmer les personnes** | Cause = "Jean n'a pas fait attention" | Chercher les causes systémiques |
| **Cause unique** | Un seul facteur identifié | Explorer les causes multiples (Ishikawa) |
| **Sans données** | Hypothèses non vérifiées | Valider chaque lien causal avec des faits |

**Template 5 Whys pour e-commerce** :

```markdown
## Analyse 5 Whys

**Date** : [Date]
**Problème observé** : [Description factuelle + données]
**Participants** : [Noms et rôles]

### Chaîne causale

| # | Pourquoi ? | Réponse | Preuve/Source |
|---|------------|---------|---------------|
| 1 | Pourquoi [problème] ? | [Réponse 1] | [Data/Source] |
| 2 | Pourquoi [réponse 1] ? | [Réponse 2] | [Data/Source] |
| 3 | Pourquoi [réponse 2] ? | [Réponse 3] | [Data/Source] |
| 4 | Pourquoi [réponse 3] ? | [Réponse 4] | [Data/Source] |
| 5 | Pourquoi [réponse 4] ? | [Cause racine] | [Data/Source] |

### Cause(s) racine(s) identifiée(s)
- [Cause 1]
- [Cause 2 si applicable]

### Actions correctives proposées
| Action | Responsable | Deadline | Statut |
|--------|-------------|----------|--------|
| ... | ... | ... | ... |
```

---

### 2.4 Opportunity Assessment (Évaluation d'opportunité)

#### Niveau 1 - Vulgarisation

**Définition simple** : L'Opportunity Assessment est le processus d'évaluation d'une idée de projet pour déterminer si elle vaut la peine d'être poursuivie. C'est comme évaluer si un investissement immobilier est rentable avant d'acheter.

**Analogie** : Avant d'ouvrir un restaurant, vous étudiez le quartier, la concurrence, le pouvoir d'achat des habitants, vos capacités en cuisine... L'Opportunity Assessment fait la même chose pour un projet digital.

**Pourquoi c'est important** : Toutes les bonnes idées ne sont pas de bonnes opportunités business. Cette évaluation évite d'investir du temps et de l'argent dans des projets voués à l'échec.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : L'Opportunity Assessment est un processus structuré d'évaluation multi-critères permettant de qualifier une opportunité de marché selon son attractivité (taille, croissance, accessibilité) et la capacité de l'organisation à la capturer (compétences, ressources, timing).

**Composantes d'une évaluation d'opportunité** :

**1. Attractivité du marché**
- Taille du marché (TAM/SAM/SOM - voir section 4.3)
- Taux de croissance
- Rentabilité potentielle
- Intensité concurrentielle

**2. Adéquation stratégique**
- Alignement avec la vision de l'entreprise
- Synergies avec l'existant
- Avantage compétitif potentiel

**3. Faisabilité**
- Compétences requises vs. disponibles
- Ressources nécessaires (budget, temps, équipe)
- Complexité technique
- Risques identifiés

**4. Timing**
- Maturité du marché
- Window of opportunity
- Contraintes temporelles

**Framework d'évaluation structuré** :

Le **Opportunity Assessment Template** de Marty Cagan (Silicon Valley Product Group) propose 10 questions clés :

1. Quel problème business cela résout-il ? (Objectif)
2. Pour qui est-ce un problème ? (Marché cible)
3. Quelle est la taille de l'opportunité ? (Sizing)
4. Comment mesurera-t-on le succès ? (Métriques)
5. Quelles alternatives les clients ont-ils aujourd'hui ? (Concurrence)
6. Pourquoi sommes-nous les mieux placés ? (Avantage)
7. Quels facteurs sont critiques au succès ? (Dépendances)
8. Quel est le timing ? (Urgence)
9. Comment allons-nous mettre cela sur le marché ? (GTM)
10. Quels sont les principaux risques ? (Risques)

**Matrices d'évaluation** :

**Matrice Attractivité-Capacité** (GE-McKinsey adaptée) :

```
                    CAPACITÉ À CAPTURER
                    Faible    Moyenne    Forte
ATTRACTIVITÉ  Forte   Développer  Investir   Priorité
DU MARCHÉ    Moyenne  Évaluer     Sélectif   Développer
             Faible   Abandonner  Évaluer    Sélectif
```

**Scoring d'opportunité** :

| Critère | Poids | Score (1-5) | Pondéré |
|---------|-------|-------------|---------|
| Taille marché | 20% | ? | ? |
| Croissance | 15% | ? | ? |
| Adéquation compétences | 20% | ? | ? |
| Différenciation possible | 20% | ? | ? |
| Risques | 15% | ? | ? |
| Timing | 10% | ? | ? |
| **TOTAL** | 100% | - | **?/5** |

**Seuils décisionnels (indicatifs)** :
- < 2.5 : No-Go
- 2.5 - 3.5 : Approfondir l'analyse
- > 3.5 : Go potentiel

**Tendances 2024-2025** :
- Intégration de données marché en temps réel (APIs, scraping)
- Scoring automatisé par IA
- Évaluation continue (pas uniquement en phase initiale)

#### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Évaluation d'une nouvelle idée de produit
- Arbitrage entre plusieurs opportunités
- Go/No-Go de phase Discovery
- Présentation à des investisseurs

**Template Opportunity Assessment pour e-commerce** :

```markdown
## Opportunity Assessment

### 1. Résumé de l'opportunité
**Nom du projet** : [Nom]
**Date** : [Date]
**Porteur** : [Nom]

**Pitch en 1 phrase** :
[Nous aidons [CIBLE] à [JOB] en [SOLUTION DIFFÉRENCIANTE]]

### 2. Le problème
- **Description** : [Problem Statement]
- **Preuves d'existence** : [Données, interviews, études]
- **Fréquence/Urgence** : [Quotidien, hebdo, ponctuel...]

### 3. Le marché
- **TAM** : [Chiffre + source]
- **SAM** : [Chiffre + hypothèses]
- **SOM (Y1-Y3)** : [Objectifs réalistes]
- **Croissance annuelle** : [%]

### 4. La concurrence
| Concurrent | Forces | Faiblesses | Part de marché |
|------------|--------|------------|----------------|
| ... | ... | ... | ... |

**Notre différenciation** : [Ce qui nous rend unique]

### 5. Notre capacité
- **Compétences clés requises** : [Liste]
- **Gap à combler** : [Ce qui nous manque]
- **Ressources nécessaires** : [Budget, équipe, temps]

### 6. Business Model
- **Revenus** : [Modèle de monétisation]
- **Coûts majeurs** : [Structure de coûts]
- **Break-even estimé** : [Timeline]

### 7. Risques principaux
| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| ... | H/M/L | H/M/L | ... |

### 8. Recommandation
☐ GO - Passer à la phase Stratégie
☐ PIVOT - Ajuster le concept
☐ NO-GO - Abandonner

**Justification** : [Arguments]
```

---

## 3. Recherche Utilisateur (User Research)

La recherche utilisateur est le **cœur battant** de la phase Discovery. Elle transforme des hypothèses en connaissances validées et des intuitions en insights actionnables. Sans elle, tout projet repose sur des suppositions dangereuses.

> "You are not your user." — Principe fondamental de l'UX Research

### 3.1 Méthodologies qualitatives

Les méthodes qualitatives visent à comprendre le **pourquoi** derrière les comportements. Elles génèrent des insights riches et nuancés, mais sur des échantillons plus restreints.

#### 3.1.1 Interviews utilisateurs

##### Niveau 1 - Vulgarisation

**Définition simple** : Une interview utilisateur est une conversation structurée avec une personne de votre cible pour comprendre ses besoins, frustrations et comportements. C'est comme un journaliste qui interviewe quelqu'un pour comprendre son histoire.

**Analogie** : Imaginez que vous voulez créer le restaurant parfait. Plutôt que de deviner ce que les gens veulent manger, vous discutez avec eux de leurs habitudes alimentaires, leurs contraintes, ce qu'ils adorent et détestent dans les restaurants actuels.

**Pourquoi c'est important** : Les interviews révèlent des insights qu'aucune donnée quantitative ne peut capturer — les émotions, les contextes, les workarounds que les gens inventent pour compenser les manques des solutions actuelles.

##### Niveau 2 - Approfondissement Expert

**Définition technique** : L'interview utilisateur est une méthode de recherche qualitative structurée, généralement en one-to-one, visant à collecter des données sur les attitudes, comportements, besoins et motivations des utilisateurs cibles à travers un échange verbal guidé.

**Origine et historique** :
- Racines dans l'**ethnographie** et la **sociologie** (début XXe siècle)
- Adaptation au design par **IDEO** et la **d.school** (années 1990-2000)
- Formalisation en UX Research par **Nielsen Norman Group** (années 2000)
- Intégration dans les processus Agile/Lean (2010+)

**Types d'interviews** :

| Type | Durée | Structure | Usage |
|------|-------|-----------|-------|
| **Exploratoire** | 45-90 min | Semi-structurée | Discovery, comprendre un domaine |
| **Contextuelle** | 60-120 min | Observation + questions | Comprendre l'usage in situ |
| **Dirigée** | 30-45 min | Structurée | Valider des hypothèses précises |
| **Switch Interview** | 45-60 min | Narrative (JTBD) | Comprendre les décisions d'achat |

**Structure d'une interview type (60 min)** :

```
1. Introduction (5 min)
   - Présentation, mise en confiance
   - Explication du cadre (pas de bonnes/mauvaises réponses)
   - Demande de permission d'enregistrer

2. Échauffement (5-10 min)
   - Questions générales sur le contexte
   - Établir le rapport

3. Corps de l'interview (35-40 min)
   - Questions ouvertes principales
   - Approfondissements ("Pouvez-vous m'en dire plus ?")
   - Exploration des émotions et motivations

4. Synthèse (5-10 min)
   - Récapitulatif des points clés
   - Questions de clarification
   - "Y a-t-il quelque chose que je n'ai pas demandé ?"

5. Clôture (5 min)
   - Remerciements
   - Prochaines étapes
   - Compensation si applicable
```

**Techniques d'interview avancées** :

| Technique | Description | Exemple |
|-----------|-------------|---------|
| **Laddering** | Remonter du comportement aux valeurs | "Pourquoi est-ce important pour vous ?" (répéter) |
| **Critical Incident** | Explorer des moments mémorables | "Racontez-moi la dernière fois que..." |
| **Think Aloud** | Verbaliser les pensées en action | "Dites-moi ce que vous pensez pendant que..." |
| **Projection** | Utiliser des scénarios hypothétiques | "Si vous aviez une baguette magique..." |
| **Five Whys** | Creuser les motivations | Enchaîner 5 "Pourquoi ?" |

**Biais à éviter** :

| Biais | Description | Mitigation |
|-------|-------------|------------|
| **Leading questions** | Suggérer la réponse | Utiliser des questions ouvertes |
| **Confirmation bias** | Chercher ce qu'on veut entendre | Avoir un guide neutre, faire relire |
| **Social desirability** | Réponses "socialement acceptables" | Normaliser les comportements, assurer la confidentialité |
| **Recall bias** | Souvenirs déformés | Demander des exemples récents et concrets |
| **Interviewer effect** | Influence de l'interviewer | Formation, standardisation |

**Combien d'interviews ?**

Selon Nielsen Norman Group et la recherche académique :
- **5-8 interviews** : Suffisant pour identifier les patterns majeurs (80% des problèmes d'utilisabilité)
- **12-15 interviews** : Saturation thématique pour la plupart des études
- **20+ interviews** : Projets complexes, multi-segments

**[À VÉRIFIER]** : Le chiffre de "5 utilisateurs pour trouver 80% des problèmes" (Nielsen, 2000) est souvent cité mais contesté pour les études Discovery plus larges. Il s'applique davantage aux tests d'utilisabilité qu'aux interviews exploratoires.

**Outils** :
- **Enregistrement** : Otter.ai, Grain, Dovetail (transcription auto)
- **Recrutement** : User Interviews, Respondent.io, Ethnio
- **Analyse** : Dovetail, EnjoyHQ, Aurelius
- **Vidéoconférence** : Zoom, Google Meet, Lookback

**Métriques** :
- Nombre d'interviews réalisées vs. planifiées
- Taux de saturation thématique
- Nombre d'insights actionnables par interview

##### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Phase exploratoire d'un nouveau projet
- Compréhension d'un nouveau marché/segment
- Investigation d'un problème complexe
- Validation qualitative d'hypothèses

**Anti-patterns des interviews** :

| Anti-pattern | Exemple | Solution |
|--------------|---------|----------|
| **Questions fermées** | "Aimez-vous notre produit ?" | "Comment utilisez-vous [produit] ?" |
| **Questions multiples** | "Est-ce que X et comment Y ?" | Une question à la fois |
| **Jargon technique** | Termes métier incompris | Vocabulaire de l'utilisateur |
| **Défendre son produit** | Réagir aux critiques | Écoute active, neutralité |
| **Interview = test utilisabilité** | Montrer des écrans trop tôt | Séparer les objectifs |

**Guide d'entretien type - E-commerce B2C** :

```markdown
## Guide d'entretien Discovery - E-commerce Mode

**Objectif** : Comprendre le parcours d'achat et les frustrations des acheteurs 25-35 ans

**Durée** : 45 minutes

### Introduction (5 min)
"Bonjour [Prénom], merci d'avoir accepté cet échange. Je travaille sur un projet lié à l'achat de vêtements en ligne. Il n'y a pas de bonnes ou mauvaises réponses, c'est votre expérience réelle qui m'intéresse. Puis-je enregistrer notre conversation ? Elle restera confidentielle."

### Contexte général (10 min)
1. "Parlez-moi de vous et de votre rapport à la mode/aux vêtements."
2. "Comment faites-vous habituellement pour acheter des vêtements ?"
3. "Quelle est la répartition entre achats en ligne et en magasin ?"

### Dernier achat en ligne (15 min)
4. "Racontez-moi votre dernier achat de vêtement en ligne, du début à la fin."
   - Relances : Qu'est-ce qui a déclenché cet achat ? Comment avez-vous choisi le site ? Combien de temps ça a pris ?
5. "Qu'est-ce qui s'est bien passé ? Qu'est-ce qui a été frustrant ?"
6. "Y a-t-il eu un moment où vous avez failli abandonner ?"

### Frustrations et besoins (10 min)
7. "Qu'est-ce qui vous agace le plus dans l'achat de vêtements en ligne ?"
8. "Qu'est-ce qui vous ferait acheter plus souvent en ligne ?"
9. "Si vous aviez une baguette magique, que changeriez-vous ?"

### Clôture (5 min)
10. "Y a-t-il quelque chose d'important que je n'ai pas abordé ?"
11. "Avez-vous des questions pour moi ?"

**Remerciements + compensation**
```

---

#### 3.1.2 Focus Groups

##### Niveau 1 - Vulgarisation

**Définition simple** : Un focus group réunit 6-10 personnes pour discuter d'un sujet ensemble, guidées par un modérateur. C'est comme une table ronde où les participants rebondissent sur les idées des autres.

**Analogie** : Imaginez un dîner entre amis où tout le monde discute de leurs vacances idéales. Les idées fusent, les gens se complètent, et des thèmes émergent naturellement.

**Pourquoi c'est important** : La dynamique de groupe génère des discussions et révèle des opinions que les gens n'auraient pas exprimées seuls.

##### Niveau 2 - Approfondissement Expert

**Définition technique** : Le focus group est une méthode de recherche qualitative réunissant un groupe homogène de 6-10 participants pour une discussion modérée de 90-120 minutes, visant à explorer attitudes, perceptions et opinions sur un sujet défini.

**Origine** : Développé par le sociologue Robert K. Merton dans les années 1940 pour la recherche en communication de masse.

**Caractéristiques** :

| Aspect | Spécification |
|--------|---------------|
| **Taille idéale** | 6-8 participants (min 5, max 10) |
| **Durée** | 90-120 minutes |
| **Nombre de sessions** | 3-4 groupes minimum pour patterns |
| **Homogénéité** | Participants similaires par groupe |
| **Modération** | 1 modérateur + 1 observateur/note-taker |

**Quand utiliser / ne pas utiliser** :

| ✅ Adapté pour | ❌ Pas adapté pour |
|----------------|-------------------|
| Explorer des opinions, attitudes | Comportements individuels détaillés |
| Générer des idées (brainstorming) | Sujets sensibles/intimes |
| Tester des concepts publicitaires | Quand la conformité sociale biaise |
| Comprendre le vocabulaire d'un segment | Estimation de fréquences/quantités |
| Identifier des thèmes généraux | Decision-making individuel |

**Dynamique de groupe - Phénomènes à gérer** :
- **Effet leader** : Un participant domine → Redistribuer la parole
- **Pensée de groupe** : Conformisme → Encourager les opinions divergentes
- **Effet de halo** : Premier intervenant influence → Varier l'ordre des prises de parole
- **Silencieux** : Non-participation → Questions directes, techniques projectives

**Structure type** :

```
1. Accueil (10 min)
   - Installation, rafraîchissements
   - Tour de table rapide

2. Introduction (10 min)
   - Règles du jeu (respect, pas de bonne réponse)
   - Sujet général

3. Échauffement (15 min)
   - Questions générales, faciles
   - Mise en confiance du groupe

4. Cœur de la discussion (45-60 min)
   - Questions principales
   - Exercices/stimuli (images, concepts)
   - Approfondissements

5. Synthèse (15 min)
   - Résumé des points clés
   - "Quelque chose à ajouter ?"

6. Clôture (10 min)
   - Remerciements
   - Compensation
```

**Limites et critiques** :
- Moins profond que les interviews individuelles
- Biais de conformité sociale
- Logistique complexe (réunir 8 personnes)
- Coût plus élevé (location, compensation multiple)
- Un participant peut "polluer" toute la session

##### Niveau 3 - Application Pratique

**Contexte optimal pour e-commerce** :
- Tester des concepts de campagne marketing
- Explorer les perceptions d'une marque
- Générer des idées de fonctionnalités
- Comprendre le vocabulaire des clients

**Guide de modération - Focus Group e-commerce B2B** :

```markdown
## Focus Group - Plateforme d'achat B2B

**Participants** : 8 acheteurs professionnels (PME industrielles)
**Durée** : 2 heures

### Module 1 : Contexte (20 min)
- Tour de table : rôle, entreprise, responsabilités achats
- "Décrivez une journée type quand vous devez passer des commandes"

### Module 2 : Frustrations actuelles (30 min)
- Post-its individuels : "3 choses qui vous agacent dans vos achats pro"
- Mise en commun et discussion
- Vote sur les plus importants

### Module 3 : Exploration de concepts (40 min)
- Présentation de 3 concepts (maquettes basse fidélité)
- Réactions à chaud (individuel puis groupe)
- Exercice : "Si vous deviez en choisir un seul..."

### Module 4 : Idéation (20 min)
- "Si vous conceviez la plateforme idéale, que devrait-elle avoir ?"
- Brainstorming collectif

### Clôture (10 min)
- Synthèse des points clés
- Questions ouvertes
```

---

#### 3.1.3 Ethnographie et Observation

##### Niveau 1 - Vulgarisation

**Définition simple** : L'ethnographie consiste à observer les utilisateurs dans leur environnement naturel — chez eux, au travail, dans un magasin — pour comprendre leurs comportements réels, pas ce qu'ils disent faire.

**Analogie** : C'est comme un documentariste animalier qui observe les lions dans la savane plutôt que dans un zoo. Le comportement naturel est très différent du comportement en "captivité" (interview).

**Pourquoi c'est important** : Les gens disent souvent une chose et en font une autre. L'observation révèle les comportements réels, les workarounds, les contextes invisibles.

##### Niveau 2 - Approfondissement Expert

**Définition technique** : L'ethnographie appliquée au design est une méthode d'immersion prolongée dans l'environnement naturel des utilisateurs, combinant observation directe, participation et entretiens informels pour comprendre les pratiques, rituels et significations culturelles.

**Origine** :
- Anthropologie culturelle (Bronisław Malinowski, années 1920)
- Adapté au business par IDEO et les designers des années 1990
- Popularisé par le terme "Design Ethnography"

**Types d'observation** :

| Type | Description | Implication chercheur |
|------|-------------|----------------------|
| **Non-participante** | Observer sans interagir | Fly on the wall |
| **Participante** | S'impliquer dans l'activité | Apprenti, collègue |
| **Shadowing** | Suivre une personne dans sa journée | Ombre silencieuse |
| **Contextual Inquiry** | Observer + questionner en temps réel | Enquêteur actif |

**Contextual Inquiry (approfondi)** :

Développé par Hugh Beyer et Karen Holtzblatt (1997), le Contextual Inquiry est un hybride observation/interview structuré en 4 principes :

1. **Context** : Aller sur le terrain, pas en salle de réunion
2. **Partnership** : Relation maître-apprenti (l'utilisateur enseigne)
3. **Interpretation** : Valider les interprétations en temps réel
4. **Focus** : Cadrer l'observation sur des questions précises

**Durée typique** :
- Observation ponctuelle : 2-4 heures
- Shadowing : 1 journée complète
- Ethnographie immersive : plusieurs jours à semaines

**Ce qu'on observe** :
- L'environnement physique (outils, organisation)
- Les interactions (avec qui, comment)
- Les séquences d'actions (workflow réel)
- Les interruptions et workarounds
- Le langage utilisé
- Les émotions visibles
- Ce qui n'est PAS fait (évitement)

**Outils de capture** :
- Notes terrain (papier ou digital)
- Photos (avec permission)
- Vidéo (quand possible)
- Croquis de l'environnement
- Enregistrements audio

**Limites** :
- Effet Hawthorne (comportement modifié quand observé)
- Temps et coût importants
- Accès parfois difficile (entreprises, domiciles)
- Subjectivité de l'observateur
- Difficulté de généralisation

##### Niveau 3 - Application Pratique

**Contexte optimal e-commerce** :
- Observer un acheteur B2B dans son bureau pendant une commande
- Suivre un client en magasin puis en ligne (parcours omnicanal)
- Observer l'utilisation d'un outil concurrent

**Grille d'observation - Acheteur e-commerce B2B** :

```markdown
## Fiche d'observation terrain

**Date** : [Date]
**Lieu** : [Description]
**Participant** : [Code/Initiales]
**Durée** : [Temps]

### Environnement
- Setup physique : [ ]
- Outils visibles : [ ]
- Interruptions observées : [ ]

### Séquence d'actions (timeline)
| Heure | Action | Outil | Commentaire/Émotion |
|-------|--------|-------|---------------------|
| 9:15 | Ouverture ERP | SAP | Soupir, "encore ce truc" |
| 9:18 | Recherche produit | Site fournisseur | Utilise Ctrl+F |
| ... | ... | ... | ... |

### Workarounds observés
- [ ]

### Verbatims spontanés
- "..."
- "..."

### Points de friction identifiés
1. [ ]
2. [ ]

### Hypothèses à creuser
- [ ]
```

---

#### 3.1.4 Diary Studies (Études journalières)

##### Niveau 1 - Vulgarisation

**Définition simple** : Une diary study demande aux participants de noter leurs expériences sur une période (jours, semaines) via un journal, une app, ou des messages. C'est comme demander à quelqu'un de tenir un carnet de bord.

**Pourquoi c'est important** : Certains comportements se déroulent sur la durée ou à des moments imprévisibles. La diary study capture ce qui se passe quand vous n'êtes pas là.

##### Niveau 2 - Approfondissement Expert

**Définition technique** : La diary study (ou étude par journal de bord) est une méthode de recherche longitudinale où les participants documentent leurs expériences, comportements ou pensées in situ, sur une période définie, permettant de capturer des données contextuelles et temporelles.

**Caractéristiques** :

| Aspect | Spécification |
|--------|---------------|
| **Durée typique** | 1-4 semaines |
| **Fréquence de saisie** | 1-3 fois/jour ou par événement |
| **Participants** | 10-20 (attrition à prévoir) |
| **Format** | App, SMS, email, formulaire, carnet |

**Types de diary studies** :

| Type | Déclencheur | Exemple |
|------|-------------|---------|
| **Interval-based** | À heures fixes | "Notez votre humeur à 9h, 14h, 19h" |
| **Event-based** | Quand X se produit | "Notez chaque fois que vous commandez en ligne" |
| **Signal-based** | Notification aléatoire | Ping aléatoire pour capturer le moment |

**Outils dédiés** :
- dscout (leader du marché)
- Indeemo
- Diary Studies (Optimal Workshop)
- Google Forms / Typeform (budget limité)
- WhatsApp/SMS (très simple)

**Avantages** :
- Capture le contexte réel et temporel
- Réduit le biais de mémoire (notation immédiate)
- Couvre des périodes longues
- Moins intrusif que l'observation

**Limites** :
- Attrition (participants qui abandonnent)
- Charge sur les participants (fatigue)
- Qualité variable des entrées
- Auto-censure possible

##### Niveau 3 - Application Pratique

**Exemple e-commerce - Diary Study "Parcours d'achat"** :

```markdown
## Protocole Diary Study - Décisions d'achat mode

**Durée** : 2 semaines
**Participants** : 15 femmes 25-40 ans, acheteuses mode régulières
**Outil** : dscout

### Mission pour les participants

"Pendant 2 semaines, documentez CHAQUE fois que vous pensez à acheter un vêtement, que vous achetiez ou non."

### Questions à chaque entrée

1. **Contexte** : Où êtes-vous ? Que faisiez-vous ?
2. **Déclencheur** : Qu'est-ce qui vous a donné envie ?
3. **Action** : Qu'avez-vous fait ? (recherche, achat, abandon...)
4. **Émotion** : Comment vous sentiez-vous ?
5. **Résultat** : Avez-vous acheté ? Pourquoi / pourquoi pas ?
6. **Photo** (optionnel) : Ce qui a attiré votre attention

### Compensation
- 50€ pour complétion des 2 semaines (min 10 entrées)
- Bonus 20€ si 15+ entrées qualitatives
```

---

### 3.2 Méthodologies quantitatives

Les méthodes quantitatives répondent au **combien** et permettent de généraliser à partir d'échantillons plus larges. Elles complètent les insights qualitatifs par des données mesurables.

#### 3.2.1 Surveys et questionnaires

##### Niveau 1 - Vulgarisation

**Définition simple** : Un survey est un questionnaire envoyé à de nombreuses personnes pour collecter des données standardisées. C'est comme un sondage d'opinion mais orienté vers les besoins et comportements.

**Pourquoi c'est important** : Après avoir identifié des patterns en qualitatif, le survey permet de les quantifier : "Est-ce que ce problème touche 10% ou 80% de notre cible ?"

##### Niveau 2 - Approfondissement Expert

**Définition technique** : L'enquête par questionnaire est une méthode de collecte de données structurées auprès d'un échantillon représentatif, utilisant des questions standardisées (ouvertes, fermées, échelles) pour permettre une analyse statistique.

**Types de questions** :

| Type | Usage | Exemple |
|------|-------|---------|
| **Fermée (choix unique)** | Catégoriser | "Genre : H / F / Autre" |
| **Fermée (choix multiple)** | Multi-réponses | "Quels sites utilisez-vous ? □A □B □C" |
| **Échelle de Likert** | Mesurer attitudes | "1-Pas du tout d'accord → 5-Tout à fait" |
| **NPS** | Recommandation | "0-10, recommanderiez-vous ?" |
| **Ouverte** | Exploration | "Décrivez votre principale frustration" |
| **Matrice** | Évaluer plusieurs items | Plusieurs critères × même échelle |

**Taille d'échantillon** :

| Objectif | Taille minimum | Marge d'erreur |
|----------|----------------|----------------|
| Tendances générales | 100-200 | ±7-10% |
| Segmentation | 300-500 | ±4-5% |
| Analyse statistique robuste | 500+ | <±4% |

**Formule de calcul d'échantillon** :
```
n = (Z² × p × (1-p)) / e²

n = taille d'échantillon
Z = niveau de confiance (1.96 pour 95%)
p = proportion estimée (0.5 si inconnue)
e = marge d'erreur souhaitée
```

**Biais à éviter** :

| Biais | Description | Solution |
|-------|-------------|----------|
| **Non-réponse** | Certains profils ne répondent pas | Relances, incentives |
| **Acquiescence** | Tendance à dire "oui" | Alterner questions positives/négatives |
| **Central tendency** | Éviter les extrêmes | Échelles paires (sans neutre) |
| **Order effect** | Premières questions influencent | Randomiser l'ordre |
| **Social desirability** | Réponses "bien vues" | Questions indirectes |

**Outils** :
- **Création** : Typeform, Google Forms, SurveyMonkey, Qualtrics
- **Panels** : Prolific, MTurk, Toluna, Dynata
- **Analyse** : SPSS, R, Excel, Google Sheets

**Métriques clés** :
- Taux de complétion
- Temps moyen de réponse
- Distribution des réponses
- Corrélations entre variables

##### Niveau 3 - Application Pratique

**Template Survey Discovery - E-commerce** :

```markdown
## Survey - Habitudes d'achat en ligne

**Cible** : Clients e-commerce mode, 18-45 ans
**Durée estimée** : 5-7 minutes
**Incentive** : Tirage au sort 3×50€

---

### Section 1 : Profil (2 min)

Q1. Quel est votre genre ?
○ Femme ○ Homme ○ Non-binaire ○ Je préfère ne pas répondre

Q2. Quelle est votre tranche d'âge ?
○ 18-24 ○ 25-34 ○ 35-44 ○ 45+

Q3. À quelle fréquence achetez-vous des vêtements en ligne ?
○ Plusieurs fois/mois ○ 1 fois/mois ○ Tous les 2-3 mois ○ Moins souvent

---

### Section 2 : Comportements (3 min)

Q4. Quels sites/apps utilisez-vous pour acheter des vêtements ? (Plusieurs réponses)
□ Zalando □ ASOS □ Amazon □ Vinted □ Marques en direct □ Autre: ___

Q5. Quel appareil utilisez-vous principalement pour ces achats ?
○ Smartphone ○ Ordinateur ○ Tablette ○ Variable

Q6. Qu'est-ce qui déclenche généralement un achat ? (Plusieurs réponses)
□ Besoin précis □ Promotion □ Inspiration réseaux sociaux □ Renouvellement □ Autre: ___

---

### Section 3 : Frustrations (2 min)

Q7. À quel point ces éléments sont-ils frustrants pour vous ? (1=Pas du tout, 5=Très)

| Élément | 1 | 2 | 3 | 4 | 5 |
|---------|---|---|---|---|---|
| Frais de livraison | ○ | ○ | ○ | ○ | ○ |
| Délais de livraison | ○ | ○ | ○ | ○ | ○ |
| Taille incorrecte | ○ | ○ | ○ | ○ | ○ |
| Processus de retour | ○ | ○ | ○ | ○ | ○ |
| Photos non représentatives | ○ | ○ | ○ | ○ | ○ |

Q8. Quelle est votre plus grande frustration avec l'achat de vêtements en ligne ?
[Champ libre - 200 caractères max]

---

### Section 4 : NPS

Q9. Sur une échelle de 0-10, quelle est la probabilité que vous recommandiez [Site X] ?
[Curseur 0-10]

Q10. Pourquoi avez-vous donné cette note ?
[Champ libre]

---

**Merci pour votre participation !**
```

---

#### 3.2.2 Analytics Analysis

##### Niveau 1 - Vulgarisation

**Définition simple** : L'analyse analytics consiste à exploiter les données de comportement déjà collectées (visites, clics, achats) pour comprendre ce que font réellement les utilisateurs sur votre site ou app.

**Pourquoi c'est important** : Les analytics montrent le comportement réel de milliers d'utilisateurs, pas ce qu'ils disent faire. C'est une mine d'or pour identifier les points de friction.

##### Niveau 2 - Approfondissement Expert

**Types de données analytics** :

| Catégorie | Exemples | Outils |
|-----------|----------|--------|
| **Web Analytics** | Pages vues, sessions, bounce rate | Google Analytics, Matomo |
| **Product Analytics** | Feature usage, rétention, funnels | Amplitude, Mixpanel, Heap |
| **Heatmaps** | Clics, scroll, attention | Hotjar, Contentsquare, Clarity |
| **Session Replay** | Enregistrements de sessions | FullStory, LogRocket |
| **E-commerce** | Conversion, panier moyen, LTV | Built-in + GA4 E-commerce |

**Métriques Discovery clés pour e-commerce** :

| Métrique | Formule/Définition | Benchmark indicatif |
|----------|---------------------|---------------------|
| **Taux de rebond** | Sessions 1 page / Total sessions | 40-60% (e-commerce) |
| **Taux de conversion** | Transactions / Sessions | 1-3% (B2C mode) |
| **Taux d'abandon panier** | 1 - (Achats / Ajouts panier) | 60-80% |
| **Pages/session** | Total pages / Sessions | 3-5 |
| **Temps sur site** | Durée moyenne session | 2-4 min |

**Analyse de funnel** :

```
Visite Homepage     100% (10 000 sessions)
       ↓ -40%
Page catégorie      60% (6 000)
       ↓ -33%
Page produit        40% (4 000)
       ↓ -50%
Ajout panier        20% (2 000)
       ↓ -60%
Checkout initié     8% (800)
       ↓ -25%
Achat confirmé      6% (600)  → Taux de conversion : 6%
```

**Questions Discovery via Analytics** :
- Où les utilisateurs abandonnent-ils ? (funnel drop-off)
- Quelles pages ont le plus de sorties ?
- Quels parcours mènent à la conversion ?
- Y a-t-il des différences mobile/desktop ?
- Quels segments performent différemment ?

##### Niveau 3 - Application Pratique

**Checklist analyse analytics Discovery** :

```markdown
## Audit Analytics - Phase Discovery

### 1. Vue d'ensemble (Derniers 3 mois)
- [ ] Sessions totales : ___
- [ ] Utilisateurs uniques : ___
- [ ] Taux de rebond global : ___%
- [ ] Taux de conversion : ___%
- [ ] Panier moyen : ___€

### 2. Analyse des sources
- [ ] Top 5 sources de trafic
- [ ] Taux de conversion par source
- [ ] Source avec meilleur ROI

### 3. Analyse funnel
- [ ] Funnel principal identifié
- [ ] Étape avec plus grande perte : ___
- [ ] Drop-off à cette étape : ___%

### 4. Segmentation
- [ ] Mobile vs Desktop (conversion)
- [ ] Nouveaux vs Retours
- [ ] Par pays/région

### 5. Comportement
- [ ] Pages les plus visitées
- [ ] Pages avec plus fort taux de sortie
- [ ] Parcours types (top 3)

### 6. Insights clés
1. ___
2. ___
3. ___

### 7. Hypothèses à valider en qualitatif
- [ ] ___
- [ ] ___
```

---

### 3.3 Recrutement et échantillonnage

#### Niveau 1 - Vulgarisation

**Définition simple** : Le recrutement consiste à trouver les bonnes personnes pour participer à votre recherche. Un mauvais recrutement = des résultats inutiles.

**Pourquoi c'est important** : Interviewer les mauvaises personnes (fans, proches, non-représentatifs) donne des insights trompeurs qui mènent à de mauvaises décisions.

#### Niveau 2 - Approfondissement Expert

**Critères de recrutement (Screener)** :

| Critère | Exemple | Objectif |
|---------|---------|----------|
| **Démographique** | Âge, genre, localisation | Représentativité |
| **Comportemental** | "A acheté en ligne dans les 30 jours" | Pertinence |
| **Attitudinal** | "Intéressé par la mode durable" | Fit avec le sujet |
| **Exclusion** | Pas d'employés du secteur | Éviter les biais |

**Sources de recrutement** :

| Source | Avantages | Inconvénients | Coût |
|--------|-----------|---------------|------|
| **Base clients** | Pertinent, gratuit | Biais clients actuels | Faible |
| **Panels (User Interviews, Respondent)** | Rapide, qualifié | Professionnels du panel | Moyen-Élevé |
| **Réseaux sociaux** | Large reach, ciblage | Qualité variable | Variable |
| **Interception (site/app)** | Utilisateurs réels, contexte | Intrusif, biais timing | Faible |
| **Recrutement terrain** | Contexte réel | Temps, logistics | Moyen |

**Compensation (incentives)** :

| Type d'étude | Durée | Compensation indicative (France) |
|--------------|-------|----------------------------------|
| Survey court | 5-10 min | 2-5€ ou tirage au sort |
| Survey long | 15-20 min | 10-15€ |
| Interview remote | 45-60 min | 30-50€ |
| Interview présentiel | 60-90 min | 50-80€ |
| Focus group | 2h | 70-100€ |
| Diary study (2 sem) | Variable | 50-100€ |
| Test utilisabilité | 30-60 min | 30-50€ |

**Taille d'échantillon recommandée** :

| Méthode | Minimum | Recommandé | Saturation |
|---------|---------|------------|------------|
| Interviews exploratoires | 5 | 8-12 | 12-15 |
| Interviews par segment | 3-5 | 5-8 par segment | 8-10 |
| Focus groups | 2 groupes | 3-4 groupes | 4-6 |
| Tests utilisabilité | 5 | 5-8 | 8-10 |
| Surveys | 100 | 300-500 | N/A |

#### Niveau 3 - Application Pratique

**Template Screener - Recrutement e-commerce** :

```markdown
## Screener de recrutement

**Étude** : Interviews Discovery - Achat mode en ligne
**Cible** : 10 participants
**Compensation** : 40€ en bon d'achat

---

### Questions de qualification

Q1. Quel est votre âge ?
○ Moins de 25 ans → TERMINER
○ 25-35 ans → CONTINUER (quota : 5)
○ 36-45 ans → CONTINUER (quota : 5)
○ Plus de 45 ans → TERMINER

Q2. Avez-vous acheté des vêtements en ligne au cours des 3 derniers mois ?
○ Oui → CONTINUER
○ Non → TERMINER

Q3. Combien avez-vous dépensé en ligne pour des vêtements ces 3 derniers mois ?
○ Moins de 50€ → TERMINER
○ 50-200€ → CONTINUER
○ Plus de 200€ → CONTINUER

Q4. Travaillez-vous dans l'un de ces secteurs ? (Mode, E-commerce, Marketing, UX)
○ Oui → TERMINER
○ Non → CONTINUER

Q5. Avez-vous participé à une étude rémunérée ces 6 derniers mois ?
○ Oui → TERMINER
○ Non → QUALIFIER

---

### Si qualifié

"Merci ! Vous êtes éligible pour participer à notre étude.
Il s'agit d'un entretien de 45 minutes en visio.
Vous recevrez 40€ en bon d'achat.
Quelles sont vos disponibilités la semaine prochaine ?"
```

---

### 3.4 Synthèse et analyse des données qualitatives

#### 3.4.1 Affinity Mapping / Affinity Diagram

##### Niveau 1 - Vulgarisation

**Définition simple** : L'affinity mapping consiste à regrouper des post-its (notes, observations, verbatims) en catégories qui émergent naturellement. C'est comme trier un jeu de cartes par familles, mais les familles se révèlent en triant.

**Analogie** : Imaginez que vous videz un carton de déménagement. Vous triez les objets en tas : "cuisine", "bureau", "à jeter"... Les catégories émergent des objets eux-mêmes.

**Pourquoi c'est important** : L'affinity mapping transforme un chaos de données brutes en patterns compréhensibles et actionnables.

##### Niveau 2 - Approfondissement Expert

**Définition technique** : L'affinity diagram (diagramme d'affinités) est une technique de synthèse visuelle issue du KJ Method (Jiro Kawakita, années 1960) permettant d'organiser de grandes quantités de données qualitatives en groupes thématiques via un processus itératif bottom-up.

**Processus** :

```
1. PRÉPARER (30 min)
   - Extraire les données brutes
   - 1 donnée = 1 post-it
   - Formulation factuelle/verbatim

2. AFFICHER (15 min)
   - Disposer tous les post-its
   - Lecture silencieuse

3. REGROUPER (45-90 min)
   - Déplacer les post-its similaires
   - Sans parler (règle du silence)
   - Itérer jusqu'à stabilisation

4. NOMMER (30 min)
   - Titrer chaque groupe
   - Titre = insight, pas description

5. HIÉRARCHISER (15 min)
   - Super-groupes si nécessaire
   - Identifier les thèmes majeurs

6. ANALYSER (30 min)
   - Quels patterns émergent ?
   - Qu'est-ce qui surprend ?
   - Quelles hypothèses valider ?
```

**Règles clés** :
- **1 idée = 1 post-it** (pas de méga-post-its)
- **Silence pendant le tri** (évite les discussions prématurées)
- **Bottom-up** (les catégories émergent, pas imposées)
- **Itératif** (plusieurs passages)
- **Collaboratif** (idéalement 3-6 personnes)

**Outils** :
- **Physique** : Post-its, grand mur ou tableau
- **Digital** : Miro, Mural, FigJam, Dovetail

##### Niveau 3 - Application Pratique

**Template Affinity Session** :

```markdown
## Session Affinity Mapping

**Date** : [Date]
**Participants** : [Noms]
**Données sources** : [X interviews, Y observations]
**Durée prévue** : 2-3 heures

### Préparation (avant session)
- [ ] Données extraites et sur post-its
- [ ] Salle réservée avec mur libre
- [ ] OU board Miro créé
- [ ] Participants briefés

### Déroulé

**10h00-10h15** : Introduction
- Objectif : identifier les patterns dans [sujet]
- Règles : silence pendant le tri, pas de jugement

**10h15-10h30** : Affichage
- Chacun lit tous les post-its
- Questions de clarification uniquement

**10h30-11h30** : Tri silencieux (Round 1)
- Déplacer les post-its similaires
- Ok de créer un groupe d'1 seul post-it
- Ok de déplacer ce qu'un autre a placé

**11h30-11h45** : Pause

**11h45-12h15** : Nommage des groupes
- Discussion pour titrer chaque cluster
- Titre = insight, pas catégorie générique
  - ❌ "Problèmes de livraison"
  - ✅ "L'incertitude sur la date de livraison crée de l'anxiété"

**12h15-12h45** : Synthèse
- Quels sont les 3-5 thèmes majeurs ?
- Qu'est-ce qui nous surprend ?
- Quelles hypothèses cela génère ?

### Output attendu
- Photo/export du board final
- Liste des insights majeurs (5-10)
- Hypothèses à valider
```

---

#### 3.4.2 Thematic Analysis

##### Niveau 1 - Vulgarisation

**Définition simple** : L'analyse thématique est une méthode rigoureuse pour identifier des thèmes récurrents dans des données qualitatives (interviews, observations). C'est plus structuré que l'affinity mapping.

##### Niveau 2 - Approfondissement Expert

**Définition technique** : L'analyse thématique (Braun & Clarke, 2006) est une méthode d'analyse qualitative flexible permettant d'identifier, analyser et rapporter des patterns (thèmes) au sein d'un corpus de données.

**Les 6 phases (Braun & Clarke)** :

| Phase | Description | Output |
|-------|-------------|--------|
| 1. **Familiarisation** | Lecture/relecture des données | Notes initiales |
| 2. **Codage initial** | Génération de codes systématiques | Liste de codes |
| 3. **Recherche de thèmes** | Regroupement des codes en thèmes | Thèmes candidats |
| 4. **Révision** | Vérification cohérence thèmes/données | Thèmes révisés |
| 5. **Définition** | Nommer et définir chaque thème | Thèmes finaux |
| 6. **Rédaction** | Production du rapport | Rapport d'analyse |

**Différence avec Affinity Mapping** :
- Plus rigoureux et documenté
- Processus individuel puis collectif
- Meilleure traçabilité (audit trail)
- Adapté pour publications/rapports formels

---

### 3.5 Création de Personas

#### Niveau 1 - Vulgarisation

**Définition simple** : Un persona est un personnage fictif qui représente un groupe d'utilisateurs réels. C'est comme créer un "client type" avec un prénom, une photo, des objectifs et des frustrations, basé sur des données de recherche.

**Analogie** : Dans un roman, l'auteur crée des personnages qui représentent des types de personnes réelles. Le persona, c'est pareil : un personnage fictif mais réaliste, qui aide l'équipe à garder l'utilisateur en tête.

**Pourquoi c'est important** : Le persona transforme des données abstraites en une personne concrète. L'équipe ne conçoit plus pour "les utilisateurs" (abstrait) mais pour "Marie, 34 ans, responsable achats" (concret).

#### Niveau 2 - Approfondissement Expert

**Définition technique** : Un persona est un archétype d'utilisateur, basé sur des données de recherche, représentant un segment d'utilisateurs partageant des comportements, objectifs et motivations similaires. Il sert d'outil de communication et de prise de décision design.

**Origine et historique** :
- **1983** : Alan Cooper développe les personas informellement lors d'un projet logiciel
- **1999** : Publication de *The Inmates are Running the Asylum* qui formalise la méthode
- **2004** : *About Face 2.0* (Cooper, Reimann) détaille la méthodologie Goal-Directed Design
- **2010+** : Adoption massive, émergence des data-driven personas

**Citation fondatrice (Alan Cooper)** :
> "Personas are not real people, but they represent them throughout the design process. They are *hypothetical archetypes* of actual users."

**Types de personas** :

| Type | Base | Usage | Validité |
|------|------|-------|----------|
| **Proto-persona** | Hypothèses, intuition | Très early stage, à valider | Faible |
| **Qualitative persona** | Interviews, observation | Standard Discovery | Moyenne-Haute |
| **Quantitative/Data-driven** | Analytics + qualitatif | Scale, segmentation | Haute |
| **Persona lean** | Format condensé | Équipes agiles | Variable |

**Composants d'un persona complet** :

```
┌─────────────────────────────────────────────────────┐
│  PHOTO          NOM + Titre/Rôle                    │
│  [Image]        "Marie Dupont, Responsable Achats"  │
│                                                     │
│  CITATION CLEF                                      │
│  "Je n'ai pas le temps de comparer 10 fournisseurs" │
├─────────────────────────────────────────────────────┤
│  DÉMOGRAPHIE           │  CONTEXTE                  │
│  - Âge : 38 ans        │  - PME industrielle, 50 pers│
│  - Localisation : Lyon │  - Budget annuel : 200K€    │
│  - Formation : BTS     │  - Équipe : 2 personnes     │
├─────────────────────────────────────────────────────┤
│  OBJECTIFS (Goals)     │  FRUSTRATIONS (Pain points) │
│  1. Réduire le temps   │  1. Interfaces datées       │
│     de commande        │  2. Pas de visibilité délai │
│  2. Garantir qualité   │  3. Process validation long │
│  3. Optimiser budget   │  4. SAV difficile à joindre │
├─────────────────────────────────────────────────────┤
│  COMPORTEMENTS                                      │
│  - Compare 2-3 devis systématiquement               │
│  - Utilise Excel pour tracker les commandes         │
│  - Préfère appeler que chercher sur un site         │
├─────────────────────────────────────────────────────┤
│  MOTIVATIONS           │  CRAINTES                   │
│  - Être efficace       │  - Rupture de stock         │
│  - Reconnaissance      │  - Erreur de commande       │
│  - Autonomie décision  │  - Fournisseur défaillant   │
├─────────────────────────────────────────────────────┤
│  JOURNEY TYPIQUE / SCÉNARIOS D'USAGE               │
│  [Description du parcours type]                     │
└─────────────────────────────────────────────────────┘
```

**Combien de personas ?**
- **Recommandé** : 3-5 personas maximum
- **Primary persona** : Le persona principal pour lequel on conçoit en priorité
- **Secondary personas** : Personas importants mais pas prioritaires
- **Anti-persona** : Pour qui on ne conçoit PAS (utile pour focus)

**Méthodologie Cooper - Goal-Directed Design** :

1. **Recherche** : Interviews, observation (8-12 participants)
2. **Modélisation** : Identifier les patterns comportementaux
3. **Clustering** : Regrouper par objectifs et comportements similaires
4. **Synthèse** : Créer les personas représentant chaque cluster
5. **Validation** : Vérifier que les personas couvrent les cas d'usage
6. **Priorisation** : Définir le primary persona

**Erreurs courantes (anti-patterns)** :

| Erreur | Conséquence | Solution |
|--------|-------------|----------|
| **Persona = segment marketing** | Trop démographique, pas actionnable | Focus sur comportements et objectifs |
| **Persona sans données** | Fiction non représentative | Toujours baser sur recherche |
| **Trop de personas** | Équipe perdue, pas de focus | Maximum 5, définir le primary |
| **Persona figé** | Devient obsolète | Réviser régulièrement |
| **Persona oublié** | Effort inutile | Intégrer dans les rituels |

**Tendances 2024-2025** :
- **Data-driven personas** : Enrichissement par analytics et IA
- **Living personas** : Mise à jour continue via données
- **Persona jobs-based** : Focus sur JTBD plutôt que démographie
- **Anti-personas** : Définir explicitement qui n'est pas la cible

#### Niveau 3 - Application Pratique

**Template Persona e-commerce B2B** :

```markdown
## Persona : Marie - La Gestionnaire Efficace

### Identité
**Nom** : Marie Dupont
**Âge** : 38 ans
**Poste** : Responsable Achats
**Entreprise** : PME industrielle (50 personnes)
**Localisation** : Région lyonnaise

**Photo** : [Femme professionnelle, bureau avec écrans]

### Citation clé
> "Mon job, c'est que les équipes aient ce qu'il faut quand il faut. Je n'ai pas de temps à perdre avec des interfaces compliquées."

### Contexte professionnel
- Budget annuel achats : 200-300K€
- Équipe : Marie + 1 assistante
- Outils actuels : SAP, Excel, emails
- Reportée au : DAF

### Objectifs (Goals)
1. **Primaire** : Garantir zéro rupture de stock
2. Réduire le temps passé sur les commandes récurrentes
3. Obtenir les meilleurs prix sans sacrifier la qualité
4. Avoir une visibilité claire sur les délais

### Frustrations (Pain Points)
1. Interfaces fournisseurs datées et complexes
2. Pas de visibilité temps réel sur disponibilité
3. Process de validation interne trop long (3 signatures)
4. SAV difficile à joindre, réponses lentes
5. Devis à demander par email/téléphone

### Comportements observés
- Compare toujours 2-3 devis minimum
- A une liste de "fournisseurs de confiance"
- Utilise Excel pour tout tracker
- Préfère appeler que naviguer sur un site complexe
- Commande souvent "en avance" par précaution

### Motivations profondes
- **Fonctionnel** : Efficacité, gain de temps
- **Émotionnel** : Sérénité, contrôle
- **Social** : Être reconnue comme fiable par sa direction

### Craintes
- Rupture de stock = arrêt production
- Erreur de commande = perte de crédibilité
- Nouveau fournisseur = risque qualité

### Parcours type (Scénario)
1. Reçoit alerte stock bas (email SAP)
2. Vérifie l'historique des commandes (Excel)
3. Va sur le site fournisseur habituel
4. Cherche le produit (souvent via Ctrl+F)
5. Vérifie prix et disponibilité
6. Ajoute au panier ou demande devis
7. Fait valider par DAF (email)
8. Finalise commande
9. Note dans Excel
**Temps total : 45 min à 2h selon complexité**

### Ce qui la ferait changer de fournisseur
- Interface simple et rapide
- Visibilité stock temps réel
- Réapprovisionnement automatique suggéré
- Prix compétitifs + qualité garantie
- Support réactif

### Citation de recherche (verbatim)
> "Le site [Concurrent X], j'y vais en dernier recours. Leur interface date de 2005. Je perds 20 minutes à chaque fois."
```

---

### 3.6 Empathy Maps

#### Niveau 1 - Vulgarisation

**Définition simple** : Une Empathy Map est un canvas visuel qui capture ce qu'un utilisateur dit, pense, fait et ressent. C'est un outil pour "rentrer dans la tête" de l'utilisateur.

**Analogie** : C'est comme prendre des lunettes qui vous permettent de voir le monde du point de vue de quelqu'un d'autre — non seulement ses actions, mais aussi ses pensées et émotions cachées.

**Pourquoi c'est important** : L'empathy map force l'équipe à considérer les aspects émotionnels et cognitifs, pas seulement les comportements observables.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : L'Empathy Map est un outil de visualisation collaboratif développé par XPLANE (Dave Gray) permettant de synthétiser les observations de recherche utilisateur en 4 quadrants : Says (Dit), Thinks (Pense), Does (Fait), Feels (Ressent).

**Structure classique (4 quadrants)** :

```
┌─────────────────────────────────────────────────────┐
│                    [UTILISATEUR]                    │
│                    Nom / Segment                    │
├────────────────────────┬────────────────────────────┤
│      THINKS            │         FEELS              │
│    (Ce qu'il pense)    │     (Ce qu'il ressent)     │
│                        │                            │
│  - Pensées intimes     │  - Émotions               │
│  - Préoccupations      │  - Frustrations           │
│  - Ce qu'il ne dit pas │  - Joies, peurs           │
│                        │                            │
├────────────────────────┼────────────────────────────┤
│       SAYS             │         DOES               │
│    (Ce qu'il dit)      │      (Ce qu'il fait)       │
│                        │                            │
│  - Citations verbatim  │  - Actions observées      │
│  - Ce qu'il exprime    │  - Comportements          │
│  - À vous, aux autres  │  - Habitudes              │
│                        │                            │
└────────────────────────┴────────────────────────────┘
```

**Version étendue (6 sections)** :

En plus des 4 quadrants, ajouter :
- **GAINS** : Ce que l'utilisateur cherche à obtenir, ses objectifs
- **PAINS** : Ses obstacles, frustrations, peurs

**Quand utiliser** :
- Après des interviews/observations, pour synthétiser
- En atelier, pour aligner l'équipe sur l'utilisateur
- Avant de créer des personas (étape intermédiaire)
- Pour communiquer les insights aux stakeholders

**Différence avec Persona** :

| Empathy Map | Persona |
|-------------|---------|
| Focus sur une situation/contexte | Portrait global |
| Outil de travail (atelier) | Livrable de référence |
| Souvent temporaire | Document pérenne |
| 1 par situation | 1 par segment |

**Règles de remplissage** :
- **SAYS** : Citations exactes, entre guillemets
- **THINKS** : Inféré des comportements et contexte
- **DOES** : Actions observées, factuelles
- **FEELS** : Émotions identifiées (indices verbaux/non-verbaux)

#### Niveau 3 - Application Pratique

**Template Empathy Map - E-commerce** :

```markdown
## Empathy Map

**Utilisateur** : Acheteur e-commerce B2C (primo-acheteur)
**Contexte** : Premier achat sur un site de mode inconnu
**Date** : [Date]
**Basé sur** : 6 interviews + 3 observations

---

### THINKS (Pense)
*Ce qu'il se dit intérieurement, ses préoccupations*

- "Est-ce que ce site est fiable ?"
- "La taille va-t-elle correspondre ?"
- "Si ça ne va pas, est-ce que je pourrai retourner ?"
- "Les photos, c'est la vraie couleur ?"
- "Pourquoi c'est moins cher qu'ailleurs ?"

### FEELS (Ressent)
*Ses émotions, du positif au négatif*

- 😟 **Anxiété** : Peur de se faire arnaquer
- 🤔 **Doute** : Incertitude sur la qualité
- 😊 **Excitation** : Plaisir de la découverte
- 😤 **Frustration** : Quand l'info manque
- 😌 **Soulagement** : Quand il voit "Retours gratuits"

### SAYS (Dit)
*Citations verbatim des interviews*

- "Je regarde toujours les avis avant d'acheter"
- "Les frais de port, ça me refroidit direct"
- "J'ai besoin de voir le produit porté, pas juste à plat"
- "Si le retour est galère, j'abandonne"
- "Je compare toujours sur 2-3 sites avant de décider"

### DOES (Fait)
*Comportements observés*

- Cherche les avis clients en premier
- Scrolle jusqu'aux photos "portées"
- Ouvre la page Livraison/Retours
- Compare le prix sur d'autres sites (nouvel onglet)
- Abandonne si création de compte obligatoire
- Prend screenshot pour "y réfléchir"

---

### GAINS (Ce qu'il veut)
- Trouver le bon produit rapidement
- Être sûr que ça lui ira
- Payer un prix juste
- Recevoir vite et sans mauvaise surprise

### PAINS (Ses obstacles)
- Incertitude sur la taille
- Peur du site frauduleux
- Frais de port découverts tard
- Processus de retour opaque
- Création de compte forcée

---

### Insights clés
1. La **confiance** est le frein n°1 sur un site inconnu
2. La **certitude sur la taille** est critique en mode
3. Les **frais de port** sont un deal-breaker si découverts tard
4. Le **parcours de retour** influence la décision d'achat

### Opportunités design
- Social proof visible dès la homepage
- Guide des tailles interactif
- Frais de port affichés dès la fiche produit
- Parcours retour expliqué clairement
```

---

## 4. Analyse de Marché et Veille Concurrentielle

L'analyse de marché en phase Discovery permet de **valider l'opportunité business** et de **positionner l'offre** dans son écosystème. Elle répond à des questions fondamentales : Le marché existe-t-il ? Est-il assez grand ? Qui sont les acteurs en place ? Quelle place pouvons-nous prendre ?

> "If you know the enemy and know yourself, you need not fear the result of a hundred battles." — Sun Tzu, *L'Art de la Guerre*

### 4.1 Analyse Concurrentielle (Competitive Analysis)

#### Niveau 1 - Vulgarisation

**Définition simple** : L'analyse concurrentielle consiste à identifier et étudier vos concurrents — qui ils sont, ce qu'ils proposent, leurs forces et faiblesses — pour comprendre votre environnement compétitif et trouver votre place.

**Analogie** : Avant d'ouvrir un café dans un quartier, vous faites le tour des cafés existants. Vous notez leurs prix, leur ambiance, leurs spécialités, leurs horaires, ce que les clients semblent apprécier ou critiquer. Cela vous aide à décider comment vous différencier.

**Pourquoi c'est important** : Ignorer la concurrence, c'est risquer de réinventer la roue ou de se lancer sur un marché saturé sans avantage distinctif. L'analyse concurrentielle révèle les opportunités inexploitées.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : L'analyse concurrentielle (Competitive Analysis) est un processus systématique d'identification, d'évaluation et de surveillance des concurrents directs et indirects, visant à comprendre leur stratégie, leurs capacités et leur positionnement pour informer les décisions stratégiques.

**Types de concurrents** :

| Type | Définition | Exemple (e-commerce mode) |
|------|------------|---------------------------|
| **Direct** | Même produit, même cible | Zalando vs ASOS |
| **Indirect** | Même besoin, solution différente | E-commerce vs Magasin physique |
| **Substitut** | Besoin alternatif | Achat neuf vs Location vs Seconde main |
| **Potentiel** | Pourrait entrer sur le marché | Amazon qui lance une verticale mode |

**Framework d'analyse concurrentielle** :

**1. Identification des concurrents**
- Recherche Google (mots-clés du marché)
- App stores (si applicable)
- Études sectorielles
- Demander aux utilisateurs cibles "Qu'utilisez-vous aujourd'hui ?"
- Réseaux sociaux et forums
- Crunchbase, LinkedIn (acteurs émergents)

**2. Critères d'analyse**

| Dimension | Éléments à analyser |
|-----------|---------------------|
| **Produit/Service** | Fonctionnalités, qualité, gamme, UX |
| **Positionnement** | Cible, proposition de valeur, messaging |
| **Prix** | Modèle de pricing, niveau de prix, promotions |
| **Distribution** | Canaux, présence géographique |
| **Marketing** | Stratégie d'acquisition, contenus, SEO |
| **Technologie** | Stack technique, innovations, brevets |
| **Business Model** | Sources de revenus, structure de coûts |
| **Ressources** | Équipe, financement, partenariats |
| **Réputation** | Avis clients, NPS estimé, médias |

**3. Outils d'analyse concurrentielle**

| Catégorie | Outils |
|-----------|--------|
| **SEO/Trafic** | SEMrush, Ahrefs, SimilarWeb |
| **Réseaux sociaux** | Socialbakers, Sprout Social |
| **App mobile** | App Annie, Sensor Tower |
| **Avis clients** | Trustpilot, G2, Capterra |
| **Technologie** | BuiltWith, Wappalyzer |
| **Financement** | Crunchbase, PitchBook |
| **Veille générale** | Google Alerts, Mention |

**Matrices d'analyse** :

**Matrice de positionnement (Perceptual Map)** :
```
                    Premium
                       ↑
         [Concurrent A]    [Concurrent B]
                       |
    Généraliste ←------+------→ Spécialisé
                       |
         [Concurrent C]    [NOUS ?]
                       ↓
                   Accessible
```

**Feature Comparison Matrix** :

| Fonctionnalité | Nous | Concurrent A | Concurrent B | Concurrent C |
|----------------|------|--------------|--------------|--------------|
| Feature 1 | ✅ | ✅ | ❌ | ✅ |
| Feature 2 | ✅ | ❌ | ✅ | ❌ |
| Feature 3 | 🔄 Prévu | ✅ | ✅ | ❌ |
| Prix | €€ | €€€ | € | €€ |

**Benchmarking UX** :
- Analyse des parcours utilisateurs concurrents
- Comparaison des temps de complétion
- Évaluation heuristique comparative
- Mystery shopping

**Métriques de veille** :
- Évolution du trafic concurrent (SimilarWeb)
- Part de voix (Share of Voice) sur les réseaux sociaux
- Évolution des notes/avis
- Annonces de levées de fonds / recrutements

**Tendances 2024-2025** :
- **Veille automatisée par IA** : Outils qui résument automatiquement les actualités concurrents
- **Analyse de sentiment** sur les avis concurrents
- **Competitive Intelligence** en temps réel intégrée aux dashboards

**Limites et pièges** :
- **Paralysie par l'analyse** : Trop d'analyse, pas d'action
- **Copycat syndrome** : Copier au lieu d'innover
- **Myopie concurrentielle** : Se focaliser sur les concurrents actuels, ignorer les disruptions
- **Données obsolètes** : Le marché évolue vite

#### Niveau 3 - Application Pratique

**Template Analyse Concurrentielle - E-commerce** :

```markdown
## Analyse Concurrentielle

**Marché** : [Définition du marché]
**Date** : [Date]
**Auteur** : [Nom]

---

### 1. Cartographie des concurrents

#### Concurrents directs
| Concurrent | Site | Cible | Positionnement | CA estimé |
|------------|------|-------|----------------|-----------|
| [Nom] | [URL] | [Cible] | [Positionnement] | [€] |

#### Concurrents indirects
| Concurrent | Type | Menace |
|------------|------|--------|
| [Nom] | [Type] | Faible/Moyenne/Forte |

#### Entrants potentiels
- [Liste des acteurs qui pourraient entrer]

---

### 2. Analyse détaillée (Top 3-5 concurrents)

#### Concurrent A : [Nom]

**Profil**
- Fondé en : [Année]
- Siège : [Lieu]
- Effectif : [Nombre]
- Financement : [Montant levé]

**Produit/Service**
- Offre : [Description]
- Forces : [Liste]
- Faiblesses : [Liste]

**Positionnement**
- Cible principale : [Description]
- Proposition de valeur : [UVP]
- Pricing : [Modèle + niveau]

**Marketing/Acquisition**
- Trafic mensuel estimé : [Chiffre]
- Canaux principaux : [Liste]
- SEO : [Mots-clés principaux]

**UX/Produit**
- Points forts UX : [Liste]
- Points faibles UX : [Liste]
- Fonctionnalités différenciantes : [Liste]

**Réputation**
- Note moyenne (Trustpilot/Avis) : [X/5]
- Points positifs récurrents : [Liste]
- Points négatifs récurrents : [Liste]

[Répéter pour chaque concurrent majeur]

---

### 3. Synthèse comparative

#### Matrice de positionnement
[Insérer graphique 2x2]

#### Comparaison fonctionnelle
| Critère | Nous | A | B | C |
|---------|------|---|---|---|
| [Critère 1] | | | | |
| [Critère 2] | | | | |

#### Comparaison tarifaire
| Offre | Nous | A | B | C |
|-------|------|---|---|---|
| Entrée de gamme | | | | |
| Milieu de gamme | | | | |
| Premium | | | | |

---

### 4. Opportunités et menaces

**Opportunités identifiées**
1. [Opportunité 1] — Aucun concurrent ne fait X
2. [Opportunité 2] — Segment sous-servi
3. [Opportunité 3] — Insatisfaction sur Y

**Menaces**
1. [Menace 1] — Concurrent A très fort sur Z
2. [Menace 2] — Barrières à l'entrée faibles
3. [Menace 3] — [Entrant potentiel] pourrait arriver

---

### 5. Recommandations stratégiques

**Positionnement recommandé** :
[Description du positionnement différenciant]

**Avantages à construire** :
1. [Avantage 1]
2. [Avantage 2]

**Ce qu'il ne faut PAS faire** :
- [Anti-pattern 1]
- [Anti-pattern 2]
```

---

### 4.2 Blue Ocean Strategy

#### Niveau 1 - Vulgarisation

**Définition simple** : La stratégie Blue Ocean consiste à créer un nouveau marché (un "océan bleu") plutôt que de se battre dans un marché saturé et compétitif (un "océan rouge" plein de requins).

**Analogie** : Imaginez une plage bondée où tous les vendeurs de glaces se battent pour les mêmes clients. Un vendeur Blue Ocean décide d'aller sur une plage déserte où il n'y a personne — il crée son propre marché avec de nouveaux clients.

**Pourquoi c'est important** : Dans les océans rouges, la concurrence intense érode les marges. Les océans bleus permettent de croître sans concurrence directe, en créant une nouvelle demande.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : La Blue Ocean Strategy, développée par W. Chan Kim et Renée Mauborgne (INSEAD), est une approche stratégique visant à rendre la concurrence non pertinente en créant un espace de marché inexploité (blue ocean) via l'innovation de valeur.

**Origine et historique** :
- **2004** : Article fondateur dans Harvard Business Review
- **2005** : Publication du livre *Blue Ocean Strategy*
- **2015** : Édition étendue avec nouveaux cas
- **2017** : *Blue Ocean Shift* (méthodologie d'implémentation)
- **2023** : *Beyond Disruption* (innovation non-disruptive)
- **Reconnaissance** : Kim & Mauborgne classés parmi les penseurs du management les plus influents (Thinkers50)

**Concepts clés** :

| Concept | Red Ocean | Blue Ocean |
|---------|-----------|------------|
| **Espace de marché** | Existant, défini | Nouveau, créé |
| **Concurrence** | Battre les concurrents | Rendre la concurrence non pertinente |
| **Demande** | Exploiter la demande existante | Créer une nouvelle demande |
| **Arbitrage valeur-coût** | Choisir entre différenciation OU coût | Poursuivre différenciation ET coût |
| **Stratégie** | Alignée sur la compétition | Alignée sur l'innovation de valeur |

**Le Framework ERRC (Eliminate-Reduce-Raise-Create)** :

```
┌─────────────────────────────────────────────────────────┐
│                    ERRC Grid                            │
├───────────────────────────┬─────────────────────────────┤
│        ELIMINATE          │          REDUCE             │
│   (Éliminer)              │       (Réduire)             │
│                           │                             │
│ Quels facteurs considérés │ Quels facteurs devraient    │
│ comme acquis dans         │ être réduits bien en        │
│ l'industrie devraient     │ dessous du standard de      │
│ être éliminés ?           │ l'industrie ?               │
│                           │                             │
├───────────────────────────┼─────────────────────────────┤
│         RAISE             │          CREATE             │
│       (Renforcer)         │         (Créer)             │
│                           │                             │
│ Quels facteurs devraient  │ Quels facteurs jamais       │
│ être élevés bien au-delà  │ proposés par l'industrie    │
│ du standard de            │ devraient être créés ?      │
│ l'industrie ?             │                             │
│                           │                             │
└───────────────────────────┴─────────────────────────────┘
```

**Strategy Canvas (Canevas stratégique)** :

Le Strategy Canvas visualise graphiquement la proposition de valeur :
- Axe X : Facteurs clés de compétition dans l'industrie
- Axe Y : Niveau d'offre (faible à élevé)
- Courbe de valeur : Profil stratégique de chaque acteur

```
Niveau d'offre
    ↑
Élevé│         ╭──╮
     │    ╭───╯  │      ← Blue Ocean (nous)
     │   ╱       ╰─╮
     │──╯          ╰──── ← Concurrent type
Faible│
     └────────────────────→ Facteurs de compétition
       Prix  Choix  Service  Innovation  Rapidité
```

**Les 6 Pistes pour créer un Blue Ocean** :

| Piste | Question | Exemple |
|-------|----------|---------|
| **1. Industries alternatives** | Quelles alternatives les clients utilisent-ils ? | NetJets (entre avion privé et 1ère classe) |
| **2. Groupes stratégiques** | Y a-t-il des segments inexploités entre groupes ? | Lexus (entre luxe et mass-market auto) |
| **3. Chaîne des acheteurs** | Qui d'autre influence la décision ? | Novo Nordisk (cibler patients, pas médecins) |
| **4. Offres complémentaires** | Que se passe-t-il avant/pendant/après l'usage ? | Nespresso (machine + capsules + club) |
| **5. Fonctionnel vs Émotionnel** | L'industrie se bat sur quoi ? Et si on changeait ? | Swatch (montre = accessoire mode) |
| **6. Tendances temporelles** | Quelles tendances émergentes sont irréversibles ? | iTunes (musique dématérialisée) |

**Exemples emblématiques** :

| Entreprise | Ocean Rouge évité | Blue Ocean créé |
|------------|-------------------|-----------------|
| **Cirque du Soleil** | Cirques traditionnels (animaux, stars) | Spectacle artistique pour adultes |
| **Nintendo Wii** | Course à la puissance (Sony, Microsoft) | Gaming familial, contrôle mouvement |
| **Yellow Tail** | Vins complexes, intimidants | Vin simple, accessible, fun |
| **Southwest Airlines** | Concurrence sur le service | Low-cost efficace, sans fioritures |

**Critiques et limites** :
- Difficile à identifier et exécuter en pratique
- Les Blue Oceans finissent par devenir rouges (imitateurs)
- Pas toujours applicable (certains marchés sont nécessairement compétitifs)
- Risque de marché qui n'existe pas réellement

#### Niveau 3 - Application Pratique

**Contexte optimal** :
- Marché mature avec concurrence intense
- Différenciation difficile sur les critères existants
- Recherche de croissance significative
- Innovation de modèle business

**Template ERRC - E-commerce** :

```markdown
## Blue Ocean Strategy - Analyse ERRC

**Projet** : [Nom du projet e-commerce]
**Marché actuel** : [Description de l'océan rouge]
**Date** : [Date]

---

### Contexte : L'Océan Rouge actuel

**Facteurs de compétition standards dans l'industrie :**
1. Prix
2. Largeur de gamme
3. Rapidité de livraison
4. Service client
5. Expérience mobile
6. Programme fidélité
7. [Autres facteurs]

**Problème** : Tous les acteurs se battent sur les mêmes critères, érodant les marges et créant une guerre des prix.

---

### Grille ERRC

#### ÉLIMINER
*Quels facteurs considérés comme essentiels peuvent être supprimés ?*

- [ ] [Facteur 1] — Raison : [Justification]
- [ ] [Facteur 2] — Raison : [Justification]

**Exemple e-commerce mode** : Éliminer les stocks physiques (modèle dropshipping ou made-to-order)

#### RÉDUIRE
*Quels facteurs peuvent être significativement réduits ?*

- [ ] [Facteur 1] — Niveau actuel → Niveau cible
- [ ] [Facteur 2] — Niveau actuel → Niveau cible

**Exemple** : Réduire la largeur de gamme pour se spécialiser (curated selection)

#### RENFORCER
*Quels facteurs doivent être élevés au-delà du standard ?*

- [ ] [Facteur 1] — Comment : [Détails]
- [ ] [Facteur 2] — Comment : [Détails]

**Exemple** : Renforcer la transparence (origine, fabrication, impact)

#### CRÉER
*Quels nouveaux facteurs jamais proposés devraient être créés ?*

- [ ] [Facteur nouveau 1] — Description : [Détails]
- [ ] [Facteur nouveau 2] — Description : [Détails]

**Exemple** : Créer un système de "garde-robe virtuelle" personnalisée par IA

---

### Strategy Canvas (avant/après)

**Facteurs de compétition** :
| Facteur | Industrie | Nous (Blue Ocean) |
|---------|-----------|-------------------|
| Prix | ●●●●○ | ●●●○○ |
| Gamme | ●●●●● | ●●○○○ |
| Livraison | ●●●●○ | ●●●○○ |
| Personnalisation | ●○○○○ | ●●●●● |
| Transparence | ●●○○○ | ●●●●● |
| [Nouveau facteur] | ○○○○○ | ●●●●○ |

---

### Proposition de valeur Blue Ocean

**En une phrase** :
"Nous offrons [QUOI] à [QUI] en [COMMENT], ce qui est différent parce que [POURQUOI UNIQUE]."

**Exemple** :
"Nous offrons une garde-robe capsule personnalisée aux professionnels minimalistes, livrée trimestriellement avec transparence totale sur l'origine et l'impact, éliminant le stress du choix quotidien."

---

### Risques et validation

**Hypothèses à valider** :
1. Les clients sont-ils prêts à payer pour [nouveau facteur] ?
2. Pouvons-nous exécuter [élément différenciant] ?
3. La concurrence peut-elle facilement copier ?

**Test de non-imitation** :
- [ ] Barrière technologique
- [ ] Barrière de ressources
- [ ] Barrière de marque/communauté
- [ ] Effet réseau
```

---

### 4.3 TAM / SAM / SOM (Dimensionnement de marché)

#### Niveau 1 - Vulgarisation

**Définition simple** : TAM, SAM et SOM sont trois façons de mesurer la taille d'un marché, du plus grand au plus réaliste :
- **TAM** : Le marché total si vous vendiez à tout le monde
- **SAM** : La part du marché que vous pouvez réellement adresser
- **SOM** : La part que vous pouvez capturer à court terme

**Analogie** : Vous ouvrez une pizzeria à Lyon.
- **TAM** : Toutes les personnes qui mangent des pizzas en France (énorme)
- **SAM** : Les personnes qui mangent des pizzas à Lyon et environs (votre zone de livraison)
- **SOM** : Les clients que vous pouvez réalistement servir la première année avec votre capacité

**Pourquoi c'est important** : Les investisseurs et décideurs veulent savoir si le marché est assez grand pour justifier l'investissement, et si vos projections sont réalistes.

#### Niveau 2 - Approfondissement Expert

**Définitions techniques** :

| Métrique | Définition | Question |
|----------|------------|----------|
| **TAM** (Total Addressable Market) | Revenu total si 100% du marché utilisait votre solution | "Quelle est la taille maximale théorique ?" |
| **SAM** (Serviceable Addressable Market) | Part du TAM que vous pouvez servir (géographie, segment, capacité) | "Quelle part pouvons-nous réellement adresser ?" |
| **SOM** (Serviceable Obtainable Market) | Part du SAM que vous pouvez capturer à court terme | "Quelle part pouvons-nous gagner dans 1-3 ans ?" |

**Relation hiérarchique** :
```
┌─────────────────────────────────────────┐
│                  TAM                     │
│    Total Addressable Market              │
│    (Marché total mondial/national)       │
│  ┌─────────────────────────────────┐    │
│  │            SAM                   │    │
│  │  Serviceable Addressable Market  │    │
│  │  (Notre segment cible)           │    │
│  │  ┌───────────────────────┐      │    │
│  │  │        SOM            │      │    │
│  │  │ Serviceable Obtainable│      │    │
│  │  │ (Part capturable)     │      │    │
│  │  └───────────────────────┘      │    │
│  └─────────────────────────────────┘    │
└─────────────────────────────────────────┘
```

**Méthodes de calcul** :

**1. Top-Down (Descendante)**
- Part de données macro (études de marché, rapports sectoriels)
- Applique des filtres successifs

```
TAM = Taille marché global (source externe)
SAM = TAM × % segment cible × % zone géographique
SOM = SAM × % part de marché réaliste
```

**Exemple e-commerce mode B2C France** :
```
TAM = Marché e-commerce mode France = 20 Md€
SAM = × 15% (segment femmes 25-40 ans, premium) = 3 Md€
SOM = × 0.5% (objectif Y1-Y3) = 15 M€
```

**Avantages** : Rapide, utilise des données existantes
**Limites** : Imprécis, hypothèses parfois hasardeuses

**2. Bottom-Up (Ascendante)** ⭐ Préférée par les investisseurs

- Part de données spécifiques et construit vers le haut
- Plus crédible car basée sur des hypothèses vérifiables

```
SOM = Nombre de clients potentiels × Revenu moyen par client × Taux de conversion estimé
SAM = SOM / Part de marché cible
TAM = Extension à l'ensemble du marché
```

**Exemple** :
```
- Clients potentiels identifiés : 500 000 (base email qualifiée + SEO)
- Taux de conversion estimé : 2%
- Panier moyen : 80€
- Fréquence annuelle : 4 achats

SOM Y1 = 500 000 × 2% × 80€ × 4 = 3,2 M€
```

**3. Value Theory (par la valeur)**
- Estime la valeur créée pour le client
- Multiplie par le nombre de clients potentiels

```
TAM = Nombre de clients potentiels × Valeur créée par client
```

**Sources de données** :

| Source | Type | Fiabilité | Coût |
|--------|------|-----------|------|
| **Statista** | Rapports sectoriels | Moyenne-Haute | €€€ |
| **INSEE** | Données France | Haute | Gratuit |
| **Euromonitor** | Études de marché | Haute | €€€€ |
| **Xerfi** | Analyses sectorielles FR | Haute | €€€ |
| **Google Trends** | Tendances recherche | Indicatif | Gratuit |
| **SimilarWeb** | Trafic concurrents | Moyenne | €€ |
| **Études cabinets** | McKinsey, Bain, BCG | Haute | €€€€ |

**Erreurs fréquentes** :

| Erreur | Problème | Solution |
|--------|----------|----------|
| **TAM irréaliste** | "Notre TAM est de 100 Md$" | Focus sur SAM/SOM crédibles |
| **Bottom-up oublié** | Que du top-down | Toujours valider par bottom-up |
| **Hypothèses non documentées** | Chiffres sortis de nulle part | Citer les sources, expliquer les hypothèses |
| **SOM = SAM** | Surestimation | SOM réaliste = 1-5% du SAM pour un nouvel entrant |
| **Marché statique** | Pas de projection de croissance | Inclure le CAGR (taux de croissance) |

**Ce que les investisseurs regardent** :
- La **cohérence** entre TAM, SAM, SOM
- Les **hypothèses** derrière les chiffres
- Le **réalisme** du SOM par rapport aux moyens
- La **croissance** du marché (CAGR)
- La **source** des données

#### Niveau 3 - Application Pratique

**Template TAM/SAM/SOM - E-commerce** :

```markdown
## Dimensionnement de Marché - TAM/SAM/SOM

**Projet** : [Nom]
**Marché** : [Description]
**Date** : [Date]

---

### 1. TAM - Total Addressable Market

**Définition du marché** : [Description précise]

**Calcul Top-Down** :
| Composante | Valeur | Source |
|------------|--------|--------|
| Marché [X] France | [X] Md€ | [Source, année] |
| Croissance annuelle (CAGR) | [X]% | [Source] |
| Projection à 5 ans | [X] Md€ | Calcul |

**TAM = [X] Md€** (France, [année])

---

### 2. SAM - Serviceable Addressable Market

**Filtres appliqués** :

| Filtre | Réduction | Justification |
|--------|-----------|---------------|
| Segment cible [X] | × [X]% | [Justification] |
| Zone géographique | × [X]% | [Justification] |
| Canal online uniquement | × [X]% | [Justification] |
| Positionnement prix | × [X]% | [Justification] |

**Calcul** :
SAM = TAM × [X]% × [X]% × [X]%
**SAM = [X] M€**

---

### 3. SOM - Serviceable Obtainable Market

**Approche Bottom-Up** :

| Hypothèse | Valeur | Base |
|-----------|--------|------|
| Clients potentiels accessibles (Y1) | [X] | [Comment atteints] |
| Taux de conversion | [X]% | [Benchmark ou test] |
| Panier moyen | [X]€ | [Source] |
| Fréquence d'achat/an | [X] | [Hypothèse] |

**Calcul** :
```
SOM Y1 = [Clients] × [Conversion] × [Panier] × [Fréquence]
SOM Y1 = [X] × [X]% × [X]€ × [X] = [X] €
```

**Projection** :

| Année | SOM | Part de SAM | Croissance |
|-------|-----|-------------|------------|
| Y1 | [X] K€ | [X]% | - |
| Y2 | [X] K€ | [X]% | +[X]% |
| Y3 | [X] M€ | [X]% | +[X]% |

---

### 4. Synthèse visuelle

```
TAM : [X] Md€  ████████████████████████████
SAM : [X] M€   ████████████
SOM Y3 : [X] M€ ████
```

---

### 5. Hypothèses clés et risques

**Hypothèses critiques** :
1. [Hypothèse 1] — Risque si faux : [Impact]
2. [Hypothèse 2] — Risque si faux : [Impact]

**Comment valider** :
- [Hypothèse 1] → [Méthode de validation]
- [Hypothèse 2] → [Méthode de validation]

---

### 6. Sources

- [Source 1] : [URL ou référence]
- [Source 2] : [URL ou référence]
- [Source 3] : [URL ou référence]
```

---

### 4.4 Porter's Five Forces

#### Niveau 1 - Vulgarisation

**Définition simple** : Les 5 Forces de Porter est un outil pour analyser l'attractivité d'un marché en examinant 5 facteurs qui déterminent l'intensité de la concurrence et le potentiel de profit.

**Analogie** : Avant d'entrer dans une arène, vous voulez savoir : combien de gladiateurs sont déjà là ? Des nouveaux peuvent-ils arriver facilement ? Les spectateurs ont-ils le pouvoir de vous faire perdre ? Vos fournisseurs d'armes peuvent-ils vous bloquer ? Y a-t-il d'autres divertissements qui pourraient vider l'arène ?

**Pourquoi c'est important** : Même un marché de grande taille peut être peu attractif si les 5 forces sont défavorables (marges comprimées, pouvoir aux clients, etc.).

#### Niveau 2 - Approfondissement Expert

**Définition technique** : Le modèle des 5 Forces de Porter (Michael Porter, Harvard, 1979) est un framework d'analyse stratégique évaluant l'intensité concurrentielle et l'attractivité structurelle d'une industrie via cinq forces qui déterminent la rentabilité potentielle.

**Origine** : Introduit dans l'article "How Competitive Forces Shape Strategy" (Harvard Business Review, 1979), puis développé dans *Competitive Strategy* (1980).

**Les 5 Forces** :

```
                    ┌─────────────────────┐
                    │   NOUVEAUX ENTRANTS │
                    │   (Menace d'entrée) │
                    └──────────┬──────────┘
                               │
                               ▼
┌──────────────┐    ┌─────────────────────┐    ┌──────────────┐
│ FOURNISSEURS │    │     RIVALITÉ        │    │   CLIENTS    │
│  (Pouvoir de │───►│   CONCURRENTIELLE   │◄───│ (Pouvoir de  │
│ négociation) │    │    (Intensité)      │    │ négociation) │
└──────────────┘    └─────────────────────┘    └──────────────┘
                               ▲
                               │
                    ┌──────────┴──────────┐
                    │     SUBSTITUTS      │
                    │ (Menace de produits │
                    │    de remplacement) │
                    └─────────────────────┘
```

**Analyse détaillée de chaque force** :

**1. Rivalité entre concurrents existants**

| Facteur | Augmente la rivalité | Diminue la rivalité |
|---------|---------------------|---------------------|
| Nombre de concurrents | Nombreux, de taille similaire | Peu, un leader clair |
| Croissance du marché | Faible (jeu à somme nulle) | Forte (place pour tous) |
| Différenciation | Faible (commodité) | Forte (produits uniques) |
| Coûts fixes | Élevés (pression volume) | Faibles |
| Barrières à la sortie | Élevées (acteurs désespérés) | Faibles |

**2. Menace de nouveaux entrants**

| Barrière à l'entrée | Impact |
|---------------------|--------|
| **Économies d'échelle** | Nouveaux entrants désavantagés sur les coûts |
| **Capital requis** | Investissement initial dissuasif |
| **Accès aux canaux** | Distribution verrouillée |
| **Différenciation/Marque** | Fidélité clients existants |
| **Réglementation** | Licences, certifications |
| **Technologie/Brevets** | Protection intellectuelle |
| **Effets de réseau** | Plus il y a d'utilisateurs, plus c'est utile |

**Dans le digital/e-commerce** : Les barrières classiques sont souvent faibles (peu de capital, pas de distribution physique), mais les effets de réseau et la data créent de nouvelles barrières.

**3. Pouvoir de négociation des fournisseurs**

| Facteur | Pouvoir fournisseur élevé |
|---------|---------------------------|
| Concentration | Peu de fournisseurs, beaucoup d'acheteurs |
| Différenciation | Produit unique, pas de substitut |
| Coûts de changement | Élevés pour changer de fournisseur |
| Intégration verticale | Menace de vente directe |
| Importance | Fournisseur crucial pour la qualité |

**4. Pouvoir de négociation des clients**

| Facteur | Pouvoir client élevé |
|---------|----------------------|
| Concentration | Peu de gros clients |
| Volume d'achat | Achats importants |
| Différenciation | Produits standardisés, interchangeables |
| Coûts de changement | Faibles pour le client |
| Information | Client bien informé (prix, alternatives) |
| Sensibilité au prix | Forte |

**5. Menace des produits de substitution**

| Facteur | Menace élevée |
|---------|---------------|
| Ratio performance/prix | Substitut offre meilleur ratio |
| Coûts de changement | Faibles pour passer au substitut |
| Propension à substituer | Clients ouverts aux alternatives |

**Application au e-commerce (exemple)** :

| Force | Niveau | Analyse |
|-------|--------|---------|
| **Rivalité** | 🔴 Élevée | Nombreux acteurs, guerre des prix, faible différenciation |
| **Nouveaux entrants** | 🔴 Élevée | Barrières faibles (Shopify, WooCommerce), mais effets réseau pour les leaders |
| **Pouvoir fournisseurs** | 🟡 Moyen | Dépend du sourcing (marques vs. MDD) |
| **Pouvoir clients** | 🔴 Élevé | Comparateurs, avis, facilité de changement |
| **Substituts** | 🟡 Moyen | Retail physique, marketplace, C2C |

**Tendances 2024-2025 pour le digital** :
- L'IA comme nouvelle barrière à l'entrée (ou réducteur de barrières)
- Les données comme avantage concurrentiel
- Les effets de réseau et écosystèmes (plateformes)
- La réglementation croissante (RGPD, DSA, DMA)

#### Niveau 3 - Application Pratique

**Template Porter's Five Forces - E-commerce** :

```markdown
## Analyse des 5 Forces de Porter

**Industrie** : [Description]
**Date** : [Date]

---

### 1. Rivalité entre concurrents existants

**Niveau** : ⚪ Faible | 🟡 Moyen | 🔴 Élevé

**Analyse** :
| Facteur | Évaluation | Commentaire |
|---------|------------|-------------|
| Nombre de concurrents | [X] acteurs majeurs | [Détail] |
| Croissance du marché | [X]% / an | [Impact] |
| Différenciation | Faible/Moyenne/Forte | [Détail] |
| Coûts de changement client | Faibles/Moyens/Élevés | [Détail] |
| Intensité promotionnelle | [Niveau] | [Détail] |

**Conclusion** : [Synthèse]

---

### 2. Menace de nouveaux entrants

**Niveau** : ⚪ Faible | 🟡 Moyen | 🔴 Élevé

**Barrières à l'entrée** :
| Barrière | Niveau | Commentaire |
|----------|--------|-------------|
| Capital requis | [€] | [Détail] |
| Économies d'échelle | Faibles/Fortes | [Détail] |
| Accès technologique | Facile/Difficile | [Détail] |
| Marques établies | [Niveau] | [Détail] |
| Réglementation | [Niveau] | [Détail] |
| Effets de réseau | Oui/Non | [Détail] |

**Entrants potentiels identifiés** :
- [Acteur 1] — Probabilité : [%]
- [Acteur 2] — Probabilité : [%]

**Conclusion** : [Synthèse]

---

### 3. Pouvoir de négociation des fournisseurs

**Niveau** : ⚪ Faible | 🟡 Moyen | 🔴 Élevé

**Analyse** :
| Facteur | Évaluation | Commentaire |
|---------|------------|-------------|
| Concentration fournisseurs | [Niveau] | [Détail] |
| Coût de changement | [€/effort] | [Détail] |
| Différenciation | [Niveau] | [Détail] |
| Menace intégration aval | Oui/Non | [Détail] |

**Fournisseurs critiques** :
- [Fournisseur 1] — Dépendance : [%]
- [Fournisseur 2] — Dépendance : [%]

**Conclusion** : [Synthèse]

---

### 4. Pouvoir de négociation des clients

**Niveau** : ⚪ Faible | 🟡 Moyen | 🔴 Élevé

**Analyse** :
| Facteur | Évaluation | Commentaire |
|---------|------------|-------------|
| Concentration clients | [Niveau] | [Détail] |
| Sensibilité au prix | [Niveau] | [Détail] |
| Coût de changement | [Niveau] | [Détail] |
| Niveau d'information | [Niveau] | Comparateurs, avis |
| Menace intégration amont | Oui/Non | [Détail] |

**Conclusion** : [Synthèse]

---

### 5. Menace des produits de substitution

**Niveau** : ⚪ Faible | 🟡 Moyen | 🔴 Élevé

**Substituts identifiés** :
| Substitut | Ratio perf/prix | Coût de changement | Menace |
|-----------|-----------------|--------------------| -------|
| [Substitut 1] | [Évaluation] | [Niveau] | 🟡 |
| [Substitut 2] | [Évaluation] | [Niveau] | ⚪ |

**Conclusion** : [Synthèse]

---

### Synthèse globale

**Diagramme radar** :
```
         Rivalité
            5
            │
     4      │      4
      \     │     /
       \    │    /
Fournisseurs───────Clients
        \   │   /
         \  │  /
      3   \ │ /   3
           \│/
     Entrants────Substituts
```

**Attractivité du marché** : ⚪ Faible | 🟡 Moyenne | 🔴 Élevée

**Implications stratégiques** :
1. [Implication 1]
2. [Implication 2]
3. [Implication 3]

**Recommandations** :
- [Recommandation 1]
- [Recommandation 2]
```

---

### 4.5 PESTEL Analysis

#### Niveau 1 - Vulgarisation

**Définition simple** : L'analyse PESTEL examine les facteurs macro-environnementaux qui peuvent impacter votre projet : Politique, Économique, Socioculturel, Technologique, Environnemental et Légal.

**Analogie** : Avant de planter un jardin, vous regardez la météo, le type de sol, les réglementations locales, si les voisins utilisent des pesticides... PESTEL fait pareil pour votre projet business.

**Pourquoi c'est important** : Ces facteurs externes sont hors de votre contrôle mais peuvent faire ou défaire votre projet. Les identifier permet d'anticiper et de s'adapter.

#### Niveau 2 - Approfondissement Expert

**Définition technique** : L'analyse PESTEL est un framework d'analyse macro-environnementale examinant six catégories de facteurs externes (Politique, Économique, Socioculturel, Technologique, Environnemental, Légal) susceptibles d'impacter une organisation ou un projet.

**Origine** : Évolution du modèle PEST (années 1960), étendu à PESTEL dans les années 1980-90 avec l'ajout des dimensions Environnementale et Légale.

**Les 6 dimensions** :

| Dimension | Facteurs analysés | Exemples e-commerce |
|-----------|-------------------|---------------------|
| **P**olitique | Stabilité, politiques commerciales, fiscalité | Brexit (impact import/export), aides à la digitalisation |
| **E**conomique | Croissance, inflation, chômage, pouvoir d'achat | Inflation → arbitrages consommateurs, taux de change |
| **S**ocioculturel | Démographie, tendances, valeurs, modes de vie | Vieillissement population, consommation responsable |
| **T**echnologique | Innovations, R&D, automatisation, digital | IA, réalité augmentée, paiements mobiles |
| **E**nvironnemental | Climat, durabilité, réglementations vertes | Empreinte carbone livraison, packaging |
| **L**égal | Lois, réglementations, normes | RGPD, DSA, droit de rétractation |

**Questions par dimension** :

**Politique**
- Quelle est la stabilité politique du/des marchés cibles ?
- Y a-t-il des politiques favorables ou défavorables au secteur ?
- Quels sont les risques géopolitiques (guerres commerciales, sanctions) ?
- Quelles sont les politiques fiscales applicables (TVA, taxes numériques) ?

**Économique**
- Quelle est la croissance économique prévue ?
- Quel est l'impact de l'inflation sur le pouvoir d'achat cible ?
- Comment évolue le taux de chômage ?
- Quelles sont les tendances de consommation (épargne vs. dépense) ?
- Quels sont les taux de change pertinents (sourcing international) ?

**Socioculturel**
- Comment évolue la démographie cible ?
- Quelles sont les tendances de consommation émergentes ?
- Comment évoluent les valeurs (durabilité, local, digital) ?
- Quels sont les changements de modes de vie (télétravail, mobilité) ?
- Quelle est l'adoption du e-commerce par segment ?

**Technologique**
- Quelles technologies émergentes peuvent impacter le secteur ?
- Comment évolue l'infrastructure (5G, fibre) ?
- Quelles sont les tendances en matière de cybersécurité ?
- Quelle est la maturité technologique du marché cible ?
- Quels sont les investissements R&D du secteur ?

**Environnemental**
- Quelles sont les attentes en matière de durabilité ?
- Comment la réglementation environnementale évolue-t-elle ?
- Quel est l'impact du changement climatique sur le business ?
- Quelles sont les tendances en matière d'économie circulaire ?
- Comment optimiser l'empreinte carbone (logistique, packaging) ?

**Légal**
- Quelles réglementations s'appliquent (RGPD, DSA, accessibilité) ?
- Comment évolue le droit de la consommation ?
- Quelles sont les obligations fiscales (TVA e-commerce) ?
- Y a-t-il des réglementations sectorielles spécifiques ?
- Quels sont les risques juridiques (litiges, class actions) ?

**Limites** :
- Peut devenir une liste à la Prévert sans priorisation
- Facteurs interconnectés difficiles à isoler
- Nécessite une mise à jour régulière
- Subjectivité dans l'évaluation de l'impact

#### Niveau 3 - Application Pratique

**Template PESTEL - E-commerce** :

```markdown
## Analyse PESTEL

**Projet** : [Nom]
**Marché** : [Pays/Région]
**Date** : [Date]
**Horizon** : [Court/Moyen/Long terme]

---

### Politique

| Facteur | Tendance | Impact | Opportunité/Menace |
|---------|----------|--------|-------------------|
| [Facteur 1] | ↗️↘️➡️ | Fort/Moyen/Faible | O / M |
| [Facteur 2] | ↗️↘️➡️ | Fort/Moyen/Faible | O / M |

**Analyse** : [Synthèse 2-3 lignes]

**Implications pour le projet** :
- [Implication 1]
- [Implication 2]

---

### Économique

| Facteur | Tendance | Impact | Opportunité/Menace |
|---------|----------|--------|-------------------|
| Croissance PIB | [X]% prévu | [Impact] | O / M |
| Inflation | [X]% | [Impact] | O / M |
| Pouvoir d'achat | ↗️↘️➡️ | [Impact] | O / M |
| Taux de change | [Tendance] | [Impact] | O / M |

**Analyse** : [Synthèse]

**Implications pour le projet** :
- [Implication 1]
- [Implication 2]

---

### Socioculturel

| Facteur | Tendance | Impact | Opportunité/Menace |
|---------|----------|--------|-------------------|
| Démographie cible | [Tendance] | [Impact] | O / M |
| Adoption e-commerce | [X]% pénétration | [Impact] | O / M |
| Valeurs durabilité | ↗️ Croissante | [Impact] | O / M |
| Modes de vie | [Tendance] | [Impact] | O / M |

**Analyse** : [Synthèse]

**Implications pour le projet** :
- [Implication 1]
- [Implication 2]

---

### Technologique

| Facteur | Tendance | Impact | Opportunité/Menace |
|---------|----------|--------|-------------------|
| IA / Machine Learning | ↗️ Adoption | [Impact] | O / M |
| Paiements mobiles | ↗️ [X]% | [Impact] | O / M |
| Réalité augmentée | Émergent | [Impact] | O / M |
| Cybersécurité | ↗️ Risques | [Impact] | O / M |

**Analyse** : [Synthèse]

**Implications pour le projet** :
- [Implication 1]
- [Implication 2]

---

### Environnemental

| Facteur | Tendance | Impact | Opportunité/Menace |
|---------|----------|--------|-------------------|
| Empreinte carbone logistique | ↗️ Scrutée | [Impact] | O / M |
| Packaging durable | ↗️ Exigence | [Impact] | O / M |
| Réglementation verte | ↗️ Renforcement | [Impact] | O / M |
| Seconde main | ↗️ Croissance | [Impact] | O / M |

**Analyse** : [Synthèse]

**Implications pour le projet** :
- [Implication 1]
- [Implication 2]

---

### Légal

| Facteur | Tendance | Impact | Opportunité/Menace |
|---------|----------|--------|-------------------|
| RGPD / Data privacy | ➡️ Stable | [Impact] | O / M |
| DSA / DMA | ↗️ Nouveau | [Impact] | O / M |
| TVA e-commerce | ➡️ OSS en place | [Impact] | O / M |
| Droit rétractation | ➡️ 14 jours | [Impact] | O / M |
| Accessibilité | ↗️ Obligations | [Impact] | O / M |

**Analyse** : [Synthèse]

**Implications pour le projet** :
- [Implication 1]
- [Implication 2]

---

### Synthèse PESTEL

**Top 5 des facteurs les plus impactants** :

| Rang | Facteur | Dimension | Impact | Action recommandée |
|------|---------|-----------|--------|-------------------|
| 1 | [Facteur] | [P/E/S/T/E/L] | 🔴 Fort | [Action] |
| 2 | [Facteur] | [P/E/S/T/E/L] | 🔴 Fort | [Action] |
| 3 | [Facteur] | [P/E/S/T/E/L] | 🟡 Moyen | [Action] |
| 4 | [Facteur] | [P/E/S/T/E/L] | 🟡 Moyen | [Action] |
| 5 | [Facteur] | [P/E/S/T/E/L] | 🟡 Moyen | [Action] |

**Opportunités macro à saisir** :
1. [Opportunité 1]
2. [Opportunité 2]

**Menaces macro à surveiller** :
1. [Menace 1]
2. [Menace 2]

**Recommandation globale** :
[Synthèse : environnement favorable/défavorable, points de vigilance]
```

---

### 4.6 Trend Analysis et Signaux Faibles

#### Niveau 1 - Vulgarisation

**Définition simple** : L'analyse des tendances consiste à identifier les évolutions du marché et les "signaux faibles" — ces petits indices qui annoncent peut-être les grandes transformations de demain.

**Pourquoi c'est important** : Les entreprises qui détectent les tendances tôt peuvent s'y adapter avant les autres. Celles qui les ratent risquent de devenir obsolètes.

#### Niveau 2 - Approfondissement Expert

**Types de tendances** :

| Type | Horizon | Exemple |
|------|---------|---------|
| **Mégatendance** | 10-20 ans | Vieillissement population, urbanisation |
| **Tendance** | 3-10 ans | E-commerce, économie circulaire |
| **Tendance émergente** | 1-3 ans | Social commerce, BNPL |
| **Signal faible** | < 1 an | Niche, early adopters |
| **Mode** | Mois | Viral, éphémère |

**Sources de veille tendances** :

| Source | Type | Focus |
|--------|------|-------|
| **Trendwatching** | Newsletter/Rapports | Innovation consommateur |
| **CB Insights** | Rapports | Tech, startups |
| **Google Trends** | Outil | Recherches, intérêt |
| **Product Hunt** | Plateforme | Nouveaux produits tech |
| **Reddit, Twitter/X** | Réseaux sociaux | Conversations émergentes |
| **Rapports cabinets** | Études | McKinsey, Gartner, Forrester |

**Tendances e-commerce 2024-2025** :

| Tendance | Maturité | Impact potentiel |
|----------|----------|------------------|
| **Social Commerce** | Croissance | Élevé (Gen Z, TikTok Shop) |
| **BNPL (Buy Now Pay Later)** | Mature | Moyen (réglementation) |
| **Recommerce / Seconde main** | Croissance | Élevé |
| **IA conversationnelle** | Émergent | Élevé (chatbots, search) |
| **Quick Commerce** | Croissance | Moyen (rentabilité ?) |
| **Durabilité / Traçabilité** | Croissance | Élevé |
| **Personnalisation IA** | Croissance | Élevé |

---

---

## Section 5 : Vision Produit et Proposition de Valeur

> *"Une vision sans exécution n'est qu'une hallucination."* — Thomas Edison

Cette section couvre les outils et frameworks pour articuler une vision produit claire, définir une proposition de valeur différenciante, et établir les métriques qui guideront les décisions.

---

### 5.1 Product Vision Board (Roman Pichler)

#### Niveau 1 - Vulgarisation

**Définition simple** : Le Product Vision Board est un outil visuel d'une page qui capture l'essence de votre produit : pourquoi il existe, pour qui, quel problème il résout, et comment il se distingue.

**Analogie** : C'est comme la "carte d'identité" de votre produit — toutes les informations essentielles sur une seule page pour que toute l'équipe parle de la même vision.

**Pourquoi c'est utile** : Plutôt que d'avoir une vision floue dans la tête de chacun, le Vision Board crée un alignement concret. Tout le monde peut vérifier si une fonctionnalité proposée sert vraiment la vision.

#### Niveau 2 - Approfondissement Expert

**Origine et concepteur** :
Le Product Vision Board a été créé par **Roman Pichler** en 2011. Pichler est un expert reconnu en Product Management et auteur de plusieurs ouvrages de référence. Le template a été mis à jour régulièrement, avec une version 2023-2024 incluant une checklist de validation.

> Source : [romanpichler.com - The Product Vision Board](https://www.romanpichler.com/blog/the-product-vision-board/)

**Structure du Vision Board** :

Le canvas comprend 5 sections interconnectées :

```
┌─────────────────────────────────────────────────────────────────┐
│                          VISION                                  │
│  (Le but ultime, le changement positif que le produit crée)     │
├─────────────────────────────────────────────────────────────────┤
│    TARGET GROUP    │     NEEDS        │      PRODUCT            │
│  (Utilisateurs et  │  (Problème ou    │  (Caractéristiques     │
│   clients cibles)  │   bénéfice       │   distinctives)         │
│                    │   principal)     │                         │
├─────────────────────────────────────────────────────────────────┤
│                      BUSINESS GOALS                              │
│        (Bénéfices attendus pour l'entreprise)                   │
└─────────────────────────────────────────────────────────────────┘
```

**Critères de qualité d'une Vision (Checklist Pichler 2024)** :

| Critère | Description | Question de validation |
|---------|-------------|------------------------|
| **Inspiring** | Décrit le changement positif créé | Motive-t-elle l'équipe ? |
| **Shared** | Crée l'alignement et facilite la collaboration | Tout le monde la comprend-il ? |
| **Ethical** | Le produit ne cause pas de tort | Est-elle responsable ? |
| **Concise** | Facile à comprendre et mémoriser | Peut-on la résumer en 1 phrase ? |
| **Ambitious** | Grand objectif audacieux | Inspire-t-elle à long terme ? |
| **Enduring** | Guide pour 5-10 ans, sans présumer la solution | Reste-t-elle valide dans le temps ? |

**Relation avec d'autres frameworks** :

```
Product Vision Board
        │
        ├──→ Product Strategy (comment atteindre la vision)
        │           │
        │           └──→ Product Roadmap (quand livrer)
        │                       │
        │                       └──→ Product Backlog (quoi construire)
        │
        └──→ North Star Metric (comment mesurer le progrès)
```

#### Niveau 3 - Application Pratique E-commerce

**Template Product Vision Board - Plateforme E-commerce B2C** :

```markdown
## PRODUCT VISION BOARD - [Nom du Produit]

### VISION
"Devenir la destination shopping préférée des consommateurs
conscients qui veulent acheter local sans compromis sur
la commodité."

### TARGET GROUP (Segments cibles)

**Utilisateurs primaires** :
- Consommateurs urbains 25-45 ans
- Sensibles à l'origine et la qualité des produits
- Actifs, peu de temps pour les courses traditionnelles

**Clients secondaires** :
- Producteurs et artisans locaux cherchant une vitrine digitale
- Commerces de proximité voulant digitaliser leur offre

### NEEDS (Besoins/Problèmes)

**Jobs-to-be-Done principaux** :
1. Trouver des produits locaux de qualité sans parcourir la ville
2. Avoir confiance dans l'origine et la traçabilité
3. Recevoir rapidement sans culpabiliser (empreinte carbone)

**Pains majeurs** :
- Difficile de savoir ce qui est vraiment local
- Les marchés ont des horaires incompatibles avec le travail
- Les alternatives bio/locales sont souvent plus chères

### PRODUCT (Caractéristiques distinctives)

**Éléments différenciants** :
- Score de "localité" transparent pour chaque produit
- Livraison mutualisée éco-responsable
- Relation directe producteur-consommateur (chat, avis, histoires)
- Abonnement "panier surprise" personnalisé

**Ce que nous NE faisons PAS** :
- Vendre des produits sans traçabilité vérifiée
- Livraison individuelle express (anti-écologique)
- Marques internationales

### BUSINESS GOALS (Objectifs business)

| Objectif | Métrique | Horizon |
|----------|----------|---------|
| Rentabilité | Marge brute > 25% | 18 mois |
| Scale | 50 000 clients actifs | 24 mois |
| Rétention | Retention M3 > 40% | 12 mois |
| Impact | 200 producteurs partenaires | 18 mois |

---
Version: 1.0 | Date: [Date] | Owner: [Product Manager]
```

**Template Product Vision Board - Plateforme B2B** :

```markdown
## PRODUCT VISION BOARD - [Solution B2B]

### VISION
"Éliminer la friction dans les approvisionnements B2B pour
que les acheteurs professionnels consacrent leur temps
à créer de la valeur, pas à passer des commandes."

### TARGET GROUP

**Acheteurs cibles** :
- PME industrielles (50-500 employés)
- Responsables achats / Office managers
- Industries : manufacturing, BTP, santé

**Profil décisionnel** :
- Décideur : Directeur des achats / DAF
- Utilisateur : Acheteur opérationnel
- Influenceur : Équipes terrain

### NEEDS

**Problèmes business** :
1. Temps perdu en commandes manuelles répétitives (8h/semaine)
2. Erreurs de commande coûteuses (retours, ruptures)
3. Manque de visibilité sur les dépenses consolidées
4. Négociations fournisseurs chronophages

**Gains recherchés** :
- Automatisation des réapprovisionnements
- Dashboard dépenses en temps réel
- Benchmark prix automatique

### PRODUCT

**Fonctionnalités clés** :
- Commandes récurrentes automatisées (prédiction IA)
- Catalogue unifié multi-fournisseurs
- Workflow validation avec limites de dépenses
- Analytics et reporting achats

**Avantage compétitif** :
- Intégration ERP native (SAP, Sage, Oracle)
- IA prédictive sur les réapprovisionnements
- Réseau fournisseurs pré-négociés

### BUSINESS GOALS

| Métrique | Cible Y1 | Cible Y2 |
|----------|----------|----------|
| ARR | 500K€ | 2M€ |
| Clients payants | 50 | 200 |
| NPS | > 40 | > 50 |
| Churn mensuel | < 3% | < 2% |
```

---

### 5.2 North Star Metric (NSM)

#### Niveau 1 - Vulgarisation

**Définition simple** : La North Star Metric est LA métrique unique qui capture le mieux la valeur que votre produit apporte à vos clients. C'est votre "étoile du nord" — le point de repère vers lequel toutes les équipes naviguent.

**Pourquoi une seule métrique ?** : Quand chaque équipe optimise sa propre métrique (Marketing : trafic, Produit : engagement, Sales : revenus), on peut gagner partout mais perdre globalement. La NSM aligne tout le monde sur ce qui compte vraiment.

**Exemples célèbres** :
- **Airbnb** : Nuits réservées
- **Spotify** : Minutes d'écoute
- **Slack** : Messages envoyés dans les workspaces

#### Niveau 2 - Approfondissement Expert

**Critères d'une bonne North Star Metric** :

Une NSM efficace doit répondre à ces trois critères simultanément :

| Critère | Description | Test |
|---------|-------------|------|
| **Reflète la valeur client** | Capture le moment "aha!" pour l'utilisateur | Plus de NSM = clients plus satisfaits ? |
| **Corrèle avec le revenu** | Plus de NSM = plus de business | La croissance de la NSM prédit-elle le CA ? |
| **Mesure le progrès** | Indicateur avancé (leading) | Peut-on l'influencer par nos actions ? |

> Source : [Amplitude - Product North Star Metric](https://amplitude.com/blog/product-north-star-metric)

**Exemples par industrie** :

| Secteur | Entreprise | North Star Metric |
|---------|------------|-------------------|
| **E-commerce B2C** | Amazon | Achats mensuels par utilisateur |
| **E-commerce B2C** | Shopify (merchants) | Gross Merchandise Volume (GMV) |
| **Marketplace** | Uber | Nombre de trajets |
| **SaaS** | Slack | Messages dans les workspaces actifs |
| **SaaS** | Zoom | Réunions hebdomadaires hébergées |
| **SaaS** | HubSpot | Équipes actives hebdomadaires |
| **Subscription** | Netflix | Heures de visionnage mensuelles |
| **FinTech** | PayPal | Transactions actives |

> Sources : [Growth Academy - NSM Examples](https://www.growth-academy.com/north-star-metric-examples), [Finmark - 80+ NSM Examples](https://finmark.com/north-star-metric/)

**North Star vs autres métriques** :

```
                    North Star Metric
                    (ex: Commandes/mois)
                           │
          ┌────────────────┼────────────────┐
          │                │                │
    Input Metrics     Input Metrics    Input Metrics
    (Acquisition)     (Activation)     (Retention)
          │                │                │
    - Visiteurs       - Inscription    - Réachat M2
    - CAC             - 1ère commande  - NPS
    - Conv. rate      - Panier moyen   - Churn
```

**Piège à éviter : Vanity Metrics vs NSM** :

| Type | Exemples | Problème |
|------|----------|----------|
| **Vanity Metric** | Pages vues, téléchargements, inscrits totaux | Ne reflète pas la valeur créée |
| **Revenue Metric** | MRR, GMV seuls | Focus entreprise, pas client |
| **North Star** | Clients actifs qui commandent | Équilibre valeur client + business |

#### Niveau 3 - Application Pratique E-commerce

**Framework de définition de NSM pour e-commerce** :

```markdown
## NORTH STAR METRIC CANVAS

### Étape 1 : Identifier le moment de valeur
Question : Quel est le moment où le client obtient vraiment
de la valeur de notre produit ?

- [ ] Première visite ?
- [ ] Inscription ?
- [x] Première commande livrée et satisfaisante ?
- [ ] Réachat ?
- [ ] Recommandation à un ami ?

### Étape 2 : Choisir le niveau de mesure

| Option | Métrique | Avantage | Inconvénient |
|--------|----------|----------|--------------|
| Volume | Commandes totales | Simple | Ignore qualité |
| Fréquence | Commandes/client/mois | Capture rétention | Plus complexe |
| Valeur | GMV par client actif | Lié au CA | Peut masquer la santé |
| Composite | Clients avec >2 commandes/trimestre | Équilibré | Plus dur à communiquer |

### Étape 3 : Définir la NSM finale

**Notre North Star Metric** :
"Nombre de clients ayant effectué au moins 2 commandes
dans les 90 derniers jours"

**Justification** :
- Capture la rétention (2 commandes = client convaincu)
- Prédit le LTV
- Actionnable par toutes les équipes
- Exclut les one-shot et churned

### Étape 4 : Métriques d'input

| Équipe | Input Metric | Lien avec NSM |
|--------|--------------|---------------|
| Acquisition | Nouveaux clients qualifiés | Alimente le pool |
| Produit | Taux activation (1ère commande) | Convertit les nouveaux |
| CX | NPS post-livraison | Prédit le réachat |
| Rétention | Taux réachat M2 | Impact direct sur NSM |
| Catalogue | Taux de disponibilité | Enable le réachat |
```

**Dashboard NSM type e-commerce** :

```
┌─────────────────────────────────────────────────────────────────┐
│  NORTH STAR: Clients actifs (≥2 commandes/90j)                  │
│  ══════════════════════════════════════════════                 │
│  Actuel: 12,450 │ Objectif Q4: 15,000 │ Tendance: ↑ +8%         │
├─────────────────────────────────────────────────────────────────┤
│  INPUT METRICS                                                  │
│  ┌──────────────┬──────────────┬──────────────┬──────────────┐ │
│  │ Nouveaux     │ Activation   │ Réachat M2   │ NPS          │ │
│  │ clients      │ Rate         │              │              │ │
│  │ 2,100/sem    │ 45%          │ 32%          │ 42           │ │
│  │ ↑ 12%        │ ↓ -2pts      │ ↑ +3pts      │ → stable     │ │
│  └──────────────┴──────────────┴──────────────┴──────────────┘ │
└─────────────────────────────────────────────────────────────────┘
```

---

### 5.3 Value Proposition Canvas

#### Niveau 1 - Vulgarisation

**Définition simple** : Le Value Proposition Canvas est un outil visuel qui vous aide à comprendre ce que veulent vraiment vos clients (leurs "jobs", frustrations et attentes) et comment votre produit répond précisément à ces besoins.

**Analogie** : Imaginez que vous êtes médecin. Avant de prescrire un traitement (votre produit), vous devez d'abord comprendre les symptômes et le diagnostic (le profil client). Le Canvas vous oblige à faire ce diagnostic avant de proposer des solutions.

**L'erreur classique qu'il corrige** : Beaucoup d'entrepreneurs créent un produit qu'ils trouvent génial, puis cherchent des clients. Le Canvas inverse la logique : d'abord comprendre profondément les clients, ensuite concevoir une solution adaptée.

#### Niveau 2 - Approfondissement Expert

**Origine et auteurs** :
Le Value Proposition Canvas a été créé par **Alexander Osterwalder** et **Yves Pigneur** (co-créateurs du Business Model Canvas), avec les contributions d'**Alan Smith** et **Gregory Bernarda**. Il est présenté dans le livre "Value Proposition Design" (2014) publié par Strategyzer.

> Source : [Strategyzer - Value Proposition Design](https://www.strategyzer.com/library/value-proposition-design-book-summary)

**Structure du Canvas** :

Le Canvas se compose de deux parties qui doivent "s'emboîter" (fit) :

```
┌──────────────────────────────────────────────────────────────────────┐
│                    VALUE PROPOSITION CANVAS                          │
├──────────────────────────────────┬───────────────────────────────────┤
│      VALUE MAP (Carré)           │     CUSTOMER PROFILE (Cercle)     │
│      Ce que vous offrez          │     Ce que veut le client         │
├──────────────────────────────────┼───────────────────────────────────┤
│                                  │                                   │
│   ┌─────────────────┐            │            ┌─────────┐            │
│   │   Products &    │            │            │ Customer│            │
│   │   Services      │◄───────────┼────────────│  Jobs   │            │
│   └─────────────────┘            │            └─────────┘            │
│                                  │                                   │
│   ┌─────────────────┐            │            ┌─────────┐            │
│   │    Pain         │            │            │         │            │
│   │   Relievers     │◄───────────┼────────────│  Pains  │            │
│   └─────────────────┘            │            └─────────┘            │
│                                  │                                   │
│   ┌─────────────────┐            │            ┌─────────┐            │
│   │     Gain        │            │            │         │            │
│   │   Creators      │◄───────────┼────────────│  Gains  │            │
│   └─────────────────┘            │            └─────────┘            │
│                                  │                                   │
└──────────────────────────────────┴───────────────────────────────────┘
```

**Définitions des composants** :

**Customer Profile (côté droit)** :

| Élément | Définition | Questions clés |
|---------|------------|----------------|
| **Customer Jobs** | Tâches que le client essaie d'accomplir (fonctionnelles, sociales, émotionnelles) | Que cherche-t-il à faire ? À accomplir ? À résoudre ? |
| **Pains** | Frustrations, obstacles, risques avant/pendant/après le job | Qu'est-ce qui l'énerve ? Lui fait perdre du temps ? Le stresse ? |
| **Gains** | Bénéfices désirés, attentes, ce qui le ravirait | Qu'est-ce qui lui faciliterait la vie ? Le rendrait fier ? |

**Value Map (côté gauche)** :

| Élément | Définition | Questions clés |
|---------|------------|----------------|
| **Products & Services** | Liste de ce que vous offrez | Qu'est-ce que le client "achète" ? |
| **Pain Relievers** | Comment vous éliminez/réduisez les pains | Comment résolvez-vous ses frustrations ? |
| **Gain Creators** | Comment vous créez/augmentez les gains | Comment dépassez-vous ses attentes ? |

**Les niveaux de "Fit"** :

| Niveau | Nom | Description | Validation |
|--------|-----|-------------|------------|
| 1 | **Problem-Solution Fit** | On a identifié des jobs/pains/gains réels | Interviews, observations |
| 2 | **Product-Market Fit** | Les clients achètent et utilisent | Ventes, rétention |
| 3 | **Business Model Fit** | On peut scaler de façon rentable | Unit economics positifs |

**Règle du 50-70%** :
Un bon "fit" adresse typiquement **50-70% des pains et gains les plus importants** du client. Vouloir tout adresser dilue la proposition de valeur.

#### Niveau 3 - Application Pratique E-commerce

**Template Value Proposition Canvas - E-commerce B2C** :

```markdown
## VALUE PROPOSITION CANVAS
**Segment** : Jeunes parents urbains (28-40 ans)
**Produit** : Marketplace produits bébé/enfant

═══════════════════════════════════════════════════════════════

### CUSTOMER PROFILE

#### Customer Jobs (ce qu'ils essaient de faire)

**Jobs fonctionnels** :
1. Trouver des produits adaptés à l'âge de l'enfant
2. Équiper l'enfant au fur et à mesure de sa croissance
3. Comparer les options (prix, qualité, sécurité)
4. Recevoir rapidement (bébé grandit vite !)

**Jobs sociaux** :
5. Montrer qu'on est un "bon parent" (produits de qualité)
6. Partager les bons plans avec d'autres parents

**Jobs émotionnels** :
7. Se rassurer sur la sécurité des produits
8. Ne pas se sentir submergé par les choix

#### Pains (frustrations)

| Pain | Intensité | Fréquence |
|------|-----------|-----------|
| Produits non adaptés à l'âge commandé par erreur | 🔴 Forte | Moyenne |
| Difficulté à savoir si la taille convient | 🔴 Forte | Haute |
| Produits utilisés quelques mois puis jetés | 🟡 Moyenne | Haute |
| Normes de sécurité pas claires | 🔴 Forte | Moyenne |
| Livraison lente quand c'est urgent | 🟡 Moyenne | Basse |
| Prix élevés pour usage court | 🟡 Moyenne | Haute |

#### Gains (attentes et désirs)

| Gain | Type | Priorité |
|------|------|----------|
| Guide taille/âge fiable | Attendu | Haute |
| Livraison rapide | Attendu | Moyenne |
| Avis d'autres parents | Attendu | Haute |
| Recommandations personnalisées par âge | Désiré | Haute |
| Option seconde main vérifiée | Désiré | Moyenne |
| Alertes "votre enfant va avoir besoin de..." | Inattendu | Haute |

═══════════════════════════════════════════════════════════════

### VALUE MAP

#### Products & Services

**Produits physiques** :
- Marketplace produits bébé/enfant neufs
- Section "Seconde main certifiée"
- Box mensuelles adaptées à l'âge

**Services digitaux** :
- Profil enfant avec âge et mensurations
- Recommandations IA personnalisées
- Guide des normes de sécurité simplifié

**Services support** :
- Chat avec puéricultrices
- Politique retour 60 jours "bébé grandit vite"

#### Pain Relievers

| Pain adressé | Solution |
|--------------|----------|
| Erreur de taille | Guide taille interactif + photos enfants réels |
| Sécurité floue | Badge "Conformité vérifiée" + explication |
| Produits vite obsolètes | Reprise/revente intégrée |
| Trop de choix | Filtres âge + recommandations |
| Livraison lente | Express 24h pour abonnés |

#### Gain Creators

| Gain adressé | Solution |
|--------------|----------|
| Anticiper les besoins | Alertes "Dans 2 mois, prévoir..." |
| Avis parents | Communauté intégrée + photos |
| Bon plans | Alertes prix + comparateur |
| Sentiment bon parent | Contenu éducatif intégré |

═══════════════════════════════════════════════════════════════

### FIT ASSESSMENT

**Score de fit** : 7/10

**Pains adressés** : 5/6 (83%) ✅
**Gains adressés** : 5/6 (83%) ✅

**Gap identifié** :
- Pain "Prix élevés" partiellement adressé (seconde main)
- Gain "Partage bons plans" non exploité (viral loop potentiel)
```

---

### 5.4 Unique Value Proposition (UVP)

#### Niveau 1 - Vulgarisation

**Définition simple** : L'Unique Value Proposition (ou Proposition de Valeur Unique) est LA phrase qui explique clairement :
1. Ce que vous offrez
2. À qui
3. Pourquoi c'est mieux/différent des alternatives

**Pourquoi c'est crucial** : Un visiteur décide en 5-10 secondes s'il reste sur votre site. Votre UVP doit immédiatement lui dire "tu es au bon endroit, on résout TON problème".

**Exemples célèbres** :
- **Slack** : "Where work happens" (là où le travail se fait)
- **Stripe** : "Payments infrastructure for the internet" (infra paiement pour internet)
- **Shopify** : "Build your business" (construisez votre business)

#### Niveau 2 - Approfondissement Expert

**UVP vs autres concepts proches** :

| Concept | Focus | Exemple |
|---------|-------|---------|
| **UVP** | Bénéfice unique pour le client | "Livraison gratuite en 24h" |
| **Tagline/Slogan** | Mémorisation, émotion | "Just do it" |
| **Elevator Pitch** | Explication complète (30-60s) | Histoire + problème + solution |
| **Positioning Statement** | Usage interne, stratégique | Format strict (for/who/that...) |

**Framework de construction d'UVP** :

```
[Pour CLIENT CIBLE] qui [SITUATION/PROBLÈME],
[NOTRE PRODUIT] est [CATÉGORIE]
qui [BÉNÉFICE CLÉ].
Contrairement à [ALTERNATIVE],
nous [DIFFÉRENCIATION].
```

**Critères de qualité (checklist)** :

| Critère | Description | ✓/✗ |
|---------|-------------|-----|
| **Spécifique** | Évite le jargon vague ("solution innovante") | |
| **Orientée bénéfice** | Focus sur le "quoi pour moi" du client | |
| **Différenciante** | Distinct des concurrents | |
| **Crédible** | Promise tenable et prouvable | |
| **Concise** | < 20 mots idéalement | |
| **Testable** | Peut être A/B testé | |

**Sources de différenciation** :

| Type | Exemples | Risque |
|------|----------|--------|
| **Prix** | Moins cher, meilleur rapport qualité/prix | Course au moins-disant |
| **Qualité** | Premium, artisanal, durable | Niche limitée |
| **Commodité** | Plus rapide, plus simple, plus accessible | Copiable |
| **Expérience** | Service client, design, communauté | Dur à maintenir |
| **Innovation** | Technologie unique, nouveau business model | Éphémère si copié |
| **Spécialisation** | Focus niche, expertise verticale | Taille de marché |

#### Niveau 3 - Application Pratique E-commerce

**Processus de création d'UVP** :

```markdown
## WORKSHOP UVP - 90 minutes

### Phase 1 : Inputs (30 min)

**1. Liste des jobs clients** (du Value Proposition Canvas) :
- Job 1 : _______
- Job 2 : _______
- Job 3 : _______

**2. Top 3 pains** :
- Pain 1 : _______
- Pain 2 : _______
- Pain 3 : _______

**3. Alternatives actuelles** (comment le client résout le problème aujourd'hui) :
- Alternative A : _______
- Alternative B : _______

**4. Notre avantage réel** (ce qu'on fait mieux) :
- Avantage 1 : _______
- Avantage 2 : _______

### Phase 2 : Génération (30 min)

**Variante A - Focus Problème** :
"Fini [PAIN]. [PRODUIT] vous permet de [BÉNÉFICE]."

**Variante B - Focus Différenciation** :
"Le seul [CATÉGORIE] qui [DIFFÉRENCE UNIQUE]."

**Variante C - Focus Résultat** :
"[BÉNÉFICE CHIFFRÉ] sans [PAIN HABITUEL]."

**Exemples générés** :
1. _______
2. _______
3. _______

### Phase 3 : Sélection (30 min)

**Matrice d'évaluation** :

| UVP candidate | Spécifique /5 | Bénéfice /5 | Différent /5 | Crédible /5 | Total |
|---------------|---------------|-------------|--------------|-------------|-------|
| UVP 1 | | | | | |
| UVP 2 | | | | | |
| UVP 3 | | | | | |

**UVP sélectionnée** : _______

**Plan de test** :
- A/B test page d'accueil : [Date]
- Métrique : Taux de conversion inscription
```

**Exemples d'UVP e-commerce par vertical** :

| Vertical | UVP | Décryptage |
|----------|-----|------------|
| **Mode sustainable** | "Des vêtements qui durent. Garantie 5 ans, réparables à vie." | Différenciation durabilité + preuve concrète |
| **Épicerie locale** | "Le marché de votre quartier, livré en 2h." | Familiarité + commodité |
| **B2B fournitures** | "Commandez 80% plus vite. Catalogue unifié + réappro auto." | Bénéfice chiffré + fonctionnalités |
| **Marketplace artisans** | "Achetez directement aux créateurs. 0% commission cachée." | Transparence + authenticité |
| **Tech reconditionné** | "iPhone garanti 2 ans, 40% moins cher. Reconditionné en France." | Prix + réassurance + local |

---

### 5.5 Lean Canvas vs Business Model Canvas

#### Niveau 1 - Vulgarisation

**Business Model Canvas** : Créé par Alexander Osterwalder, c'est un outil d'une page pour décrire comment une entreprise crée, délivre et capture de la valeur. Il convient aux entreprises établies qui veulent analyser ou transformer leur business model.

**Lean Canvas** : Créé par Ash Maurya (auteur de "Running Lean"), c'est une adaptation du Business Model Canvas spécialement conçue pour les startups et l'innovation. Il remplace certaines cases par des éléments plus pertinents quand on est encore en phase de découverte.

**Quand utiliser lequel ?**
- **Lean Canvas** : Vous avez une idée, vous cherchez le product-market fit
- **Business Model Canvas** : Vous avez validé le concept, vous structurez pour scaler

#### Niveau 2 - Approfondissement Expert

**Historique et auteurs** :

| Canvas | Auteur | Année | Ouvrage de référence |
|--------|--------|-------|----------------------|
| **Business Model Canvas** | Alexander Osterwalder, Yves Pigneur | 2008-2010 | Business Model Generation |
| **Lean Canvas** | Ash Maurya | 2010-2012 | Running Lean |

> Source : [Ash Maurya - Why Lean Canvas vs Business Model Canvas](https://blog.leanstack.com/why-lean-canvas-vs-business-model-canvas/)

**Comparaison des cases** :

| Business Model Canvas | Lean Canvas | Raison du changement |
|-----------------------|-------------|----------------------|
| Key Partners | ~~Retiré~~ | Prématuré en early stage |
| Key Activities | ~~Retiré~~ | Focus sur le "quoi" pas le "comment" |
| Key Resources | ~~Retiré~~ | Ressources minimales en startup |
| Customer Relationships | ~~Retiré~~ | Trop vague à ce stade |
| — | **Problem** (ajouté) | Valider le problème d'abord |
| — | **Solution** (ajouté) | Hypothèse à tester |
| — | **Key Metrics** (ajouté) | Mesurer le progrès |
| — | **Unfair Advantage** (ajouté) | Barrière à l'entrée |

**Structure comparée** :

```
BUSINESS MODEL CANVAS                 LEAN CANVAS
┌────────────────────────────────┐    ┌────────────────────────────────┐
│ Key      │ Key      │ Value   │    │ Problem  │ Solution │ Unique  │
│ Partners │Activities│ Prop    │    │          │          │ Value   │
│          ├──────────┤         │    │          │          │ Prop    │
│          │ Key      │         │    │ ─────────┼──────────┤         │
│          │ Resources│         │    │ Key      │ Unfair   │         │
│          │          │         │    │ Metrics  │ Advantage│         │
├──────────┴──────────┼─────────┤    ├──────────┴──────────┼─────────┤
│ Cost Structure      │ Revenue │    │ Cost Structure      │ Revenue │
│                     │ Streams │    │                     │ Streams │
└─────────────────────┴─────────┘    └─────────────────────┴─────────┘
│ Customer  │Channels │ Customer│    │ Existing  │Channels │ Customer│
│ Relation- │         │ Segments│    │Alternatives│        │ Segments│
│ ships     │         │         │    │           │         │         │
└───────────┴─────────┴─────────┘    └───────────┴─────────┴─────────┘
```

**Quand utiliser chaque canvas** :

| Situation | Canvas recommandé | Pourquoi |
|-----------|-------------------|----------|
| Idée nouvelle, problème non validé | Lean Canvas | Focus sur hypothèses risquées |
| Startup early stage | Lean Canvas | Itérations rapides |
| Pivot/nouveau produit en entreprise | Lean Canvas | Mindset expérimentation |
| Entreprise établie, optimisation | Business Model Canvas | Vue holistique |
| Présentation investisseurs | Les deux | Lean pour pitch, BMC pour due diligence |
| Formation/enseignement | Business Model Canvas | Plus générique |

#### Niveau 3 - Application Pratique E-commerce

**Template Lean Canvas - Projet E-commerce** :

```markdown
## LEAN CANVAS
**Projet** : [Nom du projet]
**Date** : [Date]
**Itération** : #1

┌───────────────────┬───────────────────┬───────────────────┐
│ PROBLEM           │ SOLUTION          │ UNIQUE VALUE      │
│                   │                   │ PROPOSITION       │
│ Top 3 problèmes : │ Top 3 features :  │                   │
│                   │                   │ Single, clear,    │
│ 1. [Problème 1]   │ 1. [Feature 1]    │ compelling message│
│                   │                   │                   │
│ 2. [Problème 2]   │ 2. [Feature 2]    │ "[UVP ici]"       │
│                   │                   │                   │
│ 3. [Problème 3]   │ 3. [Feature 3]    │ High-level concept│
│                   │                   │ [Analogie :       │
├───────────────────┼───────────────────┤  "X pour Y"]      │
│ KEY METRICS       │ UNFAIR ADVANTAGE  │                   │
│                   │                   │                   │
│ Métriques clés :  │ Ce qui ne peut    │                   │
│                   │ pas être copié :  │                   │
│ - [Métrique 1]    │                   │                   │
│ - [Métrique 2]    │ [Avantage]        │                   │
│                   │                   │                   │
├───────────────────┴───────────────────┴───────────────────┤
│ EXISTING ALTERNATIVES          │ CHANNELS                 │
│                                │                          │
│ Comment le client résout       │ Chemin vers les clients :│
│ le problème aujourd'hui :      │                          │
│                                │ - [Canal 1]              │
│ - [Alternative 1]              │ - [Canal 2]              │
│ - [Alternative 2]              │                          │
├────────────────────────────────┴──────────────────────────┤
│ CUSTOMER SEGMENTS                                         │
│                                                           │
│ Early Adopters :                                          │
│ [Description du segment le plus susceptible d'acheter     │
│  en premier - caractéristiques, où les trouver]          │
│                                                           │
├───────────────────────────────┬───────────────────────────┤
│ COST STRUCTURE                │ REVENUE STREAMS           │
│                               │                           │
│ Coûts fixes :                 │ Sources de revenus :      │
│ - [Coût 1]                    │ - [Revenue 1]             │
│                               │                           │
│ Coûts variables :             │ Modèle de prix :          │
│ - [Coût 2]                    │ - [Prix/stratégie]        │
│                               │                           │
│ CAC cible : [X€]              │ LTV cible : [Y€]          │
└───────────────────────────────┴───────────────────────────┘
```

**Exemple rempli - Marketplace B2B** :

```markdown
## LEAN CANVAS - MarketplaceB2B.com

┌───────────────────┬───────────────────┬───────────────────┐
│ PROBLEM           │ SOLUTION          │ UNIQUE VALUE      │
│                   │                   │ PROPOSITION       │
│ 1. Acheteurs PME  │ 1. Catalogue      │                   │
│    perdent 8h/sem │    unifié multi-  │ "Commandez 80%    │
│    en commandes   │    fournisseurs   │ plus vite.        │
│    manuelles      │                   │ Tous vos          │
│                   │ 2. Réappro auto   │ fournisseurs,     │
│ 2. Pas de visi-   │    prédictive     │ une interface."   │
│    bilité sur     │                   │                   │
│    dépenses       │ 3. Dashboard      │ "Coupa pour PME"  │
│                   │    analytics      │                   │
│ 3. Négociation    │                   │                   │
│    prix complexe  │                   │                   │
├───────────────────┼───────────────────┤                   │
│ KEY METRICS       │ UNFAIR ADVANTAGE  │                   │
│                   │                   │                   │
│ - MAU acheteurs   │ - Réseau fournis- │                   │
│ - GMV mensuel     │   seurs exclusif  │                   │
│ - Commandes auto  │ - Data achats     │                   │
│ - NPS             │   (négociation)   │                   │
├───────────────────┴───────────────────┴───────────────────┤
│ EXISTING ALTERNATIVES          │ CHANNELS                 │
│                                │                          │
│ - Email/téléphone fournisseurs │ - LinkedIn Sales         │
│ - Sites fournisseurs multiples │ - Salons pro BtoB        │
│ - ERP (lourd, cher)            │ - SEO "achats PME"       │
│ - Coupa (grandes entreprises)  │ - Partenariats experts-  │
│                                │   comptables             │
├────────────────────────────────┴──────────────────────────┤
│ CUSTOMER SEGMENTS                                         │
│                                                           │
│ Early Adopters : PME industrielles 50-200 employés,       │
│ responsable achats "digital native" (30-40 ans),          │
│ frustré par les process manuels, budget achats >500K€/an  │
├───────────────────────────────┬───────────────────────────┤
│ COST STRUCTURE                │ REVENUE STREAMS           │
│                               │                           │
│ Fixes : Dev (60%), Sales (25%)│ - Commission transaction  │
│ Variables : Support, infra    │   (1-3% GMV)              │
│                               │ - Abonnement SaaS Premium │
│ CAC cible : 500€              │   (99-499€/mois)          │
│                               │ - Services fournisseurs   │
│                               │                           │
│                               │ LTV cible : 5 000€        │
└───────────────────────────────┴───────────────────────────┘
```

---

### 5.6 OKRs en Phase Discovery

#### Niveau 1 - Vulgarisation

**Définition simple** : Les OKRs (Objectives and Key Results) sont un framework pour définir et suivre des objectifs. Un Objectif dit "où on veut aller" (qualitatif, inspirant), les Key Results disent "comment on saura qu'on y est" (quantitatif, mesurable).

**Exemple simple** :
- **Objectif** : Comprendre profondément les besoins des acheteurs B2B
- **KR1** : Conduire 30 interviews clients d'ici fin Q1
- **KR2** : Identifier et prioriser les 5 jobs-to-be-done majeurs
- **KR3** : Valider 3 problèmes avec un score de douleur > 8/10

**Particularité en Discovery** : En phase Discovery, on ne mesure pas encore l'usage du produit (il n'existe pas !). Les OKRs portent sur l'apprentissage et la validation d'hypothèses.

#### Niveau 2 - Approfondissement Expert

**Origine et évolution** :
Le framework OKR a été formalisé par **Andy Grove** chez Intel dans les années 1970, puis popularisé par **John Doerr** qui l'a introduit chez Google en 1999. Aujourd'hui, il est utilisé par des milliers d'entreprises tech.

> Source : [Roman Pichler - OKRs in Product Management](https://www.romanpichler.com/blog/okrs-in-product-management/)

**Spécificités des OKRs Discovery** :

| Aspect | OKR Classique (Delivery) | OKR Discovery |
|--------|--------------------------|---------------|
| **Focus** | Résultats business | Apprentissage, validation |
| **KRs typiques** | Métriques produit (usage, revenue) | Interviews, tests, hypothèses validées |
| **Horizon** | Trimestre | 6-8 semaines (plus court) |
| **Risque** | Échec = mauvaise performance | "Échec" = apprentissage rapide |

**Challenges identifiés** :

> "There's the aspect of timing: When you have defined your OKR at the beginning of the quarter, then embark on a six-week Discovery phase, you have hardly enough time left to make an impact with what you're building."

> Source : [Herbig - OKRs Product Management](https://herbig.co/okrs-product-management/)

**Solutions** :

1. **OKRs Discovery dédiés** : Séparer les OKRs discovery des OKRs delivery
2. **Cycles plus courts** : 6 semaines au lieu d'un trimestre
3. **KRs d'apprentissage** : Mesurer la qualité des insights, pas les vanity metrics

#### Niveau 3 - Application Pratique E-commerce

**Template OKRs Phase Discovery** :

```markdown
## OKRs DISCOVERY - Q1 2025
**Équipe** : Discovery Squad - Nouvelle verticale Marketplace
**Durée** : 6 semaines (S1-S6)

═══════════════════════════════════════════════════════════════

### OBJECTIVE 1 : Valider le Problem-Solution Fit

**Énoncé** : Comprendre profondément les frustrations des
acheteurs PME et valider que notre solution y répond.

| Key Result | Cible | Actuel | Status |
|------------|-------|--------|--------|
| KR1.1 : Interviews acheteurs réalisées | 25 | 0 | 🔴 |
| KR1.2 : Jobs-to-be-done identifiés et priorisés | 5 | 0 | 🔴 |
| KR1.3 : Problèmes validés (score douleur >8/10) | 3 | 0 | 🔴 |
| KR1.4 : Solution testée avec prototype (feedback positif) | 70% | 0% | 🔴 |

**Activités clés** :
- S1-S2 : Recrutement et interviews exploratoires
- S3 : Synthèse et priorisation jobs/pains
- S4-S5 : Prototype et tests solution
- S6 : Documentation et recommandation

---

### OBJECTIVE 2 : Qualifier l'opportunité marché

**Énoncé** : Dimensionner le marché et identifier les conditions
de succès pour une décision Go/No-Go éclairée.

| Key Result | Cible | Actuel | Status |
|------------|-------|--------|--------|
| KR2.1 : TAM/SAM/SOM documenté et validé | 100% | 0% | 🔴 |
| KR2.2 : Concurrents analysés (forces/faiblesses) | 5 | 0 | 🔴 |
| KR2.3 : Business model validé (willingness to pay) | 60% | 0% | 🔴 |
| KR2.4 : Risques majeurs identifiés et mitigation | 3 | 0 | 🔴 |

---

### OBJECTIVE 3 : Préparer le passage en Build

**Énoncé** : Produire les artefacts nécessaires pour une décision
Go/No-Go et un démarrage rapide si Go.

| Key Result | Cible | Actuel | Status |
|------------|-------|--------|--------|
| KR3.1 : Vision Board complété et validé stakeholders | 100% | 0% | 🔴 |
| KR3.2 : User stories MVP rédigées | 15-20 | 0 | 🔴 |
| KR3.3 : North Star Metric définie et acceptée | 1 | 0 | 🔴 |
| KR3.4 : Présentation Go/No-Go réalisée | 1 | 0 | 🔴 |

═══════════════════════════════════════════════════════════════

### SUIVI HEBDOMADAIRE

| Semaine | Focus | Livrable | Status |
|---------|-------|----------|--------|
| S1 | Setup + Recrutement | Plan interviews | ⬜ |
| S2 | Interviews exploratoires | 10 interviews | ⬜ |
| S3 | Interviews + Synthèse | Jobs/Pains map | ⬜ |
| S4 | Analyse marché | TAM/SAM/SOM | ⬜ |
| S5 | Prototype + Tests | Feedback solution | ⬜ |
| S6 | Synthèse + Décision | Go/No-Go deck | ⬜ |
```

**Dashboard OKR Discovery** :

```
┌─────────────────────────────────────────────────────────────────┐
│  OKRs DISCOVERY - Semaine 3/6                                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ╔════════════════════════════════════════════════════════════╗ │
│  ║ O1: Problem-Solution Fit                    [████████░░] 75% ║ │
│  ╠════════════════════════════════════════════════════════════╣ │
│  ║ • Interviews réalisées         18/25       [████████░░] 72% ║ │
│  ║ • Jobs identifiés               4/5        [████████░░] 80% ║ │
│  ║ • Problèmes validés             2/3        [██████░░░░] 67% ║ │
│  ║ • Solution testée               0%         [░░░░░░░░░░]  0% ║ │
│  ╚════════════════════════════════════════════════════════════╝ │
│                                                                 │
│  ╔════════════════════════════════════════════════════════════╗ │
│  ║ O2: Opportunité marché                      [████░░░░░░] 40% ║ │
│  ╠════════════════════════════════════════════════════════════╣ │
│  ║ • TAM/SAM/SOM                  50%         [█████░░░░░] 50% ║ │
│  ║ • Concurrents analysés          3/5        [██████░░░░] 60% ║ │
│  ║ • Business model validé         0%         [░░░░░░░░░░]  0% ║ │
│  ║ • Risques identifiés            2/3        [██████░░░░] 67% ║ │
│  ╚════════════════════════════════════════════════════════════╝ │
│                                                                 │
│  ⚠️ ALERTES                                                     │
│  • KR "Solution testée" : Prototype en retard, prévoir S4      │
│  • KR "Business model" : Interviews prix à planifier S4        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

---

## Section 6 : Validation de l'Opportunité et Décision Go/No-Go

> *"The only way to win is to learn faster than anyone else."* — Eric Ries

Cette section couvre les frameworks et processus pour valider les hypothèses, prioriser les opportunités, et prendre des décisions éclairées sur la poursuite ou l'abandon d'un projet.

---

### 6.1 Assumption Mapping (Cartographie des Hypothèses)

#### Niveau 1 - Vulgarisation

**Définition simple** : L'Assumption Mapping est une technique pour lister toutes les croyances/suppositions sur lesquelles repose votre projet, puis identifier celles qui sont les plus risquées et doivent être testées en priorité.

**Pourquoi c'est crucial** : Tout projet repose sur des hypothèses ("les clients veulent X", "on peut construire Y pour Z€"). Si ces hypothèses sont fausses, le projet échoue. Mieux vaut les tester tôt et pas cher que découvrir l'erreur après des mois de développement.

**Analogie** : Imaginez construire une maison. Vous supposez que le terrain est stable. Si vous ne vérifiez pas cette hypothèse, la maison peut s'effondrer. L'Assumption Mapping, c'est vérifier le terrain avant de couler les fondations.

#### Niveau 2 - Approfondissement Expert

**Origine et concepteurs** :
L'Assumption Mapping a été créé par **Jeff Gothelf** et **Josh Seiden**, co-auteurs de "Lean UX" (2013). Il s'inscrit dans la continuité du Lean Startup et du Design Thinking.

> Source : [Maze - Assumption Mapping](https://maze.co/blog/assumption-mapping/)

**La matrice 2x2** :

L'Assumption Map organise les hypothèses sur deux axes :

```
                    IMPORTANCE
                    (Si faux, impact sur le projet)
                         ↑
                         │
     ┌───────────────────┼───────────────────┐
     │                   │                   │
     │   NICE TO KNOW    │   KILLER          │
     │   (Ignorer ou     │   ASSUMPTIONS     │
     │    reporter)      │   (Tester         │
     │                   │    immédiatement) │
 ────┼───────────────────┼───────────────────┼────→ INCERTITUDE
     │                   │                   │      (Confiance dans
     │   SAFE BETS       │   FOUNDATIONAL    │       l'hypothèse)
     │   (Déjà validées) │   (Valider si     │
     │                   │    possible)      │
     │                   │                   │
     └───────────────────┼───────────────────┘
                         │
                      Faible
```

**Types d'hypothèses à cartographier** :

| Type | Focus | Exemples de questions |
|------|-------|----------------------|
| **Désirabilité** | Le client veut-il ça ? | Les utilisateurs ont-ils ce problème ? Paieraient-ils pour cette solution ? |
| **Viabilité** | Le business model tient-il ? | Peut-on acquérir des clients à coût acceptable ? La marge est-elle suffisante ? |
| **Faisabilité** | Peut-on le construire ? | A-t-on la technologie ? Les compétences ? Le budget ? |

**Statistique clé** :
> "9 idées sur 10 échouent généralement. Testez-les pour éliminer les 9 mauvaises et vous concentrer sur celle qui fonctionne."

> Source : [ProductFolio - Assumption Mapping](https://productfolio.com/assumption-mapping/)

**Transformer une hypothèse en expérience** :

```
HYPOTHÈSE (croyance)
      │
      ▼
HYPOTHESIS TESTABLE
"Nous croyons que [segment] a [problème]
 et que [solution] le résoudra,
 ce qui conduira à [résultat mesurable]"
      │
      ▼
EXPÉRIENCE (test minimal)
      │
      ▼
APPRENTISSAGE (valider/invalider)
```

#### Niveau 3 - Application Pratique E-commerce

**Template Assumption Mapping - Projet E-commerce** :

```markdown
## ASSUMPTION MAP
**Projet** : Marketplace produits reconditionnés
**Date** : [Date]
**Sprint Discovery** : #1

═══════════════════════════════════════════════════════════════

### INVENTAIRE DES HYPOTHÈSES

#### Désirabilité (Le client veut-il ça ?)

| ID | Hypothèse | Importance | Certitude | Quadrant |
|----|-----------|------------|-----------|----------|
| D1 | Les 25-40 ans achèteraient du reconditionné si garanti 2 ans | 🔴 Haute | 🟡 Moyenne | TESTER |
| D2 | Le prix est le facteur #1, devant l'écologie | 🟡 Moyenne | 🔴 Faible | TESTER |
| D3 | Les clients veulent connaître l'état précis (grade A/B/C) | 🔴 Haute | 🟢 Haute | FONDATION |
| D4 | La livraison rapide est attendue (<48h) | 🟡 Moyenne | 🟡 Moyenne | VALIDER SI POSSIBLE |

#### Viabilité (Le business tient-il ?)

| ID | Hypothèse | Importance | Certitude | Quadrant |
|----|-----------|------------|-----------|----------|
| V1 | On peut sourcer du stock reconditionné à marge > 20% | 🔴 Haute | 🔴 Faible | KILLER - TESTER |
| V2 | Le CAC sera < 30€ via SEO et social | 🔴 Haute | 🔴 Faible | KILLER - TESTER |
| V3 | Le taux de retour sera < 5% avec notre grading | 🔴 Haute | 🟡 Moyenne | TESTER |
| V4 | Les clients recommanderont (viral loop) | 🟡 Moyenne | 🔴 Faible | VALIDER |

#### Faisabilité (Peut-on le construire ?)

| ID | Hypothèse | Importance | Certitude | Quadrant |
|----|-----------|------------|-----------|----------|
| F1 | On peut intégrer les systèmes des reconditionneurs | 🟡 Moyenne | 🟡 Moyenne | VALIDER |
| F2 | L'équipe peut livrer un MVP en 3 mois | 🔴 Haute | 🟢 Haute | FONDATION |
| F3 | Le service client peut gérer les questions techniques | 🟡 Moyenne | 🔴 Faible | TESTER |

═══════════════════════════════════════════════════════════════

### KILLER ASSUMPTIONS À TESTER EN PRIORITÉ

| # | Hypothèse | Test proposé | Critère de succès | Délai |
|---|-----------|--------------|-------------------|-------|
| 1 | V1 - Marge sourcing | Négocier avec 3 fournisseurs, obtenir tarifs | Marge brute > 20% | S1 |
| 2 | D1 - Intérêt garantie 2 ans | Landing page + ads test | CTR > 3%, signup > 5% | S2 |
| 3 | V2 - CAC acceptable | Campagne test 500€ | CAC < 30€ | S2 |
| 4 | D2 - Prix vs écologie | Survey 100 répondants | Ranking des facteurs | S1 |

═══════════════════════════════════════════════════════════════

### SUIVI DES VALIDATIONS

| Hypothèse | Résultat test | Statut | Action |
|-----------|---------------|--------|--------|
| V1 - Marge sourcing | Marge négociée : 18-25% | ✅ VALIDÉ | Continuer avec fournisseur B |
| D1 - Garantie 2 ans | CTR : 4.2%, signup : 6.1% | ✅ VALIDÉ | Feature clé du MVP |
| D2 - Prix vs écologie | Prix #1 (72%), écologie #3 (45%) | ✅ VALIDÉ | Messaging : prix d'abord |
| V2 - CAC | CAC test : 38€ | ⚠️ PARTIELLEMENT | Optimiser targeting |
```

---

### 6.2 Frameworks de Priorisation : RICE et ICE

#### Niveau 1 - Vulgarisation

**RICE** et **ICE** sont deux méthodes pour noter et classer vos idées de fonctionnalités ou projets. Au lieu de décider "au feeling", vous attribuez des scores objectifs pour comparer rationnellement.

**RICE** = **R**each (Portée) × **I**mpact × **C**onfidence (Confiance) ÷ **E**ffort

**ICE** = **I**mpact × **C**onfidence × **E**ase (Facilité)

**Quand utiliser quoi ?**
- **RICE** : Quand vous avez des données sur le nombre d'utilisateurs touchés (reach)
- **ICE** : Plus rapide, pour des décisions early-stage sans données précises

#### Niveau 2 - Approfondissement Expert

**Origine des frameworks** :

| Framework | Créateur | Contexte |
|-----------|----------|----------|
| **RICE** | Équipe produit d'Intercom | Développé car les autres frameworks ne correspondaient pas à leur culture |
| **ICE** | Sean Ellis | Créateur du terme "Growth Hacker", contexte growth |

> Source : [Intercom - RICE Prioritization](https://www.intercom.com/blog/rice-simple-prioritization-for-product-managers/)

**Détail du scoring RICE** :

| Facteur | Définition | Unité | Exemple |
|---------|------------|-------|---------|
| **Reach** | Combien de personnes/événements touchés par période | Users/mois | 10 000 clients/trimestre |
| **Impact** | Effet sur l'objectif visé | Échelle 0.25-3 | 3=massif, 2=fort, 1=moyen, 0.5=faible, 0.25=minimal |
| **Confidence** | Degré de certitude des estimations | % | 100%=données solides, 80%=confiant, 50%=incertain |
| **Effort** | Travail requis | Personnes-mois | 2 = 2 personnes pendant 1 mois |

**Formule RICE** :
```
Score RICE = (Reach × Impact × Confidence%) / Effort
```

**Détail du scoring ICE** :

| Facteur | Définition | Échelle |
|---------|------------|---------|
| **Impact** | Effet sur l'objectif (croissance, revenue, NPS...) | 1-10 |
| **Confidence** | Confiance dans les estimations | 1-10 |
| **Ease** | Facilité d'implémentation (inverse de l'effort) | 1-10 |

**Formule ICE** :
```
Score ICE = Impact × Confidence × Ease
```

**Comparaison RICE vs ICE** :

| Aspect | RICE | ICE |
|--------|------|-----|
| **Complexité** | Plus détaillé | Plus simple |
| **Reach** | Inclus explicitement | Intégré dans Impact |
| **Effort** | Person-months (précis) | Échelle 1-10 (relatif) |
| **Meilleur pour** | Produits matures avec data | Early stage, growth, décisions rapides |
| **Risque** | Faux sentiment de précision | Subjectivité des scores |

#### Niveau 3 - Application Pratique E-commerce

**Template RICE Scoring - Backlog E-commerce** :

```markdown
## RICE PRIORITIZATION
**Produit** : Marketplace B2C
**Période scoring** : Q1 2025
**Objectif aligné** : Augmenter le taux de réachat

═══════════════════════════════════════════════════════════════

### BARÈME DE RÉFÉRENCE

**Reach** (par trimestre) :
- Tous les utilisateurs actifs : 50 000
- Segment fidèles (>3 commandes) : 8 000
- Nouveaux clients : 15 000

**Impact** :
| Score | Label | Effet attendu sur métrique cible |
|-------|-------|----------------------------------|
| 3 | Massif | +30% ou plus sur la métrique |
| 2 | Fort | +15-30% |
| 1 | Moyen | +5-15% |
| 0.5 | Faible | +1-5% |
| 0.25 | Minimal | <1% |

**Confidence** :
| Score | Justification |
|-------|---------------|
| 100% | Data A/B test ou benchmark solide |
| 80% | Recherche utilisateur convergente |
| 50% | Intuition + signaux faibles |
| 20% | Pure hypothèse |

**Effort** (en personnes-semaines) :
- 0.5 = 2-3 jours
- 1 = 1 semaine
- 2 = 2 semaines
- 4 = 1 mois

═══════════════════════════════════════════════════════════════

### SCORING DES INITIATIVES

| Initiative | Reach | Impact | Conf. | Effort | Score | Rang |
|------------|-------|--------|-------|--------|-------|------|
| Email réactivation J+30 | 20K | 2 | 80% | 1 | **32 000** | 1 |
| Wishlist + alerte prix | 30K | 1 | 50% | 2 | **7 500** | 3 |
| Améliorer page produit | 50K | 0.5 | 80% | 3 | **6 667** | 4 |
| Recommandations IA | 40K | 2 | 50% | 8 | **5 000** | 5 |
| Programme fidélité | 8K | 3 | 80% | 4 | **4 800** | 6 |
| Livraison express | 15K | 1 | 80% | 2 | **6 000** | - |
| Refonte checkout | 50K | 2 | 80% | 6 | **13 333** | 2 |

**Calcul exemple** (Email réactivation) :
```
Score = (20 000 × 2 × 0.80) / 1 = 32 000
```

═══════════════════════════════════════════════════════════════

### DÉCISION PRIORISATION Q1

**Top 3 à implémenter** :
1. ✅ Email réactivation J+30 (Score: 32K)
2. ✅ Refonte checkout (Score: 13K)
3. ✅ Wishlist + alerte prix (Score: 7.5K)

**Reporté** :
- Recommandations IA → Q2 (effort trop élevé pour impact incertain)
- Programme fidélité → Après validation taux réachat
```

**Template ICE Scoring - Décisions rapides** :

```markdown
## ICE SCORING - Sprint Ideation

| Idée | Impact (1-10) | Confidence (1-10) | Ease (1-10) | Score | Go? |
|------|---------------|-------------------|-------------|-------|-----|
| Ajouter avis Google | 7 | 8 | 9 | **504** | ✅ |
| Chat support live | 6 | 6 | 5 | **180** | ⏸️ |
| Paiement en 3x | 8 | 7 | 4 | **224** | ✅ |
| App mobile | 7 | 5 | 2 | **70** | ❌ |
| Affiliation | 5 | 4 | 6 | **120** | ⏸️ |

**Seuil de Go** : Score ICE > 200
```

---

### 6.3 PoC vs Prototype vs MVP

#### Niveau 1 - Vulgarisation

Ces trois termes sont souvent confondus, mais ils ont des objectifs très différents :

| Concept | Question qu'il répond | Audience |
|---------|----------------------|----------|
| **PoC** (Proof of Concept) | "Peut-on le construire techniquement ?" | Équipe interne, stakeholders |
| **Prototype** | "À quoi ça ressemblera ? Comment ça marchera ?" | Utilisateurs (tests), stakeholders |
| **MVP** | "Les clients veulent-ils l'acheter ?" | Le marché (vrais clients) |

**Analogie automobile** :
- **PoC** : Test en laboratoire du nouveau moteur → "ça fonctionne"
- **Prototype** : Voiture complète mais faite main, 1 exemplaire → "voici à quoi ça ressemble"
- **MVP** : Première série limitée en vente → "les gens l'achètent-ils ?"

#### Niveau 2 - Approfondissement Expert

**Définitions formelles** :

**MVP (Minimum Viable Product)** :
> "Cette version d'un nouveau produit qui permet à une équipe de collecter le maximum d'apprentissage validé sur les clients avec le minimum d'effort." — **Eric Ries**, The Lean Startup

> Source : [The Lean Startup - Principles](https://theleanstartup.com/principles)

**Caractéristiques comparées** :

| Aspect | PoC | Prototype | MVP |
|--------|-----|-----------|-----|
| **Objectif** | Faisabilité technique | UX/Design, flux utilisateur | Validation marché |
| **Fonctionnel ?** | Partiellement (une fonction) | Non (simulation) | Oui (cœur de valeur) |
| **Utilisateurs réels ?** | Non | Tests seulement | Oui, payants idéalement |
| **Investissement** | Faible | Moyen | Plus élevé |
| **Durée typique** | Jours à semaines | Semaines | Semaines à mois |
| **Output** | Rapport technique | Maquette interactive | Produit live |
| **Qui le voit** | Équipe technique | Stakeholders, testeurs | Le marché |

**Ordre typique dans un projet** :

```
IDÉE
  │
  ├─→ PoC (si doute technique)
  │     "Peut-on intégrer l'API de paiement ?"
  │
  ├─→ Prototype (design)
  │     "Comment l'utilisateur navigue-t-il ?"
  │     Tests utilisateurs
  │
  └─→ MVP (validation marché)
        "Les clients payent-ils ?"
        Build-Measure-Learn loop
```

**Types de MVP** :

| Type | Description | Exemple |
|------|-------------|---------|
| **Landing Page MVP** | Page web décrivant le produit + capture d'intérêt | Dropbox (vidéo démo avant le produit) |
| **Wizard of Oz** | Façade automatique, humain derrière | Zappos (achat manuel en magasin) |
| **Concierge MVP** | Service manuel avant automatisation | Food on the Table |
| **Piecemeal/Frankenstein** | Assemblage d'outils existants | Groupon (WordPress + email) |
| **Single Feature MVP** | Une seule fonction, parfaitement exécutée | Twitter (juste le microblogging) |

> Source : [Stormotion - PoC vs MVP vs Prototype](https://stormotion.io/blog/poc-vs-mvp-vs-prototype/)

#### Niveau 3 - Application Pratique E-commerce

**Arbre de décision : Quel format choisir ?** :

```
┌─────────────────────────────────────────────────────────────┐
│            QUEL FORMAT DE VALIDATION ?                       │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │ Y a-t-il un doute     │
              │ technique majeur ?    │
              └───────────────────────┘
                    │           │
                   OUI         NON
                    │           │
                    ▼           ▼
              ┌─────────┐  ┌───────────────────────┐
              │   PoC   │  │ Sait-on comment       │
              │         │  │ l'utilisateur         │
              └─────────┘  │ interagira ?          │
                           └───────────────────────┘
                                 │           │
                                NON         OUI
                                 │           │
                                 ▼           ▼
                           ┌───────────┐ ┌───────────────────┐
                           │ Prototype │ │ A-t-on validé     │
                           │  (UX)     │ │ la désirabilité ? │
                           └───────────┘ └───────────────────┘
                                               │           │
                                              NON         OUI
                                               │           │
                                               ▼           ▼
                                         ┌───────────┐ ┌─────────┐
                                         │ MVP Light │ │  MVP    │
                                         │ (Landing, │ │ complet │
                                         │  Wizard)  │ └─────────┘
                                         └───────────┘
```

**Template de planification MVP E-commerce** :

```markdown
## MVP DEFINITION CANVAS
**Projet** : [Nom]
**Date** : [Date]

═══════════════════════════════════════════════════════════════

### 1. HYPOTHÈSE CENTRALE À VALIDER

"Nous croyons que [SEGMENT] est prêt à payer pour [SOLUTION]
 parce que [RAISON], ce qui se mesurera par [MÉTRIQUE]."

Exemple :
"Nous croyons que les PME (50-200 employés) sont prêtes à payer
 99€/mois pour une plateforme d'achats unifiée parce qu'elles
 perdent 8h/semaine en commandes manuelles, ce qui se mesurera
 par un taux de conversion freemium > 5%."

═══════════════════════════════════════════════════════════════

### 2. SCOPE MVP : IN vs OUT

| Fonctionnalité | In MVP | Out MVP | Justification |
|----------------|--------|---------|---------------|
| Catalogue produits | ✅ | | Core value |
| Recherche simple | ✅ | | Utilisabilité de base |
| Recherche avancée (filtres) | | ✅ | Nice-to-have |
| Panier + checkout | ✅ | | Core value |
| Paiement CB | ✅ | | Validation achat réel |
| Paiement 3x | | ✅ | Optimisation future |
| Compte client | ✅ | | Réachat, tracking |
| Programme fidélité | | ✅ | Après validation rétention |
| App mobile | | ✅ | Web first |
| Chat support | | ✅ | Email suffisant |
| Avis clients | | ✅ | Importer au début |

### 3. TYPE DE MVP CHOISI

☐ Landing Page MVP (pré-commandes)
☑ Single Feature MVP (catalogue + checkout)
☐ Wizard of Oz (commandes manuelles behind the scene)
☐ Concierge (service manuel personnalisé)
☐ Piecemeal (outils existants assemblés)

### 4. MÉTRIQUES DE SUCCÈS MVP

| Métrique | Cible | Threshold Go | Threshold No-Go |
|----------|-------|--------------|-----------------|
| Inscriptions | 500 | > 300 | < 100 |
| Taux conversion inscription→1ère commande | 15% | > 10% | < 5% |
| NPS post-première commande | 40 | > 30 | < 20 |
| Taux réachat M2 | 25% | > 15% | < 10% |
| CAC | 35€ | < 50€ | > 80€ |

### 5. PLAN MVP

| Phase | Durée | Livrable | Go/No-Go |
|-------|-------|----------|----------|
| Build MVP | 6 sem | Produit live | Technique OK |
| Soft launch | 2 sem | 100 beta users | Bugs critiques ? |
| Public launch | 4 sem | 500 users | Métriques check |
| Learn | 2 sem | Rapport insights | Décision pivot/scale |
```

---

### 6.4 Design Sprint

#### Niveau 1 - Vulgarisation

**Définition simple** : Le Design Sprint est un processus de 5 jours pour résoudre un problème business important en passant de l'idée au test avec de vrais utilisateurs. En une semaine, vous validez (ou invalidez) une idée qui aurait pris des mois autrement.

**L'idée clé** : Au lieu de débattre pendant des semaines sur la meilleure solution, vous construisez un prototype réaliste et le testez avec 5 vrais utilisateurs en seulement 5 jours.

**Pourquoi ça marche** :
- Temps contraint = pas de perfectionnisme paralysant
- Prototype = concret, pas des slides
- Test utilisateur = réponse du marché, pas des opinions internes

#### Niveau 2 - Approfondissement Expert

**Origine et concepteurs** :
Le Design Sprint a été créé par **Jake Knapp** chez Google en 2010, puis perfectionné chez **Google Ventures (GV)** avec **John Zeratsky** et **Braden Kowitz**. Le livre "Sprint" (2016) a popularisé la méthode.

> Source : [GV - The Design Sprint](https://www.gv.com/sprint/)

**Les 5 jours du sprint** :

```
LUNDI       MARDI       MERCREDI    JEUDI       VENDREDI
─────────────────────────────────────────────────────────
  MAP        SKETCH      DECIDE     PROTOTYPE     TEST
─────────────────────────────────────────────────────────
Comprendre   Générer     Choisir    Construire   Valider
le problème  des idées   la         un proto-    avec 5
             (chacun     meilleure  type         vrais
             seul)       solution   réaliste     clients
```

**Détail de chaque journée** :

| Jour | Activité | Output |
|------|----------|--------|
| **Lundi - Map** | Définir le challenge, interviewer les experts, créer une carte du parcours, choisir une cible | Objectif à long terme, questions sprint, carte parcours |
| **Mardi - Sketch** | S'inspirer (Lightning Demos), esquisser des solutions individuellement (4-step sketch) | Solutions individuelles sur papier |
| **Mercredi - Decide** | Présenter, critiquer (Sticky vote), décider (Decider vote), créer un storyboard | Storyboard de la solution choisie |
| **Jeudi - Prototype** | Construire une "façade" réaliste, division des rôles, assembler | Prototype cliquable/testable |
| **Vendredi - Test** | 5 interviews utilisateurs d'1h, observer et noter, identifier les patterns | Insights validés/invalidés |

**Équipe idéale** (7 personnes max) :

| Rôle | Responsabilité |
|------|----------------|
| **Decider** | CEO/PM senior qui tranche les décisions |
| **Facilitateur** | Guide le process, gère le temps |
| **Designer** | Expertise UX, construit le prototype |
| **Tech lead** | Valide la faisabilité |
| **Marketing/Sales** | Vision client, go-to-market |
| **Finance/Ops** | Contraintes business |
| **Expert domaine** | Connaissance spécifique |

**Quand faire un Design Sprint** :

| Situation | Sprint ? | Alternative |
|-----------|----------|-------------|
| Nouveau produit, incertitude élevée | ✅ Oui | |
| Refonte majeure d'une fonctionnalité | ✅ Oui | |
| Débat interne sans fin sur une direction | ✅ Oui | |
| Bug à corriger | ❌ Non | Fix direct |
| Amélioration mineure | ❌ Non | A/B test |
| Pas de Decider disponible | ❌ Non | Reporter |

#### Niveau 3 - Application Pratique E-commerce

**Template Planning Design Sprint E-commerce** :

```markdown
## DESIGN SPRINT BRIEF
**Challenge** : Réduire l'abandon panier (actuellement 72%)
**Dates** : Lundi [Date] → Vendredi [Date]
**Lieu** : [Salle dédiée]

═══════════════════════════════════════════════════════════════

### AVANT LE SPRINT (Préparation)

**Semaine -2** :
- [ ] Valider le challenge avec le Decider
- [ ] Bloquer les agendas de l'équipe (5 jours complets)
- [ ] Réserver la salle + matériel

**Semaine -1** :
- [ ] Recruter 5 testeurs (profil : a déjà abandonné un panier)
- [ ] Préparer les données : analytics abandon, heatmaps, verbatims
- [ ] Brief équipe sur le process

**Matériel** :
- [ ] Post-its (plusieurs couleurs)
- [ ] Feutres (1 par personne)
- [ ] Papier A4
- [ ] Gommettes de vote
- [ ] Time Timer
- [ ] Prototype tool (Figma, InVision)

═══════════════════════════════════════════════════════════════

### PLANNING DÉTAILLÉ

#### LUNDI - MAP

| Heure | Activité | Durée |
|-------|----------|-------|
| 9h00 | Ice breaker, règles du sprint | 15 min |
| 9h15 | Définir l'objectif long terme | 30 min |
| 9h45 | Lister les questions sprint | 30 min |
| 10h15 | Pause | 15 min |
| 10h30 | Créer la carte parcours (checkout) | 60 min |
| 11h30 | Interviews experts internes | 60 min |
| 12h30 | Déjeuner | 60 min |
| 13h30 | "How Might We" sur post-its | 45 min |
| 14h15 | Organiser et voter les HMW | 30 min |
| 14h45 | Choisir la cible sur la carte | 30 min |
| 15h15 | Clôture jour 1 | 15 min |

**Output Lundi** :
- Objectif : "Les clients finalisent leur achat sans friction"
- Cible : Étape "Récapitulatif panier → Paiement"
- Top 3 HMW : [À compléter]

#### MARDI - SKETCH

| Heure | Activité | Durée |
|-------|----------|-------|
| 9h00 | Lightning demos (inspirations) | 60 min |
| 10h00 | Pause | 15 min |
| 10h15 | Notes individuelles | 20 min |
| 10h35 | Ideas (rough sketches) | 20 min |
| 10h55 | Crazy 8s (8 variations en 8 min) | 10 min |
| 11h05 | Solution sketch (3 panels) | 60 min |
| 12h05 | Déjeuner | 60 min |
| 13h05 | Finaliser solution sketch | 55 min |
| 14h00 | Clôture jour 2 | 15 min |

**Output Mardi** :
- 6-7 solutions sketches (anonymes)

#### MERCREDI - DECIDE

| Heure | Activité | Durée |
|-------|----------|-------|
| 9h00 | Art museum (afficher les sketches) | 10 min |
| 9h10 | Heat map vote (gommettes) | 20 min |
| 9h30 | Speed critique (3 min/sketch) | 45 min |
| 10h15 | Pause | 15 min |
| 10h30 | Straw poll (vote non engageant) | 10 min |
| 10h40 | Supervote (Decider choisit) | 15 min |
| 10h55 | Diviser ou combiner ? | 15 min |
| 11h10 | Créer le storyboard (15-20 frames) | 90 min |
| 12h40 | Déjeuner | 60 min |
| 13h40 | Finaliser storyboard | 60 min |
| 14h40 | Clôture jour 3 | 15 min |

**Output Mercredi** :
- Storyboard détaillé du prototype

#### JEUDI - PROTOTYPE

| Heure | Activité | Durée |
|-------|----------|-------|
| 9h00 | Assigner les rôles prototype | 15 min |
| 9h15 | Prototypage (Figma) | 180 min |
| 12h15 | Déjeuner | 60 min |
| 13h15 | Prototypage (suite) | 120 min |
| 15h15 | Stitch (assembler les parties) | 45 min |
| 16h00 | Test du prototype en interne | 30 min |
| 16h30 | Préparer le script interview | 30 min |
| 17h00 | Clôture jour 4 | 15 min |

**Rôles prototype** :
- Makers (2-3) : Construisent les écrans
- Stitcher (1) : Assemble et ajoute interactions
- Writer (1) : Textes réalistes
- Asset collector (1) : Images, logos
- Interviewer (1) : Prépare les questions

#### VENDREDI - TEST

| Heure | Activité | Durée |
|-------|----------|-------|
| 9h00 | Setup salle, brief interviewer | 30 min |
| 9h30 | Interview utilisateur #1 | 60 min |
| 10h30 | Debrief rapide | 15 min |
| 10h45 | Interview utilisateur #2 | 60 min |
| 11h45 | Debrief | 15 min |
| 12h00 | Déjeuner | 60 min |
| 13h00 | Interview utilisateur #3 | 60 min |
| 14h00 | Interview utilisateur #4 | 60 min |
| 15h00 | Interview utilisateur #5 | 60 min |
| 16h00 | Pause | 15 min |
| 16h15 | Synthèse : patterns positifs/négatifs | 45 min |
| 17h00 | Décision : next steps | 30 min |
| 17h30 | Clôture sprint | 15 min |

**Output Vendredi** :
- Grille de patterns (5 users × observations)
- Décision : Pivot / Persevere / Kill

═══════════════════════════════════════════════════════════════

### GRILLE DE SYNTHÈSE TEST

| Question/Écran | User 1 | User 2 | User 3 | User 4 | User 5 | Pattern |
|----------------|--------|--------|--------|--------|--------|---------|
| Comprend l'offre ? | ✅ | ✅ | ❌ | ✅ | ✅ | 4/5 ✅ |
| Trouve le CTA ? | ✅ | ❌ | ✅ | ❌ | ✅ | 3/5 ⚠️ |
| Réassurance suffisante ? | ❌ | ❌ | ✅ | ❌ | ❌ | 1/5 ❌ |
| Finaliserait l'achat ? | ✅ | ⚠️ | ✅ | ⚠️ | ✅ | 3/5 ⚠️ |

**Insights clés** :
1. [À compléter post-test]
2. [À compléter post-test]
3. [À compléter post-test]
```

---

### 6.5 Décision Go/No-Go

#### Niveau 1 - Vulgarisation

**Définition simple** : La décision Go/No-Go est le moment formel où l'on décide de continuer (Go) ou d'arrêter (No-Go) un projet, basé sur des critères objectifs définis à l'avance.

**Pourquoi c'est important** : Sans cette discipline, les projets zombies continuent par inertie, consommant des ressources sans jamais aboutir. Le Go/No-Go force une décision explicite.

**Les 3 issues possibles** :
1. **Go** : On continue, on passe à la phase suivante
2. **No-Go** : On arrête, on libère les ressources
3. **Go conditionnel** : On continue si [condition] est remplie d'ici [date]

#### Niveau 2 - Approfondissement Expert

**Les 5 dimensions d'évaluation** :

| Dimension | Questions clés |
|-----------|----------------|
| **Strategic Fit** | Le projet s'aligne-t-il avec la stratégie ? Renforce-t-il notre positionnement ? |
| **Technical Feasibility** | Peut-on le construire ? A-t-on les compétences ? La technologie ? |
| **Customer Acceptance** | Les clients le veulent-ils ? Payeront-ils ? L'utiliseront-ils ? |
| **Market Opportunity** | Le marché est-il assez grand ? Croissant ? Accessible ? |
| **Financial Performance** | Le ROI est-il acceptable ? Le payback réaliste ? |

> Source : [Visual Paradigm - Go/No-Go Checklist](https://guides.visual-paradigm.com/making-informed-decisions-with-a-go-no-go-checklist-for-agile-projects-a-scoring-approach/)

**Règles de décision** :

| Approche | Description | Quand l'utiliser |
|----------|-------------|------------------|
| **Unanimité** | Tous les critères doivent être "Go" | Projets à haut risque |
| **Majorité pondérée** | Score total > seuil (ex: 8/11) | Projets standards |
| **Killer criteria** | Certains critères sont éliminatoires | Compliance, sécurité |

**Bonnes pratiques** :

1. **Définir les critères AVANT** : Pas pendant la réunion de décision
2. **Évaluateur indépendant** : Éviter le biais de l'équipe projet
3. **Data over opinions** : S'appuyer sur les résultats des tests, pas les intuitions
4. **Exit points clairs** : Définir à l'avance ce qui déclencherait un No-Go

**Biais à éviter** :

| Biais | Description | Mitigation |
|-------|-------------|------------|
| **Sunk Cost Fallacy** | "On a déjà investi tant..." | Ignorer les coûts passés, focus sur le futur |
| **Confirmation Bias** | Chercher des preuves qui confirment | Devil's advocate, red team |
| **Optimism Bias** | Surestimer les chances de succès | Benchmarks externes, pre-mortem |
| **HiPPO** | Highest Paid Person's Opinion | Vote anonyme, critères objectifs |

#### Niveau 3 - Application Pratique E-commerce

**Template Go/No-Go Discovery Phase** :

```markdown
## GO / NO-GO DECISION FRAMEWORK
**Projet** : [Nom du projet]
**Phase** : Discovery → Build
**Date décision** : [Date]
**Décideur** : [Nom/Rôle]

═══════════════════════════════════════════════════════════════

### RÉSUMÉ EXÉCUTIF

**Problème adressé** : [1-2 phrases]
**Solution proposée** : [1-2 phrases]
**Investissement demandé** : [Budget + ressources + durée]
**Recommandation** : ☐ GO  ☐ NO-GO  ☐ GO CONDITIONNEL

═══════════════════════════════════════════════════════════════

### SCORECARD MULTICRITÈRES

#### 1. STRATEGIC FIT (Poids: 15%)

| Critère | Score (0-10) | Commentaire |
|---------|--------------|-------------|
| Alignement avec la vision | ___ | |
| Renforce l'avantage compétitif | ___ | |
| Cohérence avec le portefeuille | ___ | |
| **Moyenne pondérée** | ___ /10 | |

#### 2. CUSTOMER ACCEPTANCE (Poids: 30%)

| Critère | Score (0-10) | Evidence |
|---------|--------------|----------|
| Problème validé (interviews) | ___ | n= ___  |
| Willingness to pay confirmé | ___ | ___% |
| Prototype testé positivement | ___ | n= ___ |
| **Moyenne pondérée** | ___ /10 | |

#### 3. MARKET OPPORTUNITY (Poids: 25%)

| Critère | Score (0-10) | Data |
|---------|--------------|------|
| Taille du marché (SAM) | ___ | ___M€ |
| Croissance du marché | ___ | ___% |
| Intensité concurrentielle | ___ | |
| Barrières à l'entrée | ___ | |
| **Moyenne pondérée** | ___ /10 | |

#### 4. TECHNICAL FEASIBILITY (Poids: 15%)

| Critère | Score (0-10) | Notes |
|---------|--------------|-------|
| Compétences disponibles | ___ | |
| Stack technologique | ___ | |
| Intégrations requises | ___ | |
| Dette technique anticipée | ___ | |
| **Moyenne pondérée** | ___ /10 | |

#### 5. FINANCIAL PERFORMANCE (Poids: 15%)

| Critère | Score (0-10) | Projection |
|---------|--------------|------------|
| Unit economics viables | ___ | CAC: ___, LTV: ___ |
| ROI à 24 mois | ___ | ___% |
| Break-even réaliste | ___ | ___ mois |
| **Moyenne pondérée** | ___ /10 | |

═══════════════════════════════════════════════════════════════

### SCORE GLOBAL

| Dimension | Poids | Score | Pondéré |
|-----------|-------|-------|---------|
| Strategic Fit | 15% | ___ | ___ |
| Customer Acceptance | 30% | ___ | ___ |
| Market Opportunity | 25% | ___ | ___ |
| Technical Feasibility | 15% | ___ | ___ |
| Financial Performance | 15% | ___ | ___ |
| **TOTAL** | 100% | | **___ /10** |

**Seuils de décision** :
- Score ≥ 7.0 → **GO**
- Score 5.0-6.9 → **GO CONDITIONNEL** (conditions à définir)
- Score < 5.0 → **NO-GO**

═══════════════════════════════════════════════════════════════

### KILLER CRITERIA (Non négociables)

| Critère | Status | Si Non = No-Go automatique |
|---------|--------|---------------------------|
| Problème utilisateur validé par ≥15 interviews | ☐ Oui ☐ Non | ❌ |
| Au moins 1 avantage compétitif clair | ☐ Oui ☐ Non | ❌ |
| Unit economics positifs sur le papier | ☐ Oui ☐ Non | ❌ |
| Sponsor exécutif identifié | ☐ Oui ☐ Non | ❌ |
| Équipe build disponible | ☐ Oui ☐ Non | ❌ |

═══════════════════════════════════════════════════════════════

### RISQUES MAJEURS

| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| 1. [Risque] | H/M/L | H/M/L | [Action] |
| 2. [Risque] | H/M/L | H/M/L | [Action] |
| 3. [Risque] | H/M/L | H/M/L | [Action] |

═══════════════════════════════════════════════════════════════

### DÉCISION

**Score final** : ___ /10

**Recommendation équipe Discovery** : ☐ GO  ☐ NO-GO  ☐ CONDITIONNEL

**Si GO CONDITIONNEL, conditions** :
1. [Condition 1] d'ici [Date]
2. [Condition 2] d'ici [Date]

**Décision finale (Décideur)** :

☐ **GO** - Passage en phase Build approuvé
   Budget alloué : ___€
   Équipe : ___
   Kick-off : [Date]

☐ **NO-GO** - Projet arrêté
   Raison principale : ___
   Ressources libérées pour : ___
   Apprentissages à documenter : ___

☐ **GO CONDITIONNEL** - En attente de :
   ___
   Prochaine revue : [Date]

**Signatures** :
- Décideur : _______________ Date : ___
- Product Owner : _______________ Date : ___
- Sponsor : _______________ Date : ___
```

---

---

## Section 7 : Livrables et Documentation

> *"Documentation is a love letter that you write to your future self."* — Damian Conway

Cette section couvre les livrables formels de la phase Discovery : les documents qui capturent les apprentissages, permettent la prise de décision, et assurent la continuité vers les phases suivantes.

---

### 7.1 Project Charter / Product Charter

#### Niveau 1 - Vulgarisation

**Définition simple** : Le Project Charter (ou Product Charter) est le document fondateur d'un projet. Il répond aux questions essentielles : Pourquoi fait-on ce projet ? Pour qui ? Qu'est-ce qui est inclus/exclu ? Qui décide ? Quand ? Avec quelles ressources ?

**Pourquoi c'est important** : Sans charter, chacun a sa propre vision du projet. Le charter crée un alignement explicite et sert de référence quand des désaccords ou des déviations apparaissent.

**Analogie** : C'est le "contrat de mariage" du projet — il définit les attentes et les engagements de chaque partie avant de se lancer.

#### Niveau 2 - Approfondissement Expert

**Différence Project Charter vs Product Charter** :

| Aspect | Project Charter | Product Charter |
|--------|-----------------|-----------------|
| **Focus** | Un projet spécifique (début/fin) | Un produit (cycle de vie continu) |
| **Durée** | Limitée dans le temps | Évolue avec le produit |
| **Contenu** | Scope, planning, budget, équipe | Vision, stratégie, métriques long terme |
| **Quand** | Début de chaque projet | Création du produit, màj périodique |

> Source : [SoftKraft - Product Charter](https://www.softkraft.co/product-charter/)

**Éléments essentiels d'un Charter** :

| Section | Contenu | Questions clés |
|---------|---------|----------------|
| **Contexte/Background** | Pourquoi maintenant ? Quel déclencheur ? | Quel problème business ou opportunité ? |
| **Objectifs** | Ce qu'on veut accomplir | Quels KPIs de succès ? SMART ? |
| **Scope** | In/Out du projet | Qu'est-ce qui est inclus ? Exclu ? |
| **Livrables** | Ce qu'on va produire | Quels artefacts concrets ? |
| **Parties prenantes** | Qui est impliqué et comment | Sponsor ? Décideur ? Contributeurs ? |
| **Timeline** | Jalons clés | Quand commence/finit chaque phase ? |
| **Ressources** | Budget, équipe | De quoi avons-nous besoin ? |
| **Risques** | Menaces identifiées | Qu'est-ce qui pourrait mal tourner ? |
| **Hypothèses/Contraintes** | Ce qu'on suppose vrai | Quelles dépendances ? |

**Bonnes pratiques** :

1. **Court et actionnable** : 1-2 pages max, pas un document fleuve
2. **Validé par le sponsor** : Signature = engagement
3. **Référencé régulièrement** : Pas un document "étagère"
4. **Versionné** : Changements traçables (change management)

> Source : [ProjectManager.com - How to Write a Project Charter](https://www.projectmanager.com/blog/project-charter)

#### Niveau 3 - Application Pratique E-commerce

**Template Discovery Charter E-commerce** :

```markdown
## DISCOVERY CHARTER
═══════════════════════════════════════════════════════════════

### INFORMATIONS GÉNÉRALES

| Champ | Valeur |
|-------|--------|
| **Nom du projet** | [Nom descriptif] |
| **Version** | 1.0 |
| **Date création** | [JJ/MM/AAAA] |
| **Sponsor** | [Nom, Rôle] |
| **Product Owner** | [Nom] |
| **Statut** | ☐ Draft ☐ En revue ☐ Approuvé |

═══════════════════════════════════════════════════════════════

### 1. CONTEXTE ET OPPORTUNITÉ

**Déclencheur** :
[Qu'est-ce qui motive ce projet maintenant ?]

Exemple : "Le taux d'abandon panier a augmenté de 65% à 72%
en 6 mois. Les retours clients mentionnent la complexité du
checkout (NPS passé de 45 à 32)."

**Problème ou Opportunité** :
[Description du problème business à résoudre]

**Alignement stratégique** :
[Comment ce projet soutient la stratégie de l'entreprise ?]

═══════════════════════════════════════════════════════════════

### 2. OBJECTIFS

**Objectif principal** :
"Comprendre les causes d'abandon panier et valider une solution
qui permette de réduire le taux d'abandon de 72% à 60%."

**Objectifs secondaires** :
1. Identifier les 3 principaux points de friction du checkout
2. Définir les exigences d'un nouveau parcours checkout
3. Valider l'appétence pour une solution de paiement express

**Critères de succès Discovery** :

| Critère | Cible |
|---------|-------|
| Interviews utilisateurs réalisées | ≥ 20 |
| Problèmes validés et priorisés | ≥ 3 |
| Solution prototypée et testée | ≥ 1 |
| Recommandation Go/No-Go documentée | Oui |

═══════════════════════════════════════════════════════════════

### 3. SCOPE

**IN SCOPE (Ce que nous ferons)** :
- [ ] Recherche utilisateur (interviews, analytics)
- [ ] Analyse concurrentielle checkout
- [ ] Prototypage solution
- [ ] Tests utilisateurs
- [ ] Recommandation Go/No-Go

**OUT OF SCOPE (Ce que nous ne ferons PAS)** :
- [ ] Développement technique
- [ ] Refonte du design global du site
- [ ] Changement de plateforme e-commerce
- [ ] Négociation avec les PSP (Payment Service Providers)

**Dépendances** :
- Accès aux données analytics (équipe Data)
- Disponibilité de l'équipe Design pour prototypage
- Budget recrutement utilisateurs (Marketing)

═══════════════════════════════════════════════════════════════

### 4. LIVRABLES

| # | Livrable | Format | Responsable | Date |
|---|----------|--------|-------------|------|
| 1 | Rapport interviews utilisateurs | Doc + Slides | UX Researcher | S+2 |
| 2 | Analyse concurrentielle | Spreadsheet | PM | S+1 |
| 3 | Carte des parcours (AS-IS / TO-BE) | Figma/Miro | UX Designer | S+3 |
| 4 | Prototype interactif | Figma | UX Designer | S+4 |
| 5 | Résultats tests utilisateurs | Doc | UX Researcher | S+5 |
| 6 | Présentation Go/No-Go | Deck | PM | S+6 |

═══════════════════════════════════════════════════════════════

### 5. PARTIES PRENANTES

| Nom | Rôle | Implication | Contact |
|-----|------|-------------|---------|
| [Nom] | Sponsor (VP Product) | Décideur final | email |
| [Nom] | Product Owner | Responsable Discovery | email |
| [Nom] | UX Researcher | Recherche utilisateur | email |
| [Nom] | UX Designer | Prototype | email |
| [Nom] | Tech Lead | Faisabilité | email |
| [Nom] | Data Analyst | Analytics | email |

**Matrice RACI** :
(Voir Section 7.3)

═══════════════════════════════════════════════════════════════

### 6. TIMELINE

| Semaine | Phase | Activités | Jalon |
|---------|-------|-----------|-------|
| S1 | Setup | Kick-off, recrutement users | Kick-off réalisé |
| S2 | Research | Interviews (10) | 10 interviews |
| S3 | Research | Interviews (10) + analyse | Synthèse insights |
| S4 | Design | Idéation, prototypage | Prototype V1 |
| S5 | Test | Tests utilisateurs (5) | Feedback collecté |
| S6 | Decision | Synthèse, Go/No-Go | Décision prise |

**Dates clés** :
- Kick-off : [Date]
- Mid-point review : [Date]
- Go/No-Go meeting : [Date]

═══════════════════════════════════════════════════════════════

### 7. RESSOURCES

**Équipe** :

| Rôle | Allocation | Période |
|------|------------|---------|
| Product Owner | 50% | 6 semaines |
| UX Researcher | 100% | S1-S5 |
| UX Designer | 50% | S3-S5 |
| Tech Lead | 10% | Consultation |
| Data Analyst | 20% | S1-S2 |

**Budget** :

| Poste | Montant |
|-------|---------|
| Incentives utilisateurs (25 × 30€) | 750€ |
| Outils (Figma, Maze) | 200€ |
| Contingency | 200€ |
| **Total** | **1 150€** |

═══════════════════════════════════════════════════════════════

### 8. RISQUES

| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| Difficulté recrutement utilisateurs | Moyenne | Élevé | Panel externe en backup |
| Indisponibilité Designer S3-S4 | Faible | Élevé | Designer junior en support |
| Données analytics incomplètes | Moyenne | Moyen | Prioriser interviews quali |

═══════════════════════════════════════════════════════════════

### 9. HYPOTHÈSES ET CONTRAINTES

**Hypothèses** :
- Les utilisateurs sont disponibles pour des interviews de 45min
- L'équipe Data peut fournir les données d'abandon en S1
- Le sponsor sera disponible pour le Go/No-Go S6

**Contraintes** :
- Budget limité à 1 200€
- Durée max : 6 semaines
- Pas de développement dans cette phase

═══════════════════════════════════════════════════════════════

### APPROBATIONS

| Rôle | Nom | Signature | Date |
|------|-----|-----------|------|
| Sponsor | | | |
| Product Owner | | | |

**Historique des versions** :

| Version | Date | Auteur | Changements |
|---------|------|--------|-------------|
| 0.1 | [Date] | [Nom] | Création |
| 1.0 | [Date] | [Nom] | Approuvé par sponsor |
```

---

### 7.2 Research Repository (Référentiel de Recherche)

#### Niveau 1 - Vulgarisation

**Définition simple** : Un Research Repository est une bibliothèque digitale centralisée où sont stockés tous les résultats de recherche utilisateur : interviews, insights, personas, rapports, etc. Plutôt que d'avoir des fichiers éparpillés, tout est au même endroit et retrouvable.

**Pourquoi c'est important** : Sans repository, la recherche se perd. Les nouvelles équipes refont les mêmes études, les insights sont oubliés, et la connaissance utilisateur ne s'accumule pas. Le repository crée une mémoire collective.

**Analogie** : C'est la "bibliothèque d'Alexandrie" de votre connaissance client — tout ce que vous avez appris sur vos utilisateurs, préservé et accessible.

#### Niveau 2 - Approfondissement Expert

**Cadre "Atomic Research"** :

L'approche Atomic Research propose de structurer la recherche en unités réutilisables :

> Source : [Maze - User Research Repository](https://maze.co/blog/user-research-repository/)

```
┌─────────────────────────────────────────────────────────────┐
│                    ATOMIC RESEARCH                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   EXPERIMENTS        FACTS           INSIGHTS    ACTIONS    │
│   "We did this"      "We saw this"   "Which      "So we     │
│                                       means"      did this" │
│   ┌─────────┐        ┌─────────┐     ┌─────┐    ┌───────┐  │
│   │Interview│   →    │ Quote   │  →  │Theme│ →  │Feature│  │
│   │Protocol │        │ Data pt │     │     │    │Decision│  │
│   └─────────┘        └─────────┘     └─────┘    └───────┘  │
│                                                             │
│   Granularité : du plus spécifique au plus actionnable     │
└─────────────────────────────────────────────────────────────┘
```

**Composants clés du repository** :

| Composant | Contenu | Format |
|-----------|---------|--------|
| **Études/Projets** | Description, méthodologie, dates | Page projet |
| **Participants** | Profils (anonymisés), critères recrutement | Base de données |
| **Données brutes** | Enregistrements, transcriptions, notes | Fichiers + liens |
| **Nuggets/Facts** | Citations, observations atomiques | Fiches taggées |
| **Insights** | Synthèses, patterns identifiés | Documents |
| **Artefacts** | Personas, journey maps, etc. | Fichiers design |
| **Recommendations** | Actions suggérées | Liées aux insights |

**Outils populaires** :

| Outil | Type | Forces | Faiblesses |
|-------|------|--------|------------|
| **Dovetail** | Dédié recherche | Puissant, tags, AI | Coût élevé |
| **Notion** | Database flexible | Accessible, customisable | Setup manuel |
| **Confluence** | Wiki entreprise | Intégré si déjà utilisé | Peu visuel |
| **Airtable** | Database + vue | Très flexible | Courbe d'apprentissage |
| **Google Drive** | Fichiers | Gratuit, simple | Peu structuré |

> Source : [NNGroup - Research Repositories](https://www.nngroup.com/articles/research-repositories/)

**Bonnes pratiques** :

1. **Structure cohérente** : Même format pour tous les projets
2. **Tagging systématique** : Par thème, persona, feature, date
3. **Mise à jour régulière** : Archiver l'obsolète, actualiser
4. **Accès facile** : Permissions claires, recherche efficace
5. **Onboarding** : Former les équipes à l'utiliser

#### Niveau 3 - Application Pratique E-commerce

**Structure Research Repository - Template Notion/Airtable** :

```markdown
## RESEARCH REPOSITORY STRUCTURE

📁 RESEARCH REPOSITORY
│
├── 📂 1. PROJETS DE RECHERCHE
│   ├── 📄 [2024-Q4] Discovery Checkout
│   │   ├── Objectif
│   │   ├── Méthodologie
│   │   ├── Participants (n=20)
│   │   ├── Timeline
│   │   ├── Livrables
│   │   └── Status: Terminé ✅
│   │
│   ├── 📄 [2024-Q3] Personas V2
│   └── 📄 [2024-Q2] Benchmark UX Mobile
│
├── 📂 2. PARTICIPANTS
│   │   (Base anonymisée)
│   ├── ID: P001 | Segment: Power Buyer | Recruté: Q4-2024
│   ├── ID: P002 | Segment: Occasionnel | Recruté: Q4-2024
│   └── [Filtres: Segment, Date, Étude]
│
├── 📂 3. INSIGHTS LIBRARY
│   │   (Nuggets taggés et searchable)
│   │
│   ├── 🏷️ Par Thème
│   │   ├── #checkout
│   │   ├── #livraison
│   │   ├── #paiement
│   │   ├── #recherche-produit
│   │   └── #confiance
│   │
│   ├── 🏷️ Par Persona
│   │   ├── @power-buyer
│   │   ├── @occasionnel
│   │   └── @nouveau-client
│   │
│   └── 🏷️ Par Source
│       ├── Interview
│       ├── Survey
│       ├── Analytics
│       └── Support tickets
│
├── 📂 4. ARTEFACTS
│   ├── 📄 Personas (v2.0)
│   ├── 📄 Journey Maps
│   │   ├── Parcours Achat (AS-IS)
│   │   └── Parcours Achat (TO-BE)
│   ├── 📄 Empathy Maps
│   └── 📄 Service Blueprints
│
├── 📂 5. RAPPORTS & PRÉSENTATIONS
│   ├── 📄 Rapport Discovery Checkout (PDF)
│   ├── 📄 Deck Go/No-Go (Slides)
│   └── 📄 Executive Summary Q4
│
└── 📂 6. TEMPLATES
    ├── 📄 Template Interview Guide
    ├── 📄 Template Rapport de recherche
    ├── 📄 Template Nugget/Insight
    └── 📄 Template Persona
```

**Template Fiche Insight (Nugget)** :

```markdown
## INSIGHT CARD

═══════════════════════════════════════════════════════════════

### MÉTADONNÉES

| Champ | Valeur |
|-------|--------|
| **ID** | INS-2024-047 |
| **Date création** | [Date] |
| **Projet source** | Discovery Checkout Q4 |
| **Auteur** | [Nom] |
| **Statut** | ☐ Draft  ☑ Validé  ☐ Archivé |

**Tags** :
🏷️ Thème : #checkout #paiement #friction
🏷️ Persona : @power-buyer @occasionnel
🏷️ Priorité : 🔴 Haute

═══════════════════════════════════════════════════════════════

### INSIGHT

**Titre** :
Les utilisateurs abandonnent au moment de créer un compte obligatoire

**Observation (Fait)** :
"Je voulais juste acheter rapidement, pas créer un compte.
Quand j'ai vu le formulaire d'inscription, j'ai fermé l'onglet."
— P007, Interview #12

**Pattern** :
8 participants sur 20 (40%) ont mentionné la création de compte
comme friction majeure. Ce pattern est plus fort chez les
nouveaux clients (6/8) que chez les récurrents (2/12).

**Insight (Interprétation)** :
L'obligation de créer un compte avant le paiement est perçue
comme une barrière de temps et d'engagement disproportionnée
par rapport à l'achat ponctuel envisagé.

**Confiance** : 🟢 Haute (données convergentes quali + quanti)

═══════════════════════════════════════════════════════════════

### EVIDENCE

**Sources** :

| Type | Référence | Citation/Data |
|------|-----------|---------------|
| Interview | P007, P003, P015 | Verbatims ci-dessus |
| Analytics | GA4 | Drop-off 34% à l'étape "Créer compte" |
| Support | Zendesk | 12% des tickets "problème commande" |

**Enregistrements liés** :
- 🎥 Interview P007 (timecode 12:34)
- 📊 Dashboard abandon (lien)

═══════════════════════════════════════════════════════════════

### IMPLICATIONS

**Impact business** :
Estimé : 15-20% des abandons checkout (~8K€/mois de CA perdu)

**Opportunités** :

| Opportunité | Effort | Impact |
|-------------|--------|--------|
| Guest checkout | Faible | Élevé |
| Social login (Google/Apple) | Moyen | Moyen |
| Account creation post-achat | Faible | Moyen |

**Recommandation** :
Implémenter le guest checkout comme option par défaut,
proposer la création de compte après l'achat.

**Décision prise** :
☑ Priorisé dans roadmap Q1 (Feature CHK-042)
Responsable : [PM]

═══════════════════════════════════════════════════════════════

### HISTORIQUE

| Date | Action | Par |
|------|--------|-----|
| [Date] | Insight créé | [Auteur] |
| [Date] | Validé par équipe | [Reviewer] |
| [Date] | Lié à feature CHK-042 | [PM] |
```

---

### 7.3 Stakeholder Mapping et RACI

#### Niveau 1 - Vulgarisation

**Stakeholder Mapping** : C'est l'exercice d'identifier toutes les personnes ou groupes qui ont un intérêt dans le projet (stakeholders), et de comprendre leur niveau d'influence et d'intérêt.

**RACI** : C'est une matrice qui clarifie QUI fait QUOI pour chaque tâche ou décision :
- **R**esponsable : Celui qui fait le travail
- **A**ccountable : Celui qui rend des comptes (un seul !)
- **C**onsulté : Ceux qu'on doit consulter avant de décider
- **I**nformé : Ceux qu'on informe après

**Pourquoi c'est important** : Sans clarté sur les rôles, on a soit des conflits ("qui décide ?"), soit des trous ("je pensais que c'était toi"), soit de l'inefficacité ("on doit demander à tout le monde").

#### Niveau 2 - Approfondissement Expert

**Matrice Pouvoir/Intérêt** :

```
                    INTÉRÊT
                (dans le projet)
                      ↑
           FAIBLE    │    FORT
                     │
    ┌────────────────┼────────────────┐
    │                │                │
    │   MONITOR      │   KEEP         │
    │   (Surveiller) │   SATISFIED    │
    │                │   (Satisfaire) │
P ──┼────────────────┼────────────────┼──
O   │   FAIBLE       │   FORT         │  POUVOIR
U   │                │                │  (sur le projet)
V   │   KEEP         │   MANAGE       │
O   │   INFORMED     │   CLOSELY      │
I   │   (Informer)   │   (Gérer de    │
R   │                │    près)       │
    └────────────────┼────────────────┘
                     │
                  FAIBLE
```

> Source : [Medium - RACI Model for Product Managers](https://medium.com/the-symmetry/stakeholder-management-for-product-managers-raci-model-c4864d984267)

**Règles RACI** :

| Règle | Description |
|-------|-------------|
| **Un seul A** | Il ne peut y avoir qu'UN Accountable par tâche |
| **R obligatoire** | Chaque tâche doit avoir au moins un Responsible |
| **A peut être R** | L'Accountable peut aussi être Responsible |
| **C = bidirectionnel** | Consulter implique un échange, pas juste informer |
| **I = unidirectionnel** | Informer est une communication one-way |

**Variantes de RACI** :

| Variante | Ajout | Utilisation |
|----------|-------|-------------|
| **RASCI** | S = Support (aide le R) | Grandes équipes |
| **RACI-VS** | V = Verify, S = Sign-off | Processus qualité |
| **DACI** | D = Driver, A = Approver | Décisions (pas tâches) |

> Source : [Atlassian - RACI Chart](https://www.atlassian.com/work-management/project-management/raci-chart)

**Quand utiliser RACI** :

| Situation | RACI utile ? |
|-----------|--------------|
| Projet complexe, multi-équipes | ✅ Oui |
| Processus récurrent | ✅ Oui |
| Petite équipe agile (<5) | ⚠️ Peut être overkill |
| Décisions rapides nécessaires | ⚠️ Peut ralentir |
| Rôles déjà très clairs | ❌ Redondant |

#### Niveau 3 - Application Pratique E-commerce

**Template Stakeholder Map - Discovery E-commerce** :

```markdown
## STAKEHOLDER MAP - Discovery Checkout

═══════════════════════════════════════════════════════════════

### 1. IDENTIFICATION DES STAKEHOLDERS

| Stakeholder | Rôle | Organisation | Intérêt | Pouvoir |
|-------------|------|--------------|---------|---------|
| CEO | Sponsor | Direction | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| VP Product | Décideur Go/No-Go | Product | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Head of E-commerce | Expert domaine | Business | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| Tech Lead | Faisabilité | Engineering | ⭐⭐⭐ | ⭐⭐⭐ |
| UX Lead | Responsable design | Design | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| Data Analyst | Support données | Data | ⭐⭐⭐ | ⭐⭐ |
| Head of Support | Voix du client | Support | ⭐⭐⭐⭐ | ⭐⭐ |
| Finance | Budget, ROI | Finance | ⭐⭐ | ⭐⭐⭐ |
| Legal | Conformité | Legal | ⭐ | ⭐⭐⭐ |

═══════════════════════════════════════════════════════════════

### 2. MATRICE POUVOIR/INTÉRÊT

```
         INTÉRÊT dans le projet
              FAIBLE ────────────────→ FORT
         ┌─────────────────────────────────────┐
         │                                     │
      F  │  Legal          │  Finance         │
      A  │  (Monitor)      │  (Keep satisfied)│
      I  │                 │                  │
      B  ├─────────────────┼──────────────────┤
      L  │                 │                  │
      E  │  Data Analyst   │  CEO             │
  P      │  (Keep informed)│  VP Product      │
  O      │                 │  Head E-com      │
  U   ───┤                 │  UX Lead         │
  V      │                 │  Tech Lead       │
  O   F  │                 │  Head Support    │
  I   O  │                 │  (Manage closely)│
  R   R  │                 │                  │
      T  │                 │                  │
         └─────────────────┴──────────────────┘
```

═══════════════════════════════════════════════════════════════

### 3. STRATÉGIE D'ENGAGEMENT

| Quadrant | Stakeholders | Stratégie | Fréquence |
|----------|--------------|-----------|-----------|
| **Manage Closely** | VP Product, Head E-com, UX Lead | Réunions hebdo, co-création | Hebdo |
| **Keep Satisfied** | CEO, Finance | Updates exécutifs, alignement budget | Bi-mensuel |
| **Keep Informed** | Tech Lead, Data, Support | Emails, accès au repo | Au besoin |
| **Monitor** | Legal | Escalade si besoin | Ponctuel |

═══════════════════════════════════════════════════════════════

### 4. PLAN DE COMMUNICATION

| Stakeholder | Canal | Fréquence | Contenu |
|-------------|-------|-----------|---------|
| VP Product | 1:1 | Hebdo | Avancement, décisions, risques |
| CEO | Email + deck | Bi-mensuel | Summary, KPIs, Go/No-Go |
| Head E-com | Slack + réunion | 2x/semaine | Insights, feedback |
| Tech Lead | Slack | Au besoin | Questions faisabilité |
| Équipe élargie | Newsletter | Bi-mensuel | Highlights discovery |
```

**Template RACI - Discovery Phase** :

```markdown
## MATRICE RACI - Discovery Checkout

═══════════════════════════════════════════════════════════════

### LÉGENDE
- **R** = Responsible (fait le travail)
- **A** = Accountable (responsable final - UN SEUL)
- **C** = Consulted (avis requis avant)
- **I** = Informed (informé après)

═══════════════════════════════════════════════════════════════

### MATRICE

| Tâche/Décision | PO | UX Res. | Designer | Tech Lead | VP Product | Data |
|----------------|----|---------  |----------|-----------|------------|------|
| **SETUP** |
| Rédiger Discovery Charter | R/A | C | I | C | C | I |
| Définir critères succès | R | C | I | C | A | C |
| Recruter participants | C | R/A | I | I | I | I |
| **RESEARCH** |
| Conduire interviews | I | R/A | C | I | I | I |
| Analyser données analytics | C | C | I | I | I | R/A |
| Synthétiser insights | R | R/A | C | I | I | C |
| **DESIGN** |
| Créer journey map AS-IS | C | R | A | I | I | C |
| Idéation solutions | R | C | R/A | C | I | I |
| Créer prototype | I | C | R/A | C | I | I |
| **TEST** |
| Conduire tests utilisateurs | I | R/A | C | I | I | I |
| Analyser résultats tests | R | R/A | C | I | I | I |
| **DECISION** |
| Préparer recommandation | R/A | C | C | C | I | C |
| Décision Go/No-Go | C | I | I | C | R/A | I |
| Communiquer décision | R | I | I | I | A | I |

═══════════════════════════════════════════════════════════════

### VALIDATION

**Vérifié** :
- [ ] Chaque ligne a exactement UN "A"
- [ ] Chaque ligne a au moins UN "R"
- [ ] Pas de lignes vides
- [ ] Tous les stakeholders clés sont couverts

**Approuvé par** : [Sponsor] le [Date]
```

---

### 7.4 Opportunity Solution Tree (OST)

#### Niveau 1 - Vulgarisation

**Définition simple** : L'Opportunity Solution Tree (OST) est un arbre visuel qui connecte votre objectif business aux problèmes utilisateurs (opportunités), aux solutions possibles, et aux expériences pour les valider.

**Pourquoi c'est utile** : Il évite de sauter directement de "on veut plus de revenus" à "construisons cette feature". L'OST force à d'abord identifier les VRAIS problèmes utilisateurs avant de proposer des solutions.

**Structure** :
```
OUTCOME (Objectif business)
    └── OPPORTUNITY (Problème utilisateur)
            └── SOLUTION (Idée)
                    └── EXPERIMENT (Test)
```

#### Niveau 2 - Approfondissement Expert

**Origine** :
L'Opportunity Solution Tree a été développé par **Teresa Torres**, auteure de "Continuous Discovery Habits" (2021). C'est un outil central de la Product Discovery continue.

**Principes clés** :

1. **Outcome-driven** : On part d'un résultat business mesurable
2. **User-centric** : Les opportunités sont des besoins/problèmes utilisateurs
3. **Multiple options** : Toujours plusieurs solutions par opportunité
4. **Test & Learn** : Chaque solution est une hypothèse à tester

**Structure complète** :

```
                    ┌──────────────────┐
                    │     OUTCOME      │
                    │  (1 seul, SMART) │
                    └────────┬─────────┘
                             │
           ┌─────────────────┼─────────────────┐
           │                 │                 │
    ┌──────▼──────┐   ┌──────▼──────┐   ┌──────▼──────┐
    │ OPPORTUNITY │   │ OPPORTUNITY │   │ OPPORTUNITY │
    │     #1      │   │     #2      │   │     #3      │
    └──────┬──────┘   └──────┬──────┘   └─────────────┘
           │                 │
     ┌─────┼─────┐     ┌─────┼─────┐
     │     │     │     │     │     │
   ┌─▼─┐ ┌─▼─┐ ┌─▼─┐ ┌─▼─┐ ┌─▼─┐ ┌─▼─┐
   │Sol│ │Sol│ │Sol│ │Sol│ │Sol│ │Sol│
   │ A │ │ B │ │ C │ │ D │ │ E │ │ F │
   └─┬─┘ └─┬─┘ └───┘ └─┬─┘ └───┘ └───┘
     │     │           │
   ┌─▼─┐ ┌─▼─┐       ┌─▼─┐
   │Exp│ │Exp│       │Exp│
   │ 1 │ │ 2 │       │ 3 │
   └───┘ └───┘       └───┘
```

**Règles de construction** :

| Niveau | Règle | Erreur commune |
|--------|-------|----------------|
| **Outcome** | Un seul, mesurable, orienté business | Trop vague ("améliorer l'UX") |
| **Opportunity** | Problème/besoin utilisateur, pas solution déguisée | "Les users veulent un chatbot" (= solution) |
| **Solution** | Multiple par opportunité (min 3) | Une seule solution "évidente" |
| **Experiment** | Test minimal pour valider/invalider | Pas de critère de succès |

#### Niveau 3 - Application Pratique E-commerce

**Template OST - E-commerce** :

```markdown
## OPPORTUNITY SOLUTION TREE
**Projet** : Amélioration Checkout
**Date** : [Date]
**Owner** : [PM]

═══════════════════════════════════════════════════════════════

### OUTCOME (Objectif Business)

┌─────────────────────────────────────────────────────────────┐
│  🎯 OUTCOME                                                  │
│                                                             │
│  "Réduire le taux d'abandon checkout de 72% à 60%          │
│   d'ici la fin du Q2"                                       │
│                                                             │
│  Métrique : Taux d'abandon checkout (GA4)                  │
│  Baseline : 72%                                             │
│  Target : 60%                                               │
│  Timeline : Q2 2025                                         │
└─────────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════

### OPPORTUNITIES (Problèmes Utilisateurs)

Identifiées via : 20 interviews utilisateurs + analytics

┌─────────────────────────────────────────────────────────────┐
│  🔍 OPPORTUNITY #1 (Priorité Haute)                         │
│                                                             │
│  "Les utilisateurs abandonnent car ils doivent créer un    │
│   compte pour acheter"                                      │
│                                                             │
│  Evidence : 40% des interviewés, 34% drop-off analytics    │
│  Impact potentiel : ~15% du taux d'abandon                 │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  🔍 OPPORTUNITY #2 (Priorité Haute)                         │
│                                                             │
│  "Les utilisateurs ne font pas confiance à la sécurité     │
│   du paiement"                                              │
│                                                             │
│  Evidence : 30% des interviewés mentionnent la confiance   │
│  Impact potentiel : ~8% du taux d'abandon                  │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  🔍 OPPORTUNITY #3 (Priorité Moyenne)                       │
│                                                             │
│  "Les utilisateurs sont surpris par les frais de           │
│   livraison découverts tard"                                │
│                                                             │
│  Evidence : 25% des interviewés, rebond sur page shipping  │
│  Impact potentiel : ~5% du taux d'abandon                  │
└─────────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════

### SOLUTIONS (Par Opportunité)

#### Pour Opportunity #1 : Obligation de compte

| ID | Solution | Effort | Impact | Score |
|----|----------|--------|--------|-------|
| S1a | Guest checkout | Faible | Élevé | ⭐⭐⭐⭐⭐ |
| S1b | Social login (Google/Apple) | Moyen | Moyen | ⭐⭐⭐ |
| S1c | Compte créé automatiquement post-achat | Faible | Moyen | ⭐⭐⭐⭐ |
| S1d | Progressive disclosure (compte = optionnel) | Moyen | Moyen | ⭐⭐⭐ |

#### Pour Opportunity #2 : Confiance paiement

| ID | Solution | Effort | Impact | Score |
|----|----------|--------|--------|-------|
| S2a | Badges sécurité visibles (SSL, 3DS) | Faible | Moyen | ⭐⭐⭐⭐ |
| S2b | Reviews/testimonials checkout | Faible | Faible | ⭐⭐ |
| S2c | Garantie remboursement prominente | Faible | Moyen | ⭐⭐⭐⭐ |
| S2d | Apple Pay / Google Pay | Moyen | Élevé | ⭐⭐⭐⭐ |

#### Pour Opportunity #3 : Frais livraison

| ID | Solution | Effort | Impact | Score |
|----|----------|--------|--------|-------|
| S3a | Afficher estimation frais dès le panier | Faible | Élevé | ⭐⭐⭐⭐⭐ |
| S3b | Seuil livraison gratuite visible | Faible | Moyen | ⭐⭐⭐⭐ |
| S3c | Calculateur livraison sur page produit | Moyen | Moyen | ⭐⭐⭐ |

═══════════════════════════════════════════════════════════════

### EXPERIMENTS (Tests de Validation)

#### Expérience 1 : Guest Checkout (S1a)

| Champ | Valeur |
|-------|--------|
| **Hypothèse** | Si on permet l'achat sans compte, le taux de conversion checkout augmentera de 10% |
| **Test** | A/B test 50/50 pendant 2 semaines |
| **Métrique** | Taux conversion step "Compte" → "Paiement" |
| **Critère succès** | Conversion +8% minimum |
| **Risque** | Impact sur création comptes |
| **Durée** | 2 semaines |
| **Status** | 🟡 En cours |

#### Expérience 2 : Frais livraison visibles (S3a)

| Champ | Valeur |
|-------|--------|
| **Hypothèse** | Si on affiche l'estimation des frais dès le panier, le taux d'abandon diminuera de 5% |
| **Test** | Prototype testé avec 5 utilisateurs + A/B |
| **Métrique** | Taux abandon panier → checkout |
| **Critère succès** | -4% abandon minimum |
| **Durée** | Test quali 1 sem + A/B 2 sem |
| **Status** | ⬜ À planifier |

═══════════════════════════════════════════════════════════════

### SYNTHÈSE VISUELLE

```
🎯 Réduire abandon 72% → 60%
│
├── 🔍 #1 Obligation compte (15% impact)
│   ├── 💡 Guest checkout ⭐⭐⭐⭐⭐ → 🧪 A/B Test 🟡
│   ├── 💡 Social login ⭐⭐⭐
│   ├── 💡 Compte auto post-achat ⭐⭐⭐⭐
│   └── 💡 Progressive disclosure ⭐⭐⭐
│
├── 🔍 #2 Confiance paiement (8% impact)
│   ├── 💡 Badges sécurité ⭐⭐⭐⭐
│   ├── 💡 Reviews checkout ⭐⭐
│   ├── 💡 Garantie visible ⭐⭐⭐⭐
│   └── 💡 Apple/Google Pay ⭐⭐⭐⭐
│
└── 🔍 #3 Frais livraison surprise (5% impact)
    ├── 💡 Estimation dès panier ⭐⭐⭐⭐⭐ → 🧪 Proto ⬜
    ├── 💡 Seuil gratuit visible ⭐⭐⭐⭐
    └── 💡 Calculateur page produit ⭐⭐⭐
```
```

---

---

## Section 8 : Questions Transversales

Cette section répond aux questions fréquemment posées sur la Phase Discovery, en synthétisant les meilleures pratiques et en proposant des réponses contextualisées pour le e-commerce B2B et B2C.

---

### 8.1 Comment savoir si le problème identifié est le BON problème ?

#### Réponse courte
Un "bon" problème réunit trois critères : il est **fréquent** (touche beaucoup de gens), **intense** (fait vraiment souffrir), et **valuable** (les gens sont prêts à payer pour le résoudre). La validation passe par la triangulation de plusieurs sources de données.

#### Développement

**Les 3 critères d'un bon problème** :

| Critère | Question | Méthode de validation |
|---------|----------|----------------------|
| **Fréquence** | Combien de personnes ont ce problème ? | Analytics, surveys, taille de marché |
| **Intensité** | À quel point ça fait mal ? (Score 1-10) | Interviews (Mom Test), observation |
| **Value** | Paierait-on pour le résoudre ? | Willingness-to-pay tests, concurrence |

**Framework de validation** :

```
                    ┌────────────────────┐
                    │  HYPOTHÈSE         │
                    │  PROBLÈME          │
                    └─────────┬──────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
    ┌─────▼─────┐       ┌─────▼─────┐       ┌─────▼─────┐
    │ QUANTI    │       │ QUALI     │       │ MARKET    │
    │ Analytics │       │ Interviews│       │ Benchmark │
    │ Surveys   │       │ Observ.   │       │ Concurrence│
    └─────┬─────┘       └─────┬─────┘       └─────┬─────┘
          │                   │                   │
          └───────────────────┼───────────────────┘
                              │
                    ┌─────────▼─────────┐
                    │  TRIANGULATION    │
                    │  3 sources        │
                    │  convergent ?     │
                    └─────────┬─────────┘
                              │
               ┌──────────────┴──────────────┐
               │                             │
         ┌─────▼─────┐                 ┌─────▼─────┐
         │ OUI = BON │                 │ NON =     │
         │ PROBLÈME  │                 │ PIVOTER   │
         └───────────┘                 └───────────┘
```

**Signaux d'alerte d'un "faux" problème** :

| Signal | Pourquoi c'est suspect |
|--------|------------------------|
| Seuls les "experts internes" le voient | Biais d'équipe, pas de validation terrain |
| Les utilisateurs disent "oui ce serait bien" | Politesse ≠ besoin réel |
| Pas de workaround existant | Si personne ne contourne, peut-être pas si douloureux |
| Concurrents inexistants | Soit océan bleu, soit pas de marché |

**Checklist "Est-ce le bon problème ?"** :

```markdown
☐ Au moins 15 interviews confirment ce problème
☐ Score de douleur moyen > 7/10
☐ Des alternatives/workarounds existent (preuve de besoin)
☐ Les données quanti confirment (analytics, support tickets)
☐ Les utilisateurs expliquent le problème avec leurs mots
☐ On peut quantifier l'impact business
☐ Le problème existe depuis un moment (pas une mode)
```

---

### 8.2 Quelles métriques utiliser pour suivre une phase Discovery ?

#### Réponse courte
Les métriques Discovery sont des **métriques d'apprentissage**, pas de performance produit. Elles mesurent la quantité et la qualité des insights générés, pas le business (le produit n'existe pas encore).

#### Développement

**Catégories de métriques Discovery** :

| Catégorie | Exemples | Pourquoi |
|-----------|----------|----------|
| **Volume d'apprentissage** | Interviews réalisées, tests conduits | Quantité de données collectées |
| **Qualité des insights** | Hypothèses validées/invalidées | Progression dans la certitude |
| **Couverture** | % de segments couverts | Représentativité |
| **Efficacité** | Temps par insight, coût par interview | Optimisation du processus |
| **Décision** | Go/No-Go tranché dans les temps | Output attendu |

**Métriques recommandées par phase** :

| Phase Discovery | Métrique clé | Cible type |
|-----------------|--------------|------------|
| **Problem Discovery** | Problèmes identifiés | 5-10 |
| | Interviews réalisées | 15-25 |
| | Score douleur moyen | > 7/10 |
| **Solution Discovery** | Solutions générées par problème | ≥ 3 |
| | Prototype testé | ≥ 1 |
| | Feedback positif tests | > 70% |
| **Validation** | Hypothèses validées | > 50% |
| | Willingness-to-pay confirmé | > 30% |
| | Décision Go/No-Go prise | Oui/Non |

**Ce qu'il ne faut PAS mesurer en Discovery** :

| Mauvaise métrique | Pourquoi |
|-------------------|----------|
| MRR, CA, GMV | Pas de produit = pas de revenus |
| NPS, satisfaction | Pas d'utilisateurs réels |
| Nombre de features | Discovery ≠ Delivery |
| Velocity (points) | Pas de backlog de dev |

**Dashboard Discovery type** :

```
┌─────────────────────────────────────────────────────────────────┐
│  DISCOVERY DASHBOARD - Semaine 4/6                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  LEARNING VELOCITY                                              │
│  ┌──────────────┬──────────────┬──────────────┬──────────────┐ │
│  │ Interviews   │ Hypothèses   │ Problèmes    │ Solutions    │ │
│  │ réalisées    │ testées      │ validés      │ explorées    │ │
│  │   18/20      │    8/12      │    3/5       │    9/12      │ │
│  │   ████████   │   ██████░    │   █████░░    │   ███████░   │ │
│  │     90%      │     67%      │     60%      │     75%      │ │
│  └──────────────┴──────────────┴──────────────┴──────────────┘ │
│                                                                 │
│  CONFIANCE DANS LES HYPOTHÈSES                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ H1: Problème abandon compte  [████████████████░░░░] 80%  │   │
│  │ H2: Confiance paiement       [███████████░░░░░░░░░] 55%  │   │
│  │ H3: Frais livraison surprise [██████████████░░░░░░] 70%  │   │
│  │ H4: UVP claire               [████████░░░░░░░░░░░░] 40%  │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
│  PROCHAINES ACTIONS                                             │
│  • 2 interviews restantes (S5)                                  │
│  • Test prototype lundi (5 users)                               │
│  • Préparer deck Go/No-Go (S6)                                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

### 8.3 Comment articuler Discovery et Delivery dans une équipe Agile ?

#### Réponse courte
Discovery et Delivery doivent fonctionner en **parallèle**, pas en séquence. Pendant que l'équipe dev livre le sprint N, l'équipe discovery prépare le sprint N+2. Le backlog est alimenté par des opportunités validées, pas par des intuitions.

#### Développement

**Le modèle "Dual Track Agile"** :

```
┌─────────────────────────────────────────────────────────────────┐
│                      DUAL TRACK AGILE                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   DISCOVERY TRACK                    DELIVERY TRACK             │
│   (Opportunités)                     (Livraison)                │
│                                                                 │
│   ┌─────────┐                        ┌─────────┐               │
│   │ Idées   │                        │ Sprint  │               │
│   │ brutes  │                        │   N     │               │
│   └────┬────┘                        └────┬────┘               │
│        │                                  │                     │
│   ┌────▼────┐                        ┌────▼────┐               │
│   │Research │     Validated          │ Sprint  │               │
│   │& Test   │────Backlog────────────▶│  N+1    │               │
│   └────┬────┘                        └────┬────┘               │
│        │                                  │                     │
│   ┌────▼────┐                        ┌────▼────┐               │
│   │Prototype│     ◀────Learn─────────│ Sprint  │               │
│   │& Learn  │                        │  N+2    │               │
│   └─────────┘                        └─────────┘               │
│                                                                 │
│   Cycle: Continu                     Cycle: Sprints (2 sem)    │
│   Output: Opportunités validées      Output: Incréments        │
└─────────────────────────────────────────────────────────────────┘
```

**Rôles et responsabilités** :

| Rôle | Discovery | Delivery |
|------|-----------|----------|
| **Product Manager** | Lead, priorise les opportunités | Stakeholder, clarifie le "pourquoi" |
| **UX Designer** | Research, prototype | Design détaillé, specs |
| **Tech Lead** | Faisabilité, estimation haut niveau | Architecture, code review |
| **Développeurs** | Parfois en support (PoC) | Implémentation |
| **UX Researcher** | Lead recherche | Support (tests A/B) |

**Rituels recommandés** :

| Rituel | Fréquence | Participants | Objectif |
|--------|-----------|--------------|----------|
| **Discovery sync** | Hebdo | PM, Designer, Researcher | Avancement, prochains tests |
| **Discovery→Delivery handoff** | Bi-hebdo | PM, Tech Lead, Designer | Présenter opportunités validées |
| **Sprint planning** | Par sprint | Toute l'équipe | Sélectionner du backlog validé |
| **Research share** | Mensuel | Équipe + stakeholders | Diffuser les insights |

**Erreurs à éviter** :

| Erreur | Conséquence | Solution |
|--------|-------------|----------|
| Discovery puis Delivery (séquentiel) | Tunnel sans feedback | Dual track parallèle |
| Tout le monde fait Discovery | Plus personne ne livre | Rôles distincts |
| Pas de Discovery, juste Delivery | Features inutiles | Imposer ratio 20% Discovery |
| Discovery sans output actionnable | Insights perdus | Validated Backlog obligatoire |

---

### 8.4 Quelle est la durée idéale d'une phase Discovery ?

#### Réponse courte
Il n'y a pas de durée universelle. Une Discovery peut durer **2 semaines** (Design Sprint) à **3 mois** (nouveau marché complexe). La durée dépend de l'incertitude, de la complexité, et du risque. Visez le **minimum pour atteindre une confiance suffisante** pour décider.

#### Développement

**Facteurs influençant la durée** :

| Facteur | Durée courte (2-4 sem) | Durée longue (2-3 mois) |
|---------|------------------------|------------------------|
| **Incertitude** | Faible (amélioration existant) | Haute (nouveau marché) |
| **Complexité** | Simple (1 feature) | Complexe (nouveau produit) |
| **Risque** | Faible (réversible) | Élevé (gros investissement) |
| **Accès aux users** | Facile (clients existants) | Difficile (B2B, recrutement) |
| **Données existantes** | Riches (analytics, feedback) | Pauvres (nouveau segment) |

**Durées de référence** :

| Type de Discovery | Durée typique | Contexte |
|-------------------|---------------|----------|
| **Design Sprint** | 5 jours | Problème ciblé, équipe dédiée |
| **Feature Discovery** | 2-4 semaines | Amélioration produit existant |
| **New Product Discovery** | 6-12 semaines | Nouveau produit, marché connu |
| **New Market Discovery** | 2-3 mois | Nouveau marché, forte incertitude |
| **Continuous Discovery** | Ongoing | Pratique permanente |

**Comment savoir quand s'arrêter** :

```markdown
## CRITÈRES DE FIN DE DISCOVERY

☐ Problème validé avec confiance > 80%
☐ Solution testée avec feedback positif > 70%
☐ Hypothèses clés validées ou invalidées
☐ Risques majeurs identifiés et mitigables
☐ Décision Go/No-Go possible avec les données
☐ Équipe alignée sur la direction

Si 5/6 critères = STOP
Si < 4/6 = CONTINUER ou PIVOTER
```

**Anti-pattern : Discovery infinie** :

| Symptôme | Cause probable | Solution |
|----------|----------------|----------|
| "On veut encore plus de data" | Peur de décider | Fixer une deadline non négociable |
| "On explore une nouvelle piste" | Scope creep | Revenir au problème initial |
| "Les résultats ne sont pas clairs" | Mauvaises questions | Revoir la méthodologie |
| "Le marché change" | Excuse | Décider avec ce qu'on sait |

---

### 8.5 Comment gérer le handoff Discovery → Build ?

#### Réponse courte
Le handoff n'est pas un "lancer par-dessus le mur". C'est une **transition progressive** où l'équipe Build est impliquée avant la fin de la Discovery, et où l'équipe Discovery reste disponible pendant le début du Build.

#### Développement

**Le "handoff" traditionnel (anti-pattern)** :

```
Discovery ────────────────┐
                          │ 📦 Specs
                          ▼
                    Build ────────────────────

Problème : Context perdu, questions sans réponse
```

**Le modèle recommandé : Transition progressive** :

```
Discovery ───────────────────────┐
                      │          │
                   Overlap       │ Support
                      │          │
                      ▼          ▼
              Build ─────────────────────────

Avantage : Contexte partagé, questions traitées
```

**Checklist de handoff** :

```markdown
## HANDOFF DISCOVERY → BUILD

### LIVRABLES REQUIS
☐ Problem Statement validé
☐ Personas concernés
☐ Jobs-to-be-Done priorisés
☐ Solution retenue + justification
☐ Prototype testé + résultats
☐ Critères de succès (KPIs)
☐ Risques identifiés
☐ Out of scope documenté

### SESSIONS DE TRANSFERT
☐ Présentation insights (tous)
☐ Deep dive technique (tech lead)
☐ Walk-through prototype (designer→dev)
☐ Q&A avec l'équipe Build

### ACCÈS
☐ Research repository partagé
☐ Enregistrements interviews (si accord)
☐ Prototype interactif (Figma)
☐ Données analytics
```

**Artefacts de handoff par audience** :

| Audience | Artefact | Contenu clé |
|----------|----------|-------------|
| **Équipe complète** | Deck de synthèse | Problème, solution, why, tests |
| **Développeurs** | User stories + AC | Comportements attendus |
| **Designers** | Prototype annoté | Interactions, edge cases |
| **Tech Lead** | Technical brief | Contraintes, intégrations, risques |
| **Stakeholders** | Executive summary | Impact business, métriques |

**Période de support post-handoff** :

| Semaine | Disponibilité Discovery | Focus |
|---------|-------------------------|-------|
| S+1 | 50% | Questions, clarifications |
| S+2 | 25% | Arbitrages design |
| S+3 | 10% | Escalades seulement |
| S+4+ | On-demand | Changements scope majeurs |

---

### 8.6 Comment intégrer la Discovery dans une organisation qui n'en fait pas ?

#### Réponse courte
Commencez **petit** et **mesurez**. Un projet pilote réussi vaut mieux qu'une transformation massive qui échoue. Montrez les résultats (insights actionnables, features utiles, échecs évités) pour créer l'appétit.

#### Développement

**Stratégie d'adoption progressive** :

```
PHASE 1                 PHASE 2                 PHASE 3
Pilote (1 équipe)  →   Expansion (3 équipes) → Institutionnalisation
3 mois                  6 mois                  Ongoing

• 1 projet             • Playbook              • Training standard
• Champions            • Communauté            • Outils enterprise
• Quick wins           • Métriques             • KPIs org
```

**Comment convaincre les sceptiques** :

| Objection | Réponse | Preuve |
|-----------|---------|--------|
| "On n'a pas le temps" | Discovery évite de construire les mauvaises choses | Études : 70% des features non utilisées |
| "On connaît nos clients" | Validons cette hypothèse ensemble | Test avec 5 vrais utilisateurs |
| "Trop lent" | Design Sprint = 5 jours | Montrer un exemple |
| "Notre marché est différent" | Raison de plus pour valider | Risque = opportunité |

**Actions concrètes pour démarrer** :

```markdown
## PLAN D'ADOPTION - 90 JOURS

### SEMAINE 1-2 : Préparer
☐ Identifier un projet pilote (risqué mais pas critique)
☐ Recruter 1-2 champions (PM + Designer motivés)
☐ Définir les métriques de succès du pilote
☐ Obtenir le sponsorship d'un leader

### SEMAINE 3-8 : Exécuter le pilote
☐ Appliquer les méthodes Discovery sur le projet
☐ Documenter le processus et les résultats
☐ Collecter des quick wins (insights surprenants)
☐ Partager régulièrement les avancées

### SEMAINE 9-12 : Capitaliser
☐ Présenter les résultats (avant/après)
☐ Créer un mini-playbook basé sur le pilote
☐ Identifier les prochains projets candidats
☐ Former 2-3 nouvelles personnes

### MÉTRIQUES DE SUCCÈS DU PILOTE
- [ ] Décision Go/No-Go prise avec confiance
- [ ] Au moins 3 insights actionnables générés
- [ ] Équipe satisfaite du processus (NPS interne)
- [ ] 1 échec évité OU 1 opportunité identifiée
```

**Ce qui marche pour installer la culture** :

| Action | Impact |
|--------|--------|
| Inviter des stakeholders aux interviews | Ils "voient" les utilisateurs |
| Partager les verbatims marquants | Émotionnel > rationnel |
| Célébrer les "échecs utiles" | No-Go = succès si basé sur data |
| Créer une communauté de pratique | Entraide, standards |
| Former les PM et Designers | Compétences partagées |
| Inclure Discovery dans les OKRs | Ce qui est mesuré est fait |

---

---

# SECTION 9 : MÉTIERS ET COMPÉTENCES DE LA DISCOVERY

> *"The boundary spanners are gonna be our most valuable employees. When we can speak to multiple roles in our organization, it does increase our value."*
> — Teresa Torres

---

## 9.1 UX RESEARCHER

### 📗 Vulgarisation — L'Enquêteur de l'Expérience Utilisateur

**Définition simple** : L'UX Researcher est le "détective" des besoins utilisateurs. Son travail est de comprendre comment les gens pensent, ce qu'ils veulent, et pourquoi ils font ce qu'ils font quand ils utilisent un produit digital.

**Analogie** : Imaginez un anthropologue qui étudie une tribu. L'UX Researcher étudie les "tribus" d'utilisateurs — leurs habitudes, frustrations, et aspirations.

**Mission principale** :
1. **Découvrir** : Aller sur le terrain pour comprendre les vrais problèmes
2. **Analyser** : Transformer des observations en insights actionnables
3. **Communiquer** : Traduire la voix de l'utilisateur pour l'équipe

**Ce qu'il produit en Discovery** :
- Personas validés par la recherche
- Cartes de parcours utilisateur (Journey Maps)
- Rapports d'insights avec recommandations
- Verbatims et citations clés
- Synthèses de tests d'usabilité

**Qualités essentielles** :
- **Empathie** : Capacité à se mettre à la place des utilisateurs
- **Curiosité** : Poser les bonnes questions, creuser les "pourquoi"
- **Objectivité** : Rapporter ce qu'on observe, pas ce qu'on veut voir
- **Communication** : Raconter des histoires avec les données

### 📘 Approfondissement Expert — Compétences et Progression de Carrière

**Évolution de carrière UX Research** (Source : [NN/g](https://www.nngroup.com/articles/stages-of-ux-career-progression/) & [GitLab Handbook](https://handbook.gitlab.com/job-families/product/ux-researcher/)) :

```
┌─────────────────────────────────────────────────────────────────┐
│              PARCOURS CARRIÈRE UX RESEARCHER                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ENTRY LEVEL                                                    │
│  ├── Research Assistant                                         │
│  └── Junior UX Researcher                                       │
│      • Exécute des études supervisées                           │
│      • Maîtrise les méthodes de base                            │
│      • Apprend la synthèse et le reporting                      │
│                                                                 │
│  MID-LEVEL (50%+ des postes)                                    │
│  └── UX Researcher                                              │
│      • Mène des projets de recherche autonomes                  │
│      • Influence les décisions produit                          │
│      • Maîtrise plusieurs méthodes quali/quanti                 │
│                                                                 │
│  SENIOR LEVEL                                                   │
│  └── Senior UX Researcher                                       │
│      • Lead des initiatives de recherche majeures               │
│      • Mentor les juniors                                       │
│      • Contribue à la stratégie produit                         │
│                                                                 │
│  LEADERSHIP (IC Track)                                          │
│  ├── Staff UX Researcher (Grade 8)                              │
│  │   • Thought leader dans l'organisation                       │
│  │   • Identifie les insights "macro" cross-projets             │
│  │   • Triangulation de données complexes                       │
│  │                                                              │
│  └── Principal UX Researcher (Grade 9)                          │
│      • Influence les stakeholders seniors                       │
│      • Définit les standards de recherche                       │
│      • Deep empathic understanding systémique                   │
│                                                                 │
│  MANAGEMENT TRACK                                               │
│  ├── Research Manager                                           │
│  └── Director of UX Research                                    │
│      • Stratégie research de l'organisation                     │
│      • Budget et ressources                                     │
│      • Collaboration C-level                                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Évolution des méthodes par séniorité** (Source : [Drillbit Labs Analysis](https://depth.drillbitlabs.com/p/uxr-responsibilities-by-seniority)) :

| Méthode | Entry Level | Mid-Level | Senior | Principal |
|---------|-------------|-----------|--------|-----------|
| Interviews | 95% | 85% | 75% | 61% |
| Usability Testing | 90% | 80% | 70% | 55% |
| Surveys | 70% | 75% | 65% | 50% |
| Analytics | 30% | 50% | 60% | 70% |
| Strategic Research | 10% | 30% | 55% | 80% |
| Mentorship | 5% | 15% | 48% | 46% |

**Insight clé** : Plus on monte en séniorité, moins on utilise exclusivement les méthodes "core" — le toolkit s'élargit vers la recherche stratégique et le leadership.

**Compétences par catégorie** :

**Hard Skills** :
- Méthodes qualitatives : Interviews, ethnographie, diary studies
- Méthodes quantitatives : Surveys, A/B tests, analytics
- Synthèse : Affinity diagrams, thematic analysis
- Outils : UserZoom, Maze, Lookback, Dovetail, Hotjar

**Soft Skills** :
- Empathie active (écoute sans jugement)
- Storytelling (transformer data en narratif)
- Diplomatie (challenger sans braquer)
- Facilitation (workshops, sessions de restitution)

**Formation typique** :
- Bachelor en Psychologie, Sociologie, Anthropologie, HCI
- Master/PhD pour positions senior (Source : [UMass Bootcamp](https://bootcamp.umass.edu/blog/ui-ux/ux-researcher-job-description))
- Salaire US moyen : ~$120,000/an

### 📙 Application Pratique — UX Researcher en Discovery E-commerce

**CONTEXTE E-COMMERCE B2C**

```markdown
## SEMAINE TYPE D'UN UX RESEARCHER EN DISCOVERY

### LUNDI — Planification
- [ ] Sync avec le Product Trio (PM + Designer + Tech Lead)
- [ ] Définir les questions de recherche de la semaine
- [ ] Recruter participants via Respondent ou UserTesting

### MARDI — Terrain
- [ ] 4-5 interviews utilisateurs (45 min chacune)
- [ ] Notes en temps réel dans Dovetail
- [ ] Débrief rapide avec PM présent en observateur

### MERCREDI — Analyse
- [ ] Tagging et codage des verbatims
- [ ] Identification des patterns
- [ ] Première ébauche d'insights

### JEUDI — Synthèse
- [ ] Création de l'insight deck
- [ ] Mise à jour du Research Repository
- [ ] Préparation du playback stakeholders

### VENDREDI — Communication
- [ ] Session de restitution (30 min)
- [ ] Atelier co-design basé sur insights
- [ ] Priorisation des opportunités avec l'équipe
```

**ÉTUDE DE CAS : Discovery pour refonte parcours checkout**

```markdown
## BRIEF RECHERCHE

**Contexte** : Taux d'abandon panier de 73% (vs benchmark 69%)
**Hypothèse** : Friction non identifiée dans le checkout

**Questions de recherche** :
1. À quel moment précis les utilisateurs décrochent ?
2. Quelles sont leurs préoccupations à chaque étape ?
3. Qu'attendent-ils en termes de réassurance ?

---

## PLAN DE RECHERCHE (2 semaines)

### Semaine 1 : Compréhension
| Jour | Activité | Output |
|------|----------|--------|
| J1-2 | Analyse données analytics (funnel) | Points de drop identifiés |
| J3-4 | 8 interviews utilisateurs récents | Verbatims et pain points |
| J5 | Benchmark UX 5 concurrents | Best practices |

### Semaine 2 : Validation
| Jour | Activité | Output |
|------|----------|--------|
| J1-2 | Test d'usabilité (6 participants) | Vidéos + annotations |
| J3 | Survey cart abandoners (n=200) | Données quantitatives |
| J4 | Synthèse et recommandations | Insight report |
| J5 | Playback stakeholders | Décisions Go/No-Go |

---

## INSIGHTS TYPES DÉCOUVERTS

### Insight #1 — Anxiety de livraison
> "Je ne savais pas combien ça allait coûter la livraison
> avant d'arriver presque à la fin. Du coup j'ai abandonné."
> — Utilisateur 4, femme, 34 ans

**Pattern** : 5/8 participants mentionnent l'incertitude livraison
**Recommandation** : Afficher estimation livraison dès le panier

### Insight #2 — Confiance paiement
> "J'ai cherché le cadenas, les logos Visa... je les ai pas vus
> tout de suite, j'ai hésité."
> — Utilisateur 7, homme, 52 ans

**Pattern** : 4/8 participants cherchent des signaux de confiance
**Recommandation** : Renforcer éléments de réassurance visibles

### Insight #3 — Compte obligatoire
> "On me demandait de créer un compte. J'avais pas le temps,
> j'ai fermé la page."
> — Utilisateur 2, femme, 28 ans

**Pattern** : 6/8 ont exprimé frustration sur création compte
**Recommandation** : Guest checkout obligatoire
```

**TEMPLATE : Research Brief Discovery**

```markdown
# RESEARCH BRIEF — [Nom du projet]

## 1. CONTEXTE
**Projet** : [Nom]
**Phase** : Discovery
**Durée** : [X semaines]
**Researcher** : [Nom]
**Stakeholders** : [PM, Designer, Tech Lead]

## 2. OBJECTIFS
**Objectif principal** :
[Ce qu'on cherche à comprendre]

**Questions de recherche** :
1. [Question 1]
2. [Question 2]
3. [Question 3]

## 3. MÉTHODOLOGIE

### Participants
- **Profil** : [Description cible]
- **Nombre** : [N participants]
- **Critères inclusion** : [Liste]
- **Critères exclusion** : [Liste]
- **Recrutement** : [Méthode]

### Méthodes
| Méthode | Objectif | N | Durée |
|---------|----------|---|-------|
| [Méthode 1] | [Objectif] | [N] | [Durée] |

## 4. TIMELINE
| Semaine | Activités | Livrables |
|---------|-----------|-----------|
| S1 | [Activités] | [Outputs] |

## 5. LIVRABLES ATTENDUS
- [ ] [Livrable 1]
- [ ] [Livrable 2]

## 6. RISQUES & MITIGATION
| Risque | Probabilité | Mitigation |
|--------|-------------|------------|
| [Risque] | [H/M/L] | [Action] |

## 7. BUDGET
- Recrutement participants : [€]
- Incentives : [€]
- Outils : [€]
- **Total** : [€]
```

---

## 9.2 PRODUCT MANAGER EN DISCOVERY

### 📗 Vulgarisation — Le Chef d'Orchestre de la Discovery

**Définition simple** : Le Product Manager (PM) est responsable du "quoi" et du "pourquoi" d'un produit. En phase Discovery, il orchestre l'exploration pour identifier les bonnes opportunités à poursuivre.

**Rôle en Discovery vs Delivery** :
- **Discovery** : Trouver le bon problème à résoudre, valider les hypothèses
- **Delivery** : Construire la solution, gérer le backlog

**Les 3 questions du PM en Discovery** :
1. **Valeur** : Les utilisateurs veulent-ils ça ?
2. **Faisabilité** : Peut-on le construire ?
3. **Viabilité** : Est-ce bon pour le business ?

**Ce qu'il fait concrètement** :
- Définit les outcomes (résultats attendus)
- Priorise les opportunités
- Participe aux interviews utilisateurs
- Facilite les décisions avec les stakeholders
- Connecte la Discovery aux objectifs business

### 📘 Approfondissement Expert — Frameworks de Compétences PM

**Le Product Trio** (Source : [Teresa Torres, Product Talk](https://www.producttalk.org/))

Teresa Torres promeut le concept de "Product Trio" : PM + Designer + Tech Lead travaillent ensemble en Discovery, pas en silos.

```
┌──────────────────────────────────────────────────────┐
│                    PRODUCT TRIO                       │
│                                                       │
│    ┌───────────┐                                      │
│    │  PRODUCT  │                                      │
│    │  MANAGER  │  ← Viability (Business)             │
│    └─────┬─────┘                                      │
│          │                                            │
│          ▼                                            │
│    ┌─────────────────────────────┐                   │
│    │                             │                   │
│    │     SHARED DISCOVERY        │                   │
│    │     • Weekly customer       │                   │
│    │       interviews            │                   │
│    │     • Assumption testing    │                   │
│    │     • Opportunity mapping   │                   │
│    │                             │                   │
│    └─────────────────────────────┘                   │
│          │               │                           │
│          ▼               ▼                           │
│    ┌───────────┐   ┌───────────┐                    │
│    │ DESIGNER  │   │ TECH LEAD │                    │
│    └───────────┘   └───────────┘                    │
│         ↑               ↑                            │
│    Desirability    Feasibility                       │
│    (User)          (Technical)                       │
│                                                       │
└──────────────────────────────────────────────────────┘
```

**Continuous Discovery Habits** (Source : [Teresa Torres](https://www.amazon.com/Continuous-Discovery-Habits-Discover-Products/dp/1736633309))

Framework en 6 habitudes :
1. **Outcome-driven** : Commencer par un outcome clair
2. **Customer-centric** : Interviews hebdomadaires minimum
3. **Collaborative** : Le Trio travaille ensemble
4. **Visual mapping** : Opportunity Solution Trees
5. **Assumption testing** : Valider avant de construire
6. **Iterative** : Cycles courts de découverte

**Frameworks de compétences PM** (Sources multiples) :

**1. Les 6 Core Competencies** (Source : [Beyond the Backlog](https://beyondthebacklog.com/2024/08/29/core-competencies-of-a-product-manager/)) :

| Compétence | Description | Application Discovery |
|------------|-------------|----------------------|
| Leadership | Inspirer sans autorité directe | Aligner stakeholders sur la vision |
| Business Acumen | Comprendre les leviers business | Évaluer viabilité des opportunités |
| Technical Knowledge | Comprendre les contraintes tech | Estimer faisabilité grossière |
| Design Sense | Apprécier l'UX/UI | Participer aux sessions design |
| Execution | Livrer des résultats | Mener la Discovery à terme |
| Personal Development | Apprentissage continu | Maîtriser nouvelles méthodes |

**2. Marty Cagan's SVPG Model** :

```
┌─────────────────────────────────────────────┐
│        COMPÉTENCES PM (SVPG)                │
├─────────────────────────────────────────────┤
│                                             │
│  PRODUCT                                    │
│  • Vision & Strategy                        │
│  • Customer understanding                   │
│  • Data fluency                             │
│  • Industry & Domain knowledge              │
│                                             │
│  PROCESS                                    │
│  • Discovery techniques                     │
│  • Delivery collaboration                   │
│  • Stakeholder management                   │
│  • Roadmapping                              │
│                                             │
│  PEOPLE                                     │
│  • Team leadership                          │
│  • Cross-functional collaboration           │
│  • Communication                            │
│  • Influence without authority              │
│                                             │
└─────────────────────────────────────────────┘
```

**3. Matrice de compétences Delibr** (Source : [Delibr](https://www.delibr.com/post/product-management-skills-a-competency-matrix)) :

Échelle 1-7 inspirée McKinsey :
- **Niveau 1** : Novice (suit les instructions)
- **Niveau 3** : Compétent (autonome sur les bases)
- **Niveau 5** : Expert (référent interne)
- **Niveau 7** : Master (référent industrie)

**Objectif PM** : Atteindre niveau 3 minimum partout, puis "spiker" à 5-7 dans 2-3 domaines.

### 📙 Application Pratique — PM en Discovery E-commerce

**JOURNÉE TYPE PM EN MODE DISCOVERY**

```markdown
## MATINÉE — Customer & Data

09:00-09:30 — Daily Discovery Sync (Product Trio)
  • Revue des learnings de la veille
  • Ajustement des hypothèses à tester
  • Planification de la journée

09:30-10:30 — Customer Interview (avec Designer)
  • 1 interview utilisateur programmée
  • PM observe, Designer mène
  • Notes partagées en temps réel

10:30-11:30 — Data Analysis
  • Revue des métriques clés
  • Analyse des données quali de la veille
  • Mise à jour de l'Opportunity Solution Tree

11:30-12:00 — Stakeholder 1:1
  • Sync avec un stakeholder clé
  • Partage des learnings
  • Collecte de contraintes business

## APRÈS-MIDI — Synthesis & Strategy

14:00-15:00 — Assumption Mapping Session (Trio)
  • Identifier les hypothèses risquées
  • Concevoir tests rapides
  • Prioriser ce qu'on valide cette semaine

15:00-16:00 — Solution Sketching
  • Brainstorm solutions possibles
  • Évaluation rapide (Valeur/Effort)
  • Sélection de 2-3 à prototyper

16:00-17:00 — Documentation & Prep
  • Mise à jour du PRD Discovery
  • Préparation présentation stakeholders
  • Planification interviews lendemain

17:00-17:30 — Réflexion & Learning
  • Qu'avons-nous appris aujourd'hui ?
  • Que devons-nous encore valider ?
  • Quels risques avons-nous réduits ?
```

**TEMPLATE : PRD Discovery Phase**

```markdown
# PRD DISCOVERY — [Nom de l'Opportunité]

## 1. CONTEXTE STRATÉGIQUE

### Outcome cible
**OKR associé** : [ex: Augmenter le taux de conversion de 2%]
**North Star impact** : [Contribution à la métrique principale]

### Pourquoi maintenant ?
- [Signal marché/utilisateur qui justifie l'urgence]
- [Coût de l'inaction]

## 2. COMPRÉHENSION DU PROBLÈME

### Problem Statement
**Pour** [segment utilisateur],
**qui** [contexte/situation],
**le problème est** [pain point principal],
**car actuellement** [solution actuelle insatisfaisante],
**ce qui entraîne** [impact négatif mesurable].

### Jobs-to-be-Done identifiés
| JTBD | Force | Validé ? |
|------|-------|----------|
| [Job 1] | Haute | ✅ |
| [Job 2] | Moyenne | ⏳ |

### Evidence accumulée
- [X] interviews utilisateurs (n=[N])
- [X] analyse data ([source])
- [X] benchmark concurrents ([N] analysés)

## 3. OPPORTUNITÉS IDENTIFIÉES

### Opportunity Solution Tree (résumé)

```
Outcome: [Outcome cible]
├── Opportunité 1: [Description]
│   ├── Solution A: [Brief]
│   └── Solution B: [Brief]
├── Opportunité 2: [Description]
│   └── Solution C: [Brief]
└── Opportunité 3: [Description]
    ├── Solution D: [Brief]
    └── Solution E: [Brief]
```

### Opportunité priorisée
**Opportunité retenue** : [Nom]
**Justification RICE** :
- Reach : [Score] — [Justification]
- Impact : [Score] — [Justification]
- Confidence : [Score] — [Justification]
- Effort : [Score] — [Justification]
- **RICE Score** : [Total]

## 4. HYPOTHÈSES & VALIDATION

### Hypothèses critiques

| Hypothèse | Type | Status | Test prévu |
|-----------|------|--------|------------|
| [Hyp 1] | Valeur | ✅ Validée | Interviews |
| [Hyp 2] | Faisabilité | ⏳ En cours | Spike tech |
| [Hyp 3] | Viabilité | ❓ À tester | Analyse financière |

### Résultats des tests
**Test 1** : [Nom]
- Méthode : [Description]
- Résultat : [Outcome]
- Décision : [Continue/Pivot/Kill]

## 5. RECOMMANDATION

### Go / No-Go
☐ **GO** — Procéder au Build avec [scope défini]
☐ **PIVOT** — Explorer [nouvelle direction]
☐ **KILL** — Abandonner cette opportunité

### Prochaines étapes
1. [Action 1] — Owner : [Nom] — Date : [Deadline]
2. [Action 2] — Owner : [Nom] — Date : [Deadline]

## 6. ANNEXES
- Lien Research Repository : [URL]
- Opportunity Solution Tree : [URL]
- Recordings interviews : [URL]
```

**CHECKLIST PM : DISCOVERY COMPLÈTE**

```markdown
## VALIDATION DISCOVERY — CHECKLIST PM

### Phase 1 : Compréhension (Semaine 1-2)
☐ Outcome clairement défini et aligné avec leadership
☐ Minimum 8 interviews utilisateurs réalisées
☐ Problem statement rédigé et validé par le Trio
☐ JTBD principaux identifiés
☐ Données quantitatives analysées

### Phase 2 : Exploration (Semaine 2-3)
☐ Opportunity Solution Tree créé
☐ Minimum 3 opportunités identifiées
☐ Benchmark concurrentiel complété
☐ Contraintes techniques et business documentées

### Phase 3 : Validation (Semaine 3-4)
☐ Hypothèses critiques listées et priorisées
☐ Tests de validation exécutés
☐ Prototypes testés avec utilisateurs
☐ Priorisation RICE/ICE effectuée

### Phase 4 : Décision (Semaine 4)
☐ Recommandation Go/No-Go préparée
☐ PRD Discovery complété
☐ Stakeholders alignés sur la décision
☐ Handoff Delivery préparé (si Go)
☐ Learnings documentés (si No-Go)

### Signaux de Discovery réussie
☐ Le Trio est confiant dans la direction choisie
☐ Les stakeholders comprennent le "pourquoi"
☐ Les risques majeurs ont été réduits
☐ L'équipe sait ce qu'elle va construire (et pourquoi pas le reste)
```

---

## 9.3 BUSINESS ANALYST EN DISCOVERY

### 📗 Vulgarisation — Le Traducteur Business-Tech

**Définition simple** : Le Business Analyst (BA) fait le pont entre les besoins métier et les équipes techniques. Il traduit les objectifs business en exigences que les développeurs peuvent comprendre et implémenter.

**Différence avec le Product Manager** :
- **PM** : "Quoi construire et pourquoi" (stratégique)
- **BA** : "Comment le spécifier pour que ce soit construit correctement" (tactique)

**Analogie** : Si le PM est l'architecte qui dessine la maison, le BA est le métreur qui détaille chaque mesure pour les ouvriers.

**Rôle spécifique en Discovery** :
- Analyser les processus métier existants
- Documenter les règles de gestion
- Modéliser les cas d'usage
- Identifier les dépendances systèmes
- Préparer les spécifications pour le Build

### 📘 Approfondissement Expert — BA vs PO vs PM

**Positionnement des rôles** (Sources : [IIBA](https://www.iiba.org/business-analysis-blogs/product-owner-vs-business-analyst/), [Scrum.org](https://www.scrum.org/forum/scrum-forum/42630/product-owner-vs-business-analyst)) :

```
┌───────────────────────────────────────────────────────────────┐
│              SPECTRUM DES RÔLES PRODUIT                       │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│   STRATÉGIQUE ◄──────────────────────────────► TACTIQUE      │
│                                                               │
│   ┌─────────────────┐                                        │
│   │ PRODUCT MANAGER │  • Vision long terme                   │
│   │                 │  • Stratégie produit                   │
│   │                 │  • Go-to-market                        │
│   │                 │  • P&L ownership                       │
│   └────────┬────────┘                                        │
│            │                                                  │
│            ▼                                                  │
│   ┌─────────────────┐                                        │
│   │  PRODUCT OWNER  │  • Backlog management                  │
│   │                 │  • Sprint priorities                   │
│   │                 │  • Acceptance criteria                 │
│   │                 │  • Voice of customer (court terme)     │
│   └────────┬────────┘                                        │
│            │                                                  │
│            ▼                                                  │
│   ┌─────────────────┐                                        │
│   │BUSINESS ANALYST │  • Analyse des besoins                 │
│   │                 │  • Spécifications détaillées           │
│   │                 │  • Règles métier                       │
│   │                 │  • Modélisation processus              │
│   └─────────────────┘                                        │
│                                                               │
│   BUSINESS SIDE ◄────────────────────────────► TECH SIDE     │
│                                                               │
└───────────────────────────────────────────────────────────────┘
```

**Comparaison détaillée** :

| Dimension | Product Manager | Product Owner | Business Analyst |
|-----------|-----------------|---------------|------------------|
| **Focus** | Vision & Stratégie | Exécution & Livraison | Analyse & Spécification |
| **Horizon** | Long terme (6-24 mois) | Court terme (1-3 sprints) | Projet/Feature |
| **Responsabilité** | ROI du produit | Valeur livrée par sprint | Qualité des specs |
| **Client principal** | Marché & Business | Équipe de dev | PM/PO & Dev |
| **Livrables** | Roadmap, Vision | Backlog, User Stories | BRD, Use Cases |
| **En Discovery** | Définit le "Quoi" | Prépare le "Comment livrer" | Détaille le "Comment ça marche" |

**Quand avoir un BA dédié ?** (Source : [Leobit](https://leobit.com/blog/business-analyst-vs-requirements-manager-vs-product-owner-comparing-roles-responsibilities-and-use-cases/))

```
┌───────────────────────────────────────────────────────────┐
│         QUAND UN BA EST CRITIQUE EN DISCOVERY             │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  ✅ BA NÉCESSAIRE                                         │
│  ─────────────────                                        │
│  • Domaine métier complexe (finance, santé, assurance)    │
│  • Systèmes legacy à intégrer                             │
│  • Règles de gestion nombreuses et subtiles               │
│  • Migration de données importante                        │
│  • Conformité réglementaire (RGPD, PCI-DSS)              │
│  • Plusieurs systèmes interdépendants                     │
│  • Processus métier à transformer                         │
│                                                           │
│  ❌ BA OPTIONNEL                                          │
│  ──────────────────                                       │
│  • Produit simple B2C grand public                        │
│  • Startup early-stage (PM fait tout)                     │
│  • Nouvelle feature isolée                                │
│  • Équipe très expérimentée sur le domaine                │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

**Évolution des rôles en contexte Agile** :

Dans certaines organisations, les frontières s'estompent :
- Le PO absorbe des tâches de BA (petites équipes)
- Le BA devient PO avec une expertise analysis
- Le PM cumule PO + BA (startups)

### 📙 Application Pratique — BA en Discovery E-commerce B2B

**CONTEXTE B2B** : Systèmes plus complexes, règles métier nombreuses, intégrations multiples

**CONTRIBUTION BA EN DISCOVERY**

```markdown
## LIVRABLES BA EN PHASE DISCOVERY

### 1. Analyse de l'Existant
```
┌─────────────────────────────────────────────┐
│         CARTOGRAPHIE AS-IS                  │
├─────────────────────────────────────────────┤
│                                             │
│  Systèmes concernés :                       │
│  ├── ERP (SAP) — Gestion commandes          │
│  ├── CRM (Salesforce) — Données clients     │
│  ├── WMS — Stock et logistique              │
│  └── Site E-commerce — Frontend             │
│                                             │
│  Flux de données :                          │
│  [Client] ──► [Site] ──► [ERP] ──► [WMS]   │
│                 │                           │
│                 ▼                           │
│              [CRM]                          │
│                                             │
│  Points de douleur identifiés :             │
│  • Sync stock non temps réel (délai 15min)  │
│  • Règles de prix complexes (pas documentées)│
│  • Historique commandes fragmenté           │
│                                             │
└─────────────────────────────────────────────┘
```

### 2. Documentation des Règles Métier

```markdown
## CATALOGUE RÈGLES MÉTIER — Prix B2B

### RG-001 : Calcul prix client
**Description** : Le prix affiché dépend du segment client
**Logique** :
  SI client.segment = "Gold" ALORS prix = prix_base * 0.85
  SI client.segment = "Silver" ALORS prix = prix_base * 0.90
  SI client.segment = "Bronze" ALORS prix = prix_base * 0.95
  SINON prix = prix_base

**Source** : Direction Commerciale
**Validé par** : [Nom] le [Date]
**Systèmes impactés** : Site E-commerce, ERP

---

### RG-002 : Seuil franco de port
**Description** : Livraison gratuite selon montant commande
**Logique** :
  SI commande.total >= 500€ ET client.pays = "FR"
  ALORS frais_livraison = 0

**Exceptions** :
  - Produits volumineux : toujours facturés
  - Livraison express : supplément appliqué

**Source** : Service Logistique
**Validé par** : [Nom] le [Date]
```

### 3. Use Cases Discovery

```markdown
## USE CASE : UC-001 — Commande avec négociation prix

**Acteurs** : Acheteur B2B, Commercial, Système

**Préconditions** :
- Acheteur connecté avec compte entreprise
- Panier contient au moins 1 produit

**Scénario principal** :
1. Acheteur consulte son panier
2. Système affiche prix catalogue avec remise segment
3. Acheteur demande un devis personnalisé
4. Commercial reçoit notification
5. Commercial analyse historique et volume
6. Commercial propose prix négocié
7. Acheteur accepte ou contre-propose
8. [Boucle négociation jusqu'à accord]
9. Prix négocié appliqué au panier
10. Acheteur finalise commande

**Extensions** :
3a. Produit éligible prix automatique :
    3a.1 Système calcule remise volume
    3a.2 Retour étape 9 (sans intervention commercial)

5a. Commercial indisponible :
    5a.1 Système notifie backup commercial
    5a.2 SLA : réponse sous 4h ouvrées

**Postconditions** :
- Commande créée avec prix validé
- Historique négociation archivé
- CRM mis à jour
```

### 4. Matrice de Traçabilité

```markdown
## MATRICE TRAÇABILITÉ — Discovery → Build

| Besoin Business | Règle Métier | User Story | Test Acceptance |
|-----------------|--------------|------------|-----------------|
| Pricing segment | RG-001 | US-042 | TA-042-001 |
| Franco de port | RG-002 | US-043 | TA-043-001 |
| Négociation prix | RG-003 | US-044, US-045 | TA-044-001 |
| Sync stock temps réel | RG-010 | US-050 | TA-050-001 |

**Légende** :
- US : User Story
- TA : Test Acceptance
- RG : Règle de Gestion
```

**TEMPLATE : Document Analyse Besoin (BRD Light)**

```markdown
# BUSINESS REQUIREMENTS DOCUMENT (BRD)
## [Nom de l'initiative] — Phase Discovery

### 1. RÉSUMÉ EXÉCUTIF
**Contexte** : [Situation actuelle]
**Problème** : [Pain point business]
**Opportunité** : [Bénéfice attendu]
**Périmètre** : [In scope / Out of scope]

### 2. STAKEHOLDERS
| Rôle | Nom | Département | Implication |
|------|-----|-------------|-------------|
| Sponsor | [Nom] | [Dept] | Décisionnaire |
| SME Métier | [Nom] | [Dept] | Expert processus |
| IT Owner | [Nom] | [Dept] | Faisabilité tech |

### 3. SITUATION ACTUELLE (AS-IS)

#### 3.1 Processus existant
[Diagramme BPMN ou description]

#### 3.2 Systèmes impliqués
| Système | Fonction | Criticité |
|---------|----------|-----------|
| [Sys 1] | [Fonction] | Haute |

#### 3.3 Pain points documentés
1. [Pain 1] — Impact : [€/temps]
2. [Pain 2] — Impact : [€/temps]

### 4. BESOINS IDENTIFIÉS

#### 4.1 Besoins fonctionnels
| ID | Besoin | Priorité | Source |
|----|--------|----------|--------|
| BF-001 | [Description] | Must | [Stakeholder] |
| BF-002 | [Description] | Should | [Interview] |

#### 4.2 Besoins non-fonctionnels
| ID | Besoin | Cible |
|----|--------|-------|
| BNF-001 | Performance | < 2s temps réponse |
| BNF-002 | Disponibilité | 99.5% uptime |

### 5. RÈGLES MÉTIER
[Référence au catalogue RG]

### 6. CONTRAINTES
- Techniques : [Liste]
- Réglementaires : [Liste]
- Budget : [Enveloppe]
- Timeline : [Deadline business]

### 7. CRITÈRES DE SUCCÈS
| KPI | Baseline | Cible | Méthode mesure |
|-----|----------|-------|----------------|
| [KPI 1] | [Actuel] | [Objectif] | [Comment] |

### 8. RISQUES DISCOVERY
| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| [Risque 1] | [H/M/L] | [H/M/L] | [Action] |

### 9. PROCHAINES ÉTAPES
☐ [Action 1] — [Owner] — [Date]
☐ [Action 2] — [Owner] — [Date]

---
**Document version** : 1.0
**Auteur** : [Nom BA]
**Date** : [Date]
**Statut** : Draft / Review / Approved
```

---

## 9.4 COLLABORATION INTER-RÔLES EN DISCOVERY

### 📗 Vulgarisation — L'Équipe Discovery

**Pourquoi plusieurs rôles ?**

Chaque rôle apporte une perspective unique :
- **UX Researcher** : "Voici ce que les utilisateurs ressentent et font"
- **Product Manager** : "Voici pourquoi c'est stratégique pour le business"
- **Business Analyst** : "Voici comment ça fonctionne dans le détail"
- **Designer** : "Voici à quoi ça pourrait ressembler"
- **Tech Lead** : "Voici ce qui est techniquement possible"

**Le risque des silos** : Si chacun travaille dans son coin, on obtient :
- Des solutions déconnectées des vrais besoins
- Des spécifications impossibles à implémenter
- Des designs qui ne tiennent pas compte des contraintes

**La solution** : Le Product Trio (minimum) ou l'équipe Discovery (optimum) travaille **ensemble**, pas en séquence.

### 📘 Approfondissement Expert — Modèles de Collaboration

**RACI Discovery** (Source : [Atlassian](https://www.atlassian.com/team-playbook/plays/raci))

```
┌──────────────────────────────────────────────────────────────────────┐
│                    RACI MATRICE — ACTIVITÉS DISCOVERY                │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  R = Responsible (fait)    A = Accountable (décide)                 │
│  C = Consulted (avis)      I = Informed (informé)                   │
│                                                                      │
│  Activité                   PM    UXR   BA    Design  Tech Lead     │
│  ─────────────────────────  ────  ────  ────  ──────  ─────────     │
│  Définir les outcomes       A/R    C     C      C        C          │
│  Conduire interviews         C    A/R    C      R        I          │
│  Analyser data quanti        R     C     R      I        C          │
│  Documenter règles métier    C     I    A/R     I        C          │
│  Créer personas              C    A/R    C      R        I          │
│  Mapper opportunités        A/R    R     C      R        C          │
│  Évaluer faisabilité         C     I     C      C       A/R         │
│  Prototyper solutions        C     C     I     A/R       C          │
│  Tester prototypes           C    A/R    I      R        I          │
│  Décision Go/No-Go          A/R    C     C      C        C          │
│  Préparer handoff Build      R     I    A/R     R        R          │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

**Modèle de réunions Discovery** :

```markdown
## RITUELS DISCOVERY — CADENCE RECOMMANDÉE

### QUOTIDIEN — Discovery Standup (15 min)
**Participants** : Product Trio
**Objectif** : Sync sur les learnings et blocages
**Format** :
  - Qu'avons-nous appris hier ?
  - Que validons-nous aujourd'hui ?
  - Qu'est-ce qui nous bloque ?

### HEBDOMADAIRE — Discovery Review (1h)
**Participants** : Trio + Stakeholders clés
**Objectif** : Partager les avancées et ajuster la direction
**Format** :
  - Résumé des insights (15 min)
  - Mise à jour Opportunity Tree (15 min)
  - Décisions à prendre (15 min)
  - Planning semaine suivante (15 min)

### BI-HEBDOMADAIRE — Customer Interview Session (2h)
**Participants** : Trio (tous présents, UXR mène)
**Objectif** : Rester connecté aux utilisateurs
**Format** :
  - 2-3 interviews de 30-45 min
  - Débrief collectif immédiat (30 min)

### MENSUEL — Discovery Retrospective (1h30)
**Participants** : Équipe Discovery complète
**Objectif** : Améliorer notre processus Discovery
**Format** :
  - What worked well ?
  - What didn't work ?
  - What should we try ?
```

**Facilitation Design Thinking** (Source : [Voltage Control](https://voltagecontrol.com/blog/design-thinking-facilitator-guide-a-crash-course-in-the-basics/))

Compétences clés du facilitateur Discovery :

```
┌─────────────────────────────────────────────────────────────┐
│           COMPÉTENCES FACILITATEUR DISCOVERY                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  CRÉER L'ENVIRONNEMENT                                      │
│  • Espace psychologiquement safe                            │
│  • Encourager la créativité                                 │
│  • Gérer les dynamiques de groupe                           │
│  • Équilibrer les voix (introvertis/extravertis)           │
│                                                             │
│  GUIDER LE PROCESSUS                                        │
│  • Clarifier les objectifs                                  │
│  • Cadencer les activités (divergence/convergence)          │
│  • Maintenir le focus sans brider                           │
│  • Synthétiser en temps réel                                │
│                                                             │
│  OUTILS & TECHNIQUES                                        │
│  • Icebreakers et energizers                                │
│  • Techniques de brainstorming (Crazy 8s, etc.)            │
│  • Dot voting et priorisation                               │
│  • Timeboxing strict                                        │
│                                                             │
│  GESTION DES CONFLITS                                       │
│  • Redirecter les HiPPOs diplomatiquement                   │
│  • Challenger sans braquer                                  │
│  • Trouver le consensus ou clarifier le désaccord           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 📙 Application Pratique — Workshop Discovery Cross-fonctionnel

**TEMPLATE : Atelier Discovery Kick-off**

```markdown
# WORKSHOP DISCOVERY KICK-OFF
## [Nom du projet] — [Date]

### INFORMATIONS PRATIQUES
**Durée** : 3 heures
**Participants** : 7-12 personnes max
**Facilitateur** : [Nom]
**Lieu** : [Présentiel/Remote + outil]

### MATÉRIEL NÉCESSAIRE
- Post-its (4 couleurs)
- Marqueurs
- Tableaux blancs / Miro board
- Timer visible
- Snacks et boissons

---

## AGENDA DÉTAILLÉ

### 00:00-00:15 — OUVERTURE (15 min)

**Icebreaker** (5 min)
"En un mot, qu'est-ce que 'Discovery' évoque pour vous ?"
[Tour de table rapide, post-its sur le mur]

**Contexte et objectifs** (10 min)
- Pourquoi cette Discovery ?
- Ce qu'on va produire aujourd'hui
- Règles du jeu (pas de laptop, on écoute, on ose)

---

### 00:15-00:45 — COMPRENDRE LE PROBLÈME (30 min)

**Activité 1 : Problem Statement Collaboratif** (20 min)

1. Chacun écrit sur post-it (5 min) :
   - Pour QUI ?
   - Quel PROBLÈME ?
   - POURQUOI c'est un problème ?

2. Regroupement et discussion (15 min)
   - Clustérisation par thèmes
   - Vote pour sélectionner le top 3

**Activité 2 : "5 Pourquoi" sur le problème #1** (10 min)
- Facilitateur guide l'exercice
- Documenter les insights

---

### 00:45-01:30 — CONNAÎTRE L'UTILISATEUR (45 min)

**Activité 3 : Proto-Persona** (25 min)

En 3 sous-groupes, créer un proto-persona :
- Groupe 1 : Utilisateur "power user"
- Groupe 2 : Utilisateur "novice"
- Groupe 3 : Utilisateur "edge case"

Template par groupe :
```
[Prénom fictif]
─────────────────
• Âge, contexte
• Objectifs
• Frustrations actuelles
• Citation type
```

**Restitution** (10 min)
- Chaque groupe présente (3 min)
- Questions/réactions (1 min)

**Activité 4 : Empathy Map Express** (10 min)
- Sur le persona prioritaire
- Think/Feel/Say/Do en mode flash

---

### 01:30-01:45 — PAUSE (15 min)

---

### 01:45-02:30 — EXPLORER LES OPPORTUNITÉS (45 min)

**Activité 5 : "How Might We" Storm** (15 min)

1. Chacun écrit 3-5 HMW basés sur les problèmes identifiés (5 min)
2. Affichage et lecture silencieuse (3 min)
3. Dot voting (2 votes par personne) (5 min)
4. Top 5 HMW sélectionnés (2 min)

**Activité 6 : Crazy 8s** (20 min)

Sur le HMW #1 :
1. Explication de l'exercice (2 min)
2. 8 idées en 8 minutes (8 min)
3. Partage et explication (8 min)
4. Vote pour les solutions prometteuses (2 min)

**Activité 7 : Effort/Impact Rapide** (10 min)
- Placer les idées retenues sur la matrice
- Identifier les "Quick Wins" et "Big Bets"

---

### 02:30-03:00 — PLANIFIER LA SUITE (30 min)

**Activité 8 : Assumption Mapping** (15 min)
- Lister les hypothèses derrière nos idées préférées
- Classifier : critique/non-critique, connue/inconnue
- Identifier le top 5 à valider en premier

**Next Steps** (10 min)
- Qui fait quoi cette semaine ?
- Prochaine session ?
- Besoins immédiats ?

**Clôture** (5 min)
- Un mot pour décrire le workshop
- Remerciements

---

## OUTPUTS ATTENDUS

À l'issue du workshop :
☐ Problem Statement aligné
☐ 2-3 Proto-personas
☐ Top 5 "How Might We"
☐ 3-5 idées solutions priorisées
☐ Liste d'hypothèses à valider
☐ Plan d'action semaine 1

## TEMPLATE COMPTE-RENDU

[À envoyer sous 24h aux participants]
```

**MATRICE DE COMPÉTENCES ÉQUIPE DISCOVERY**

```markdown
## SKILLS MATRIX — ÉQUIPE DISCOVERY E-COMMERCE

### Évaluation (1-5)
1 = Novice | 2 = Basique | 3 = Compétent | 4 = Avancé | 5 = Expert

| Compétence | PM | UXR | BA | Designer | Tech Lead | Gap ? |
|------------|-----|-----|-----|----------|-----------|-------|
| **Research** |||||
| Interviews quali | 3 | 5 | 2 | 3 | 1 | ✅ |
| Surveys quanti | 3 | 4 | 3 | 2 | 2 | ✅ |
| Data analytics | 4 | 3 | 4 | 2 | 3 | ✅ |
| **Analysis** |||||
| Problem framing | 4 | 3 | 3 | 3 | 2 | ✅ |
| Business modeling | 5 | 2 | 4 | 2 | 2 | ✅ |
| Process mapping | 3 | 2 | 5 | 2 | 3 | ✅ |
| **Creation** |||||
| Prototyping | 2 | 2 | 1 | 5 | 2 | ✅ |
| User stories | 4 | 2 | 5 | 2 | 3 | ✅ |
| Documentation | 3 | 4 | 5 | 3 | 3 | ✅ |
| **Soft Skills** |||||
| Facilitation | 4 | 3 | 3 | 4 | 2 | ✅ |
| Stakeholder mgmt | 5 | 2 | 3 | 2 | 2 | ⚠️ |
| Storytelling | 4 | 4 | 2 | 4 | 2 | ✅ |

### Gaps identifiés et plan d'action
| Gap | Action | Owner | Timeline |
|-----|--------|-------|----------|
| Tech Lead en interviews | Observer 3 sessions | UXR | Sprint 1-2 |
| BA en prototyping | Formation Figma basics | Designer | Sprint 2 |
| Stakeholder mgmt concentré sur PM | Impliquer UXR dans presentations | PM | Ongoing |
```

---

## 9.5 ÉVOLUTION DES RÔLES AVEC L'IA

### 📗 Vulgarisation — L'IA Change la Donne

**Ce qui change avec l'IA en 2024-2025** :

L'intelligence artificielle ne remplace pas les rôles Discovery, mais elle amplifie leurs capacités et modifie certaines tâches.

**Pour le UX Researcher** :
- 🤖 L'IA peut : Transcrire et coder des interviews automatiquement, identifier des patterns dans de grands volumes de feedback
- 👤 L'humain reste indispensable pour : L'empathie, l'interprétation nuancée, la conduite d'interview

**Pour le Product Manager** :
- 🤖 L'IA peut : Générer des drafts de PRD, analyser la concurrence, synthétiser des feedbacks
- 👤 L'humain reste indispensable pour : La vision stratégique, les décisions de priorisation, la navigation politique

**Pour le Business Analyst** :
- 🤖 L'IA peut : Générer des diagrammes de processus, détecter des incohérences dans les specs
- 👤 L'humain reste indispensable pour : Comprendre les nuances métier, négocier les compromis

**Le nouveau rôle** : Ces professionnels deviennent des "superviseurs d'IA" qui savent :
- Prompter efficacement
- Valider et corriger les outputs IA
- Combiner intelligence humaine et artificielle

### 📘 Approfondissement Expert — Impact IA sur les Compétences

**Évolution des compétences UX Research avec l'IA** (Source : [UXArmy](https://uxarmy.com/blog/ux-researcher-role-ai/)) :

```
┌─────────────────────────────────────────────────────────────────┐
│         ÉVOLUTION COMPÉTENCES UXR AVEC L'IA                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  COMPÉTENCES EN DÉCLIN (automatisables)                        │
│  ──────────────────────────────────────                        │
│  • Transcription manuelle d'interviews                          │
│  • Codage basique de données qualitatives                       │
│  • Création de rapports standards                               │
│  • Recrutement participants (partiellement)                     │
│                                                                 │
│  COMPÉTENCES STABLES (humaines fondamentales)                  │
│  ─────────────────────────────────────────────                 │
│  • Conduite d'interviews empathiques                            │
│  • Observation ethnographique                                   │
│  • Interprétation contextuelle des données                     │
│  • Communication et persuasion                                  │
│  • Éthique de la recherche                                      │
│                                                                 │
│  COMPÉTENCES ÉMERGENTES (amplifiées par l'IA)                  │
│  ───────────────────────────────────────────                   │
│  • Prompt engineering pour research                             │
│  • Validation critique des outputs IA                           │
│  • Mixed-methods à grande échelle                               │
│  • Research ops et automation                                   │
│  • Data storytelling augmenté                                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Outils IA pour la Discovery** :

| Catégorie | Outil | Usage Discovery |
|-----------|-------|-----------------|
| Transcription | Otter.ai, Grain | Interviews → texte |
| Analyse quali | Dovetail AI, Notably | Codage automatique |
| Synthèse | Claude, ChatGPT | Résumés et insights |
| Prototypage | Figma AI, Uizard | Maquettes rapides |
| Analyse concurrence | Crayon, Klue | Veille automatisée |
| User feedback | MonkeyLearn, Thematic | Analyse sentiment |

**Le "Human in the Loop" reste critique** :

```
┌───────────────────────────────────────────────────────────────┐
│                     WORKFLOW AI-AUGMENTÉ                      │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│   [Input brut]                                                │
│        │                                                      │
│        ▼                                                      │
│   ┌─────────────┐                                            │
│   │     IA      │  ← Traitement automatique                  │
│   │  Transcrit  │    (volume, vitesse)                       │
│   │   Classe    │                                            │
│   │  Suggère    │                                            │
│   └──────┬──────┘                                            │
│          │                                                    │
│          ▼                                                    │
│   ┌─────────────┐                                            │
│   │   HUMAIN    │  ← Validation critique                     │
│   │  Valide     │    (nuance, contexte)                      │
│   │ Interprète  │                                            │
│   │  Décide     │                                            │
│   └──────┬──────┘                                            │
│          │                                                    │
│          ▼                                                    │
│   [Output vérifié]                                            │
│                                                               │
└───────────────────────────────────────────────────────────────┘
```

### 📙 Application Pratique — Intégrer l'IA dans la Discovery E-commerce

**WORKFLOW : Interview Analysis avec IA**

```markdown
## PROCESS : Analyse Interviews Augmentée par IA

### ÉTAPE 1 : Conduite (100% humain)
- UX Researcher mène l'interview
- Enregistrement vidéo/audio
- Notes de terrain en temps réel

### ÉTAPE 2 : Transcription (90% IA)
**Outil** : Otter.ai ou Grain
**Action** : Upload automatique post-interview
**Humain** : Vérifier noms propres et termes métier

### ÉTAPE 3 : Codage initial (70% IA)
**Outil** : Dovetail AI
**Prompt type** :
"Identifie et catégorise les thèmes principaux
dans cette interview. Classe par:
- Pain points exprimés
- Besoins non satisfaits
- Moments de satisfaction
- Suggestions d'amélioration"

**Humain** : Valider les tags, ajouter nuances

### ÉTAPE 4 : Synthèse (50% IA + 50% humain)
**Outil** : Claude ou ChatGPT
**Prompt type** :
"À partir de ces 8 interviews codées, génère:
1. Les 5 insights principaux avec verbatims
2. Les contradictions ou tensions observées
3. Les hypothèses à valider
Format: Insight + Evidence + Implication"

**Humain** :
- Vérifier exactitude des citations
- Ajouter contexte et nuances
- Challenger les conclusions IA
- Rédiger la version finale

### ÉTAPE 5 : Communication (80% humain)
- Création du narrative (humain)
- Slides et visualisations (humain + IA design)
- Présentation et Q&A (100% humain)

---

## RÈGLES D'UTILISATION IA EN RESEARCH

### ✅ FAIRE
- Utiliser l'IA pour les tâches répétitives
- Toujours vérifier les outputs IA
- Documenter l'usage d'IA dans la méthodologie
- Garder les données brutes accessibles

### ❌ NE PAS FAIRE
- Laisser l'IA conduire des interviews
- Accepter les synthèses IA sans validation
- Partager des données sensibles avec des IA cloud
- Remplacer l'interprétation humaine par l'IA
```

**PROMPT TEMPLATES POUR DISCOVERY**

```markdown
## PROMPTS IA — PHASE DISCOVERY

### Prompt 1 : Analyse Concurrentielle
```
Analyse les 5 concurrents suivants pour [produit]:
[Liste concurrents]

Pour chaque concurrent, identifie:
1. Proposition de valeur principale
2. Forces et faiblesses UX
3. Pricing et positionnement
4. Fonctionnalités différenciantes

Format: Tableau comparatif + analyse SWOT consolidée
```

### Prompt 2 : Extraction Insights Feedback
```
Voici [N] avis clients de notre plateforme e-commerce.
[Coller les avis]

Analyse ces avis et génère:
1. Top 5 pain points (avec fréquence)
2. Top 5 points de satisfaction
3. Fonctionnalités les plus demandées
4. Segments utilisateurs identifiables
5. Verbatims les plus représentatifs (exactement comme écrits)

Important: Ne paraphrase pas les citations, utilise les mots exacts.
```

### Prompt 3 : Draft Problem Statement
```
Contexte: [Description du projet]
Données disponibles:
- [Data point 1]
- [Data point 2]
- [Interview insight]

Génère 3 versions de Problem Statement au format:
"Pour [utilisateur], qui [situation], le problème est [pain],
car [cause], ce qui entraîne [impact]."

Classe par niveau de spécificité (large → précis).
```

### Prompt 4 : HMW Brainstorming
```
Problem Statement: [Coller le problem statement]

Génère 10 questions "How Might We" (Comment pourrions-nous):
- 3 centrées sur le problème racine
- 3 centrées sur l'expérience utilisateur
- 2 centrées sur l'innovation business
- 2 "moonshots" créatifs

Assure-toi que chaque HMW est:
- Assez large pour permettre des solutions variées
- Assez précis pour être actionnable
```
```

---

---

# ANNEXES

---

## ANNEXE A : CHECKLISTS DISCOVERY

### A.1 CHECKLIST COMPLÈTE — PHASE DISCOVERY

```markdown
# ✅ DISCOVERY CHECKLIST — VERSION COMPLÈTE

## PHASE 0 : PRÉPARATION (Avant de commencer)

### Alignement organisationnel
☐ Sponsor identifié et engagé
☐ Budget Discovery approuvé
☐ Équipe Discovery constituée (Trio minimum)
☐ Timeline définie et communiquée
☐ Critères de succès/échec établis

### Cadrage initial
☐ Brief projet reçu et compris
☐ Contexte business documenté
☐ Contraintes connues listées
☐ Outcome attendu clarifié avec stakeholders
☐ Périmètre initial défini (in/out of scope)

---

## PHASE 1 : COMPRENDRE (Semaines 1-2)

### Identification du problème
☐ Problem Statement rédigé (format structuré)
☐ "5 Pourquoi" effectué sur le problème
☐ HMW questions générées (minimum 5)
☐ Hypothèses initiales listées
☐ Métriques de succès définies

### Données existantes
☐ Analytics existantes analysées
☐ Études précédentes consultées
☐ Feedback clients compilé
☐ Données ventes/support examinées
☐ NPS/CSAT existants revus

### Recherche utilisateur initiale
☐ Personas hypothétiques créés
☐ Segments cibles identifiés
☐ Plan de recrutement établi
☐ Guide d'interview rédigé
☐ Minimum 8 interviews conduites

### Marché et concurrence
☐ Benchmark concurrentiel réalisé (5+ acteurs)
☐ TAM/SAM/SOM estimés
☐ Tendances marché identifiées
☐ Porter's 5 Forces analysé
☐ PESTEL complété (si pertinent)

---

## PHASE 2 : EXPLORER (Semaines 2-3)

### Synthèse Research
☐ Personas validés par la recherche
☐ Empathy Maps créées
☐ Journey Maps documentées
☐ Jobs-to-be-Done identifiés
☐ Insights clés synthétisés et partagés

### Opportunités
☐ Opportunity Solution Tree créé
☐ Minimum 3 opportunités identifiées
☐ Opportunités priorisées (RICE/ICE)
☐ Opportunité lead sélectionnée
☐ Hypothèses critiques par opportunité

### Vision produit
☐ Product Vision Board complété
☐ Value Proposition Canvas rempli
☐ North Star Metric définie
☐ Lean Canvas ou BMC créé
☐ OKRs Discovery alignés

---

## PHASE 3 : VALIDER (Semaines 3-4)

### Tests de validation
☐ Assumption Map créée
☐ Hypothèses critiques priorisées
☐ Tests de validation conçus
☐ Prototypes/maquettes créés
☐ Tests conduits (minimum 5 users)
☐ Résultats documentés

### Faisabilité
☐ Spike technique réalisé (si nécessaire)
☐ Contraintes techniques documentées
☐ Estimation effort grossière
☐ Dépendances identifiées
☐ Risques techniques évalués

### Viabilité
☐ Business case esquissé
☐ ROI estimé
☐ Contraintes budget clarifiées
☐ Alignement stratégique validé
☐ Stakeholders alignés

---

## PHASE 4 : DÉCIDER (Fin Semaine 4)

### Synthèse finale
☐ PRD Discovery complété
☐ Recommandation Go/No-Go préparée
☐ Evidence compilée et structurée
☐ Présentation stakeholders prête
☐ Questions anticipées préparées

### Décision
☐ Session Go/No-Go tenue
☐ Décision documentée avec rationale
☐ Next steps définis
☐ Owners assignés
☐ Timeline Build établie (si Go)

### Handoff (si Go)
☐ Specs Discovery transférées
☐ Research Repository accessible
☐ Équipe Build briefée
☐ Critères d'acceptance définis
☐ Plan de mesure établi

---

## DOCUMENTATION FINALE

☐ Tous les artifacts archivés
☐ Learnings documentés
☐ Research Repository à jour
☐ Retrospective Discovery tenue
☐ Améliorations process identifiées
```

### A.2 CHECKLIST RAPIDE — DISCOVERY EXPRESS (1-2 semaines)

```markdown
# ⚡ DISCOVERY EXPRESS — CHECKLIST MINIMUM

Pour les initiatives urgentes ou à faible risque.
Durée : 5-10 jours.

## JOUR 1-2 : CADRAGE
☐ Problem Statement rédigé
☐ 3-5 hypothèses listées
☐ Stakeholder principal aligné
☐ 5 interviews programmées

## JOUR 3-5 : RECHERCHE
☐ 5 interviews conduites
☐ Analytics clés analysées
☐ 2-3 concurrents benchmarkés
☐ Insights synthétisés

## JOUR 6-8 : VALIDATION
☐ Solution esquissée
☐ 3 tests utilisateurs rapides
☐ Hypothèse #1 validée/invalidée
☐ Ajustements effectués

## JOUR 9-10 : DÉCISION
☐ Recommandation préparée
☐ Go/No-Go décidé
☐ Next steps documentés

## CRITÈRES POUR UTILISER CE FORMAT
✅ Initiative à faible risque
✅ Domaine bien connu de l'équipe
✅ Pas de changement majeur d'architecture
✅ Budget limité
❌ Ne pas utiliser pour des nouveaux produits
❌ Ne pas utiliser pour des pivots stratégiques
```

### A.3 CHECKLIST INTERVIEW UTILISATEUR

```markdown
# 🎤 CHECKLIST INTERVIEW UTILISATEUR

## AVANT L'INTERVIEW

### Préparation
☐ Objectifs de l'interview clarifiés
☐ Guide d'interview rédigé
☐ Questions ouvertes préparées
☐ Participant recruté et confirmé
☐ Incentive prévu (si applicable)

### Logistique
☐ Lieu/lien visio confirmé
☐ Consentement enregistrement préparé
☐ Matériel testé (audio/vidéo)
☐ Observateur(s) confirmé(s)
☐ Template de notes prêt

---

## PENDANT L'INTERVIEW

### Ouverture (5 min)
☐ Présentations faites
☐ Contexte expliqué
☐ Consentement obtenu
☐ Questions du participant adressées
☐ Participant mis à l'aise

### Corps (35-45 min)
☐ Questions contextuelles posées
☐ Comportements explorés (pas opinions)
☐ "Pourquoi" demandé à chaque réponse
☐ Silences respectés (laisser réfléchir)
☐ Approfondissements sur surprises
☐ Notes prises en temps réel

### Clôture (5-10 min)
☐ "Autre chose à ajouter ?"
☐ Remerciements exprimés
☐ Prochaines étapes expliquées
☐ Incentive fourni
☐ Possibilité de recontacter demandée

---

## APRÈS L'INTERVIEW

### Immédiat (< 1 heure)
☐ Top 3 insights notés à chaud
☐ Citations clés surlignées
☐ Questions de suivi listées
☐ Débrief avec observateur(s)

### Traitement (< 24 heures)
☐ Notes mises au propre
☐ Tags/codes appliqués
☐ Verbatims extraits
☐ Ajout au Research Repository
☐ Guide d'interview ajusté si besoin
```

---

## ANNEXE B : QUICK REFERENCE CARDS

### B.1 FRAMEWORKS EN UN COUP D'ŒIL

```
┌─────────────────────────────────────────────────────────────────┐
│                    QUICK REFERENCE — FRAMEWORKS                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PROBLEM STATEMENT                                              │
│  ────────────────────────────────────────────                  │
│  "Pour [utilisateur], qui [contexte],                          │
│   le problème est [pain],                                       │
│   car [cause],                                                  │
│   ce qui entraîne [impact]."                                   │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  JOBS-TO-BE-DONE                                                │
│  ────────────────────────────────────────────                  │
│  "Quand [situation],                                           │
│   je veux [motivation],                                         │
│   pour que [outcome attendu]."                                 │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  HOW MIGHT WE                                                   │
│  ────────────────────────────────────────────                  │
│  "Comment pourrions-nous [action positive]                     │
│   pour [utilisateur]                                           │
│   afin de [bénéfice] ?"                                        │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PRODUCT VISION BOARD (Roman Pichler)                          │
│  ────────────────────────────────────────────                  │
│  ┌─────────────────────────────────────────┐                   │
│  │             VISION                       │                   │
│  ├──────────┬──────────┬──────────┬────────┤                   │
│  │ Target   │ Needs    │ Product  │ Business│                   │
│  │ Group    │          │          │ Goals   │                   │
│  └──────────┴──────────┴──────────┴────────┘                   │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  RICE SCORING                                                   │
│  ────────────────────────────────────────────                  │
│  Score = (Reach × Impact × Confidence) / Effort                │
│                                                                 │
│  Reach: # users impactés (ex: 1000/quarter)                    │
│  Impact: 0.25=minimal, 0.5=low, 1=medium, 2=high, 3=massive   │
│  Confidence: 0-100% (basé sur evidence)                        │
│  Effort: # person-months                                       │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ICE SCORING                                                    │
│  ────────────────────────────────────────────                  │
│  Score = Impact + Confidence + Ease                            │
│                                                                 │
│  Chaque dimension: 1-10                                        │
│  Simple mais moins rigoureux que RICE                          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### B.2 QUESTIONS TYPES INTERVIEW

```
┌─────────────────────────────────────────────────────────────────┐
│              QUESTIONS TYPES — INTERVIEWS DISCOVERY              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  CONTEXTE & BACKGROUND                                          │
│  ─────────────────────                                          │
│  • "Parlez-moi de votre rôle au quotidien..."                  │
│  • "Décrivez une journée type quand vous [activité]..."        │
│  • "Depuis combien de temps [activité] ?"                      │
│                                                                 │
│  COMPORTEMENTS (pas opinions)                                   │
│  ─────────────────────────────                                  │
│  • "La dernière fois que vous avez [activité], que s'est-il    │
│    passé exactement ?"                                         │
│  • "Montrez-moi comment vous faites [tâche] habituellement"    │
│  • "Qu'avez-vous fait ensuite ?"                               │
│                                                                 │
│  PROBLÈMES & FRUSTRATIONS                                       │
│  ─────────────────────────                                      │
│  • "Qu'est-ce qui vous frustre le plus quand [activité] ?"    │
│  • "Si vous pouviez changer une seule chose..."                │
│  • "Qu'est-ce qui prend le plus de temps ?"                    │
│                                                                 │
│  SOLUTIONS ACTUELLES                                            │
│  ──────────────────────                                         │
│  • "Comment vous y prenez-vous actuellement pour [problème] ?" │
│  • "Avez-vous essayé d'autres solutions ?"                     │
│  • "Qu'est-ce qui ne marche pas avec [solution actuelle] ?"   │
│                                                                 │
│  APPROFONDISSEMENT                                              │
│  ─────────────────────                                          │
│  • "Pourquoi ?" (x5)                                           │
│  • "Pouvez-vous me donner un exemple concret ?"                │
│  • "Qu'entendez-vous par [terme utilisé] ?"                    │
│  • "C'était quand la dernière fois ?"                          │
│                                                                 │
│  CLÔTURE                                                        │
│  ─────────                                                      │
│  • "Y a-t-il autre chose que je n'ai pas demandé ?"           │
│  • "Si vous aviez une baguette magique..."                     │
│  • "Qui d'autre devrais-je interviewer ?"                      │
│                                                                 │
│  ⚠️  À ÉVITER                                                   │
│  ─────────────                                                  │
│  ✗ "Aimeriez-vous une fonctionnalité qui..." (leading)         │
│  ✗ "Est-ce que c'est difficile ?" (oui/non)                   │
│  ✗ "Achèteriez-vous..." (hypothétique ≠ réalité)              │
│  ✗ "La plupart des gens pensent que..." (biais social)        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### B.3 MÉTRIQUES DISCOVERY

```
┌─────────────────────────────────────────────────────────────────┐
│                MÉTRIQUES CLÉS — PHASE DISCOVERY                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  MÉTRIQUES DE PROCESSUS                                         │
│  ──────────────────────────                                     │
│  • # interviews conduites (cible: ≥8)                          │
│  • # hypothèses testées                                        │
│  • # opportunités identifiées (cible: ≥3)                      │
│  • Délai Discovery (vs prévu)                                  │
│  • % stakeholders présents aux reviews                         │
│                                                                 │
│  MÉTRIQUES DE QUALITÉ                                           │
│  ────────────────────────                                       │
│  • Confidence level sur hypothèse lead (cible: ≥70%)           │
│  • # de pivots effectués (signe d'apprentissage)               │
│  • Saturation thématique atteinte ? (oui/non)                  │
│  • Couverture segments utilisateurs                            │
│                                                                 │
│  MÉTRIQUES DE VALIDATION                                        │
│  ─────────────────────────                                      │
│  • % hypothèses validées vs invalidées                         │
│  • Résultats tests proto (taux succès tâches)                  │
│  • Score désirabilité (NPS concept)                            │
│  • Intention d'usage déclarée                                  │
│                                                                 │
│  NORTH STAR METRICS TYPES (E-commerce)                          │
│  ─────────────────────────────────────────                      │
│  B2C: Weekly Active Buyers, GMV, Orders/Customer                │
│  B2B: MRR, Active Accounts, NRR, Usage frequency               │
│                                                                 │
│  KPIs E-COMMERCE COURANTS                                       │
│  ──────────────────────────                                     │
│  • Taux de conversion (benchmark: 2-3%)                        │
│  • Taux d'abandon panier (benchmark: ~70%)                     │
│  • Panier moyen (AOV)                                          │
│  • Customer Lifetime Value (CLV)                               │
│  • Coût d'acquisition (CAC)                                    │
│  • Net Promoter Score (NPS)                                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### B.4 OUTILS PAR ACTIVITÉ

```
┌─────────────────────────────────────────────────────────────────┐
│                    OUTILS RECOMMANDÉS — DISCOVERY                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  RECHERCHE UTILISATEUR                                          │
│  ─────────────────────────                                      │
│  Recrutement: Respondent, UserTesting, Ethnio                   │
│  Interviews: Zoom, Google Meet, Lookback                        │
│  Transcription: Otter.ai, Grain, Rev                            │
│  Analyse quali: Dovetail, Condens, Notably                      │
│  Surveys: Typeform, SurveyMonkey, Google Forms                  │
│  Usability: Maze, UserTesting, Hotjar                           │
│                                                                 │
│  COLLABORATION & WORKSHOPS                                       │
│  ────────────────────────────                                   │
│  Whiteboard: Miro, FigJam, Mural                                │
│  Documentation: Notion, Confluence, Coda                        │
│  Prototypage: Figma, Sketch, Adobe XD                           │
│  Présentation: Pitch, Google Slides, Keynote                    │
│                                                                 │
│  ANALYTICS & DATA                                               │
│  ────────────────────                                           │
│  Web analytics: Google Analytics, Amplitude, Mixpanel           │
│  Heatmaps: Hotjar, FullStory, Heap                              │
│  A/B testing: Optimizely, VWO, Google Optimize                  │
│  BI: Looker, Tableau, Metabase                                  │
│                                                                 │
│  PRODUCT MANAGEMENT                                             │
│  ─────────────────────                                          │
│  Roadmap: Productboard, Aha!, Jira Product Discovery            │
│  Backlog: Jira, Linear, Asana                                   │
│  OKRs: Lattice, 15Five, Weekdone                                │
│  Research repo: Dovetail, Aurelius, EnjoyHQ                     │
│                                                                 │
│  IA & AUTOMATION                                                │
│  ─────────────────                                              │
│  Synthèse: Claude, ChatGPT                                      │
│  Transcription IA: Otter.ai, Grain                              │
│  Design AI: Figma AI, Uizard, Galileo                           │
│  Analyse feedback: Thematic, MonkeyLearn                        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## ANNEXE C : GLOSSAIRE

### Termes Discovery & Product Management

| Terme | Définition |
|-------|------------|
| **A/B Test** | Expérimentation comparant deux versions (A et B) auprès d'utilisateurs pour mesurer laquelle performe mieux sur une métrique donnée |
| **Assumption Mapping** | Technique de visualisation des hypothèses selon leur importance et le niveau de certitude, pour prioriser ce qu'il faut valider |
| **Business Model Canvas (BMC)** | Framework d'Alexander Osterwalder représentant visuellement les 9 blocs constitutifs d'un business model |
| **Continuous Discovery** | Approche (Teresa Torres) où les équipes produit intègrent des activités de découverte en continu, pas uniquement en début de projet |
| **Design Sprint** | Processus de 5 jours créé par Google Ventures pour répondre à des questions critiques via prototypage et tests utilisateurs |
| **Discovery** | Phase exploratoire où l'on cherche à comprendre le problème, les utilisateurs et les opportunités avant de construire |
| **Delivery** | Phase de construction où l'on développe et livre la solution définie pendant la Discovery |
| **Double Diamond** | Modèle Design Council avec 4 phases : Discover, Define, Develop, Deliver — alternant divergence et convergence |
| **Empathy Map** | Canvas visuel pour capturer ce qu'un utilisateur pense, ressent, dit et fait, favorisant l'empathie de l'équipe |
| **Go/No-Go** | Point de décision où l'on détermine si un projet/initiative doit avancer (Go) ou être arrêté (No-Go) |
| **HiPPO** | "Highest Paid Person's Opinion" — biais où les décisions sont prises selon l'opinion du plus haut gradé plutôt que sur des données |
| **HMW (How Might We)** | Format de question pour recadrer les problèmes en opportunités créatives : "Comment pourrions-nous..." |
| **ICE Score** | Méthode de priorisation : Impact + Confidence + Ease, chaque dimension notée de 1 à 10 |
| **Jobs-to-be-Done (JTBD)** | Framework centré sur le "job" que le client cherche à accomplir, plutôt que sur les features du produit |
| **Journey Map** | Visualisation du parcours utilisateur à travers les étapes, touchpoints, émotions et pain points |
| **Lean Canvas** | Adaptation du BMC par Ash Maurya, optimisée pour les startups avec focus sur problème et solution |
| **Lean Startup** | Méthodologie Eric Ries basée sur Build-Measure-Learn pour valider rapidement des hypothèses business |
| **MVP (Minimum Viable Product)** | Version minimale d'un produit permettant d'apprendre le maximum sur les utilisateurs avec le minimum d'effort |
| **North Star Metric** | Métrique unique qui capture la valeur fondamentale que le produit délivre aux clients |
| **OKR** | Objectives and Key Results — framework de définition d'objectifs avec résultats mesurables |
| **Opportunity Solution Tree** | Framework visuel (Teresa Torres) reliant outcomes aux opportunités et solutions possibles |
| **Persona** | Archétype fictif représentant un segment d'utilisateurs, basé sur des données de recherche |
| **PESTEL** | Analyse des facteurs macro : Political, Economic, Social, Technological, Environmental, Legal |
| **Pivot** | Changement de direction stratégique basé sur les apprentissages, tout en gardant ce qui fonctionne |
| **PoC (Proof of Concept)** | Démonstration de faisabilité technique, généralement sans focus sur l'expérience utilisateur |
| **Porter's 5 Forces** | Framework d'analyse de l'intensité concurrentielle d'un marché (Michael Porter) |
| **Problem Statement** | Formulation structurée d'un problème à résoudre, définissant qui, quoi, pourquoi et impact |
| **Product Trio** | Configuration recommandée : PM + Designer + Tech Lead collaborant sur la Discovery |
| **Prototype** | Représentation interactive d'une solution pour tester avec des utilisateurs avant développement |
| **RICE Score** | Méthode de priorisation : (Reach × Impact × Confidence) / Effort |
| **Root Cause Analysis** | Techniques pour identifier la cause racine d'un problème (5 Pourquoi, Ishikawa, etc.) |
| **SAM (Serviceable Addressable Market)** | Portion du TAM que l'entreprise peut réalistement cibler |
| **SOM (Serviceable Obtainable Market)** | Portion du SAM que l'entreprise peut capturer à court terme |
| **Spike** | Investigation technique timeboxée pour réduire l'incertitude sur une question technique |
| **Stakeholder** | Toute personne ayant un intérêt ou une influence sur le projet/produit |
| **TAM (Total Addressable Market)** | Taille totale du marché si 100% des clients potentiels achetaient |
| **UVP (Unique Value Proposition)** | Déclaration claire de ce qui rend le produit unique et précieux pour les utilisateurs |
| **User Story** | Format de spécification : "En tant que [persona], je veux [action], afin de [bénéfice]" |
| **Value Proposition Canvas** | Outil Strategyzer pour aligner ce que le produit offre avec ce que le client recherche |
| **Verbatim** | Citation exacte d'un utilisateur, utilisée pour illustrer des insights |

---

## ANNEXE D : BIBLIOGRAPHIE ET SOURCES

### D.1 OUVRAGES DE RÉFÉRENCE

#### Discovery & Product Management

| Ouvrage | Auteur(s) | Année | Apport clé |
|---------|-----------|-------|------------|
| *Continuous Discovery Habits* | Teresa Torres | 2021 | Framework discovery continue |
| *Inspired* | Marty Cagan | 2017 | Rôle PM, équipes produit performantes |
| *Empowered* | Marty Cagan, Chris Jones | 2020 | Leadership produit, empowerment |
| *The Mom Test* | Rob Fitzpatrick | 2013 | Comment mener des interviews utilisateurs |
| *Sprint* | Jake Knapp et al. | 2016 | Design Sprint Google Ventures |
| *Jobs to Be Done* | Tony Ulwick | 2016 | Outcome-Driven Innovation |
| *Competing Against Luck* | Clayton Christensen | 2016 | JTBD appliqué à l'innovation |
| *Lean Startup* | Eric Ries | 2011 | Build-Measure-Learn, MVP |
| *Running Lean* | Ash Maurya | 2012 | Lean Canvas, validation |
| *Testing Business Ideas* | David Bland, Alex Osterwalder | 2019 | 44 expériences de validation |
| *Value Proposition Design* | Osterwalder et al. | 2014 | Value Proposition Canvas |
| *Business Model Generation* | Osterwalder, Pigneur | 2010 | Business Model Canvas |

#### UX Research & Design

| Ouvrage | Auteur(s) | Année | Apport clé |
|---------|-----------|-------|------------|
| *Just Enough Research* | Erika Hall | 2013 | Research pragmatique |
| *Interviewing Users* | Steve Portigal | 2013 | Techniques d'interview |
| *Lean UX* | Jeff Gothelf, Josh Seiden | 2013 | UX en mode Agile |
| *Don't Make Me Think* | Steve Krug | 2014 | Usabilité web fondamentale |
| *The Design of Everyday Things* | Don Norman | 2013 | Design centré utilisateur |
| *Universal Principles of Design* | Lidwell et al. | 2010 | 125 principes design |
| *Hooked* | Nir Eyal | 2014 | Modèle d'engagement produit |

#### Stratégie & Marché

| Ouvrage | Auteur(s) | Année | Apport clé |
|---------|-----------|-------|------------|
| *Blue Ocean Strategy* | Kim, Mauborgne | 2015 | Création de nouveaux marchés |
| *Competitive Strategy* | Michael Porter | 1980 | 5 forces, avantage concurrentiel |
| *Good Strategy Bad Strategy* | Richard Rumelt | 2011 | Stratégie efficace |
| *Playing to Win* | Lafley, Martin | 2013 | Framework choix stratégiques |

### D.2 SOURCES EN LIGNE

#### Blogs & Publications

| Source | URL | Spécialité |
|--------|-----|------------|
| Product Talk (Teresa Torres) | producttalk.org | Continuous Discovery |
| Silicon Valley Product Group | svpg.com | Product Management |
| Mind the Product | mindtheproduct.com | Communauté Product |
| Nielsen Norman Group | nngroup.com | UX Research |
| Strategyzer | strategyzer.com | Business Design |
| Intercom Blog | intercom.com/blog | Product, Growth |
| Lenny's Newsletter | lennysnewsletter.com | PM, Growth |
| Reforge | reforge.com | Growth, Product |

#### Frameworks & Outils (sources officielles)

| Framework | Source | URL |
|-----------|--------|-----|
| Product Vision Board | Roman Pichler | romanpichler.com |
| Value Proposition Canvas | Strategyzer | strategyzer.com |
| Lean Canvas | Ash Maurya | leanstack.com |
| Opportunity Solution Tree | Teresa Torres | producttalk.org |
| Design Sprint | GV | gv.com/sprint |
| RICE Scoring | Intercom | intercom.com |
| Jobs-to-be-Done (ODI) | Tony Ulwick | strategyn.com |
| JTBD (Switch Interview) | Bob Moesta | learn.jobstobedone.org |

### D.3 ÉTUDES ET RAPPORTS

| Rapport | Organisation | Sujet |
|---------|--------------|-------|
| State of Product Management | ProductPlan | Tendances PM annuelles |
| Product Benchmark Report | Pendo | Métriques produit |
| UX Research Industry Report | User Interviews | Tendances UX Research |
| E-commerce Benchmark | Baymard Institute | UX e-commerce |
| Cart Abandonment Statistics | Baymard Institute | Taux abandon panier |
| Digital Commerce Report | Adobe | Tendances e-commerce |

### D.4 CERTIFICATIONS RECOMMANDÉES

| Certification | Organisation | Focus |
|---------------|--------------|-------|
| Product Management Certificate | Product School | PM fondamentaux |
| Certified Scrum Product Owner | Scrum Alliance | Scrum/Agile |
| Professional Scrum Product Owner | Scrum.org | Product Ownership |
| Design Thinking Practitioner | IDEO U | Design Thinking |
| CBAP | IIBA | Business Analysis |

---

## ANNEXE E : TEMPLATES RÉCAPITULATIFS

### E.1 Template : Discovery One-Pager

```markdown
# DISCOVERY ONE-PAGER — [Nom du projet]

## 🎯 OUTCOME
[Métrique/objectif que cette initiative doit impacter]

## 🔍 PROBLÈME
**Pour** [utilisateur cible],
**le problème est** [pain point],
**ce qui cause** [impact business].

## 💡 HYPOTHÈSE
Nous croyons que [solution proposée] permettra à [utilisateur]
de [bénéfice], ce qui impactera [métrique] de [X%].

## ✅ VALIDATION
| Hypothèse | Méthode | Résultat |
|-----------|---------|----------|
| [H1] | [Test] | ✅ / ❌ |

## 📊 EVIDENCE
- [N] interviews : [insight principal]
- Data : [chiffre clé]
- Benchmark : [insight]

## ⚡ RECOMMANDATION
☐ GO — [Scope recommandé]
☐ PIVOT — [Nouvelle direction]
☐ KILL — [Raison]

## 👥 ÉQUIPE
- PM : [Nom]
- Designer : [Nom]
- Tech : [Nom]

**Date** : [JJ/MM/AAAA]
```

### E.2 Template : Research Repository Entry

```markdown
# RESEARCH ENTRY — [ID]

## MÉTADONNÉES
- **Date** : [JJ/MM/AAAA]
- **Type** : Interview / Survey / Usability Test / Analytics
- **Projet** : [Nom projet]
- **Researcher** : [Nom]

## PARTICIPANT (si applicable)
- **Segment** : [Persona/segment]
- **Contexte** : [Description]

## INSIGHTS

### Insight 1 : [Titre]
**Finding** : [Description de ce qu'on a découvert]
**Evidence** : "[Verbatim exact]" — Participant X
**Implication** : [Ce que ça signifie pour le produit]
**Confidence** : 🔴 Low / 🟡 Medium / 🟢 High

### Insight 2 : [Titre]
[...]

## TAGS
#[persona] #[thème] #[projet] #[phase]

## LIENS
- Recording : [URL]
- Notes brutes : [URL]
- Synthèse projet : [URL]
```

---

# FIN DU RAPPORT

---

## 📑 RÉCAPITULATIF DU DOCUMENT

Ce rapport exhaustif sur la **Phase 1 — Discovery** couvre :

| Section | Contenu | Pages estimées |
|---------|---------|----------------|
| 1. Introduction | Contexte, objectifs, structure | ~10 |
| 2. Identification du Problème | Problem Framing, HMW, 5W1H, Root Cause | ~80 |
| 3. Recherche Utilisateur | Interviews, Personas, Empathy Maps, Journey Maps | ~90 |
| 4. Analyse de Marché | TAM/SAM/SOM, Porter, PESTEL, Blue Ocean | ~80 |
| 5. Vision Produit | Vision Board, North Star, UVP, Canvas | ~70 |
| 6. Validation | Assumption Mapping, RICE, MVP, Design Sprint | ~70 |
| 7. Livrables | Project Charter, Repository, RACI, OST | ~60 |
| 8. Questions Transversales | 6 questions clés | ~40 |
| 9. Métiers et Compétences | UXR, PM, BA, Collaboration, IA | ~80 |
| Annexes | Checklists, Quick Ref, Glossaire, Biblio | ~50 |

**Total** : ~8,000 lignes / ~200 pages équivalent

---

## ✅ ENGAGEMENT QUALITÉ

Ce document respecte les principes suivants :

- **Structure 3 niveaux** : Vulgarisation → Expert → Application Pratique
- **Sources vérifiées** : Références académiques et professionnelles citées
- **Focus E-commerce** : Exemples et templates adaptés B2B/B2C
- **Actionnable** : Templates, checklists et guides immédiatement utilisables
- **À jour** : Intégration des évolutions 2024-2025 (IA, nouvelles pratiques)

---

*Document généré le [Date]*
*Version 1.0*

---

**FIN DU RAPPORT — PHASE 1 DISCOVERY**
