# B974 — VISUAL IDENTITY GUIDE
## Identité visuelle complète

---

| Métadonnée | Valeur |
|------------|--------|
| **Document** | Visual Identity Guide |
| **Version** | 2.0 |
| **Date** | Décembre 2025 |
| **Audience** | Designers, développeurs |

---

## Table des matières

1. [Logo](#1-logo)
2. [Palette de couleurs](#2-palette-de-couleurs)
3. [Typographie](#3-typographie)
4. [Iconographie](#4-iconographie)

---

# 1. LOGO

## 1.1 Versions du logo

| Version | Fichier | Usage |
|---------|---------|-------|
| **Noir pur** | `logo-black.svg` | Fonds blancs/clairs, print haute qualité |
| **Noir doux** | `logo-soft-black.svg` | Usage principal T2, cohérence palette |
| **Blanc** | `logo-white.svg` | Fonds sombres, Dark Mode |
| **PNG** | `b974-logo.png` | Usages digitaux rapides |

**Logo principal recommandé** : `logo-soft-black.svg` (#2D2D2D)

## 1.2 Zone de protection

Espace libre autour du logo = **1/4 de sa hauteur** sur chaque côté.

```
    ┌─────────────────────────────┐
    │                             │
    │    ┌─────────────────┐     │
    │    │                 │     │
    │    │     B 9 7 4     │     │
    │    │                 │     │
    │    └─────────────────┘     │
    │                             │
    └─────────────────────────────┘
         ←── Zone libre ──→
```

## 1.3 Tailles minimales

| Support | Taille minimale |
|---------|-----------------|
| **Print** | 15mm de largeur |
| **Digital** | 80px de largeur |
| **Favicon** | 32x32px (version simplifiée) |

## 1.4 Usages interdits

❌ Ne pas déformer ou étirer le logo  
❌ Ne pas changer les couleurs arbitrairement  
❌ Ne pas ajouter d'effets (ombres, dégradés, contours)  
❌ Ne pas placer sur fonds complexes sans zone de protection  
❌ Ne pas modifier les proportions internes  
❌ Ne pas utiliser en basse résolution (pixelisé)

## 1.5 Lockups Logo + Baseline

### Lockup horizontal

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│   [B974 LOGO]  │  L'ART DU TEMPS                   │
│                                                     │
└─────────────────────────────────────────────────────┘
```

| Élément | Spécification |
|---------|---------------|
| **Séparateur** | Trait vertical 1px, #2D2D2D |
| **Espacement** | 24px entre logo et séparateur, 24px entre séparateur et texte |
| **Typographie** | Source Sans Pro Light 300, taille = 40% hauteur logo |
| **Usage** | Headers web, en-têtes documents, signatures email |

### Lockup vertical

| Élément | Spécification |
|---------|---------------|
| **Espacement** | 16px entre logo et baseline |
| **Typographie** | Source Sans Pro Light 300, taille = 30% largeur logo |
| **Usage** | Cartes de visite, réseaux sociaux, signalétique |

## 1.6 Co-branding

| Règle | Application |
|-------|-------------|
| **Position** | B974 toujours à gauche (lecture occidentale) |
| **Taille** | Logo B974 jamais plus petit que le partenaire |
| **Séparation** | Trait vertical ou espace minimum = 2x zone de protection |
| **Couleur** | Chaque marque garde ses couleurs propres |

## 1.7 Favicon

Le favicon utilise uniquement le **"B"** du logo.

| Format | Taille | Fichier |
|--------|--------|---------|
| **SVG** | Vectoriel | `favicon-b.svg` |
| **ICO** | 16x16, 32x32, 48x48 | `favicon.ico` |
| **PNG** | 180x180 (Apple Touch) | `apple-touch-icon.png` |
| **PNG** | 192x192, 512x512 (PWA) | `icon-192.png`, `icon-512.png` |

---

# 2. PALETTE DE COULEURS

## 2.1 Couleurs principales

### Ivoire — Fond principal (55%)

| Format | Valeur |
|--------|--------|
| **Hex** | `#F8F5F0` |
| **RGB** | 248, 245, 240 |
| **CMYK** | 2, 2, 4, 0 |
| **Pantone** | 7527 C |

### Blanc — Accent neutre (20%)

| Format | Valeur |
|--------|--------|
| **Hex** | `#FFFFFF` |
| **RGB** | 255, 255, 255 |
| **CMYK** | 0, 0, 0, 0 |

### Noir doux — Texte principal (15%)

| Format | Valeur |
|--------|--------|
| **Hex** | `#2D2D2D` |
| **RGB** | 45, 45, 45 |
| **CMYK** | 70, 65, 62, 75 |
| **Pantone** | Black 7 C |

## 2.2 Couleurs secondaires (5% max chacune)

### Vert mousse — Accent nature

| Format | Valeur |
|--------|--------|
| **Hex** | `#5D6B4A` |
| **RGB** | 93, 107, 74 |
| **WCAG** | ✅ 5.1:1 (AA conforme) |

⚠️ **Important** : Ne PAS utiliser l'ancien vert #7D8B6A (ratio 3.2:1, non conforme).

### Orange B974 — CTA & Accent

| Format | Valeur |
|--------|--------|
| **Hex** | `#E65100` |
| **RGB** | 230, 81, 0 |
| **Pantone** | 1665 C |

## 2.3 Accessibilité (WCAG 2.2)

| Combinaison | Ratio | Conformité |
|-------------|-------|------------|
| Noir doux sur Ivoire | 10.5:1 | ✅ AAA |
| Noir doux sur Blanc | 12.6:1 | ✅ AAA |
| Vert mousse sur Ivoire | 5.1:1 | ✅ AA |
| Orange sur Blanc | 4.6:1 | ✅ AA (grands textes) |

## 2.4 Nuances et Tints

### Ivoire — Nuances

| Nuance | Hex | Usage |
|--------|-----|-------|
| Ivoire 100% | `#F8F5F0` | Base, fond principal |
| Ivoire 75% | `#FAF8F5` | Fond secondaire, cards |
| Ivoire 50% | `#FCFAF8` | Hover states légers |
| Ivoire 25% | `#FDFCFB` | Presque blanc, transitions |

### Noir doux — Nuances

| Nuance | Hex | Usage |
|--------|-----|-------|
| Noir 100% | `#2D2D2D` | Texte principal |
| Noir 75% | `#525252` | Texte secondaire |
| Noir 50% | `#787878` | Texte tertiaire, placeholders |
| Noir 25% | `#A3A3A3` | Texte désactivé, légendes |
| Noir 10% | `#C9C9C9` | Bordures légères |

### Vert mousse — Nuances

| Nuance | Hex | Usage |
|--------|-----|-------|
| Vert 100% | `#5D6B4A` | Accent principal |
| Vert 75% | `#7D896B` | Hover sur vert |
| Vert 50% | `#9EA78D` | Backgrounds subtils |
| Vert 25% | `#BEC5AE` | Tags, badges légers |
| Vert 10% | `#DEE2D6` | Fond section nature |

### Orange B974 — Nuances

| Nuance | Hex | Usage |
|--------|-----|-------|
| Orange 100% | `#E65100` | CTA principal |
| Orange 75% | `#EB7433` | Hover sur CTA |
| Orange 50% | `#F29766` | Accents secondaires |
| Orange 25% | `#F8BA99` | Backgrounds doux |
| Orange 10% | `#FCDCCC` | Fond alertes |

## 2.5 Variables CSS

```css
:root {
  /* Ivoire */
  --color-ivory-100: #F8F5F0;
  --color-ivory-75: #FAF8F5;
  --color-ivory-50: #FCFAF8;
  --color-ivory-25: #FDFCFB;

  /* Noir doux */
  --color-black-100: #2D2D2D;
  --color-black-75: #525252;
  --color-black-50: #787878;
  --color-black-25: #A3A3A3;
  --color-black-10: #C9C9C9;

  /* Vert mousse */
  --color-green-100: #5D6B4A;
  --color-green-75: #7D896B;
  --color-green-50: #9EA78D;
  --color-green-25: #BEC5AE;
  --color-green-10: #DEE2D6;

  /* Orange B974 */
  --color-orange-100: #E65100;
  --color-orange-75: #EB7433;
  --color-orange-50: #F29766;
  --color-orange-25: #F8BA99;
  --color-orange-10: #FCDCCC;
}
```

## 2.6 Dark Mode

### Standard

| Couleur claire | → | Couleur sombre |
|----------------|---|----------------|
| Ivoire #F8F5F0 | → | Noir chaud #1E1E1C |
| Blanc #FFFFFF | → | Gris profond #121212 |
| Noir doux #2D2D2D | → | Ivoire #F8F5F0 |
| Vert mousse #5D6B4A | → | Vert clair #8FA876 |

### Dark Mode Premium (Validé)

| Élément | Couleur | Hex |
|---------|---------|-----|
| **Fond principal** | Noir profond | `#050505` |
| **Fond secondaire** | Noir gris | `#0a0a0a` |
| **Accent principal** | Orange B974 | `#E65100` |
| **Texte principal** | Gris clair | `#E5E5E5` |
| **Texte secondaire** | Gris moyen | `#9CA3AF` |
| **Bordures subtiles** | Blanc 5% | `rgba(255,255,255,0.05)` |

---

# 3. TYPOGRAPHIE

## 3.1 Familles de polices

### Titres — Playfair Display

| Propriété | Valeur |
|-----------|--------|
| **Police** | Playfair Display |
| **Source** | Google Fonts (gratuit) |
| **Graisses** | Regular (400), Bold (700) |
| **Usage** | Titres, accroches, citations |

```css
font-family: 'Playfair Display', Georgia, serif;
```

### Corps — Source Sans Pro

| Propriété | Valeur |
|-----------|--------|
| **Police** | Source Sans Pro |
| **Source** | Google Fonts (gratuit) |
| **Graisses** | Light (300), Regular (400), SemiBold (600) |
| **Usage** | Corps de texte, UI, navigation |

```css
font-family: 'Source Sans Pro', -apple-system, sans-serif;
```

## 3.2 Hiérarchie typographique

| Niveau | Police | Taille | Graisse | Interligne |
|--------|--------|--------|---------|------------|
| **H1** | Playfair Display | 48px / 3rem | 700 | 1.2 |
| **H2** | Playfair Display | 36px / 2.25rem | 700 | 1.25 |
| **H3** | Playfair Display | 28px / 1.75rem | 400 | 1.3 |
| **H4** | Source Sans Pro | 22px / 1.375rem | 600 | 1.35 |
| **Body** | Source Sans Pro | 18px / 1.125rem | 400 | 1.6 |
| **Small** | Source Sans Pro | 14px / 0.875rem | 400 | 1.5 |
| **Caption** | Source Sans Pro | 12px / 0.75rem | 300 | 1.4 |

## 3.3 Espacements

| Propriété | Valeur |
|-----------|--------|
| **Letter-spacing titres** | -0.02em |
| **Letter-spacing corps** | 0 (normal) |
| **Espacement paragraphes** | 1.5em |
| **Largeur de colonne max** | 70 caractères |

## 3.4 Règles de capitalisation

| Élément | Règle | Exemple |
|---------|-------|---------|
| **H1** | Première lettre majuscule | "L'art du bonsaï" |
| **H2, H3** | Première lettre majuscule | "Notre philosophie" |
| **Navigation** | Minuscules | "services", "contact" |
| **Boutons CTA** | Première lettre majuscule | "Découvrir", "Réserver" |
| **Baseline** | Majuscules | "L'ART DU TEMPS" |

## 3.5 Polices de substitution (Fallback)

```css
/* Titres */
font-family: 'Playfair Display', Georgia, 'Times New Roman', serif;

/* Corps */
font-family: 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
```

---

# 4. ICONOGRAPHIE

## 4.1 Style des icônes

| Aspect | Directive |
|--------|-----------|
| **Style** | Ligne (stroke), pas de remplissage |
| **Épaisseur** | 1.5px - 2px |
| **Coins** | Arrondis (radius 2px) |
| **Grille** | 24x24px |
| **Couleur** | Noir doux #2D2D2D |

## 4.2 Set d'icônes B974

### Navigation principale

| # | Nom | Description | Usage |
|---|-----|-------------|-------|
| 1 | **Bonsaï** | Silhouette d'arbre stylisé | Logo navigation |
| 2 | **Accueil** | Maison japonaise simplifiée | Lien accueil |
| 3 | **Services** | Main tenant un outil | Menu services |
| 4 | **Boutique** | Pot céramique | E-commerce |
| 5 | **Contact** | Enveloppe avec feuilles | Formulaire |

### Actions UI

| # | Nom | Description | Usage |
|---|-----|-------------|-------|
| 6 | **Recherche** | Loupe incurvée | Barre de recherche |
| 7 | **Panier** | Pot avec anse | E-commerce |
| 8 | **Menu** | 3 lignes arrondies | Menu mobile |
| 9 | **Fermer** | X arrondi | Fermeture modales |
| 10 | **Flèche** | Trait calligraphique | Navigation, CTA |

### Services & expertise

| # | Nom | Description | Usage |
|---|-----|-------------|-------|
| 13 | **Formation** | Deux silhouettes | Accompagnement |
| 14 | **Conseil** | Bulle + feuille | Consultations |
| 15 | **Taille** | Ciseaux hasami | Service taille |
| 16 | **Rempotage** | Pot + racines | Service rempotage |

### Symboles identitaires

| # | Nom | Description | Usage |
|---|-----|-------------|-------|
| 23 | **Japon** | Torii simplifié | Référence origine |
| 24 | **Réunion** | Montagne triangulaire | Ancrage local |
| 25 | **Enso** | Cercle incomplet | Philosophie |

## 4.3 Grille de construction

```
┌────────────────────────┐
│  ┌──────────────────┐  │
│  │                  │  │ ← Zone active 20x20px
│  │    [ICÔNE]       │  │
│  │                  │  │
│  └──────────────────┘  │
│                        │ ← Marge 2px
└────────────────────────┘
        24x24px
```

| Paramètre | Valeur |
|-----------|--------|
| **Grille totale** | 24 × 24 px |
| **Zone active** | 20 × 20 px (marge 2px) |
| **Épaisseur trait** | 1.5px (petites), 2px (grandes) |
| **Terminaisons** | Round cap |
| **Jointures** | Round join |

## 4.4 États interactifs

| État | Couleur | Effet |
|------|---------|-------|
| **Default** | Noir doux #2D2D2D | — |
| **Hover** | Orange #E65100 | Transition 200ms |
| **Active** | Orange #E65100 | Scale 0.95 |
| **Disabled** | Noir 25% #A3A3A3 | Opacité 50% |
| **Focus** | Noir doux #2D2D2D | Outline orange 2px |

## 4.5 Bibliothèque de base

Pour les icônes génériques, utiliser **Lucide Icons** :

```jsx
<Icon
  size={24}
  strokeWidth={1.5}
  color="#2D2D2D"
  strokeLinecap="round"
  strokeLinejoin="round"
/>
```

**Icônes Lucide compatibles B974 :**
- `ChevronRight`, `ChevronDown` — Navigation
- `Check`, `X` — Validation
- `Calendar`, `Clock` — Dates
- `MapPin`, `Globe` — Localisation
- `Download`, `Upload` — Fichiers
- `Settings`, `User` — Compte

---

**Document créé** : Décembre 2025  
**Basé sur** : B974 Brand Book v2.0

---

*B974 Brand Guidelines — Tous droits réservés*
