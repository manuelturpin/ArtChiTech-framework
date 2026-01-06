# ACT Starter Project

This is a simple webapp project for testing ACT Framework.

## Quick Start

1. **Run setup**
   ```bash
   bash setup.sh
   ```

2. **Install ACT** (if not done)
   ```bash
   git clone https://github.com/manuelturpin/ArtChiTech-framework.git
   cd ArtChiTech-framework
   bash scripts/install.sh
   ```

3. **Test ACT**
   ```bash
   cd starter-webapp
   # In Claude Code:
   /project
   ```

4. **Report issues**
   ```bash
   # In Claude Code:
   /feedback
   ```

## What to Test

1. `/project` - Should detect new project, offer to start
2. `/onboard` - Should audit and initialize .epct/
3. `/status` - Should show phase 1, scores at 0
4. `/next` - Should guide through phase transition
5. `/feedback` - Should capture context and create issue

## Expected Flow

```
/project
  -> "No ACT project detected"
  -> Choose "Start new project"
  -> Enter project name
  -> Phase 1: Discovery begins

/status
  -> Shows Phase 1/7
  -> All scores at 0%

/next
  -> Shows Go/No-Go criteria
  -> Guides to Phase 2 when ready
```
