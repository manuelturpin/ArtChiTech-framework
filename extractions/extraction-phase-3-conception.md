# Extraction Phase 3 - Conception

## 1. Resume Executif (max 200 mots)

La phase de Conception constitue le pont crucial entre la strategie et le developpement. Elle transforme les insights utilisateur et les objectifs business en solutions tangibles et testables avant l'investissement massif du developpement.

**Points cles :**
- Le Design Thinking (IDEO/Stanford), le Double Diamond (Design Council UK) et le Design Sprint (Google Ventures) partagent une philosophie commune : diverger pour explorer, converger pour decider.
- L'architecture de l'information (IA) est le squelette invisible de tout produit digital. Les methodes de card sorting et tree testing permettent de valider la structure informationnelle avant la conception visuelle.
- UX et UI sont distincts mais interdependants : l'UX definit le "quoi" et le "pourquoi", l'UI definit le "comment".
- Le prototypage est un investissement, pas un cout. Un prototype teste avec 5 utilisateurs revele 85% des problemes d'utilisabilite.
- L'architecture technique doit suivre les besoins, pas les modes. 61% des entreprises ont adopte les microservices, mais 29% sont revenues au monolith.
- L'accessibilite n'est plus optionnelle. WCAG 2.2 (ISO/IEC 40500:2025) est le standard legal.

---

## 2. Checklist Complete

### UX/UI

- [ ] **User flows documentes** [NON-NEGOCIABLE]
- [ ] **Architecture de l'information validee** [NON-NEGOCIABLE]
- [ ] **Wireframes valides** [NON-NEGOCIABLE]
- [ ] **Mockups haute fidelite approuves** [NON-NEGOCIABLE]
- [ ] **Prototype interactif cree** [NON-NEGOCIABLE]
- [ ] **Usability tests conduits (min 5 utilisateurs)** [NON-NEGOCIABLE]
- [ ] **Design system initie** [NON-NEGOCIABLE]
- [ ] **Accessibilite verifiee (WCAG AA)** [NON-NEGOCIABLE]
- [ ] **Responsive design verifie** [NON-NEGOCIABLE]
- [ ] **Design handoff prepare** [NON-NEGOCIABLE]

### Architecture

- [ ] **Architecture technique choisie et documentee** [NON-NEGOCIABLE]
- [ ] **ADRs rediges** [NON-NEGOCIABLE]
- [ ] **API design documente (OpenAPI)** [NON-NEGOCIABLE]
- [ ] **Database schema defini** [NON-NEGOCIABLE]
- [ ] **Infrastructure planifiee** [NICE-TO-HAVE]
- [ ] **Security considerations documentees** [NON-NEGOCIABLE]

### Checklist minimum accessibilite AA

- [ ] **Contraste >= 4.5:1** [NON-NEGOCIABLE]
- [ ] **Navigation clavier complete** [NON-NEGOCIABLE]
- [ ] **Focus visible** [NON-NEGOCIABLE]
- [ ] **Alternatives textuelles (alt)** [NON-NEGOCIABLE]
- [ ] **Labels de formulaire** [NON-NEGOCIABLE]
- [ ] **Messages d'erreur explicites** [NON-NEGOCIABLE]

### Design Handoff

- [ ] **Figma files organises** [NON-NEGOCIABLE]
- [ ] **Design tokens (JSON/CSS)** [NON-NEGOCIABLE]
- [ ] **Specs d'interaction** [NON-NEGOCIABLE]
- [ ] **Assets exportes** [NON-NEGOCIABLE]
- [ ] **Documentation des comportements** [NON-NEGOCIABLE]
- [ ] **Cas limites documentes** [NICE-TO-HAVE]

---

## 3. Frameworks Detailles

### 3.1 Design Thinking (IDEO/Stanford d.school)

**Quand l'utiliser :**
- Pour la resolution de problemes centres sur l'humain
- Projets complexes necessitant une exploration approfondie
- Duree typique : 2-4 semaines

**Comment (Les 5 phases) :**

1. **Empathize (Empathie)** : Immersion dans le contexte utilisateur
   - Methodes : interviews, observation terrain, shadowing
   - Output : empathy maps, verbatims, insights bruts

