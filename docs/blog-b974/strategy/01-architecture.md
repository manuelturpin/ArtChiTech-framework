# STRAT-001 - Architecture Technique Blog B974

> Date: 2026-01-11 | Phase: Strategy | Status: Complete

## Summary

Architecture technique pour le Blog B974 AI-Assisted, basée sur le stack existant (Next.js 16, PostgreSQL, Prisma) avec intégration Ralph pour génération de contenu.

---

## 1. Stack Technique

### Frontend (Blog Public)

| Technologie | Version | Justification |
|-------------|---------|---------------|
| **Next.js** | 16.1.1 | Stack existant, App Router, SSR/SSG |
| **React** | 19.2.0 | Stack existant |
| **TypeScript** | 5.x | Type safety, stack existant |
| **Tailwind CSS** | 4.x | Design system B974 existant |
| **shadcn/ui** | latest | Composants UI existants |
| **Framer Motion** | 12.x | Animations Brand (fadeInUp) |

### Backend (API & CMS)

| Technologie | Version | Justification |
|-------------|---------|---------------|
| **Next.js API Routes** | 16.1.1 | Intégré, serverless |
| **Prisma ORM** | 7.0.1 | Stack existant, type-safe |
| **PostgreSQL** | 15 | Base existante, JSONB pour metadata |
| **Redis** | ioredis 5.8.2 | Cache existant |

### Back-office (Dashboard)

| Technologie | Version | Justification |
|-------------|---------|---------------|
| **Next.js** | 14.2.5 | Dashboard 2026 existant |
| **gray-matter** | 4.0.3 | Parsing frontmatter (déjà installé) |
| **react-markdown** | 10.1.0 | Rendu markdown (déjà installé) |

### AI & Content Generation

| Service | Usage | Justification |
|---------|-------|---------------|
| **OpenAI Whisper** | Transcription audio | API mature, qualité FR |
| **Claude API** | Génération contenu (Ralph) | Qualité supérieure, contexte long |
| **Cloudinary** | Optimisation images | CDN, transformations auto |

### Distribution

| Service | Usage | Justification |
|---------|-------|---------------|
| **Resend** | Newsletter | API moderne, deliverability |
| **Meta Graph API** | Instagram/Facebook | API officielle |
| **LinkedIn API** | Posts professionnels | Optionnel, audience secondaire |

---

## 2. Architecture Système

### Diagramme Global

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           BLOG B974 ARCHITECTURE                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐        │
│  │   CAPTURE       │     │   BACK-OFFICE   │     │   BLOG PUBLIC   │        │
│  │   (Mobile)      │     │   (Dashboard)   │     │   (Website)     │        │
│  └────────┬────────┘     └────────┬────────┘     └────────┬────────┘        │
│           │                       │                       │                  │
│           │ Audio + Photos        │ Manage                │ Read             │
│           │                       │                       │                  │
│           ▼                       ▼                       ▼                  │
│  ┌────────────────────────────────────────────────────────────────┐         │
│  │                         NEXT.JS API                            │         │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐       │         │
│  │  │ /upload  │  │ /articles│  │ /generate│  │ /publish │       │         │
│  │  └──────────┘  └──────────┘  └──────────┘  └──────────┘       │         │
│  └────────────────────────────────────────────────────────────────┘         │
│           │              │              │              │                     │
│           ▼              ▼              ▼              ▼                     │
│  ┌─────────────────────────────────────────────────────────────────┐        │
│  │                        SERVICES LAYER                           │        │
│  │                                                                  │        │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │        │
│  │  │ MediaService │  │ RalphService │  │ DistroService│           │        │
│  │  │ - Upload     │  │ - Transcribe │  │ - Newsletter │           │        │
│  │  │ - Optimize   │  │ - Generate   │  │ - Social     │           │        │
│  │  │ - Store      │  │ - Format     │  │ - Schedule   │           │        │
│  │  └──────────────┘  └──────────────┘  └──────────────┘           │        │
│  └─────────────────────────────────────────────────────────────────┘        │
│           │              │              │                                    │
│           ▼              ▼              ▼                                    │
│  ┌─────────────────────────────────────────────────────────────────┐        │
│  │                      EXTERNAL SERVICES                          │        │
│  │                                                                  │        │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐        │        │
│  │  │Cloudinary│  │ Whisper  │  │  Claude  │  │  Resend  │        │        │
│  │  └──────────┘  └──────────┘  └──────────┘  └──────────┘        │        │
│  │                                                                  │        │
│  │  ┌──────────┐  ┌──────────┐                                     │        │
│  │  │Meta Graph│  │ LinkedIn │                                     │        │
│  │  └──────────┘  └──────────┘                                     │        │
│  └─────────────────────────────────────────────────────────────────┘        │
│           │                                                                  │
│           ▼                                                                  │
│  ┌─────────────────────────────────────────────────────────────────┐        │
│  │                         DATA LAYER                              │        │
│  │                                                                  │        │
│  │  ┌────────────────────┐     ┌────────────────────┐              │        │
│  │  │    PostgreSQL      │     │      Redis         │              │        │
│  │  │  - BlogPost        │     │  - Cache articles  │              │        │
│  │  │  - BlogSeries      │     │  - Rate limiting   │              │        │
│  │  │  - Subscriber      │     │  - Queue jobs      │              │        │
│  │  │  - Distribution    │     │                    │              │        │
│  │  └────────────────────┘     └────────────────────┘              │        │
│  └─────────────────────────────────────────────────────────────────┘        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Diagramme Composants Frontend

