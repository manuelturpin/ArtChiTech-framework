# STRAT-004 - Stratégie Distribution Blog B974

> Date: 2026-01-11 | Phase: Strategy | Status: Complete

## Summary

Stratégie de distribution multi-canal pour le Blog B974 : Newsletter (priorité 1), Instagram (priorité 2), Facebook (priorité 3). Workflow automatisé de la publication à la distribution avec timing optimisé.

---

## 1. Canaux de Distribution Priorisés

### Vue d'Ensemble

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    CANAUX DE DISTRIBUTION B974                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PRIORITÉ 1 - MVP                                                           │
│  ┌────────────────────────────────────────────────────────────────────────┐ │
│  │  📧 NEWSLETTER                                                          │ │
│  │  • Audience captive (opt-in)                                           │ │
│  │  • Engagement direct                                                    │ │
│  │  • Fidélisation forte                                                   │ │
│  │  • Contrôle total                                                       │ │
│  └────────────────────────────────────────────────────────────────────────┘ │
│                                                                              │
│  PRIORITÉ 2 - V1.2                                                          │
│  ┌────────────────────────────────────────────────────────────────────────┐ │
│  │  📸 INSTAGRAM                                                           │ │
│  │  • Audience visuelle                                                    │ │
│  │  • Format bonsai = parfait                                             │ │
│  │  • Reach organique décent                                               │ │
│  │  • Communauté active niche                                             │ │
│  └────────────────────────────────────────────────────────────────────────┘ │
│                                                                              │
│  PRIORITÉ 3 - V1.2                                                          │
│  ┌────────────────────────────────────────────────────────────────────────┐ │
│  │  👤 FACEBOOK                                                            │ │
│  │  • Audience large                                                       │ │
│  │  • Groupes bonsai actifs                                               │ │
│  │  • Trafic referral                                                      │ │
│  │  • Reach organique faible                                              │ │
│  └────────────────────────────────────────────────────────────────────────┘ │
│                                                                              │
│  PRIORITÉ 4 - V2.0 (Optionnel)                                              │
│  ┌────────────────────────────────────────────────────────────────────────┐ │
│  │  💼 LINKEDIN                                                            │ │
│  │  • Audience professionnelle                                            │ │
│  │  • Articles longs OK                                                    │ │
│  │  • Niche limitée bonsai                                                │ │
│  └────────────────────────────────────────────────────────────────────────┘ │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Comparatif Canaux

| Canal | Reach | Engagement | Effort | ROI | Phase |
|-------|-------|------------|--------|-----|-------|
| **Newsletter** | Moyen | Très élevé | Faible | Élevé | MVP |
| **Instagram** | Élevé | Élevé | Moyen | Élevé | V1.2 |
| **Facebook** | Élevé | Moyen | Moyen | Moyen | V1.2 |
| **LinkedIn** | Faible | Moyen | Moyen | Faible | V2.0 |
| **Pinterest** | Élevé | Faible | Faible | Moyen | Future |
| **YouTube** | Très élevé | Très élevé | Très élevé | Très élevé | Future |

### Justification Priorités

#### Newsletter - Priorité 1

| Argument | Détail |
|----------|--------|
| **Contrôle total** | Pas d'algorithme, reach 100% inbox |
| **Audience qualifiée** | Opt-in = intérêt confirmé |
| **Fidélisation** | Contact régulier, relation directe |
| **Coût minimal** | Resend free tier jusqu'à 3000/mois |
| **Conversion élevée** | Email → site = meilleur taux |

#### Instagram - Priorité 2