2. **Define (Definition)** : Synthese des insights en probleme actionnable
   - Methodes : affinity diagrams, point of view statements
   - Output : "How Might We" (HMW) statements

3. **Ideate (Ideation)** : Generation massive d'idees
   - Methodes : brainstorming, Crazy 8s, SCAMPER
   - Output : idees priorisees, concepts initiaux

4. **Prototype (Prototypage)** : Materialisation rapide des concepts
   - Methodes : paper prototypes, wireframes, mockups
   - Output : prototype testable

5. **Test (Test)** : Validation avec utilisateurs reels
   - Methodes : usability testing, A/B testing
   - Output : feedback actionnable, iterations

**Exemple concret :**
Un medecin qui, au lieu de simplement prescrire un medicament, cherche d'abord a comprendre profondement votre mode de vie, vos peurs et vos habitudes avant de proposer un traitement.

**Pieges a eviter :**
- Sauter la phase Empathize ("on connait deja nos utilisateurs")
- Limiter l'ideation aux 3 premieres idees venues
- Prototyper en haute fidelite avant validation du concept
- Tester avec des collegues au lieu d'utilisateurs reels

**Variantes :**
- **IDEO Human-Centered Design** : Focus sur les contextes emergents
- **IBM Enterprise Design Thinking** : Adaptation aux grandes organisations
- **Google Design Sprint** : Version compressee sur 5 jours

---

### 3.2 Double Diamond (Design Council UK)

**Quand l'utiliser :**
- Pour visualiser clairement le processus de design
- Projets necessitant une distinction claire entre espace probleme et espace solution
- Duree : Variable

**Comment (Les 4 phases) :**

**Premier diamant : Espace probleme**
1. **Discover** : Phase divergente - Recherche utilisateur, benchmark
2. **Define** : Phase convergente - Synthese, formulation du probleme

**Second diamant : Espace solution**
3. **Develop** : Phase divergente - Ideation, prototypage
4. **Deliver** : Phase convergente - Selection, implementation

**Exemple concret :**
Le processus de design comme deux losanges successifs. Le premier losange aide a comprendre le vrai probleme, le second a trouver la bonne solution.

**Pieges a eviter :**
- Confondre les phases divergentes et convergentes
- Passer trop vite du premier au second diamant sans avoir clairement defini le probleme

**Differences avec Design Thinking :**

| Aspect | Design Thinking | Double Diamond |
|--------|-----------------|----------------|
| Origine | IDEO/Stanford (USA) | Design Council (UK) |
| Structure | 5 phases | 4 phases |
| Focus | Processus iteratif | Visualisation divergence/convergence |

---

### 3.3 Atomic Design (Brad Frost)

**Quand l'utiliser :**
- Pour creer des design systems evolutifs
- Projets necessitant coherence et reutilisabilite
- Equipes frontend multi-developpeurs

**Comment (Les 5 niveaux) :**

1. **Atoms** : Elements de base indivisibles
   - Exemples : Boutons, inputs, labels, icons

2. **Molecules** : Groupes d'atomes fonctionnels
   - Exemples : Search form = input + button

3. **Organisms** : Sections complexes
   - Exemples : Header = logo + nav + search

4. **Templates** : Agencement structurel
   - Exemples : Layout de page sans contenu reel

5. **Pages** : Implementation finale
   - Exemples : Templates avec contenu reel

**Exemple concret :**
Organisation des elements d'interface comme en chimie : atomes -> molecules -> organismes -> templates -> pages.

**Pieges a eviter :**
- Creer des atomes trop specifiques qui ne sont pas reutilisables
- Sauter les niveaux intermediaires
- Manque de documentation pour chaque niveau

---

### 3.4 Design Sprint (Google Ventures)

**Quand l'utiliser :**
- Questions critiques necessitant reponse rapide
- Projets avec contraintes de temps fortes
- Duree fixe : 5 jours

**Comment (Structure jour par jour) :**

| Jour | Focus | Activites cles |
|------|-------|----------------|
| **Lundi** | Map | Definir le defi, cartographier le parcours |
| **Mardi** | Sketch | Revoir solutions existantes, Crazy 8s |
| **Mercredi** | Decide | Critique, vote, storyboard |
| **Jeudi** | Prototype | Construire un prototype realiste |
| **Vendredi** | Test | 5 interviews utilisateurs |

