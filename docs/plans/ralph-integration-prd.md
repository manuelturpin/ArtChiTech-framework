# PRD : Analyse Integration Ralph dans ACT

> **Type** : Research PRD (PRD d'analyse)
> **Date** : 2026-01-10
> **Branche** : `feat/ralph-integration`
> **Methode** : Pattern Ralph applique a l'analyse de Ralph

---

## Vision

Integrer le workflow Ralph Wiggum (boucle de codage autonome) dans le framework ACT pour permettre une execution autonome des phases 3 (Design), 4 (Development) et 5 (Quality).

## Objectifs

1. **Comprendre** le mecanisme de memoire optimal pour la boucle
2. **Definir** les templates PRD adaptes a chaque type de projet
3. **Concevoir** les criteres de declenchement de la boucle
4. **Prototyper** le script de boucle pour Claude CLI
5. **Valider** sur un cas d'usage reel

---

## User Stories

### US-001 : Mecanisme Memoire CLAUDE.md

**En tant que** framework ACT,
**Je veux** gerer la memoire de boucle de maniere isolee,
**Afin de** ne pas polluer le CLAUDE.md principal tout en capitalisant les learnings.

#### Criteres d'Acceptation
- [ ] Decision prise sur l'option de gestion memoire (A, B, C ou D)
- [ ] Justification documentee
- [ ] Mecanisme de curation des learnings defini
- [ ] Impact sur le workflow decrit

#### Questions a Resoudre
1. CLAUDE.md temporaire dans branche vs fichier separe ?
2. Qui valide les learnings permanents ?
3. Comment eviter la pollution du CLAUDE.md principal ?

#### Statut
- **Priority**: 1
- **Passes**: true
- **Iterations**: 1

#### Decision Prise

**Choix** : Approche hybride B+D (fichier separe + curation au merge)

**Architecture** :
```
.epct/
├── loop/
│   ├── progress.md      # Court terme - append pendant boucle
│   ├── patterns.md      # Patterns feature (pre-curation)
│   └── archive/         # Anciennes features
└── session/
    └── current.json     # Stories actives
```

**Workflow** :
1. Pendant boucle → append `progress.md`
2. Fin story → extraire vers `patterns.md`
3. Fin feature → proposer curation CLAUDE.md
4. Validation humaine → accepter/refuser
5. Archive → `archive/[feature-name]/`

**Justification** : Isolation totale + controle qualite humain + capitalisation systematique

---

### US-002 : Template PRD Developpement

**En tant que** framework ACT,
**Je veux** un template PRD pour projets dev,
**Afin de** structurer les requirements pour la boucle autonome.

#### Criteres d'Acceptation
- [ ] Template dev cree et fonctionnel
- [ ] Compatible avec format prd.json de Ralph
- [ ] Exemples concrets inclus

#### Scope Reduit (Phase Recherche)
- Focus uniquement sur le type "dev" pour valider le pattern
- Autres types (business, perso) seront ajoutes apres validation

#### Statut
- **Priority**: 2
- **Passes**: true
- **Iterations**: 1

#### Decision Prise

**Fichier** : `plugin/references/templates/prd/dev-template.md`

**Scope MVP** : Template dev uniquement pour valider le pattern.
Autres types seront ajoutes apres validation sur cas reel.

---

### US-003 : Criteres Declenchement Boucle

**En tant que** framework ACT,
**Je veux** savoir quand declencher la boucle autonome,
**Afin de** l'utiliser uniquement quand c'est pertinent.

#### Criteres d'Acceptation
- [ ] Algorithme de detection documente
- [ ] Seuils definis (fichiers, stories, temps)
- [ ] Mecanisme de sortie anticipee
- [ ] Gestion story bloquee apres N retries

#### Questions a Resoudre
1. Quels seuils pour declencher la boucle ?
2. Detection auto ou choix utilisateur ?
3. Comment sortir de boucle en cours de route ?
4. Que faire si une story reste bloquee ?

#### Statut
- **Priority**: 3
- **Passes**: true
- **Iterations**: 1

#### Decision Prise

**Declenchement** : Manuel + Suggestion
- `/loop [max]` lance la boucle (default max=10)
- Si > 3 stories → suggerer `/loop` mais utilisateur decide

**Sortie** :
- Signal `<signal>COMPLETE</signal>` → succes
- Max iterations atteint → echec, voir progress

**Blocage** :
- 2 echecs consecutifs sur une story → skip + noter dans progress
- Passer a la story suivante

**Algorithme** :
```
1. /loop [max_iterations=10]
2. Lire prd.json
3. Pour i = 1 a max:
   - Story prioritaire non-passee
   - Executer + verifier criteria
   - Si passe → passes: true
   - Si echec 2x → skip, noter
   - Si toutes passent → COMPLETE
4. Si max sans COMPLETE → echec
```

---

### US-004 : Script loop.sh pour Claude CLI

**En tant que** framework ACT,
**Je veux** un script de boucle adapte a Claude CLI,
**Afin de** executer les stories de maniere autonome.

#### Criteres d'Acceptation
- [ ] Script fonctionnel adapte de ralph.sh
- [ ] Integration avec `claude` CLI
- [ ] Gestion signal COMPLETE
- [ ] Test unitaire du script
- [ ] Documentation d'utilisation

#### Questions a Resoudre
1. Comment adapter ralph.sh pour `claude` CLI ?
2. Quel format pour le signal de completion ?
3. Comment gerer les timeouts ?

#### Statut
- **Priority**: 4
- **Passes**: true
- **Iterations**: 1

#### Decision Prise

**Fichiers crees** :
- `plugin/scripts/loop.sh` - Script principal
- `plugin/scripts/loop-prompt.md` - Instructions par iteration

**Adaptations de Ralph** :
- `amp` → `claude --dangerously-skip-permissions`
- Signal : `<signal>COMPLETE</signal>`
- Progress : `.epct/loop/progress.md`
- PRD : `.epct/session/prd.json`

**Usage** : `./loop.sh [max_iterations]` (default: 10)

---

### US-005 : Test sur Cas Reel

**En tant que** developpeur ACT,
**Je veux** valider la boucle sur une feature reelle,
**Afin de** confirmer que l'integration fonctionne.

#### Criteres d'Acceptation
- [ ] Feature identifiee pour le test
- [ ] Boucle executee avec succes
- [ ] Learnings documentes
- [ ] Ajustements identifies

#### Questions a Resoudre
1. Quelle feature utiliser pour le test ?
2. Quels criteres de succes ?
3. Comment mesurer l'efficacite ?

#### Statut
- **Priority**: 5
- **Passes**: false
- **Iterations**: 0

---

## Tracking

| Story | Priority | Status | Iterations | Last Update |
|-------|----------|--------|------------|-------------|
| US-001 | 1 | **done** | 1 | 2026-01-10 |
| US-002 | 2 | **done** | 1 | 2026-01-10 |
| US-003 | 3 | **done** | 1 | 2026-01-10 |
| US-004 | 4 | **done** | 1 | 2026-01-10 |
| US-005 | 5 | pending | 0 | - |

---

## Decisions Log

| Date | Story | Decision | Justification |
|------|-------|----------|---------------|
| 2026-01-10 | US-001 | Hybride B+D : `.epct/loop/` + curation au merge | Isolation totale + controle qualite + capitalisation |
| 2026-01-10 | US-002 | Template dev uniquement (MVP) | Valider pattern avant generalisation |
| 2026-01-10 | US-003 | Manuel + Suggestion, skip apres 2 echecs | Controle utilisateur + protection blocage |
| 2026-01-10 | US-004 | loop.sh + loop-prompt.md | Adaptation Ralph pour Claude CLI |

---

## Learnings

_Capitaliser les decouvertes au fil des iterations_

### Patterns Decouverts
- (a completer)

### Points d'Attention
- (a completer)

### Ameliorations Futures
- (a completer)

---

*PRD d'analyse cree le 2026-01-10 - feat/ralph-integration*