| Argument | Détail |
|----------|--------|
| **Format idéal** | Bonsai = très visuel, photos de qualité |
| **Audience présente** | Communauté bonsai active (#bonsai 14M posts) |
| **Engagement** | Likes, comments, saves sur contenu visuel |
| **Stories** | Behind-the-scenes naturel |
| **Discovery** | Hashtags, Explore pour acquisition |

#### Facebook - Priorité 3

| Argument | Détail |
|----------|--------|
| **Reach large** | 2.9B users, audience large |
| **Groupes** | Groupes bonsai FR actifs |
| **Referral** | Trafic vers site via liens |
| **Partage** | Contenu partageable facilement |
| **Limite** | Reach organique très faible (~2%) |

---

## 2. Workflow Publication → Distribution

### Diagramme de Flux

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW DISTRIBUTION                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────┐                                                            │
│  │  CRÉATION   │                                                            │
│  │  (Ralph)    │                                                            │
│  └──────┬──────┘                                                            │
│         │                                                                    │
│         │ Génère simultanément:                                             │
│         │ • Article (MDX)                                                    │
│         │ • Email newsletter                                                 │
│         │ • Caption Instagram                                                │
│         │ • Post Facebook                                                    │
│         │                                                                    │
│         ▼                                                                    │
│  ┌─────────────┐                                                            │
│  │   PREVIEW   │                                                            │
│  │  (Back-off) │                                                            │
│  └──────┬──────┘                                                            │
│         │                                                                    │
│         │ Manuel review:                                                     │
│         │ • Article content                                                  │
│         │ • Email content                                                    │
│         │ • Social posts                                                     │
│         │ • Images selection                                                 │
│         │                                                                    │
│         ▼                                                                    │
│  ┌─────────────┐     ┌─────────────────────────────────────────────┐        │
│  │  APPROVAL   │────>│           PUBLICATION TRIGGER               │        │
│  │             │     └──────────────────┬──────────────────────────┘        │
│  └─────────────┘                        │                                    │
│                                         │                                    │
│                    ┌────────────────────┼────────────────────┐              │
│                    │                    │                    │              │
│                    ▼                    ▼                    ▼              │
│             ┌───────────┐        ┌───────────┐        ┌───────────┐        │
│             │   BLOG    │        │NEWSLETTER │        │  SOCIAL   │        │
│             │ Publish   │        │   Send    │        │   Post    │        │
│             └─────┬─────┘        └─────┬─────┘        └─────┬─────┘        │
│                   │                    │                    │              │
│                   │                    │                    │              │
│                   ▼                    ▼                    ▼              │
│             ┌───────────┐        ┌───────────┐        ┌───────────┐        │
│             │  LIVE on  │        │  Inbox    │        │ Instagram │        │
│             │   /blog   │        │ Subscribers│       │ + Facebook│        │
│             └───────────┘        └───────────┘        └───────────┘        │
│                                                                              │
│  TIMING                                                                      │
│  ────────────────────────────────────────────────────────────────────────── │
│  T+0:  Article live on blog                                                 │
│  T+5m: Newsletter sent                                                       │
│  T+1h: Instagram post                                                        │
│  T+2h: Facebook post                                                         │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Étapes Détaillées

#### Phase 1: Création (Ralph)

```typescript
interface DistributionContent {
  article: {
    mdx: string;
    featuredImage: string;
    metadata: SEOMetadata;
  };
  newsletter: {
    subject: string;
    preheader: string;
    body: string;
    cta: { text: string; url: string };
  };
  instagram: {
    image: string;         // 1080x1080 ou 1080x1350
    caption: string;       // max 2200 chars
    hashtags: string[];    // max 30
    altText: string;
  };
  facebook: {
    message: string;
    link: string;
    image?: string;
  };
  linkedin?: {
    text: string;
    link: string;
  };
}
```

#### Phase 2: Preview & Edit

| Content | Editable | Preview |
|---------|----------|---------|
| Article | ✅ Full edit | Rendu final |
| Newsletter | ✅ Subject, body | Email preview |
| Instagram | ✅ Caption, hashtags | Visual preview |
| Facebook | ✅ Message | Link preview |

#### Phase 3: Approval

- Manuel valide chaque composant
- Possibilité de régénérer individuellement
- Scheduling optionnel (V1.1+)

#### Phase 4: Distribution Trigger

```typescript
async function distributeContent(postId: string): Promise<void> {
  const post = await getPost(postId);

  // 1. Publish article (immediate)
  await publishArticle(post);

  // 2. Send newsletter (T+5min)
  await scheduleNewsletter(post, { delay: 5 * 60 * 1000 });

  // 3. Post Instagram (T+1h)
  await scheduleInstagram(post, { delay: 60 * 60 * 1000 });

  // 4. Post Facebook (T+2h)
  await scheduleFacebook(post, { delay: 2 * 60 * 60 * 1000 });
}
```

---

## 3. Outils & APIs Sélectionnés

### Email: Resend

| Aspect | Détail |
|--------|--------|
| **Service** | Resend |
| **Pricing** | Free tier: 3000 emails/mois, puis $20/mois |
| **Features** | React Email templates, webhooks, analytics |
| **Domain** | newsletter@b974.fr |
| **Deliverability** | SPF, DKIM, DMARC configurés |

```typescript
// Example: Send newsletter
import { Resend } from 'resend';
import { NewsletterTemplate } from '@/emails/newsletter';

const resend = new Resend(process.env.RESEND_API_KEY);

await resend.emails.send({
  from: 'Manuel <newsletter@b974.fr>',
  to: subscribers.map(s => s.email),
  subject: `Nouveau : ${article.title}`,
  react: NewsletterTemplate({ article, content }),
});
```

### Social: Meta Graph API

| Aspect | Détail |
|--------|--------|
| **API** | Meta Graph API v18.0 |
| **Instagram** | Instagram Graph API (Business account required) |
| **Facebook** | Pages API |
| **Auth** | Long-lived Page Access Token (60 days) |
| **Rate Limits** | 200 calls/hour (Instagram), 50 posts/day |

```typescript
// Instagram posting
const containerId = await fetch(
  `https://graph.facebook.com/v18.0/${IG_USER_ID}/media`,
  {
    method: 'POST',
    body: JSON.stringify({
      image_url: imageUrl,
      caption: caption,
      access_token: PAGE_TOKEN,
    }),
  }
);