**Roles requis :**
- **Decider** : Personne ayant l'autorite de trancher
- **Facilitator** : Guide le processus
- **Team** : 5-7 personnes max, multidisciplinaire

**Exemple concret :**
Utilise par Slack, Airbnb, LEGO, Google, IDEO, McKinsey pour valider rapidement des concepts.

**Pieges a eviter :**
- Equipe trop grande (>7 personnes)
- Absence du Decider
- Prototype trop ambitieux pour une journee

---

### 3.5 Design System

**Quand l'utiliser :**
- Produits a long terme avec multiples interfaces
- Equipes design/dev collaboratives
- Besoin de coherence visuelle et comportementale

**Comment (Composants) :**

| Couche | Contenu |
|--------|---------|
| **Foundations** | Couleurs, typographie, espacement |
| **Design Tokens** | Variables partagees (CSS, JSON) |
| **Components** | Boutons, inputs, cards, modals |
| **Patterns** | Combinaisons de composants |
| **Guidelines** | Regles d'utilisation, accessibilite |

**Design systems de reference :**

| Systeme | Entreprise | Forces |
|---------|------------|--------|
| Material Design | Google | Complet, multiplateforme |
| Carbon | IBM | Accessibilite, enterprise |
| Polaris | Shopify | E-commerce |
| Ant Design | Ant Financial | React, enterprise |
| Fluent | Microsoft | Cross-platform |

**Pieges a eviter :**
- Creer sans maintenir (design system mort)
- Documentation insuffisante
- Tokens non synchronises entre design et code

---

### 3.6 Lean UX

**Quand l'utiliser :**
- Environnements agiles
- Startups et produits en iteration rapide
- Duree : Continu

**Comment (12 principes fondamentaux) :**
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

**Pieges a eviter :**
- Confondre Lean UX avec "pas de documentation"
- Oublier la validation utilisateur
- Iterer sans mesurer

---

### 3.7 C4 Model (Architecture)

**Quand l'utiliser :**
- Documentation d'architecture technique
- Communication entre equipes techniques
- Onboarding de nouveaux developpeurs

**Comment (4 niveaux) :**
1. **Context** : Vue systeme dans son environnement
2. **Container** : Applications, services, bases de donnees
3. **Component** : Composants internes d'un container
4. **Code** : Classes, fonctions (optionnel)

**Pieges a eviter :**
- Trop de details au niveau Context
- Confondre Container et Component

---

### 3.8 Architecture Decision Records (ADR)

**Quand l'utiliser :**
- Toute decision architecturale significative
- Pour historiser le "pourquoi" des choix

**Comment (Format) :**
```markdown
# ADR-001: Choix de PostgreSQL

## Status
Accepted

## Context
Nous devons choisir une base de donnees.

## Decision
Nous utiliserons PostgreSQL.

## Consequences
- ACID compliance, support JSONB
- Pas de scaling horizontal natif
```

**Pieges a eviter :**
- ADRs trop longs
- Oublier les consequences negatives
- Ne pas maintenir a jour le statut

---

## 4. Metriques et KPIs

| Metrique | Definition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| Task Success Rate | % utilisateurs completant une tache | >80% | <60% | Usability tests |
| SUS Score | System Usability Scale (/100) | >68 acceptable, >80 bon | <50 | Questionnaire SUS |
| Findability | % trouvant la bonne reponse (tree test) | >70% | <50% | Optimal Workshop |
| Directness | % sans backtracking | >60% | <40% | Tree testing |
| Time on Task | Temps moyen pour completer | Variable selon tache | >3x temps optimal | Usability tests |
| Error Rate | % d'erreurs commises | <15% | >30% | Usability tests |
| NPS | Net Promoter Score (-100 a +100) | >30 | <0 | Enquete post-test |
| Contraste WCAG | Ratio de contraste texte/fond | >=4.5:1 | <4.5:1 | Lighthouse, axe |
| Target Size | Taille des zones cliquables | >=24x24px (WCAG 2.2 AA) | <24px | Inspection manuelle |
| Touch Target Mobile | Zones tactiles mobile | >=44x44px (iOS), >=48x48dp (Android) | <44px | Design review |