```
┌─────────────────────────────────────────────────────────────────┐
│                    BLOG PUBLIC (Next.js App)                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  app/blog/                                                       │
│  ├── page.tsx              # Liste articles (SSG + ISR)         │
│  ├── [slug]/               # Article detail                      │
│  │   └── page.tsx          # Article page (SSG)                 │
│  ├── series/               # Séries thématiques                 │
│  │   └── [series]/         # Articles par série                 │
│  │       └── page.tsx                                           │
│  └── api/                  # API Routes                         │
│      ├── articles/         # CRUD articles                      │
│      ├── subscribe/        # Newsletter subscription            │
│      └── generate/         # Ralph generation (back-office)     │
│                                                                  │
│  components/blog/                                                │
│  ├── ArticleCard.tsx       # Card preview article               │
│  ├── ArticleContent.tsx    # Rendu MDX article                  │
│  ├── ArticleHeader.tsx     # Titre, meta, auteur                │
│  ├── ArticleSidebar.tsx    # TOC, related articles              │
│  ├── NewsletterForm.tsx    # Inscription newsletter             │
│  ├── SeriesNav.tsx         # Navigation séries                  │
│  └── ShareButtons.tsx      # Partage social                     │
│                                                                  │
│  lib/blog/                                                       │
│  ├── articles.ts           # Fetch articles from Prisma         │
│  ├── mdx.ts                # MDX processing                     │
│  └── seo.ts                # SEO metadata generation            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 3. Modèle de Données (Prisma)

### Schema

```prisma
// prisma/schema.prisma - Extension pour Blog

model BlogPost {
  id            String    @id @default(cuid())
  slug          String    @unique
  title         String
  excerpt       String    @db.Text
  content       String    @db.Text  // MDX content
  featuredImage String?

  // Metadata
  status        BlogStatus @default(DRAFT)
  publishedAt   DateTime?
  scheduledAt   DateTime?

  // SEO
  metaTitle     String?
  metaDescription String? @db.Text
  keywords      String[]

  // Relations
  seriesId      String?
  series        BlogSeries? @relation(fields: [seriesId], references: [id])
  authorId      String
  author        User       @relation(fields: [authorId], references: [id])

  // AI Generation
  sourceAudioUrl   String?
  sourcePhotos     String[]
  generationParams Json?   // Ralph parameters

  // Distribution
  distributions Distribution[]

  // Timestamps
  createdAt     DateTime  @default(now())
  updatedAt     DateTime  @updatedAt

  @@index([status, publishedAt])
  @@index([seriesId])
}

model BlogSeries {
  id          String     @id @default(cuid())
  slug        String     @unique
  title       String
  description String?    @db.Text
  coverImage  String?
  posts       BlogPost[]

  createdAt   DateTime   @default(now())
  updatedAt   DateTime   @updatedAt
}

model Subscriber {
  id          String   @id @default(cuid())
  email       String   @unique
  firstName   String?
  status      SubscriberStatus @default(PENDING)
  confirmedAt DateTime?

  // Preferences
  preferences Json?    // { frequency: 'weekly', topics: ['technique'] }

  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
}

model Distribution {
  id          String   @id @default(cuid())
  postId      String
  post        BlogPost @relation(fields: [postId], references: [id])

  channel     DistributionChannel
  status      DistributionStatus @default(PENDING)

  // Content
  content     String   @db.Text  // Generated content for channel
  mediaUrls   String[]

  // Scheduling
  scheduledAt DateTime?
  publishedAt DateTime?
  externalId  String?  // ID from external platform

  // Analytics
  impressions Int?
  engagements Int?

  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  @@index([postId, channel])
}

