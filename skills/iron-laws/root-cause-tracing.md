# Root Cause Tracing

> Companion document for the Debugging Iron Law. A systematic backward-tracing methodology.

## The 5-Step Backward Trace

When you encounter an error, trace backward through the system:

### Step 1: Start at the Error
- Read the full error message (including stack trace)
- Note the exact location: file, line, function
- Copy the error verbatim — don't paraphrase

### Step 2: Trace the Data Flow
- What data was the function processing when it failed?
- Where did that data come from? (parameter? database? API?)
- Is the data what you expected? Log it to verify.

### Step 3: Find the Divergence Point
- At what point did reality diverge from expectations?
- Compare expected vs actual values at each step
- The divergence point is often NOT where the error manifests

### Step 4: Identify the Root Cause
The root cause is the EARLIEST point where something went wrong:
- Incorrect assumption in the code?
- Missing validation at a boundary?
- Changed external dependency?
- Race condition or timing issue?
- Data corruption upstream?

### Step 5: Verify the Root Cause
Before fixing, PROVE this is the root cause:
- Can you reproduce the error by triggering the root cause?
- Can you prevent the error by addressing the root cause?
- If you can't do both, you haven't found the real root cause.

---

## Common Root Cause Categories

| Category | Example | Typical Location |
|----------|---------|-----------------|
| **Boundary** | Null input, empty array, max int | Function entry points |
| **State** | Race condition, stale cache | Shared mutable state |
| **Contract** | API changed, wrong format | System boundaries |
| **Logic** | Off-by-one, wrong operator | Core algorithms |
| **Environment** | Missing env var, wrong path | Config/deployment |

## The "5 Places to Look" Checklist

When stuck, systematically check:
1. **Recent changes** — `git log -5`, `git diff`
2. **System boundaries** — API calls, DB queries, file I/O
3. **Shared state** — Global variables, caches, singletons
4. **Error handling** — Swallowed exceptions, silent failures
5. **Assumptions** — Things you "know" to be true but haven't verified

---

*Companion to Debugging Iron Law — ACT v3.5*
