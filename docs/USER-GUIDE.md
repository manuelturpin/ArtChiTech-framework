# Guide Utilisateur - Bonsai Tracker

## Introduction

Bonsai Tracker est une application web pour gérer votre collection de bonsaïs et vos sites de culture.

## Démarrage Rapide

### Lancer l'application

```bash
npm run dev
```

Ouvrir http://localhost:3001 dans votre navigateur.

## Fonctionnalités

### Onglet Bonsais

#### Dashboard
- **Total Bonsais** : Nombre total de bonsaïs
- **Sites** : Nombre de sites différents
- **En Santé** : Bonsaïs avec statut "healthy"
- **Âge Moyen** : Moyenne d'âge de la collection

#### Filtres
- **Par site** : Sélectionner un site spécifique
- **Par statut** : Filtrer par état de santé
- **Par espèce** : Recherche textuelle

#### Actions sur un Bonsai
- **Modifier** : Changer les informations
- **Transférer** : Déplacer vers un autre site
- **Supprimer** : Retirer de la collection

#### Créer un Bonsai
1. Cliquer sur "+ Nouveau Bonsai"
2. Remplir les champs obligatoires (*)
3. Cliquer sur "Enregistrer"

### Onglet Sites

#### Dashboard Sites
- **Total Sites** : Nombre de sites
- **Capacité Totale** : Somme des capacités
- **Pépinières** : Nombre de sites type pépinière
- **Showrooms** : Nombre de showrooms

#### Créer un Site
1. Cliquer sur "+ Nouveau Site"
2. Remplir nom, localisation, capacité
3. Choisir le type
4. Cliquer sur "Enregistrer"

## Statuts des Bonsais

| Statut | Description |
|--------|-------------|
| 🟢 En santé | Bonsaï en bonne condition |
| 🔴 Malade | Nécessite attention |
| 🟠 Traitement | En cours de traitement |
| 🟡 Quarantaine | Isolé par précaution |
| ⚪ Vendu | Bonsaï vendu |

## Types de Sites

| Type | Usage |
|------|-------|
| Pépinière | Culture et entretien |
| Showroom | Exposition et vente |
| Stockage | Stockage temporaire |
| Vente | Point de vente |

## API REST

| Endpoint | Méthode | Description |
|----------|---------|-------------|
| `/api/bonsais` | GET | Liste des bonsaïs |
| `/api/bonsais` | POST | Créer un bonsaï |
| `/api/bonsais/:id` | PUT | Modifier un bonsaï |
| `/api/bonsais/:id` | DELETE | Supprimer |
| `/api/bonsais/:id/transfer` | POST | Transférer |
| `/api/sites` | GET | Liste des sites |
| `/api/sites` | POST | Créer un site |
| `/api/stats` | GET | Statistiques |
| `/api/errors` | GET | Logs d'erreurs |

## Support

Pour signaler un bug ou suggérer une amélioration, créer une issue sur le dépôt GitHub.
