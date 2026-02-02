# Hooks Behavior Rules

> Ces règles injectent le comportement des hooks ACT dans Claude.
> Les hooks sont automatiquement appliqués par Claude lors de l'utilisation d'outils.

---

## PreToolUse Hook (OBLIGATOIRE)

**Trigger:** Avant chaque `Write`, `Edit`, ou `Bash` qui modifie des fichiers

**Actions:**

1. **Rafraîchir le contexte** : Relire `.act/plan.md` pour rappeler la phase et les objectifs
2. **Vérifier l'alignement** : L'action est-elle liée à la phase courante ?
3. **Détecter les déviations** : Appliquer les Deviation Rules si nécessaire

### Checklist PreToolUse

Avant de modifier un fichier, vérifier mentalement :

- [ ] Je connais la phase actuelle (depuis `.act/state.md`)
- [ ] Cette modification est alignée avec le plan
- [ ] Si c'est une déviation, j'applique les règles 1-5

### Deviation Rules Rappel

| # | Type | Action |
|---|------|--------|
| 1 | Bug | Auto-fix immédiat |
| 2 | Manque critique | Auto-add immédiat |
| 3 | Bloqueur | Auto-fix immédiat |
| 4 | Architectural | **STOP & DEMANDER** |
| 5 | Amélioration | Log dans ISSUES.md, continuer |

---

## PostToolUse Hook (OBLIGATOIRE)

**Trigger:** Après chaque `Write` ou `Edit` réussi

**Actions:**

1. **Mettre à jour progress.md** : Logger l'action effectuée avec timestamp
2. **Vérifier milestone** : Si milestone atteint, mettre à jour `state.md`
3. **Tracer les changements** : Pour la récupération de session

### Format de log pour progress.md

```markdown
### [YYYY-MM-DD HH:MM] Action Type
- **File:** path/to/modified/file
- **Change:** Brief description of what was done
- **Phase:** X/Y
```

### Quand mettre à jour state.md

- Tâche complétée dans le plan
- Changement de phase
- Nouveau blocker découvert
- Progression significative (>10%)

---

## Stop Hook (OBLIGATOIRE)

**Trigger:** Avant de déclarer un travail "terminé", "complet", ou "fini"

**Actions:**

1. **Lire `.act/plan.md`** : Identifier TOUTES les phases
2. **Vérifier les preuves** : Chaque phase doit avoir une preuve (commit, test, doc)
3. **Appliquer Verification Iron Law** : Pas de claim sans evidence

### Checklist Stop

- [ ] Toutes les phases du plan ont été traitées
- [ ] Chaque phase a une preuve vérifiable
- [ ] Les tests passent (si applicable)
- [ ] Le build réussit (si applicable)
- [ ] Les changements sont committés

### Evidence requise par type

| Phase | Preuve acceptable |
|-------|-------------------|
| Discovery | Document findings.md |
| Strategy | Plan validé dans plan.md |
| Design | Specs/architecture documentés |
| Development | Code + tests |
| Quality | Tests passent, coverage OK |
| Launch | Déployé, logs positifs |
| Growth | Métriques, feedback |

---

## Intégration avec Iron Laws

### TDD Iron Law + Hooks

Avant de modifier du code (PreToolUse) :
- Vérifier qu'un test existe
- Si non, écrire le test d'abord

### Debugging Iron Law + Hooks

Avant de fixer un bug (PreToolUse) :
- Investiguer la root cause d'abord
- Ne pas faire de quick fix sans comprendre

### Verification Iron Law + Stop Hook

Avant de déclarer terminé :
- Exécuter la commande de vérification
- Lire le résultat COMPLET
- PUIS faire la déclaration

---

## Exemples Pratiques

### Exemple 1: PreToolUse en action

```
[Avant d'éditer src/auth/login.ts]

→ Lecture de .act/plan.md...
→ Phase actuelle: 4 (Development)
→ Tâche: Implémenter l'authentification
→ Action: Éditer login.ts
→ ✓ Aligné avec la phase courante
→ Procéder avec Edit...
```

### Exemple 2: PostToolUse en action

```
[Après Edit: src/auth/login.ts]

→ Mise à jour de .act/progress.md:
  "### [2026-02-02 21:30] Implementation
   - File: src/auth/login.ts
   - Change: Added JWT validation
   - Phase: 4/7"
```

### Exemple 3: Stop Hook en action

```
[Avant de déclarer "Tâche terminée"]

→ Lecture de .act/plan.md...
→ Phases: 1-Discovery ✓, 2-Strategy ✓, 3-Design ✓, 4-Development ◌
→ Phase 4 incomplète - tests non exécutés
→
→ ⚠️ Impossible de déclarer terminé.
→ Action requise: Exécuter les tests
```

---

## Commande de vérification

Utiliser `/act:verify-hooks` pour vérifier la conformité :

```
/act:verify-hooks
```

Output:
```
## Hook Compliance Check

| Hook | Status | Last Trigger |
|------|--------|--------------|
| PreToolUse | ✅ Active | Before Edit |
| PostToolUse | ✅ Active | After Edit |
| Stop | ⚠️ Not triggered yet | - |

### Recent Actions
1. [21:30] Edit src/auth/login.ts → Logged ✓
2. [21:25] Edit tests/auth.test.ts → Logged ✓

### Recommendations
- Continue logging actions
- Run tests before declaring complete
```

---

*ACT v2.5 Hooks Behavior Rules*
