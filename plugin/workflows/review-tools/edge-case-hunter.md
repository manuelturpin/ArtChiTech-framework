---
description: Edge case hunter — systematically find boundary conditions and corner cases
---

# Edge Case Hunter

> Every branch is a potential bug. Every boundary is a potential off-by-one.

## Purpose

Systematically trace all code paths and identify untested edge cases, boundary conditions, and corner cases.

## When to Use

- After implementing complex logic
- When code has multiple branches (if/else, switch, try/catch)
- For data transformation or validation code
- Before declaring a feature "complete"

## The Hunting Process

### 1. Map All Branches

For each function or method:

```
function processOrder(order) {
  if (order.items.length === 0)     → Branch A: empty order
  if (order.total > MAX_ORDER)      → Branch B: over limit
  if (order.customer.isVIP)         → Branch C: VIP path
  if (order.coupon)                 → Branch D: with coupon
    if (order.coupon.isExpired)     → Branch D1: expired coupon
    if (order.coupon.minAmount)     → Branch D2: minimum not met
  try { chargePayment() }
    catch (InsufficientFunds)       → Branch E: payment failure
    catch (NetworkError)            → Branch F: network failure
  // ... etc
}
```

### 2. Identify Boundary Values

For each numeric parameter:

| Boundary | Values to Test |
|----------|---------------|
| Minimum | 0, 1, -1 |
| Maximum | MAX-1, MAX, MAX+1 |
| Typical | Normal range mid-point |
| Special | NaN, Infinity, null |

For each string parameter:

| Boundary | Values to Test |
|----------|---------------|
| Empty | "", null, undefined |
| One char | "a" |
| Very long | 10,000+ characters |
| Special | Unicode, emoji, RTL, null bytes |
| Injection | `<script>`, `'; DROP TABLE`, `../../../etc/passwd` |

### 3. Combination Explosions

When multiple parameters interact:
- What if BOTH are at boundary values?
- What if one is valid but the other isn't?
- What if they contradict each other?

### 4. State-Dependent Edge Cases

- First call vs subsequent calls
- Empty state vs populated state
- During initialization vs after initialization
- After error recovery

### 5. Timing Edge Cases

- Rapid repeated calls
- Concurrent calls
- Calls during shutdown
- Calls after timeout

## Output Format

```markdown
## Edge Case Analysis

### Branch Map
| Branch | Condition | Tested? | Risk |
|--------|-----------|---------|------|
| A | items.length === 0 | ✅ | Low |
| B | total > MAX | ❌ | High |
| C | customer.isVIP | ✅ | Low |

### Missing Test Cases
1. [Description] — Branch [X] untested
2. [Description] — Boundary value not covered
3. [Description] — Combination not tested

### Boundary Risks
- [Parameter X]: [boundary not tested]
- [State Y]: [transition not tested]

### Recommendations
- [ ] Add test for [specific case]
- [ ] Add validation for [specific input]
```

---

*ACT v3.5 — Edge Case Hunter*