await fetch(
  `https://graph.facebook.com/v18.0/${IG_USER_ID}/media_publish`,
  {
    method: 'POST',
    body: JSON.stringify({
      creation_id: containerId,
      access_token: PAGE_TOKEN,
    }),
  }
);
```

### LinkedIn: LinkedIn Marketing API (Optionnel)

| Aspect | Détail |
|--------|--------|
| **API** | LinkedIn Marketing API |
| **Permissions** | w_member_social |
| **Use case** | Articles professionnels uniquement |
| **Priority** | V2.0 |

### Récapitulatif Outils

| Canal | Outil | API | Cost |
|-------|-------|-----|------|
| Newsletter | Resend | REST | Free → $20/mo |
| Instagram | Meta Graph | REST | Free |
| Facebook | Meta Graph | REST | Free |
| LinkedIn | LinkedIn API | REST | Free |
| Images | Cloudinary | REST | Free tier |

---

## 4. Fréquence et Timing Recommandés

### Fréquence Publication

| Type | Fréquence | Justification |
|------|-----------|---------------|
| **Articles Blog** | 2-3/mois | Qualité > quantité, niche |
| **Newsletter** | 2-3/mois | 1 par article, pas de spam |
| **Instagram** | 3-4/semaine | Mixte: articles + stories |
| **Facebook** | 2-3/semaine | Articles + contenu natif |

### Calendrier Type Mensuel

```
SEMAINE 1
├── Lundi: Préparation article
├── Mardi: Review & ajustements
├── Mercredi: Publication Article 1
│   ├── T+0: Blog live
│   ├── T+5m: Newsletter
│   ├── T+1h: Instagram
│   └── T+2h: Facebook
├── Vendredi: Story Instagram (BTS)
└── Samedi: Post engagement (question)

SEMAINE 2
├── Lundi: Story Instagram
├── Mercredi: Post FB (tip rapide)
├── Vendredi: Publication Article 2
└── Samedi: Story weekend

SEMAINE 3
├── Lundi: Préparation article
├── Mercredi: Publication Article 3
├── Vendredi: Reels/Carousel Instagram
└── Samedi: Engagement communauté

