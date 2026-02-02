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

*Last updated: 2026-02-01*