enum BlogStatus {
  DRAFT
  REVIEW
  SCHEDULED
  PUBLISHED
  ARCHIVED
}

enum SubscriberStatus {
  PENDING
  ACTIVE
  UNSUBSCRIBED
}

enum DistributionChannel {
  NEWSLETTER
  INSTAGRAM
  FACEBOOK
  LINKEDIN
}

enum DistributionStatus {
  PENDING
  SCHEDULED
  PUBLISHED
  FAILED
}
```

---

## 4. Workflow Ralph (Génération Contenu)

### Diagramme de Séquence

```
┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐
│  User   │     │Dashboard│     │   API   │     │ Ralph   │     │   DB    │
└────┬────┘     └────┬────┘     └────┬────┘     └────┬────┘     └────┬────┘
     │               │               │               │               │
     │  1. Upload    │               │               │               │
     │  Audio+Photos │               │               │               │
     │──────────────>│               │               │               │
     │               │               │               │               │
     │               │ 2. POST       │               │               │
     │               │ /api/upload   │               │               │
     │               │──────────────>│               │               │
     │               │               │               │               │
     │               │               │ 3. Upload to  │               │
     │               │               │ Cloudinary    │               │
     │               │               │──────────────>│               │
     │               │               │               │               │
     │               │               │ 4. Save draft │               │
     │               │               │──────────────────────────────>│
     │               │               │               │               │
     │               │<──────────────│               │               │
     │               │ 5. Draft ID   │               │               │
     │               │               │               │               │
     │  6. Configure │               │               │               │
     │  & Generate   │               │               │               │
     │──────────────>│               │               │               │
     │               │               │               │               │
     │               │ 7. POST       │               │               │
     │               │ /api/generate │               │               │
     │               │──────────────>│               │               │
     │               │               │               │               │
     │               │               │ 8. Transcribe │               │
     │               │               │ (Whisper)     │               │
     │               │               │──────────────>│               │
     │               │               │<──────────────│               │
     │               │               │               │               │
     │               │               │ 9. Generate   │               │
     │               │               │ Article+Posts │               │
     │               │               │ (Claude)      │               │
     │               │               │──────────────>│               │
     │               │               │<──────────────│               │
     │               │               │               │               │
     │               │               │ 10. Save      │               │
     │               │               │ generated     │               │
     │               │               │──────────────────────────────>│
     │               │               │               │               │
     │               │<──────────────│               │               │
     │<──────────────│               │               │               │
     │ 11. Preview   │               │               │               │
     │               │               │               │               │
     │ 12. Approve   │               │               │               │
     │──────────────>│               │               │               │
     │               │ 13. POST      │               │               │
     │               │ /api/publish  │               │               │
     │               │──────────────>│               │               │
     │               │               │               │               │
     │               │               │ 14. Update    │               │
     │               │               │ status        │               │
     │               │               │──────────────────────────────>│
     │               │               │               │               │
     │               │               │ 15. Trigger   │               │
     │               │               │ distribution  │               │
     │               │               │──────────────>│               │
     │               │               │               │               │
```

### Ralph Generation Parameters

```typescript
interface RalphGenerationParams {
  // Content
  tone: 'casual' | 'professional' | 'expert';
  targetLength: 'short' | 'medium' | 'long'; // 800 | 1500 | 2400 words
  style: 'tutorial' | 'storytelling' | 'guide' | 'news';

  // Series
  seriesId?: string;
  seriesContext?: string;

  // SEO
  primaryKeyword: string;
  secondaryKeywords: string[];
  targetPersona: 'beginner' | 'intermediate' | 'expert';

  // Distribution
  generateNewsletter: boolean;
  generateInstagram: boolean;
  generateFacebook: boolean;
  generateLinkedIn: boolean;

  // Brand Guidelines (auto-loaded)
  brandTone: 'sage-artisan';
  prohibitedTerms: string[];
  preferredVocabulary: Record<string, string>;
}
```

### Ralph Prompt Structure

```markdown
# System Prompt

Tu es Ralph, expert en création de contenu pour B974,
marque premium de bonsai. Tu génères des articles
publication-ready, pas des brouillons.

## Brand Guidelines
- Ton: Sage-Artisan (55% Sage, 45% Creator)
- Expert mais humble
- Mentor patient, non condescendant
- Bienveillant et authentique

## Vocabulaire
- Formation → Accompagnement
- Enseigner → Transmettre
- Client → Passionné
- Prix → Investissement

## Termes Interdits
- Superlatifs ("le meilleur", "unique")
- Urgence artificielle
- Marketing-speak

---

# User Prompt

## Input
- Transcription audio: {transcription}
- Photos: {photo_descriptions}
- Parameters: {generation_params}

