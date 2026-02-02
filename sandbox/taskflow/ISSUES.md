# ISSUES.md - TaskFlow Enhancement Log

> Enhancements discovered during development (Rule 5: Log & Continue)

---

## [Enhancement] Add colors to CLI output

- **File:** src/taskflow/task_manager.py
- **Lines:** 40-50 (export_report function)
- **Type:** enhancement
- **Priority:** low
- **Description:** Current output is plain text. Adding ANSI colors (e.g., using `colorama` or `rich` library) would improve readability and user experience. Could color-code task status: green for done, yellow for pending, red for blocked.
- **Logged:** 2025-02-02
- **Task context:** Discovered while reviewing export_report function during Test 5 (deviation rules validation)

### Implementation Ideas
- Use `rich` library for cross-platform colors
- Color by status: `done=green`, `pending=yellow`, `blocked=red`
- Add `--no-color` flag for CI/pipeline usage

---

*This file logs Rule 5 enhancements. Do NOT implement during current task.*
