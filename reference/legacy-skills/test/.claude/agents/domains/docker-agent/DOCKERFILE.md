# Dockerfile Patterns

Reference file for Dockerfile best practices, multi-stage builds, and optimization.

## Node.js Multi-Stage

```dockerfile
FROM node:20-alpine AS base

# Dependencies stage
FROM base AS deps
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --only=production

# Dev dependencies
FROM base AS dev-deps
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci

# Build stage
FROM base AS builder
WORKDIR /app
COPY --from=dev-deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# Production stage
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production

# Non-root user
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nextjs

COPY --from=builder /app/dist ./dist
COPY --from=deps /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./

USER nextjs
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

## Python Multi-Stage

```dockerfile
FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# Builder stage
FROM base AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential && rm -rf /var/lib/apt/lists/*

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

# Production stage
FROM base AS production
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN useradd --create-home app
USER app

COPY --chown=app:app . .

EXPOSE 8000
CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "main:app", "-b", "0.0.0.0:8000"]
```

## Go Multi-Stage

```dockerfile
FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o main .

# Distroless for minimal attack surface
FROM gcr.io/distroless/static-debian12

COPY --from=builder /app/main /main

USER nonroot:nonroot
ENTRYPOINT ["/main"]
```

## Optimization Techniques

### Minimize Layers

```dockerfile
# Bad - multiple layers
RUN apt-get update
RUN apt-get install -y package1
RUN apt-get install -y package2
RUN rm -rf /var/lib/apt/lists/*

# Good - single layer
RUN apt-get update && apt-get install -y \
    package1 \
    package2 \
    && rm -rf /var/lib/apt/lists/*
```

### Cache Dependencies

```dockerfile
# Copy dependency files first
COPY package*.json ./
RUN npm ci

# Then copy source code
COPY src ./src
```

### Use Specific Tags

```dockerfile
# Bad - unpredictable
FROM node:latest

# Good - reproducible
FROM node:20.10.0-alpine3.18
```

## Security Best Practices

### Non-Root User

```dockerfile
# Create user
RUN addgroup --system app && adduser --system --group app

# Copy with ownership
COPY --chown=app:app . .

# Switch to user
USER app
```

### Read-Only Filesystem

```bash
docker run --read-only --tmpfs /tmp myapp
```

### Healthcheck

```dockerfile
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 1
```

### Secrets (Don't Do This)

```dockerfile
# NEVER do this
ENV API_KEY=<your-secret-here>
COPY .env .

# Instead, use runtime secrets
# docker run -e API_KEY=$API_KEY myapp
# Or Docker secrets / Kubernetes secrets
```

## Development Dockerfile

```dockerfile
FROM node:20-alpine AS development

WORKDIR /app
COPY package*.json ./
RUN npm install

# Don't copy source - mount as volume
EXPOSE 3000
CMD ["npm", "run", "dev"]
```

## CI/CD Dockerfile

```dockerfile
FROM node:20-alpine AS test
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run lint
RUN npm run test
RUN npm run build

FROM node:20-alpine AS production
WORKDIR /app
COPY --from=test /app/dist ./dist
COPY --from=test /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]
```

## Base Image Comparison

| Image | Size | Security | Use Case |
|-------|------|----------|----------|
| `node:20` | ~1GB | Medium | Development |
| `node:20-slim` | ~200MB | Good | General |
| `node:20-alpine` | ~130MB | Good | Production |
| `gcr.io/distroless/nodejs20` | ~120MB | Best | Secure prod |
