---
name: brainstorming-organization
description: Step 4 - Categorize, prioritize, and generate output document
---

# Step 4: Organization

## Objective

Organize raw ideas into themes, prioritize them, extract insights, and generate the final session document.

## Instructions

### 4.1 Clustering by Themes

Group all raw ideas into 4-8 themes:

1. Read through all ideas
2. Identify natural groupings
3. Name each theme concisely
4. Assign every idea to a theme (an idea can appear in multiple themes)

Present for user validation:
```
📂 I've organized the ideas into [N] themes:

Theme 1: [name] ([count] ideas)
Theme 2: [name] ([count] ideas)
Theme 3: [name] ([count] ideas)
...

Does this grouping make sense? (yes / adjust)
```

### 4.2 Phase-Appropriate Prioritization

Apply different prioritization criteria based on the current phase:

| Phase | Primary Criteria | Secondary Criteria | Method |
|-------|-----------------|-------------------|--------|
| 1 Discovery | User Impact, Problem Fit | Novelty | Impact/Feasibility score |
| 2 Strategy | Business Value, Market Fit | Competitive Edge | RICE or ICE scoring |
| 3 Design | Technical Feasibility, UX Impact | Scalability | Weighted matrix |
| 4 Development | Effort vs Value, Dependencies | Risk | Impact/Effort matrix |
| 5 Quality | Risk Severity, Coverage | User Impact | Risk matrix |
| 6 Launch | Readiness, Revenue Impact | Risk | Cost-Benefit |
| 7 Growth | Growth Potential, Retention Impact | Cost | RICE scoring |

For each top idea (top 5-10), score on:
- **Impact** (1-5): How much does this matter?
- **Feasibility** (1-5): How achievable is this?

Calculate: `Score = Impact × Feasibility`

Present:
```
🏆 Top Ideas (by phase-appropriate scoring):

| # | Idea | Impact | Feasibility | Score | Theme |
|---|------|--------|-------------|-------|-------|
| 1 | ...  | 5      | 4           | 20    | ...   |
| 2 | ...  | 4      | 5           | 20    | ...   |
| 3 | ...  | 5      | 3           | 15    | ...   |

Agree with this ranking? (yes / adjust scores)
```

### 4.3 Extract Key Insights

Identify 3-5 insights from the session:

- **Patterns**: What themes kept recurring?
- **Surprises**: What unexpected ideas emerged?
- **Gaps**: What areas were underexplored?
- **Connections**: What non-obvious links appeared between ideas?
- **Phase relevance**: How do these ideas connect to the current phase goals?

Present:
```
💡 Key Insights:

1. [insight about recurring pattern]
2. [insight about unexpected finding]
3. [insight about connection between themes]
```

### 4.4 Generate Next Steps

Based on the top ideas and current phase, suggest 2-4 concrete next steps:

| Phase | Typical Next Steps |
|-------|-------------------|
| 1 Discovery | Validate with users, test assumptions, define hypotheses |
| 2 Strategy | Create roadmap, define MVP scope, plan sprints |
| 3 Design | Create wireframes, write specs, document architecture |
| 4 Development | Write user stories, plan sprints, create branches |
| 5 Quality | Write test plans, set up monitoring, run audits |
| 6 Launch | Create launch checklist, prepare comms, set up analytics |
| 7 Growth | Design experiments, set up A/B tests, define metrics |

Include the recommended ACT command for each step:
```
📋 Next Steps:

1. [action] → Run `/act-next` to advance the phase
2. [action] → Use brainstorming again for deeper exploration
3. [action] → Run `/act-status` to check phase progress
```

### 4.5 Generate Output Document

Using the template from `template.md`, fill in all sections:

1. Header with session metadata
2. Raw Ideas (numbered list)
3. Ideas Organized by Theme
4. Top Ideas with scores
5. Key Insights
6. Next Steps with ACT commands
7. Anti-Bias Report with mechanism data

Save to: `.epct/brainstorming/session-{YYYY-MM-DD-HHmm}.md`

Confirm:
```
✅ Session saved to .epct/brainstorming/session-{timestamp}.md

📊 Session Summary:
   Ideas generated: [count]
   Themes identified: [count]
   Top ideas: [count]
   Techniques used: [list]
   Anti-bias mechanisms: [count] applied
```

### 4.6 Update Project State

If relevant, update `.epct/state.json`:
- Add brainstorming session reference
- Update phase progress if applicable
- Note any decisions made during the session

## Output

Final deliverables:
- Session document saved to `.epct/brainstorming/`
- Summary displayed to user
- Next steps with ACT commands
- State updated if applicable
