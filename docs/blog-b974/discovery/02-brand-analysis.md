# DISC-002 - Analyse Brand Guidelines B974

> Date: 2026-01-11 | Phase: Discovery | Status: Complete

## Summary

B974 possède une identité visuelle "Premium Zen Artisan" complète, documentée dans un Brand Book de 1960 lignes. Le design system est mature et prêt pour l'extension blog.

---

## 1. Palette Couleurs

### Couleurs Principales

| Nom | Hex | CSS Variable | Usage |
|-----|-----|--------------|-------|
| **Ivoire** | #F8F5F0 | `--color-brand-ivory` | 55% - Background dominant |
| **Blanc** | #FFFFFF | `--color-brand-white` | 20% - Cards, whitespace |
| **Noir Doux** | #2D2D2D | `--color-brand-black`, `--foreground` | 15% - Texte |
| **Vert Mousse** | #5D6B4A | `--color-brand-green` | 5% - Accents navigation |
| **Orange B974** | #E65100 | `--primary`, `--color-brand-orange` | 5% - CTAs |

### Nuances & Variantes

**Noir Doux**
- 100%: #2D2D2D (texte principal)
- 75%: #525252 (texte secondaire)
- 50%: #787878 (texte tertiaire)
- 25%: #A3A3A3 (disabled)
- 10%: #C9C9C9 (bordures)

**Ivoire**
- 100%: #F8F5F0 (base)
- 75%: #FAF8F5 (cards)
- 50%: #FCFAF8 (hover)
- 25%: #FDFCFB (transitions)

**Vert Mousse**
- 100%: #5D6B4A (accent)
- 75%: #7D896B (hover)
- 50%: #9EA78D (backgrounds)
- 25%: #BEC5AE (badges)
- 10%: #DEE2D6 (sections nature)

**Orange B974**
- 100%: #E65100 (CTA primaire)
- 75%: #EB7433 (hover CTA)
- 50%: #F29766 (accents secondaires)
- 25%: #F8BA99 (backgrounds)
- 10%: #FCDCCC (alertes)

### Dark Mode

```css
.dark {
  --background: #050505;
  --foreground: #E5E5E5;
  --card: #0a0a0a;
  --primary: #E65100; /* inchangé */
  --border: rgba(255, 255, 255, 0.05);
}
```

### Accessibilité

| Combinaison | Contraste | WCAG |
|-------------|-----------|------|
| Noir doux sur Ivoire | 10.5:1 | AAA |
| Vert mousse sur Ivoire | 5.1:1 | AA |
| Orange sur blanc | 4.6:1 | AA (large text) |

---

## 2. Typographies

### Polices

| Police | Type | Usage | Weights |
|--------|------|-------|---------|
| **Playfair Display** | Serif | Headings H1-H3 | 400, 700 |
| **Source Sans 3** | Sans-serif | Body, UI | 300, 400, 600 |

### Hiérarchie Typographique

| Niveau | Police | Taille | Weight | Line Height |
|--------|--------|--------|--------|-------------|
| H1 | Playfair | 48px / 3rem | 700 | 1.2 |
| H2 | Playfair | 36px / 2.25rem | 700 | 1.25 |
| H3 | Playfair | 28px / 1.75rem | 600 | 1.3 |
| H4 | Source Sans | 22px / 1.375rem | 600 | 1.35 |
| Body | Source Sans | 18px / 1.125rem | 400 | 1.6 |
| Small | Source Sans | 14px / 0.875rem | 400 | 1.5 |
| Caption | Source Sans | 12px / 0.75rem | 300 | 1.4 |

### Implémentation

```typescript
// layout.tsx
const playfair = Playfair_Display({
  variable: '--font-heading',
  subsets: ['latin'],
  weight: ['400', '700'],
  display: 'swap',
})

const sourceSans = Source_Sans_3({
  variable: '--font-body',
  subsets: ['latin'],
  weight: ['300', '400', '600'],
  display: 'swap',
})
```

---

## 3. Ton Éditorial

### Archétype de Marque

**Sage-Artisan** (55% Sage, 45% Creator)
- Expert mais humble
- Mentor patient, non condescendant
- Artisan passionné
- Bienveillant et authentique

### Baseline

> **"L'ART DU TEMPS"**

### Vocabulaire Préféré

| Éviter | Préférer |
|--------|----------|
| Formation | Accompagnement |
| Enseigner | Transmettre |
| Apprendre | Progresser |
| Produit | Création vivante |
| Rapidité | Patience |
| Perfection | Excellence |
| Client | Passionné |
| Achat | Adoption |
| Prix | Investissement |

### Termes Interdits

- Superlatifs ("le meilleur", "unique au monde")
- Urgence artificielle ("offre limitée", "dernier jour")
- Jargon corporate
- Clichés japonais superficiels
- Marketing-speak

### Exemples de Copy

**Ce que B974 dit :**
- "L'art du bonsai se transmet avec patience."
- "Progressez vers l'excellence à travers un accompagnement personnalisé."
- "Je prends soin de vos arbres pendant vos absences."
- "Que vous débutiez ou souhaitiez perfectionner vos techniques, je vous accompagne."

