# Architecture des Commandes ACT

> Document de référence pour l'architecture des commandes du framework ACT.

## Vue d'Ensemble

Le framework ACT utilise **`/projet`** comme point d'entrée unique. Toutes les autres commandes sont des sous-actions accessibles via le menu ou directement.

## Hiérarchie des Commandes

```
┌─────────────────────────────────────────────────────────────┐
│                      /projet                                 │
│              (Point d'entrée UNIQUE)                        │
│                         │                                    │
│         ┌───────────────┼───────────────┐                   │
│         ▼               ▼               ▼                   │
│   Nouveau projet   Existant non-ACT   ACT connu            │
│         │               │               │                   │
│         ▼               ▼               ▼                   │
│   Guide création   Spawn /onboard   Menu normal            │
│   (Mode COMPLET)        │          (6 options)             │
│                         ▼                                    │
│                   Audit complet                              │
│                         │                                    │
│                         ▼                                    │
│                   Retour /projet                             │
└─────────────────────────────────────────────────────────────┘
```

## Commandes

### `/projet` - Hub Principal

**Rôle** : Point d'entrée unique du framework.

**Logique de détection** :

| Contexte détecté | Action |
|------------------|--------|
| Aucun code | Guide "Nouveau projet" (Mode COMPLET) |
| Code sans `.epct/` | Spawn `/onboard` automatiquement |
| Code avec `.epct/` | Affiche menu normal |

**Menu (projet connu)** :

| # | Option | Commande spawnée |
|---|--------|------------------|
| 1 | Ajouter une feature | Mode FEATURE |
| 2 | Refactoring/Quick fix | Mode QUICK |
| 3 | Checklist phase actuelle | - |
| 4 | Passer à la phase suivante | `/next` |
| 5 | Status complet | `/status` |
| 6 | Ré-auditer le projet | `/onboard` |

### `/onboard` - Audit de Projet

**Rôle** : Auditer un projet et l'initialiser dans ACT.

**Déclenchement** :
- Automatique via `/projet` (projet existant non-ACT)
- Manuel pour ré-audit ou utilisateurs avancés

**Étapes** :
1. DÉTECTION - Stack, structure, type de projet
2. DIAGNOSTIC - Phase actuelle, scores par catégorie
3. RAPPORT - Affichage visuel des résultats
4. RECOMMANDATIONS - Actions priorisées
5. INITIALISATION - Création `.epct/state.json`

### Autres Commandes

| Commande | Rôle | Accès |
|----------|------|-------|
| `/status` | État du projet | Menu option 5 ou direct |
| `/next` | Navigation phases | Menu option 4 ou direct |
| `/fix` | Correction erreurs | Direct |
| `/resume` | Reprise session | Direct |
| `/help` | Aide contextuelle | Direct |

## Les 3 Modes d'Utilisation

### Mode COMPLET

**Quand** : Nouveau projet from scratch.

**Flux** : Parcourt les 7 phases dans l'ordre avec validation Go/No-Go à chaque transition.

### Mode FEATURE

**Quand** : Ajout d'une fonctionnalité sur un projet existant.

**Flux** :
1. Mini-Discovery : Comprendre le besoin
2. Mini-Stratégie : Intégration au projet
3. Conception → Développement → Tests
4. Vérification impact global

### Mode QUICK

**Quand** : Refactoring, bugfix, petite amélioration.

**Flux** :
1. Modification ciblée
2. Tests de non-régression
3. Vérification impact global (OBLIGATOIRE)

## État du Projet (`.epct/`)

Le dossier `.epct/` stocke l'état du projet ACT :

```
.epct/
├── state.json          # État courant (phase, score, chunks)
├── session/
│   └── recovery.json   # Données de reprise
└── history/
    └── checkpoints/    # Points de sauvegarde
```

**Détection** : La présence de `.epct/` indique un projet déjà initialisé dans ACT.
