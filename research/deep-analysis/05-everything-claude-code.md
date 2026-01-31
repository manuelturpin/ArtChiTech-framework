# Deep Analysis: Everything Claude Code

**Date :** 2026-01-31
**Repo :** https://github.com/affaan-m/everything-claude-code
**Auteur :** Hackathon winner (Anthropic x Forum Ventures)

---

## 🎯 Concept Core

> "Production-ready agents, skills, hooks, commands, rules, and MCP configurations evolved over 10+ months of intensive daily use."

Collection complète, battle-tested, d'un vrai projet production (zenith.chat).

---

## 📁 Structure Complète

| Dossier | Contenu | Quantité |
|---------|---------|----------|
| `agents/` | Subagents spécialisés | 12 |
| `skills/` | Workflows et knowledge | 22 |
| `commands/` | Slash commands | 23 |
| `rules/` | Guidelines always-follow | 6 |
| `hooks/` | Automations | ~5 |
| `contexts/` | Dynamic system prompts | 3 |
| `mcp-configs/` | MCP servers | Multi |

---

## 🤖 Agents (12)

| Agent | Rôle | Model |
|-------|------|-------|
| planner | Feature implementation planning | opus |
| architect | System design decisions | opus |
| tdd-guide | Test-driven development | sonnet |
| code-reviewer | Quality and security | opus |
| security-reviewer | Vulnerability analysis | opus |
| build-error-resolver | Fix build errors | sonnet |
| e2e-runner | Playwright E2E | sonnet |
| refactor-cleaner | Dead code cleanup | sonnet |
| doc-updater | Documentation sync | haiku |
| go-reviewer | Go code review | opus |
| go-build-resolver | Go build errors | sonnet |

**Pattern clé :** Model selection par agent (opus = complex, sonnet = standard, haiku = simple)

---

## 🧠 Continuous Learning v2 (KILLER FEATURE)

### Le système d'instincts

```
Session Activity → Hooks (100% reliable) → observations.jsonl
                                                    ↓
                                          Pattern Detection
                                                    ↓
                                          instincts/personal/
                                          (atomic behaviors + confidence)
                                                    ↓
                                              /evolve
                                                    ↓
                                          evolved/skills/
                                          evolved/commands/
                                          evolved/agents/
```

### Instinct = unité atomique

```yaml
id: prefer-functional-style
trigger: "when writing new functions"
confidence: 0.7  # 0.3-0.9
domain: "code-style"
source: "session-observation"
```

### Confidence Scoring

| Score | Signification | Comportement |
|-------|---------------|--------------|
| 0.3 | Tentative | Suggéré mais pas forcé |
| 0.5 | Modéré | Appliqué si pertinent |
| 0.7 | Fort | Auto-approved |
| 0.9 | Near-certain | Core behavior |

### Évolution de confiance

**↑ Augmente :**
- Pattern répété
- User ne corrige pas
- Autres instincts similaires

**↓ Diminue :**
- User corrige explicitement
- Pattern pas observé longtemps
- Evidence contradictoire

---

## 🔧 Hooks Clés

| Hook | Fonction |
|------|----------|
| `session-start.js` | Load context on session start |
| `session-end.js` | Save state on session end |
| `pre-compact.js` | Pre-compaction state saving |
| `suggest-compact.js` | Strategic compaction suggestions |
| `evaluate-session.js` | Extract patterns from sessions |
| `observe.sh` | v2 PreToolUse/PostToolUse observer |

**Important :** Cross-platform (Node.js) — Windows/macOS/Linux

---

## 📏 Rules (Always-Follow)

| Rule | Scope |
|------|-------|
| security.md | No hardcoded secrets |
| coding-style.md | Immutability, file limits |
| testing.md | TDD, 80% coverage |
| git-workflow.md | Commit format, PR process |
| agents.md | When to delegate |
| performance.md | Model selection, context |

---

## 🎭 Contexts (Dynamic System Prompt)

| Context | Usage |
|---------|-------|
| dev.md | Development mode |
| review.md | Code review mode |
| research.md | Research/exploration mode |

Injection dynamique selon le mode de travail.

---

## 🎯 Patterns à Extraire pour ACT

### ✅ À intégrer (Tier 1)

| Pattern | Pertinence ACT |
|---------|----------------|
| **Agent Specialization** | Un agent par rôle avec model adapté |
| **Continuous Learning v2** | Apprendre des sessions automatiquement |
| **Rules modulaires** | Séparés par domaine |
| **Hooks Cross-Platform** | Node.js au lieu de bash |

### ✅ À intégrer (Tier 2)

| Pattern | Notes |
|---------|-------|
| **Contexts dynamiques** | dev/review/research modes |
| **Confidence scoring** | Pour les "instincts" appris |
| **Package manager detection** | Multi-platform |
| **Strategic compaction** | Suggestions manuelles |

---

## 💡 Insights

1. **Model Selection** — Opus pour complex, Sonnet pour standard, Haiku pour simple
2. **Hooks > Skills** — Pour observation (100% reliable vs ~50-80%)
3. **Instincts = Atomic Learning** — Petites unités vs gros skills
4. **Cross-Platform First** — Node.js partout

---

## 📊 Comparaison avec ACT

| Aspect | Everything CC | ACT |
|--------|--------------|-----|
| Agents | ✅ 12 spécialisés | ❌ (via Superpowers) |
| Learning | ✅ Continuous v2 | ❌ |
| Hooks | ✅ Cross-platform | ❌ |
| Model Selection | ✅ Per-agent | ❌ |
| Rules | ✅ Modulaires | ✅ |

---

## 🔗 Liens

- [README](https://github.com/affaan-m/everything-claude-code)
- [Shorthand Guide](https://x.com/affaanmustafa/status/2012378465664745795)
- [Longform Guide](https://x.com/affaanmustafa/status/2014040193557471352)

---

*Analysé par Archi — 2026-01-31*
