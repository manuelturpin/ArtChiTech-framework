# OWASP Top 10 (2021)

Guide détaillé des vulnérabilités OWASP Top 10 avec exemples et remédiations.

---

## A01: Broken Access Control

### Vulnérabilités

```typescript
// ❌ IDOR (Insecure Direct Object Reference)
app.get('/api/users/:id', async (req, res) => {
  const user = await db.user.findById(req.params.id);
  res.json(user); // N'importe qui accède à n'importe quel user
});

// ✅ Vérification d'autorisation
app.get('/api/users/:id', authenticate, async (req, res) => {
  const userId = req.params.id;

  // Vérifier ownership ou admin
  if (req.user.id !== userId && req.user.role !== 'admin') {
    return res.status(403).json({ error: 'Forbidden' });
  }

  const user = await db.user.findById(userId);
  res.json(user);
});
```

```typescript
// ❌ Path Traversal
app.get('/files/:filename', (req, res) => {
  res.sendFile(`/uploads/${req.params.filename}`);
  // Attaque: GET /files/../../../etc/passwd
});

// ✅ Validation du path
import path from 'path';

app.get('/files/:filename', (req, res) => {
  const filename = path.basename(req.params.filename);
  const filepath = path.resolve('/uploads', filename);

  // Vérifier que le path est dans le dossier autorisé
  if (!filepath.startsWith('/uploads/')) {
    return res.status(400).json({ error: 'Invalid path' });
  }

  res.sendFile(filepath);
});
```

```typescript
// ❌ Missing function-level access control
app.delete('/api/users/:id', async (req, res) => {
  await db.user.delete(req.params.id);
  res.json({ success: true });
});

// ✅ Role-based access control
app.delete('/api/users/:id', authenticate, requireRole('admin'), async (req, res) => {
  await db.user.delete(req.params.id);

  // Audit log
  logger.info('User deleted', {
    deletedUserId: req.params.id,
    deletedBy: req.user.id,
  });

  res.json({ success: true });
});
```

### Checklist

```
☐ Chaque endpoint vérifie l'autorisation
☐ Ownership vérifié pour ressources utilisateur
☐ Roles vérifiés pour actions admin
☐ Path traversal bloqué
☐ CORS configuré restrictif
☐ Tokens ne sont pas prévisibles
```

---

## A02: Cryptographic Failures

### Vulnérabilités

```typescript
// ❌ Mot de passe en clair ou MD5
await db.user.create({
  email,
  password: password,  // JAMAIS
  // password: md5(password),  // OBSOLÈTE
});

// ✅ Hash avec argon2 ou bcrypt
import { hash, verify } from 'argon2';

const passwordHash = await hash(password, {
  type: argon2.argon2id,
  memoryCost: 65536,
  timeCost: 3,
  parallelism: 4,
});

await db.user.create({ email, passwordHash });

// Vérification
const valid = await verify(user.passwordHash, password);
```

```typescript
// ❌ JWT secret faible
const token = jwt.sign(payload, process.env.JWT_SECRET);

// ✅ Secret fort + expiration
const token = jwt.sign(payload, process.env.JWT_SECRET, {
  algorithm: 'HS256',
  expiresIn: '15m',
  issuer: 'myapp',
});
```

```typescript
// ❌ Données sensibles dans logs
console.log(`Login: ${email}, password: ${password}`);

// ✅ Masquer les données sensibles
console.log(`Login attempt: ${email}`);

// ❌ Transmission non chiffrée
// HTTP au lieu de HTTPS

// ✅ Forcer HTTPS
app.use((req, res, next) => {
  if (!req.secure && process.env.NODE_ENV === 'production') {
    return res.redirect(`https://${req.headers.host}${req.url}`);
  }
  next();
});
```

### Checklist

```
☐ Passwords hashés (bcrypt/argon2)
☐ Secrets forts (256+ bits entropy)
☐ TLS 1.2+ pour tout transit
☐ Données sensibles chiffrées at-rest
☐ Pas de secrets dans le code
☐ Pas de données sensibles dans logs
```

---

## A03: Injection

### SQL Injection

```typescript
// ❌ Concaténation directe
const query = `SELECT * FROM users WHERE email = '${email}'`;
// Attaque: email = "'; DROP TABLE users; --"

// ✅ Requêtes paramétrées
const user = await db.query(
  'SELECT * FROM users WHERE email = $1',
  [email]
);

