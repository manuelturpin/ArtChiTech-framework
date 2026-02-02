# Loop Safety Rules

> Ces règles sont **CRITIQUES** pour éviter les incidents en production causés par le loop autonome.

## Contexte

Le loop autonome (`/loop` ou `loop.sh`) exécute du code sans supervision humaine. Un incident réel a causé la corruption d'un projet en production. Ces règles empêchent que cela se reproduise.

---

## Règles de Protection

### 1. Protection des Branches

**OBLIGATOIRE** : Ne jamais exécuter le loop sur une branche protégée.

| Branche | Statut | Action |
|---------|--------|--------|
| `main` | PROTÉGÉE | Loop REFUSÉ |
| `master` | PROTÉGÉE | Loop REFUSÉ |
| `prod` | PROTÉGÉE | Loop REFUSÉ |
| `production` | PROTÉGÉE | Loop REFUSÉ |
| `staging` | PROTÉGÉE | Loop REFUSÉ |
| `release/*` | PROTÉGÉE | Loop REFUSÉ |
| `feature/*` | OK | Loop autorisé |
| `fix/*` | OK | Loop autorisé |
| `dev` | OK | Loop autorisé |

**Comportement attendu** :
```bash
# Sur main → REFUSE
$ ./loop.sh --phase dev
❌ PROTECTED BRANCH DETECTED
Branch: main
Create a feature branch: git checkout -b feature/your-feature

# Sur feature branch → OK
$ ./loop.sh --phase dev
✓ Branch 'feature/stories' is safe for loop execution
```

### 2. Vérification du Build

**OBLIGATOIRE** : Le build doit passer après chaque story.

**Workflow** :
1. Story implémentée
2. `npm run build` exécuté
3. Si échec → `passes: false`, continuer au fix
4. Si succès → `passes: true` autorisé

**Fichiers de log** :
- `.act/logs/build-errors.log` - Erreurs de build
- `.act/logs/type-errors.log` - Erreurs TypeScript

### 3. Vérification des Types

**OBLIGATOIRE** (si TypeScript) : Les types doivent passer.

```bash
npx tsc --noEmit
```

**Erreurs courantes à éviter** :
- Propriétés manquantes sur les objets
- Types `any` implicites
- Imports non résolus

---

## Checklist Pré-Loop

Avant de lancer `./loop.sh` :

- [ ] Je suis sur une branche feature (pas main/master/prod)
- [ ] Le PRD existe (`.act/config.yaml/prd.json`)
- [ ] Le projet compile (`npm run build` passe)
- [ ] Les tests passent (`npm test` passe)
- [ ] J'ai fait un commit de sauvegarde

### Commande de vérification

```bash
# Vérifier la branche
git branch --show-current

# Vérifier le build
npm run build

# Vérifier les tests
npm test
```

---

## Checklist Post-Story

Après chaque story dans le loop :

- [ ] Build vérifié (automatique via loop.sh)
- [ ] Types vérifiés (automatique via loop.sh)
- [ ] Pas de dépendances non installées
- [ ] Schema DB respecté (noms de champs corrects)

---

## Scénarios d'Échec

### Scénario 1 : Build Échoue

**Symptôme** : `BUILD FAILED` dans les logs
**Comportement** : Loop continue, story marquée `passes: false`
**Action** : L'itération suivante tentera de corriger

### Scénario 2 : Type Errors

**Symptôme** : `TYPE ERRORS DETECTED` dans les logs
**Comportement** : Loop continue, story marquée `passes: false`
**Action** : L'itération suivante tentera de corriger

### Scénario 3 : Branche Protégée

**Symptôme** : `PROTECTED BRANCH DETECTED`
**Comportement** : Loop REFUSE de démarrer
**Action** : Créer une branche feature

### Scénario 4 : Loop Infini

**Symptôme** : Même story échoue 2+ fois
**Comportement** : Story skippée
**Action** : Intervention manuelle requise

---

## Règles pour Claude dans le Loop

### MUST DO (Obligatoire)

1. **Analyser les patterns existants** avant de coder
2. **Vérifier le schema** avant toute query DB
3. **Vérifier les dépendances** avant d'importer
4. **Exécuter le build** avant de marquer `passes: true`
5. **Logger chaque action** dans progress.md

### MUST NOT DO (Interdit)

1. **Ne jamais** marquer `passes: true` si le build échoue
2. **Ne jamais** installer de nouvelles dépendances sans autorisation
3. **Ne jamais** modifier des fichiers hors scope de la story
4. **Ne jamais** supposer un schema DB sans le vérifier
5. **Ne jamais** ignorer les erreurs de type

---

## Commandes de Récupération

### Si le loop a corrompu le projet

```bash
# Annuler les changements non commités
git checkout -- .

# Revenir au dernier commit sain
git reset --hard HEAD~1

# Voir l'historique des commits du loop
git log --oneline -20
```

### Si le build est cassé

```bash
# Voir les erreurs
cat .act/logs/build-errors.log

# Corriger manuellement puis relancer
npm run build
```

---

## Métriques de Sécurité

Le loop track ces métriques dans `.act/logs/metrics.json` :

```json
{
  "total_iterations": 15,
  "successful_stories": 12,
  "failed_stories": 3,
  "build_failures": 2,
  "type_failures": 1,
  "branch_blocks": 0
}
```

---

## En Cas d'Incident

1. **STOP** le loop immédiatement (Ctrl+C)
2. **VERIFY** l'état du projet (`git status`, `npm run build`)
3. **REVERT** si nécessaire (`git checkout -- .`)
4. **REPORT** l'incident via `/act:feedback`
5. **DOCUMENT** ce qui s'est passé dans `docs/handoffs/`

---

## Résumé des Protections

| Protection | Implémentée | Fichier |
|------------|-------------|---------|
| Branch detection | ✅ | `loop.sh` |
| Build verification | ✅ | `loop.sh` |
| Type checking | ✅ | `loop.sh` |
| Pattern analysis | ✅ | `loop-prompt.md` |
| Dependency check | ✅ | `loop-prompt.md` |
| Schema verification | ✅ | `loop-prompt.md` |
| Checklist enforcement | ✅ | `loop-prompt.md` |
