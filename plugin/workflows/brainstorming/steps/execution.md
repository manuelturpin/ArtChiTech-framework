---
name: brainstorming-execution
description: Step 3 - Execute brainstorming techniques with anti-bias protocol
---

# Step 3: Execution

## Objective

Facilitate the brainstorming session using the selected techniques while applying the anti-bias protocol.

## Key Principle

**Facilitate, don't generate.** Claude coaches the user through each technique, asks guiding questions, and helps structure thinking. Claude does NOT generate all the ideas alone.

## Instructions

### 3.1 Execute Each Technique

For each selected technique:

1. **Introduce the technique**:
   ```
   ╭─────────────────────────────────────────────────────────────╮
   │  🎯 Technique: [technique_name] ([category])                │
   │  ⏱️  Duration: ~[duration]min                                │
   │  📝 Output: [output_type]                                   │
   │                                                             │
   │  [brief description of how it works]                        │
   ╰─────────────────────────────────────────────────────────────╯
   ```

2. **Guide step by step** according to the technique's methodology
3. **Capture ideas** as they emerge (numbered list)
4. **Apply anti-bias protocol** during execution (see section 3.2)
5. **Transition** to the next technique with a brief recap

### 3.2 Anti-Bias Protocol

Apply these 4 mechanisms throughout the session:

#### Mechanism 1: Domain Rotation (every ~10 ideas)

After approximately 10 ideas, prompt the user to shift domain:

**Domain pool**: Tech, Business, UX, Marketing, Ops, Culture, Environment, Legal, Education, Health

```
💡 Domain shift: We've been focused on [current_domain].
   Let's explore from the [next_domain] angle.
   → How might someone in [next_domain] approach this?
```

Track which domains have been explored.

#### Mechanism 2: Perspective Shift (every ~20 ideas)

After approximately 20 ideas, prompt a perspective change:

**Perspective pool**:
- First-time user
- Power user
- Competitor
- Regulator
- Support team member
- Child/non-technical person

```
🔄 Perspective shift: Let's think as a [perspective].
   → What would matter most to them?
   → What would frustrate them?
   → What would delight them?
```

#### Mechanism 3: Plateau Busters (when flow slows)

If the user seems stuck or ideas slow down, apply one of:

| Buster | Prompt |
|--------|--------|
| Random Word | "Use the word '[random]' as stimulus. What connections can you make?" |
| Provocation | "What if [provocative opposite]? How does that change your thinking?" |
| Inversion | "Instead of solving [problem], how would you create [problem]? Now reverse those." |
| Scale Shift | "What if you had 10x the budget? 1/10th? What changes?" |
| Time Travel | "What would the solution look like in 10 years? What about 100 years ago?" |

#### Mechanism 4: Anti-Bias Report

Track throughout the session:
- Domains explored (from Domain Rotation)
- Perspectives used (from Perspective Shift)
- Plateau busters triggered (count and type)
- Category diversity of techniques used

### 3.3 Idea Target

**Target**: 50+ ideas (stretch goal: 100+)

The 100+ target is aspirational, not a hard minimum. Quality exploration matters more than hitting a number.

Progress indicators:
```
📊 Progress: [count] ideas generated
   [████████░░░░░░░░░░░░] 40% toward stretch goal
```

### 3.4 Progressive Flow Execution (Mode 4)

When in Progressive Flow mode, execute 3 rounds with clear transitions:

**Round 1 - DIVERGE** (Creative technique):
- Goal: Maximum idea volume
- Rule: No criticism, quantity over quality
- End: "Round 1 complete! [count] ideas generated."

**Round 2 - ANALYZE** (Analytical technique):
- Goal: Structure and evaluate the ideas from Round 1
- Apply the analytical framework to all ideas
- End: "Round 2 complete! Ideas analyzed and structured."

**Round 3 - CONVERGE** (Convergent technique):
- Goal: Prioritize and select top ideas
- Apply scoring/ranking to the analyzed ideas
- End: "Round 3 complete! Top ideas identified."

### 3.5 Capture and Record

Throughout execution:
- Number every idea sequentially (1, 2, 3...)
- Note which technique generated each idea
- Note domain/perspective context if applicable
- Record raw without editing or filtering

## Output

Pass to Step 4 (Organization):
- `raw_ideas`: numbered list of all ideas
- `technique_results`: ideas grouped by technique used
- `anti_bias_data`: domains explored, perspectives used, busters triggered
- `total_ideas`: count
