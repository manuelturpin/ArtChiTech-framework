---
name: act-onboard
description: Audit an existing project and initialize it in the ACT framework
---

# /onboard - Project Audit

You audit the current project and initialize it in ACT.

## Step 0: Check Existing Project

**First**, check if an ACT project already exists:

```bash
if [ -f ".epct/state.json" ]; then
  echo "⚠️  ACT project already initialized"
  echo "💡 Use /act-status to see current state, or delete .epct/ to re-audit"
  # Continue anyway for re-audit scenario
fi
```

## Step 0b: Resolve ACT Path

For audit and initialization, set the ACT path:

```bash
ACT_ROOT=".claude/act"

if [ ! -d "$ACT_ROOT" ]; then
    echo '❌ ACT non installé dans ce projet.'
    echo ''
    echo '💡 Installation :'
    echo '   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash'
    exit 1
fi
```

## Step 1: DETECTION

Execute the stack detection script:

```bash
python3 ${ACT_ROOT}/skills/project-detection/scripts/detect_stack.py
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

## Step 4b: USER CONFIRMATION

After displaying recommendations, ask the user:

```
╭───────────────────────────────────────────────────────────────╮
│  🎯 Use ACT Framework for this project?                       │
│                                                               │
│  ACT will:                                                    │
│  • Track your progress through 7 phases                       │
│  • Provide contextual recommendations                         │
│  • Generate/enhance CLAUDE.md                                 │
│                                                               │
│  1. ✅ Yes, initialize ACT                                    │
│  2. ❌ No, just show the audit                                │
│                                                               │
│  Choice? [1/2]                                                │
╰───────────────────────────────────────────────────────────────╯
```

**If choice 1:** Continue to Step 5 (INITIALIZATION)

**If choice 2:** Display final message and exit:
```
📊 Audit complete!
💡 Run /act-onboard again if you want to initialize ACT later.
```

---

## Step 5: INITIALIZATION

**Only execute if user chose option 1 in Step 4b.**

Create or update `.epct/state.json`:

```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py init \
  --name "[project-name]" \
  --type "[type]" \
  --stack "[stack-comma-separated]"
```

Then update with scores:

```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [phase], "name": "[phase-name]"}, "scores": {...}}'
```

## Step 6: CLAUDE.md GENERATION

Check if a CLAUDE.md file exists in the project root.

### If NO CLAUDE.md exists:

1. Use the `claudemd-generator` skill to generate an optimized CLAUDE.md
2. Calculate project complexity based on detected stack
3. Select strategy:
   - **SINGLE**: Complexity < 5 → Generate single CLAUDE.md (~150 lines)
   - **MODULAR**: Complexity >= 5 → Generate CLAUDE.md + .claude/rules/

Display preview:

```
╭──────────────────────────────────────────────────────────────╮
│  📝 CLAUDE.md Generation                                      │
│                                                               │
│  Detected: [technologies]                                     │
│  Strategy: [SINGLE/MODULAR] (~[N] lines)                     │
│                                                               │
│  Preview:                                                     │
│  ──────────────────────────────────────                       │
│  # [project-name]                                             │
│  > [description]                                              │
│                                                               │
│  ## Tech Stack                                                │
│  | Component | Technology |                                   │
│  | Language  | [language] |                                   │
│  ...                                                          │
│                                                               │
│  Generate? [Y/n/customize]                                    │
╰──────────────────────────────────────────────────────────────╯
```

If user confirms:
```bash
python3 ${ACT_ROOT}/skills/claudemd-generator/scripts/generate_claudemd.py \
  --stack "[stack-comma-separated]" \
  --name "[project-name]" \
  --description "[detected description]" \
  --phase [current-phase] \
  --output "CLAUDE.md"
```

> Note: The stack is available from the detection in Step 1, not from a file.

### If CLAUDE.md EXISTS:

Analyze existing content and propose enhancements:

```
╭──────────────────────────────────────────────────────────────╮
│  📝 CLAUDE.md Enhancement                                     │
│                                                               │
│  Existing CLAUDE.md detected ([N] lines)                      │
│                                                               │
│  Suggested additions:                                         │
│  ✓ ACT Framework integration section                          │
│  ✓ [Detected conventions based on stack]                      │
│                                                               │
│  Options:                                                     │
│  1. Add ACT section only                                      │
│  2. Add all suggestions                                       │
│  3. Skip (keep existing)                                      │
│                                                               │
│  Choice? [1/2/3]                                              │
╰──────────────────────────────────────────────────────────────╯
```

If option 1 or 2, append the relevant sections to the existing file.

## Step 7: CONFIRMATION

Display:
```
✅ Project initialized in ACT!

📁 State saved in .epct/state.json
📝 CLAUDE.md [created/updated/unchanged]
🎯 Current phase: [phase-name]
💡 Next action: [first recommendation]

Type /act-project to access the main menu.
```