// ✅ Avec ORM (Prisma)
const user = await prisma.user.findUnique({
  where: { email },
});
```

### Command Injection

```typescript
// ❌ exec avec input utilisateur
import { exec } from 'child_process';
exec(`ping ${userInput}`, callback);
// Attaque: userInput = "localhost; rm -rf /"

// ✅ execFile avec arguments séparés
import { execFile } from 'child_process';

// Valider d'abord
const isValidHost = /^[a-zA-Z0-9.-]+$/.test(userInput);
if (!isValidHost) throw new Error('Invalid host');

execFile('ping', ['-c', '1', userInput], callback);
```

### NoSQL Injection

```typescript
// ❌ MongoDB sans validation
db.users.find({
  username: req.body.username,
  password: req.body.password
});
// Attaque: { "password": { "$gt": "" } }

// ✅ Validation avec Zod
import { z } from 'zod';

const loginSchema = z.object({
  username: z.string().max(50),
  password: z.string(),
});

const { username, password } = loginSchema.parse(req.body);
```

### XSS (Cross-Site Scripting)

```typescript
// ❌ Insertion HTML directe
element.innerHTML = userInput;
// Attaque: userInput = "<script>steal(document.cookie)</script>"

// ✅ Avec React (échappe par défaut)
return <div>{userInput}</div>;

// ✅ Si HTML nécessaire, sanitize
import DOMPurify from 'dompurify';
element.innerHTML = DOMPurify.sanitize(userInput);
```

### Checklist

```
☐ Toutes queries SQL paramétrées
☐ ORM utilisé (Prisma, Sequelize)
☐ Inputs validés avec Zod
☐ Pas d'exec(), utiliser execFile()
☐ React/framework qui escape HTML
☐ CSP header configuré
```

---

## A04: Insecure Design

### Principes

```yaml
secure_design:
  authentication:
    - "MFA pour comptes sensibles"
    - "Verrouillage après N échecs"
    - "Politique mot de passe forte"
    - "Session timeout approprié"

  authorization:
    - "Principe du moindre privilège"
    - "RBAC (Role-Based Access Control)"
    - "Vérification côté serveur"
    - "Defense in depth"

  data:
    - "Chiffrement at-rest"
    - "Chiffrement in-transit"
    - "Minimisation des données"
    - "Anonymisation pour analytics"

  business_logic:
    - "Rate limiting"
    - "Validation montants côté serveur"
    - "Anti-fraude pour transactions"
    - "Audit trail"
```

### Threat Modeling (STRIDE)

```yaml
stride:
  Spoofing:
    threat: "Usurpation d'identité"
    mitigation: "MFA, strong auth"

  Tampering:
    threat: "Modification des données"
    mitigation: "Signatures, checksums"

  Repudiation:
    threat: "Nier une action"
    mitigation: "Audit logs, timestamps"

  Information_Disclosure:
    threat: "Fuite de données"
    mitigation: "Encryption, access control"

  Denial_of_Service:
    threat: "Rendre indisponible"
    mitigation: "Rate limiting, CDN"

  Elevation_of_Privilege:
    threat: "Obtenir plus de droits"
    mitigation: "RBAC, input validation"
```

---

## A05: Security Misconfiguration

### Headers de Sécurité

```typescript
import helmet from 'helmet';

app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", "data:", "https:"],
      connectSrc: ["'self'", "https://api.example.com"],
      frameSrc: ["'none'"],
      objectSrc: ["'none'"],
    },
  },
  hsts: {
    maxAge: 31536000,
    includeSubDomains: true,
    preload: true,
  },
  referrerPolicy: { policy: 'strict-origin-when-cross-origin' },
}));
```

### CORS

```typescript
// ❌ Trop permissif
app.use(cors({ origin: '*' }));

// ✅ Restrictif
app.use(cors({
  origin: [
    'https://myapp.com',
    'https://admin.myapp.com',
  ],
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
  maxAge: 86400,
}));
```

### Error Handling

```typescript
// ❌ Stack trace exposé
app.use((err, req, res, next) => {
  res.status(500).json({
    error: err.message,
    stack: err.stack,  // Jamais en prod!
  });
});

// ✅ Erreurs génériques en prod
app.use((err, req, res, next) => {
  logger.error('Internal error', { error: err, requestId: req.id });

  const isProduction = process.env.NODE_ENV === 'production';

  res.status(500).json({
    error: isProduction ? 'Internal server error' : err.message,
    requestId: req.id,
  });
});
```

---

## A06: Vulnerable Components

### Audit Dépendances

```bash
# npm
npm audit
npm audit fix
npm audit fix --force  # Attention: peut casser

