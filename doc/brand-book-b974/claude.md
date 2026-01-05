# B974 Brand Guidelines — Instructions pour Claude

## ⚠️ Règle de synchronisation obligatoire

**RÈGLE CRITIQUE** : Toute modification apportée à un élément de l'identité B974 doit être répercutée dans TOUS les documents concernés.

### Processus obligatoire lors d'une modification

1. **Identifier l'impact** — Déterminer quels documents sont affectés par le changement
2. **Mettre à jour tous les documents** — Appliquer la modification partout où l'élément apparaît
3. **Mettre à jour ce fichier (claude.md)** — Si la modification touche une règle critique listée ici
4. **Confirmer la synchronisation** — Lister explicitement les fichiers modifiés

### Matrice de dépendances

| Si je modifie... | Mettre à jour aussi... |
|------------------|------------------------|
| Une couleur | `02-VISUAL-IDENTITY.md`, `00-QUICK-REFERENCE.md`, `claude.md` |
| Une typographie | `02-VISUAL-IDENTITY.md`, `05-APPLICATIONS.md`, `00-QUICK-REFERENCE.md`, `claude.md` |
| Le vocabulaire/ton | `04-VOICE-TONE.md`, `00-QUICK-REFERENCE.md`, `claude.md` |
| Un composant UI | `02-VISUAL-IDENTITY.md`, `05-APPLICATIONS.md` |
| Le style photo | `03-PHOTOGRAPHY-MEDIA.md` |
| Les animations/motion | `03-PHOTOGRAPHY-MEDIA.md`, `05-APPLICATIONS.md` |
| Le logo ou ses règles | `02-VISUAL-IDENTITY.md`, `05-APPLICATIONS.md` |
| Les personas | `01-BRAND-FOUNDATIONS.md` |
| La Brand Story | `01-BRAND-FOUNDATIONS.md` |
| Les formats réseaux sociaux | `05-APPLICATIONS.md` |

### Vérification après modification

Après chaque modification, vérifier :
- [ ] Tous les documents impactés ont été mis à jour
- [ ] Les codes hex/valeurs sont identiques partout
- [ ] Le `00-QUICK-REFERENCE.md` reflète les changements essentiels
- [ ] Ce fichier `claude.md` est à jour si règle critique modifiée
- [ ] Aucune incohérence entre les documents

---

## Vue d'ensemble

Cette documentation définit l'identité de marque B974, entreprise premium de formation et conseil en bonsaï fondée par Manuel TURPIN. La marque se positionne sur le territoire "Artisan Zen Premium" avec un archétype Sage-Artisan.

---

## Structure de la documentation

| Fichier | Contenu | Quand le consulter |
|---------|---------|-------------------|
| `00-QUICK-REFERENCE.md` | Essentiel en 1 page | Rappel rapide des couleurs, typos, règles |
| `01-BRAND-FOUNDATIONS.md` | Histoire, vision, personas | Comprendre l'ADN de la marque |
| `02-VISUAL-IDENTITY.md` | Logo, couleurs, typo, icônes | Créer des visuels, du code UI |
| `03-PHOTOGRAPHY-MEDIA.md` | Photos, traitement, IA, motion | Créer/sélectionner des images, animations |
| `04-VOICE-TONE.md` | Voix, ton, vocabulaire | Rédiger du contenu, emails, posts |
| `05-APPLICATIONS.md` | Web, print, réseaux sociaux | Appliquer sur des supports spécifiques |

---

## Règles critiques à toujours respecter

### Couleurs (ne jamais dévier)

```
Ivoire      #F8F5F0   — Fond principal (55%)
Blanc       #FFFFFF   — Espace négatif (20%)
Noir doux   #2D2D2D   — Texte (15%)
Vert mousse #5D6B4A   — Accent nature (5% max)
Orange      #E65100   — CTA uniquement (5% max)
```

### Typographie

- **Titres** : Playfair Display (serif)
- **Corps** : Source Sans Pro (sans-serif)
- Ne jamais utiliser d'autres polices

### Ton de voix

- **Archétype** : Mentor bienveillant et expert
- **Toujours** : Patient, chaleureux, authentique, passionné
- **Jamais** : Urgence artificielle, superlatifs, ton corporate

### Vocabulaire obligatoire

| ❌ Ne pas dire | ✅ Dire |
|---------------|---------|
| Formation | Accompagnement |
| Cours | Séance |
| Produit | Création |
| Client | Passionné |
| Prix | Investissement |

---

## Guide par type de tâche

### Création de contenu web (landing page, composants)

1. Consulter `02-VISUAL-IDENTITY.md` pour les couleurs et typos
2. Consulter `05-APPLICATIONS.md` pour les composants UI et breakpoints
3. Appliquer 65-70% de whitespace
4. Utiliser les animations lentes (300-500ms, ease-out)

### Rédaction (emails, posts, descriptions)

1. Consulter `04-VOICE-TONE.md` pour le ton et vocabulaire
2. Adapter selon le canal (voir spectre de voix)
3. Ne jamais utiliser d'urgence artificielle
4. Vérifier la checklist voix avant finalisation

### Création visuelle (images, graphiques)

1. Consulter `03-PHOTOGRAPHY-MEDIA.md` pour le style
2. Privilégier lumière naturelle dorée, tons chauds
3. Respecter les règles IA (pas de photos de bonsaïs ou personnes générées)
4. Appliquer le traitement Lightroom si retouche nécessaire

### Présentation de la marque

1. Consulter `01-BRAND-FOUNDATIONS.md` pour la Brand Story
2. Utiliser les personas pour cibler le discours
3. Mettre en avant les 6 années au Japon avec Maître Suzuki

---

## Erreurs fréquentes à éviter

### ❌ Visuels

- Utiliser le vert #7D8B6A (ancien, non WCAG conforme)
- Placer du texte sur fond complexe sans contraste
- Oublier le whitespace (pages trop chargées)
- Animations bounce ou shake

### ❌ Rédaction

- "Le N°1 du bonsaï" (superlatif interdit)
- "Offre limitée, dernière chance !" (urgence artificielle)
- "Nos clients" (dire "les passionnés")
- Emojis excessifs dans les textes professionnels

### ❌ Photos

- Images stock génériques
- Filtres Instagram
- Flash direct
- Saturation excessive des verts

---

## Ressources rapides

### Import Google Fonts

```html
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Source+Sans+Pro:wght@300;400;600&display=swap" rel="stylesheet">
```

### Variables CSS

```css
:root {
  --color-ivory: #F8F5F0;
  --color-white: #FFFFFF;
  --color-black: #2D2D2D;
  --color-green: #5D6B4A;
  --color-orange: #E65100;
  
  --font-title: 'Playfair Display', Georgia, serif;
  --font-body: 'Source Sans Pro', -apple-system, sans-serif;
}
```

### Bouton CTA standard

```css
.btn-cta {
  background: #E65100;
  color: white;
  border-radius: 4px;
  padding: 12px 24px;
  font-family: 'Source Sans Pro', sans-serif;
  transition: transform 200ms ease-out;
}
.btn-cta:hover {
  transform: translateY(-2px);
}
```

---

## Contact

Pour toute question sur l'application de ces guidelines :

**Manuel TURPIN**  
Fondateur B974  
contact@b974.fr | b974.fr

---

*Version 2.0 — Décembre 2025*