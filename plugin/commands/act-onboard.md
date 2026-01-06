---
name: act-onboard
description: Audit an existing project and initialize it in the ACT framework
---

# /onboard - Project Audit

You audit the current project and initialize it in ACT.

## Step 1: DETECTION

Execute the stack detection script:

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/project-detection/scripts/detect_stack.py
```

Capture and analyze the JSON result containing:
- `stack`: Detected technologies
- `type`: Project type (webapp, api, cli, library)
- `structure`: Folder analysis

## Step 2: SCORING

Use the `phase-scoring` skill to evaluate the project.

For each phase (1-7), verify the criteria according to `references/scoring-rules.md`:

1. **Discovery**: README, defined problem, users
2. **Strategy**: Roadmap, business model
3. **Design**: Architecture, specs
4. **Development**: Code, tests, CI
5. **Quality**: Coverage, bugs
6. **Launch**: Deploy, monitoring
7. **Growth**: Analytics, feedback

Calculate a score 0-100 per phase.
The current phase = first phase with score < 70%.

## Step 3: REPORT

Display the visual report:

```
╭───────────────────────────────────────────────────────────────╮
│  📊 ACT Audit: [project-name]                                 │
│                                                               │
│  Detected stack: [technologies]                               │
│  Type: [type]                                                 │
│                                                               │
│  ═══════════════════════════════════════════════════════════  │
│                                                               │
│  Phases                              Score                    │
│  ───────────────────────────────────────────                  │
│  ✅ 1. Discovery                     [██████████] 85%         │
│  ✅ 2. Strategy                      [███████░░░] 70%         │
│  ✅ 3. Design                        [█████████░] 90%         │
│  🔄 4. Development                   [████░░░░░░] 45%  ←      │
│  ⬚ 5. Quality                       [░░░░░░░░░░] 0%          │
│  ⬚ 6. Launch                        [░░░░░░░░░░] 0%          │
│  ⬚ 7. Growth                        [░░░░░░░░░░] 0%          │
│                                                               │
│  Overall score: 42%                                           │
│  Current phase: Development (4/7)                             │
╰───────────────────────────────────────────────────────────────╯
```

## Step 4: RECOMMENDATIONS

Generate the 3 priority recommendations:

```
📋 Recommended Actions:

1. 🔴 [High] Increase test coverage
   → Currently ~30%, target 60%

2. 🟡 [Medium] Configure CI/CD
   → Add GitHub Actions for automated tests

3. 🟢 [Low] Document APIs
   → Add OpenAPI specs
```

## Step 5: INITIALIZATION

Create or update `.epct/state.json`:

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py init \
  --name "[project-name]" \
  --type "[type]" \
  --stack "[stack-comma-separated]"
```

Then update with scores:

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [phase], "name": "[phase-name]"}, "scores": {...}}'
```

## Step 6: CONFIRMATION

Display:
```
✅ Project initialized in ACT!

📁 State saved in .epct/state.json
🎯 Current phase: [phase-name]
💡 Next action: [first recommendation]

Type /projet to access the main menu.
```