SEMAINE 4
├── Lundi: Story Instagram
├── Mercredi: Post FB récap mensuel
├── Vendredi: Story "week-end bonsai"
└── Dimanche: Préparation mois suivant
```

### Timing Optimal par Canal

| Canal | Jour | Heure | Justification |
|-------|------|-------|---------------|
| **Blog** | Mer, Ven | 10h | Mid-week, matinée active |
| **Newsletter** | Mer, Ven | 10h05 | Juste après article |
| **Instagram** | Mer, Ven, Sam | 11h, 19h | Pause déjeuner, soir |
| **Facebook** | Mer, Ven | 12h, 14h | Pause déjeuner |
| **LinkedIn** | Mar, Jeu | 9h, 17h | Heures bureau |

### Timing Publication Article

```
JOUR J (Publication)
│
├── 10:00  Article live sur /blog
│          └── SEO indexation commence
│
├── 10:05  Newsletter envoyée
│          └── Premiers clics immédiats
│
├── 11:00  Post Instagram
│          └── Peak engagement heure déjeuner
│
├── 12:00  Post Facebook
│          └── Partage possible dans groupes
│
└── 14:00  Monitoring engagement
           └── Réponses aux commentaires
```

### Considérations Saisonnières

| Saison | Ajustement | Contenu |
|--------|------------|---------|
| **Printemps** | +1 article/mois | Rempotage, taille |
| **Été** | Normal | Arrosage, protection |
| **Automne** | Normal | Préparation hiver |
| **Hiver** | +1 article (Japon) | Voyages, indoor |

---

## 5. Contenu par Canal

### Newsletter

```markdown
# Template Newsletter

SUBJECT: Nouveau : [Titre Article] | B974

PREHEADER: [Accroche 50 chars]

---

[Logo B974]

Bonjour,

Un nouvel article est disponible sur le Journal du Bonsai.