## Outputs Required
1. Article complet (MDX)
2. Newsletter email
3. Post Instagram (caption + hashtags)
4. Post Facebook (accroche + lien)
{if linkedin: 5. Post LinkedIn}

## Format Article
{standard_article_format}
```

---

## 5. Intégrations Tierces

### 5.1 OpenAI Whisper (Transcription)

| Aspect | Valeur |
|--------|--------|
| **API** | OpenAI Whisper API |
| **Model** | whisper-1 |
| **Language** | fr (French) |
| **Format** | mp3, m4a, wav |
| **Max size** | 25 MB |
| **Cost** | $0.006/minute |

```typescript
// services/transcription.ts
import OpenAI from 'openai';

const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

export async function transcribeAudio(audioUrl: string): Promise<string> {
  const response = await fetch(audioUrl);
  const audioBlob = await response.blob();

  const transcription = await openai.audio.transcriptions.create({
    file: audioBlob,
    model: 'whisper-1',
    language: 'fr',
    response_format: 'text',
  });

  return transcription;
}
```

### 5.2 Claude API (Génération Ralph)

| Aspect | Valeur |
|--------|--------|
| **API** | Anthropic Claude API |
| **Model** | claude-3-opus-4-1-20250414 |
| **Context** | 200k tokens |
| **Use case** | Article + Social posts |
| **Cost** | ~$0.075 per article |

```typescript
// services/ralph.ts
import Anthropic from '@anthropic-ai/sdk';

const anthropic = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY });

export async function generateContent(
  transcription: string,
  photos: string[],
  params: RalphGenerationParams
): Promise<GeneratedContent> {
  const systemPrompt = buildSystemPrompt(params);
  const userPrompt = buildUserPrompt(transcription, photos, params);

  const response = await anthropic.messages.create({
    model: 'claude-3-opus-4-1-20250414',
    max_tokens: 8000,
    system: systemPrompt,
    messages: [{ role: 'user', content: userPrompt }],
  });

  return parseGeneratedContent(response.content);
}
```

### 5.3 Cloudinary (Images)

| Aspect | Valeur |
|--------|--------|
| **API** | Cloudinary Upload + Transform |
| **Formats** | webp, avif auto |
| **Optimization** | Auto quality, lazy loading |
| **Transformations** | Resize, crop, format |

```typescript
// services/media.ts
import { v2 as cloudinary } from 'cloudinary';

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

export async function uploadImage(file: File): Promise<string> {
  const result = await cloudinary.uploader.upload(file, {
    folder: 'blog-b974',
    transformation: [
      { quality: 'auto', fetch_format: 'auto' },
      { width: 1200, crop: 'limit' },
    ],
  });

  return result.secure_url;
}
```

### 5.4 Resend (Newsletter)

| Aspect | Valeur |
|--------|--------|
| **API** | Resend API |
| **Domain** | newsletter.b974.fr |
| **Templates** | React Email |
| **Features** | Double opt-in, tracking |

```typescript
// services/newsletter.ts
import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

export async function sendNewsletter(
  subscribers: Subscriber[],
  article: BlogPost,
  content: string
): Promise<void> {
  await resend.emails.send({
    from: 'Manuel <newsletter@b974.fr>',
    to: subscribers.map(s => s.email),
    subject: `Nouveau : ${article.title}`,
    react: NewsletterTemplate({ article, content }),
  });
}
```

### 5.5 Meta Graph API (Instagram/Facebook)

| Aspect | Valeur |
|--------|--------|
| **API** | Meta Graph API v18.0 |
| **Permissions** | pages_manage_posts, instagram_basic |
| **Auth** | Long-lived page token |
| **Rate limits** | 200 calls/hour |

```typescript
// services/social.ts
export async function postToInstagram(
  imageUrl: string,
  caption: string
): Promise<string> {
  // Step 1: Create media container
  const containerId = await createMediaContainer(imageUrl, caption);

  // Step 2: Publish container
  const postId = await publishContainer(containerId);

  return postId;
}

