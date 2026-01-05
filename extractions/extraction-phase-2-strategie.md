# Extraction Phase 2 - Stratégie

**Source** : `/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13/doc/recherche/rapport-phase-2-strategie.md`
**Version** : 1.0 | **Date** : 29 décembre 2025
**Auteur original** : Claude (Deep Research - OPUS 4.5)

---

## 1. Résumé Exécutif

La Phase Stratégie constitue le pont critique entre la Discovery (Phase 1) et la Conception (Phase 3). Elle transforme les insights de la discovery en plan d'action concret, avec des objectifs mesurables, un business model validé, un périmètre défini et des ressources allouées.

**Frameworks principaux** :
- **Objectifs** : SMART (Doran, 1981) pour objectifs individuels, OKR (Grove/Intel, Doerr) pour alignement organisationnel
- **Business Model** : Business Model Canvas (Osterwalder, 2005/2010) pour entreprises établies, Lean Canvas (Maurya, 2010) pour startups
- **Unit Economics** : Ratio LTV:CAC >= 3:1 critique pour viabilité e-commerce
- **Scope** : WBS + priorisation MoSCoW/RICE + MVP comme outil d'apprentissage (pas version minimale)
- **Estimation** : Planning Poker, PERT, T-shirt sizing pour gérer l'incertitude
- **Risques** : RAID Log + Pre-mortem (Klein, 2007) + Monte Carlo pour projets complexes
- **Gouvernance** : RACI avec règle d'or = 1 seul Accountable par tâche

**Décision clé** : Go/No-Go pour Phase Conception

---

## 2. Checklist Complète

### Objectifs & Vision
- [ ] [NON-NÉGOCIABLE] Objectifs SMART ou OKRs définis et documentés
- [ ] [NON-NÉGOCIABLE] Alignement confirmé avec la stratégie d'entreprise
- [ ] [NON-NÉGOCIABLE] Métriques de succès identifiées

### Business Model
- [ ] [NON-NÉGOCIABLE] Business Model Canvas ou Lean Canvas complété
- [ ] [NON-NÉGOCIABLE] Hypothèses clés identifiées
- [ ] [NON-NÉGOCIABLE] Unit economics validés (CAC, LTV, ratio >= 3:1)
- [ ] [NICE-TO-HAVE] Pricing strategy définie

### Scope & Périmètre
- [ ] [NON-NÉGOCIABLE] WBS créé et validé
- [ ] [NON-NÉGOCIABLE] Scope statement documenté
- [ ] [NON-NÉGOCIABLE] MVP clairement défini
- [ ] [NON-NÉGOCIABLE] Priorisation effectuée (MoSCoW, RICE...)
- [ ] [NON-NÉGOCIABLE] "Won't have" explicitement listé

### Planning & Estimation
- [ ] [NON-NÉGOCIABLE] Estimations réalisées (effort, durée, coût)
- [ ] [NON-NÉGOCIABLE] Planning/Roadmap établi
- [ ] [NON-NÉGOCIABLE] Milestones définis
- [ ] [NICE-TO-HAVE] Dépendances identifiées

### Budget & Ressources
- [ ] [NON-NÉGOCIABLE] Budget approuvé par sponsor
- [ ] [NON-NÉGOCIABLE] Ressources identifiées et confirmées
- [ ] [NICE-TO-HAVE] Contingence définie (20-30%)

### Risques
- [ ] [NON-NÉGOCIABLE] Risk Register créé
- [ ] [NON-NÉGOCIABLE] Top risques avec plans de mitigation
- [ ] [NON-NÉGOCIABLE] Assumptions documentées
- [ ] [NICE-TO-HAVE] Pre-mortem réalisé

### Gouvernance
- [ ] [NON-NÉGOCIABLE] RACI défini (1 seul A par tâche)
- [ ] [NON-NÉGOCIABLE] Stakeholders identifiés et mappés
- [ ] [NICE-TO-HAVE] Communication plan établi
- [ ] [NICE-TO-HAVE] Processus de change control défini

### Go/No-Go
- [ ] [NON-NÉGOCIABLE] Présentation de cadrage réalisée
- [ ] [NON-NÉGOCIABLE] Validation formelle du sponsor
- [ ] [NICE-TO-HAVE] Équipe informée et engagée
- [ ] [NICE-TO-HAVE] Kick-off planifié

---

## 3. Frameworks Détaillés

### 3.1 OKR - Objectives and Key Results

**Quand l'utiliser** :
- Organisations de 10+ personnes
- Besoin d'alignement cross-équipes
- Environnements dynamiques nécessitant des pivots
- Culture de transparence et feedback

**Comment** :
```
OBJECTIVE (Qualitatif) - Inspirant, ambitieux, aligné avec vision
├── Key Result 1 (Quantitatif) - Mesurable, outcome, pas output
├── Key Result 2 (Quantitatif) - Vérifiable objectivement
└── Key Result 3 (Quantitatif) - Limité dans le temps
    [Maximum 3-5 KRs par Objective]
```

**Cadence recommandée** :
- OKR annuels : Vision et objectifs stratégiques (2-3 max)
- OKR trimestriels : Objectifs tactiques (3-5 par équipe)
- Check-ins hebdomadaires : Suivi et ajustements
- Grading : Évaluation en fin de trimestre

