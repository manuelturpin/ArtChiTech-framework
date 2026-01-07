---
name: project-detection
description: This skill should be used when the user needs to "detect project stack", "analyze project structure", "identify technologies", or when /projet or /onboard need to understand the current project context.
version: 1.0.0
---

# Project Detection Skill

## Purpose

Detect and analyze the current project's technology stack, structure, and type.

## Path Resolution

Before using the command, resolve the ACT path:

```bash
ACT_ROOT="${CLAUDE_PLUGIN_ROOT:-.claude/plugins/act}"
```

## Usage

Execute the detection script and return structured results:

```bash
python3 ${ACT_ROOT}/skills/project-detection/scripts/detect_stack.py
```

## Output Format

The script outputs JSON with:
- `stack`: Array of detected technologies
- `type`: Project type (webapp, api, cli, library, research)
- `structure`: Directory analysis
- `confidence`: Detection confidence score

## When to Use

- At `/projet` startup to determine context
- During `/onboard` for full project audit
- When user asks about project technologies

## Example Output

```json
{
  "type": "webapp",
  "stack": ["react", "typescript", "vite"],
  "structure": {
    "has_src": true,
    "has_tests": true,
    "has_docs": false
  },
  "confidence": 0.85
}
```