┌─────────────────────────────────────┐
│ [Image Featured]                    │
│                                     │
│ [Titre Article]                     │
│                                     │
│ [Excerpt 2-3 phrases]               │
│                                     │
│ [Lire l'article →]                  │
└─────────────────────────────────────┘

À bientôt,
Manuel

---
[Se désinscrire] | B974, La Réunion
```

**Métriques cibles**:
- Taux ouverture: 35-40%
- Taux clic: 5-8%
- Taux désabonnement: < 0.5%

### Instagram

```markdown
# Format Post Instagram

IMAGE
• 1080x1080 (carré) ou 1080x1350 (portrait)
• Image de l'article, qualité élevée
• Style photographique B974 (golden hour, texture)

CAPTION (max 2200 chars)
────────────────────────────
[Hook accrocheur - 1ère ligne visible]

[Corps du message - 3-5 lignes]
[Ton Sage-Artisan, pas marketing]

[Call-to-action vers bio/lien]
.
.
.
[Hashtags - bloc séparé]
────────────────────────────

HASHTAGS (30 max, optimisés)
• Niche: #bonsai #bonsaiart #bonsaitree
• Français: #bonsaifrance #bonsailover
• Contenu: #[thème] #jardinage
• Marque: #b974 #bonsai974

ALT TEXT
• Description image pour accessibilité
```

**Métriques cibles**:
- Engagement rate: 3-5%
- Saves: > likes (indicateur qualité)
- Reach: 2-3x followers

### Facebook

```markdown
# Format Post Facebook

MESSAGE (max 500 chars recommandé)
────────────────────────────
[Accroche - question ou hook]

[2-3 phrases contexte]

[CTA: Lisez l'article complet ↓]
────────────────────────────

LINK
• URL article blog
• Preview auto (Open Graph)

IMAGE (optionnel)
• Si link preview insuffisant
• 1200x630 format Facebook
```

**Métriques cibles**:
- Engagement rate: 1-2%
- Clicks: priorité #1
- Partages: indicateur viralité

---

## 6. Automatisation

### Niveau 1: MVP (Manuel)

| Action | Automation | Effort Manuel |
|--------|------------|---------------|
| Génération contenu | ✅ Ralph | Review only |
| Publication blog | ✅ CMS | 1 click |
| Newsletter | ✅ Auto-trigger | None |
| Instagram | ❌ Copy-paste | 5 min |
| Facebook | ❌ Copy-paste | 3 min |

### Niveau 2: V1.2 (Semi-auto)

| Action | Automation | Effort Manuel |
|--------|------------|---------------|
| Génération contenu | ✅ Ralph | Review only |
| Publication blog | ✅ CMS | 1 click |
| Newsletter | ✅ Auto | None |
| Instagram | ✅ API | Approve |
| Facebook | ✅ API | Approve |

### Niveau 3: V2.0 (Full-auto)

| Action | Automation | Effort Manuel |
|--------|------------|---------------|
| Génération contenu | ✅ Ralph | Review |
| Publication blog | ✅ Scheduled | None |
| Newsletter | ✅ Scheduled | None |
| Instagram | ✅ Scheduled | None |
| Facebook | ✅ Scheduled | None |
| Analytics | ✅ Dashboard | Review |

---

## 7. KPIs Distribution

### Métriques par Canal

| Canal | KPI Principal | KPI Secondaire | Cible 6 mois |
|-------|---------------|----------------|--------------|
| **Newsletter** | Taux ouverture | Taux clic | 35% / 5% |
| **Instagram** | Engagement rate | Followers | 3% / +500 |
| **Facebook** | Clicks | Partages | 50/post / 5/post |
| **Blog** | Trafic referral | Temps page | 500/mois / 3min |

### Dashboard Tracking

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    DISTRIBUTION METRICS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  NEWSLETTER                         INSTAGRAM                                │
│  ───────────                        ─────────                                │
│  Subscribers: 247                   Followers: 1,245                         │
│  Open rate: 38%  ▲                  Engagement: 4.2%  ▲                      │
│  Click rate: 6%  ▲                  Avg. likes: 89                           │
│  Last 30 days: +45 subs             Avg. saves: 23                           │
│                                                                              │
│  FACEBOOK                           TRAFFIC SOURCES                          │
│  ────────                           ───────────────                          │
│  Page likes: 892                    Direct: 35%                              │
│  Avg. reach: 450                    Organic: 40%                             │
│  Avg. clicks: 34                    Newsletter: 15%                          │
│  Engagement: 1.8%                   Social: 10%                              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 8. Bonnes Pratiques

### Do's

| Canal | Best Practices |
|-------|----------------|
| **Newsletter** | Subject court (<50 chars), preheader optimisé, mobile-first |
| **Instagram** | Visuels de qualité, caption engageante, hashtags recherchés |
| **Facebook** | Questions ouvertes, lien clair, timing optimal |
| **All** | Cohérence ton B974, pas de spam, valeur d'abord |

### Don'ts

| Canal | À Éviter |
|-------|----------|
| **Newsletter** | Spam quotidien, clickbait, no unsubscribe |
| **Instagram** | Hashtags génériques, légendes vides, achat followers |
| **Facebook** | Posts sans valeur, engagement baiting |
| **All** | Ton marketing-speak, urgence artificielle, inconsistance |

### Checklist Publication

```markdown
## Pre-Publication
- [ ] Article relu et validé
- [ ] Images optimisées (Cloudinary)
- [ ] SEO metadata complètes
- [ ] Newsletter content reviewed
- [ ] Social posts reviewed

## Publication
- [ ] Article publié sur /blog
- [ ] Newsletter envoyée (vérifier inbox)
- [ ] Instagram posté (vérifier feed)
- [ ] Facebook posté (vérifier page)

## Post-Publication (J+1)
- [ ] Répondre aux commentaires
- [ ] Vérifier métriques email
- [ ] Noter engagement social
- [ ] Partager dans groupes FB
```

---

## 9. Évolutions Futures

### V1.2 Additions

| Feature | Description |
|---------|-------------|
| **Auto-scheduling** | Programmer posts à l'avance |
| **A/B Testing** | Tester sujets newsletter |
| **Carousel Instagram** | Multi-images automatique |
| **Stories Templates** | Stories automatiques |

### V2.0 Additions

| Feature | Description |
|---------|-------------|
| **YouTube integration** | Extraits vidéo automatiques |
| **Pinterest** | Pins automatiques |
| **Thread/Bluesky** | Micro-blogging |
| **Podcast** | Audio articles |

---

## Acceptance Criteria Status

- [x] Canaux de distribution priorisés (Newsletter > Instagram > Facebook > LinkedIn)
- [x] Workflow publication → distribution documenté (diagramme + étapes)
- [x] Outils/APIs sélectionnés (Resend, Meta Graph API, Cloudinary)
- [x] Fréquence et timing recommandés (calendrier + timing optimal)
