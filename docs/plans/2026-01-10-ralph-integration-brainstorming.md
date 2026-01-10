# Brainstorming : Integration Ralph dans ACT

> Date : 2026-01-10
> Branche : `feat/ralph-integration`
> Statut : En cours

---

## Contexte

Analyse du workflow Ralph Wiggum (boucle de codage autonome) pour integration dans le framework ACT.

### Sources Analysees

| Source | Lien | Points Cles |
|--------|------|-------------|
| Ralph Wiggum Agent | https://github.com/snarktank/ralph | Boucle autonome, PRD → JSON, memoire |
| AMP Skills | https://github.com/snarktank/amp-skills | Skills PRD, compound-engineering |
| Cole Medin | https://github.com/coleam00/habit-tracker | PRD central, System Evolution |

---

## Decisions Prises

| Decision | Choix | Raison |
|----------|-------|--------|
| Niveau d'autonomie | Full autonome | Comme Ralph original |
| Phases concernees | 3, 4, 5 | Design, Dev, Quality |
| Mecanisme boucle | Script bash + Claude CLI | Contexte frais a chaque iteration |
| Branche de travail | Toujours sur feature branch | Jamais sur main |
| PRD interne | Garder le terme "PRD" | Conversion par type de projet pour l'utilisateur |

---

## Questions Ouvertes

### 1. CLAUDE.md et Memoire de la Boucle

**Problematique** : La boucle enrichit dynamiquement la memoire. Comment gerer avec CLAUDE.md ?

**Options** :

| Option | Description | Avantages | Inconvenients |
|--------|-------------|-----------|---------------|
| A | CLAUDE.md temporaire dans branche | Isolation totale | Merge complexe |
| B | Fichier separe `.epct/loop-learnings.md` | Pas de conflit | Dispersion info |
| C | Section dediee dans CLAUDE.md | Centralise | Risque pollution |
| D | Accumule, propose au merge | Controle humain | Etape supplementaire |

**A clarifier** :
- Qui decide ce qui merite d'etre permanent ?
- Comment eviter la pollution du CLAUDE.md principal ?
- Mecanisme de curation des learnings ?

---

### 2. PRD : Terminologie par Type de Projet

**Table de conversion** :

| Type Projet | Terme Interne | Terme Utilisateur |
|-------------|---------------|-------------------|
| Developpement | PRD | Product Requirements |
| Business | PRD | Business Requirements (BRD) |
| Personnel | PRD | Project Brief |
| Recherche | PRD | Research Brief |
| Evenement | PRD | Event Brief |
| Creation | PRD | Creative Brief |

**A clarifier** :
- Sections communes a tous les types ?
- Detecteur automatique de type de projet ?
- Gestion projets hybrides ?

---

### 3. Boucle : Quand l'Utiliser ?

**Criteres proposes** :

| Critere | Seuil |
|---------|-------|
| Fichiers a modifier | > 3 |
| Tests a ecrire | > 2 |
| Estimation temps | > 30 min |
| Nombre de stories | > 3 |

**A clarifier** :
- Detection automatique ou choix utilisateur ?
- Sortie de boucle en cours de route ?
- Story bloquee apres N retries ?

---

### 4. Integration ACT : Points d'Entree

**A clarifier** :
- `/loop` separe ou integre a `/next` ?
- Lancer `/loop` sans passer par `/project` ?
- Reprendre une boucle interrompue ?

---

### 5. Memoire Court/Long Terme

**Mapping** :

| Ralph | ACT | Persistance |
|-------|-----|-------------|
| progress.txt | `.epct/session/loop-progress.txt` | Par feature |
| AGENTS.md | CLAUDE.md ou `.claude/rules/` | Permanent |

**A clarifier** :
- Validation passage court → long terme ?
- Format learnings (JSON ou Markdown) ?
- Archivage anciennes features ?

---

## Analyse Ralph : Workflow Complet

### Architecture

```
Phase 1: PRD (markdown)
├── Description feature (voix/texte)
└── PRD Generator → tasks/prd-[feature].md

Phase 2: Conversion JSON
├── Ralph Skill parse le PRD
└── Genere prd.json avec User Stories

Phase 3: Boucle Autonome
├── ralph.sh lance N iterations (default: 10)
└── Chaque iteration:
    1. Selectionne story prioritaire
    2. Implemente (1 story max)
    3. Execute quality checks
    4. Commit si OK
    5. Met a jour prd.json
    6. Ajoute learnings
    7. Signal fin si complete
```

### Format prd.json

```json
{
  "project": "MyApp",
  "branchName": "ralph/feature-name",
  "userStories": [
    {
      "id": "US-001",
      "title": "Add priority field",
      "acceptanceCriteria": ["..."],
      "priority": 1,
      "passes": false
    }
  ]
}
```

### Script ralph.sh (resume)

```bash
for i in $(seq 1 $MAX_ITERATIONS); do
  OUTPUT=$(cat prompt.md | amp)
  if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
    exit 0
  fi
done
```

---

## Proposition Integration ACT

### Nouvelles Commandes

| Commande | Description | Phases |
|----------|-------------|--------|
| `/loop` | Boucle autonome | 3, 4, 5 |
| `/loop-status` | Progression stories | 3, 4, 5 |
| `/stories` | Gestion stories | 3, 4, 5 |
| `/stories-generate` | Generation depuis PRD | 3, 4, 5 |

### Nouveaux Fichiers

```
.epct/
├── tasks/
│   ├── current.json     # Stories actives
│   └── archive/         # Features terminees
├── progress.txt         # Learnings session
└── patterns.md          # Patterns decouverts
```

---

## Prochaines Etapes

1. [ ] Trancher question CLAUDE.md
2. [ ] Valider table conversion PRD
3. [ ] Definir criteres declenchement boucle
4. [ ] Prototyper loop.sh pour Claude CLI
5. [ ] Creer template PRD (type: developpement)

---

## Fichiers Associes

- Plan implementation : `~/.claude/plans/flickering-riding-cook.md`
- Handoff synthese : `docs/handoffs/2026-01-09-synthese-strategique-veille.md`
- Methodologie : `docs/plans/2026-01-09-methodologie-synthese-multi-llm.md`

---

*Document de brainstorming - feat/ralph-integration*
