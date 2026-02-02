---
name: act-fix
description: List and fix priority errors in the project
argument-hint: [error-id]
---

# /act:fix - Error Correction

You help fix problems blocking project progress.

## Without Argument: List Problems

Analyze the project using the `phase-scoring` skill and list problems by priority:

```
╭─────────────────────────────────────────────────────────────╮
│  🔧 Problems Detected                                       │
│                                                             │
│  Phase: [phase-name] - Score: [score]%                      │
│                                                             │
│  🔴 Critical (block /next):                                 │
│  [1] Missing tests - coverage < 60%                         │
│  [2] CI/CD not configured                                   │
│                                                             │
│  🟡 Important:                                              │
│  [3] Incomplete API documentation                           │
│  [4] No error handling                                      │
│                                                             │
│  🟢 Suggestions:                                            │
│  [5] Add TypeScript strict mode                             │
│                                                             │
│  Type /act:fix [number] to fix a problem.                   │
╰─────────────────────────────────────────────────────────────╯
```

## With Argument: Fix the Problem

`/act:fix 1` → Focus on problem #1

---

## Problem Types and Solutions

### 🔴 CRITICAL - Must fix before /next

#### Missing Tests (coverage < 60%)

**Detection**: No test files or coverage below threshold

**Solution**:
1. Invoke `superpowers:test-driven-development`
2. Identify untested functions:
   ```bash
   npm run test -- --coverage
   ```
3. Create tests for critical paths first
4. Target 60% coverage minimum

**Example fix**:
```typescript
// tests/UserService.test.ts
import { describe, it, expect } from 'vitest';
import { UserService } from '../src/services/UserService';

describe('UserService', () => {
  it('should create a user', async () => {
    const user = await UserService.create({ email: 'test@example.com' });
    expect(user.id).toBeDefined();
  });
});
```

#### CI/CD Not Configured

**Detection**: No `.github/workflows/`, `.gitlab-ci.yml`, etc.

**Solution**:
1. Create `.github/workflows/ci.yml`:

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm ci
      - run: npm run build
      - run: npm test
```

#### Build Errors

**Detection**: `npm run build` fails

**Solution**:
1. Check `.act/logs/build-errors.log` for details
2. Fix TypeScript errors first
3. Verify all imports resolve
4. Check for missing dependencies

**Common fixes**:
```bash
# Missing types
npm install -D @types/[package]

# Unresolved import
# Verify file exists and export is correct
```

#### Type Errors (TypeScript)

**Detection**: `tsc --noEmit` returns errors

**Solution**:
1. Check `.act/logs/type-errors.log`
2. Fix errors from top to bottom (earlier errors may cause later ones)
3. Common patterns:

```typescript
// ❌ Error: Property 'email' does not exist
const email = user.email;

// ✅ Fix: Add null check
const email = user?.email;

// ✅ Fix: Type guard
if ('email' in user) {
  const email = user.email;
}
```

#### Schema Mismatch (Database)

**Detection**: Prisma/Drizzle queries fail with field errors

**Solution**:
1. Read schema file:
   ```bash
   cat prisma/schema.prisma
   ```
2. Verify field names match exactly
3. Run migrations if needed:
   ```bash
   npx prisma migrate dev
   ```

**Common mistake**:
```typescript
// ❌ Schema has "user_id" but code uses "userId"
where: { userId: id }

// ✅ Match schema exactly
where: { user_id: id }
```

---

### 🟡 IMPORTANT - Should fix for quality

#### Incomplete API Documentation

**Detection**: Routes without JSDoc/comments

**Solution**:
1. Add OpenAPI/Swagger annotations
2. Document each endpoint:

```typescript
/**
 * @swagger
 * /api/users/{id}:
 *   get:
 *     summary: Get user by ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: User found
 *       404:
 *         description: User not found
 */
```

#### No Error Handling

**Detection**: Try/catch missing in async functions

**Solution**:
1. Wrap async operations:

```typescript
// ❌ No error handling
async function getUser(id: string) {
  const user = await db.user.findUnique({ where: { id } });
  return user;
}