---

## 5. Anti-patterns Detailles

| Anti-pattern | Symptome | Impact | Prevention |
|--------------|----------|--------|------------|
| **Sauter la phase Empathize** | "On connait deja nos utilisateurs" | Solution deconnectee des besoins reels | User research obligatoire en debut de projet |
| **Pas de tests utilisateur** | Aucun feedback utilisateur avant dev | 85% des problemes non detectes | Min 5 tests guerrilla |
| **Design non responsive** | Conception desktop-only | Mauvaise experience mobile (>50% trafic) | Approche mobile-first |
| **Architecture sur-dimensionnee** | Microservices pour petit projet | Complexite operationnelle, couts | Start simple (monolith) |
| **Wireframes sautes** | Passer directement aux mockups hi-fi | Attachement premature, iterations couteuses | Lo-fi obligatoire |
| **Stakeholders absents** | Decisions sans validation | Refonte complete en fin de projet | Invitations formelles, Decider identifie |
| **Developpeurs exclus** | Design sans contraintes techniques | Infaisabilite technique | Sessions pair design des wireframes |
| **Pas de documentation** | Aucun ADR, specs manquantes | Decisions non tracees, onboarding difficile | ADRs courts mais systematiques |
| **Accessibilite "plus tard"** | A11y reportee apres developpement | Refonte couteuse, risque legal | A11y des le wireframe |
| **Limiter l'ideation** | Se contenter des 3 premieres idees | Solutions sous-optimales | Techniques Crazy 8s, SCAMPER |
| **Prototyper en hi-fi trop tot** | Mockup detaille avant validation concept | Temps perdu sur mauvais concept | Valider lo-fi avant hi-fi |
| **Tester avec collegues** | Tests internes au lieu d'utilisateurs reels | Biais de confirmation | Recruter utilisateurs cibles |
| **Questions orientees** | "C'est facile a utiliser, non ?" | Donnees biaisees | Protocole Think-Aloud neutre |
| **Aider le participant** | Intervenir quand utilisateur bloque | Masque les vrais problemes | Observer sans intervenir |
| **Design par comite** | Decisions par consensus dilue | Design mediocre, delais | Decider identifie, criteres objectifs |

---

## 6. Outils Recommandes

| Categorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| **Design + Prototype** | Figma | Design UI, prototypage, collaboration | Sketch, Adobe XD |
| **Wireframing lo-fi** | Balsamiq | Wireframes rapides | Whimsical, papier |
| **Wireframing mid-fi** | Figma | Structure precise | Whimsical |
| **Prototype avance** | ProtoPie | Micro-interactions complexes | Principle, Axure |
| **Prototype code** | Framer | Prototypes en code | Webflow, Storybook |
| **Card Sorting** | Optimal Workshop | Tests IA | UserZoom, UXMetrics, Maze |
| **Tree Testing** | Optimal Workshop | Validation navigation | UserZoom, Maze |
| **User Journey** | Miro | Cartographie parcours | Mural, Smaply, UXPressia |
| **Usability Testing** | UserTesting | Tests moderes/non-moderes | Maze, Lookback |
| **Accessibilite** | Lighthouse | Audit automatise | axe DevTools, WAVE |
| **Lecteur ecran** | NVDA (Windows) | Test accessibilite | VoiceOver (Mac) |
| **API Documentation** | Swagger/OpenAPI | Specs REST | Postman |
| **Architecture diagrammes** | Draw.io | Schemas architecture | Lucidchart, Miro |
| **Design Tokens** | Tokens Studio (Figma) | Variables design | Style Dictionary |
| **Search e-commerce** | Algolia | Recherche performante | Elasticsearch |
| **CDN** | Cloudflare | Performance, cache | AWS CloudFront |
| **Paiement** | Stripe | Integration paiement | PayPal |

---

## 7. Roles Impliques

