# Design : Méthodologie de Synthèse Multi-LLM

> Date : 2026-01-09
> Statut : Validé
> Objectif : Définir une méthodologie robuste pour synthétiser 15 recherches multi-LLM

---

## Contexte

### Données d'entrée
- **15 fichiers de recherche** répartis sur 3 axes
- **~380KB** de contenu brut
- **5 LLMs consultés** : Perplexity, Claude, ChatGPT, Grok, Gemini

### Objectif
Produire un document de pilotage stratégique pour ACT 2026 avec :
1. **Synthèse courte** pour décisions immédiates
2. **Annexes détaillées** pour référence future
3. **Traçabilité complète** vers les sources

---

## Architecture de la Solution

### Parallélisme à 2 niveaux

```
Niveau 1 - Inter-fenêtres (3 terminaux parallèles)
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Terminal 1    │  │   Terminal 2    │  │   Terminal 3    │
│   Axe 01        │  │   Axe 02        │  │   Axe 03        │
│   Agnosticisme  │  │   Popularité    │  │   Monétisation  │
└────────┬────────┘  └────────┬────────┘  └────────┬────────┘
         │                    │                    │
         └────────────────────┼────────────────────┘
                              ↓
                    ┌─────────────────┐
                    │   Terminal 4    │
                    │   Consolidation │
                    └─────────────────┘

Niveau 2 - Intra-fenêtre (5 agents parallèles par terminal)
Terminal X:
  ├── Agent Explore → perplexity.md
  ├── Agent Explore → claude.md
  ├── Agent Explore → chatgpt.md   → Consolidation → Annexe
  ├── Agent Explore → grok.md
  └── Agent Explore → gemini.md
```

### Avantages
- **Contexte dédié** : Chaque fenêtre a son propre contexte (pas de confusion)
- **Gain de temps** : Travail parallèle inter et intra-fenêtre
- **Exhaustivité** : Chaque fichier est lu intégralement
- **Traçabilité** : Citations avec numéros de lignes

---

## Critères de Qualité

### Priorités (par ordre)
1. **Traçabilité** — Chaque conclusion remonte à sa source
2. **Exhaustivité** — Ne rien perdre des recherches
3. **Comparabilité** — Voir consensus vs divergences entre LLMs
4. **Rapidité** — Bonus si les 3 premiers sont respectés

### Format d'extraction
- **Thèmes prédéfinis** par axe (5-6 thèmes)
- **Thèmes émergents** pour capturer les insights hors grille
- **Citations sourcées** avec numéros de lignes
- **Données chiffrées** avec contexte

---

## Thèmes par Axe

### Axe 01 - Agnosticisme LLM
| Thème | Questions couvertes |
|-------|---------------------|
| Faisabilité | Qualité comparable ? Différences fondamentales ? |
| Frameworks | LiteLLM vs LangChain vs Vercel AI SDK ? |
| Tool calling | Comment transcrire les outils Claude Code ? |
| Architecture | Options A/B/C - laquelle recommandée ? |
| Business | Souveraineté, coûts, conformité EU AI Act ? |
| Timeline | Court/moyen/long terme ? |

### Axe 02 - Popularité GitHub
| Thème | Questions couvertes |
|-------|---------------------|
| Stratégies | Hacker News, Reddit, Discord, Twitter ? |
| Métriques | Stars, forks, contributors - quoi viser ? |
| DevRel | Community building, documentation ? |
| Case studies | Projets qui ont réussi/échoué ? |
| Timeline | Jalons réalistes ? |

### Axe 03 - Monétisation OSS
| Thème | Questions couvertes |
|-------|---------------------|
| Modèles | Open Core, SaaS, Support, Dual licensing ? |
| Case studies | GitLab, Supabase, HashiCorp ? |
| Juridique | SASU, auto-entrepreneur, ZFANG ? |
| Pricing | Grille tarifaire recommandée ? |
| Timeline | Jalons financiers réalistes ? |

---

## Structure des Livrables

### Annexes (3 fichiers)
```markdown
# Annexe Axe 0X - [Nom]

## Tableau comparatif
| Thème | Perplexity | Claude | ChatGPT | Grok | Gemini |

## Consensus (4-5 LLMs d'accord)
## Divergences (avec positions détaillées)
## Détail par thème (extractions sourcées)
## Thèmes émergents
## Données chiffrées clés
## Citations importantes
## Questions ouvertes
```

### Document Principal
```markdown
# Synthèse Stratégique ACT 2026

## Executive Summary (1 page max)
## Décisions Stratégiques (options + trade-offs)
## Interdépendances (matrice d'impact)
## Questions Ouvertes (recherches futures)
## Roadmap Suggérée (court/moyen/long terme)
## Métriques de succès
## Liens vers annexes
```

---

## Fichiers de Prompts

| Fichier | Usage |
|---------|-------|
| `prompts/synthesis-axe01-agnosticisme.md` | Terminal 1 |
| `prompts/synthesis-axe02-popularite.md` | Terminal 2 |
| `prompts/synthesis-axe03-monetisation.md` | Terminal 3 |
| `prompts/synthesis-document-principal.md` | Terminal 4 (après les 3 autres) |

---

## Workflow d'Exécution

### Étape 1 : Lancer les 3 fenêtres parallèles
```bash
# Terminal 1
cd /path/to/lab-13
# Copier le contenu de prompts/synthesis-axe01-agnosticisme.md

# Terminal 2
cd /path/to/lab-13
# Copier le contenu de prompts/synthesis-axe02-popularite.md

# Terminal 3
cd /path/to/lab-13
# Copier le contenu de prompts/synthesis-axe03-monetisation.md
```

### Étape 2 : Attendre les 3 annexes
Vérifier que les fichiers sont créés :
```
ideas/research/synthesis/
├── annexe-01-agnosticisme.md  ✓
├── annexe-02-popularite.md    ✓
└── annexe-03-monetisation.md  ✓
```

### Étape 3 : Lancer la consolidation
```bash
# Terminal 4
cd /path/to/lab-13
# Copier le contenu de prompts/synthesis-document-principal.md
```

### Étape 4 : Livrable final
```
ideas/research/synthesis/
└── synthese-strategique-act-2026.md
```

---

## Décisions de Design

### Pourquoi des fenêtres séparées plutôt qu'un seul agent ?
- **Contexte dédié** : Pas de risque de confusion entre axes
- **Meilleure qualité** : Chaque fenêtre peut se concentrer
- **Parallélisme réel** : Gain de temps significatif

### Pourquoi des thèmes prédéfinis + émergents ?
- **Structure** : Les thèmes prédéfinis assurent la comparabilité
- **Exhaustivité** : Les thèmes émergents capturent les surprises

### Pourquoi un document principal séparé ?
- **Vue d'ensemble** : Synthèse des 3 axes sans répétition
- **Décisions** : Focus sur l'actionnable, pas le détail
- **Traçabilité** : Liens vers annexes pour approfondir

---

## Réutilisabilité

Cette méthodologie peut être intégrée au framework ACT comme workflow de recherche :
- **Phase Discovery** : Recherche multi-LLM sur le problème
- **Phase Stratégie** : Synthèse pour décisions

### Éléments réutilisables
1. Architecture parallèle (fenêtres + agents)
2. Format d'extraction avec traçabilité
3. Structure consensus/divergences
4. Template de document stratégique