// ✅ With error handling
async function getUser(id: string) {
  try {
    const user = await db.user.findUnique({ where: { id } });
    if (!user) {
      throw new NotFoundError(`User ${id} not found`);
    }
    return user;
  } catch (error) {
    if (error instanceof NotFoundError) throw error;
    throw new DatabaseError('Failed to fetch user', { cause: error });
  }
}
```

#### Missing Input Validation

**Detection**: No validation on API inputs

**Solution**:
1. Use Zod for validation:

```typescript
import { z } from 'zod';

const CreateUserSchema = z.object({
  email: z.string().email(),
  name: z.string().min(2).max(100),
  age: z.number().int().positive().optional()
});

// In route handler
const data = CreateUserSchema.parse(req.body);
```

#### Linting Errors

**Detection**: `npm run lint` returns errors

**Solution**:
1. Auto-fix what can be fixed:
   ```bash
   npm run lint -- --fix
   ```
2. Manually fix remaining issues
3. Consider adjusting rules if too strict

---

### 🟢 SUGGESTIONS - Nice to have

#### TypeScript Strict Mode

**Detection**: `strict: false` in tsconfig.json

**Solution**:
1. Enable incrementally:

```json
{
  "compilerOptions": {
    "strict": true,
    // Or enable one at a time:
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitAny": true,
    "noImplicitThis": true
  }
}
```

#### Missing README

**Detection**: No README.md or empty

**Solution**:
1. Create with standard sections:

```markdown
# Project Name

Brief description.

## Installation

\```bash
npm install
\```

## Usage

\```bash
npm run dev
\```

## Testing

\```bash
npm test
\```

## License

MIT
```

---

## Problem Detection by Phase

### Phase 1 - Discovery
| Problem | Severity | Detection |
|---------|----------|-----------|
| README missing | 🔴 Critical | No README.md |
| No problem definition | 🔴 Critical | No docs/discovery/ |
| No personas | 🟡 Important | No persona files |

### Phase 2 - Strategy
| Problem | Severity | Detection |
|---------|----------|-----------|
| No roadmap | 🔴 Critical | No roadmap doc |
| Business model undefined | 🟡 Important | No business model |
| Missing KPIs | 🟢 Suggestion | No metrics defined |

### Phase 3 - Design
| Problem | Severity | Detection |
|---------|----------|-----------|
| No architecture doc | 🔴 Critical | No architecture.md |
| Technical specs missing | 🟡 Important | No specs/ |
| UI mockups missing | 🟢 Suggestion | No design assets |

### Phase 4 - Development
| Problem | Severity | Detection |
|---------|----------|-----------|
| No tests | 🔴 Critical | No test files |
| CI/CD not configured | 🔴 Critical | No CI config |
| Build fails | 🔴 Critical | Build errors |
| Type errors | 🔴 Critical | TypeScript errors |
| Undocumented code | 🟡 Important | No JSDoc |

### Phase 5 - Quality
| Problem | Severity | Detection |
|---------|----------|-----------|
| Coverage < 60% | 🔴 Critical | Coverage report |
| Critical bugs open | 🔴 Critical | Bug tracker |
| Linting errors | 🟡 Important | Lint output |

### Phase 6 - Launch
| Problem | Severity | Detection |
|---------|----------|-----------|
| Not deployed | 🔴 Critical | No deployment |
| No monitoring | 🟡 Important | No monitoring setup |
| User doc missing | 🟡 Important | No user docs |

### Phase 7 - Growth
| Problem | Severity | Detection |
|---------|----------|-----------|
| No analytics | 🔴 Critical | No analytics |
| No feedback loop | 🟡 Important | No feedback system |
| No changelog | 🟢 Suggestion | No CHANGELOG.md |

---

## After Correction

Recalculate the phase score and display:

```
✅ Problem fixed!
📊 New phase [name] score: [new-score]%
[If score >= 70] 💡 You can now use /act:next
```

## If No Problems

```
✅ No problems detected. Everything is green!

💡 Continue with /act:next to move forward
```

## Error Resolution Workflow

```
/act:fix → List problems
    ↓
/act:fix [n] → Focus on problem n
    ↓
superpowers:systematic-debugging (if code issue)
superpowers:test-driven-development (if test issue)
    ↓
Fix implemented
    ↓
Verify: npm run build && npm test
    ↓
/act:fix → Verify problem resolved
```
