# Post-Mortem : Loop en Production - Blog B974

> **Date** : 2026-01-12
> **Severity** : High
> **Durée incident** : ~2h
> **Résolution** : Git reset

---

## Résumé

Le loop de développement Phase 4 (10 stories) a été exécuté directement sur le repo de production VPS-b974.fr au lieu d'une branche isolée. Résultat : app cassée, erreurs TypeScript multiples, rollback nécessaire.

---

## Timeline

| Heure | Action | Résultat |
|-------|--------|----------|
| 22:42 | Lancement `loop.sh --phase dev` sur VPS-b974.fr | Loop démarre |
| 23:32 | Loop termine (10/10 stories) | 7157 lignes ajoutées |
| 23:35 | Tentative `pnpm build` | Échec - dépendances manquantes |
| 23:40 | Installation dépendances | OK |
| 23:45 | Tentative build | Échec - erreurs TypeScript |
| 00:15 | Corrections TypeScript manuelles | Partiellement OK |
| 00:30 | Lancement serveur dev | Crash PostHogProvider |
| 00:45 | Décision rollback | - |

---

## Erreurs Techniques Identifiées

### 1. Types Prisma non résolus

**Symptôme** : `Property 'blogPost' does not exist on type 'PrismaClient'`

**Cause** :
- Monorepo avec package `@b974/database`
- Prisma 7 avec exports complexes
- Le client généré n'expose pas les nouveaux modèles via le re-export

**Code problématique** :
```typescript
// Ce qui était généré
import { prisma, BlogStatus } from '@/lib/db'
const posts = await prisma.blogPost.findMany({...})

// Le problème
// - BlogStatus exporté comme TYPE, pas comme VALEUR
// - prisma.blogPost non reconnu car types pas propagés
```

### 2. Prisma nullable ignoré

**Symptôme** : `'prisma' is possibly 'null'`

**Cause** :
- Pattern existant : `createPrismaClient()` retourne `null` si pas de DATABASE_URL
- Le loop a généré du code sans vérification `isDatabaseAvailable`

**Pattern existant ignoré** :
```typescript
// Pattern du projet
if (!isDatabaseAvailable || !prisma) {
  return { error: 'Database not available' }
}

// Ce qui a été généré (sans vérification)
const posts = await prisma.blogPost.findMany({...})
```

### 3. Dépendances non installées

**Symptôme** : `Module not found: Can't resolve '@anthropic-ai/sdk'`

**Cause** :
- Le loop a ajouté les imports mais pas fait `pnpm install`
- Le prompt du loop ne vérifie pas l'installation des dépendances

**Dépendances ajoutées mais non installées** :
- @anthropic-ai/sdk
- @mdx-js/mdx
- @react-email/components
- cloudinary
- openai
- resend

### 4. Noms de champs incorrects

**Symptôme** : `Property 'confirmationToken' does not exist... Did you mean 'confirmToken'?`

**Cause** :
- Le schema Prisma utilise `confirmToken`
- Le code généré utilise `confirmationToken`
- Pas de vérification du schema existant avant génération

### 5. PostHogProvider crash

**Symptôme** : `Runtime Error: module factory is not available`

**Cause** :
- Probablement conflit HMR (Hot Module Replacement) avec Turbopack
- Nouvelles dépendances peuvent avoir causé des conflits
- Non directement lié au code blog mais effet de bord

---

## Erreurs de Processus

### 1. Loop direct en production

**Ce qui s'est passé** :
```bash
./loop.sh --phase dev --target /Users/.../VPS-b974.fr  # PROD!
```

**Ce qui aurait dû être fait** :
```bash
# Option A : Branche isolée
git checkout -b feature/blog-b974
./loop.sh --phase dev

# Option B : Repo de test
./loop.sh --phase dev --target /path/to/test-repo
```

### 2. Pas de vérification build dans le loop

**Problème** : Le loop marque les stories "passed" sans vérifier que le build fonctionne.

**Le prompt du loop devrait inclure** :
```markdown
## Après chaque story

1. Vérifier que `pnpm build` passe
2. Vérifier que `pnpm typecheck` passe
3. Si échec, corriger AVANT de passer à la story suivante
```

### 3. Pas d'analyse des patterns existants

**Problème** : Le loop génère du code sans analyser les conventions du projet cible.

**Exemples** :
- Utilise `prisma` direct au lieu de vérifier `isDatabaseAvailable`
- Génère des enums TypeScript au lieu d'utiliser les enums Prisma
- Ignore les patterns d'import du projet

---

## Impact

| Métrique | Valeur |
|----------|--------|
| Commits à rollback | 10 |
| Lignes de code perdues | ~7000 |
| Temps perdu | ~2h |
| État du repo prod | Corrompu (avant reset) |

---

## Actions Correctives

### Court terme (ce session)

- [x] Documenter l'incident (ce fichier)
- [ ] Reset git vers bf0de19
- [ ] Vérifier que l'app fonctionne après reset

### Moyen terme (améliorer le framework)

1. **Modifier loop.sh** :
   - Ajouter check `pnpm build` après chaque story
   - Ajouter check `pnpm typecheck`
   - Refuser de continuer si checks échouent

2. **Modifier loop-prompt.md** :
   - Exiger analyse des patterns existants AVANT de coder
   - Vérifier les exports de types Prisma
   - Installer les dépendances avec le bon package manager

3. **Ajouter garde-fou** :
   - Détecter si on est sur main/master/prod et REFUSER
   - Exiger `--force` pour loop sur branche principale

### Long terme (process)

1. **Règle absolue** : JAMAIS de loop sur repo/branche de production
2. **Toujours** : Créer branche isolée ou utiliser repo de test
3. **Validation** : Build + types + tests AVANT de merger

---

## Leçons Apprises

1. **Ne jamais faire confiance au loop pour la qualité** - Il génère du code mais ne vérifie pas qu'il fonctionne

2. **Les patterns existants doivent être respectés** - Le loop doit analyser avant de générer

3. **La vélocité n'est pas tout** - 10 stories en 50min = impressionnant, mais inutile si ça casse tout

4. **Le rollback est toujours possible** - Git est notre filet de sécurité

5. **Documenter les échecs** - Ce post-mortem aidera à améliorer le framework

---

## Fichiers Affectés (pour référence)

```
apps/webapp/src/app/api/blog/          # 8 fichiers API
apps/webapp/src/app/blog/              # 3 pages
apps/webapp/src/components/blog/       # 6 composants
apps/webapp/src/components/admin/      # 1 composant
apps/webapp/src/emails/                # 2 templates
apps/webapp/src/lib/                   # 5 services
apps/webapp/tests/e2e/                 # 3 fichiers tests
packages/database/prisma/schema.prisma # Modifié
```

---

*Post-mortem rédigé le 2026-01-12 par Claude + Manuel*
