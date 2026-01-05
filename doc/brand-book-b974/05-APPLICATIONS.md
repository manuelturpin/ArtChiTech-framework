# B974 — APPLICATIONS GUIDE
## Mise en application sur tous les supports

---

| Métadonnée | Valeur |
|------------|--------|
| **Document** | Applications Guide |
| **Version** | 2.0 |
| **Date** | Décembre 2025 |
| **Audience** | Designers, développeurs, imprimeurs |

---

## Table des matières

1. [Web](#1-web)
2. [Print](#2-print)
3. [Réseaux sociaux](#3-réseaux-sociaux)
4. [Signatures & Signalétique](#4-signatures--signalétique)
5. [Ressources](#5-ressources)

---

# 1. WEB

## 1.1 Structure de page

```
┌────────────────────────────────────────┐
│ Navigation (Source Sans Pro, 16px)     │
├────────────────────────────────────────┤
│                                        │
│         Hero (Playfair, 48px)          │
│         Sous-titre (Source Sans)       │
│         [CTA Orange]                   │
│                                        │
├────────────────────────────────────────┤
│                                        │
│    Contenu                             │
│    (65-70% whitespace)                 │
│                                        │
└────────────────────────────────────────┘
```

## 1.2 Composants UI

| Composant | Spécification |
|-----------|---------------|
| **Boutons primaires** | Fond orange #E65100, texte blanc, radius 4px |
| **Boutons secondaires** | Bordure noir doux #2D2D2D, fond transparent |
| **Liens** | Noir doux, souligné au hover |
| **Cards** | Fond blanc, ombre légère `0 2px 8px rgba(0,0,0,0.08)` |

## 1.3 Breakpoints

| Device | Largeur |
|--------|---------|
| Mobile | 320px - 767px |
| Tablet | 768px - 1023px |
| Desktop | 1024px+ |
| Max content | 1200px |

## 1.4 Spacing system

| Token | Valeur | Usage |
|-------|--------|-------|
| `--space-xs` | 4px | Micro-espacements |
| `--space-sm` | 8px | Espacements internes |
| `--space-md` | 16px | Espacements standards |
| `--space-lg` | 24px | Sections |
| `--space-xl` | 32px | Grandes sections |
| `--space-2xl` | 48px | Hero, blocs majeurs |
| `--space-3xl` | 64px | Séparations de sections |

## 1.5 Règle du whitespace

**65-70% de whitespace** sur chaque page.

Cela signifie :
- Marges généreuses autour du contenu
- Pas de pages "chargées"
- Laisser respirer les images et les textes
- Privilégier la lisibilité à la densité d'information

---

# 2. PRINT

## 2.1 Carte de visite

### Spécifications

| Aspect | Valeur |
|--------|--------|
| **Format** | 85 x 55 mm (standard EU) |
| **Papier** | Coton 350g/m² texturé |
| **Impression** | Recto-verso |
| **Finition** | Bords arrondis optionnel |

### Layout recto

```
┌─────────────────────────────────┐
│                                 │
│           [LOGO]                │
│                                 │
│       Manuel TURPIN             │
│       Artiste Bonsaï            │
│                                 │
└─────────────────────────────────┘
```

### Layout verso

```
┌─────────────────────────────────┐
│                                 │
│    contact@b974.fr              │
│    +262 6 XX XX XX XX           │
│    b974.fr                      │
│                                 │
│    La Réunion · Europe          │
│                                 │
└─────────────────────────────────┘
```

## 2.2 Papeterie

### En-tête de lettre

| Élément | Position | Spécification |
|---------|----------|---------------|
| Logo | Haut gauche | 40mm largeur |
| Coordonnées | Haut droite | Source Sans Pro 10pt |
| Zone texte | Corps | Marges 25mm |
| Pied de page | Bas centré | Mentions légales 8pt |

### Papier recommandé

- **Correspondance** : Vergé ivoire 120g/m²
- **Documents officiels** : Offset blanc 90g/m²
- **Certificats** : Coton texturé 200g/m²

## 2.3 Supports événementiels

### Kakemono / Roll-up

| Élément | Spécification |
|---------|---------------|
| **Format** | 85 x 200 cm |
| **Logo** | Centré haut, 30cm largeur |
| **Accroche** | Playfair Display 72pt |
| **Contact** | Bas, Source Sans Pro 24pt |
| **Fond** | Ivoire #F8F5F0 |

### Badge visiteur

| Élément | Spécification |
|---------|---------------|
| **Format** | 90 x 55 mm |
| **Logo** | Haut, 25mm largeur |
| **Nom** | Playfair Display 18pt |
| **Fonction** | Source Sans Pro 12pt |

---

# 3. RÉSEAUX SOCIAUX

## 3.1 Formats d'image

| Plateforme | Format | Ratio |
|------------|--------|-------|
| Instagram Post | 1080 x 1080px | 1:1 |
| Instagram Story | 1080 x 1920px | 9:16 |
| Instagram Reel cover | 1080 x 1920px | 9:16 |
| LinkedIn | 1200 x 627px | 1.91:1 |
| Facebook | 1200 x 630px | 1.91:1 |
| YouTube Thumbnail | 1280 x 720px | 16:9 |

## 3.2 Templates recommandés

### 1. Citation

- Fond ivoire #F8F5F0
- Texte Playfair Display
- Guillemets orange #E65100
- Signature en bas droite

### 2. Avant/Après

- Split screen vertical ou horizontal
- Dates en Source Sans Pro
- Pas de flèche, juste la juxtaposition

### 3. Portrait bonsaï

- Fond neutre (ivoire ou blanc)
- Arbre centré ou règle des tiers
- Nom de l'arbre en bas (optionnel)

### 4. Conseil du jour

- Numéro en orange (#E65100), grand format
- Texte en noir doux
- Fond ivoire

## 3.3 Règles visuelles réseaux

✅ **DO**
- Photos authentiques (pas de stock)
- Tons chauds, lumière naturelle
- Textes lisibles (contraste suffisant)
- Cohérence visuelle entre les posts

❌ **DON'T**
- Filtres Instagram génériques
- Textes sur toute l'image
- Emojis en excès
- Hashtags dans l'image

## 3.4 Hashtags recommandés

**Principaux (toujours)** :
- #B974
- #bonsai
- #artdubonsai

**Secondaires (selon contexte)** :
- #bonsaiart
- #bonsailife
- #japanesebonsai
- #bonsaimaster
- #bonsaiwork
- #bonsailove

**Éviter** :
- #followforfollow
- #likeforlike
- Hashtags sans rapport avec le contenu

---

# 4. SIGNATURES & SIGNALÉTIQUE

## 4.1 Signature email

### Format texte

```
Manuel TURPIN
Artiste Bonsaï | B974

+262 6 XX XX XX XX
contact@b974.fr | b974.fr

La Réunion · Europe
```

### Format HTML

```html
<table cellpadding="0" cellspacing="0" style="font-family: 'Source Sans Pro', Arial, sans-serif; font-size: 14px; color: #2D2D2D;">
  <tr>
    <td style="padding-right: 16px; border-right: 1px solid #C9C9C9;">
      <img src="logo-soft-black.png" alt="B974" width="80" height="auto">
    </td>
    <td style="padding-left: 16px;">
      <strong style="font-size: 16px;">Manuel TURPIN</strong><br>
      <span style="color: #525252;">Artiste Bonsaï | B974</span><br><br>
      <span>+262 6 XX XX XX XX</span><br>
      <a href="mailto:contact@b974.fr" style="color: #2D2D2D;">contact@b974.fr</a> |
      <a href="https://b974.fr" style="color: #E65100;">b974.fr</a><br><br>
      <span style="color: #787878; font-size: 12px;">La Réunion · Europe</span>
    </td>
  </tr>
</table>
```

### Règles de signature

| Élément | Spécification |
|---------|---------------|
| **Logo** | 80px de large, version soft-black |
| **Police** | Source Sans Pro ou Arial (fallback) |
| **Taille texte** | 14px corps, 16px nom, 12px localisation |
| **Séparateur** | Trait vertical 1px #C9C9C9 |
| **Lien site** | Orange #E65100 |

### Éléments interdits dans la signature

❌ Citations ou proverbes  
❌ Emojis  
❌ Bannières promotionnelles  
❌ Logos partenaires sans accord  
❌ Mentions légales longues

## 4.2 Signalétique

### Enseigne extérieure

| Élément | Spécification |
|---------|---------------|
| **Logo** | Blanc sur fond noir doux |
| **Éclairage** | Indirect recommandé |
| **Matériau** | Aluminium brossé ou bois naturel |

### Signalétique intérieure

| Élément | Spécification |
|---------|---------------|
| **Plaques directionnelles** | Fond ivoire, texte noir doux |
| **Pictogrammes** | Style ligne 2px |
| **Taille minimum texte** | 18pt |

---

# 5. RESSOURCES

## 5.1 Fichiers disponibles

### Logos

| Fichier | Format | Usage |
|---------|--------|-------|
| `logo-black.svg` | SVG | Print, fonds clairs |
| `logo-soft-black.svg` | SVG | Usage principal T2 |
| `logo-white.svg` | SVG | Fonds sombres |
| `b974-logo.png` | PNG | Digital rapide |

### Favicons

| Fichier | Taille |
|---------|--------|
| `favicon-b.svg` | Vectoriel |
| `favicon.ico` | 16x16, 32x32, 48x48 |
| `apple-touch-icon.png` | 180x180 |
| `icon-192.png` | 192x192 |
| `icon-512.png` | 512x512 |

## 5.2 Polices à télécharger

**Google Fonts** (gratuit) :
- [Playfair Display](https://fonts.google.com/specimen/Playfair+Display)
- [Source Sans Pro](https://fonts.google.com/specimen/Source+Sans+Pro)

## 5.3 Outils recommandés

| Besoin | Outil |
|--------|-------|
| Design | Figma, Adobe XD |
| Vérification contraste | WebAIM Contrast Checker |
| Optimisation images | Squoosh, TinyPNG |
| Génération palettes | Coolors, Adobe Color |

## 5.4 Contact

Pour toute question sur l'application de ces guidelines :

**Manuel TURPIN**  
Fondateur B974  
contact@b974.fr

---

## Checklist de validation

Avant toute publication, vérifier :

- [ ] Logo utilisé dans la bonne version
- [ ] Couleurs conformes aux codes hex
- [ ] Typographie Playfair + Source Sans Pro
- [ ] Contraste WCAG AA minimum respecté
- [ ] Whitespace suffisant (65-70%)
- [ ] Ton de voix conforme (mentor bienveillant)
- [ ] Images style T2 (lumière dorée, chaleur)

---

**Document créé** : Décembre 2025  
**Basé sur** : B974 Brand Book v2.0

---

*B974 Brand Guidelines — Tous droits réservés*