**Système de scoring (Méthode Google)** :
- 0.0 - 0.3 : Échec - Objectif non atteint
- 0.4 - 0.6 : Progrès significatif
- 0.7 - 1.0 : Succès (cible = 0.7, pas 1.0)

> "Un taux de succès de 70% est considéré comme optimal par Google. Atteindre 100% systématiquement suggère que les objectifs ne sont pas assez ambitieux."

**Exemple concret (startup e-commerce B2C)** :
```
OBJECTIVE (Q1 2025) : Devenir la référence pour les achats de produits bio en ligne

Key Result 1 : Atteindre 50 000 clients actifs mensuels (actuellement 32 000)
Key Result 2 : Augmenter le panier moyen de 45€ à 60€
Key Result 3 : Obtenir un NPS de 60 (actuellement 42)
Key Result 4 : Réduire le délai de livraison moyen de 4 jours à 2 jours
```

**Pièges à éviter** :

| Anti-pattern | Problème | Solution |
|-------------|----------|----------|
| "To-do list OKR" | KRs sont des tâches, pas des résultats | Formuler en outcomes mesurables |
| Trop d'OKRs | Dispersion, perte de focus | Max 3-5 Objectives, 3-5 KRs chacun |
| OKR "business as usual" | Pas d'ambition, pas de stretch | Viser 70% d'atteinte comme succès |
| Pas de suivi | OKRs oubliés après le kickoff | Check-ins hebdomadaires |
| OKR = Évaluation | Crée une culture de sandbagging | Séparer OKR et review de performance |

---

### 3.2 Business Model Canvas (BMC)

**Quand l'utiliser** :
- Entreprises établies (>50 employés)
- Besoin d'alignement stratégique global
- Reporting aux investisseurs/board
- Transformation digitale structurée

