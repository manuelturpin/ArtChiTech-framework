# ACT v3.0-alpha Test Plan

> Execute these tests to validate all v3.0 features.

## Pre-requisites

```bash
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
git checkout v3.0-alpha
```

---

## Test 1: NPX Init (CLI)

**Goal**: Verify `npx act-framework init` creates correct v3.0 structure.

```bash
cd test-apps/test-v3
../../scripts/cli.sh init .
```

**Expected**:
- [ ] `.act/` directory created
- [ ] `.act/config.yaml` has `version: "3.0"`
- [ ] `.act/prd.md` exists with project name "test-v3"
- [ ] `.act/architecture/` directory exists (for ADRs)
- [ ] `.act/stories/` directory exists
- [ ] `.act/observations.jsonl` exists (empty)
- [ ] All standard files: state.md, plan.md, progress.md, findings.md

**Verify**:
```bash
cat .act/config.yaml | grep version
cat .act/prd.md | head -3
ls .act/architecture/ .act/stories/
```

---

## Test 2: Global Install

**Goal**: Verify `install --global` creates `~/.act/`.

```bash
../../scripts/cli.sh install --global
```

**Expected**:
- [ ] `~/.act/projects.yaml` exists
- [ ] Contains `version: "3.0"`

**Verify**:
```bash
cat ~/.act/projects.yaml | head -5
```

---

## Test 3: Multi-Project Commands (in Claude Code)

**Goal**: Verify the 3 new commands are available.

```bash
# Open Claude Code in lab-13
cd /Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13
claude
```

Then test:
```
/act:projects
/act:dashboard
/act:switch test-v3
```

**Expected**:
- [ ] `/act:projects` lists registered projects (or says none registered)
- [ ] `/act:dashboard` shows multi-project overview (or empty state)
- [ ] `/act:switch` validates target exists or shows error

---

## Test 4: Phase Definitions

**Goal**: Verify enriched phases have Superpowers mapping and BMAD artefacts.

```bash
# In Claude Code:
cat plugin/references/phases/1-discovery.md
cat plugin/references/phases/2-strategy.md
cat plugin/references/phases/3-design.md
```

**Expected**:
- [ ] Phase 1 references `superpowers:brainstorming` and research/brainstorming workflows
- [ ] Phase 2 references PRD workflow and Story decomposition
- [ ] Phase 3 references ADR workflow with `workflows/adr/`
- [ ] Phase 4 references TDD Iron Law + systematic-debugging
- [ ] Phase 5 references all 3 Iron Laws + verification

---

## Test 5: ADR Workflow

**Goal**: Verify ADR template and workflow files are valid.

```bash
cat plugin/workflows/adr/workflow.md
cat plugin/workflows/adr/template.md
```

**Expected**:
- [ ] Workflow describes when/how to create ADRs
- [ ] Template has placeholders: Status, Context, Decision, Consequences, Alternatives
- [ ] Steps (create.md, review.md) exist and are coherent

---

## Test 6: Evolve Cross-Project

**Goal**: Verify the enhanced `/act:evolve` command includes v3.0 features.

```bash
cat plugin/commands/act/evolve.md | grep -A 5 "v3.0"
```

**Expected**:
- [ ] Section "v3.0 Enhancements" exists
- [ ] Auto-Reflexion after project completion documented
- [ ] Cross-project learning with `--cross-project` flag
- [ ] Framework improvement proposals documented

---

## Test 7: Plugin Manifest

**Goal**: Verify plugin version is correct.

```bash
cat plugin/.claude-plugin/plugin.json
```

**Expected**:
- [ ] `"version": "3.0.0-alpha"`
- [ ] Description mentions multi-project, BMAD, Superpowers
- [ ] Keywords include `multi-project`, `prd`, `adr`

---

## Test 8: CLAUDE.md

**Goal**: Verify main entry point reflects v3.0.

```bash
head -5 CLAUDE.md
grep -c "v3.0" CLAUDE.md
grep "act:projects\|act:switch\|act:dashboard" CLAUDE.md
```

**Expected**:
- [ ] Title says "v3.0"
- [ ] Multi-Project Orchestrator section exists
- [ ] BMAD Artefacts section exists
- [ ] Command table includes 3 new commands with `[NEW v3.0]`

---

## Test 9: Backward Compatibility

**Goal**: Verify v2.6 projects still work.

```bash
cd test-apps/app-test-manuel
# Check if existing .act/ still works
ls .act/ 2>/dev/null || echo "No .act/ — needs init"
```

**Expected**:
- [ ] Existing v2.6 `.act/` directories are NOT broken
- [ ] Old commands still work
- [ ] New features are additive, not breaking

---

## Test 10: Full Init + Resume Cycle

**Goal**: End-to-end test of init → work → resume.

1. Init a test project: `../../scripts/cli.sh init .`
2. In Claude Code: `/act:full`
3. Work through Phase 1 Discovery
4. Close session
5. Reopen: `/act:resume`
6. Verify 5-question reboot test works

**Expected**:
- [ ] Init creates all v3.0 artefacts
- [ ] Phase 1 activates brainstorming workflow
- [ ] PRD scaffolding available
- [ ] Resume recovers context correctly

---

## Summary

| Test | Feature | Status |
|------|---------|--------|
| 1 | NPX Init | ✅ |
| 2 | Global Install | ✅ |
| 3 | Multi-Project Commands | ✅ |
| 4 | Phase Definitions | ✅ |
| 5 | ADR Workflow | ✅ |
| 6 | Evolve Cross-Project | ✅ |
| 7 | Plugin Manifest | ✅ |
| 8 | CLAUDE.md | ✅ |
| 9 | Backward Compatibility | ✅ |
| 10 | Full Init + Resume | ✅ |

**Result: 10/10 PASS** — Validated 2026-02-25

---

*Test plan for ACT v3.0-alpha*
