---
name: brainstorming-selection
description: Step 2 - Choose brainstorming mode and select techniques
---

# Step 2: Selection

## Objective

Let the user choose a brainstorming mode and select appropriate techniques.

## Instructions

### 2.1 Present Mode Selection

Display:
```
╭─────────────────────────────────────────────────────────────╮
│  🎲 Choose your brainstorming mode:                         │
│                                                             │
│  1. 🤖 AI-Recommended (best for most cases)                 │
│  2. 📚 Browse Library (explore all 75 techniques)           │
│  3. 🎰 Random Selection (anti-bias, try something new)      │
│  4. 🔄 Progressive Flow (Creative → Analytical → Convergent)│
│                                                             │
│  Type a number...                                           │
╰─────────────────────────────────────────────────────────────╯
```

### 2.2 Mode Behaviors

#### Mode 1: AI-Recommended

Select 2-4 techniques based on the current phase using this table:

| Phase | Primary Techniques | Secondary Techniques |
|-------|-------------------|---------------------|
| 1 Discovery | JTBD (BT-029), Empathy Map (BT-032), VPC (BT-026) | Reverse Brainstorm (BT-005), Five Whys (BT-023), Personas (BT-055) |
| 2 Strategy | BMC (BT-027), Lean Canvas (BT-028), MoSCoW (BT-031) | SWOT (BT-022), OST (BT-040), ICE (BT-063) |
| 3 Design | C4 Model (BT-046), Event Storming (BT-047), ADR (BT-052) | Wardley (BT-044), Trade-off (BT-037), Kano (BT-030) |
| 4 Development | User Story Map (BT-043), Tech Spike (BT-071), Impact/Effort (BT-057) | MoSCoW (BT-031), Flowchart (BT-050), Decision Matrix (BT-034) |
| 5 Quality | Pre-Mortem (BT-039), Fishbone (BT-024), Risk Matrix (BT-036) | Five Whys (BT-023), Speed Boat (BT-069), Reverse (BT-005) |
| 6 Launch | Launch Readiness (BT-073), Feature Flags (BT-072), Cost-Benefit (BT-035) | Stakeholder Map (BT-053), What If (BT-010), Storyboard (BT-051) |
| 7 Growth | Growth Experiment (BT-074), Retention Cohort (BT-075), RICE (BT-064) | SCAMPER (BT-003), SWOT (BT-022), Impact/Effort (BT-057) |

**Selection logic**:
1. Pick 2 primary techniques matching the phase
2. If context is "feature" or "refinement", add 1 secondary technique
3. If the topic suggests a specific need, swap in a more relevant technique

Display selection and confirm:
```
🤖 Recommended techniques for Phase [N] - [phase_name]:

1. [technique_name] - [description] ([duration]min)
2. [technique_name] - [description] ([duration]min)
3. [technique_name] - [description] ([duration]min)

Total estimated duration: [sum]min

Proceed with these? (yes / change / add more)
```

#### Mode 2: Browse Library

1. Read `techniques.csv` from the workflow directory
2. Filter by current phase (show techniques where phase column includes current phase)
3. Display grouped by category:

```
📚 Techniques available for Phase [N]:

CREATIVE ([count]):
  BT-001 Classic Brainstorming (15min) - Free-form idea generation...
  BT-003 SCAMPER (15min) - Substitute Combine Adapt...
  ...

ANALYTICAL ([count]):
  BT-021 Six Thinking Hats (30min) - Examine from 6 perspectives...
  ...

VISUAL ([count]):
  ...

CONVERGENT ([count]):
  ...

Type technique IDs to select (e.g., "BT-001 BT-021 BT-057"):
```

#### Mode 3: Random Selection

1. Read `techniques.csv`
2. Filter techniques matching current phase
3. Randomly select 2-3 techniques from different categories
4. Display selection and confirm

```
🎰 Random selection for anti-bias exploration:

1. [technique] (CREATIVE)
2. [technique] (ANALYTICAL)
3. [technique] (CONVERGENT)

These might push you outside your comfort zone!
Proceed? (yes / re-roll / switch mode)
```

#### Mode 4: Progressive Flow

Execute 3 sequential rounds:

| Round | Category | Goal | Duration |
|-------|----------|------|----------|
| 1. Diverge | CREATIVE | Generate maximum ideas | ~15min |
| 2. Analyze | ANALYTICAL | Structure and evaluate | ~20min |
| 3. Converge | CONVERGENT | Prioritize and decide | ~15min |

Select one technique per round based on phase recommendations.

Display:
```
🔄 Progressive Flow (3 rounds):

Round 1 - DIVERGE: [technique] (~[duration]min)
Round 2 - ANALYZE: [technique] (~[duration]min)
Round 3 - CONVERGE: [technique] (~[duration]min)

Total estimated: ~[sum]min
Proceed? (yes / customize)
```

## Output

Pass to Step 3 (Execution):
- `mode`: ai_recommended | browse | random | progressive
- `selected_techniques`: list of technique objects (id, name, category, duration)
- `estimated_duration`: total minutes
