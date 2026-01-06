# ACT Framework - Design d'Implémentation

> Design validé le 2026-01-06 via brainstorming session.

## Résumé des Décisions

| Décision | Choix validé |
|----------|--------------|
| Architecture | **Hybride** - ACT orchestre + superpowers pour workflows |
| Structure | **Commandes + Skills** (+ Agents si tâche longue) |
| État | **`.epct/`** dans le projet cible |
| Dépendances | superpowers plugin + Python 3.8+ |
| Tests | Unitaires + Intégration, automatisés |
| Distribution | **B (Git + symlink)** maintenant, **C + D** (Marketplace + npm) comme objectifs |

---

## 1. Structure du Plugin

```
plugin/
├── .claude-plugin/
│   └── plugin.json              # Manifest complet
├── commands/                     # 7 commandes slash
│   ├── projet.md                # Hub principal
│   ├── onboard.md               # Audit projet
│   ├── status.md                # État du projet
│   ├── next.md                  # Phase suivante
│   ├── fix.md                   # Correction erreurs
│   ├── resume.md                # Reprise session
│   └── help.md                  # Aide contextuelle
├── skills/                       # Skills réutilisables
│   ├── state-management/        # Gestion .epct/
│   │   ├── SKILL.md
│   │   └── scripts/
│   │       └── state_manager.py
│   ├── project-detection/       # Détection contexte
│   │   ├── SKILL.md
│   │   └── scripts/
│   │       └── detect_stack.py  # (existant, déplacé)
│   └── phase-scoring/           # Calcul scores
│       ├── SKILL.md
│       └── references/
│           └── scoring-rules.md
├── references/                   # Doc de référence (existant)
│   ├── phases/
│   └── scoring/
├── tests/                        # Tests autonomes
│   ├── unit/
│   │   ├── test_state_management.py
│   │   └── test_detection.py
│   ├── integration/
│   │   ├── test_onboard_flow.sh
│   │   ├── test_projet_flow.sh
│   │   └── test_phase_transition.sh
│   ├── fixtures/
│   │   ├── fake-webapp/
│   │   ├── fake-api/
│   │   └── fake-empty/
│   └── run_all_tests.sh
└── README.md                     # Doc + dépendances
```

---

## 2. Gestion État `.epct/`

### Structure dans le projet cible

```
.epct/
├── state.json           # État courant du projet
├── session/
│   └── recovery.json    # Données de reprise de session
└── history/
    └── checkpoints/     # Snapshots pour rollback
        ├── 2026-01-06T10-30-00.json
        └── ...
```

### Format `state.json`

```json
{
  "version": "1.0.0",
  "project": {
    "name": "mon-app",
    "type": "webapp",
    "stack": ["typescript", "react", "vite"],
    "created_at": "2026-01-06T10:00:00Z"
  },
  "phase": {
    "current": 4,
    "name": "Développement",
    "started_at": "2026-01-05T14:00:00Z"
  },
  "scores": {
    "discovery": 85,
    "strategy": 70,
    "conception": 90,
    "development": 45,
    "quality": 0,
    "launch": 0,
    "growth": 0
  },
  "mode": "FEATURE",
  "current_feature": {
    "name": "User Authentication",
    "phase": 4,
    "chunks_completed": 2,
    "chunks_total": 5
  }
}
```

### Opérations state-management

| Fonction | Description |
|----------|-------------|
| `init` | Créer `.epct/` + `state.json` initial |
| `read` | Lire l'état courant |
| `update` | Modifier une propriété |
| `checkpoint` | Sauvegarder snapshot dans `history/` |
| `recover` | Restaurer depuis checkpoint |

---

## 3. Flux des Commandes

### `/projet` (point d'entrée unique)

```
/projet
    │
    ├─ 1. Exécuter skill project-detection
    │      └─ detect_stack.py → résultat
    │
    ├─ 2. Vérifier .epct/ existe ?
    │      │
    │      ├─ NON + pas de code → Menu "Nouveau projet"
    │      │      └─ Option: Démarrer (spawn superpowers:brainstorming)
    │      │
    │      ├─ NON + code détecté → Auto-spawn /onboard
    │      │      └─ Après audit → retour menu normal
    │      │
    │      └─ OUI → Menu normal (6 options)
    │             1. Ajouter feature (Mode FEATURE)
    │             2. Refacto/Quick fix (Mode QUICK)
    │             3. Checklist phase actuelle
    │             4. Phase suivante → /next
    │             5. Status complet → /status
    │             6. Ré-auditer → /onboard
    │
    └─ 3. Attendre choix utilisateur
```

### `/onboard` (audit complet)

