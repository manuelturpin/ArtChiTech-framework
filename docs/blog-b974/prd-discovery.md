# PRD : Blog B974 - Phase Discovery

> **Type** : Discovery PRD
> **Date** : 2026-01-11
> **Feature** : Section Blog pour b974.fr
> **Target Repo** : /Users/manuelturpin/Desktop/bonsai974/VPS-b974.fr

---

## Vision

Ajouter une section blog/contenu au site e-commerce B974 (bonsai premium) pour renforcer l'autorité de la marque, améliorer le SEO et fidéliser les clients.

## Objectifs Phase Discovery

1. **Comprendre** l'architecture technique existante du site
2. **Définir** les objectifs business du blog
3. **Identifier** les personas et types de contenus
4. **Évaluer** les options techniques d'intégration

---

## User Stories

### DISC-001 : Audit Architecture Site Existant

**En tant que** framework ACT,
**Je veux** comprendre l'architecture du site VPS-b974.fr,
**Afin de** identifier les points d'intégration pour le blog.

#### Critères d'Acceptation
- [ ] Structure Next.js documentée (App Router, pages, composants)
- [ ] Patterns de code existants identifiés (styling, state, data fetching)
- [ ] Points d'intégration blog listés (navigation, footer, routes)
- [ ] Dépendances techniques notées (versions, packages clés)

**Priorité** : 1
**Livrable** : `docs/blog-b974/discovery/01-architecture-audit.md`

---

### DISC-002 : Analyse Brand Guidelines B974

**En tant que** framework ACT,
**Je veux** comprendre l'identité visuelle B974,
**Afin de** garantir la cohérence du blog avec la marque.

#### Critères d'Acceptation
- [ ] Palette couleurs documentée (Ivoire, Noir doux, Orange B974, Vert mousse)
- [ ] Typographies identifiées (Playfair Display, Source Sans Pro)
- [ ] Ton éditorial existant analysé (guides, pages)
- [ ] Éléments UI réutilisables listés

**Priorité** : 1
**Livrable** : `docs/blog-b974/discovery/02-brand-analysis.md`

---

### DISC-003 : Définir Objectifs Business Blog

**En tant que** propriétaire B974,
**Je veux** clarifier les objectifs du blog,
**Afin de** prioriser les fonctionnalités et contenus.

#### Critères d'Acceptation
- [ ] Objectifs primaires définis (SEO, autorité, fidélisation, support produit)
- [ ] KPIs proposés (trafic, engagement, conversion)
- [ ] Alignement avec vision B974 "L'art du temps" documenté
- [ ] ROI attendu esquissé

**Priorité** : 2
**Livrable** : `docs/blog-b974/discovery/03-business-objectives.md`

---

### DISC-004 : Identifier Personas et Contenus

**En tant que** stratège contenu,
**Je veux** définir les personas cibles du blog,
**Afin de** créer du contenu pertinent.

#### Critères d'Acceptation
- [ ] 3 personas minimum définis avec caractéristiques
- [ ] Types de contenus mappés par persona
- [ ] Sujets prioritaires identifiés (bonsai débutant, espèces, entretien, Réunion)
- [ ] Calendrier éditorial de base esquissé (fréquence, formats)

**Priorité** : 2
**Livrable** : `docs/blog-b974/discovery/04-personas-content.md`

---

## Livrables Phase Discovery

| Fichier | Description |
|---------|-------------|
| `01-architecture-audit.md` | Audit technique site existant |
| `02-brand-analysis.md` | Analyse identité visuelle B974 |
| `03-business-objectives.md` | Objectifs business et KPIs |
| `04-personas-content.md` | Personas et stratégie contenu |
| `05-discovery-summary.md` | Synthèse et recommandations |

---

## Critères Go/No-Go

Pour passer à la Phase 2 (Strategy) :

- [ ] Architecture site documentée et comprise
- [ ] Objectifs business validés par utilisateur
- [ ] Personas définis et pertinents
- [ ] Aucun bloqueur technique identifié

---

*PRD Discovery créé le 2026-01-11*
