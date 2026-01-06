# Troubleshooting

## Problèmes Courants

### Plugin non reconnu

**Symptôme** : Les commandes `/onboard`, `/projet`, etc. ne fonctionnent pas.

**Solutions** :

1. Vérifier que le plugin est installé :
   ```bash
   ls ~/.claude/plugins/cache/
   ```

2. Réinstaller le plugin :
   ```bash
   ./scripts/install-local.sh
   ```

3. Redémarrer Claude Code

4. Vérifier le fichier de configuration :
   ```bash
   cat plugin/.claude-plugin/plugin.json
   ```

---

### Commande non trouvée

**Symptôme** : Erreur "command not found" pour une commande spécifique.

**Solutions** :

1. Vérifier que le fichier existe :
   ```bash
   ls plugin/commands/
   ```

2. Vérifier le frontmatter du fichier commande :
   ```yaml
   ---
   description: Description de la commande
   ---
   ```

3. Réinstaller le plugin et redémarrer Claude Code

---

### Erreur de phase/transition

**Symptôme** : Impossible de passer à la phase suivante.

**Solutions** :

1. Vérifier les critères Go/No-Go de la phase actuelle
2. Utiliser `/status` pour voir l'état du projet
3. Utiliser `/fix` pour corriger les erreurs bloquantes

---

### Tests qui échouent

**Symptôme** : `npm test` retourne des erreurs.

**Solutions** :

1. Vérifier que les dépendances sont installées :
   ```bash
   cd test-apps/[app-name]
   npm install
   ```

2. Vérifier la configuration TypeScript :
   ```bash
   cat tsconfig.json
   ```

3. Regarder les logs d'erreur en détail

---

### Context7 ne répond pas

**Symptôme** : Les recherches de documentation échouent.

**Solutions** :

1. Vérifier que le plugin Context7 est installé :
   ```bash
   grep "context7" ~/.claude/settings.json
   ```

2. Essayer avec un autre nom de bibliothèque

3. Vérifier la connexion réseau

---

## Logs et Debug

### Où trouver les logs

- **Claude Code** : Voir la sortie console
- **Plugin** : Pas de logs spécifiques (utiliser console.log dans les scripts)
- **Tests** : Sortie de npm test / pytest

### Activer le mode verbose

Pour les tests :
```bash
npm test -- --reporter=verbose
```

Pour pytest :
```bash
python -m pytest -v tests/
```

---

## Obtenir de l'Aide

1. Consulter la documentation dans `docs/`
2. Vérifier les handoffs précédents dans `docs/handoffs/`
3. Relire les rules dans `.claude/rules/`
