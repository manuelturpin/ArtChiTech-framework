# Findings

## Research

### 2026-02-01: Framework Analysis Complete
Analyse approfondie de 9 frameworks :
- **Planning Files** → 3-File Pattern, Session Recovery, Hooks
- **GSD** → Scale-Adaptive, Context Handoff
- **BMAD** → Quick Mode, Agents spécialisés
- **Everything CC** → Continuous Learning, Confidence Scoring
- **Superpowers** → Iron Laws (TDD, Debug, Verification)
- **CEK** → Reflexion Pattern (+8-21% quality)
- **TÂCHES** → Thinking Models, Deviation Rules
- **Claude-Flow** → Multi-agent orchestration
- **CCPM** → GitHub Integration

### 2026-02-01: Key Insight - Context Engineering
> "Context Window = RAM (volatile, limited)"
> "Filesystem = Disk (persistent, unlimited)"

C'est la raison fondamentale pour laquelle les agents "oublient" : le contexte n'est pas persisté.

---

## Discoveries

### Pattern: 3-File System
Origine : Planning Files + GSD

Les 3 fichiers essentiels :
1. `plan.md` - Phases, progression, décisions
2. `findings.md` - Recherches, découvertes  
3. `progress.md` - Log de session

Extension ACT v2.5 :
4. `config.yaml` - Configuration
5. `state.md` - État rapide (quick glance)

### Pattern: 5-Question Reboot Test
Pour vérifier que le contexte est récupérable :

| Question | Source |
|----------|--------|
| Où suis-je ? | state.md |
| Où vais-je ? | plan.md |
| Quel est l'objectif ? | plan.md |
| Qu'ai-je appris ? | findings.md |
| Qu'ai-je fait ? | progress.md |

---

## References
- [Planning Files Framework](research/2a-planning-files.md)
- [GSD Framework](research/2b-gsd.md)
- [Synthesis](research/SYNTHESIS.md)

---

### 2026-02-25: v3.0-alpha Audit Insights

- **Spec coverage gap** : 56% des specs n'étaient référencées nulle part dans CLAUDE.md — les specs "deep dive" doivent être reliées à leurs sections correspondantes
- **Agents = meilleur score** : 4.9/5 — la structure agent (Model, Role, Inputs, Outputs, Workflow, Handoff) est un excellent template réutilisable
- **Commands bien documentées** : 79% perfect score (5/5) — le frontmatter YAML + sections standardisées fonctionnent bien
- **Auto-healing efficace** : 12 correctifs en 2 passes (--auto puis --force) ont remonté le score de 88% à 97%
- **Backward compatibility** : v3.0 est 100% compatible v2.6 — tous les nouveaux champs sont optionnels

---

*Last updated: 2026-02-25*
