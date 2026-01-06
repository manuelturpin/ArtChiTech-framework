# Rapport de Recherche : Phase 2 - Stratégie
## "Planifier & Cadrer"

**Version** : 1.0
**Date** : 29 décembre 2025
**Auteur** : Claude (Deep Research - OPUS 4.5)
**Statut** : Final

---

## Table des matières

1. [Introduction](#1-introduction)
2. [Définition des Objectifs](#2-définition-des-objectifs)
3. [Business Model et Monétisation](#3-business-model-et-monétisation)
4. [Scope et Périmètre](#4-scope-et-périmètre)
5. [Planification et Estimation](#5-planification-et-estimation)
6. [Budgétisation et Finances](#6-budgétisation-et-finances)
7. [Gestion des Risques](#7-gestion-des-risques)
8. [Gouvernance et Organisation](#8-gouvernance-et-organisation)
9. [Questions Transversales](#9-questions-transversales)
10. [Métiers et Compétences](#10-métiers-et-compétences)
11. [Checklist de Phase Stratégie](#11-checklist-de-phase-stratégie)
12. [Red Flags et Anti-Patterns](#12-red-flags-et-anti-patterns)
13. [Quick Reference](#13-quick-reference)
14. [Glossaire](#glossaire)
15. [Bibliographie et Sources](#bibliographie-et-sources)

---

## Executive Summary

La **Phase Stratégie** constitue le pont critique entre la découverte (Phase 1) et la conception (Phase 3). C'est ici que les insights de la discovery se transforment en plan d'action concret, avec des objectifs mesurables, un business model validé, un périmètre défini et des ressources allouées.

### Points clés de cette phase :

**1. Définition des objectifs** : Les frameworks SMART (Doran, 1981) et OKR (Grove/Intel, popularisés par Doerr chez Google en 1999) offrent des approches complémentaires. SMART excelle pour des objectifs individuels précis ; OKR pour l'alignement organisationnel. Pour le contexte e-commerce/startup, privilégier les OKR pour leur agilité, tout en gardant SMART pour les objectifs opérationnels.

**2. Business Model** : Le Business Model Canvas (Osterwalder, 2005/2010) reste l'outil de référence pour visualiser et valider un modèle économique. Le Lean Canvas (Maurya, 2010) est préférable pour les startups en phase d'incertitude. Les unit economics (CAC, LTV, ratio LTV:CAC ≥ 3:1) sont critiques pour valider la viabilité d'un projet e-commerce.

**3. Scope Management** : La définition claire du périmètre via WBS, couplée à une priorisation rigoureuse (MoSCoW, Kano, RICE), prévient le scope creep. Le concept de MVP (Eric Ries) doit être compris comme un outil d'apprentissage, pas simplement une "version minimale".

**4. Estimation et planification** : Les techniques comme Planning Poker, PERT, et T-shirt sizing permettent de gérer l'incertitude. Le mouvement #NoEstimates (2012) propose une alternative radicale mais controversée.

**5. Gestion des risques** : Le RAID Log (Risks, Assumptions, Issues, Dependencies) centralise les informations critiques. La simulation Monte Carlo offre une approche probabiliste pour les projets complexes. Le Pre-mortem (Gary Klein, 2007) est un outil puissant d'anticipation des échecs.

**6. Gouvernance** : La matrice RACI clarifie les responsabilités. Une seule personne doit être "Accountable" par tâche. Pour les projets e-commerce de taille startup/PME, adapter le niveau de formalisme à la taille de l'équipe.

### Outputs attendus de cette phase :
- Objectifs SMART/OKRs documentés et validés
- Business Model Canvas ou Lean Canvas complété
- Scope documenté avec WBS et MVP défini
- Planning/Roadmap avec estimations
- Budget approuvé
- Risk Register initialisé
- RACI et plan de communication établis

### Décision clé : Go/No-Go pour Phase Conception

---

## 1. Introduction

### 1.1 Objectif de cette phase

La phase Stratégie a pour objectif de **transformer les insights de la Discovery en plan d'action opérationnel**. Elle répond aux questions fondamentales :
- **QUOI** : Que construisons-nous exactement ? (Scope)
- **POURQUOI** : Quels objectifs business cherchons-nous à atteindre ? (Goals)
- **POUR QUI** : Quel est notre modèle économique ? (Business Model)
- **COMMENT** : Quelle est notre approche ? (Méthodologie)
- **QUAND** : Quel est le calendrier ? (Planning)
- **COMBIEN** : Quel budget ? (Budget)
- **ET SI** : Quels sont les risques ? (Risk Management)

### 1.2 Place dans le cycle de vie projet

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Phase 1    │ → │  Phase 2    │ → │  Phase 3    │ → │  Phase 4    │
│  DISCOVERY  │    │  STRATÉGIE  │    │  CONCEPTION │    │    DEV      │
│             │    │  ◄ ACTUEL   │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
   Comprendre         Planifier          Designer         Construire
   & Explorer         & Cadrer           & Archi          & Implém.
```

### 1.3 Prérequis (outputs de Discovery)

Pour entamer la phase Stratégie, les éléments suivants doivent être disponibles :

| Livrable Discovery | Usage en Stratégie |
|-------------------|-------------------|
| Étude de marché | Validation du business model |
| Personas utilisateurs | Priorisation des features |
| Analyse concurrentielle | Positionnement et différenciation |
| Opportunités identifiées | Base pour définition des objectifs |
| Contraintes techniques connues | Input pour estimation et risques |
| Validation du problem-solution fit | Go/No-Go initial |

### 1.4 Outputs attendus (inputs pour Conception)

| Livrable Stratégie | Usage en Conception |
|-------------------|---------------------|
| Objectifs SMART/OKRs | Critères de succès |
| Business Model Canvas | Guide des décisions produit |
| Scope documenté (WBS) | Base pour architecture |
| MVP défini | Périmètre v1 |
| Planning/Roadmap | Timeline conception |
| Budget approuvé | Contraintes ressources |
| Risk Register | Points d'attention conception |
| RACI | Organisation de l'équipe |

---

## 2. Définition des Objectifs

### 2.1 Objectifs SMART

#### Niveau 1 - Vulgarisation

Les objectifs SMART sont comme une recette de cuisine bien écrite : au lieu de dire "faire un bon gâteau", vous spécifiez "préparer un gâteau au chocolat de 24 cm, moelleux, en 2 heures, pour 8 personnes".

**SMART** est un acronyme pour :
- **S**pécifique : Clairement défini, sans ambiguïté
- **M**esurable : Quantifiable, avec des indicateurs
- **A**tteignable (ou Assignable) : Réaliste avec les ressources disponibles
- **R**éaliste (ou Relevant) : Pertinent par rapport aux objectifs globaux
- **T**emporel : Avec une échéance définie

**Pourquoi c'est important** : Sans objectifs SMART, les équipes naviguent à vue. Un objectif vague comme "améliorer les ventes" ne donne aucune direction ; "augmenter les ventes e-commerce de 25% d'ici Q4 2025" permet d'aligner les efforts et de mesurer le succès.

#### Niveau 2 - Approfondissement Expert

**Origine et historique** :
L'acronyme SMART a été introduit par **George T. Doran** dans un article intitulé *"There's a S.M.A.R.T. Way to Write Management's Goals and Objectives"* publié dans **Management Review** en novembre 1981. Doran était alors consultant et ancien directeur de la planification d'entreprise chez Washington Water Power Company.

**Formulation originale de Doran (1981)** :
- **S**pecific : Target a specific area for improvement
- **M**easurable : Quantify or at least suggest an indicator of progress
- **A**ssignable : Specify who will do it
- **R**ealistic : State what results can realistically be achieved
- **T**ime-related : Specify when the result(s) can be achieved

> **[À NOTER]** : L'acronyme a évolué depuis 1981. Les variantes les plus courantes aujourd'hui utilisent "Achievable" ou "Attainable" au lieu d'"Assignable", et "Relevant" au lieu de "Realistic".

**Évolution et variantes** :

| Lettre | Version Doran (1981) | Version moderne courante | Autres variantes |
|--------|---------------------|-------------------------|------------------|
| S | Specific | Specific | Strategic, Significant |
| M | Measurable | Measurable | Meaningful, Motivating |
| A | Assignable | Achievable/Attainable | Action-oriented, Agreed |
| R | Realistic | Relevant | Results-based, Reasonable |
| T | Time-related | Time-bound | Trackable, Time-limited |

**Extensions du framework** :
- **SMARTER** : Ajoute Evaluated + Reviewed (ou Exciting + Recorded)
- **SMARTEST** : Ajoute Ethical + Sustainable + Team-oriented

**Fondements théoriques** :
SMART s'inscrit dans la **Goal-Setting Theory** de Locke & Latham (1990), qui démontre scientifiquement que des objectifs spécifiques et difficiles conduisent à de meilleures performances que des objectifs vagues ou faciles.

**Critiques et limites connues** :
1. **Rigidité** : Peut limiter la créativité et l'innovation
2. **Court-termisme** : Favorise les objectifs à court terme mesurables au détriment de visions long terme
3. **Réductionnisme** : Tout n'est pas quantifiable (culture, innovation, bien-être)
4. **Manipulation** : Risque de "gaming the system" pour atteindre des métriques
5. **Contexte dynamique** : Moins adapté aux environnements très incertains

**État actuel (2024-2025)** :
SMART reste largement utilisé mais est souvent combiné avec d'autres frameworks (OKR, North Star Metric) pour pallier ses limites. Dans les contextes agiles, il est parfois considéré comme trop rigide.

#### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Objectifs opérationnels et individuels
- Projets avec périmètre bien défini
- KPIs et targets de performance
- Plans d'action à court/moyen terme (1-12 mois)

**Anti-patterns et erreurs communes** :

| Anti-pattern | Exemple | Correction |
|-------------|---------|-----------|
| Trop vague | "Améliorer le site" | "Réduire le temps de chargement à <2s sur mobile" |
| Non mesurable | "Avoir des clients satisfaits" | "Atteindre un NPS >50" |
| Irréaliste | "Doubler le CA en 1 mois" | "Augmenter le CA de 15% sur le trimestre" |
| Sans échéance | "Lancer la nouvelle fonctionnalité" | "Livrer en production avant le 15 mars" |
| Trop ambitieux | "0 bug en production" | "Réduire les bugs critiques de 80%" |

**Exemple concret e-commerce B2B** :

❌ **Objectif mal formulé** : "Améliorer notre plateforme e-commerce B2B"

✅ **Objectif SMART** : "Augmenter le taux de conversion des nouveaux comptes professionnels de 2.5% à 4% d'ici le 30 juin 2025, en optimisant le parcours d'inscription et en réduisant le délai de validation de compte de 48h à 4h."

**Template de rédaction** :
```
[Verbe d'action] + [Résultat spécifique] + [Métrique] + [De X à Y] + [Échéance]

Exemple : "Réduire le taux d'abandon panier de 75% à 60% d'ici Q2 2025"
```

---

### 2.2 OKR - Objectives and Key Results

#### Niveau 1 - Vulgarisation

Les OKR sont comme une boussole et un compteur kilométrique pour une randonnée. L'**Objectif** est la destination inspirante ("Atteindre le sommet du Mont Blanc"), et les **Key Results** sont les indicateurs mesurables qui prouvent qu'on y arrive ("Atteindre 3000m d'altitude", "Parcourir 15km", "Compléter l'ascension en moins de 8h").

**Pourquoi c'est important** : Les OKR permettent d'aligner toute une organisation vers des objectifs communs, tout en gardant chaque équipe et individu responsable de résultats mesurables. C'est ce qui a permis à Google de passer de 40 à plus de 100 000 employés tout en maintenant focus et alignement.

#### Niveau 2 - Approfondissement Expert

**Origine et historique** :

| Période | Événement | Acteur clé |
|---------|-----------|-----------|
| 1954 | MBO (Management by Objectives) | Peter Drucker |
| 1968 | Intel adopte les "iMBOs" | Andy Grove |
| 1975 | John Doerr apprend les OKR chez Intel | Andy Grove → John Doerr |
| 1983 | Publication de "High Output Management" | Andy Grove |
| 1999 | Introduction des OKR chez Google (40 employés) | John Doerr |
| 2018 | Publication de "Measure What Matters" | John Doerr |
| 2024 | OKR adoptés par des milliers d'entreprises | Global |

**Citation de John Doerr** :
> "I was first exposed to OKRs at Intel in the 1970s. At the time, Intel was transitioning from a memory company to a microprocessor company, and Andy Grove and the management team needed employees to focus on a set of priorities in order to make a successful transition."

**Structure des OKR** :

```
OBJECTIVE (Qualitatif)
├── Key Result 1 (Quantitatif)
├── Key Result 2 (Quantitatif)
└── Key Result 3 (Quantitatif)
    [Maximum 3-5 KRs par Objective]
```

**Caractéristiques des bons Objectives** :
- Inspirants et motivants
- Qualitatifs (pas de chiffres)
- Ambitieux mais atteignables ("Stretch goals")
- Alignés avec la vision/stratégie
- Limités à 3-5 par période

**Caractéristiques des bons Key Results** :
- Mesurables et quantifiables
- Spécifiques avec une métrique claire
- Limités dans le temps (généralement trimestriels)
- Axés sur les outcomes, pas les outputs
- Vérifiables objectivement (pas de débat possible)

**Cadence recommandée** :
- **OKR annuels** : Vision et objectifs stratégiques (2-3 max)
- **OKR trimestriels** : Objectifs tactiques (3-5 par équipe)
- **Check-ins hebdomadaires** : Suivi et ajustements
- **Grading** : Évaluation en fin de trimestre

**Système de scoring (Méthode Google)** :
| Score | Signification |
|-------|---------------|
| 0.0 - 0.3 | Échec - Objectif non atteint |
| 0.4 - 0.6 | Progrès significatif |
| 0.7 - 1.0 | Succès (cible = 0.7, pas 1.0) |

> **[IMPORTANT]** : Un taux de succès de 70% est considéré comme optimal par Google. Atteindre 100% systématiquement suggère que les objectifs ne sont pas assez ambitieux.

**Entreprises ayant adopté les OKR** :
Google, LinkedIn, Twitter, Uber, Spotify, Netflix, Amazon, Airbnb, Dropbox, Facebook, Adobe, Deloitte, Gap, Microsoft, GitLab.

**Différences SMART vs OKR** :

| Aspect | SMART | OKR |
|--------|-------|-----|
| Niveau | Individuel/Tâche | Organisationnel/Équipe |
| Ambition | Réaliste (100% atteignable) | Ambitieux (70% = succès) |
| Focus | Résultats spécifiques | Alignement et direction |
| Cadence | Projet/Annuel | Trimestriel |
| Scope | Un objectif isolé | Hiérarchie d'objectifs |

**Critiques et limites** :
1. Complexité d'implémentation dans les petites structures
2. Risque de bureaucratisation si mal appliqué
3. Tension entre objectifs individuels et collectifs
4. Nécessite une culture de transparence
5. Peut créer une pression excessive si lié à l'évaluation de performance

#### Niveau 3 - Application Pratique

**Contexte d'utilisation optimal** :
- Organisations de 10+ personnes
- Besoin d'alignement cross-équipes
- Environnements dynamiques nécessitant des pivots
- Culture de transparence et feedback

**Exemple concret pour une startup e-commerce B2C** :

```
OBJECTIVE (Q1 2025) : Devenir la référence pour les achats de produits bio en ligne

Key Result 1 : Atteindre 50 000 clients actifs mensuels (actuellement 32 000)
Key Result 2 : Augmenter le panier moyen de 45€ à 60€
Key Result 3 : Obtenir un NPS de 60 (actuellement 42)
Key Result 4 : Réduire le délai de livraison moyen de 4 jours à 2 jours
```

**Cascade OKR pour e-commerce** :

```
COMPANY OBJECTIVE : Leader du e-commerce bio régional

├── ÉQUIPE PRODUIT
│   Objective : Créer une expérience d'achat fluide
│   KR1 : Réduire le taux d'abandon panier de 70% à 55%
│   KR2 : Atteindre un temps de chargement <1.5s
│   KR3 : 90% de satisfaction sur l'app mobile

├── ÉQUIPE MARKETING
│   Objective : Développer une communauté engagée
│   KR1 : 20 000 abonnés newsletter qualifiés
│   KR2 : Taux d'ouverture email >35%
│   KR3 : CAC réduit de 25€ à 18€

└── ÉQUIPE OPÉRATIONS
    Objective : Excellence logistique
    KR1 : 99% des commandes expédiées sous 24h
    KR2 : Taux de retour <3%
    KR3 : Coût logistique <8% du CA
```

**Anti-patterns OKR** :

| Anti-pattern | Problème | Solution |
|-------------|----------|----------|
| "To-do list OKR" | KRs sont des tâches, pas des résultats | Formuler en outcomes mesurables |
| Trop d'OKRs | Dispersion, perte de focus | Max 3-5 Objectives, 3-5 KRs chacun |
| OKR "business as usual" | Pas d'ambition, pas de stretch | Viser 70% d'atteinte comme succès |
| Pas de suivi | OKRs oubliés après le kickoff | Check-ins hebdomadaires |
| OKR = Évaluation | Crée une culture de sandbagging | Séparer OKR et review de performance |

---

### 2.3 Balanced Scorecard

#### Niveau 1 - Vulgarisation

Le Balanced Scorecard (BSC) est comme le tableau de bord d'une voiture : au lieu de regarder uniquement le compteur de vitesse (les finances), il affiche aussi le niveau d'essence (les clients), la température moteur (les processus internes) et les voyants de maintenance (l'apprentissage/croissance).

**Pourquoi c'est important** : Se concentrer uniquement sur les indicateurs financiers est comme conduire en ne regardant que le rétroviseur. Le BSC équilibre la vision court terme (finances) avec les indicateurs prédictifs de succès futur.

#### Niveau 2 - Approfondissement Expert

**Origine et historique** :
Développé par **Robert S. Kaplan** (Harvard Business School) et **David P. Norton** (consultant), le BSC a été présenté dans un article fondateur de la **Harvard Business Review** en 1992 : *"The Balanced Scorecard—Measures that Drive Performance"*.

**Les 4 perspectives du BSC** :

```
┌──────────────────────────────────────────────────────┐
│                    VISION & STRATÉGIE                 │
└──────────────────────────────────────────────────────┘
          │            │            │            │
          ▼            ▼            ▼            ▼
    ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐
    │FINANCIÈRE│ │ CLIENTS  │ │PROCESSUS │ │APPRENT.  │
    │          │ │          │ │ INTERNES │ │& CROISS. │
    │ "Comment │ │"Comment  │ │"En quoi  │ │"Comment  │
    │ nous     │ │ nos      │ │ devons-  │ │ soutenir │
    │ percoi-  │ │ clients  │ │ nous     │ │ notre    │
    │ vent les │ │ nous     │ │ exceller │ │ capacité │
    │ action-  │ │ voient?" │ │ ?"       │ │ à        │
    │ naires?" │ │          │ │          │ │ changer?"│
    └──────────┘ └──────────┘ └──────────┘ └──────────┘
```

**KPIs typiques par perspective** :

| Perspective | KPIs courants |
|-------------|--------------|
| **Financière** | ROI, Marge, CA, Cash-flow, EVA |
| **Clients** | NPS, Satisfaction, Rétention, Part de marché |
| **Processus internes** | Qualité, Délais, Productivité, Innovation |
| **Apprentissage & Croissance** | Formation, Compétences, Culture, Technologie |

**Strategy Map** :
Évolution introduite par Kaplan & Norton au début des années 2000, la Strategy Map visualise les relations cause-effet entre les objectifs des 4 perspectives.

**Adoption globale** :
Plus de 50% des grandes entreprises aux États-Unis, en Europe et en Asie utilisent le BSC (source : études Bain & Company). La Harvard Business Review l'a classé parmi les idées business les plus influentes des 75 dernières années.

**Évolutions récentes (2024-2025)** :
- Intégration des critères ESG (Environnement, Social, Gouvernance)
- Combinaison avec frameworks Agile
- Utilisation d'IA pour le suivi prédictif

#### Niveau 3 - Application Pratique

**Exemple pour un e-commerce B2B** :

| Perspective | Objectif | KPI | Cible |
|-------------|----------|-----|-------|
| Financière | Croissance rentable | MRR | +25%/an |
| Clients | Satisfaction client | NPS B2B | >50 |
| Processus | Efficacité opérationnelle | Délai traitement commande | <4h |
| Apprentissage | Équipe performante | Taux rétention talents | >90% |

**Quand utiliser le BSC** :
- Entreprises établies (>50 employés)
- Besoin d'alignement stratégique global
- Reporting aux investisseurs/board
- Transformation digitale structurée

**Limites pour startups/PME** :
Le BSC peut être trop lourd pour des petites structures. Préférer OKR ou un tableau de bord simplifié avec 5-7 métriques clés.

---

### 2.4 Goal-Setting Theory (Locke & Latham)

#### Niveau 1 - Vulgarisation

La théorie de fixation des objectifs prouve scientifiquement ce que les coachs sportifs savent depuis toujours : des objectifs clairs et difficiles motivent plus que des objectifs vagues ou faciles. "Fais de ton mieux" est moins efficace que "Cours le 100m en moins de 12 secondes".

#### Niveau 2 - Approfondissement Expert

**Origine** :
Développée par les psychologues **Edwin Locke** et **Gary Latham** à partir des années 1960, cette théorie est considérée comme l'une des plus validées en psychologie organisationnelle (plus de 1000 études).

**Publication clé** : Locke, E. A., & Latham, G. P. (1990). *A theory of goal setting and task performance*. Prentice-Hall.

**5 principes fondamentaux** :

1. **Clarté** : Les objectifs clairs surpassent les objectifs vagues
2. **Challenge** : Les objectifs difficiles motivent plus que les faciles
3. **Engagement** : L'adhésion aux objectifs est essentielle
4. **Feedback** : Le retour d'information améliore la performance
5. **Complexité de la tâche** : Adapter les objectifs à la complexité

**Impact prouvé** :
La recherche démontre que des objectifs spécifiques et difficiles améliorent la performance de 10% à 25% par rapport à des objectifs de type "faites de votre mieux".

#### Niveau 3 - Application Pratique

**Application au management de projet** :
- Définir des objectifs de sprint spécifiques
- Fixer des milestones challenging mais atteignables
- Mettre en place des mécanismes de feedback réguliers (daily, retros)
- Adapter la difficulté à la maturité de l'équipe

---

## 3. Business Model et Monétisation

### 3.1 Business Model Canvas

#### Niveau 1 - Vulgarisation

Le Business Model Canvas est comme un plan d'architecte pour votre entreprise. Au lieu de dessiner des murs et des pièces, vous dessinez les 9 éléments essentiels de votre modèle économique sur une seule page : qui sont vos clients, quelle valeur vous leur apportez, comment vous les atteignez, et comment vous gagnez de l'argent.

**Pourquoi c'est important** : Sans Business Model Canvas, vous construisez votre maison sans plan. Vous risquez d'oublier la cuisine (les revenus) ou les fondations (les ressources clés). Le Canvas force à réfléchir à tous les aspects du modèle économique de manière intégrée.

#### Niveau 2 - Approfondissement Expert

**Origine et historique** :

| Date | Événement |
|------|-----------|
| 2004 | Alexander Osterwalder développe le concept dans sa thèse de doctorat (Université de Lausanne) |
| 2005 | Publication des 9 blocs dans la littérature académique |
| 2010 | Publication de *"Business Model Generation"* (Osterwalder & Pigneur) |
| 2014 | Publication du *"Value Proposition Canvas"* |
| 2024 | Utilisé par des millions d'entrepreneurs et entreprises |

**Superviseur de thèse** : Yves Pigneur (informaticien belge, co-auteur du livre)

**Les 9 blocs du Business Model Canvas** :

```
┌────────────────┬──────────────┬────────────────┬──────────────┬────────────────┐
│                │              │                │              │                │
│   PARTENAIRES  │  ACTIVITÉS   │   PROPOSITION  │  RELATIONS   │   SEGMENTS     │
│      CLÉS      │    CLÉS      │   DE VALEUR    │   CLIENTS    │    CLIENTS     │
│                │              │                │              │                │
│  Qui sont nos  │ Que devons-  │  Quelle valeur │  Quel type   │  Pour qui      │
│  partenaires   │ nous faire   │  apportons-    │  de relation │  créons-nous   │
│  stratégiques? │ pour créer   │  nous?         │  maintenons- │  de la valeur? │
│                │ la valeur?   │                │  nous?       │                │
│                ├──────────────┤                ├──────────────┤                │
│                │              │                │              │                │
│                │  RESSOURCES  │                │    CANAUX    │                │
│                │    CLÉS      │                │              │                │
│                │              │                │  Comment     │                │
│                │ De quoi      │                │  atteignons- │                │
│                │ avons-nous   │                │  nous nos    │                │
│                │ besoin?      │                │  clients?    │                │
│                │              │                │              │                │
├────────────────┴──────────────┴────────────────┴──────────────┴────────────────┤
│                                                                                 │
│   STRUCTURE DE COÛTS                          FLUX DE REVENUS                   │
│                                                                                 │
│   Quels sont les coûts les plus importants?   Comment gagnons-nous de l'argent? │
│                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────┘
```

**Détail des 9 blocs** :

| # | Bloc | Description | Questions clés |
|---|------|-------------|----------------|
| 1 | **Segments clients** | Les différents groupes de personnes/organisations ciblés | Pour qui créons-nous de la valeur ? Qui sont nos clients les plus importants ? |
| 2 | **Proposition de valeur** | L'ensemble des produits/services qui créent de la valeur | Quel problème résolvons-nous ? Quel besoin satisfaisons-nous ? |
| 3 | **Canaux** | Comment l'entreprise communique et délivre sa proposition | Comment nos clients veulent-ils être atteints ? Quels canaux fonctionnent le mieux ? |
| 4 | **Relations clients** | Types de relations établies avec les segments | Quel type de relation chaque segment attend-il ? Comment les fidéliser ? |
| 5 | **Flux de revenus** | L'argent généré par chaque segment | Pour quelle valeur nos clients sont-ils prêts à payer ? Comment paient-ils ? |
| 6 | **Ressources clés** | Les actifs nécessaires pour faire fonctionner le modèle | Quelles ressources notre proposition de valeur requiert-elle ? |
| 7 | **Activités clés** | Les actions essentielles à réaliser | Que devons-nous faire pour créer et délivrer notre proposition ? |
| 8 | **Partenaires clés** | Le réseau de fournisseurs et partenaires | Qui sont nos partenaires clés ? Quelles ressources acquérons-nous auprès d'eux ? |
| 9 | **Structure de coûts** | Tous les coûts pour opérer le modèle | Quels sont les coûts les plus importants ? Quelles ressources coûtent le plus ? |

**Types de modèles business** :

| Type | Description | Exemple |
|------|-------------|---------|
| **B2C** | Business to Consumer | Amazon, Netflix |
| **B2B** | Business to Business | Salesforce, SAP |
| **B2B2C** | Via intermédiaire | Shopify merchants |
| **C2C** | Consumer to Consumer | eBay, Leboncoin |
| **Marketplace** | Mise en relation | Airbnb, Uber |
| **SaaS** | Software as a Service | Slack, Notion |
| **Freemium** | Gratuit + Premium | Spotify, LinkedIn |

**Outils associés** :
- **Value Proposition Canvas** : Zoom sur le fit produit-client
- **Environment Map** : Analyse de l'environnement externe
- **Strategy Canvas** : Analyse concurrentielle (Blue Ocean)

#### Niveau 3 - Application Pratique

**Exemple : E-commerce B2B de fournitures industrielles**

| Bloc | Contenu |
|------|---------|
| **Segments clients** | PME industrielles, artisans, services techniques |
| **Proposition de valeur** | Catalogue large, livraison J+1, conseil technique, prix compétitifs |
| **Canaux** | Site web, app mobile, commerciaux terrain, chat support |
| **Relations clients** | Compte dédié, commercial attitré >5k€/an, self-service autres |
| **Flux de revenus** | Vente produits (marge 15-25%), services (installation, formation) |
| **Ressources clés** | Plateforme e-commerce, entrepôts, catalogue produits, équipe commerciale |
| **Activités clés** | Gestion catalogue, logistique, support client, négociation fournisseurs |
| **Partenaires clés** | Fournisseurs, transporteurs, intégrateurs techniques |
| **Structure de coûts** | Achats (60%), logistique (15%), personnel (15%), technologie (5%) |

**Processus d'élaboration** :
1. Commencer par le segment client (pour qui ?)
2. Définir la proposition de valeur (pourquoi nous ?)
3. Identifier les canaux et relations (comment atteindre/servir ?)
4. Définir les flux de revenus (comment monétiser ?)
5. Lister ressources, activités et partenaires nécessaires
6. Calculer la structure de coûts

**Anti-patterns** :

| Erreur | Impact | Solution |
|--------|--------|----------|
| Trop de segments clients | Dispersion des efforts | Se concentrer sur 1-3 segments prioritaires |
| Proposition de valeur vague | Pas de différenciation | Utiliser le Value Proposition Canvas |
| Ignorer les coûts | Modèle non viable | Valider les unit economics |
| Canvas figé | Obsolescence | Réviser trimestriellement |

---

### 3.2 Lean Canvas

#### Niveau 1 - Vulgarisation

Le Lean Canvas est le "cousin startup" du Business Model Canvas. Là où le BMC est conçu pour des entreprises établies, le Lean Canvas est optimisé pour les entrepreneurs en phase de lancement, avec un focus sur les problèmes à résoudre et les risques à mitiger.

**Pourquoi c'est important** : En startup, vous ne savez pas encore si votre produit va fonctionner. Le Lean Canvas vous aide à identifier rapidement vos hypothèses les plus risquées pour les tester avant d'investir trop de temps et d'argent.

#### Niveau 2 - Approfondissement Expert

**Origine et historique** :

| Date | Événement |
|------|-----------|
| Mai 2010 | Ash Maurya découvre le Business Model Canvas |
| 2010 | Adaptation pour les startups → Lean Canvas |
| Fév 2010 | Publication de *"Running Lean"* (auto-publié, puis O'Reilly) |
| 2024 | Utilisé par plus d'1 million d'entrepreneurs |

**Modifications par rapport au Business Model Canvas** :

| BMC (Osterwalder) | Lean Canvas (Maurya) | Raison du changement |
|-------------------|---------------------|---------------------|
| Partenaires clés | **Problème** | Les partenaires sont secondaires au démarrage |
| Activités clés | **Solution** | Focus sur ce qu'on construit |
| Ressources clés | **Métriques clés** | Mesurer ce qui compte |
| Relations clients | **Avantage injuste** | Ce qui vous rend impossible à copier |

**Structure du Lean Canvas** :

```
┌────────────────┬──────────────┬────────────────┬──────────────┬────────────────┐
│                │              │                │              │                │
│   PROBLÈME     │   SOLUTION   │   PROPOSITION  │   AVANTAGE   │   SEGMENTS     │
│                │              │   DE VALEUR    │   INJUSTE    │    CLIENTS     │
│  Top 3         │  Top 3       │   UNIQUE       │              │                │
│  problèmes     │  features    │                │  Quelque     │  Early         │
│  clients       │              │  Message clair │  chose qui   │  adopters      │
│                │              │  et compelling │  ne peut pas │                │
│                │              │                │  être copié  │                │
│                ├──────────────┤                ├──────────────┤                │
│  Alternatives  │              │                │              │                │
│  existantes    │  MÉTRIQUES   │                │   CANAUX     │                │
│                │    CLÉS      │                │              │                │
│                │              │                │  Chemin vers │                │
│                │  Activités   │                │  les clients │                │
│                │  clés à      │                │              │                │
│                │  mesurer     │                │              │                │
├────────────────┴──────────────┴────────────────┴──────────────┴────────────────┤
│                                                                                 │
│   STRUCTURE DE COÛTS                          FLUX DE REVENUS                   │
│   Coûts fixes/variables                       Modèle de revenus, LTV, prix      │
│                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────┘
```

**Philosophie du Lean Canvas** :
- **Axé sur le problème** : Le problème est plus important que la solution
- **Actionnable** : Chaque case représente une hypothèse à tester
- **Rapide** : Peut être complété en 20 minutes
- **Itératif** : Destiné à évoluer à chaque apprentissage

**Concept d'"Unfair Advantage"** :
L'avantage injuste est quelque chose qui ne peut pas être facilement copié ou acheté :
- Données propriétaires
- Effets de réseau
- Expertise unique / communauté
- Équipe fondatrice exceptionnelle
- Contrats exclusifs

> **[À NOTER]** : La plupart des startups n'ont pas d'unfair advantage au démarrage. C'est normal - il se construit avec le temps.

**Différences clés BMC vs Lean Canvas** :

| Critère | Business Model Canvas | Lean Canvas |
|---------|----------------------|-------------|
| **Cible** | Entreprises établies | Startups, nouveaux projets |
| **Focus** | Modèle économique complet | Hypothèses et risques |
| **Complexité** | Plus complet | Plus léger |
| **Données requises** | Données connues | Hypothèses à tester |
| **Stabilité** | Relativement stable | Évolue rapidement |
| **Temps de création** | Plusieurs heures/jours | 20-60 minutes |

#### Niveau 3 - Application Pratique

**Exemple : Marketplace B2B pour services freelance tech**

| Bloc | Contenu |
|------|---------|
| **Problème** | 1. Difficile de trouver des freelances qualifiés 2. Processus de recrutement long 3. Risque qualité |
| **Segments clients** | Startups tech, PME digitales, DSI |
| **Proposition de valeur unique** | "Trouvez un développeur senior vérifié en 48h" |
| **Solution** | Plateforme de matching, tests techniques, garantie satisfaction |
| **Canaux** | SEO, LinkedIn, partenariats ESN, content marketing |
| **Flux de revenus** | Commission 15% sur missions, abonnement premium entreprises |
| **Structure de coûts** | Plateforme (30%), acquisition (40%), équipe (25%), autres (5%) |
| **Métriques clés** | Nb missions/mois, taux matching, NPS, GMV |
| **Avantage injuste** | Base de 500 freelances pré-qualifiés, algorithme de matching propriétaire |

**Ordre de remplissage recommandé par Ash Maurya** :
1. **Segment clients** (commencer par early adopters)
2. **Problème** (top 3 problèmes + alternatives existantes)
3. **Proposition de valeur unique** (1 phrase claire)
4. **Solution** (top 3 features pour le MVP)
5. **Canaux** (comment atteindre les early adopters)
6. **Flux de revenus** (comment monétiser)
7. **Structure de coûts** (coûts pour lancer)
8. **Métriques clés** (quoi mesurer)
9. **Avantage injuste** (souvent vide au début)

---

### 3.3 Revenue Models pour le Digital

#### Niveau 1 - Vulgarisation

Le revenue model, c'est la réponse à "comment gagnez-vous de l'argent ?". Pour un e-commerce B2C, c'est simple : vous vendez des produits. Mais dans le digital, il existe de nombreuses façons de monétiser : abonnements, commissions, publicité, licences...

#### Niveau 2 - Approfondissement Expert

**Principaux modèles de revenus digitaux** :

| Modèle | Description | Exemples | Métriques clés |
|--------|-------------|----------|----------------|
| **SaaS (Subscription)** | Abonnement récurrent mensuel/annuel | Salesforce, Slack, Netflix | MRR, ARR, Churn, ARPU |
| **Marketplace (Commission)** | % sur chaque transaction | Airbnb, Uber, Etsy | GMV, Take rate, Nb transactions |
| **Freemium** | Version gratuite + payante | Spotify, Dropbox, LinkedIn | Conversion rate, CAC, LTV |
| **Transaction-based** | Frais par transaction | Stripe, PayPal | Volume, Nb transactions, Fees |
| **Advertising** | Revenus publicitaires | Google, Facebook, YouTube | CPM, CPC, DAU/MAU |
| **Licensing** | Licence d'utilisation | Microsoft Office, SAP | Nb licences, ASP |
| **Data/API** | Vente de données ou accès API | Bloomberg, Twilio | Calls API, Data volume |
| **Hardware + Services** | Matériel + services récurrents | Apple, Peloton | Units sold, Attach rate |

**Focus : Modèle SaaS**

```
                    MRR (Monthly Recurring Revenue)
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   New MRR              Expansion MRR          Churned MRR
  (Nouveaux clients)   (Upsells, cross-sells)  (Clients perdus)
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
                         Net New MRR
```

**Métriques SaaS essentielles** :

| Métrique | Formule | Benchmark |
|----------|---------|-----------|
| **MRR** | Somme des revenus récurrents mensuels | - |
| **ARR** | MRR × 12 | - |
| **Churn rate** | Clients perdus / Clients début période | <5% mensuel B2B, <7% B2C |
| **Net Revenue Retention** | (MRR début + expansion - churn) / MRR début | >100% excellent |
| **ARPU** | MRR / Nb clients actifs | Dépend du segment |

**Focus : Modèle Marketplace**

| Métrique | Description |
|----------|-------------|
| **GMV** | Gross Merchandise Value - valeur totale des transactions |
| **Take rate** | % du GMV gardé par la plateforme |
| **Liquidity** | Taux de matching offre/demande |
| **Repeat rate** | % de transactions récurrentes |

#### Niveau 3 - Application Pratique

**Choix du modèle selon le contexte e-commerce** :

| Type de business | Modèle recommandé | Justification |
|------------------|-------------------|---------------|
| Vente de produits B2C | Transaction | Simple, adapté au volume |
| Vente de produits B2B | Transaction + Abonnement | Récurrence pour clients réguliers |
| Place de marché | Commission | Aligne intérêts plateforme/vendeurs |
| SaaS e-commerce (Shopify-like) | Subscription + Transaction | MRR + upside sur transactions |
| Services digitaux | Subscription | Prévisibilité des revenus |

---

### 3.4 Unit Economics

#### Niveau 1 - Vulgarisation

Les unit economics répondent à la question "Gagnez-vous de l'argent sur chaque client ?". Si vous dépensez 100€ pour acquérir un client qui vous rapporte 50€, vous perdez de l'argent à chaque vente. Les unit economics vous permettent de vérifier que votre modèle est viable avant de scaler.

#### Niveau 2 - Approfondissement Expert

**Métriques fondamentales** :

| Métrique | Définition | Formule |
|----------|------------|---------|
| **CAC** | Customer Acquisition Cost | Dépenses marketing & sales / Nb nouveaux clients |
| **LTV** | Lifetime Value | Revenu moyen par client × Durée de vie moyenne |
| **Ratio LTV:CAC** | Retour sur investissement acquisition | LTV / CAC |
| **CAC Payback** | Temps pour récupérer le CAC | CAC / (ARPU × Marge brute) |
| **Churn** | Taux d'attrition clients | Clients perdus / Clients totaux |
| **ARPU** | Average Revenue Per User | Revenus / Nb utilisateurs actifs |

**Formules LTV courantes** :

```
LTV simple = ARPU × Durée de vie client moyenne

LTV avec churn = ARPU / Churn rate mensuel

LTV avec marge = (ARPU × Marge brute) / Churn rate mensuel
```

**Benchmarks LTV:CAC par industrie** :

| Ratio | Interprétation |
|-------|----------------|
| < 1:1 | Non viable, perte d'argent |
| 1:1 - 3:1 | Risqué, peu de marge d'erreur |
| **3:1 - 5:1** | **Bon, croissance durable** |
| 5:1 - 10:1 | Excellent, très efficace |
| > 10:1 | Potentiellement sous-investissement en croissance |

> **[IMPORTANT]** : Le benchmark standard pour SaaS B2B est un ratio LTV:CAC de **3:1 minimum**, avec un **CAC Payback de 12-18 mois**.

**CAC Payback par type de business** :

| Business | CAC Payback cible |
|----------|-------------------|
| E-commerce B2C | 3-6 mois |
| E-commerce B2B | 6-12 mois |
| SaaS SMB | 12-18 mois |
| SaaS Enterprise | 18-24 mois |

**Évolution du CAC (tendance 2020-2025)** :
Le CAC moyen pour les entreprises SaaS a augmenté de plus de 55% sur les 5 dernières années, rendant l'optimisation de l'efficacité acquisition encore plus critique.

#### Niveau 3 - Application Pratique

**Exemple calcul pour e-commerce B2B** :

```
Données :
- Dépenses marketing/sales Q1 : 50 000€
- Nouveaux clients Q1 : 100
- Panier moyen : 500€
- Fréquence achat : 4x/an
- Durée de vie client moyenne : 3 ans
- Marge brute : 35%

Calculs :
CAC = 50 000€ / 100 = 500€
Revenu annuel moyen = 500€ × 4 = 2 000€
LTV = 2 000€ × 3 ans × 35% = 2 100€
Ratio LTV:CAC = 2 100€ / 500€ = 4.2:1 ✅

CAC Payback = 500€ / (2 000€/12 × 35%) = 8.6 mois ✅
```

**Tableau de bord unit economics minimal** :

| Métrique | Ce mois | M-1 | Tendance | Cible |
|----------|---------|-----|----------|-------|
| CAC | 85€ | 92€ | ✅ | <100€ |
| LTV | 340€ | 320€ | ✅ | >300€ |
| LTV:CAC | 4.0 | 3.5 | ✅ | >3.0 |
| Payback | 4.2 mois | 4.8 mois | ✅ | <6 mois |
| Churn | 5.2% | 5.0% | ⚠️ | <5% |

**Erreurs courantes** :
1. Calculer le LTV sans tenir compte du churn
2. Ignorer les coûts variables dans le CAC
3. Utiliser le LTV sur durée de vie illimitée
4. Ne pas segmenter CAC/LTV par canal/cohorte

---

### 3.5 Pricing Strategies

#### Niveau 1 - Vulgarisation

Le pricing, c'est l'art de fixer le bon prix. Trop cher, vous n'avez pas de clients. Pas assez cher, vous laissez de l'argent sur la table et envoyez un signal de faible qualité. Le bon prix capture la valeur que vous créez pour le client.

#### Niveau 2 - Approfondissement Expert

**Principales stratégies de pricing** :

| Stratégie | Principe | Cas d'usage |
|-----------|----------|-------------|
| **Cost-plus** | Coût + marge fixe | Commodités, produits standardisés |
| **Value-based** | Prix basé sur la valeur perçue | SaaS B2B, produits premium |
| **Competitive** | Aligné sur la concurrence | Marchés matures, commodités |
| **Penetration** | Prix bas pour gagner des parts de marché | Lancement, nouveau marché |
| **Skimming** | Prix élevé initial puis baisse | Innovation, early adopters |
| **Freemium** | Gratuit + premium | SaaS, apps, marketplaces |
| **Tiered/Packages** | Plusieurs niveaux de prix | SaaS, services |
| **Dynamic** | Prix variable selon demande/contexte | E-commerce, transport |

**Modèle tiered pricing SaaS** :

```
┌────────────────┬────────────────┬────────────────┐
│     STARTER    │      PRO       │   ENTERPRISE   │
│    29€/mois    │    79€/mois    │     Sur devis  │
├────────────────┼────────────────┼────────────────┤
│ 1 utilisateur  │ 5 utilisateurs │   Illimité     │
│ 1 000 contacts │ 10 000 contacts│   Illimité     │
│ Email support  │ Chat support   │ Support dédié  │
│ Fonctions base │ + Intégrations │ + SSO, API     │
└────────────────┴────────────────┴────────────────┘
```

**Psychologie des prix** :

| Technique | Exemple | Effet |
|-----------|---------|-------|
| Charm pricing | 9,99€ au lieu de 10€ | Perception de prix inférieur |
| Anchoring | "Valeur 500€, aujourd'hui 199€" | Référence de valeur |
| Decoy effect | Option "Pro" rend "Enterprise" attractive | Oriente vers le milieu/haut |
| Bundling | Pack 3 produits à prix réduit | Augmente le panier moyen |

#### Niveau 3 - Application Pratique

**Processus de définition du pricing** :

1. **Comprendre la valeur client** (Value-based)
   - Quel problème résolvez-vous ?
   - Quel est le coût du problème pour le client ?
   - Combien économise-t-il ou gagne-t-il grâce à vous ?

2. **Analyser les coûts** (Cost-plus)
   - Coût de revient unitaire
   - Coûts d'acquisition
   - Marge cible

3. **Benchmark concurrentiel** (Competitive)
   - Positionnement prix du marché
   - Différentiation justifiant un premium

4. **Tester et itérer**
   - A/B testing de prix
   - Analyse de sensibilité prix
   - Feedback clients

**Anti-patterns pricing** :

| Erreur | Conséquence | Solution |
|--------|-------------|----------|
| Sous-tarifer | Perception low-cost, difficulté à augmenter | Valider willingness-to-pay avant |
| Un seul prix | Miss opportunity de capture valeur | Créer des tiers/packages |
| Prix basé uniquement sur coûts | Ignore la valeur perçue | Approche value-based |
| Prix figé | Manque d'adaptation marché | Review trimestrielle |

---

## 4. Scope et Périmètre

### 4.1 Work Breakdown Structure (WBS)

#### Niveau 1 - Vulgarisation

Le WBS est comme le découpage d'un gâteau en parts. Au lieu de regarder un projet énorme et intimidant, vous le découpez en morceaux plus petits et plus gérables. Chaque "part" (lot de travail) devient plus facile à estimer, à assigner et à suivre.

**Pourquoi c'est important** : Sans WBS, vous essayez de manger le gâteau en une seule bouchée. Avec un WBS, chaque membre de l'équipe sait exactement quelle part lui est assignée et peut se concentrer dessus.

#### Niveau 2 - Approfondissement Expert

**Définition PMI (PMBOK)** :
Le WBS est une "décomposition hiérarchique du périmètre total du travail à accomplir par l'équipe projet pour atteindre les objectifs du projet et créer les livrables requis."

**Origine** :
Le concept de WBS a été formalisé par le Département de la Défense américain (DoD) dans les années 1960, puis adopté par le PMI dans le PMBOK.

**Règle des 100%** :
Le WBS doit inclure 100% du travail défini par le scope. Tout le travail aux niveaux inférieurs doit remonter jusqu'aux niveaux supérieurs, sans rien oublier ni rien ajouter.

**Structure hiérarchique** :

```
Niveau 0 : PROJET (Nom du projet)
    │
    ├── Niveau 1 : PHASE / LIVRABLE MAJEUR
    │       │
    │       ├── Niveau 2 : COMPOSANT / SOUS-LIVRABLE
    │       │       │
    │       │       └── Niveau 3 : WORK PACKAGE (lot de travail)
    │       │               │
    │       │               └── (Tâches - hors WBS, dans le planning)
```

**Types de WBS** :

| Type | Description | Cas d'usage |
|------|-------------|-------------|
| **Orienté livrable (Product-based)** | Structuré par les livrables/composants | Développement produit |
| **Orienté phase (Phase-based)** | Structuré par les phases du cycle de vie | Projets séquentiels |
| **Hybride** | Combinaison des deux | Projets complexes |

**Work Package (lot de travail)** :
Selon le PMI, le work package est "le niveau le plus bas du WBS pour lequel le coût et la durée sont estimés et gérés". Caractéristiques :
- Assignable à une personne ou équipe
- Estimable (effort, durée, coût)
- Contrôlable et mesurable
- Généralement 8-80 heures de travail

**WBS Dictionary** :
Document complémentaire qui fournit des détails sur chaque élément du WBS : description, livrables, critères d'acceptation, ressources, estimations.

#### Niveau 3 - Application Pratique

**Exemple WBS pour un site e-commerce B2C** :

```
1. SITE E-COMMERCE B2C
├── 1.1 GESTION DE PROJET
│   ├── 1.1.1 Cadrage et planning
│   ├── 1.1.2 Suivi et reporting
│   └── 1.1.3 Clôture projet
│
├── 1.2 CONCEPTION
│   ├── 1.2.1 Spécifications fonctionnelles
│   ├── 1.2.2 UX/UI Design
│   │   ├── 1.2.2.1 Wireframes
│   │   ├── 1.2.2.2 Maquettes
│   │   └── 1.2.2.3 Design system
│   └── 1.2.3 Architecture technique
│
├── 1.3 DÉVELOPPEMENT
│   ├── 1.3.1 Front-end
│   │   ├── 1.3.1.1 Pages catalogue
│   │   ├── 1.3.1.2 Panier
│   │   └── 1.3.1.3 Checkout
│   ├── 1.3.2 Back-end
│   │   ├── 1.3.2.1 API produits
│   │   ├── 1.3.2.2 API commandes
│   │   └── 1.3.2.3 API paiement
│   └── 1.3.3 Intégrations
│       ├── 1.3.3.1 PSP (paiement)
│       └── 1.3.3.2 Logistique
│
├── 1.4 CONTENU
│   ├── 1.4.1 Catalogue produits
│   ├── 1.4.2 Pages légales
│   └── 1.4.3 FAQ
│
├── 1.5 TESTS
│   ├── 1.5.1 Tests unitaires
│   ├── 1.5.2 Tests d'intégration
│   ├── 1.5.3 Tests utilisateurs
│   └── 1.5.4 Tests performance
│
└── 1.6 DÉPLOIEMENT
    ├── 1.6.1 Infrastructure
    ├── 1.6.2 Migration données
    └── 1.6.3 Go-live
```

**Processus de création** :
1. Identifier les livrables majeurs
2. Décomposer chaque livrable en sous-livrables
3. Continuer jusqu'aux work packages
4. Valider la règle des 100%
5. Numéroter et coder
6. Créer le dictionnaire WBS

**Anti-patterns** :

| Erreur | Impact | Solution |
|--------|--------|----------|
| WBS = planning | Confusion scope/schedule | Séparer WBS (quoi) et planning (quand) |
| Trop détaillé | Micro-management | S'arrêter aux work packages |
| Pas assez détaillé | Estimations imprécises | Descendre jusqu'à 8-80h par work package |
| Oublier des éléments | Scope creep, surprises | Validation par l'équipe + règle 100% |

---

### 4.2 MoSCoW Prioritization

#### Niveau 1 - Vulgarisation

MoSCoW est comme le tri de vos affaires avant un déménagement : ce qui doit absolument être dans le camion (Must), ce qui devrait y être si possible (Should), ce qui serait bien d'avoir (Could), et ce qu'on laisse de côté pour cette fois (Won't).

**Pourquoi c'est important** : Quand les ressources sont limitées (et elles le sont toujours), MoSCoW aide à décider ce qui entre vraiment dans le périmètre vs. ce qui peut attendre.

#### Niveau 2 - Approfondissement Expert

**Origine** :
Créé par **Dai Clegg** chez Oracle UK en 1994, puis intégré au framework DSDM (Dynamic Systems Development Method) en 2002.

**Les 4 catégories** :

| Catégorie | Description | Signification |
|-----------|-------------|---------------|
| **Must have** | Exigences critiques, non négociables | Sans ça, le produit ne fonctionne pas |
| **Should have** | Importantes mais pas vitales | Important, mais on peut trouver un workaround |
| **Could have** | Désirables si temps/budget le permet | "Nice to have" - amélioration incrémentale |
| **Won't have (this time)** | Explicitement hors scope pour cette version | Reporté à une version future |

> **[IMPORTANT]** : "Won't" signifie "Won't have this time", pas "Won't ever". C'est une décision de priorisation, pas un rejet permanent.

**Règle des 60%** :
Pour garantir le succès du projet, les exigences "Must have" ne doivent pas dépasser 60% de l'effort total. Cela laisse de la marge pour les imprévus.

**Intégration avec Timeboxing** :
MoSCoW est conçu pour fonctionner avec des délais fixes. Quand le temps est contraint :
1. Les "Must" sont livrés en priorité
2. Les "Should" ensuite
3. Les "Could" si le temps le permet
4. Les "Won't" sont documentés pour la suite

#### Niveau 3 - Application Pratique

**Exemple pour MVP e-commerce** :

| Feature | Catégorie | Justification |
|---------|-----------|---------------|
| Catalogue produits | **Must** | Core functionality |
| Panier d'achat | **Must** | Impossible de vendre sans |
| Paiement CB | **Must** | Revenue stream principal |
| Compte client | **Should** | Améliore UX mais guest checkout possible |
| Wishlist | **Could** | Nice to have |
| Avis produits | **Could** | Valeur ajoutée, pas critique |
| Multi-langues | **Won't** | V2 - marché local d'abord |
| App mobile | **Won't** | Responsive web first |

**Template de priorisation** :

```
┌─────────────────────────────────────────────────────────┐
│                    MUST HAVE (60% max)                  │
│  - Feature A                                            │
│  - Feature B                                            │
│  - Feature C                                            │
├─────────────────────────────────────────────────────────┤
│                    SHOULD HAVE                          │
│  - Feature D                                            │
│  - Feature E                                            │
├─────────────────────────────────────────────────────────┤
│                    COULD HAVE                           │
│  - Feature F                                            │
│  - Feature G                                            │
├─────────────────────────────────────────────────────────┤
│                    WON'T HAVE (this time)               │
│  - Feature H → prévu pour V2                            │
│  - Feature I → à réévaluer                              │
└─────────────────────────────────────────────────────────┘
```

---

### 4.3 Kano Model

#### Niveau 1 - Vulgarisation

Le modèle Kano classe les features selon l'impact qu'elles ont sur la satisfaction client. Certaines sont comme l'électricité dans un appartement (on s'y attend, ça ne surprend personne), d'autres sont comme une terrasse avec vue (ça fait vraiment plaisir), et d'autres encore dépendent de combien vous en avez (plus de rangement = plus de satisfaction).

#### Niveau 2 - Approfondissement Expert

**Origine** :
Développé par le Dr. **Noriaki Kano**, professeur de management de la qualité à l'Université des Sciences de Tokyo, publié en 1984.

**Les 5 catégories de features** :

```
Satisfaction client
       ▲
       │              ╱ Attractive (Delighters)
       │            ╱
       │          ╱
       │        ╱
       │──────────────────────────────▶ Performance (One-dimensional)
       │        ╲
       │          ╲
       │            ╲
       │              ╲ Must-be (Basic)
       │
       └──────────────────────────────▶ Fonctionnalité présente
```

| Catégorie | Description | Impact si présent | Impact si absent |
|-----------|-------------|-------------------|------------------|
| **Must-be (Basic)** | Attendu, considéré comme acquis | Neutre | Très insatisfait |
| **Performance (One-dimensional)** | Plus = mieux, linéaire | Plus satisfait | Moins satisfait |
| **Attractive (Delighters)** | Surprise positive, non attendu | Ravi | Neutre |
| **Indifferent** | Pas d'impact | Neutre | Neutre |
| **Reverse** | Peut créer de l'insatisfaction | Insatisfait | Satisfait |

**Évolution dans le temps** :
Ce qui est un "delighter" aujourd'hui devient une "performance feature" demain et un "must-have" après-demain. Exemple : le mode sombre sur les apps - surprise en 2015, standard en 2025.

**Questionnaire Kano** :
Pour chaque feature, poser deux questions :
1. **Fonctionnelle** : "Si cette feature est présente, que ressentez-vous ?"
2. **Dysfonctionnelle** : "Si cette feature est absente, que ressentez-vous ?"

Options de réponse : J'aime / Je m'y attends / Neutre / Je peux vivre avec / Je n'aime pas

#### Niveau 3 - Application Pratique

**Exemple pour une app e-commerce** :

| Feature | Catégorie | Stratégie |
|---------|-----------|-----------|
| Paiement sécurisé | Must-be | Obligatoire, pas de différenciation |
| Vitesse de livraison | Performance | Investir pour être meilleur que la concurrence |
| Livraison même jour | Attractive | Différenciateur fort |
| Checkout en 1 clic | Performance → Must-be | Était différenciateur, devient standard |

**Quand utiliser Kano** :
- Priorisation du backlog produit
- Définition du MVP (focus sur Must-be + 1-2 Delighters)
- Analyse concurrentielle
- Product roadmap

---

### 4.4 Story Mapping

#### Niveau 1 - Vulgarisation

Le Story Mapping, c'est comme visualiser le parcours d'un utilisateur sur un tableau. Horizontalement, vous voyez les étapes qu'il traverse (chercher, comparer, acheter). Verticalement, vous voyez le niveau de détail (de "acheter" à "entrer carte bleue", "valider 3D Secure", etc.).

#### Niveau 2 - Approfondissement Expert

**Origine** :
Introduit par **Jeff Patton** en 2005, formalisé dans son livre *"User Story Mapping: Discover the Whole Story, Build the Right Product"* (O'Reilly, 2014).

**Structure d'une Story Map** :

```
                         USER JOURNEY (horizontal)
        ┌──────────────┬──────────────┬──────────────┬──────────────┐
        │   Découvrir  │   Comparer   │   Acheter    │   Recevoir   │
        └──────────────┴──────────────┴──────────────┴──────────────┘
                │              │              │              │
        ┌───────┴───────┐     ...           ...           ...
        │               │
PRIORITÉ│  Rechercher   │  ← BACKBONE (Activities/Epics)
  (vert)│  par catégorie│
        ├───────────────┤
        │  Rechercher   │
        │  par mot-clé  │  ← USER STORIES (détail)
        ├───────────────┤
        │  Filtrer par  │
        │  prix         │
        ├───────────────┤
        │  Scan code    │
        │  barre        │  ← Nice to have
        └───────────────┘
```

**Concepts clés** :

| Terme | Description |
|-------|-------------|
| **Backbone** | La "colonne vertébrale" - les activités principales de l'utilisateur |
| **Walking Skeleton** | Le minimum pour parcourir tout le backbone de bout en bout |
| **Release Slices** | Découpage horizontal pour définir les releases |
| **MVP** | La première slice releasable |

**Avantages vs. Backlog plat** :

| Backlog traditionnel | Story Map |
|---------------------|-----------|
| Liste linéaire | Visualisation 2D |
| Perd le contexte utilisateur | Préserve le parcours |
| Difficile de voir le "big picture" | Vue d'ensemble claire |
| Priorisation feature par feature | Priorisation par release |

#### Niveau 3 - Application Pratique

**Processus de création** :

1. **Identifier le persona principal**
2. **Mapper le parcours utilisateur** (backbone horizontal)
3. **Décomposer chaque activité en user stories** (vertical)
4. **Prioriser verticalement** (haut = prioritaire)
5. **Tracer les lignes de release** (horizontal)
6. **Identifier le MVP** (première ligne)

**Exemple simplifié e-commerce** :

```
Release 1 (MVP)
─────────────────────────────────────────────────────────────
│ Voir catalogue │ Voir fiche   │ Ajouter    │ Payer      │
│ basique        │ produit      │ au panier  │ CB         │
─────────────────────────────────────────────────────────────
Release 2
─────────────────────────────────────────────────────────────
│ Recherche      │ Comparer     │ Modifier   │ Payer      │
│ textuelle      │ 2 produits   │ quantité   │ PayPal     │
─────────────────────────────────────────────────────────────
Release 3
─────────────────────────────────────────────────────────────
│ Filtres        │ Avis clients │ Wishlist   │ Paiement   │
│ avancés        │              │            │ fractionné │
─────────────────────────────────────────────────────────────
```

---

### 4.5 RICE, ICE, WSJF - Frameworks de priorisation

#### Niveau 1 - Vulgarisation

Ces frameworks sont comme des formules mathématiques pour comparer des pommes et des oranges. Au lieu de débattre indéfiniment sur quelle feature faire en premier, vous attribuez des scores et la réponse émerge objectivement.

#### Niveau 2 - Approfondissement Expert

**RICE (Intercom)** :

Développé par Intercom pour prioriser leur roadmap produit.

```
RICE Score = (Reach × Impact × Confidence) / Effort
```

| Facteur | Description | Échelle |
|---------|-------------|---------|
| **Reach** | Nb d'utilisateurs impactés par période | Nombre réel (ex: 1000/mois) |
| **Impact** | Effet sur chaque utilisateur | 0.25, 0.5, 1, 2, 3 |
| **Confidence** | Niveau de certitude des estimations | 50%, 80%, 100% |
| **Effort** | Travail nécessaire | Personne-mois |

**ICE (Sean Ellis)** :

Version simplifiée, plus rapide.

```
ICE Score = Impact × Confidence × Ease
```

| Facteur | Échelle |
|---------|---------|
| Impact | 1-10 |
| Confidence | 1-10 |
| Ease | 1-10 (inverse d'Effort) |

**WSJF (SAFe)** :

Weighted Shortest Job First - optimise la valeur économique.

```
WSJF = Cost of Delay / Job Size

Cost of Delay = User Value + Time Criticality + Risk Reduction/Opportunity Enablement
```

#### Niveau 3 - Application Pratique

**Exemple RICE pour backlog e-commerce** :

| Feature | Reach | Impact | Conf | Effort | Score |
|---------|-------|--------|------|--------|-------|
| Checkout 1-click | 5000 | 2 | 80% | 2 | 4000 |
| Search autocomplete | 8000 | 1 | 100% | 1 | 8000 |
| Wishlist | 2000 | 1 | 80% | 1 | 1600 |
| Apple Pay | 1000 | 2 | 80% | 3 | 533 |

**Résultat** : Priorité = Search autocomplete > Checkout 1-click > Wishlist > Apple Pay

**Quand utiliser quoi** :

| Framework | Cas d'usage |
|-----------|-------------|
| RICE | Équipes produit, besoin de rigueur quantitative |
| ICE | Décisions rapides, moins de données |
| WSJF | Contexte SAFe, optimisation économique |
| MoSCoW | Scope fixe, contraintes fortes |
| Kano | Focus satisfaction client |

---

### 4.6 MVP - Minimum Viable Product

#### Niveau 1 - Vulgarisation

Le MVP, c'est la version la plus simple de votre produit qui permet d'apprendre quelque chose d'utile sur vos clients. Ce n'est pas "le produit minimum", c'est "le minimum pour valider vos hypothèses".

**Analogie** : Vous voulez savoir si les gens veulent traverser une rivière. Le MVP n'est pas de construire un pont miniature - c'est peut-être juste une barque pour voir si des gens veulent traverser.

#### Niveau 2 - Approfondissement Expert

**Origine** :
Le terme a été créé par **Frank Robinson** en 2001, puis popularisé par **Steve Blank** et surtout **Eric Ries** dans *"The Lean Startup"* (2011).

**Définition Eric Ries** :
> "The minimum viable product is that version of a new product which allows a team to collect the maximum amount of validated learning about customers with the least effort."

**Ce que le MVP N'EST PAS** :

| Idée reçue | Réalité |
|------------|---------|
| Un produit au rabais | Un outil d'apprentissage |
| La V1 avec moins de features | Le minimum pour tester une hypothèse |
| Une version buggy | Doit fonctionner correctement |
| Un prototype | Peut être utilisé par de vrais clients |

**Variantes du concept** :

| Terme | Définition | Focus |
|-------|------------|-------|
| **MVP** | Minimum Viable Product | Viabilité, apprentissage |
| **MLP** | Minimum Lovable Product | Expérience émotionnelle (Brian de Haaff, 2013) |
| **SLC** | Simple, Lovable, Complete | Qualité malgré simplicité (Jason Fried) |
| **RAT** | Riskiest Assumption Test | Tester l'hypothèse la plus risquée |

**MLP vs MVP** :
- **MVP** : Peut-on résoudre ce problème ? Quelqu'un paiera-t-il ?
- **MLP** : Les gens vont-ils aimer et recommander ?

#### Niveau 3 - Application Pratique

**Processus de définition du MVP** :

1. **Lister toutes les features envisagées**
2. **Identifier le core value proposition** (la raison d'être du produit)
3. **Pour chaque feature, demander** : "Le produit fonctionne-t-il sans ?"
4. **Retirer tout ce qui n'est pas essentiel** pour valider l'hypothèse principale
5. **Définir les métriques de succès** (que veut-on apprendre ?)

**Exemple : Marketplace de services** :

| Phase | Scope | Objectif |
|-------|-------|----------|
| **MVP** | Landing page + formulaire + matching manuel | Valider qu'il y a une demande |
| **V1** | Plateforme basique, paiement, profils | Valider que les gens paient |
| **V2** | Avis, recherche avancée, app | Scale et rétention |

**Types de MVP** :

| Type | Description | Exemple |
|------|-------------|---------|
| **Landing page** | Page + formulaire signup | Valider intérêt |
| **Concierge MVP** | Service manuel simulant le produit | Valider besoin et prix |
| **Wizard of Oz** | Interface auto, backend manuel | Tester UX sans tech |
| **Single feature** | Une seule fonctionnalité | Valider core value |
| **Piecemeal** | Assemblage d'outils existants | Tester workflow |

**Red flags MVP** :

| Signal | Problème | Solution |
|--------|----------|----------|
| "On a besoin de X aussi" | Scope creep | Revenir à l'hypothèse principale |
| 6 mois de dev pour le MVP | Ce n'est pas un MVP | Réduire, utiliser no-code |
| "C'est pas assez bien" | Perfectionnisme | Lancer et itérer |
| Pas de métriques définies | Impossible de mesurer le succès | Définir les KPIs avant |

---

### 4.7 Scope Creep

#### Niveau 1 - Vulgarisation

Le scope creep, c'est comme un sac à dos de randonnée qui grossit progressivement : vous partez avec l'essentiel, mais petit à petit vous ajoutez "juste" une bouteille, "juste" un livre, "juste" un snack... et vous finissez avec 30kg sur le dos.

#### Niveau 2 - Approfondissement Expert

**Définition** :
Extension non contrôlée du périmètre d'un projet, généralement sans ajustement correspondant du planning, du budget ou des ressources.

**Causes principales** :

| Cause | Description |
|-------|-------------|
| **Périmètre initial flou** | Scope statement vague ou incomplet |
| **Absence de change control** | Pas de processus pour gérer les changements |
| **Stakeholders mal alignés** | Attentes différentes non réconciliées |
| **Peur de dire non** | PM n'ose pas refuser les demandes |
| **"Gold plating"** | Équipe ajoute des features non demandées |
| **Découverte en cours de route** | Complexité révélée pendant le projet |

**Symptômes d'alerte** :

- Délais qui glissent sans fin identifiée
- Budget dépassé régulièrement
- "Petites" demandes fréquentes
- Équipe débordée mais pas de livrable
- Stakeholders insatisfaits malgré le travail fourni

#### Niveau 3 - Application Pratique

**Prévention** :

| Action | Description |
|--------|-------------|
| **Scope Statement clair** | Document écrit, validé, précis |
| **Change Control Process** | Toute modification passe par un processus |
| **Definition of Done** | Critères d'acceptation explicites |
| **Regular scope reviews** | Vérification hebdomadaire du périmètre |
| **Dire non (ou "oui, mais")** | "Oui, avec impact sur délai/budget de X" |

**Template de demande de changement** :

```
DEMANDE DE CHANGEMENT #___

Description : ________________________________
Demandeur : ________________________________
Date : ________________________________

Impact estimé :
- Délai : + ___ jours
- Budget : + ___ €
- Risques : ________________________________

Décision : ☐ Approuvé  ☐ Refusé  ☐ Différé
Validé par : ________________________________
```

---

## 5. Planification et Estimation

### 5.1 Techniques d'estimation

#### Planning Poker

**Niveau 1 - Vulgarisation** :
Le Planning Poker transforme l'estimation en jeu de cartes. Chaque membre de l'équipe vote en secret (avec une carte), puis on révèle en même temps. Si les votes diffèrent, on discute et on revote. C'est démocratique et ça évite qu'une seule personne influence les autres.

**Niveau 2 - Expert** :

**Origine** : Inventé par **James Grenning** en 2002, popularisé par **Mike Cohn** dans *"Agile Estimating and Planning"* (2005).

**Pourquoi ça marche** :
- Évite l'effet d'ancrage (première estimation entendue influence les autres)
- Force la discussion sur les divergences
- Utilise l'intelligence collective

**Cartes typiques** (séquence Fibonacci modifiée) : 0, 1, 2, 3, 5, 8, 13, 21, 34, (?, ∞, ☕)

**Niveau 3 - Pratique** :

| Étape | Action |
|-------|--------|
| 1 | Le PO présente la user story |
| 2 | L'équipe pose des questions de clarification |
| 3 | Chacun choisit une carte en secret |
| 4 | Révélation simultanée |
| 5 | Si consensus : enregistrer l'estimation |
| 6 | Sinon : discussion (plus haut et plus bas expliquent), puis nouveau vote |

---

#### Three-Point Estimation (PERT)

**Niveau 1 - Vulgarisation** :
Au lieu de donner une seule estimation ("ça prendra 5 jours"), vous donnez trois scénarios : optimiste, probable, pessimiste. Puis une formule calcule une moyenne pondérée qui tient compte de l'incertitude.

**Niveau 2 - Expert** :

**Origine** : Program Evaluation and Review Technique (PERT), développé par la US Navy dans les années 1950.

**Formules** :

```
PERT (distribution Beta) :
E = (O + 4M + P) / 6

Triangulaire (plus simple) :
E = (O + M + P) / 3

Écart-type (risque) :
σ = (P - O) / 6
```

Où : O = Optimiste, M = Most likely, P = Pessimiste

**Niveau 3 - Pratique** :

| Tâche | O | M | P | PERT | σ |
|-------|---|---|---|------|---|
| Développement API | 3j | 5j | 10j | 5.5j | 1.2j |
| Intégration paiement | 2j | 3j | 8j | 3.7j | 1.0j |
| Tests | 2j | 4j | 6j | 4j | 0.7j |

**Intervalle de confiance à 95%** : PERT ± 2σ

---

#### T-Shirt Sizing

**Niveau 1 - Vulgarisation** :
Comme choisir la taille d'un t-shirt (XS, S, M, L, XL), vous classez les tâches par taille relative. C'est plus rapide que de donner des chiffres précis et suffisant pour la planification à haut niveau.

**Niveau 2 - Expert** :

| Taille | Effort relatif | Exemple équivalent |
|--------|----------------|-------------------|
| XS | 1 | Changement de config |
| S | 2-3 | Bug fix simple |
| M | 5-8 | Feature moyenne |
| L | 13-20 | Feature complexe |
| XL | 20+ | Epic, à découper |

**Quand utiliser** : Roadmap planning, backlog grooming initial, estimation de haut niveau avant sprint planning.

---

#### #NoEstimates

**Niveau 1 - Vulgarisation** :
Un mouvement qui propose de se passer d'estimations en se concentrant sur le flux et la découpe en petites tâches similaires. Si toutes vos tâches font à peu près la même taille, vous n'avez plus besoin d'estimer - vous comptez simplement combien vous en faites.

**Niveau 2 - Expert** :

**Origine** : Initié par Woody Zuill, Vasco Duarte et Neil Killick en 2012 via Twitter (#NoEstimates).

**Principe** : Remplacer les estimations par :
1. Découpe en petites user stories de taille similaire
2. Mesure du throughput (nombre de stories livrées/sprint)
3. Prédiction basée sur les données historiques

**Livre clé** : Vasco Duarte, *"NoEstimates: How To Measure Project Progress Without Estimating"* (2016)

**Critiques** :
- "Hoax" selon Alistair Cockburn
- Ne fonctionne qu'avec une équipe mature et un découpage discipliné
- Peut être perçu comme un refus de s'engager

**Niveau 3 - Pratique** :

**Quand ça peut fonctionner** :
- Équipe mature avec vélocité stable
- Capacité à découper en petites stories homogènes
- Management qui accepte la prédiction probabiliste

**Quand l'éviter** :
- Contexte contractuel nécessitant des engagements
- Équipe junior ou projet nouveau
- Forte variabilité dans la taille des tâches

---

### 5.2 Velocity et Capacity Planning

**Niveau 1 - Vulgarisation** :
La vélocité, c'est combien de "points" votre équipe livre par sprint. Une fois que vous connaissez cette vitesse, vous pouvez prévoir combien de temps il faudra pour livrer le reste du backlog.

**Niveau 2 - Expert** :

**Vélocité** = Somme des story points livrés par sprint

**Calculs typiques** :
```
Vélocité moyenne = Moyenne des 3-5 derniers sprints
Capacité sprint = Jours disponibles × Facteur de focus (typiquement 0.6-0.8)
Estimation delivery = Points restants / Vélocité moyenne
```

**Facteur de focus** : Prend en compte réunions, interruptions, support, etc.

| Contexte | Facteur de focus |
|----------|------------------|
| Équipe dédiée, peu d'interruptions | 0.8 |
| Contexte normal | 0.6-0.7 |
| Beaucoup de support/meetings | 0.5 |

**Niveau 3 - Pratique** :

**Exemple de calcul** :
```
- Équipe : 4 développeurs
- Sprint : 2 semaines = 10 jours
- Vélocité historique : 32, 28, 35, 30 → Moyenne = 31 points
- Backlog restant : 186 points
- Sprints estimés : 186 / 31 = 6 sprints ≈ 12 semaines
```

---

### 5.3 Critical Path Method (CPM)

**Niveau 1 - Vulgarisation** :
Le chemin critique, c'est la séquence de tâches la plus longue de votre projet. Si une tâche sur ce chemin prend du retard, tout le projet est retardé. Les autres tâches ont du "jeu" (float) - elles peuvent glisser un peu sans impacter la date finale.

**Niveau 2 - Expert** :

**Origine** : Développé par DuPont et Remington Rand dans les années 1950.

**Concepts clés** :

| Terme | Définition |
|-------|------------|
| **ES** (Early Start) | Date au plus tôt de début |
| **EF** (Early Finish) | Date au plus tôt de fin |
| **LS** (Late Start) | Date au plus tard de début |
| **LF** (Late Finish) | Date au plus tard de fin |
| **Total Float** | LF - EF (ou LS - ES) |
| **Free Float** | Marge avant d'impacter le successeur |

**Chemin critique** : Séquence de tâches avec Total Float = 0

**Techniques de compression** :
- **Crashing** : Ajouter des ressources (coûte plus cher)
- **Fast-tracking** : Paralléliser des tâches séquentielles (plus risqué)

**Niveau 3 - Pratique** :

```
Exemple simplifié :

A (3j) ──→ B (5j) ──→ D (4j)
   │                    ↑
   └──→ C (2j) ────────┘

Chemins :
A → B → D = 3 + 5 + 4 = 12 jours (CRITIQUE)
A → C → D = 3 + 2 + 4 = 9 jours

Float de C = 12 - 9 = 3 jours de marge
```

---

## 6. Budgétisation et Finances

### 6.1 Earned Value Management (EVM)

#### Niveau 1 - Vulgarisation

L'EVM répond à trois questions : "Où devrions-nous être ?", "Où sommes-nous vraiment ?", et "Combien avons-nous dépensé ?". En comparant ces trois valeurs, vous savez si vous êtes en avance, en retard, en dessous ou au-dessus du budget.

#### Niveau 2 - Approfondissement Expert

**Origine** : Développé par le Département de la Défense américain dans les années 1960.

**Les trois valeurs de base** :

| Métrique | Définition | Question |
|----------|------------|----------|
| **PV** (Planned Value) | Valeur budgétée du travail planifié | Où devrions-nous être ? |
| **EV** (Earned Value) | Valeur budgétée du travail accompli | Que vaut ce qu'on a fait ? |
| **AC** (Actual Cost) | Coût réel du travail accompli | Combien a-t-on dépensé ? |

**Indicateurs de performance** :

| Indicateur | Formule | Interprétation |
|------------|---------|----------------|
| **SV** (Schedule Variance) | EV - PV | >0 = avance, <0 = retard |
| **CV** (Cost Variance) | EV - AC | >0 = sous budget, <0 = dépassement |
| **SPI** (Schedule Performance Index) | EV / PV | >1 = avance, <1 = retard |
| **CPI** (Cost Performance Index) | EV / AC | >1 = efficace, <1 = dépassement |

**Prévisions** :

| Métrique | Formule | Signification |
|----------|---------|---------------|
| **EAC** (Estimate At Completion) | BAC / CPI | Coût final prévu |
| **ETC** (Estimate To Complete) | EAC - AC | Reste à dépenser |
| **VAC** (Variance At Completion) | BAC - EAC | Écart final prévu |
| **TCPI** (To-Complete Perf. Index) | (BAC - EV) / (BAC - AC) | Performance requise |

**Stabilité du CPI** :
Recherches montrent que le CPI cumulatif se stabilise vers 20-30% d'avancement et ne varie généralement pas de plus de 10% ensuite.

#### Niveau 3 - Application Pratique

**Exemple e-commerce** :

```
Projet : Refonte site e-commerce
Budget total (BAC) : 100 000€
À la semaine 8 sur 16 :

PV (prévu) : 50 000€ (50% du projet)
EV (réalisé) : 40 000€ (40% du scope livré)
AC (dépensé) : 48 000€

Calculs :
SV = 40k - 50k = -10k€ → En retard
CV = 40k - 48k = -8k€ → Dépassement
SPI = 40k/50k = 0.8 → 20% de retard
CPI = 40k/48k = 0.83 → 17% de dépassement

EAC = 100k / 0.83 = 120 500€ → Prévision coût final
```

**Tableau de bord EVM** :

| Indicateur | Valeur | Statut |
|------------|--------|--------|
| SPI | 0.8 | 🔴 Retard |
| CPI | 0.83 | 🔴 Dépassement |
| EAC | 120 500€ | ⚠️ +20.5% |

---

### 6.2 ROI, NPV, IRR

**ROI (Return on Investment)** :
```
ROI = (Gains - Coûts) / Coûts × 100
```

**NPV (Net Present Value)** :
Prend en compte la valeur temps de l'argent.
```
NPV = Σ (Cash Flow / (1 + r)^t) - Investissement initial
```
Si NPV > 0, le projet est rentable.

**IRR (Internal Rate of Return)** :
Taux de rendement qui rend NPV = 0. Si IRR > coût du capital, projet rentable.

**Exemple** :

| Année | Cash Flow | Factor (10%) | Present Value |
|-------|-----------|--------------|---------------|
| 0 | -100 000€ | 1.00 | -100 000€ |
| 1 | +30 000€ | 0.91 | +27 273€ |
| 2 | +40 000€ | 0.83 | +33 058€ |
| 3 | +50 000€ | 0.75 | +37 566€ |
| **NPV** | | | **-2 103€** |

→ Projet légèrement non rentable à 10% de taux d'actualisation.

---

### 6.3 CapEx vs OpEx

| Critère | CapEx | OpEx |
|---------|-------|------|
| **Définition** | Dépenses d'investissement | Dépenses opérationnelles |
| **Exemples** | Serveurs, licences perpétuelles | Cloud, SaaS, maintenance |
| **Comptabilité** | Amortissement sur plusieurs années | Charge de l'exercice |
| **Cash** | Sortie importante upfront | Étalement |
| **Flexibilité** | Faible | Élevée |

**Tendance Cloud** : Migration CapEx → OpEx
- **Avantage** : Flexibilité, scalabilité, pas d'investissement initial lourd
- **Inconvénient** : Coût total potentiellement plus élevé sur le long terme

---

## 7. Gestion des Risques

### 7.1 RAID Log

#### Niveau 1 - Vulgarisation

Le RAID Log est comme un journal de bord qui trace tout ce qui pourrait faire échouer votre projet (Risques), tout ce que vous tenez pour acquis (Assumptions), tout ce qui est déjà un problème (Issues), et tout ce qui dépend d'autres choses (Dependencies).

#### Niveau 2 - Approfondissement Expert

**Les 4 composantes** :

| Composante | Définition | Exemple |
|------------|------------|---------|
| **Risks** | Événement incertain qui POURRAIT impacter le projet | "Le fournisseur paiement pourrait augmenter ses tarifs" |
| **Assumptions** | Hypothèses considérées comme vraies | "L'API existante sera compatible" |
| **Issues** | Problèmes ACTUELS qui impactent le projet | "Le développeur senior est en arrêt maladie" |
| **Dependencies** | Éléments externes dont le projet dépend | "Livraison du serveur par le fournisseur" |

**Différence Risk vs Issue** :
- **Risk** : Futur, incertain, peut être évité
- **Issue** : Présent, certain, doit être résolu

#### Niveau 3 - Application Pratique

**Template RAID** :

```
┌─────────────────────────────────────────────────────────────┐
│ ID   │ Type │ Description      │ Impact │ Owner │ Action   │
├─────────────────────────────────────────────────────────────┤
│ R001 │ Risk │ Retard API       │ High   │ Jean  │ Mitigate │
│ A001 │ Assu │ Budget validé    │ Med    │ PM    │ Verify   │
│ I001 │ Issu │ Bug critique     │ High   │ Dev   │ Fix      │
│ D001 │ Dep  │ Livraison design │ Med    │ UX    │ Track    │
└─────────────────────────────────────────────────────────────┘
```

---

### 7.2 Risk Assessment Matrix

#### Niveau 1 - Vulgarisation

La matrice des risques croise la probabilité qu'un risque se produise avec son impact s'il se produit. Un risque très probable ET à fort impact est critique (rouge). Un risque peu probable ET à faible impact est secondaire (vert).

#### Niveau 2 - Approfondissement Expert

**Matrice Probabilité × Impact** :

```
               Impact
         Low    Med    High
      ┌───────┬───────┬───────┐
 High │  Med  │ High  │ Crit  │
      ├───────┼───────┼───────┤ Probabilité
  Med │  Low  │  Med  │ High  │
      ├───────┼───────┼───────┤
  Low │  Low  │  Low  │  Med  │
      └───────┴───────┴───────┘
```

**Stratégies de réponse** :

| Stratégie | Description | Quand utiliser |
|-----------|-------------|----------------|
| **Avoid** | Éliminer la cause du risque | Risque inacceptable |
| **Mitigate** | Réduire probabilité ou impact | Risque élevé, réductible |
| **Transfer** | Transférer à un tiers | Assurance, sous-traitance |
| **Accept** | Accepter et surveiller | Risque faible ou inévitable |
| **Exploit** | Maximiser (risque positif) | Opportunité |

#### Niveau 3 - Application Pratique

**Exemple Risk Register e-commerce** :

| ID | Risque | Prob | Impact | Score | Réponse |
|----|--------|------|--------|-------|---------|
| R01 | Intégration paiement échoue | 3 | 5 | 15 | Mitigate : POC early |
| R02 | Traffic launch overwhelms server | 4 | 4 | 16 | Mitigate : Load test + CDN |
| R03 | Développeur clé quitte | 2 | 4 | 8 | Accept : Documentation |
| R04 | Délai validation SSL | 2 | 3 | 6 | Transfer : Prestataire dédié |

---

### 7.3 Pre-mortem Analysis

#### Niveau 1 - Vulgarisation

Au lieu d'analyser pourquoi un projet a échoué APRÈS (post-mortem), le pre-mortem imagine que le projet A DÉJÀ échoué et demande à l'équipe "Pourquoi avons-nous échoué ?". C'est plus facile de critiquer quand l'échec est hypothétique.

#### Niveau 2 - Approfondissement Expert

**Origine** : Développé par le psychologue **Gary Klein**, publié dans la Harvard Business Review en 2007 (*"Performing a Project Premortem"*).

**Fondement psychologique** : Basé sur le concept de "prospective hindsight" (études de Mitchell, Russo, Pennington, 1989). Imaginer qu'un événement s'est produit augmente la capacité à identifier les causes de 30%.

**Bénéfices** :
- Libère la parole des "pessimistes"
- Légitime le doute constructif
- Identifie des risques cachés
- Renforce l'engagement (ownership des risques)

**Citation de Klein** :
> "Now, everybody is being asked to think about failure. So instead of looking like a bad teammate, you're pulling in the same direction as everyone else."

#### Niveau 3 - Application Pratique

**Processus (30-45 min)** :

1. **Setup** (2 min) : "Imaginez que nous sommes dans 6 mois. Le projet a échoué spectaculairement."

2. **Brainstorm silencieux** (3 min) : Chacun note toutes les raisons de cet échec.

3. **Tour de table** (15 min) : Chacun partage une raison à la fois, on fait des tours jusqu'à épuisement des idées.

4. **Catégorisation** (5 min) : Grouper les causes par thème.

5. **Priorisation** (5 min) : Voter sur les causes les plus plausibles/dangereuses.

6. **Actions** (10 min) : Définir des actions préventives pour le top 5.

**Exemple de causes identifiées (projet e-commerce)** :
- "On a sous-estimé l'intégration avec l'ERP"
- "Le client a changé de scope 3 fois"
- "L'équipe n'avait pas l'expertise SEO"
- "On n'a pas prévu de plan B pour le paiement"

---

### 7.4 Monte Carlo Simulation

#### Niveau 1 - Vulgarisation

Monte Carlo simule votre projet des milliers de fois avec des variations aléatoires pour vous dire : "Vous avez 70% de chances de finir avant le 15 juin" plutôt que "Vous finirez le 1er juin" (qui est souvent faux).

#### Niveau 2 - Approfondissement Expert

**Principe** : Exécuter des milliers de simulations avec des valeurs aléatoires tirées dans les distributions de probabilité définies pour chaque variable incertaine.

**Outputs typiques** :
- **P10** : 10% de chances d'être en dessous de cette valeur
- **P50** : Valeur médiane
- **P90** : 90% de chances d'être en dessous

**Utilisation en gestion de projet** :
- Estimation de dates de livraison avec intervalles de confiance
- Calcul de contingences budgétaires
- Analyse de sensibilité (quelles variables impactent le plus)

#### Niveau 3 - Application Pratique

**Exemple simplifié** :

```
Tâche A : Optimiste 5j, Probable 8j, Pessimiste 15j
Tâche B : Optimiste 3j, Probable 5j, Pessimiste 10j

Après 10 000 simulations :
- P10 : 10 jours (on a 10% de chances de finir avant)
- P50 : 14 jours (médiane)
- P90 : 22 jours (on a 90% de chances de finir avant)

→ "Nous estimons une livraison entre 10 et 22 jours, avec 50% de probabilité autour de 14 jours."
```

**Outils** :
- @Risk (Palisade)
- Crystal Ball (Oracle)
- Simul8
- Python avec NumPy/SciPy

---

## 8. Gouvernance et Organisation

### 8.1 Matrice RACI

#### Niveau 1 - Vulgarisation

RACI répond à la question "Qui fait quoi ?". Pour chaque tâche, vous définissez qui la Réalise, qui en est Accountable (responsable final), qui doit être Consulté, et qui doit être Informé. Fini les "je croyais que c'était toi".

#### Niveau 2 - Approfondissement Expert

**Les 4 rôles** :

| Rôle | Définition | Règle |
|------|------------|-------|
| **R** - Responsible | Fait le travail | 1 ou plusieurs par tâche |
| **A** - Accountable | Responsable final, valide | **1 seul par tâche** (règle d'or) |
| **C** - Consulted | Expertise sollicitée (bilatéral) | 0 ou plusieurs |
| **I** - Informed | Tenu au courant (unidirectionnel) | 0 ou plusieurs |

**Variantes** :
- **RASCI** : + Support (assiste le Responsible)
- **CAIRO** : + Out-of-the-loop (explicitement non impliqué)
- **DACI** : Driver, Approver, Contributors, Informed

#### Niveau 3 - Application Pratique

**Exemple RACI pour projet e-commerce** :

| Activité | Product Owner | Dev Lead | Designer | PM |
|----------|--------------|----------|----------|-----|
| Définir les specs | R | C | C | A |
| Créer les maquettes | I | C | R | A |
| Développer les features | C | R | C | A |
| Tester | I | R | I | A |
| Déployer | I | R | I | A |
| Communiquer au client | C | I | I | R/A |

**Règles de construction** :
1. Une seule personne A par ligne (pas de responsabilité diluée)
2. Au moins un R par ligne (quelqu'un doit faire le travail)
3. Éviter trop de C (ralentit les décisions)
4. Si une personne est R et A, elle a le contrôle total

---

### 8.2 Stakeholder Management

#### Niveau 1 - Vulgarisation

Les stakeholders sont toutes les personnes impactées par ou ayant de l'influence sur votre projet. Les ignorer, c'est risquer qu'ils le torpillent plus tard. Les gérer, c'est s'assurer qu'ils soutiennent le projet.

#### Niveau 2 - Approfondissement Expert

**Matrice Pouvoir/Intérêt** :

```
         Pouvoir élevé
              │
   Gérer de   │   Gérer de près
     près     │   (Key players)
   (Dormants) │
──────────────┼──────────────
   Surveiller │   Tenir informés
   (Foule)    │   (Défenseurs)
              │
         Pouvoir faible
    Intérêt faible ─────── Intérêt élevé
```

**Stratégies par quadrant** :

| Quadrant | Stratégie |
|----------|-----------|
| **Key Players** (haut/droite) | Engager activement, co-construire |
| **Keep Satisfied** (haut/gauche) | Satisfaire, éviter les surprises |
| **Keep Informed** (bas/droite) | Communiquer régulièrement |
| **Monitor** (bas/gauche) | Surveillance minimale |

#### Niveau 3 - Application Pratique

**Exemple stakeholder register** :

| Stakeholder | Rôle | Pouvoir | Intérêt | Stratégie |
|-------------|------|---------|---------|-----------|
| CEO | Sponsor | Élevé | Moyen | Keep satisfied |
| CMO | Client interne | Élevé | Élevé | Key player |
| Équipe dev | Exécutant | Moyen | Élevé | Keep informed |
| IT Ops | Support | Moyen | Moyen | Monitor/Consult |
| Finance | Budget | Élevé | Faible | Keep satisfied |

---

### 8.3 Communication Plan

**Template minimal** :

| Quoi | Qui | À qui | Fréquence | Canal |
|------|-----|-------|-----------|-------|
| Status report | PM | Sponsor, Steering | Hebdo | Email + Dashboard |
| Stand-up | Équipe | Équipe | Quotidien | Slack/Teams |
| Sprint Review | PO | Stakeholders | Bi-mensuel | Réunion |
| Risk update | PM | Steering | Mensuel | Réunion |
| Newsletter projet | PM | Organisation | Mensuel | Email |

---

## 9. Questions Transversales

### 9.1 Adaptation du formalisme selon la taille du projet

| Taille projet | Budget indicatif | Formalisme recommandé |
|---------------|------------------|----------------------|
| **XS** (1-2 pers, <1 mois) | <10k€ | Lean Canvas, Kanban board, pas de doc formelle |
| **S** (2-5 pers, 1-3 mois) | 10-50k€ | Story Map, OKRs simples, RAID léger |
| **M** (5-10 pers, 3-6 mois) | 50-200k€ | BMC/Lean Canvas, WBS, RACI, Risk Register |
| **L** (10-20 pers, 6-12 mois) | 200k-1M€ | Full documentation, EVM, Governance formelle |
| **XL** (>20 pers, >1 an) | >1M€ | PMO, SAFe/LeSS, Comités, Audits |

**Principe** : "Juste assez" de formalisme pour réduire les risques sans paralyser.

---

### 9.2 Agile vs Waterfall vs Hybrid - Critères de choix

| Critère | → Waterfall | → Agile | → Hybrid |
|---------|-------------|---------|----------|
| **Exigences** | Stables, bien définies | Évolutives, incertaines | Mix |
| **Contraintes réglementaires** | Fortes (aéro, médical) | Faibles | Modérées |
| **Stakeholders** | Disponibilité limitée | Engagement continu | Variable |
| **Équipe** | Distribuée, peu expérimentée | Co-localisée, expérimentée | Mix |
| **Livraison** | Big bang acceptable | Incrémentale souhaitée | Mix |
| **Budget/Contrat** | Fixe | Time & Materials | Mix |

**Water-Scrum-Fall** (Hybrid commun) :
- **Waterfall** pour cadrage initial et déploiement final
- **Agile** pour le développement au milieu

---

### 9.3 Red flags d'un projet mal cadré

| Signal d'alerte | Cause probable | Action recommandée |
|-----------------|----------------|-------------------|
| Scope non documenté | Pression pour démarrer | **STOP** - Documenter avant |
| Pas de budget validé | Sponsor non engagé | Escalader |
| "C'est simple, pas besoin d'estimer" | Optimisme excessif | Exiger des estimations |
| Stakeholders absents du cadrage | Désintérêt ou conflit | Forcer l'engagement |
| Objectifs changeants | Pas de vision claire | Clarifier avec sponsor |
| "On verra en développant" | Manque de préparation | Insister sur Discovery |
| Échéance irréaliste imposée | Deadline politique | Négocier le scope |
| Pas de PM identifié | Personne ne veut le projet | Escalader |

---

### 9.4 Gestion des attentes contradictoires

**Processus de résolution** :

1. **Documenter** les demandes contradictoires
2. **Quantifier** l'impact de chaque option (coût, délai, risque)
3. **Escalader** au niveau décisionnel approprié
4. **Faire décider** - ne pas laisser en suspens
5. **Documenter** la décision et sa justification
6. **Communiquer** à toutes les parties

**Techniques** :
- Réunion de confrontation structurée
- Trade-off matrix (comparer les options)
- Décision par le sponsor si impasse

---

### 9.5 Estimation sans expérience préalable

| Technique | Description |
|-----------|-------------|
| **Estimation par analogie** | Comparer à des projets similaires passés |
| **Estimation paramétrique** | Utiliser des ratios (€/fonctionnalité, j/écran) |
| **Consultation d'experts** | Demander à des personnes expérimentées |
| **Décomposition** | Découper en petits morceaux estimables |
| **Proof of Concept** | Réaliser un POC pour mesurer la vélocité réelle |
| **Contingence élevée** | Ajouter 30-50% de buffer pour l'incertitude |

**Règle d'or** : Plus l'incertitude est élevée, plus la contingence doit l'être.

---

### 9.6 Niveau de documentation optimal

**Principe "Just Enough Documentation"** :
- Documenter ce qui sera utile APRÈS le projet (maintenance, onboarding)
- Documenter les DÉCISIONS et leur rationale
- Ne PAS documenter ce qui est évident dans le code
- Préférer les diagrammes au texte

**Minimum viable documentation pour projet e-commerce** :
- Architecture technique (schéma)
- API documentation (auto-générée si possible)
- Guide de déploiement
- Procédures de support niveau 1
- Décisions techniques majeures (ADR - Architecture Decision Records)

---

## 10. Métiers et Compétences

### 10.1 Project Manager

| Aspect | Détail |
|--------|--------|
| **Définition** | Responsable de la livraison du projet dans les contraintes (scope, coût, délai, qualité) |
| **Responsabilités phase Stratégie** | Élaboration WBS, planning, budget, RACI, risk register, communication plan |
| **Compétences clés** | Leadership, communication, négociation, gestion des risques, planification |
| **Certifications** | PMP (PMI), PRINCE2 (Axelos), CAPM (PMI), PM² (Commission européenne) |
| **Salaire France** | 45-80k€/an selon expérience et secteur |
| **Évolution** | Program Manager, Portfolio Manager, PMO Director |

**PMP (Project Management Professional)** :
- Organisme : PMI (Project Management Institute)
- Prérequis : 36 mois d'expérience (avec Bachelor) ou 60 mois (sans)
- 35h de formation PM
- Examen : 180 questions, 4h
- Coût : ~550$ membres PMI, ~750$ non-membres
- Renouvellement : 60 PDUs / 3 ans

---

### 10.2 Product Manager vs Product Owner

| Aspect | Product Manager | Product Owner |
|--------|-----------------|---------------|
| **Focus** | Stratégique, vision produit | Tactique, backlog |
| **Horizon** | Long terme (roadmap) | Court terme (sprints) |
| **Stakeholders** | Marché, direction, clients | Équipe dev, stakeholders internes |
| **Livrables** | Vision, stratégie, roadmap | User stories, backlog priorisé |
| **Certifications** | CPM (AIPMM), Product School | PSPO (Scrum.org), CSPO (Scrum Alliance) |
| **Contexte** | Peut exister sans Scrum | Rôle Scrum spécifique |

**PSPO (Professional Scrum Product Owner)** :
- Organisme : Scrum.org
- 3 niveaux : PSPO I, II, III
- Pas de formation obligatoire
- Examen : 80 questions, 60 min, score 85%+
- Coût : 200$ (PSPO I)
- Validité : à vie

---

### 10.3 Business Analyst

| Aspect | Détail |
|--------|--------|
| **Définition** | Identifie les besoins business et les traduit en exigences |
| **Responsabilités phase Stratégie** | Analyse des besoins, rédaction BRD, validation des exigences |
| **Compétences clés** | Analyse, modélisation (UML, BPMN), communication, facilitation |
| **Certifications** | CBAP, CCBA (IIBA), PMI-PBA (PMI) |
| **Salaire France** | 40-65k€/an |
| **Évolution** | Senior BA, Solution Architect, Product Manager |

**CBAP (Certified Business Analysis Professional)** :
- Organisme : IIBA (International Institute of Business Analysis)
- Prérequis : 7 500h d'expérience BA sur 10 ans
- 35h de formation
- Examen : 120 questions, 3.5h
- Coût : ~550$ membres IIBA
- Renouvellement : 60 CDUs / 3 ans

---

### 10.4 Scrum Master

| Aspect | Détail |
|--------|--------|
| **Définition** | Facilitateur du processus Scrum, coach de l'équipe |
| **Responsabilités phase Stratégie** | Facilitation des ateliers, accompagnement dans l'adoption Scrum |
| **Compétences clés** | Facilitation, coaching, résolution de conflits, Scrum |
| **Certifications** | PSM (Scrum.org), CSM (Scrum Alliance) |
| **Salaire France** | 45-70k€/an |
| **Évolution** | Agile Coach, Release Train Engineer (SAFe) |

**PSM vs CSM** :

| Critère | PSM (Scrum.org) | CSM (Scrum Alliance) |
|---------|-----------------|---------------------|
| Formation | Optionnelle | Obligatoire (2 jours) |
| Examen | 80 questions, 85%+ | 50 questions, 74%+ |
| Validité | À vie | 2 ans (renouvellement) |
| Coût exam | 200$ | Inclus dans formation (~1500€) |
| Salaire moyen US | ~120k$/an | ~113k$/an |

---

## 11. Checklist de Phase Stratégie

### Objectifs & Vision
- [ ] Objectifs SMART ou OKRs définis et documentés
- [ ] Alignement confirmé avec la stratégie d'entreprise
- [ ] Métriques de succès identifiées

### Business Model
- [ ] Business Model Canvas ou Lean Canvas complété
- [ ] Hypothèses clés identifiées
- [ ] Unit economics validés (CAC, LTV, ratio)
- [ ] Pricing strategy définie

### Scope & Périmètre
- [ ] WBS créé et validé
- [ ] Scope statement documenté
- [ ] MVP clairement défini
- [ ] Priorisation effectuée (MoSCoW, RICE...)
- [ ] "Won't have" explicitement listé

### Planning & Estimation
- [ ] Estimations réalisées (effort, durée, coût)
- [ ] Planning/Roadmap établi
- [ ] Milestones définis
- [ ] Dépendances identifiées

### Budget & Ressources
- [ ] Budget approuvé par sponsor
- [ ] Ressources identifiées et confirmées
- [ ] Contingence définie

### Risques
- [ ] Risk Register créé
- [ ] Top risques avec plans de mitigation
- [ ] Assumptions documentées
- [ ] Pre-mortem réalisé (optionnel mais recommandé)

### Gouvernance
- [ ] RACI défini
- [ ] Stakeholders identifiés et mappés
- [ ] Communication plan établi
- [ ] Processus de change control défini

### Go/No-Go
- [ ] Présentation de cadrage réalisée
- [ ] Validation formelle du sponsor
- [ ] Équipe informée et engagée
- [ ] Kick-off planifié

---

## 12. Red Flags et Anti-Patterns

| Signal d'alerte | Cause probable | Action recommandée |
|-----------------|----------------|-------------------|
| Scope non écrit | Pression pour démarrer vite | **STOP** - Documenter avant tout |
| Pas de budget validé | Sponsor non engagé | Escalation immédiate |
| Estimation "au doigt mouillé" | Manque d'expérience ou pression | Utiliser références, ajouter contingence |
| MVP = v1 complète | Incompréhension du concept | Former, recentrer sur hypothèse clé |
| Pas de PO/PM identifié | Projet orphelin | Nommer un responsable |
| Stakeholders non identifiés | Cadrage bâclé | Workshop stakeholder mapping |
| "Pas besoin de documentation" | Culture cowboy | Imposer minimum viable doc |
| Planning sans marge | Optimisme excessif | Ajouter 20-30% contingence |
| Risques non documentés | Déni ou inexpérience | Atelier identification risques |
| Objectifs vagues | Manque de vision | Revenir à la Discovery |
| Trop de "Must have" | Tout est prioritaire = rien ne l'est | Revoir MoSCoW, limiter à 60% |
| Pas de critères de succès | Comment savoir si on a réussi ? | Définir KPIs mesurables |

---

## 13. Quick Reference

### Frameworks essentiels

| Framework | Usage | Source/Auteur |
|-----------|-------|---------------|
| SMART | Objectifs individuels | Doran (1981) |
| OKR | Alignement organisationnel | Grove/Intel, Doerr |
| Business Model Canvas | Modèle économique | Osterwalder (2005/2010) |
| Lean Canvas | Startups, validation | Maurya (2010) |
| WBS | Décomposition travail | PMI/PMBOK |
| MoSCoW | Priorisation | Clegg/DSDM (1994) |
| Kano | Satisfaction client | Kano (1984) |
| RICE | Priorisation produit | Intercom |
| RACI | Responsabilités | Standard PM |
| RAID | Gestion risques | Standard PM |

### Métriques clés Phase Stratégie

| Métrique | Définition | Cible type |
|----------|------------|------------|
| CAC | Customer Acquisition Cost | Dépend du LTV |
| LTV | Lifetime Value | >3x CAC |
| LTV:CAC ratio | Rentabilité acquisition | 3:1 - 5:1 |
| CAC Payback | Mois pour récupérer CAC | 6-18 mois |
| Churn | Taux d'attrition | <5% mensuel B2B |
| NPS | Net Promoter Score | >50 excellent |
| CPI | Cost Performance Index | >1.0 |
| SPI | Schedule Performance Index | >1.0 |

### Comparatif Agile vs Waterfall vs Hybrid

| Critère | Waterfall | Agile | Hybrid |
|---------|-----------|-------|--------|
| Exigences | Fixes | Évolutives | Mix |
| Planification | Upfront complète | Itérative | Phases Waterfall, itérations Agile |
| Livraison | Big bang | Incrémentale | Par phase |
| Changements | Processus formel, coûteux | Bienvenue | Gérés par phase |
| Documentation | Extensive | Minimale | Adaptée |
| Risque | Détection tardive | Détection précoce | Mix |
| Client | Impliqué début/fin | Impliqué constamment | Variable |
| Meilleur pour | Projets stables, réglementés | Innovation, incertitude | Grande entreprise |

---

## Glossaire

| Terme | Définition |
|-------|------------|
| **ARR** | Annual Recurring Revenue - Revenu récurrent annuel |
| **BAC** | Budget At Completion - Budget total prévu du projet |
| **BMC** | Business Model Canvas |
| **CAC** | Customer Acquisition Cost - Coût d'acquisition client |
| **CBAP** | Certified Business Analysis Professional |
| **CPM** | Critical Path Method - Méthode du chemin critique |
| **CSM** | Certified ScrumMaster |
| **DSDM** | Dynamic Systems Development Method |
| **EAC** | Estimate At Completion - Estimation du coût final |
| **EV** | Earned Value - Valeur acquise |
| **EVM** | Earned Value Management - Gestion de la valeur acquise |
| **GMV** | Gross Merchandise Value - Valeur brute des marchandises |
| **IRR** | Internal Rate of Return - Taux de rentabilité interne |
| **LTV** | Lifetime Value - Valeur vie client |
| **MLP** | Minimum Lovable Product |
| **MRR** | Monthly Recurring Revenue - Revenu récurrent mensuel |
| **MVP** | Minimum Viable Product |
| **NPV** | Net Present Value - Valeur actuelle nette |
| **OKR** | Objectives and Key Results |
| **PERT** | Program Evaluation and Review Technique |
| **PMI** | Project Management Institute |
| **PMBOK** | Project Management Body of Knowledge |
| **PMP** | Project Management Professional |
| **PO** | Product Owner |
| **PSM** | Professional Scrum Master |
| **PSPO** | Professional Scrum Product Owner |
| **PV** | Planned Value - Valeur planifiée |
| **RACI** | Responsible, Accountable, Consulted, Informed |
| **RAID** | Risks, Assumptions, Issues, Dependencies |
| **ROI** | Return On Investment - Retour sur investissement |
| **SaaS** | Software as a Service |
| **SAFe** | Scaled Agile Framework |
| **SMART** | Specific, Measurable, Achievable, Relevant, Time-bound |
| **SPI** | Schedule Performance Index |
| **WBS** | Work Breakdown Structure - Structure de découpage du projet |
| **WSJF** | Weighted Shortest Job First |

---

## Bibliographie et Sources

### Livres de référence

- Osterwalder, A., & Pigneur, Y. (2010). *Business Model Generation*. Wiley.
- Maurya, A. (2012). *Running Lean: Iterate from Plan A to a Plan that Works*. O'Reilly.
- Ries, E. (2011). *The Lean Startup*. Crown Business.
- Doerr, J. (2018). *Measure What Matters: How Google, Bono, and the Gates Foundation Rock the World with OKRs*. Portfolio.
- Patton, J. (2014). *User Story Mapping*. O'Reilly.
- Cohn, M. (2005). *Agile Estimating and Planning*. Prentice Hall.
- Grove, A. S. (1983). *High Output Management*. Random House.
- Locke, E. A., & Latham, G. P. (1990). *A Theory of Goal Setting and Task Performance*. Prentice-Hall.
- Kaplan, R. S., & Norton, D. P. (1996). *The Balanced Scorecard*. Harvard Business School Press.

### Articles académiques et professionnels

- Doran, G. T. (1981). "There's a S.M.A.R.T. Way to Write Management's Goals and Objectives." *Management Review*, 70(11), 35-36.
- Klein, G. (2007). "Performing a Project Premortem." *Harvard Business Review*, September.
- Kaplan, R. S., & Norton, D. P. (1992). "The Balanced Scorecard—Measures That Drive Performance." *Harvard Business Review*, January-February.
- Kano, N. (1984). "Attractive Quality and Must-Be Quality." *Journal of the Japanese Society for Quality Control*.

### Documentation officielle

- PMI. (2021). *A Guide to the Project Management Body of Knowledge (PMBOK® Guide)*, 7th Edition.
- Scrum.org. *The Scrum Guide*. https://www.scrum.org/resources/scrum-guide
- IIBA. (2015). *A Guide to the Business Analysis Body of Knowledge (BABOK® Guide)*, Version 3.0.
- Agile Business Consortium. *DSDM Handbook*. https://www.agilebusiness.org/

### Ressources en ligne

- Strategyzer. https://www.strategyzer.com/ (Business Model Canvas, Value Proposition Canvas)
- Scrum.org. https://www.scrum.org/ (Scrum certifications, resources)
- PMI. https://www.pmi.org/ (Project Management resources, certifications)
- LeanStack. https://leanstack.com/ (Lean Canvas, Running Lean)
- What Matters. https://www.whatmatters.com/ (OKR resources by John Doerr)
- Intercom Blog. https://www.intercom.com/blog/ (RICE framework)

---

## Notes et Limitations

### Éléments non couverts en détail

- **Gestion de programme** : Coordination multi-projets (voir Program Management)
- **Portfolio Management** : Sélection et priorisation des projets au niveau organisation
- **Contracts et procurement** : Gestion des achats et contrats fournisseurs
- **Aspects légaux spécifiques** : RGPD, contrats, CGV (voir phase Conception/Développement)

### Points à vérifier selon le contexte

- Les certifications et leurs coûts évoluent régulièrement
- Les benchmarks (CAC, LTV, salaires) varient selon les secteurs et géographies
- Adapter le niveau de formalisme à la culture d'entreprise

### Zones d'incertitude

- **[À VÉRIFIER]** : Les statistiques de salaires sont indicatives et basées sur des moyennes 2024
- Le mouvement #NoEstimates reste controversé et peu documenté académiquement
- L'efficacité relative des différents frameworks de priorisation n'a pas fait l'objet d'études comparatives rigoureuses

---

**Fin du rapport**

*Ce rapport a été généré avec des informations vérifiées jusqu'à janvier 2025. Pour les certifications et tarifs, consulter les sites officiels des organismes concernés.*