| Role | Niveau d'implication | Responsabilites |
|------|---------------------|-----------------|
| **UX Designer** | Principale | User flows, wireframes, tests utilisateurs, architecture de l'information |
| **UI Designer** | Principale | Mockups haute fidelite, design system, style guides |
| **Product Designer** | Principale | Role hybride UX + UI + strategie produit |
| **Solutions Architect** | Principale | Choix d'architecture, selection technologies, documentation technique |
| **Technical Architect** | Principale | Specifications API, architecture technique detaillee |
| **Product Manager/Owner** | Critique | Validation des user stories, priorisation, role de Decider |
| **Developpeurs Frontend** | Importante | Revue faisabilite, contraintes techniques, design handoff |
| **Developpeurs Backend** | Importante | Contraintes API, base de donnees, infrastructure |
| **QA** | Moderee | Validation accessibilite, edge cases |
| **Stakeholders** | Moderee (validation) | Approbation mockups, validation orientations |
| **Utilisateurs finaux** | Critique (tests) | Usability testing (min 5 participants) |

**Certifications par role :**

| Role | Certifications |
|------|---------------|
| UX Designer | Nielsen Norman UX Certificate, Google UX Design, CPUX-F/UR/DS/UT |
| Solutions Architect | AWS Solutions Architect, Google Cloud Professional, Azure Expert, TOGAF |

**Salaires 2024-2025 :**

| Role | France | USA |
|------|--------|-----|
| UX Designer | 35-70K EUR | $80-160K |
| UI Designer | 35-75K EUR | $75-150K |
| Product Designer | 45-90K EUR | $100-200K |
| Solutions Architect | 60-90K EUR | $140-200K+ |

---

## 8. Livrables Attendus

### Livrables UX/UI

| Livrable | Responsable | Consommateur | Format |
|----------|-------------|--------------|--------|
| User flows documentes | UX Designer | UI Designer, Developpeurs | Miro/Figma |
| Architecture de l'information | UX Designer | UI Designer, Developpeurs | Documentation |
| Wireframes low/mid-fi | UX Designer | UI Designer, Developpeurs | Figma/Balsamiq |
| Mockups high-fi | UI Designer | Developpeurs Frontend | Figma |
| Design System (tokens + composants) | Product Designer | Developpeurs, QA | Figma + JSON/CSS |
| Prototype interactif | UX/UI Designer | Stakeholders, Utilisateurs | Figma/ProtoPie |
| Rapport usability tests | UX Designer | Product Manager, Equipe | Document |
| Design handoff | UI Designer | Developpeurs | Figma Dev Mode |

### Livrables Architecture

| Livrable | Responsable | Consommateur | Format |
|----------|-------------|--------------|--------|
| Documentation architecture technique | Solutions Architect | Developpeurs Backend | Markdown/Confluence |
| ADRs (Architecture Decision Records) | Solutions Architect | Equipe technique | Markdown |
| Specifications API (OpenAPI/Swagger) | Technical Architect | Developpeurs | YAML/JSON |
| Database schema | Technical Architect | Developpeurs Backend | Diagramme ERD |
| Infrastructure plan | Solutions Architect | DevOps | Documentation |
| Security considerations | Solutions Architect | Equipe technique | Documentation |

---

## 9. Transitions (Entree/Sortie)

### Criteres d'Entree (Prerequisites de la phase Strategie)

| Element | Source | Criticite | Critere Go |
|---------|--------|-----------|------------|
| Personas valides | Phase Discovery | Critique | Personas documentes et valides par stakeholders |
| Value Proposition Canvas | Phase Strategie | Critique | VPC complete et approuve |
| User Stories priorisees | Phase Strategie | Critique | Backlog priorise avec criteres d'acceptation |
| Contraintes techniques identifiees | Phase Strategie | Important | Liste des contraintes documentee |
| Budget et timeline | Phase Strategie | Important | Enveloppe budgetaire et planning definis |

### Criteres de Sortie (Go/No-Go pour Developpement)