```
/onboard
    │
    ├─ 1. DÉTECTION
    │      └─ Exécuter detect_stack.py
    │         → stack, structure, type projet
    │
    ├─ 2. SCORING
    │      └─ Exécuter skill phase-scoring
    │         → score par phase (0-100)
    │         → phase actuelle détectée
    │
    ├─ 3. RAPPORT
    │      └─ Afficher résultats visuels
    │
    ├─ 4. RECOMMANDATIONS
    │      └─ Top 3 actions prioritaires
    │
    └─ 5. INITIALISATION
           └─ Créer .epct/state.json
              (ou mettre à jour si existe)
```

### Commandes secondaires

| Commande | Rôle |
|----------|------|
| `/status` | Afficher état projet (phase, scores, progress) |
| `/next` | Vérifier Go/No-Go et proposer transition phase |
| `/fix` | Lister/corriger erreurs prioritaires |
| `/resume` | Restaurer contexte session précédente |
| `/help` | Aide contextuelle |

---

## 4. Intégration Superpowers

### Mapping Phases → Skills

| Phase ACT | Skill Superpowers | Quand |
|-----------|-------------------|-------|
| 1. Discovery | `superpowers:brainstorming` | Validation problème/besoin |
| 2. Stratégie | `superpowers:brainstorming` | Définition roadmap |
| 3. Conception | `superpowers:writing-plans` | Architecture détaillée |
| 4. Développement | `superpowers:test-driven-development` | Implémentation TDD |
| 5. Qualité | `superpowers:code-reviewer` | Review + validation |
| 6. Lancement | `superpowers:verification-before-completion` | Checks pré-deploy |
| 7. Croissance | `superpowers:systematic-debugging` | Optimisation |

### Orchestration

ACT gère l'état et les transitions, superpowers exécute les workflows.

---

## 5. Dépendances

### Plugins Claude Code (obligatoires)

| Plugin | Version min | Usage |
|--------|-------------|-------|
| `superpowers` | 3.6.0+ | Brainstorming, TDD, Plans, Reviews |

### Outils Système

| Outil | Usage |
|-------|-------|
| Python 3.8+ | Scripts de détection et gestion état |
| Git | Versioning et checkpoints |

---

## 6. Distribution

### Phase actuelle : Git + Symlink (Option B)

```bash
# Installation
git clone https://github.com/bonsai974/act-framework.git ~/projects/act
ln -s ~/projects/act/plugin ~/.claude/plugins/act

# Mise à jour
cd ~/projects/act && git pull
```

### Objectifs futurs

- **Option C** : Marketplace Claude Code (`claude plugins:install act`)
- **Option D** : Package npm (`npm install -g @bonsai974/act`)

### Structure livrable

```
act-framework/              # Repo GitHub
├── plugin/                 # ← Le plugin distribué
├── docs/                   # Documentation dev
├── test-apps/              # Tests internes
├── scripts/
│   └── install.sh          # Script d'installation
├── README.md               # Doc utilisateur
├── LICENSE
└── CHANGELOG.md
```

---

## 7. Tests Autonomes

### Structure

```
plugin/tests/
├── unit/
│   ├── test_state_management.py
│   └── test_detection.py
├── integration/
│   ├── test_onboard_flow.sh
│   ├── test_projet_flow.sh
│   └── test_phase_transition.sh
├── fixtures/
│   ├── fake-webapp/
│   ├── fake-api/
│   └── fake-empty/
└── run_all_tests.sh
```

### Exécution par phase

| Phase | Tests à exécuter |
|-------|------------------|
| Après Phase 1 | `test_state_management.py`, `test_detection.py` |
| Après Phase 2 | `test_onboard_flow.sh`, `test_projet_flow.sh` |
| Après Phase 3 | `test_phase_transition.sh` |
| Après Phase 4 | `run_all_tests.sh` (tout) |

---

## 8. Plan d'Implémentation

### Phase 1 : Fondations
- [ ] Restructurer plugin/ selon design
- [ ] Créer skill state-management + scripts
- [ ] Déplacer detect_stack.py → skills/project-detection/
- [ ] Mettre à jour plugin.json (manifest complet)
- [ ] Créer fixtures de test
- **CHECK** : `test_state_management.py` + `test_detection.py`

### Phase 2 : Entrée
- [ ] Réécrire /projet (instructions Claude)
- [ ] Réécrire /onboard (instructions Claude)
- [ ] Créer skill phase-scoring
- [ ] Implémenter rapport visuel
- **CHECK** : `test_onboard_flow.sh` + `test_projet_flow.sh`

### Phase 3 : Navigation
- [ ] Réécrire /status
- [ ] Réécrire /next (avec Go/No-Go)
- [ ] Réécrire /fix
- [ ] Réécrire /resume
- [ ] Réécrire /help
- **CHECK** : `test_phase_transition.sh`

### Phase 4 : Orchestration
- [ ] Intégration superpowers (spawn skills selon phase)
- [ ] README.md avec dépendances complètes
- [ ] Documentation utilisateur finale
- [ ] Script install.sh
- **CHECK** : `run_all_tests.sh` + test manuel workflow complet
