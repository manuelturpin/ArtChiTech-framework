# Installation — ACT Framework v2.7

## Prérequis

| Dépendance | Version | Requis |
|------------|---------|--------|
| Claude Code | Latest | Oui |
| Git | Any | Oui |
| Bash | 4.0+ | Oui |

> **Note:** ACT v2.7 n'a **aucune dépendance externe**. Tous les skills sont natifs.

---

## Installation rapide

### One-liner (recommandé)

```bash
# Installation locale (dans votre projet)
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash

# Installation globale (pour tous vos projets)
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash -s -- --global
```

### Depuis un clone local

```bash
git clone https://github.com/manuelturpin/ArtChiTech-framework.git
cd ArtChiTech-framework
./scripts/install.sh          # Local
./scripts/install.sh --global # Global
```

---

## Modes d'installation

### Installation locale (défaut)

Installe ACT dans le projet courant :

```
your-project/
└── .claude/
    └── commands/
        ├── act/           # 24 commandes ACT
        └── consider/      # 12 modèles de pensée
```

**Avantages :**
- Isolation par projet
- Versioning avec le projet
- Pas de pollution globale

### Installation globale

Installe ACT pour tous les projets :

```
~/.claude/
└── plugins/
    └── act/              # Plugin complet
```

**Avantages :**
- Une seule installation
- Disponible partout
- Mises à jour centralisées

---

## Après l'installation

### 1. Redémarrer Claude Code

Fermez et rouvrez Claude Code pour charger les nouvelles commandes.

### 2. Initialiser votre projet

```bash
/act:init
```

Cela crée le répertoire `.act/` avec les fichiers de contexte :

```
your-project/
├── .act/
│   ├── config.yaml     # Configuration
│   ├── state.md        # État courant
│   ├── plan.md         # Plan et phases
│   ├── findings.md     # Découvertes
│   └── progress.md     # Journal de session
└── ...
```

### 3. Vérifier l'installation

```bash
/act:status
```

---

## Skills natifs (v2.7+)

ACT v2.7 inclut 6 skills natifs sans dépendance externe :

| Skill | Chemin |
|-------|--------|
| Brainstorming | `@skills/brainstorming/SKILL.md` |
| TDD | `@skills/tdd/SKILL.md` |
| Code Review | `@skills/code-review/SKILL.md` |
| Debugging | `@skills/debugging/SKILL.md` |
| Verification | `@skills/verification/SKILL.md` |
| Writing Plans | `@skills/writing-plans/SKILL.md` |

Ces skills remplacent le plugin `superpowers` précédemment requis.

---

## Migration depuis superpowers

Si vous utilisiez le plugin `superpowers`, voir [MIGRATION-FROM-SUPERPOWERS.md](MIGRATION-FROM-SUPERPOWERS.md).

---

## Mise à jour

```bash
# Même commande que l'installation
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
```

Le script détecte une installation existante et la met à jour.

---

## Désinstallation

### Installation locale

```bash
rm -rf .claude/commands/act .claude/commands/consider
```

### Installation globale

```bash
rm -rf ~/.claude/plugins/act
```

---

## Troubleshooting

### "Commande /act:* non trouvée"

1. Redémarrer Claude Code
2. Vérifier que `.claude/commands/act/` existe (local) ou `~/.claude/plugins/act/` (global)

### "Erreur lors de l'installation"

```bash
# Vérifier les prérequis
git --version
bash --version

# Réessayer avec verbose
bash -x scripts/install.sh
```

### "Skills non chargés"

Les skills sont dans `skills/` du repo. Vérifier :
```bash
ls -la skills/
```

---

## Support

- **GitHub Issues:** https://github.com/manuelturpin/ArtChiTech-framework/issues
- **Documentation:** https://github.com/manuelturpin/ArtChiTech-framework#readme