# Snyk (plus complet)
npx snyk test
npx snyk monitor

# Dependabot (GitHub)
# .github/dependabot.yml
```

```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 10
    groups:
      production-dependencies:
        patterns:
          - "*"
        exclude-patterns:
          - "@types/*"
          - "eslint*"
          - "*test*"
```

### Checklist

```
☐ npm audit clean (no high/critical)
☐ Dependabot/Renovate configuré
☐ Versions lockées (package-lock.json)
☐ Pas de dépendances deprecated
☐ CI bloque sur vulnérabilités critiques
```

---

## A07: Authentication Failures

-> Voir [AUTHENTICATION.md](AUTHENTICATION.md) pour détails complets

```typescript
// ❌ Messages d'erreur révélateurs
if (!user) return res.status(404).json({ error: 'User not found' });
if (!match) return res.status(401).json({ error: 'Wrong password' });

// ✅ Message générique
if (!user || !match) {
  return res.status(401).json({ error: 'Invalid credentials' });
}
```

---

## A08: Software and Data Integrity

### Signature des Données

```typescript
// Vérification webhook signature
import crypto from 'crypto';

function verifySignature(payload: string, signature: string, secret: string): boolean {
  const expected = crypto
    .createHmac('sha256', secret)
    .update(payload)
    .digest('hex');

  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(`sha256=${expected}`)
  );
}

app.post('/webhook', (req, res) => {
  const signature = req.headers['x-signature'] as string;

  if (!verifySignature(JSON.stringify(req.body), signature, process.env.WEBHOOK_SECRET!)) {
    return res.status(401).json({ error: 'Invalid signature' });
  }

  // Process webhook...
});
```

### Intégrité CI/CD

```yaml
# Utiliser npm ci (pas npm install)
- run: npm ci

# Vérifier checksums
- name: Verify integrity
  run: npm audit signatures
```

---

## A09: Security Logging & Monitoring

```typescript
import winston from 'winston';

const securityLogger = winston.createLogger({
  level: 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.File({ filename: 'security.log' }),
  ],
});

// Événements à logger
const SECURITY_EVENTS = {
  LOGIN_ATTEMPT: 'login_attempt',
  LOGIN_SUCCESS: 'login_success',
  LOGIN_FAILED: 'login_failed',
  LOGOUT: 'logout',
  PASSWORD_CHANGE: 'password_change',
  PERMISSION_DENIED: 'permission_denied',
  RATE_LIMIT_HIT: 'rate_limit_hit',
  SUSPICIOUS_ACTIVITY: 'suspicious_activity',
};

function logSecurityEvent(event: string, data: object) {
  securityLogger.info(event, {
    ...data,
    timestamp: new Date().toISOString(),
  });
}

// Usage
logSecurityEvent(SECURITY_EVENTS.LOGIN_FAILED, {
  email: email,
  ip: req.ip,
  userAgent: req.headers['user-agent'],
  reason: 'invalid_password',
});
```

---

## A10: Server-Side Request Forgery (SSRF)

```typescript
// ❌ SSRF vulnérable
app.get('/fetch', async (req, res) => {
  const response = await fetch(req.query.url as string);
  // Attaque: url=http://169.254.169.254/metadata
});

// ✅ Whitelist et validation
const ALLOWED_DOMAINS = ['api.github.com', 'api.stripe.com'];

function isAllowedUrl(urlString: string): boolean {
  try {
    const url = new URL(urlString);

    // Protocole
    if (!['http:', 'https:'].includes(url.protocol)) return false;

    // Domaine whitelist
    if (!ALLOWED_DOMAINS.includes(url.hostname)) return false;

    // Bloquer IPs privées
    const privateRanges = [
      /^127\./, /^10\./, /^172\.(1[6-9]|2\d|3[01])\./,
      /^192\.168\./, /^169\.254\./, /^0\./, /localhost/i,
    ];
    if (privateRanges.some(r => r.test(url.hostname))) return false;

    return true;
  } catch {
    return false;
  }
}

app.get('/fetch', async (req, res) => {
  const url = req.query.url as string;

  if (!isAllowedUrl(url)) {
    return res.status(400).json({ error: 'URL not allowed' });
  }

  const response = await fetch(url);
  res.json(await response.json());
});
```
