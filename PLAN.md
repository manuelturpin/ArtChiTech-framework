# Plan d'amélioration ACT Framework

**Créé :** 2026-01-31
**Objectif :** Rendre ACT autonome et meilleur — framework généraliste pour coding assistants IA

---

## 🎯 Vision

- **Court terme :** Optimiser pour Claude Code
- **Long terme :** Framework généraliste (Cursor, Copilot, Aider, etc.)
- **Principe clé :** Zéro dépendance externe (plus de Superpowers ou autre plugin)

---

## 📋 Phases

### Phase 1 : Recherche concurrents ✅ TERMINÉE
- [x] Lister tous les frameworks/plugins IA → `research/frameworks-list.md` (29 frameworks)
- [x] Analyser leurs features en profondeur → 17 frameworks analysés
- [x] Documenter dans `research/competitors.md` (~25KB)

### Phase 2 : Audit ACT ✅ TERMINÉE
- [x] Analyser architecture actuelle (7 agents, 14 commands, 4 skills)
- [x] Identifier forces (7 phases, gestion état, TDD)
- [x] Identifier faiblesses (dépendance Superpowers, pas de context engineering)
- [x] Gap analysis ACT actuel → ACT cible
- [x] Documenter dans `research/act-audit.md`

### Phase 3 : Roadmap d'amélioration ⬅️ PROCHAINE
- [ ] Définir sprints (S1: skills natifs, S2: scale-adaptive, S3: learning)
- [ ] Créer `research/improvement-roadmap.md`
- [ ] Valider avec Manu

### Phase 4 : Implémentation
- [ ] Sprint 1 : Skills natifs (remplacer Superpowers)
- [ ] Sprint 2 : Context engineering + Scale-adaptive
- [ ] Sprint 3 : Multi-IDE + Compound learning
- [ ] Tester et documenter

---

## 📁 Structure recherche

```
research/
├── competitors.md        # Liste et analyse des frameworks
├── comparison.md         # Grille comparative
├── improvement-roadmap.md # Roadmap priorisée
└── sources/              # Notes et sources brutes
```

---

## 📝 Notes

- Framework cible : Claude Code (priorité) → Généraliste (futur)
- Dépendances : À éliminer (Superpowers, etc.)

---

*Dernière mise à jour : 2026-01-31*
