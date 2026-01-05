# Guide de Déploiement - Bonsai Tracker

## Prérequis

- Node.js 18+ ou 20+
- npm ou yarn
- Git

## Déploiement Local

```bash
# Clone
git clone <repo-url>
cd bonsai-tracker

# Install
npm ci

# Build
npm run build

# Run (développement)
npm run dev

# Run (production)
NODE_ENV=production USE_SQLITE=true npm run start
```

## Déploiement Railway

1. **Créer un projet Railway**
   ```bash
   npm install -g @railway/cli
   railway login
   railway init
   ```

2. **Configurer les variables d'environnement**
   ```
   NODE_ENV=production
   USE_SQLITE=true
   ALLOWED_ORIGINS=https://your-domain.com
   SENTRY_DSN=<votre-dsn>
   ```

3. **Déployer**
   ```bash
   railway up
   ```

## Déploiement Docker

```bash
# Build
docker build -t bonsai-tracker .

# Run
docker run -d \
  -p 3000:3000 \
  -v bonsai-data:/app/data \
  -e SENTRY_DSN=<dsn> \
  -e ALLOWED_ORIGINS=https://your-domain.com \
  bonsai-tracker
```

## Variables d'Environnement

| Variable | Description | Défaut |
|----------|-------------|--------|
| `PORT` | Port du serveur | 3000 |
| `NODE_ENV` | Environnement | development |
| `USE_SQLITE` | Activer SQLite | false |
| `DB_PATH` | Chemin base de données | ./data/bonsai.db |
| `ALLOWED_ORIGINS` | Origines CORS autorisées | localhost |
| `SENTRY_DSN` | DSN Sentry | - |

## Healthcheck

```bash
curl http://localhost:3000/health
```

Retourne:
```json
{
  "status": "healthy",
  "environment": "production",
  "timestamp": "2026-01-05T..."
}
```

## Volumes (Docker)

- `/app/data` - Base de données SQLite (persistant)

## Sécurité Production

- [ ] Configurer `ALLOWED_ORIGINS` avec votre domaine
- [ ] Configurer `SENTRY_DSN` pour le monitoring
- [ ] Utiliser HTTPS (via reverse proxy ou plateforme)
- [ ] Configurer les backups de `/app/data/bonsai.db`
