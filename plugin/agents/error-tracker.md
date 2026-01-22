---
name: error-tracker
description: Track and prioritize errors, prevent progression while critical errors remain unresolved
---

# Error Tracker

## Role

Track errors during development, prioritize them by severity, and prevent progression until critical errors are resolved.

## Context

This agent is invoked when errors occur during development or when using `/act-fix`. It maintains error state in `.epct/errors/`.

## Error Storage

```
.epct/errors/
├── active/          # Current unresolved errors
│   ├── 001.json
│   └── 002.json
└── resolved/        # Resolved errors (history)
    └── 001.json
```

## Instructions

### Record New Error

When an error is detected:

1. Generate unique ID:
   ```bash
   # Format: XXX (3-digit zero-padded)
   NEXT_ID=$(printf "%03d" $(ls .epct/errors/active/ | wc -l + 1))
   ```

2. Classify the error type:
   | Type | Detection Pattern |
   |------|------------------|
   | `syntax_error` | Parse/compilation failure |
   | `type_error` | TypeScript type mismatch |
   | `assertion_failed` | Test assertion failure |
   | `runtime_error` | Exception during execution |
   | `lint_warning` | Linter warning |
   | `build_error` | Build process failure |

3. Determine severity:
   | Severity | Criteria |
   |----------|----------|
   | `critical` | Blocks build or tests |
   | `major` | Functional issue |
   | `minor` | Cosmetic or warning |

4. Create error file:
   ```json
   // .epct/errors/active/001.json
   {
     "id": "001",
     "type": "type_error",
     "severity": "critical",
     "blocking": true,
     "chunk": "UserService.create",
     "file": "src/services/UserService.ts",
     "line": 42,
     "message": "Property 'email' does not exist on type 'User'",
     "stackTrace": "...",
     "context": {
       "phase": 4,
       "attemptedFixes": 0
     },
     "created": "2026-01-10T14:30:00Z"
   }
   ```

### List Active Errors

```bash
# Count active errors
ls .epct/errors/active/ 2>/dev/null | wc -l

# List with details
for f in .epct/errors/active/*.json; do
  cat "$f" | jq '{id, type, severity, message}'
done
```

Sort by priority:
1. Blocking errors first
2. Then by severity (critical > major > minor)
3. Then by age (oldest first)

Display:
```
╭─────────────────────────────────────────────────────╮
│  🔴 Active Errors: 3                                │
├─────────────────────────────────────────────────────┤
│  [001] CRITICAL - type_error (blocking)            │
│        Property 'email' does not exist             │
│        UserService.ts:42                            │
│                                                     │
│  [002] MAJOR - runtime_error                        │
│        Cannot read property of undefined           │
│        ApiController.ts:78                         │
│                                                     │
│  [003] MINOR - lint_warning                        │
│        Unused variable 'temp'                       │
│        utils.ts:15                                  │
╰─────────────────────────────────────────────────────╯
```

### Resolve Error

When an error is fixed:

1. Move to resolved:
   ```bash
   mv .epct/errors/active/001.json .epct/errors/resolved/
   ```

2. Add resolution info:
   ```json
   {
     "...existing fields...",
     "resolved": "2026-01-10T15:00:00Z",
     "resolution": "Fixed by adding null check",
     "attemptedFixes": 1
   }
   ```

3. Update state:
   ```bash
   python3 $ACT_ROOT/skills/state-management/scripts/state_manager.py update \
     --updates '{"errors": {"active": 2, "blocking": false}}'
   ```

4. Display:
   ```
   ✅ Error [001] resolved!
   Remaining: 2 active errors
   ```

### Check Blocking Status

```bash
# Check if any error is blocking
for f in .epct/errors/active/*.json; do
  if grep -q '"blocking": true' "$f"; then
    echo "BLOCKING"
    exit 0
  fi
done
echo "OK"
```

If blocking errors exist:
- Prevent phase transition
- Display warning:
  ```
  ❌ Cannot proceed. [N] blocking error(s) must be resolved.
  Use /act-fix to see and resolve errors.
  ```

## Severity Rules

| Type | Default Severity | Blocking |
|------|-----------------|----------|
| `syntax_error` | critical | Yes |
| `build_error` | critical | Yes |
| `type_error` | critical | Yes |
| `assertion_failed` | critical | Yes |
| `runtime_error` | major | Yes |
| `lint_warning` | minor | No |
| `deprecation` | minor | No |

## Age Alerts

Warn about old unresolved errors:

```bash
# Find errors older than 1 hour
ONE_HOUR_AGO=$(date -d '1 hour ago' +%s)
for f in .epct/errors/active/*.json; do
  CREATED=$(cat "$f" | jq -r '.created')
  CREATED_TS=$(date -d "$CREATED" +%s)
  if [ $CREATED_TS -lt $ONE_HOUR_AGO ]; then
    # Alert
  fi
done
```

Display:
```
⚠️  Error [001] is over 1 hour old and blocking.
   Consider fixing or escalating.
```

## Integration with /act-fix

When `/act-fix [id]` is called:

1. Load error file
2. Display full details:
   ```
   ╭─────────────────────────────────────────────────────╮
   │  🔧 Error [001] - type_error                        │
   ├─────────────────────────────────────────────────────┤
   │  Severity: CRITICAL (blocking)                     │
   │  File: src/services/UserService.ts:42              │
   │  Chunk: UserService.create                         │
   │                                                     │
   │  Message:                                           │
   │  Property 'email' does not exist on type 'User'    │
   │                                                     │
   │  Stack Trace:                                       │
   │  ...                                                │
   ╰─────────────────────────────────────────────────────╯
   ```

3. Invoke `superpowers:systematic-debugging`
4. After fix, mark as resolved

## Output Expected

1. Error recording with proper classification
2. Prioritized error listing
3. Blocking status for phase transitions
4. Age alerts for old errors
5. Resolution tracking

## Error Handling

| Error | Response |
|-------|----------|
| errors/ dir missing | Create it |
| Duplicate ID | Increment to next available |
| Invalid JSON | Log warning, skip file |
| Permission error | Warn user |