**Ce que B974 ne dit jamais :**
- "Devenez expert rapidement !"
- "Formation intensive 5 jours, résultats garantis"
- "Le N°1 du bonsai en Europe"
- "Offre limitée, dernières places !"

### Ton par Canal

| Canal | Formalité | Chaleur | Expertise |
|-------|-----------|---------|-----------|
| Website | 40% | 80% | 70% |
| Newsletter | 30% | 90% | 60% |
| Social | 20% | 95% | 50% |
| Blog | 35% | 85% | 65% |

---

## 4. Éléments UI Réutilisables

### Buttons

**Variants :**
- `default` : Orange #E65100, texte blanc (CTA principal)
- `outline` : Transparent, bordure #2D2D2D
- `ghost` : Transparent, hover background
- `link` : Texte seul, underline au hover

**Sizes :**
- `sm` : 32px height
- `default` : 36px height
- `lg` : 40px height
- `icon` : 36x36px (rounded-full)

**Hover Effects :**
- Lift: `hover:-translate-y-0.5` (+2px)
- Shadow: Normal → elevated
- Color: #E65100 → #EB7433
- Duration: 200ms ease-out

### Cards

- Background: #FFFFFF
- Border: 1px #C9C9C9
- Border Radius: 8px (`rounded-lg`)
- Padding: 24px (`p-6`)
- Shadow: `0 2px 8px rgba(0,0,0,0.08)`
- Hover Shadow: `0 8px 24px rgba(0,0,0,0.12)`
- Hover Lift: `-translate-y-1` (4px)

### Forms

- Input Border: 1px #C9C9C9
- Border Radius: 6px (`rounded-md`)
- Focus Border: #5D6B4A (Vert mousse)
- Error Border: Red

### Icons

- Library: **Lucide Icons**
- Size: 24px
- Stroke: 1.5px
- Color: #2D2D2D
- Hover: #E65100

### Spacing

| Element | Mobile | Desktop |
|---------|--------|---------|
| Section padding | py-24 (96px) | py-32 (128px) |
| Container | px-6 (24px) | px-6 |
| Component gaps | gap-6, gap-8 | gap-12 |
| Card padding | p-6 (24px) | p-6 |

### Animations

**Standard Timings :**
- Hover: 200ms
- Transitions: 300-400ms
- Reveals: 500-800ms

**Types :**
- `fade-in` : Opacity + upward movement
- `fadeInUp` : Pronounced upward (20px)
- `enso-draw` : Zen circle drawing (1.5s)
- `hero-float` : Scroll indicator (3s infinite)

**Easing :** `ease-out` ou `cubic-bezier(0.25, 0.1, 0.25, 1)`

---

## 5. Style Photographique

### Direction Artistique

**Style :** "Artisan Zen Premium"
- Éclairage naturel, golden hour
- Ambiance intime, contemplative
- Sujets : Bonsais, mains au travail, textures
- Traitement : Tons chauds, dé-saturation verte légère

### Specs Techniques

- Format: WebP (web), JPEG HQ (print)
- Résolution: 2x retina, <200KB
- Ratios: 16:9 (landscape), 4:5 (portrait), 1:1 (carré)

---

## 6. Fichiers Clés

| Fichier | Contenu |
|---------|---------|
| `docs/brand/B974_BRAND_BOOK.md` | Brand Bible complète (1960 lignes) |
| `src/app/globals.css` | Variables CSS, couleurs, animations |
| `src/app/layout.tsx` | Import fonts, metadata |
| `src/components/ui/button.tsx` | Composant Button |
| `src/components/ui/card.tsx` | Composant Card |

---

## 7. Checklist Design System

Avant publication, vérifier :

- [ ] CTAs utilisent `variant="default"` (orange #E65100)
- [ ] Buttons ont `hover:-translate-y-0.5`
- [ ] Cards ont `rounded-lg` et shadow custom
- [ ] Pas de couleurs hexadécimales hardcodées
- [ ] Navigation links: `hover:text-brand-green`
- [ ] Icon buttons: `rounded-full`
- [ ] Support `prefers-reduced-motion`
- [ ] Dark mode variables définis

---

## Recommendations pour le Blog

1. **Typographie articles** : Playfair pour titres, Source Sans pour corps
2. **Cards articles** : Réutiliser composant Card existant
3. **Ton éditorial** : Sage-Artisan, pas de marketing-speak
4. **Images** : Style photographique cohérent, pas d'IA pour photos produits
5. **CTAs** : Orange B974 pour actions principales
6. **Animations** : fadeInUp pour apparition articles

---

## Acceptance Criteria Status

- [x] Palette couleurs documentée (Ivoire, Noir doux, Orange B974, Vert mousse)
- [x] Typographies identifiées (Playfair Display, Source Sans Pro)
- [x] Ton éditorial existant analysé (guides, pages)
- [x] Éléments UI réutilisables listés