**Comment - Les 9 blocs** :

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
│                │  RESSOURCES  │                │    CANAUX    │                │
│                │    CLÉS      │                │              │                │
│                │ De quoi      │                │  Comment     │                │
│                │ avons-nous   │                │  atteignons- │                │
│                │ besoin?      │                │  nous nos    │                │
│                │              │                │  clients?    │                │
├────────────────┴──────────────┴────────────────┴──────────────┴────────────────┤
│   STRUCTURE DE COÛTS                          FLUX DE REVENUS                   │
│   Quels sont les coûts les plus importants?   Comment gagnons-nous de l'argent? │
└─────────────────────────────────────────────────────────────────────────────────┘
```

**Détail des 9 blocs** :

| # | Bloc | Questions clés |
|---|------|----------------|
| 1 | Segments clients | Pour qui créons-nous de la valeur ? Qui sont nos clients les plus importants ? |
| 2 | Proposition de valeur | Quel problème résolvons-nous ? Quel besoin satisfaisons-nous ? |
| 3 | Canaux | Comment nos clients veulent-ils être atteints ? Quels canaux fonctionnent le mieux ? |
| 4 | Relations clients | Quel type de relation chaque segment attend-il ? Comment les fidéliser ? |
| 5 | Flux de revenus | Pour quelle valeur nos clients sont-ils prêts à payer ? Comment paient-ils ? |
| 6 | Ressources clés | Quelles ressources notre proposition de valeur requiert-elle ? |
| 7 | Activités clés | Que devons-nous faire pour créer et délivrer notre proposition ? |
| 8 | Partenaires clés | Qui sont nos partenaires clés ? Quelles ressources acquérons-nous auprès d'eux ? |
| 9 | Structure de coûts | Quels sont les coûts les plus importants ? Quelles ressources coûtent le plus ? |

**Exemple concret (E-commerce B2B fournitures industrielles)** :

| Bloc | Contenu |
|------|---------|
| Segments clients | PME industrielles, artisans, services techniques |
| Proposition de valeur | Catalogue large, livraison J+1, conseil technique, prix compétitifs |
| Canaux | Site web, app mobile, commerciaux terrain, chat support |
| Relations clients | Compte dédié, commercial attitré >5k€/an, self-service autres |
| Flux de revenus | Vente produits (marge 15-25%), services (installation, formation) |
| Ressources clés | Plateforme e-commerce, entrepôts, catalogue produits, équipe commerciale |
| Activités clés | Gestion catalogue, logistique, support client, négociation fournisseurs |
| Partenaires clés | Fournisseurs, transporteurs, intégrateurs techniques |
| Structure de coûts | Achats (60%), logistique (15%), personnel (15%), technologie (5%) |

**Pièges à éviter** :

| Erreur | Impact | Solution |
|--------|--------|----------|
| Trop de segments clients | Dispersion des efforts | Se concentrer sur 1-3 segments prioritaires |
| Proposition de valeur vague | Pas de différenciation | Utiliser le Value Proposition Canvas |
| Ignorer les coûts | Modèle non viable | Valider les unit economics |
| Canvas figé | Obsolescence | Réviser trimestriellement |

---

### 3.3 Lean Canvas

**Quand l'utiliser** :
- Startups en phase de lancement
- Entrepreneurs validant des hypothèses
- Environnements à forte incertitude
- Besoin de rapidité (20-60 minutes pour compléter)

**Comment - Différences avec BMC** :

| BMC (Osterwalder) | Lean Canvas (Maurya) | Raison du changement |
|-------------------|---------------------|---------------------|
| Partenaires clés | **Problème** | Les partenaires sont secondaires au démarrage |
| Activités clés | **Solution** | Focus sur ce qu'on construit |
| Ressources clés | **Métriques clés** | Mesurer ce qui compte |
| Relations clients | **Avantage injuste** | Ce qui vous rend impossible à copier |

**Structure** :

```
┌────────────────┬──────────────┬────────────────┬──────────────┬────────────────┐
│   PROBLÈME     │   SOLUTION   │   PROPOSITION  │   AVANTAGE   │   SEGMENTS     │
│  Top 3         │  Top 3       │   DE VALEUR    │   INJUSTE    │    CLIENTS     │
│  problèmes     │  features    │   UNIQUE       │  Quelque     │  Early         │
│  clients       │              │  Message clair │  chose qui   │  adopters      │
│                │              │  et compelling │  ne peut pas │                │
│  Alternatives  ├──────────────┤                │  être copié  │                │
│  existantes    │  MÉTRIQUES   │                ├──────────────┤                │
│                │    CLÉS      │                │   CANAUX     │                │
│                │  Activités   │                │  Chemin vers │                │
│                │  clés à      │                │  les clients │                │
│                │  mesurer     │                │              │                │
├────────────────┴──────────────┴────────────────┴──────────────┴────────────────┤
│   STRUCTURE DE COÛTS                          FLUX DE REVENUS                   │
│   Coûts fixes/variables                       Modèle de revenus, LTV, prix      │
└─────────────────────────────────────────────────────────────────────────────────┘
```

**Ordre de remplissage recommandé (Ash Maurya)** :
1. Segment clients (commencer par early adopters)
2. Problème (top 3 problèmes + alternatives existantes)
3. Proposition de valeur unique (1 phrase claire)
4. Solution (top 3 features pour le MVP)
5. Canaux (comment atteindre les early adopters)
6. Flux de revenus (comment monétiser)
7. Structure de coûts (coûts pour lancer)
8. Métriques clés (quoi mesurer)
9. Avantage injuste (souvent vide au début)

**Concept d'Unfair Advantage** (ce qui ne peut pas être copié) :
- Données propriétaires
- Effets de réseau
- Expertise unique / communauté
- Équipe fondatrice exceptionnelle
- Contrats exclusifs

> "La plupart des startups n'ont pas d'unfair advantage au démarrage. C'est normal - il se construit avec le temps."

**Exemple concret (Marketplace B2B services freelance tech)** :

| Bloc | Contenu |
|------|---------|
| Problème | 1. Difficile de trouver des freelances qualifiés 2. Processus de recrutement long 3. Risque qualité |
| Segments clients | Startups tech, PME digitales, DSI |
| Proposition de valeur unique | "Trouvez un développeur senior vérifié en 48h" |
| Solution | Plateforme de matching, tests techniques, garantie satisfaction |
| Canaux | SEO, LinkedIn, partenariats ESN, content marketing |
| Flux de revenus | Commission 15% sur missions, abonnement premium entreprises |
| Structure de coûts | Plateforme (30%), acquisition (40%), équipe (25%), autres (5%) |
| Métriques clés | Nb missions/mois, taux matching, NPS, GMV |
| Avantage injuste | Base de 500 freelances pré-qualifiés, algorithme de matching propriétaire |

---

### 3.4 MoSCoW - Priorisation

**Quand l'utiliser** :
- Scope fixe avec contraintes fortes
- Timeboxing (délais fixes)
- Définition de MVP
- Arbitrages scope vs ressources

**Comment - Les 4 catégories** :

| Catégorie | Description | Signification |
|-----------|-------------|---------------|
| **Must have** | Exigences critiques, non négociables | Sans ça, le produit ne fonctionne pas |
| **Should have** | Importantes mais pas vitales | Important, mais on peut trouver un workaround |
| **Could have** | Désirables si temps/budget le permet | "Nice to have" - amélioration incrémentale |
| **Won't have (this time)** | Explicitement hors scope pour cette version | Reporté à une version future |

**Règle des 60%** : Les exigences "Must have" ne doivent pas dépasser 60% de l'effort total pour garantir le succès.

> "Won't" signifie "Won't have this time", pas "Won't ever". C'est une décision de priorisation, pas un rejet permanent.

**Exemple concret (MVP e-commerce)** :

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

**Template** :
```
┌─────────────────────────────────────────────────────────┐
│                    MUST HAVE (60% max)                  │
├─────────────────────────────────────────────────────────┤
│                    SHOULD HAVE                          │
├─────────────────────────────────────────────────────────┤
│                    COULD HAVE                           │
├─────────────────────────────────────────────────────────┤
│                    WON'T HAVE (this time)               │
│                    → prévu pour V2                      │
└─────────────────────────────────────────────────────────┘
```

**Pièges à éviter** :
- Trop de "Must have" (> 60%) : tout est prioritaire = rien ne l'est
- Confondre "Won't" avec "Never"
- Ne pas impliquer les stakeholders dans la priorisation

---

### 3.5 RICE - Scoring de priorisation

**Quand l'utiliser** :
- Équipes produit avec besoin de rigueur quantitative
- Backlog avec nombreuses features à comparer
- Justification objective des décisions

**Comment - La formule** :
```
RICE Score = (Reach × Impact × Confidence) / Effort
```

| Facteur | Description | Échelle |
|---------|-------------|---------|
| **Reach** | Nb d'utilisateurs impactés par période | Nombre réel (ex: 1000/mois) |
| **Impact** | Effet sur chaque utilisateur | 0.25 (minimal), 0.5 (low), 1 (medium), 2 (high), 3 (massive) |
| **Confidence** | Niveau de certitude des estimations | 50%, 80%, 100% |
| **Effort** | Travail nécessaire | Personne-mois |

**Exemple concret (backlog e-commerce)** :

| Feature | Reach | Impact | Conf | Effort | Score | Priorité |
|---------|-------|--------|------|--------|-------|----------|
| Search autocomplete | 8000 | 1 | 100% | 1 | 8000 | 1 |
| Checkout 1-click | 5000 | 2 | 80% | 2 | 4000 | 2 |
| Wishlist | 2000 | 1 | 80% | 1 | 1600 | 3 |
| Apple Pay | 1000 | 2 | 80% | 3 | 533 | 4 |

**Pièges à éviter** :
- Estimations biaisées par l'enthousiasme
- Oublier de mettre à jour les scores après apprentissages
- Ignorer les facteurs qualitatifs

---

### 3.6 WBS (Work Breakdown Structure)

**Quand l'utiliser** :
- Tout projet nécessitant une estimation précise
- Communication claire du scope
- Base pour planning et suivi

**Comment** :

**Définition PMI (PMBOK)** : "Décomposition hiérarchique du périmètre total du travail à accomplir par l'équipe projet pour atteindre les objectifs du projet et créer les livrables requis."

**Règle des 100%** : Le WBS doit inclure 100% du travail défini par le scope. Tout le travail aux niveaux inférieurs doit remonter jusqu'aux niveaux supérieurs, sans rien oublier ni rien ajouter.

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

**Work Package** : Niveau le plus bas du WBS pour lequel le coût et la durée sont estimés et gérés.
- Assignable à une personne ou équipe
- Estimable (effort, durée, coût)
- Contrôlable et mesurable
- Généralement **8-80 heures de travail**

**Exemple concret (site e-commerce B2C)** :
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

**Pièges à éviter** :

| Erreur | Impact | Solution |
|--------|--------|----------|
| WBS = planning | Confusion scope/schedule | Séparer WBS (quoi) et planning (quand) |
| Trop détaillé | Micro-management | S'arrêter aux work packages |
| Pas assez détaillé | Estimations imprécises | Descendre jusqu'à 8-80h par work package |
| Oublier des éléments | Scope creep, surprises | Validation par l'équipe + règle 100% |

---

### 3.7 Estimation - Planning Poker

**Quand l'utiliser** :
- Sprint planning en Scrum
- Estimation collaborative d'équipe
- Éviter l'effet d'ancrage

**Comment** :

**Origine** : Inventé par James Grenning en 2002, popularisé par Mike Cohn dans "Agile Estimating and Planning" (2005).

**Cartes typiques** (séquence Fibonacci modifiée) : 0, 1, 2, 3, 5, 8, 13, 21, 34, (?, infinity, coffee)

| Étape | Action |
|-------|--------|
| 1 | Le PO présente la user story |
| 2 | L'équipe pose des questions de clarification |
| 3 | Chacun choisit une carte en secret |
| 4 | Révélation simultanée |
| 5 | Si consensus : enregistrer l'estimation |
| 6 | Sinon : discussion (plus haut et plus bas expliquent), puis nouveau vote |

**Pourquoi ca marche** :
- Évite l'effet d'ancrage (première estimation entendue influence les autres)
- Force la discussion sur les divergences
- Utilise l'intelligence collective

---

### 3.8 Estimation - T-Shirt Sizing

**Quand l'utiliser** :
- Roadmap planning
- Backlog grooming initial
- Estimation de haut niveau avant sprint planning

**Comment** :

| Taille | Effort relatif | Exemple équivalent |
|--------|----------------|-------------------|
| XS | 1 | Changement de config |
| S | 2-3 | Bug fix simple |
| M | 5-8 | Feature moyenne |
| L | 13-20 | Feature complexe |
| XL | 20+ | Epic, à découper |

---

### 3.9 Estimation - PERT (Three-Point)

**Quand l'utiliser** :
- Gestion de l'incertitude
- Estimation de durée de tâches complexes
- Calcul de contingence

**Comment** :

**Origine** : Program Evaluation and Review Technique (PERT), développé par la US Navy dans les années 1950.

**Formules** :
```
PERT (distribution Beta) :
E = (O + 4M + P) / 6

