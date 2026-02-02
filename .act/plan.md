# ACT v2.5 Implementation Plan

## Goal
Implémenter ACT v2.5 en intégrant les meilleurs patterns issus de l'analyse de 9 frameworks (Planning Files, GSD, BMAD, etc.).

---

## Phases

### Phase 1: Context Engineering [DONE] ✅
> Fondation du système - Sans ça, tout le reste s'effondre

- [x] 3.1.1 - Spec context engineering
- [x] 3.1.2 - Structure .act/
- [x] 3.1.3 - Templates planning files
- [x] 3.1.4 - Skill context-engineering
- [x] 3.1.5 - Command /act:init
- [x] 3.1.6 - Session recovery (documented in skill)
- [x] 3.1.7 - Documentation

### Phase 2: Hooks System [TODO]
> Automatisation fiable - Hooks = 100% reliable vs skills ~50-80%

- [ ] 3.2.1 - Spec hooks system
- [ ] 3.2.2 - PreToolUse hook
- [ ] 3.2.3 - PostToolUse hook
- [ ] 3.2.4 - Stop hook
- [ ] 3.2.5 - hooks.json config

### Phase 3: Iron Laws & Rules [TODO]
> Qualité garantie - Evidence before claims

- [ ] 3.3.1 - TDD Iron Law
- [ ] 3.3.2 - Debugging Iron Law
- [ ] 3.3.3 - Verification Iron Law
- [ ] 3.3.4 - Deviation Rules (5)

### Phase 4: Scale-Adaptive [TODO]
> Quick vs Full - Right process for the task

- [ ] 3.4.1 - Quick mode
- [ ] 3.4.2 - Full mode
- [ ] 3.4.3 - Auto-detection

### Phase 5: Verification & Release [TODO]
- [ ] 3.5.1 - Integration tests
- [ ] 3.5.2 - Documentation finale
- [ ] 3.5.3 - Tag v2.5.0

---

## Decisions Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-01 | Start with Context Engineering | Foundation, all other features depend on it |
| 2026-02-01 | Use .act/ directory | Consistent with other tools (.git, .vscode) |
| 2026-02-01 | 5 files in .act/ | config + state + plan + findings + progress |

---

## Dependencies
```
Context Engineering → Hooks → Iron Laws → Scale-Adaptive → Release
        ↓
    Foundation for all features
```

---

*Plan created: 2026-02-01*
*Last updated: 2026-02-01*
