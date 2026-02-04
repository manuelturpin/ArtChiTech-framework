# Tutoriel ACT v2.7 - Guide de Test

> Comment tester le framework ACT v2.7 dans un projet réel

---

## Nouveautés v2.7 : Native Skills

ACT v2.7 inclut des **skills natifs** sans dépendances externes. Ces skills sont directement intégrés et utilisables :

| Skill | Description |
|-------|-------------|
| **brainstorming** | Génération et exploration d'idées structurée |
| **tdd** | Test-Driven Development workflow |
| **code-review** | Revue de code systématique |
| **debugging** | Diagnostic et résolution de bugs |
| **verification** | Validation et preuve de fonctionnement |
| **writing-plans** | Rédaction de plans et documentation |

**Référence** : `@skills/*/SKILL.md` pour la documentation complète de chaque skill.

---

## Résumé du Code Review

Avant de tester, voici les points clés identifiés :

| Aspect | Score | Impact |
|--------|-------|--------|
| Architecture | 6/10 | Duplication v1/v2.7 non résolue |
| Commandes | 5/10 | Conflits de nommage |
| Documentation | 7/10 | Bien écrite mais incomplète |
| Native Skills | 8/10 | Implémentés et fonctionnels |

**Verdict** : Le framework est testable avec des skills natifs pleinement fonctionnels.

---

## Prérequis

1. **Claude Code** installé et fonctionnel
2. Un dossier de test (ne pas utiliser un vrai projet)
3. Le repo ACT cloné localement

---

## Installation

### Option A : Tester dans le repo ACT lui-même

```bash
cd ~/your-project/act-framework
```

Les commandes `/act:*` sont déjà disponibles via `commands/act/`.

### Option B : Tester dans un nouveau projet

```bash
# Créer un projet test
mkdir ~/test-act-v27
cd ~/test-act-v27

# Copier la structure ACT v2.7
cp -r ~/your-project/act-framework/commands ./
cp -r ~/your-project/act-framework/skills ./
cp -r ~/your-project/act-framework/rules ./
cp -r ~/your-project/act-framework/hooks ./
cp -r ~/your-project/act-framework/agents ./
cp -r ~/your-project/act-framework/templates ./
cp ~/your-project/act-framework/CLAUDE.md ./

# Initialiser git
git init
```

---

## Scénario 1 : Quick Mode (Bug Fix)

**Objectif** : Tester le workflow rapide pour une tâche simple

### Étape 1 : Initialiser ACT

```
/act:init --type bugfix --quick
```

**Résultat attendu** :
```
✅ ACT v2.7 initialized!

📁 Created:
  .act/
  ├── config.yaml
  ├── state.md
  ├── plan.md
  ├── findings.md
  └── progress.md

🎯 Next: Edit .act/plan.md to define your goal and phases.
```

### Étape 2 : Vérifier les fichiers créés

```bash
ls -la .act/
cat .act/config.yaml
cat .act/state.md
```

### Étape 3 : Lancer le mode quick

```
/act:quick Fix login timeout after 30s
```

**Résultat attendu** :
- Un plan est créé avec les tâches
- Le mode TDD est mentionné
- Les Iron Laws sont rappelées

### Étape 4 : Vérifier le status

```
/act:status
```

### Étape 5 : Simuler la reprise de session

Fermez Claude Code, puis rouvrez :

```
/act:resume
```

**Résultat attendu** : Un rapport de rattrapage avec l'état du projet.

---

## Scénario 2 : Full Mode (Feature Complète)

**Objectif** : Tester le workflow complet en 7 phases

### Étape 1 : Initialiser en mode full

```
/act:init --type feature --name "auth-module" --scale full
```

### Étape 2 : Lancer le mode full

```
/act:full Build user authentication with JWT
```

**Résultat attendu** :
- Les 7 phases sont décrites
- Phase 1 (Discovery) est initiée
- Des tâches de recherche sont proposées

### Étape 3 : Naviguer dans les phases

