# ArtChiTech Framework (ACT) - Vue d'Ensemble

## Identité

- **Nom complet** : ArtChiTech Framework
- **Raccourci** : ACT
- **Type** : Plugin Claude Code
- **Objectif** : Framework de suivi et réalisation de projets

---

## Les 7 Phases du Projet

Le framework structure tout projet en 7 phases séquentielles :

| Phase | Nom | Objectif | Livrable |
|-------|-----|----------|----------|
| 1 | **Discovery** | Valider le problème et les besoins | Rapport de découverte |
| 2 | **Stratégie** | Définir roadmap et business model | Plan stratégique |
| 3 | **Conception** | Designer architecture et UX | Spécifications techniques |
| 4 | **Développement** | Implémenter avec TDD | Code fonctionnel |
| 5 | **Qualité** | Tester et valider | Rapport de tests |
| 6 | **Lancement** | Déployer et acquérir | Produit en production |
| 7 | **Croissance** | Itérer et optimiser | Métriques et améliorations |

### Progression entre phases

- Chaque phase a des **critères Go/No-Go**
- Passage à la phase suivante uniquement si critères validés
- Possibilité de revenir en arrière si problème détecté

---

## Les 3 Modes d'Utilisation

| Mode | Quand l'utiliser | Description |
|------|------------------|-------------|
| **COMPLET** | Nouveau projet, SaaS, produit | Toutes les phases (1-7) |
| **FEATURE** | Nouvelle fonctionnalité | Adapté selon la feature |
| **QUICK** | Petite amélioration | Vérification globale requise |

### Mode COMPLET

- Utilisé pour un projet from scratch
- Parcourt les 7 phases dans l'ordre
- Validation complète à chaque étape

### Mode FEATURE

- Pour ajouter une fonctionnalité à un projet existant
- **Peut nécessiter toutes les 7 phases** selon l'importance de la feature
- Discovery : comprendre le besoin de la feature
- Stratégie : définir comment elle s'intègre au projet
- Phases 3-6 : concevoir, développer, tester, déployer
- **Phase 7 : intégration au projet global** - toujours vérifier l'impact sur l'ensemble

### Mode QUICK

- Pour une petite modification ou bugfix
- Exécution rapide des étapes nécessaires
- **Toujours vérifier l'intégralité du projet** après modification
- Ne pas négliger les tests même pour un petit changement

---

## Philosophie

### Principes clés

1. **Validation continue** - Chaque phase valide avant de passer à la suivante
2. **TDD obligatoire** - Le code est toujours testé
3. **Vérification globale** - Tout changement vérifie l'impact sur l'ensemble
4. **Documentation intégrée** - Pas de code sans documentation
5. **Itération rapide** - Livrer souvent, améliorer constamment

### Ce que ACT n'est PAS

- Un framework rigide sans flexibilité
- Une méthodologie lourde type Waterfall
- Un outil qui remplace la réflexion humaine

---

## Commandes Principales

| Commande | Rôle |
|----------|------|
| `/onboard` | Auditer un projet existant |
| `/projet` | Hub principal interactif |
| `/status` | Voir l'état actuel |
| `/next` | Passer à l'étape suivante |
| `/fix` | Corriger une erreur |
| `/resume` | Reprendre une session |
| `/help` | Aide contextuelle |