Triangulaire (plus simple) :
E = (O + M + P) / 3

Écart-type (risque) :
σ = (P - O) / 6

Intervalle de confiance à 95% : PERT ± 2σ
```
Où : O = Optimiste, M = Most likely, P = Pessimiste

**Exemple concret** :

| Tâche | O | M | P | PERT | σ |
|-------|---|---|---|------|---|
| Développement API | 3j | 5j | 10j | 5.5j | 1.2j |
| Intégration paiement | 2j | 3j | 8j | 3.7j | 1.0j |
| Tests | 2j | 4j | 6j | 4j | 0.7j |

---

### 3.10 Gestion des risques - RAID Log

**Quand l'utiliser** :
- Tout projet
- Centraliser les informations critiques
- Suivi et communication des risques

**Comment - Les 4 composantes** :

| Composante | Définition | Exemple |
|------------|------------|---------|
| **Risks** | Événement incertain qui POURRAIT impacter le projet | "Le fournisseur paiement pourrait augmenter ses tarifs" |
| **Assumptions** | Hypothèses considérées comme vraies | "L'API existante sera compatible" |
| **Issues** | Problèmes ACTUELS qui impactent le projet | "Le développeur senior est en arrêt maladie" |
| **Dependencies** | Éléments externes dont le projet dépend | "Livraison du serveur par le fournisseur" |

**Différence Risk vs Issue** :
- **Risk** : Futur, incertain, peut être évité
- **Issue** : Présent, certain, doit être résolu

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

**Stratégies de réponse aux risques** :

| Stratégie | Description | Quand utiliser |
|-----------|-------------|----------------|
| **Avoid** | Éliminer la cause du risque | Risque inacceptable |
| **Mitigate** | Réduire probabilité ou impact | Risque élevé, réductible |
| **Transfer** | Transférer à un tiers | Assurance, sous-traitance |
| **Accept** | Accepter et surveiller | Risque faible ou inévitable |
| **Exploit** | Maximiser (risque positif) | Opportunité |

**Exemple Risk Register e-commerce** :

| ID | Risque | Prob | Impact | Score | Réponse |
|----|--------|------|--------|-------|---------|
| R01 | Intégration paiement échoue | 3 | 5 | 15 | Mitigate : POC early |
| R02 | Traffic launch overwhelms server | 4 | 4 | 16 | Mitigate : Load test + CDN |
| R03 | Développeur clé quitte | 2 | 4 | 8 | Accept : Documentation |
| R04 | Délai validation SSL | 2 | 3 | 6 | Transfer : Prestataire dédié |

---

### 3.11 Pre-mortem Analysis

**Quand l'utiliser** :
- Avant le lancement d'un projet
- Identification des risques cachés
- Légitimer le doute constructif

**Comment** :

**Origine** : Développé par le psychologue Gary Klein, publié dans la Harvard Business Review en 2007 ("Performing a Project Premortem").

**Fondement psychologique** : Basé sur le concept de "prospective hindsight" (Mitchell, Russo, Pennington, 1989). Imaginer qu'un événement s'est produit augmente la capacité à identifier les causes de 30%.

> "Now, everybody is being asked to think about failure. So instead of looking like a bad teammate, you're pulling in the same direction as everyone else." - Gary Klein

**Processus (30-45 min)** :

| Étape | Durée | Action |
|-------|-------|--------|
| 1 | 2 min | Setup : "Imaginez que nous sommes dans 6 mois. Le projet a échoué spectaculairement." |
| 2 | 3 min | Brainstorm silencieux : Chacun note toutes les raisons de cet échec |
| 3 | 15 min | Tour de table : Chacun partage une raison à la fois |
| 4 | 5 min | Catégorisation : Grouper les causes par thème |
| 5 | 5 min | Priorisation : Voter sur les causes les plus plausibles/dangereuses |
| 6 | 10 min | Actions : Définir des actions préventives pour le top 5 |

**Exemple de causes identifiées (projet e-commerce)** :
- "On a sous-estimé l'intégration avec l'ERP"
- "Le client a changé de scope 3 fois"
- "L'équipe n'avait pas l'expertise SEO"
- "On n'a pas prévu de plan B pour le paiement"

---

### 3.12 RACI - Matrice de responsabilités

**Quand l'utiliser** :
- Clarifier les rôles sur un projet
- Éviter les "je croyais que c'était toi"
- Onboarding de nouveaux membres

**Comment - Les 4 rôles** :

| Rôle | Définition | Règle |
|------|------------|-------|
| **R** - Responsible | Fait le travail | 1 ou plusieurs par tâche |
| **A** - Accountable | Responsable final, valide | **1 seul par tâche** (règle d'or) |
| **C** - Consulted | Expertise sollicitée (bilatéral) | 0 ou plusieurs |
| **I** - Informed | Tenu au courant (unidirectionnel) | 0 ou plusieurs |

**Règles de construction** :
1. Une seule personne A par ligne (pas de responsabilité diluée)
2. Au moins un R par ligne (quelqu'un doit faire le travail)
3. Éviter trop de C (ralentit les décisions)
4. Si une personne est R et A, elle a le contrôle total

**Exemple concret (projet e-commerce)** :

| Activité | Product Owner | Dev Lead | Designer | PM |
|----------|--------------|----------|----------|-----|
| Définir les specs | R | C | C | A |
| Créer les maquettes | I | C | R | A |
| Développer les features | C | R | C | A |
| Tester | I | R | I | A |
| Déployer | I | R | I | A |
| Communiquer au client | C | I | I | R/A |

**Variantes** :
- **RASCI** : + Support (assiste le Responsible)
- **CAIRO** : + Out-of-the-loop (explicitement non impliqué)
- **DACI** : Driver, Approver, Contributors, Informed

---

## 4. Métriques et KPIs

| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| **CAC** | Customer Acquisition Cost (Dépenses marketing & sales / Nb nouveaux clients) | Dépend du LTV | >LTV/3 | CRM, Google Analytics |
| **LTV** | Lifetime Value (Revenu moyen par client × Durée de vie moyenne) | >3x CAC | <3x CAC | CRM, Analytics |
| **Ratio LTV:CAC** | Retour sur investissement acquisition | 3:1 - 5:1 | <3:1 non viable | Tableau de bord |
| **CAC Payback** | Temps pour récupérer le CAC | 6-18 mois selon secteur | >24 mois | Finance |
| **Churn** | Taux d'attrition clients (Clients perdus / Clients totaux) | <5% mensuel B2B, <7% B2C | >10% | CRM |
| **ARPU** | Average Revenue Per User (Revenus / Nb utilisateurs actifs) | Croissance positive | Décroissance | Finance |
| **MRR** | Monthly Recurring Revenue | Croissance stable | Chute | Billing system |
| **ARR** | Annual Recurring Revenue (MRR × 12) | Croissance stable | Chute | Billing system |
| **NPS** | Net Promoter Score | >50 excellent | <0 problématique | Surveys |
| **CPI** | Cost Performance Index (EV / AC) | >1.0 | <0.9 dépassement | EVM |
| **SPI** | Schedule Performance Index (EV / PV) | >1.0 | <0.9 retard | EVM |
| **GMV** | Gross Merchandise Value (marketplaces) | Croissance | Stagnation | Platform analytics |
| **Take rate** | % du GMV gardé par la plateforme | 10-20% selon secteur | Trop bas = non viable | Platform analytics |

**Formules LTV courantes** :
```
LTV simple = ARPU × Durée de vie client moyenne
LTV avec churn = ARPU / Churn rate mensuel
LTV avec marge = (ARPU × Marge brute) / Churn rate mensuel
```

**Benchmarks LTV:CAC** :
| Ratio | Interprétation |
|-------|----------------|
| < 1:1 | Non viable, perte d'argent |
| 1:1 - 3:1 | Risqué, peu de marge d'erreur |
| 3:1 - 5:1 | Bon, croissance durable |
| 5:1 - 10:1 | Excellent, très efficace |
| > 10:1 | Potentiellement sous-investissement en croissance |

**CAC Payback par type de business** :
| Business | CAC Payback cible |
|----------|-------------------|
| E-commerce B2C | 3-6 mois |
| E-commerce B2B | 6-12 mois |
| SaaS SMB | 12-18 mois |
| SaaS Enterprise | 18-24 mois |

---

## 5. Anti-patterns Détaillés

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| Scope non documenté | "C'est simple, on sait ce qu'on doit faire" | Scope creep, mauvaise estimation | **STOP** - Documenter avant tout développement |
| Pas de budget validé | Sponsor évite le sujet | Projet interrompu en cours | Escalation immédiate, pas de démarrage sans |
| Estimation "au doigt mouillé" | "Ca devrait prendre 2 semaines" | Dépassement systématique | Utiliser PERT, Planning Poker, références |
| MVP = v1 complète | MVP à 6 mois de dev | Perte de temps et argent | Revenir à l'hypothèse clé à valider |
| Pas de PO/PM identifié | Personne ne prend de décision | Projet orphelin, blocages | Nommer un responsable avant démarrage |
| "Pas besoin de documentation" | Documentation orale uniquement | Perte de connaissance, onboarding difficile | Imposer minimum viable documentation |
| Planning sans marge | Chaque jour compte | Premier aléa = retard projet | Ajouter 20-30% de contingence |
| Risques non documentés | "On verra bien" | Surprises en cours de projet | Atelier identification risques obligatoire |
| Objectifs vagues | "Améliorer le site" | Impossible de mesurer le succès | SMART ou OKRs documentés |
| Trop de "Must have" | Tout est prioritaire | Rien ne l'est, équipe débordée | Revoir MoSCoW, limiter Must à 60% |
| OKR = To-do list | Key Results sont des tâches | Pas de mesure des outcomes | Reformuler en résultats mesurables |
| OKR liés à évaluation | Équipe joue la sécurité | Pas d'ambition, sandbagging | Séparer OKR et review de performance |
| Canvas jamais mis à jour | Business model de 2 ans | Obsolète, décisions sur bases fausses | Révision trimestrielle |
| Gold plating | Équipe ajoute des features non demandées | Retard, budget dépassé | Respecter le scope validé |
| Stakeholders absents | Pas dispo pour les ateliers | Rejets en fin de projet | Forcer l'engagement, escalation |
| RACI avec plusieurs A | "On est tous responsables" | Personne n'est responsable | 1 seul Accountable par tâche |

---

## 6. Outils Recommandés

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| **Business Model** | Strategyzer | Business Model Canvas, Value Proposition Canvas | Miro, Mural |
| **Lean Canvas** | LeanStack | Lean Canvas, Running Lean | Canvanizer, Miro |
| **OKR** | Weekdone, Perdoo | Gestion des OKRs | Notion, Google Sheets |
| **Roadmap** | Productboard, Aha! | Roadmap produit | Notion, Trello, Asana |
| **Story Mapping** | StoriesOnBoard | User Story Mapping | Miro, Mural |
| **WBS** | WBS Schedule Pro | Work Breakdown Structure | MS Project, Excel |
| **Planning** | MS Project, Monday | Planning projet | Smartsheet, Asana |
| **Estimation** | Planning Poker Online | Estimation collaborative | Scrumpoker.online |
| **Risk Management** | @Risk (Palisade) | Monte Carlo Simulation | Crystal Ball, Excel |
| **RACI** | RACI Chart Template | Matrice de responsabilités | Excel, Google Sheets |
| **RAID Log** | RAID Log Template | Gestion Risks/Assumptions/Issues/Dependencies | Confluence, Notion |
| **Dashboard** | Power BI, Tableau | KPIs et métriques | Google Data Studio, Metabase |
| **Unit Economics** | ChartMogul, ProfitWell | CAC, LTV, Churn | Baremetrics, Stripe Sigma |

---

## 7. Rôles Impliqués

| Rôle | Niveau d'implication | Responsabilités Phase Stratégie |
|------|---------------------|--------------------------------|
| **Project Manager** | Élevé (lead) | WBS, planning, budget, RACI, risk register, communication plan |
| **Product Owner** | Élevé | Vision produit, priorisation backlog, définition MVP, OKRs produit |
| **Product Manager** | Élevé | Stratégie produit, roadmap, business model, unit economics |
| **Business Analyst** | Élevé | Analyse des besoins, rédaction BRD, validation des exigences |
| **Sponsor** | Moyen | Validation budget, Go/No-Go, arbitrages escaladés |
| **Scrum Master** | Moyen | Facilitation ateliers, accompagnement Agile |
| **Tech Lead** | Moyen | Estimation technique, identification risques techniques |
| **UX Designer** | Faible à Moyen | Input sur faisabilité UX, personas |
| **Développeurs** | Faible | Input sur estimations techniques |
| **Stakeholders métier** | Variable | Validation besoins, priorisation |

**Certifications associées** :
- **PMP** (Project Management Professional) : PMI, 36-60 mois exp., ~550-750$, 60 PDUs/3 ans
- **PRINCE2** : Axelos, certification méthodologie
- **PSPO** (Professional Scrum Product Owner) : Scrum.org, 200$, validité à vie
- **CSPO** (Certified Scrum Product Owner) : Scrum Alliance, ~1500€ avec formation, 2 ans
- **CBAP** (Certified Business Analysis Professional) : IIBA, 7500h exp., ~550$, 60 CDUs/3 ans
- **PSM** (Professional Scrum Master) : Scrum.org, 200$, validité à vie
- **CSM** (Certified ScrumMaster) : Scrum Alliance, ~1500€, 2 ans

---

## 8. Livrables Attendus

### Livrables obligatoires (Go/No-Go)

| Livrable | Description | Format | Valideur |
|----------|-------------|--------|----------|
| **Objectifs SMART/OKRs** | Objectifs mesurables du projet | Document + présentation | Sponsor |
| **Business Model Canvas / Lean Canvas** | Modèle économique validé | Canvas | Direction |
| **Scope Statement** | Périmètre documenté et validé | Document | Sponsor, PO |
| **WBS** | Décomposition du travail | Arborescence | PM, équipe |
| **MVP défini** | Périmètre v1 avec justification | Document | PO, Sponsor |
| **Planning/Roadmap** | Timeline avec milestones | Gantt/Roadmap | PM, Sponsor |
| **Budget approuvé** | Budget avec contingence | Document financier | Finance, Sponsor |
| **Risk Register** | Risques identifiés avec réponses | RAID Log | PM |
| **RACI** | Matrice de responsabilités | Matrice | PM, équipe |

### Livrables recommandés

| Livrable | Description | Format |
|----------|-------------|--------|
| Unit Economics | CAC, LTV, ratios validés | Tableau de bord |
| Communication Plan | Qui communique quoi à qui | Tableau |
| Change Control Process | Processus de gestion des changements | Document |
| Pre-mortem | Analyse anticipée des risques | Compte-rendu atelier |
| Stakeholder Map | Cartographie pouvoir/intérêt | Matrice |
| WBS Dictionary | Détails sur chaque work package | Document |

---

## 9. Transitions (Entrée/Sortie)

### Critères d'entrée (depuis Phase 1 - Discovery)

| Livrable Discovery | Usage en Stratégie | Critère Go |
|-------------------|-------------------|------------|
| Étude de marché | Validation du business model | Marché validé, TAM/SAM/SOM définis |
| Personas utilisateurs | Priorisation des features | Au moins 2 personas validés par research |
| Analyse concurrentielle | Positionnement et différenciation | Positionnement clair vs concurrence |
| Opportunités identifiées | Base pour définition des objectifs | Problem-solution fit validé |
| Contraintes techniques connues | Input pour estimation et risques | Tech stack validée |
| Validation problem-solution fit | Go/No-Go initial | Evidence qualitative ou quantitative |

**No-Go si** :
- Problem-solution fit non validé
- Pas de personas définis
- Marché non analysé
- Contraintes techniques majeures non identifiées

### Critères de sortie (vers Phase 3 - Conception)

| Livrable Stratégie | Usage en Conception | Critère Go |
|-------------------|---------------------|------------|
| Objectifs SMART/OKRs | Critères de succès | Validés par sponsor, mesurables |
| Business Model Canvas | Guide des décisions produit | Complet, validé par direction |
| Scope documenté (WBS) | Base pour architecture | 100% couverture, validé par équipe |
| MVP défini | Périmètre v1 | Must have < 60%, validé par PO |
| Planning/Roadmap | Timeline conception | Milestones définis, ressources confirmées |
| Budget approuvé | Contraintes ressources | Signature sponsor/finance |
| Risk Register | Points d'attention conception | Top 5 risques avec mitigation |
| RACI | Organisation de l'équipe | 1 seul A par tâche, validé par tous |

**No-Go si** :
- Budget non approuvé
- Scope non documenté
- MVP non défini
- Sponsor non engagé
- RACI non validé
- Risques majeurs sans mitigation

### Décision Go/No-Go

**Processus** :
1. Présentation de cadrage (PM → Steering Committee)
2. Review des livrables obligatoires
3. Validation des critères de sortie
4. Vote Go/No-Go
5. Documentation de la décision

**En cas de No-Go** :
- Identifier les gaps
- Définir les actions correctives
- Replanifier une nouvelle revue
- Documenter les raisons du No-Go

---

## 10. Citations Clés

### Sur les OKR
> "I was first exposed to OKRs at Intel in the 1970s. At the time, Intel was transitioning from a memory company to a microprocessor company, and Andy Grove and the management team needed employees to focus on a set of priorities in order to make a successful transition." - **John Doerr**

### Sur le MVP
> "The minimum viable product is that version of a new product which allows a team to collect the maximum amount of validated learning about customers with the least effort." - **Eric Ries**

### Sur le Pre-mortem
> "Now, everybody is being asked to think about failure. So instead of looking like a bad teammate, you're pulling in the same direction as everyone else." - **Gary Klein**

### Sur les objectifs (Goal-Setting Theory)
La recherche de Locke & Latham démontre que des objectifs spécifiques et difficiles améliorent la performance de **10% à 25%** par rapport à des objectifs de type "faites de votre mieux".

### Sur SMART
> L'acronyme SMART a été introduit par **George T. Doran** dans un article intitulé "There's a S.M.A.R.T. Way to Write Management's Goals and Objectives" publié dans **Management Review** en novembre 1981.

### Sur le taux de succès OKR
> "Un taux de succès de 70% est considéré comme optimal par Google. Atteindre 100% systématiquement suggère que les objectifs ne sont pas assez ambitieux."

### Sur le ratio LTV:CAC
> Le benchmark standard pour SaaS B2B est un ratio LTV:CAC de **3:1 minimum**, avec un **CAC Payback de 12-18 mois**.

### Sur le WBS (PMI/PMBOK)
> "Décomposition hiérarchique du périmètre total du travail à accomplir par l'équipe projet pour atteindre les objectifs du projet et créer les livrables requis."

### Sur MoSCoW
> "Won't" signifie "Won't have this time", pas "Won't ever". C'est une décision de priorisation, pas un rejet permanent.

---

## 11. Références Externes

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
- Duarte, V. (2016). *NoEstimates: How To Measure Project Progress Without Estimating*.

### Articles académiques et professionnels
- Doran, G. T. (1981). "There's a S.M.A.R.T. Way to Write Management's Goals and Objectives." *Management Review*, 70(11), 35-36.
- Klein, G. (2007). "Performing a Project Premortem." *Harvard Business Review*, September.
- Kaplan, R. S., & Norton, D. P. (1992). "The Balanced Scorecard—Measures That Drive Performance." *Harvard Business Review*, January-February.
- Kano, N. (1984). "Attractive Quality and Must-Be Quality." *Journal of the Japanese Society for Quality Control*.

### Documentation officielle
- PMI. (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*, 7th Edition.
- Scrum.org. *The Scrum Guide*. https://www.scrum.org/resources/scrum-guide
- IIBA. (2015). *A Guide to the Business Analysis Body of Knowledge (BABOK Guide)*, Version 3.0.
- Agile Business Consortium. *DSDM Handbook*. https://www.agilebusiness.org/

### Ressources en ligne
- Strategyzer : https://www.strategyzer.com/ (Business Model Canvas, Value Proposition Canvas)
- Scrum.org : https://www.scrum.org/ (Scrum certifications, resources)
- PMI : https://www.pmi.org/ (Project Management resources, certifications)
- LeanStack : https://leanstack.com/ (Lean Canvas, Running Lean)
- What Matters : https://www.whatmatters.com/ (OKR resources by John Doerr)
- Intercom Blog : https://www.intercom.com/blog/ (RICE framework)

### Origines des frameworks
| Framework | Auteur/Source | Année |
|-----------|---------------|-------|
| SMART | George T. Doran | 1981 |
| OKR | Andy Grove (Intel), John Doerr | 1975, 1999 (Google) |
| Business Model Canvas | Alexander Osterwalder | 2005/2010 |
| Lean Canvas | Ash Maurya | 2010 |
| MoSCoW | Dai Clegg (Oracle UK) | 1994 |
| Kano Model | Noriaki Kano | 1984 |
| Story Mapping | Jeff Patton | 2005/2014 |
| RICE | Intercom | 2010s |
| MVP | Frank Robinson, Eric Ries | 2001, 2011 |
| Pre-mortem | Gary Klein | 2007 |
| Balanced Scorecard | Kaplan & Norton | 1992 |
| Goal-Setting Theory | Locke & Latham | 1990 |
| Planning Poker | James Grenning, Mike Cohn | 2002, 2005 |
| PERT | US Navy | 1950s |
| WBS | US DoD, PMI | 1960s |
| EVM | US DoD | 1960s |
| #NoEstimates | Woody Zuill, Vasco Duarte | 2012 |

---

**Fin de l'extraction**

*Extraction réalisée le 4 janvier 2026 à partir du rapport de recherche Phase 2 - Stratégie (version 1.0 du 29 décembre 2025).*