export async function postToFacebook(
  message: string,
  link: string,
  imageUrl?: string
): Promise<string> {
  const response = await fetch(
    `https://graph.facebook.com/v18.0/${PAGE_ID}/feed`,
    {
      method: 'POST',
      body: JSON.stringify({
        message,
        link,
        picture: imageUrl,
        access_token: PAGE_ACCESS_TOKEN,
      }),
    }
  );

  const data = await response.json();
  return data.id;
}
```

### 5.6 LinkedIn API (Optionnel)

| Aspect | Valeur |
|--------|--------|
| **API** | LinkedIn Marketing API |
| **Permissions** | w_member_social |
| **Use case** | Articles professionnels |
| **Priority** | P2 (optionnel) |

---

## 6. Décisions Techniques Justifiées

### ADR-001: Next.js Monorepo vs Separate Blog

**Décision**: Intégrer le blog dans le monorepo VPS-b974.fr existant.

**Justification**:
- Réutilisation composants UI (shadcn/ui, animations)
- Partage design system (couleurs, fonts)
- Même Prisma schema (extension)
- Déploiement unifié
- SEO : même domaine = autorité partagée

**Trade-offs**:
- (+) Cohérence parfaite
- (+) Maintenance simplifiée
- (-) Couplage plus fort
- (-) Deploy all-or-nothing

---

### ADR-002: Prisma + PostgreSQL vs MDX Files

**Décision**: Stocker les articles dans PostgreSQL avec Prisma, contenu en MDX.

**Justification**:
- Back-office existant utilise déjà DB
- Support des métadonnées riches (status, scheduling)
- Recherche full-text PostgreSQL
- Relations (séries, distributions)
- Génération AI stockée structurée

**Trade-offs**:
- (+) Flexibilité métadonnées
- (+) Workflow éditorial
- (+) API unifiée
- (-) Plus complexe que fichiers MDX statiques
- (-) Nécessite migration

---

### ADR-003: Claude API vs GPT-4 pour Ralph

**Décision**: Utiliser Claude (Anthropic) pour la génération de contenu.

**Justification**:
- Contexte 200k tokens (articles longs + guidelines)
- Qualité supérieure pour contenu éditorial
- Meilleur suivi des instructions (ton, format)
- Expérience équipe (Ralph = Claude-based)

**Trade-offs**:
- (+) Qualité output
- (+) Cohérence équipe
- (-) Coût légèrement supérieur
- (-) Vendor lock-in Anthropic

---

### ADR-004: Resend vs SendGrid pour Newsletter

**Décision**: Utiliser Resend pour les newsletters.

**Justification**:
- API moderne, DX excellent
- React Email (templates type-safe)
- Deliverability élevée
- Pricing transparent
- Stack moderne (Next.js ecosystem)

**Trade-offs**:
- (+) Developer experience
- (+) React templates
- (-) Moins de features que SendGrid
- (-) Startup (vs établi)

---

### ADR-005: Meta Graph API vs Buffer/Hootsuite

**Décision**: Intégration directe Meta Graph API pour social.

**Justification**:
- Contrôle total sur le workflow
- Pas de coût intermédiaire
- Génération AI → publication automatique
- Customisation complète

**Trade-offs**:
- (+) Pas de dépendance SaaS
- (+) Coût zéro
- (-) Plus de code à maintenir
- (-) Changements API à suivre

---

## 7. Environnement & Déploiement

### Variables d'Environnement

```bash
# Database
DATABASE_URL="postgresql://..."
DIRECT_URL="postgresql://..."

# Redis
REDIS_URL="redis://..."

# AI Services
OPENAI_API_KEY="sk-..."
ANTHROPIC_API_KEY="sk-ant-..."

# Media
CLOUDINARY_CLOUD_NAME="b974"
CLOUDINARY_API_KEY="..."
CLOUDINARY_API_SECRET="..."

# Email
RESEND_API_KEY="re_..."

# Social
META_PAGE_ID="..."
META_PAGE_ACCESS_TOKEN="..."
META_INSTAGRAM_ACCOUNT_ID="..."

# Optional
LINKEDIN_ACCESS_TOKEN="..."
```

### Infrastructure (VPS OVH)

| Paramètre | Valeur |
|-----------|--------|
| IP | 51.210.100.89 |
| Specs | 4 vCores, 8 GB RAM, 160 GB SSD |
| OS | Ubuntu 24.10 |
| Containers | prod, dev, app |
| Reverse Proxy | Nginx |
| SSL | Let's Encrypt |

---

## 8. Sécurité

### Mesures

| Aspect | Implementation |
|--------|----------------|
| **Auth** | Next-Auth (existant) |
| **API Keys** | Env vars, Vercel/server-side only |
| **CSRF** | Next.js built-in |
| **Rate Limiting** | Redis-based |
| **Input Validation** | Zod schemas |
| **Newsletter** | Double opt-in |

---

## Acceptance Criteria Status

- [x] Stack technique défini (framework, DB, APIs)
- [x] Architecture système documentée (diagramme)
- [x] Workflow Ralph pour génération contenu spécifié
- [x] Intégrations tierces listées (Whisper, Meta, Email)
- [x] Décisions techniques justifiées (5 ADRs)
