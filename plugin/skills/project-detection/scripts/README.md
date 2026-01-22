# Stack Detection Script

Analyse un projet et détecte automatiquement son stack technologique.

## Usage CLI

```bash
# Détecter le stack du répertoire courant
python detect_stack.py

# Détecter le stack d'un projet spécifique
python detect_stack.py /path/to/project
```

## Output

Le script retourne un JSON avec les informations détectées :

```json
{
  "type": "webapp",
  "language": "typescript",
  "framework": "next.js",
  "runtime": "node",
  "database": "prisma",
  "has_tests": true,
  "has_ci": true,
  "has_docker": false
}
```

## Détections Supportées

### Langages

| Langage | Fichiers de détection |
|---------|----------------------|
| TypeScript | `tsconfig.json`, `typescript` dans package.json |
| JavaScript | `package.json` sans TypeScript |
| Python | `requirements.txt`, `pyproject.toml`, `setup.py` |
| Go | `go.mod` |
| Rust | `Cargo.toml` |
| Java | `pom.xml`, `build.gradle` |
| Ruby | `Gemfile` |

### Frameworks

#### JavaScript/TypeScript

| Framework | Package |
|-----------|---------|
| Next.js | `next` |
| Nuxt | `nuxt` |
| Angular | `@angular/core` |
| Vue | `vue` |
| React | `react` |
| Svelte | `svelte` |
| Express | `express` |
| Fastify | `fastify` |
| Koa | `koa` |
| Hono | `hono` |

#### Python

| Framework | Package |
|-----------|---------|
| FastAPI | `fastapi` |
| Django | `django` |
| Flask | `flask` |
| Starlette | `starlette` |

#### Go

| Framework | Import |
|-----------|--------|
| Gin | `gin-gonic/gin` |
| Echo | `labstack/echo` |
| Fiber | `gofiber/fiber` |

#### Rust

| Framework | Crate |
|-----------|-------|
| Actix-web | `actix-web` |
| Axum | `axum` |
| Rocket | `rocket` |

### Types de Projet

| Type | Critères |
|------|----------|
| `webapp` | Framework web UI ou dossiers pages/app/components |
| `api` | Framework API sans UI, dossiers api/routes |
| `cli` | `bin` dans package.json, framework CLI |
| `library` | Exports définis, pas de structure app |
| `docs` | Majorité de fichiers Markdown |
| `research` | Beaucoup de MD, peu de code |
| `unknown` | Non déterminable |

### Bases de Données

| ORM/DB | Package |
|--------|---------|
| Prisma | `prisma`, `@prisma/client` |
| Drizzle | `drizzle-orm` |
| TypeORM | `typeorm` |
| Sequelize | `sequelize` |
| Mongoose | `mongoose` |
| SQLite | `better-sqlite3` |
| PostgreSQL | `pg` |
| MySQL | `mysql2`, `mysql` |
| Redis | `redis`, `ioredis` |

### Détections Additionnelles

| Feature | Critères |
|---------|----------|
| `has_tests` | Dossiers test/tests/__tests__, fichiers *_test.*, frameworks de test |
| `has_ci` | `.github/workflows`, `.gitlab-ci.yml`, etc. |
| `has_docker` | `Dockerfile`, `docker-compose.yml` |

## Usage Python

```python
from detect_stack import detect_stack
from pathlib import Path

# Détecter le stack
result = detect_stack(Path("/path/to/project"))

print(f"Type: {result['type']}")
print(f"Language: {result.get('language', 'unknown')}")
print(f"Framework: {result.get('framework', 'none')}")
print(f"Has tests: {result['has_tests']}")
```

## Exemple Complet

**Projet Next.js avec Prisma** :

```
my-project/
├── package.json         # next, @prisma/client
├── tsconfig.json
├── prisma/
│   └── schema.prisma
├── src/
│   ├── app/
│   ├── components/
│   └── lib/
├── tests/
└── .github/
    └── workflows/
```

**Résultat** :

```json
{
  "type": "webapp",
  "language": "typescript",
  "framework": "next.js",
  "runtime": "node",
  "database": "prisma",
  "has_tests": true,
  "has_ci": true,
  "has_docker": false
}
```

## Erreurs

| Erreur | Cause | Solution |
|--------|-------|----------|
| `Path does not exist` | Chemin invalide | Vérifier le chemin |
| `Path is not a directory` | Ce n'est pas un dossier | Fournir un dossier |

## Limitations

- Ne détecte que les configurations standard
- Peut manquer des configurations personnalisées
- Analyse uniquement les fichiers de configuration (pas le code source)

## Tests

```bash
cd plugin
python -m pytest tests/unit/test_detection.py -v
```