| Critere | Seuil Go | Red Flag (No-Go) |
|---------|----------|------------------|
| Wireframes | Valides par stakeholders + PO | Non valides ou absents |
| Mockups hi-fi | Approuves, accessibilite verifiee | Non approuves |
| Usability tests | Min 5 utilisateurs, Task Success >80% | Pas de tests ou <60% |
| SUS Score | >68 | <50 |
| Design System | Tokens + composants de base documentes | Aucun design system |
| Prototype | Interactif et teste | Pas de prototype |
| WCAG AA | Conforme (contraste, navigation, focus) | Non-conformite majeure |
| Responsive | Mobile-first verifie | Desktop-only |
| Architecture documentee | ADRs + specs techniques | Pas de documentation |
| API Specs | OpenAPI/Swagger documente | API non specifiee |
| Database schema | Defini et valide | Non defini |
| Design handoff | Complet (Figma + tokens + specs) | Incomplet |

### Decision Matrix Go/No-Go

| Situation | Decision |
|-----------|----------|
| Tous criteres Go valides | GO - Passage en Developpement |
| 1-2 criteres non critiques en No-Go | GO CONDITIONNEL - Plan d'action requis |
| Criteres critiques en No-Go | NO-GO - Remediation avant passage |
| Pas de tests utilisateurs | NO-GO - Tests obligatoires |
| Accessibilite non conforme | NO-GO - Correction requise |

---

## 10. Citations Cles

> "Un prototype teste avec 5 utilisateurs revele 85% des problemes d'utilisabilite."

> "L'architecture technique doit suivre les besoins, pas les modes. 61% des entreprises ont adopte les microservices, mais 29% sont revenues au monolith."

> "L'accessibilite n'est plus optionnelle. WCAG 2.2 (ISO/IEC 40500:2025) est le standard legal."

> "Le Design Thinking est une methode de resolution de problemes centree sur l'humain."

> "Le Double Diamond represente visuellement le processus de design comme deux losanges successifs. Le premier losange aide a comprendre le vrai probleme, le second a trouver la bonne solution."

> "Atomic Design organise les elements d'interface comme en chimie : atomes -> molecules -> organismes -> templates -> pages."

> "L'architecture de l'information (IA), c'est organiser et structurer le contenu pour qu'il soit trouvable et comprehensible. C'est comme organiser une bibliotheque."

> "Lean UX applique les principes du Lean Startup au design : construire le minimum necessaire, tester rapidement, apprendre et iterer."

> "Le Design Sprint est un processus de 5 jours pour repondre a des questions critiques via le design, le prototypage et les tests utilisateurs."

> "UX et UI sont distincts mais interdependants. L'UX definit le 'quoi' et le 'pourquoi', l'UI definit le 'comment'."

> "Progress = outcomes, not outputs" (Lean UX)

> "Getting Out Of the Building" (GOOB - Lean UX)

---

## 11. References Externes

### Livres de reference

- Gothelf, J., & Seiden, J. (2021). *Lean UX* (3rd ed.). O'Reilly Media.
- Knapp, J., Zeratsky, J., & Kowitz, B. (2016). *Sprint*. Simon & Schuster.
- Frost, B. (2016). *Atomic Design*.
- Rosenfeld, L., Morville, P., & Arango, J. (2015). *Information Architecture* (4th ed.). O'Reilly. ("Polar Bear Book")
- Krug, S. (2014). *Don't Make Me Think* (3rd ed.). New Riders.

### Documentation officielle

| Ressource | URL |
|-----------|-----|
| WCAG 2.2 - W3C | https://www.w3.org/TR/WCAG22/ |
| Design Council - Double Diamond | https://www.designcouncil.org.uk/our-resources/the-double-diamond/ |
| Nielsen Norman Group - 10 Heuristics | https://www.nngroup.com/articles/ten-usability-heuristics/ |
| Atomic Design | https://atomicdesign.bradfrost.com/ |
| The Sprint Book | https://www.thesprintbook.com/ |
| Lean UX Book | https://leanuxbook.com/ |
| Nielsen Norman Group - Card Sorting | https://www.nngroup.com/articles/card-sorting-definition/ |
| Nielsen Norman Group - Tree Testing | https://www.nngroup.com/articles/tree-testing/ |
| Nielsen Norman Group - Journey Mapping | https://www.nngroup.com/articles/journey-mapping-101/ |
| Nielsen Norman Group - Service Blueprint | https://www.nngroup.com/articles/service-blueprinting-faq/ |
| Nielsen Norman Group - Remote Usability Tests | https://www.nngroup.com/articles/remote-usability-tests/ |
| Information Architecture Book | https://www.oreilly.com/library/view/information-architecture-4th/9781491913529/ |

