# Handoff : Preparation Session Ralph Integration

> Date : 2026-01-10
> Branche : `feat/ralph-integration` (pushee sur origin)
> Prochaine session : Analyse approfondie via pattern Ralph

---

## Contexte

Session de recherche sur l'integration du workflow Ralph Wiggum (boucle de codage autonome) dans le framework ACT.

### Ce qui a ete fait

1. **Analyse Ralph** : Workflow complet documente (PRD → JSON → Boucle)
2. **Analyse Cole Medin** : 5 techniques agentic engineering, importance PRD
3. **Analyse AMP Skills** : Skills PRD, compound-engineering, dev-browser
4. **Decisions prises** : Full autonome, Phases 3-4-5, PRD central
5. **Questions ouvertes** : CLAUDE.md, PRD types, criteres boucle

### Documents crees

| Fichier | Contenu |
|---------|---------|
| `docs/plans/2026-01-10-ralph-integration-brainstorming.md` | Questions ouvertes, analyse, propositions |
| `~/.claude/plans/flickering-riding-cook.md` | Plan d'implementation detaille |
| `ideas/intelligence/analysis/2026-01-10-ralph-integration-brainstorming.md` | Version privee avec notes |

---

## Idee Prochaine Session

### Concept : Utiliser Ralph pour analyser Ralph

**Meta-approche** : Appliquer le pattern Ralph (boucle iterative) pour faire une analyse approfondie de l'integration de Ralph dans ACT.

```
┌─────────────────────────────────────────────────────────────────┐
│           RALPH PATTERN POUR ANALYSER RALPH                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. Creer un "PRD d'analyse"                                    │
│     └── Objectif : Integration Ralph dans ACT                   │
│                                                                 │
│  2. Definir des "Stories de recherche"                          │
│     ├── US-001: Analyser mecanisme memoire (CLAUDE.md vs temp)  │
│     ├── US-002: Definir templates PRD par type projet           │
│     ├── US-003: Concevoir criteres declenchement boucle         │
│     ├── US-004: Prototyper loop.sh pour Claude CLI              │
│     └── US-005: Tester sur cas reel                             │
│                                                                 │
│  3. Lancer une "boucle d'analyse"                               │
│     └── Chaque iteration approfondit une story                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Avantages

1. **Tester le pattern** avant de l'implementer
2. **Approfondir** chaque question systematiquement
3. **Valider** que la boucle fonctionne pour ACT
4. **Documenter** les learnings en temps reel

---

## Stories de Recherche Proposees

| ID | Story | Criteres de completion |
|----|-------|------------------------|
| US-001 | Analyser gestion memoire CLAUDE.md | Decision prise + justification |
| US-002 | Creer templates PRD par type projet | 3 templates minimum (dev, business, perso) |
| US-003 | Definir criteres declenchement boucle | Algorithme de detection documente |
| US-004 | Adapter loop.sh pour Claude CLI | Script fonctionnel + test |
| US-005 | Tester sur feature reelle | 1 feature complete via boucle |

---

## Prompt de Demarrage Prochaine Session

```
Je reprends le travail sur l'integration Ralph dans ACT.

Contexte :
- Branche : feat/ralph-integration
- Docs : docs/plans/2026-01-10-ralph-integration-brainstorming.md

Idee : Utiliser le pattern Ralph (boucle iterative) pour analyser
l'integration de Ralph dans ACT.

Etapes :
1. Lis le document de brainstorming
2. Cree un "PRD d'analyse" avec les stories de recherche
3. Lance une analyse approfondie story par story
4. Documente les decisions au fur et a mesure

Commence par la story US-001 : gestion memoire CLAUDE.md
```

---

## Questions en Attente

### 1. CLAUDE.md (US-001)
- CLAUDE.md temporaire dans branche vs fichier separe ?
- Qui valide les learnings permanents ?

### 2. PRD Types (US-002)
- Sections communes a tous les types ?
- Detecteur automatique de type ?

### 3. Criteres Boucle (US-003)
- Seuils (fichiers, stories, temps) ?
- Detection auto vs choix utilisateur ?

### 4. loop.sh Claude (US-004)
- `claude` CLI vs autre mecanisme ?
- Gestion signal COMPLETE ?

### 5. Test Reel (US-005)
- Quelle feature pour le test ?
- Criteres de succes ?

---

## Ressources

### Repos analyses
- Ralph : https://github.com/snarktank/ralph
- AMP Skills : https://github.com/snarktank/amp-skills
- Cole Medin : https://github.com/coleam00/habit-tracker

### Fichiers cles Ralph
- `ralph.sh` : Script boucle principale
- `prompt.md` : Instructions par iteration
- `prd.json` : Format stories

---

*Handoff prepare le 2026-01-10*
*Prochaine session : Analyse approfondie via pattern Ralph*