```
# Voir le plan
cat .act/plan.md

# Voir la progression
cat .act/progress.md

# Status détaillé
/act:status --verbose
```

### Étape 4 : Tester la transition de phase

Après avoir "complété" la Phase 1, demandez :

```
Je considère la Phase 1 Discovery terminée. Peux-tu passer à la Phase 2 Strategy ?
```

**Observer** : Comment Claude gère la transition Go/No-Go.

---

## Scénario 3 : Session Recovery

**Objectif** : Tester la reprise après un reset de contexte

### Étape 1 : Créer une session avec du contenu

```
/act:init --type product --name "test-recovery"
```

Puis travaillez un peu (ajoutez du contenu dans `.act/progress.md` manuellement) :

```markdown
## 2026-02-02

### Session Start
- **Objective:** Test session recovery
- **Status:** In progress

### Actions
- [x] Initialized project
- [x] Defined goal
- [ ] Created phase plan

### Findings
- JWT is better than sessions for stateless APIs
```

### Étape 2 : Simuler un reset

Fermez Claude Code, attendez quelques minutes, rouvrez.

### Étape 3 : Tester la reprise

```
/act:resume
```

**Vérifier** :
- Le projet est reconnu
- Les dernières actions sont listées
- Les prochaines étapes sont identifiées

---

## Scénario 4 : Tester les Iron Laws

**Objectif** : Vérifier que les règles TDD sont rappelées

### Test 1 : Demander du code sans tests

```
Écris une fonction de validation d'email
```

**Attendu** : Claude devrait rappeler la TDD Iron Law et proposer d'écrire les tests d'abord.

### Test 2 : Demander un fix sans debug

```
Cette fonction ne marche pas : [code]. Fixe-la.
```

**Attendu** : Claude devrait demander plus de contexte (Debugging Iron Law).

### Test 3 : Demander une validation sans preuve

```
Est-ce que cette implémentation est correcte ?
```

**Attendu** : Claude devrait exécuter des tests pour vérifier (Verification Iron Law).

---

## Scénario 5 : Deviation Rules

**Objectif** : Tester comment ACT gère les déviations

### Test 1 : Bug découvert pendant le travail

```
En implémentant l'auth, j'ai trouvé un bug dans la validation. Que faire ?
```

**Attendu** (Rule 1 - Fix Immediately) :
- Corriger le bug immédiatement
- Logger la correction
- Continuer le travail original

### Test 2 : Décision architecturale nécessaire

```
J'hésite entre JWT et sessions pour l'auth. Que choisir ?
```

**Attendu** (Rule 4 - ASK) :
- Claude demande des précisions
- Ne choisit pas de lui-même une option architecturale majeure

---

## Scénario 6 : Commandes de Status

**Objectif** : Tester toutes les variantes de status

```bash
# Status standard
/act:status

# Status détaillé
/act:status --verbose

# Métriques de vélocité
/act:status --velocity
```

**Vérifier** :
- Les informations affichées sont cohérentes
- La vélocité est calculée (si historique disponible)
- Les blockers sont identifiés

---

## Scénario 7 : Handoff (Changement de Session)

**Objectif** : Tester le transfert de contexte

### Étape 1 : Générer un handoff

```
/act:handoff
```

**Attendu** : Un document XML structuré avec :
- Contexte du projet
- État actuel
- Décisions prises
- Prochaines étapes

### Étape 2 : Utiliser le handoff dans une nouvelle session

Copiez le handoff généré, démarrez une nouvelle session Claude, et collez-le.

**Vérifier** : Claude comprend le contexte et peut continuer.

---

## Scénario 8 : Utiliser les Native Skills

**Objectif** : Tester les skills intégrés v2.7

### Test 1 : Brainstorming

```
Utilise le skill brainstorming pour explorer des solutions d'authentification
```

### Test 2 : TDD Workflow

```
Utilise le skill tdd pour implémenter une fonction de validation
```

### Test 3 : Code Review

