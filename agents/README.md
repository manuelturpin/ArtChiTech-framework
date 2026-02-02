# Agents

Agents spécialisés pour ACT v2.5 avec Model Selection.

## Stratégie Model Selection

```
Opus = PENSE et DÉCIDE
Sonnet = EXÉCUTE
Haiku = LIT et DOCUMENTE
```

## Agents Disponibles

| Agent | Model | Rôle | Coût |
|-------|-------|------|------|
| [`planner`](planner.md) | opus | Planification, décomposition | $$$ |
| [`architect`](architect.md) | opus | Design système, décisions | $$$ |
| [`executor`](executor.md) | sonnet | Implémentation | $$ |
| [`reviewer`](reviewer.md) | opus | Code review, validation | $$$ |
| [`tester`](tester.md) | sonnet | Tests | $$ |
| [`documenter`](documenter.md) | haiku | Documentation | $ |

## Workflow Typique

### Full Mode (7 phases)

```
                    ┌─────────────┐
                    │   planner   │ ← Planification
                    │   (opus)    │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │  architect  │ ← Design
                    │   (opus)    │
                    └──────┬──────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
  ┌──────▼──────┐   ┌──────▼──────┐   ┌──────▼──────┐
  │  executor   │   │   tester    │   │ documenter  │
  │  (sonnet)   │◄─►│  (sonnet)   │   │  (haiku)    │
  └──────┬──────┘   └──────┬──────┘   └─────────────┘
         │                 │
         └────────┬────────┘
                  │
           ┌──────▼──────┐
           │  reviewer   │ ← Validation
           │   (opus)    │
           └─────────────┘
```

### Quick Mode (3 phases)

```
    ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
    │  executor   │────►│   tester    │────►│ documenter  │
    │  (sonnet)   │     │  (sonnet)   │     │  (haiku)    │
    └─────────────┘     └─────────────┘     └─────────────┘
```

## Configuration

Dans `.act/config.yaml` :

```yaml
models:
  default: sonnet
  
  agents:
    planner: opus
    architect: opus
    executor: sonnet
    reviewer: opus
    tester: sonnet
    documenter: haiku
```

## Quand utiliser quel agent?

| Situation | Agent |
|-----------|-------|
| Nouvelle feature | planner → architect → executor |
| Bug fix | executor (direct) |
| Code review | reviewer |
| Écrire des tests | tester |
| Documenter | documenter |
| Décision architecturale | architect |

## Coût estimé

| Mode | Distribution typique | Coût relatif |
|------|---------------------|--------------|
| Quick | 80% sonnet, 20% haiku | $ |
| Full | 50% sonnet, 30% opus, 20% haiku | $$ |
| Opus-only | 100% opus | $$$$$ |

**ROI vs Opus-only :** -40% coût, qualité maintenue.

## Créer un agent custom

1. Créer `agents/my-agent.md` avec le template :

```markdown
# Agent: MyAgent

**Model:** sonnet
**Role:** Description

## Responsabilités
- ...

## Inputs
- ...

## Outputs
- ...

## Règles
- ...

## Workflow
1. ...
```

2. Ajouter dans `.act/config.yaml` :

```yaml
models:
  agents:
    my-agent: sonnet  # ou opus/haiku
```

---

*ACT v2.5 - Model Selection*
