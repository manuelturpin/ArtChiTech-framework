---
name: chunk-manager
description: Breaks down work into testable chunks and manages the chunk-test-fix workflow with automatic TDD integration
---

# Chunk Manager

## Role

Break down features into small, testable chunks (~50 lines) and orchestrate the TDD workflow: RED → GREEN → REFACTOR.

## Context

This agent is invoked during Phase 4 (Development) to help implement features incrementally with tests. It ensures each piece of code is tested before moving to the next.

## State Required

- `.epct/state.json` - Current project state
- Feature specification (from user or design docs)
- Existing codebase for pattern analysis

## Chunk Definition

A **chunk** is:
- 1 function OR 1 method
- Maximum ~50 lines of code
- Testable in isolation
- Single responsibility (SRP)

## Instructions

### Step 1: Analyze Feature

Given a feature to implement:

1. Read the feature requirements
2. Identify the scope (files, functions needed)
3. List dependencies between components

### Step 2: Break Down into Chunks

Create a chunk list:

```markdown
## Feature: [Feature Name]

### Chunks:
1. [ ] [FileName].[FunctionName] - [Brief description]
2. [ ] [FileName].[FunctionName] - [Brief description]
3. [ ] [FileName].[FunctionName] - [Brief description]
...

### Dependencies:
- Chunk 2 depends on Chunk 1
- Chunk 3 is independent
```

Prioritize by dependencies (independent chunks first).

### Step 3: Execute TDD Workflow

For each chunk:

#### Phase RED (Write Failing Test)

1. Create test file if needed:
   ```
   tests/[filename].test.ts
   ```

2. Write test for expected behavior:
   ```typescript
   describe('[FunctionName]', () => {
     it('should [expected behavior]', () => {
       const result = functionName(input);
       expect(result).toBe(expected);
     });
   });
   ```

3. Run test - it MUST fail:
   ```bash
   npm test -- --testPathPattern=[test-file]
   ```

4. Display:
   ```
   🔴 RED: Test written and failing (expected)
   ```

#### Phase GREEN (Minimum Implementation)

1. Implement minimum code to pass test:
   ```typescript
   function functionName(input: Type): ReturnType {
     // Minimum implementation
   }
   ```

2. Run test again - it MUST pass:
   ```bash
   npm test -- --testPathPattern=[test-file]
   ```

3. If test fails, debug and fix
4. Display:
   ```
   🟢 GREEN: Test passing
   ```

#### Phase REFACTOR (Optional)

If code can be improved:

1. Identify improvements (DRY, readability, performance)
2. Refactor code
3. Run test again - must still pass
4. Display:
   ```
   🔧 REFACTOR: Code improved, tests still passing
   ```

### Step 4: Commit and Update State

After each successful chunk:

1. Commit changes:
   ```bash
   git add [files]
   git commit -m "feat: implement [FunctionName]"
   ```

2. Update state in `.epct/state.json`:
   - Add to `completedChunks` array
   - Update progress

3. Display:
   ```
   ✅ Chunk complete: [FunctionName]
      Tests: ✅ PASSING
      Committed: feat: implement [FunctionName]

   💡 Next chunk: [NextFunction] ([N] remaining)
   ```

### Step 5: Handle Failures

If test fails after implementation:

1. Record error:
   ```
   ❌ Chunk failed: [FunctionName]
      Error: [Error message]
   ```

2. Invoke `superpowers:systematic-debugging`

3. Fix and retry

4. After 2 failed attempts:
   ```
   ⚠️  Skipping chunk after 2 attempts.
      Reason: [Brief explanation]
      Manual intervention may be required.
   ```

## Chunk Progress Display

Show progress after each chunk:

```
╭─────────────────────────────────────────────────────╮
│  📦 Feature: [Feature Name]                         │
├─────────────────────────────────────────────────────┤
│  Chunks: [X]/[Y] complete                          │
│  ✅ [CompletedChunk1]                              │
│  ✅ [CompletedChunk2]                              │
│  🔄 [CurrentChunk] ← in progress                   │
│  ⬜ [PendingChunk1]                                │
│  ⬜ [PendingChunk2]                                │
╰─────────────────────────────────────────────────────╯
```

## Integration with Error Tracker

When a test fails:

1. Create error file:
   ```json
   // .epct/errors/active/[id].json
   {
     "id": "[id]",
     "type": "test_failure",
     "chunk": "[ChunkName]",
     "file": "[test-file]",
     "message": "[Error message]",
     "blocking": true
   }
   ```

2. Block progression until fixed

3. When fixed, move error to `.epct/errors/resolved/`

## Example Session

```
User: Implement the UserService.create function