### Design Systems

| Systeme | URL |
|---------|-----|
| Material Design (Google) | https://m3.material.io/ |
| Carbon (IBM) | https://carbondesignsystem.com/ |
| Polaris (Shopify) | https://polaris.shopify.com/ |
| Ant Design | https://ant.design/ |
| Fluent (Microsoft) | https://fluent2.microsoft.design/ |
| Figma Design System Examples | https://www.figma.com/resource-library/design-system-examples/ |

### Architecture

| Ressource | URL |
|-----------|-----|
| AWS - Monolith vs Microservices | https://aws.amazon.com/compare/the-difference-between-monolithic-and-microservices-architecture/ |
| AWS - GraphQL vs REST | https://aws.amazon.com/compare/the-difference-between-graphql-and-rest/ |
| OpenAPI/Swagger | https://swagger.io/ |
| O'Reilly (Architecture resources) | https://www.oreilly.com/ |

### Normes et Standards

| Standard | Reference |
|----------|-----------|
| ISO 9241-210:2019 | Human-Centered Design |
| ISO/IEC 40500:2025 | WCAG 2.2 |
| OWASP Top 10 (2021) | Security vulnerabilities |

### Certifications

| Certification | Domaine |
|---------------|---------|
| CPUX-F (Foundation) | UX |
| CPUX-UR (User Requirements Engineering) | UX |
| CPUX-DS (Design of User Interfaces) | UX |
| CPUX-UT (Usability Testing and Evaluation) | UX |
| Nielsen Norman UX Certificate | UX |
| Google UX Design | UX |
| AWS Solutions Architect | Architecture |
| Google Cloud Professional | Architecture |
| Azure Expert | Architecture |
| TOGAF | Architecture |

---

## Annexes

### Annexe A - Heuristiques de Nielsen (10 Heuristiques)

| # | Heuristique | Mot-cle |
|---|-------------|---------|
| 1 | Visibility of system status | Feedback |
| 2 | Match with real world | Langage utilisateur |
| 3 | User control and freedom | Undo/Exit |
| 4 | Consistency and standards | Conventions |
| 5 | Error prevention | Prevention |
| 6 | Recognition rather than recall | Visible |
| 7 | Flexibility and efficiency | Raccourcis |
| 8 | Aesthetic and minimalist design | Essentiel |
| 9 | Help recover from errors | Messages clairs |
| 10 | Help and documentation | Aide contextuelle |

**Echelle de severite :**
- 0 : Pas un probleme
- 1 : Cosmetique
- 2 : Mineur
- 3 : Majeur
- 4 : Catastrophe

### Annexe B - Architecture Matrix

| Critere | Monolith | Microservices | Serverless |
|---------|----------|---------------|------------|
| Complexite | Faible | Elevee | Moyenne |
| Scalabilite | Limitee | Excellente | Excellente |
| Cout ops | Faible | Eleve | Variable |
| Time-to-market | Rapide | Lent | Moyen |
| Taille equipe | < 10 | > 10 | Toutes |

### Annexe C - Breakpoints Responsive (2024)

```css
/* Mobile first */
@media (min-width: 640px) { /* Tablet */ }
@media (min-width: 768px) { /* Tablet landscape */ }
@media (min-width: 1024px) { /* Desktop small */ }
@media (min-width: 1280px) { /* Desktop large */ }
```

### Annexe D - Touch Targets

| Plateforme | Taille minimum |
|------------|----------------|
| iOS | 44x44px |
| Android | 48x48dp |
| WCAG 2.2 AA | 24x24px |

### Annexe E - Glossaire

| Terme | Definition |
|-------|------------|
| **A11Y** | Accessibility |
| **ADR** | Architecture Decision Record |
| **ARIA** | Accessible Rich Internet Applications |
| **CDN** | Content Delivery Network |
| **CTA** | Call To Action |
| **Design Tokens** | Variables de design partagees |
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

**Fin de l'extraction - Phase 3 Conception**
