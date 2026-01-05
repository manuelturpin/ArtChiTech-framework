# Stratégie - bonsai-tracker

**Date :** 2026-01-05
**Phase :** 2 - Stratégie
**Status :** Validé

---

## Business Model

**Modèle :** Freemium avec paliers

| Tier | Bonsaïs | Prix/mois | Cible |
|------|---------|-----------|-------|
| **Gratuit** | 1-25 | 0€ | Petits collectionneurs, test |
| **Starter** | 26-100 | 19€ | Petit atelier, amateur sérieux |
| **Pro** | 101-500 | 49€ | Pépinière moyenne |
| **Business** | 501-2000 | 99€ | Grande exploitation |
| **Enterprise** | 2000+ | 199€ | Multi-sites, export |

### Features par Tier

| Feature | Gratuit | Starter | Pro | Business | Enterprise |
|---------|---------|---------|-----|----------|------------|
| Utilisateurs | 1 | 2 | 5 | 10 | Illimité |
| Sites | 1 | 1 | 2 | 5 | Illimité |
| Photos/bonsaï | 3 | 10 | 20 | 50 | Illimité |
| Dashboard analytics | ❌ | Basic | Avancé | Avancé | Custom |
| Suivi client | ❌ | ❌ | ✅ | ✅ | ✅ |
| API | ❌ | ❌ | ❌ | ✅ | ✅ |
| Support | Forum | Email | Email priorité | Téléphone | Dédié |

---

## MVP Scope

### ✅ MUST-HAVE (MVP v1.0)

| Feature | Priorité | Justification |
|---------|----------|---------------|
| Fiche bonsaï | P0 | Core - espèce, âge, photos, localisation |
| Historique soins | P0 | Core - arrosage, taille, rempotage avec dates |
| Scan QR → fiche | P0 | "Moment magique" #1 - accès terrain |
| Recherche avancée | P0 | "Moment magique" #2 - filtres espèce/âge/status |
| Gestion clients | P0 | Lien bonsaï↔client, historique ventes |
| Dashboard basique | P1 | Stats stock, alertes, KPIs essentiels |
| Multi-sites | P1 | Localisation par site, vue globale |
| Import/Export CSV | P1 | Migration depuis Excel/papier |
| Auth multi-users | P1 | Rôles: admin, employé, lecture seule |

### ❌ HORS MVP (v2.0+)

- App mobile native (PWA suffisante)
- Intégration e-commerce
- Calendrier tâches équipe
- Rappels automatiques
- IA reconnaissance espèce
- Facturation intégrée

---

## Roadmap

### Mois 1-3 : MVP + Tests Locaux

**M1: Foundation**
- Setup projet (Next.js, Supabase, Auth)
- Modèle données bonsaï/client
- CRUD fiches bonsaï
- Upload photos

**M2: Core Features**
- Historique soins (journal)
- Génération QR codes
- Scan QR → fiche (PWA)
- Recherche avancée + filtres
- Gestion clients basique

**M3: Polish + Tests Locaux**
- Dashboard stats basique
- Multi-sites (localisation)
- Import CSV (migration)
- Auth multi-users + rôles
- Tests locaux intensifs (simuler 1000+ bonsaïs)
- Validation interne OK

### Mois 4 : Site Vitrine + Beta

**M4: Go-to-Market Prep**
- Site vitrine (landing, pricing, FAQ, démo)
- Setup analytics
- Intégration Stripe
- CGV / Mentions légales
- Documentation utilisateur
- Launch beta privée (5-10 testeurs)

### Mois 5-6 : Launch Public

**M5: Beta Feedback**
- Onboarding beta-testeurs
- Analyse usage + feedback
- Fix bugs critiques

**M6: Launch Public**
- Site vitrine v2 (témoignages)
- Blog / SEO
- Launch public
- Objectif: 20 clients payants

### Mois 7-12 : Growth

- App mobile native
- Calendrier tâches équipe
- API publique
- Intégrations e-commerce
- Multi-langue
- Objectif M12: 100 clients, €10k MRR

---

## Site Vitrine

**Structure :**
```
bonsai-tracker.com/
├── / (Landing - Hero, Features, CTA)
├── /pricing
├── /features
├── /about
├── /contact
├── /blog (SEO)
└── /app → Accès SaaS
```

**Stack :** Next.js ou Astro, même domaine que l'app

---

## KPIs Cibles

| Milestone | Mois | Objectif |
|-----------|------|----------|
| MVP complet | M3 | App fonctionnelle |
| Tests locaux OK | M3 | Validation interne |
| Site vitrine | M4 | Présence web |
| Beta privée | M4 | 5-10 testeurs |
| Launch public | M6 | 20 clients payants |
| Scale | M12 | 100 clients, €10k MRR |

---

## Go/No-Go

**Decision :** ✅ GO - Passer en Phase 3 Conception

**Rationale :** Business model défini, MVP scopé, roadmap réaliste avec tests locaux et site vitrine.