```
Utilise le skill code-review pour analyser ce fichier
```

### Test 4 : Debugging

```
Utilise le skill debugging pour diagnostiquer ce bug
```

**Référence** : Voir `@skills/*/SKILL.md` pour les détails de chaque skill.

---

## Ce qui NE FONCTIONNE PAS (Limitations)

### 1. Hooks (Partiellement Implémentés)

Les hooks sont documentés mais le mécanisme automatique est limité :

```
⚠️ PreToolUse peut nécessiter activation manuelle
⚠️ PostToolUse peut ne pas mettre à jour .act/progress.md automatiquement
```

**Workaround** : Demander manuellement à Claude de mettre à jour les fichiers.

### 2. Agents (Guides Conceptuels)

Les 6 agents (planner, architect, executor, reviewer, tester, documenter) sont des guides :

```
⚠️ Pas de routing automatique vers le bon agent
⚠️ Pas de sélection de modèle (opus/sonnet/haiku)
```

**Workaround** : Demander explicitement d'utiliser le "mode tester" ou "mode architect".

### 3. Model Selection

Pas de sélection automatique du modèle selon la tâche.

### 4. Party Mode

Pas de commande `/act:party` implémentée (seulement documenté).

---

## Checklist de Validation

### Commandes Fonctionnelles

| Commande | Testé | Fonctionne |
|----------|-------|------------|
| `/act:init` | [ ] | [ ] |
| `/act:init --type X` | [ ] | [ ] |
| `/act:init --quick` | [ ] | [ ] |
| `/act:init --with-hooks` | [ ] | [ ] |
| `/act:quick <task>` | [ ] | [ ] |
| `/act:full <project>` | [ ] | [ ] |
| `/act:status` | [ ] | [ ] |
| `/act:status --verbose` | [ ] | [ ] |
| `/act:resume` | [ ] | [ ] |
| `/act:handoff` | [ ] | [ ] |
| `/act:validate` | [ ] | [ ] |

### Fichiers .act/ Créés

| Fichier | Créé | Contenu Correct |
|---------|------|-----------------|
| config.yaml | [ ] | [ ] |
| state.md | [ ] | [ ] |
| plan.md | [ ] | [ ] |
| findings.md | [ ] | [ ] |
| progress.md | [ ] | [ ] |

### Comportements Vérifiés

| Comportement | Testé | Conforme |
|--------------|-------|----------|
| TDD Iron Law rappelée | [ ] | [ ] |
| Debugging Law rappelée | [ ] | [ ] |
| Verification Law rappelée | [ ] | [ ] |
| Session Recovery fonctionne | [ ] | [ ] |
| Quick→Full escalation | [ ] | [ ] |
| Native Skills fonctionnels | [ ] | [ ] |

---

## Rapport de Bugs

Si vous trouvez des bugs, créez un fichier `ISSUES.md` :

```markdown
# Issues ACT v2.7

## Issue #1: [Titre]
- **Commande** : /act:xxx
- **Comportement attendu** : ...
- **Comportement réel** : ...
- **Steps to reproduce** : ...
```

---

## Recommandations Post-Test

Après avoir testé, vous devriez pouvoir répondre à :

1. **Utilisabilité** : Est-ce que le workflow est intuitif ?
2. **Fiabilité** : Est-ce que les commandes fonctionnent comme documenté ?
3. **Valeur** : Est-ce que ACT apporte une vraie structure au projet ?
4. **Native Skills** : Les skills intégrés couvrent-ils vos besoins ?
5. **Gaps** : Quelles features manquent pour un usage réel ?

---

## Prochaines Étapes Suggérées

1. **Corriger les conflits v1/v2.7** (Issue critique du code review)
2. **Améliorer les hooks** (ou clarifier les limitations)
3. **Tester avec un vrai projet** (pas juste en isolation)
4. **Explorer les native skills** dans des cas d'usage réels

---

*Tutorial version: 2.0*
*ACT version: 2.7.0*
*Date: 2026-02-02*
