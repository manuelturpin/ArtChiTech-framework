# Extraction Phase 6 - Lancement

## 1. Résumé Exécutif

La Phase 6 - Lancement représente le point culminant du cycle de développement produit. Cette phase couvre l'ensemble du processus de mise en production, depuis la préparation technique jusqu'au suivi post-lancement.

Les éléments fondamentaux incluent :
- **Release Management** : Orchestration complète du déploiement selon les méthodologies ITIL, SAFe ou DevOps/SRE
- **Stratégies de déploiement** : Big Bang, Phased Rollout, Blue-Green, Canary, Rolling, Dark Launch
- **Feature Flags** : Contrôle granulaire des fonctionnalités avec découplage deploy/release
- **Monitoring et Observabilité** : SLI/SLO/SLA, alerting multi-window multi-burn rate
- **Incident Response** : War Room, Incident Command System, runbooks et playbooks
- **Go-to-Market** : Stratégies Sales-led, Product-led (PLG), Marketing-led
- **Post-mortem et Amélioration Continue** : Blameless culture, métriques DORA

La réussite du lancement repose sur une préparation rigoureuse (checklists), une exécution coordonnée (War Room), et une capacité de réaction rapide (rollback, hotfixes).

---

## 2. Checklist Complète

### 2.1 Infrastructure Readiness Checklist

| Item | Priorité |
|------|----------|
| Environnement de production provisionné | [NON-NÉGOCIABLE] |
| Configuration identique staging/prod | [NON-NÉGOCIABLE] |
| Scaling automatique configuré | [NON-NÉGOCIABLE] |
| Backup et recovery testés | [NON-NÉGOCIABLE] |
| Disaster recovery plan documenté | [NON-NÉGOCIABLE] |
| Monitoring et alerting opérationnels | [NON-NÉGOCIABLE] |
| Logs centralisés et accessibles | [NON-NÉGOCIABLE] |
| Secrets et credentials sécurisés | [NON-NÉGOCIABLE] |
| CDN et caching configurés | [NICE-TO-HAVE] |
| Performance baseline établie | [NON-NÉGOCIABLE] |

### 2.2 Code Readiness Checklist

| Item | Priorité |
|------|----------|
| Tous les tests passent (unit, integration, e2e) | [NON-NÉGOCIABLE] |
| Code review complété | [NON-NÉGOCIABLE] |
| Feature flags configurés | [NON-NÉGOCIABLE] |
| Database migrations testées | [NON-NÉGOCIABLE] |
| Rollback scripts prêts et testés | [NON-NÉGOCIABLE] |
| Dependencies à jour et sécurisées | [NON-NÉGOCIABLE] |
| Performance testing complété | [NON-NÉGOCIABLE] |
| Security scan passé | [NON-NÉGOCIABLE] |
| Documentation technique à jour | [NICE-TO-HAVE] |
| API versioning en place | [NON-NÉGOCIABLE] |

### 2.3 Team Readiness Checklist

| Item | Priorité |
|------|----------|
| On-call rotation définie | [NON-NÉGOCIABLE] |
| Runbooks créés et testés | [NON-NÉGOCIABLE] |
| Escalation path documenté | [NON-NÉGOCIABLE] |
| Communication channels établis | [NON-NÉGOCIABLE] |
| Training support complété | [NON-NÉGOCIABLE] |
| Stakeholders informés | [NON-NÉGOCIABLE] |
| Go/No-Go meeting schedulé | [NON-NÉGOCIABLE] |
| War room préparé | [NON-NÉGOCIABLE] |
| Post-mortem template prêt | [NICE-TO-HAVE] |
| Celebration planifiée | [NICE-TO-HAVE] |

### 2.4 Day-0 Checklist

```markdown
## Pré-déploiement
- [ ] Backup de la base de données
- [ ] Snapshot de l'infrastructure
- [ ] Communication aux stakeholders
- [ ] War room activé
- [ ] Monitoring dashboards ouverts

## Déploiement
- [ ] Déploiement initié
- [ ] Health checks verts
- [ ] Smoke tests passés
- [ ] Métriques normales
- [ ] Pas d'erreurs dans les logs

## Post-déploiement immédiat
- [ ] Feature flags activés progressivement
- [ ] Monitoring intensif (15-30 min)
- [ ] Validation fonctionnelle
- [ ] Communication de succès
- [ ] Documentation mise à jour
```

### 2.5 Post-Launch Checklist

```markdown
## H+1 (Première heure)
- [ ] Métriques de performance stables
- [ ] Pas d'augmentation des erreurs
- [ ] Feedback initial collecté
- [ ] Support briefé sur les nouveautés

## J+1 (Premier jour)
- [ ] Analyse des métriques d'adoption
- [ ] Review des tickets support
- [ ] Ajustements feature flags si nécessaire
- [ ] Communication interne des résultats

## S+1 (Première semaine)
- [ ] Post-mortem si incidents
- [ ] Analyse approfondie des métriques
- [ ] Collecte feedback utilisateurs
- [ ] Planning des quick wins identifiés

## M+1 (Premier mois)
- [ ] Review complète du lancement
- [ ] Documentation des learnings
- [ ] Mise à jour des processus
- [ ] Célébration des succès
```

### 2.6 Go-to-Market Checklist

```markdown
## Pré-lancement
- [ ] Messaging et positioning finalisés
- [ ] Assets marketing créés
- [ ] Landing page optimisée
- [ ] Email campaigns préparées
- [ ] Social media content schedulé
- [ ] Press kit ready
- [ ] Influencers/analysts briefés
- [ ] Internal enablement complété

## Jour du lancement
- [ ] Press release publiée
- [ ] Blog post live
- [ ] Social media activé
- [ ] Email blast envoyé
- [ ] Product Hunt launch (si applicable)
- [ ] Monitoring social sentiment

## Post-lancement
- [ ] Suivi couverture presse
- [ ] Analyse métriques acquisition
- [ ] Nurturing des leads
- [ ] Case studies en cours
- [ ] Feedback loop activé
```

---

## 3. Frameworks Détaillés

### 3.1 Stratégies de Déploiement

#### Big Bang Deployment

**Quand l'utiliser :**
- Applications simples ou MVPs
- Petites équipes
- Changements mineurs
- Environnements non-critiques

**Comment :**
```
┌─────────────────────────────────────────────────────┐
│                    Big Bang Deploy                   │
├─────────────────────────────────────────────────────┤
│                                                      │
│   [Version 1.0] ─────────────X──────── [Version 2.0]│
│                              │                       │
│                         Downtime                     │
│                         (minutes)                    │
│                                                      │
│   Avantages:                                         │
│   - Simple à exécuter                                │
│   - Pas de complexité d'infrastructure               │
│   - Coût minimal                                     │
│                                                      │
│   Inconvénients:                                     │
│   - Downtime requis                                  │
│   - Rollback complexe                                │
│   - Risque maximal                                   │
│                                                      │
└─────────────────────────────────────────────────────┘
```

**Pièges à éviter :**
- Déployer en heures de pointe
- Ne pas avoir de plan de rollback
- Sous-estimer le temps de downtime

#### Blue-Green Deployment

**Quand l'utiliser :**
- Applications critiques nécessitant zero downtime
- Quand un rollback instantané est requis
- Infrastructure cloud avec ressources élastiques

**Comment :**
```
┌─────────────────────────────────────────────────────┐
│                 Blue-Green Deployment                │
├─────────────────────────────────────────────────────┤
│                                                      │
│   ┌─────────────┐                 ┌─────────────┐   │
│   │    BLUE     │                 │    GREEN    │   │
│   │  (Current)  │                 │   (New)     │   │
│   │   v1.0      │                 │   v2.0      │   │
│   └──────┬──────┘                 └──────┬──────┘   │
│          │                               │          │
│          └───────────┐   ┌───────────────┘          │
│                      │   │                          │
│                 ┌────▼───▼────┐                     │
│                 │   ROUTER    │                     │
│                 │ Load Balancer│                    │
│                 └──────┬──────┘                     │
│                        │                            │
│                   [Traffic]                         │
│                                                      │
│   Process:                                          │
│   1. Deploy to Green (inactive)                     │
│   2. Test Green thoroughly                          │
│   3. Switch router to Green                         │
│   4. Blue becomes standby                           │
│   5. Rollback = switch back to Blue                 │
│                                                      │
└─────────────────────────────────────────────────────┘
```

**Exemple concret :**
```yaml
# Kubernetes Blue-Green avec Istio
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: my-app
spec:
  hosts:
  - my-app.example.com
  http:
  - route:
    - destination:
        host: my-app-blue
        port:
          number: 80
      weight: 0  # Switch to 100 for rollback
    - destination:
        host: my-app-green
        port:
          number: 80
      weight: 100  # New version
```

**Pièges à éviter :**
- Coût doublé de l'infrastructure
- Sessions utilisateur perdues au switch
- Base de données partagée = complexité migration

#### Canary Deployment

**Quand l'utiliser :**
- Changements majeurs à valider en production
- Large base utilisateurs
- Besoin de métriques réelles avant full rollout
- Features à fort impact business

**Comment :**
```
┌─────────────────────────────────────────────────────┐
│                  Canary Deployment                   │
├─────────────────────────────────────────────────────┤
│                                                      │
│   Traffic Distribution Over Time:                    │
│                                                      │
│   T0:  [████████████████████████████████████] 100%  │
│        └─────────── v1.0 (Stable) ──────────┘       │
│                                                      │
│   T1:  [███████████████████████████████░░░░] 95%    │
│        └─────────── v1.0 ──────────┘ └v2.0┘ 5%     │
│                                                      │
│   T2:  [█████████████████████████░░░░░░░░░] 75%     │
│        └────────── v1.0 ─────────┘ └─v2.0─┘ 25%    │
│                                                      │
│   T3:  [████████████████░░░░░░░░░░░░░░░░░░] 50%     │
│        └───── v1.0 ─────┘ └───── v2.0 ────┘ 50%    │
│                                                      │
│   T4:  [░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░] 0%      │
│        └─────────── v2.0 (New Stable) ────┘ 100%   │
│                                                      │
└─────────────────────────────────────────────────────┘
```

**Exemple concret :**
```yaml
# Argo Rollouts Canary Strategy
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: my-app
spec:
  replicas: 10
  strategy:
    canary:
      steps:
      - setWeight: 5
      - pause: {duration: 10m}
      - setWeight: 25
      - pause: {duration: 10m}
      - setWeight: 50
      - pause: {duration: 10m}
      - setWeight: 100
      analysis:
        templates:
        - templateName: success-rate
        startingStep: 1
```

**Pièges à éviter :**
- Canary trop petit pour être statistiquement significatif
- Pas de métriques de comparaison automatisées
- Rollback manuel au lieu d'automatique

#### Rolling Deployment

**Quand l'utiliser :**
- Applications stateless
- Infrastructure avec multiples instances
- Besoin de zero downtime
- Updates réguliers et fréquents

**Comment :**
```
┌─────────────────────────────────────────────────────┐
│                 Rolling Deployment                   │
├─────────────────────────────────────────────────────┤
│                                                      │
│   Initial State:                                     │
│   ┌────┐ ┌────┐ ┌────┐ ┌────┐ ┌────┐               │
│   │v1.0│ │v1.0│ │v1.0│ │v1.0│ │v1.0│               │
│   └────┘ └────┘ └────┘ └────┘ └────┘               │
│                                                      │
│   Step 1: (maxUnavailable: 1)                       │
│   ┌────┐ ┌────┐ ┌────┐ ┌────┐ ╔════╗               │
│   │v1.0│ │v1.0│ │v1.0│ │v1.0│ ║v2.0║               │
│   └────┘ └────┘ └────┘ └────┘ ╚════╝               │
│                                                      │
│   Step 2:                                           │
│   ┌────┐ ┌────┐ ┌────┐ ╔════╗ ╔════╗               │
│   │v1.0│ │v1.0│ │v1.0│ ║v2.0║ ║v2.0║               │
│   └────┘ └────┘ └────┘ ╚════╝ ╚════╝               │
│                                                      │
│   Final State:                                       │
│   ╔════╗ ╔════╗ ╔════╗ ╔════╗ ╔════╗               │
│   ║v2.0║ ║v2.0║ ║v2.0║ ║v2.0║ ║v2.0║               │
│   ╚════╝ ╚════╝ ╚════╝ ╚════╝ ╚════╝               │
│                                                      │
└─────────────────────────────────────────────────────┘
```

**Exemple concret :**
```yaml
# Kubernetes Rolling Update
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 5
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1        # Max pods above desired
      maxUnavailable: 1  # Max pods unavailable
  template:
    spec:
      containers:
      - name: app
        image: my-app:v2.0
        readinessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 5
```

**Pièges à éviter :**
- Pas de readiness probe
- maxUnavailable trop élevé
- Versions incompatibles coexistant

#### Dark Launch

**Quand l'utiliser :**
- Features à fort risque performance
- Changements backend majeurs
- Validation de charge en production
- Migrations de systèmes critiques

**Comment :**
```
┌─────────────────────────────────────────────────────┐
│                    Dark Launch                       │
├─────────────────────────────────────────────────────┤
│                                                      │
│   User Request                                       │
│        │                                            │
│        ▼                                            │
│   ┌─────────┐                                       │
│   │ Router  │                                       │
│   └────┬────┘                                       │
│        │                                            │
│   ┌────┴────┐                                       │
│   │         │                                       │
│   ▼         ▼                                       │
│ ┌─────┐  ┌─────┐                                   │
│ │ OLD │  │ NEW │ ◀── Dark (shadow traffic)         │
│ │     │  │     │     Results compared but          │
│ └──┬──┘  └──┬──┘     not returned to user          │
│    │        │                                       │
│    ▼        ╳ (discarded)                          │
│ [Response]                                          │
│                                                      │
│   Use cases:                                        │
│   - Database migration validation                   │
│   - New algorithm testing                           │
│   - Performance benchmarking                        │
│   - API compatibility checking                      │
│                                                      │
└─────────────────────────────────────────────────────┘
```

**Exemple concret (Traffic Mirroring avec Istio) :**
```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: my-service
spec:
  hosts:
  - my-service
  http:
  - route:
    - destination:
        host: my-service-v1
      weight: 100
    mirror:
      host: my-service-v2
    mirrorPercentage:
      value: 100.0
```

**Pièges à éviter :**
- Doubler la charge sur les dépendances
- Écriture en base depuis le dark path
- Pas de monitoring du dark path

### 3.2 Comparatif des Stratégies

```
┌─────────────────────────────────────────────────────────────────────┐
│                 COMPARATIF STRATÉGIES DE DÉPLOIEMENT                 │
├──────────────┬────────────┬─────────────┬───────────┬───────────────┤
│   Critère    │  Big Bang  │ Blue-Green  │  Canary   │   Rolling     │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Downtime     │    Oui     │    Non      │    Non    │     Non       │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Rollback     │  Complexe  │  Instantané │  Graduel  │   Graduel     │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Coût infra   │   Faible   │   Double    │  +10-50%  │    Normal     │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Risque       │   Élevé    │   Faible    │  Minimal  │    Moyen      │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Complexité   │   Faible   │   Moyenne   │  Élevée   │    Moyenne    │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Test en prod │    Non     │    Oui      │    Oui    │    Limité     │
├──────────────┼────────────┼─────────────┼───────────┼───────────────┤
│ Use case     │   MVP,     │  Critical   │ Features  │   Updates     │
│              │  Dev/Test  │   Apps      │  majeurs  │   réguliers   │
└──────────────┴────────────┴─────────────┴───────────┴───────────────┘
```

### 3.3 Feature Flags

**Types de Feature Flags :**

```
┌─────────────────────────────────────────────────────────────────────┐
│                      TYPES DE FEATURE FLAGS                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  1. RELEASE TOGGLES                                                  │
│     ├── Durée: Courte (jours/semaines)                              │
│     ├── Usage: Découpler deploy de release                          │
│     └── Exemple: Activer nouvelle feature progressivement           │
│                                                                      │
│  2. EXPERIMENT TOGGLES (A/B Tests)                                   │
│     ├── Durée: Variable (semaines/mois)                             │
│     ├── Usage: Tester variations avec métriques                     │
│     └── Exemple: Tester deux versions de checkout                   │
│                                                                      │
│  3. OPS TOGGLES (Circuit Breakers)                                   │
│     ├── Durée: Longue (permanents)                                  │
│     ├── Usage: Contrôle opérationnel runtime                        │
│     └── Exemple: Désactiver feature coûteuse sous charge            │
│                                                                      │
│  4. PERMISSION TOGGLES                                               │
│     ├── Durée: Longue (permanents)                                  │
│     ├── Usage: Features spécifiques à des segments                  │
│     └── Exemple: Features premium, beta testers                     │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Exemple concret avec LaunchDarkly :**
```javascript
// Configuration côté serveur
const LaunchDarkly = require('launchdarkly-node-server-sdk');
const client = LaunchDarkly.init('YOUR_SDK_KEY');

// Évaluation d'un feature flag
async function getFeature(user) {
  const showNewCheckout = await client.variation(
    'new-checkout-flow',  // Flag key
    {
      key: user.id,
      email: user.email,
      custom: {
        plan: user.subscriptionPlan,
        country: user.country,
        betaTester: user.isBetaTester
      }
    },
    false  // Default value
  );

  return showNewCheckout;
}

// Targeting rules (dans LaunchDarkly UI)
/*
  Rule 1: Beta Testers
  - If betaTester = true → Serve: true

  Rule 2: Gradual Rollout
  - Percentage rollout: 25% → Serve: true

  Default: false
*/
```

**Outils Feature Flags :**

| Outil | Type | Particularité | Pricing |
|-------|------|---------------|---------|
| LaunchDarkly | SaaS | Leader, très complet | $$$ |
| Split.io | SaaS | Focus experimentation | $$ |
| Flagsmith | Open Source / SaaS | Self-hosted possible | $ - $$ |
| Unleash | Open Source | Self-hosted, gratuit | Gratuit |
| ConfigCat | SaaS | Simple, économique | $ |
| AWS AppConfig | Cloud | Intégré AWS | Usage-based |

### 3.4 Rollback Procedures

**Framework de Décision Rollback :**

```
┌─────────────────────────────────────────────────────────────────────┐
│                    ROLLBACK DECISION FRAMEWORK                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│                         Incident Détecté                             │
│                              │                                       │
│                              ▼                                       │
│                    ┌─────────────────┐                              │
│                    │ Impact Business │                              │
│                    │    > Seuil ?    │                              │
│                    └────────┬────────┘                              │
│                             │                                        │
│              ┌──────────────┴──────────────┐                        │
│              │ OUI                    NON  │                        │
│              ▼                             ▼                        │
│    ┌─────────────────┐           ┌─────────────────┐               │
│    │ Fix possible    │           │ Monitoring      │               │
│    │ < 15 minutes ?  │           │ Continu         │               │
│    └────────┬────────┘           └─────────────────┘               │
│             │                                                        │
│    ┌────────┴────────┐                                              │
│    │ OUI        NON  │                                              │
│    ▼                 ▼                                              │
│ ┌─────────┐    ┌──────────┐                                         │
│ │HOTFIX   │    │ ROLLBACK │                                         │
│ │Forward  │    │ Immédiat │                                         │
│ └─────────┘    └──────────┘                                         │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Procédure de Rollback :**

```bash
#!/bin/bash
# rollback.sh - Script de rollback automatisé

set -e

# Variables
PREVIOUS_VERSION=${1:-$(get_previous_version)}
CURRENT_VERSION=$(get_current_version)
ROLLBACK_REASON=${2:-"Manual rollback initiated"}

echo "=== INITIATING ROLLBACK ==="
echo "From: $CURRENT_VERSION"
echo "To: $PREVIOUS_VERSION"
echo "Reason: $ROLLBACK_REASON"

# 1. Notifier l'équipe
notify_slack "#deployments" "🔄 Rollback initiated: $CURRENT_VERSION → $PREVIOUS_VERSION"

# 2. Snapshot avant rollback
take_snapshot "pre-rollback-$CURRENT_VERSION"

# 3. Exécuter le rollback
case $DEPLOYMENT_STRATEGY in
  "blue-green")
    # Switch traffic to previous environment
    switch_traffic_to $PREVIOUS_ENVIRONMENT
    ;;
  "kubernetes")
    # Rollback Kubernetes deployment
    kubectl rollout undo deployment/$APP_NAME -n $NAMESPACE
    kubectl rollout status deployment/$APP_NAME -n $NAMESPACE
    ;;
  "feature-flag")
    # Disable feature flag
    disable_feature_flag $FEATURE_FLAG_KEY
    ;;
esac

# 4. Vérifier le rollback
run_smoke_tests
verify_health_checks

# 5. Notifier le succès
notify_slack "#deployments" "✅ Rollback completed successfully"

# 6. Créer incident pour post-mortem
create_incident_ticket "$ROLLBACK_REASON"

echo "=== ROLLBACK COMPLETE ==="
```

**Tests de Rollback (à effectuer régulièrement) :**

```markdown
## Rollback Test Checklist

### Préparation
- [ ] Environnement de test identique à la production
- [ ] Version N-1 disponible et déployable
- [ ] Scripts de rollback à jour
- [ ] Équipe informée du test

### Exécution
- [ ] Déployer version N (nouvelle)
- [ ] Créer des données de test
- [ ] Initier le rollback vers N-1
- [ ] Chronomètre: temps de rollback < 5 min

### Validation
- [ ] Application fonctionnelle après rollback
- [ ] Données utilisateur préservées
- [ ] Pas de corruption de données
- [ ] Logs et métriques corrects
- [ ] Sessions utilisateur maintenues (si applicable)

### Documentation
- [ ] Temps de rollback documenté
- [ ] Issues rencontrées notées
- [ ] Scripts mis à jour si nécessaire
```

### 3.5 SLI/SLO/SLA Framework (Google SRE)

```
┌─────────────────────────────────────────────────────────────────────┐
│                        SLI / SLO / SLA                               │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  SLI (Service Level Indicator)                                       │
│  └── Métrique quantitative du service                                │
│      Exemple: "Ratio des requêtes répondues en moins de 200ms"       │
│                                                                      │
│  SLO (Service Level Objective)                                       │
│  └── Cible pour un SLI                                               │
│      Exemple: "99.9% des requêtes en moins de 200ms sur 30 jours"    │
│                                                                      │
│  SLA (Service Level Agreement)                                       │
│  └── Contrat avec conséquences                                       │
│      Exemple: "Si SLO non atteint, crédit de 10% sur la facture"     │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │                    RELATION                                  │    │
│  │                                                              │    │
│  │  SLI ──mesure──▶ SLO ──garantit──▶ SLA                      │    │
│  │  (Quoi)         (Combien)         (Conséquences)            │    │
│  │                                                              │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Exemples Concrets :**

```yaml
# Exemple de définition SLI/SLO
service: payment-api

slis:
  - name: availability
    description: "Proportion of successful requests"
    formula: "successful_requests / total_requests"

  - name: latency_p99
    description: "99th percentile request latency"
    formula: "histogram_quantile(0.99, request_duration)"

slos:
  - name: availability_slo
    sli: availability
    target: 99.95
    window: 30d

  - name: latency_slo
    sli: latency_p99
    target: 200  # milliseconds
    window: 30d

error_budget:
  # Avec SLO 99.95%, on a 0.05% d'error budget
  # Sur 30 jours = 43,200 minutes
  # Error budget = 43,200 * 0.0005 = 21.6 minutes de downtime autorisé
  monthly_budget_minutes: 21.6

alerts:
  - name: error_budget_burn_rate
    condition: "burn_rate > 14.4"  # Consuming budget 14x faster than sustainable
    severity: critical
    action: page_oncall
```

**Error Budget Policy :**

```markdown
## Error Budget Policy

### Quand le budget est disponible (> 50%)
- Déploiements normaux autorisés
- Expérimentations permises
- Focus sur les nouvelles features

### Quand le budget est bas (10-50%)
- Review approfondie avant chaque déploiement
- Pas d'expérimentations risquées
- Focus sur la stabilité

### Quand le budget est épuisé (< 10%)
- FREEZE des déploiements non-critiques
- Focus 100% sur la fiabilité
- Toute l'équipe sur les fixes

### Restauration du budget
- Le budget se régénère avec le temps
- Actions proactives pour améliorer SLIs
- Post-mortem obligatoire pour chaque incident
```

### 3.6 Alerting Multi-Window Multi-Burn Rate

```
┌─────────────────────────────────────────────────────────────────────┐
│              MULTI-WINDOW MULTI-BURN RATE ALERTING                   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  Concept: Alerter basé sur la vitesse de consommation du budget      │
│                                                                      │
│  Burn Rate = Vitesse de consommation de l'error budget               │
│  - Burn rate 1 = consommation normale (budget épuisé en 30 jours)   │
│  - Burn rate 14.4 = consommation rapide (budget épuisé en 2 jours)  │
│  - Burn rate 6 = consommation moyenne (budget épuisé en 5 jours)    │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │         Multi-Window Configuration                          │    │
│  ├──────────────┬───────────────┬─────────────┬───────────────┤    │
│  │  Severity    │  Long Window  │ Short Window│  Burn Rate    │    │
│  ├──────────────┼───────────────┼─────────────┼───────────────┤    │
│  │  Critical    │    1 hour     │   5 min     │    14.4       │    │
│  │  Warning     │    6 hours    │   30 min    │    6          │    │
│  │  Ticket      │    24 hours   │   6 hours   │    1          │    │
│  └──────────────┴───────────────┴─────────────┴───────────────┘    │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Implémentation Prometheus :**

```yaml
# prometheus-rules.yaml
groups:
  - name: slo-alerts
    rules:
      # Critical: Burn rate 14.4x sur 1h et 5min
      - alert: HighErrorBudgetBurn_Critical
        expr: |
          (
            job:slo_errors_per_request:ratio_rate1h{job="api"} > (14.4 * 0.001)
            and
            job:slo_errors_per_request:ratio_rate5m{job="api"} > (14.4 * 0.001)
          )
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: "High error budget burn rate"
          description: "Burning error budget at 14.4x rate"

      # Warning: Burn rate 6x sur 6h et 30min
      - alert: HighErrorBudgetBurn_Warning
        expr: |
          (
            job:slo_errors_per_request:ratio_rate6h{job="api"} > (6 * 0.001)
            and
            job:slo_errors_per_request:ratio_rate30m{job="api"} > (6 * 0.001)
          )
        for: 5m
        labels:
          severity: warning
```

### 3.7 War Room Organization

```
┌─────────────────────────────────────────────────────────────────────┐
│                       WAR ROOM STRUCTURE                             │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │                   INCIDENT COMMANDER (IC)                    │    │
│  │                  Décisions finales, coordination             │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                              │                                       │
│          ┌───────────────────┼───────────────────┐                  │
│          ▼                   ▼                   ▼                  │
│  ┌───────────────┐   ┌───────────────┐   ┌───────────────┐         │
│  │   TECH LEAD   │   │   COMMS LEAD  │   │   OPS LEAD    │         │
│  │   Diagnostic  │   │ Communication │   │  Infrastructure│         │
│  │   & Fix       │   │    externe    │   │   & Rollback   │         │
│  └───────┬───────┘   └───────────────┘   └───────┬───────┘         │
│          │                                        │                  │
│          ▼                                        ▼                  │
│  ┌───────────────┐                       ┌───────────────┐          │
│  │  SCRIBE       │                       │  SUBJECT      │          │
│  │  Documentation│                       │  MATTER       │          │
│  │  temps réel   │                       │  EXPERTS      │          │
│  └───────────────┘                       └───────────────┘          │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Rôles Détaillés :**

```markdown
## Incident Commander (IC)
- **Responsabilité**: Coordination globale, décisions finales
- **Actions**:
  - Déclare le niveau de sévérité
  - Assigne les rôles
  - Prend les décisions Go/No-Go (rollback, etc.)
  - Communique avec le management

## Tech Lead
- **Responsabilité**: Investigation technique et résolution
- **Actions**:
  - Coordonne le diagnostic
  - Propose des solutions
  - Implémente ou supervise le fix
  - Valide la résolution

## Communications Lead
- **Responsabilité**: Communication externe et interne
- **Actions**:
  - Rédige les status updates
  - Communique avec le support
  - Met à jour la status page
  - Informe les stakeholders

## Ops Lead
- **Responsabilité**: Infrastructure et opérations
- **Actions**:
  - Exécute les rollbacks si nécessaire
  - Gère les ressources infrastructure
  - Coordonne avec les providers cloud
  - Assure la continuité de service

## Scribe
- **Responsabilité**: Documentation temps réel
- **Actions**:
  - Note toutes les actions et décisions
  - Maintient la timeline
  - Prépare le matériel pour le post-mortem
  - Archive les logs et screenshots
```

**Protocol de Communication War Room :**

```markdown
## Canaux de Communication

### Slack/Teams
- #incident-[YYYYMMDD]-[nom] : Canal principal
- Tous les updates dans le canal
- Pas de DMs pendant l'incident

### Appel Vidéo (pour P1/P2)
- War room Zoom/Meet permanent
- Mic mutés sauf quand on parle
- Caméra optionnelle

### Status Updates
- Fréquence: Toutes les 15-30 minutes
- Format standardisé (voir template)
- Distribution: Stakeholders + Status Page

## Template Status Update
```
**Incident: [Titre]**
**Statut: [Investigating | Identified | Monitoring | Resolved]**
**Sévérité: [P1 | P2 | P3 | P4]**
**Dernier update: [Timestamp]**

**Impact actuel:**
[Description de l'impact utilisateur]

**Ce que nous faisons:**
[Actions en cours]

**Prochaine update:** [Timestamp]
```
```

### 3.8 Incident Severity Levels

```
┌─────────────────────────────────────────────────────────────────────┐
│                    INCIDENT SEVERITY LEVELS                          │
├──────┬──────────────────────────────────────────────────────────────┤
│      │                                                               │
│  P1  │  CRITICAL                                                     │
│      │  - Service complètement down                                  │
│      │  - Impact: Tous les utilisateurs                             │
│      │  - Revenue impacté significativement                         │
│      │  - Réponse: < 15 minutes, 24/7                               │
│      │  - Exemple: Paiements impossibles, data breach               │
│      │                                                               │
├──────┼──────────────────────────────────────────────────────────────┤
│      │                                                               │
│  P2  │  HIGH                                                         │
│      │  - Fonctionnalité majeure down                               │
│      │  - Impact: Segment significatif d'utilisateurs              │
│      │  - Workaround possible mais pénible                         │
│      │  - Réponse: < 30 minutes, business hours                    │
│      │  - Exemple: Search ne fonctionne pas, exports cassés        │
│      │                                                               │
├──────┼──────────────────────────────────────────────────────────────┤
│      │                                                               │
│  P3  │  MEDIUM                                                       │
│      │  - Fonctionnalité mineure impactée                           │
│      │  - Impact: Petit groupe d'utilisateurs                       │
│      │  - Workaround facile disponible                             │
│      │  - Réponse: < 4 heures, business hours                      │
│      │  - Exemple: Widget dashboard cassé, typo UI                 │
│      │                                                               │
├──────┼──────────────────────────────────────────────────────────────┤
│      │                                                               │
│  P4  │  LOW                                                          │
│      │  - Issue cosmétique ou minor bug                             │
│      │  - Impact: Négligeable                                       │
│      │  - Pas de workaround nécessaire                             │
│      │  - Réponse: Best effort                                      │
│      │  - Exemple: Mauvais alignement CSS, message peu clair       │
│      │                                                               │
└──────┴──────────────────────────────────────────────────────────────┘
```

### 3.9 Runbooks vs Playbooks

```
┌─────────────────────────────────────────────────────────────────────┐
│                    RUNBOOKS vs PLAYBOOKS                             │
├──────────────────────────────┬──────────────────────────────────────┤
│         RUNBOOK              │            PLAYBOOK                   │
├──────────────────────────────┼──────────────────────────────────────┤
│                              │                                       │
│  • Procédure spécifique      │  • Guide de réponse générique        │
│  • Étapes détaillées         │  • Framework de décision             │
│  • Automatisable             │  • Requiert jugement humain          │
│  • Un problème = Un runbook  │  • Une catégorie = Un playbook       │
│                              │                                       │
│  Exemple:                    │  Exemple:                            │
│  "Redémarrer le service X    │  "Répondre à un incident de         │
│   quand l'erreur Y apparaît" │   performance dégradée"             │
│                              │                                       │
│  Contenu type:               │  Contenu type:                       │
│  - Commandes exactes         │  - Arbre de décision                 │
│  - Scripts à exécuter        │  - Questions de diagnostic          │
│  - Outputs attendus          │  - Options de résolution            │
│  - Critères de succès        │  - Quand escalader                   │
│                              │                                       │
└──────────────────────────────┴──────────────────────────────────────┘
```

**Exemple Runbook :**

```markdown
# Runbook: Database Connection Pool Exhausted

## Trigger
Alert: `db_connection_pool_usage > 90%`

## Impact
Users may experience slow queries or timeouts

## Steps

### 1. Verify the issue
```bash
# Check current connections
kubectl exec -it postgres-0 -- psql -c "SELECT count(*) FROM pg_stat_activity;"

# Check pool stats
curl http://app-service:8080/actuator/metrics/hikaricp.connections.active
```

### 2. Identify the cause
```bash
# Find long-running queries
kubectl exec -it postgres-0 -- psql -c "
  SELECT pid, now() - pg_stat_activity.query_start AS duration, query
  FROM pg_stat_activity
  WHERE state = 'active'
  ORDER BY duration DESC
  LIMIT 10;
"
```

### 3. Remediation
```bash
# Option A: Kill long-running queries
kubectl exec -it postgres-0 -- psql -c "SELECT pg_terminate_backend(<pid>);"

# Option B: Increase pool size (temporary)
kubectl set env deployment/app POOL_SIZE=50

# Option C: Scale up app instances
kubectl scale deployment/app --replicas=5
```

### 4. Verify resolution
```bash
# Confirm connections dropped
curl http://app-service:8080/actuator/metrics/hikaricp.connections.active
# Expected: < 70% of max pool size
```

## Escalation
If not resolved in 15 minutes, escalate to Database Team
```

### 3.10 Disaster Recovery - RTO/RPO

```
┌─────────────────────────────────────────────────────────────────────┐
│                         RTO vs RPO                                   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  Timeline d'un incident:                                             │
│                                                                      │
│  ──────────────────────────────────────────────────────────────────  │
│         │                    │                      │                │
│     Last backup          Incident              Recovery              │
│         │                    │                      │                │
│         │◀────── RPO ───────▶│                      │                │
│         │  (Data loss)       │◀─────── RTO ────────▶│                │
│         │                    │     (Downtime)       │                │
│                                                                      │
│  RPO (Recovery Point Objective)                                      │
│  └── Combien de données peut-on perdre ?                            │
│      - RPO 0: Aucune perte (réplication synchrone)                  │
│      - RPO 1h: Maximum 1h de données perdues                        │
│      - RPO 24h: Maximum 1 jour de données perdues                   │
│                                                                      │
│  RTO (Recovery Time Objective)                                       │
│  └── Combien de temps pour restaurer le service ?                   │
│      - RTO 0: Aucun downtime (haute disponibilité)                  │
│      - RTO 1h: Service restauré en max 1 heure                      │
│      - RTO 24h: Service restauré en max 1 jour                      │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Stratégies par RTO/RPO :**

```
┌─────────────────────────────────────────────────────────────────────┐
│              DISASTER RECOVERY STRATEGIES                            │
├─────────────────────┬─────────────────┬─────────────────────────────┤
│     Stratégie       │    RTO / RPO    │    Coût relatif            │
├─────────────────────┼─────────────────┼─────────────────────────────┤
│ Backup & Restore    │ Heures / Heures │ $ (le moins cher)          │
│ Pilot Light         │ 10min+ / Minutes│ $$                         │
│ Warm Standby        │ Minutes / ~0    │ $$$                        │
│ Multi-site Active   │ ~0 / 0          │ $$$$ (le plus cher)        │
└─────────────────────┴─────────────────┴─────────────────────────────┘
```

### 3.11 Go-to-Market Frameworks

```
┌─────────────────────────────────────────────────────────────────────┐
│                   GO-TO-MARKET STRATEGIES                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │                      SALES-LED                               │    │
│  ├─────────────────────────────────────────────────────────────┤    │
│  │  • Équipe commerciale comme moteur principal                │    │
│  │  • Cycles de vente longs, deals importants                  │    │
│  │  • CAC élevé mais LTV élevée                                │    │
│  │  • Typique: Enterprise B2B, solutions complexes             │    │
│  │  • Métriques: SQL, Win Rate, Deal Size, Sales Cycle         │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │                    PRODUCT-LED (PLG)                         │    │
│  ├─────────────────────────────────────────────────────────────┤    │
│  │  • Le produit lui-même drive l'acquisition                  │    │
│  │  • Free tier ou trial gratuit                               │    │
│  │  • Self-service onboarding                                  │    │
│  │  • Typique: SaaS B2B/B2C, outils développeurs              │    │
│  │  • Métriques: Activation, PQL, Time-to-Value, NRR          │    │
│  │  • Exemples: Slack, Notion, Figma, Datadog                  │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │                    MARKETING-LED                             │    │
│  ├─────────────────────────────────────────────────────────────┤    │
│  │  • Brand et content comme moteurs                           │    │
│  │  • Inbound marketing, thought leadership                    │    │
│  │  • Typique: B2C, SMB B2B                                    │    │
│  │  • Métriques: MQL, CAC, Brand awareness, Organic traffic   │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### 3.12 FTUE (First-Time User Experience) et Aha Moment

```
┌─────────────────────────────────────────────────────────────────────┐
│                    FTUE & AHA MOMENT                                 │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  FTUE (First-Time User Experience)                                   │
│  └── L'expérience du premier usage du produit                       │
│                                                                      │
│  Aha Moment                                                          │
│  └── L'instant où l'utilisateur comprend la valeur                  │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │                    User Journey                              │    │
│  │                                                              │    │
│  │  Signup ──▶ Onboarding ──▶ AHA! ──▶ Activation ──▶ Retention│    │
│  │     │           │           │            │                   │    │
│  │     │           │           └── Core action completed        │    │
│  │     │           └── Guide vers la valeur                    │    │
│  │     └── Friction minimale                                    │    │
│  │                                                              │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                      │
│  Exemples de Aha Moments:                                           │
│  • Slack: Premier message dans un channel                           │
│  • Dropbox: Premier fichier synchronisé                             │
│  • Twitter: Suivre 10+ comptes                                      │
│  • Facebook: 7 amis en 10 jours                                     │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 4. Métriques et KPIs

### 4.1 Métriques DORA

| Métrique | Définition | Cible (Elite) | Red Flag | Outil |
|----------|------------|---------------|----------|-------|
| Deployment Frequency | Fréquence des déploiements en production | Multiple fois par jour | < 1x par mois | GitHub Actions, Jenkins, Sleuth |
| Lead Time for Changes | Temps entre commit et production | < 1 heure | > 1 mois | GitLab, LinearB, Sleuth |
| Change Failure Rate | % de déploiements causant un incident | < 15% | > 46% | PagerDuty, Datadog, Sleuth |
| Mean Time to Recovery (MTTR) | Temps moyen pour restaurer le service | < 1 heure | > 1 semaine | PagerDuty, Datadog, Rootly |

### 4.2 Métriques SRE

| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| Availability | % du temps où le service est up | 99.9%+ | < 99% | Datadog, New Relic, Prometheus |
| Latency P50 | Latence médiane des requêtes | < 100ms | > 500ms | Datadog, Grafana, Lightstep |
| Latency P99 | Latence 99ème percentile | < 500ms | > 2s | Datadog, Grafana, Lightstep |
| Error Rate | % de requêtes en erreur | < 0.1% | > 1% | Sentry, Datadog, Prometheus |
| Throughput | Requêtes par seconde | Baseline +/- 10% | -50% du baseline | Prometheus, Datadog |
| Error Budget Burn Rate | Vitesse de consommation budget | < 1x | > 10x | Nobl9, Datadog, custom |

### 4.3 Métriques Product/Launch

| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| Activation Rate | % nouveaux users atteignant "aha moment" | > 40% | < 15% | Amplitude, Mixpanel, Heap |
| Time to Value | Temps jusqu'à première valeur | < 5 min | > 1 jour | Amplitude, Pendo |
| Feature Adoption | % users utilisant nouvelle feature | > 30% (semaine 1) | < 5% | Amplitude, PostHog |
| NPS | Net Promoter Score | > 50 | < 0 | Delighted, SurveyMonkey |
| DAU/MAU | Ratio daily/monthly active users | > 20% | < 10% | Amplitude, Mixpanel |
| Churn Rate | % users perdus par période | < 5%/mois | > 10%/mois | ChartMogul, Baremetrics |

### 4.4 Métriques Infrastructure

| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| CPU Utilization | Usage CPU moyen | 40-70% | > 90% sustained | Prometheus, CloudWatch, Datadog |
| Memory Utilization | Usage mémoire | 60-80% | > 95% | Prometheus, CloudWatch, Datadog |
| Disk I/O | Opérations disque | Baseline | 3x baseline | Prometheus, CloudWatch |
| Network Throughput | Débit réseau | Baseline | Saturation | Prometheus, CloudWatch |
| Connection Pool Usage | Connections DB actives | < 70% pool | > 90% pool | HikariCP metrics, Prometheus |
| Queue Depth | Messages en attente | < 1000 | > 10000 | RabbitMQ, SQS, Kafka metrics |

### 4.5 Métriques Go-to-Market

| Métrique | Définition | Cible | Red Flag | Outil |
|----------|------------|-------|----------|-------|
| Signups | Nouveaux inscriptions | +20% vs baseline | -30% | Segment, Amplitude |
| MQL (Marketing Qualified Lead) | Leads qualifiés marketing | Variable | Chute > 30% | HubSpot, Marketo |
| SQL (Sales Qualified Lead) | Leads qualifiés ventes | Variable | Ratio MQL→SQL < 10% | Salesforce, HubSpot |
| CAC (Customer Acquisition Cost) | Coût d'acquisition client | < LTV/3 | > LTV | ChartMogul, interne |
| Conversion Rate | Taux de conversion trial→paid | > 5% | < 1% | Stripe, ChartMogul |
| Time to First Value | Temps jusqu'à première valeur | < 24h | > 7 jours | Amplitude, Pendo |

---

## 5. Anti-patterns Détaillés

### 5.1 Anti-patterns Déploiement

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| Friday Deploy | Déploiements le vendredi après-midi | Incidents weekend, équipe épuisée | No-deploy window ven 14h-lun 10h |
| YOLO Deploy | Déploiement sans tests ni review | Bugs en production, rollbacks fréquents | CI/CD obligatoire, gates de qualité |
| Hotfix Cascade | Hotfix sur hotfix sans fix racine | Dette technique, instabilité | Post-mortem obligatoire, root cause analysis |
| Big Bang Everything | Toutes les features d'un coup | Risque maximal, debug difficile | Feature flags, déploiement progressif |
| Deploy and Pray | Aucun monitoring post-deploy | Incidents non détectés | Smoke tests automatiques, observabilité |
| Manual Deploy | Déploiement manuel sans automation | Erreurs humaines, non reproductible | Infrastructure as Code, CI/CD |

### 5.2 Anti-patterns Monitoring

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| Alert Fatigue | Trop d'alertes, équipe les ignore | Vrais incidents manqués | Tuning des seuils, SLO-based alerting |
| Dashboard Overload | 50+ dashboards non maintenus | Information perdue, confusion | Dashboard hierarchy, ownership clair |
| Metric Without Context | Métriques sans baseline ni SLO | Impossible de savoir si c'est normal | Établir baselines, définir SLOs |
| Log Noise | Logs verbeux sans structure | Debug impossible | Structured logging, log levels appropriés |
| Missing Correlation IDs | Pas de trace cross-services | Debug distribué impossible | Distributed tracing obligatoire |

### 5.3 Anti-patterns Incident Response

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| Hero Culture | Une personne résout tout | SPOF, burnout | On-call rotation, documentation |
| Blame Game | Recherche du coupable | Peur de reporter incidents | Blameless post-mortems |
| Post-mortem Skip | Pas de review après incident | Mêmes incidents répétés | Post-mortem obligatoire dans 48h |
| Spaghetti Communication | Infos éparpillées partout | Confusion, décisions lentes | War room organisé, rôles clairs |
| Fix First, Understand Later | Rush sur le fix sans diagnostic | Mauvais fix, récurrence | Diagnostic avant remédiation |

### 5.4 Anti-patterns Launch

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| Silent Launch | Launch sans communication | Users surpris, confusion | Plan comms structuré |
| Over-Hype | Promesses excessives | Déception, churn | Attentes réalistes, soft launch |
| No Rollback Plan | Pas de plan B | Blocage en cas de problème | Rollback testé avant launch |
| Support Blindside | Support non préparé | Tickets mal gérés, frustration | Training support pré-launch |
| Metrics Vacuum | Pas de métriques de succès | Impossible d'évaluer le launch | KPIs définis avant launch |

### 5.5 Anti-patterns Feature Flags

| Anti-pattern | Symptôme | Impact | Prévention |
|--------------|----------|--------|------------|
| Flag Debt | Flags jamais nettoyés | Code complexe, bugs subtils | TTL sur les flags, cleanup sprints |
| Flag Explosion | Trop de flags interdépendants | Combinatoires impossibles à tester | Architecture simple, limiter le nombre |
| Kill Switch Absent | Pas de flag pour désactiver | Impossible de rollback feature | Kill switch obligatoire par feature |
| Flag in Flag | Flags imbriqués | Logique incompréhensible | Flat structure, pas de nesting |
| No Owner | Flags sans responsable | Personne pour les cleanup | Ownership obligatoire à la création |

---

## 6. Outils Recommandés

### 6.1 Déploiement & CI/CD

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| CI/CD | GitHub Actions | Pipeline intégré GitHub | GitLab CI, Jenkins, CircleCI |
| CD Kubernetes | ArgoCD | GitOps pour Kubernetes | Flux, Spinnaker |
| Deployment | Spinnaker | Pipelines de déploiement avancés | Harness, Octopus Deploy |
| Progressive Delivery | Argo Rollouts | Canary, Blue-Green sur K8s | Flagger, Istio |
| IaC | Terraform | Infrastructure as Code | Pulumi, CloudFormation |
| Config Management | Ansible | Configuration serveurs | Chef, Puppet |

### 6.2 Feature Flags

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| Feature Management | LaunchDarkly | Feature flags enterprise | Split.io, Flagsmith |
| Open Source | Unleash | Feature flags self-hosted | Flagsmith (self-hosted) |
| Cloud-native | AWS AppConfig | Config + flags AWS | GCP Remote Config |
| Simple | ConfigCat | Feature flags simples | Flagr |

### 6.3 Monitoring & Observabilité

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| APM | Datadog | Monitoring complet SaaS | New Relic, Dynatrace |
| Metrics | Prometheus | Métriques open source | InfluxDB, Victoria Metrics |
| Dashboards | Grafana | Visualisation métriques | Datadog Dashboards, Kibana |
| Logs | Elastic Stack (ELK) | Centralisation logs | Loki, Splunk, Datadog Logs |
| Tracing | Jaeger | Distributed tracing | Zipkin, Lightstep, Datadog APM |
| Error Tracking | Sentry | Tracking erreurs | Bugsnag, Raygun, Rollbar |

### 6.4 Incident Management

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| On-call | PagerDuty | Alerting et on-call | OpsGenie, VictorOps |
| Status Page | Statuspage.io | Communication incidents | Cachet, Sorry |
| Incident Response | Rootly | Automatisation incidents | incident.io, FireHydrant |
| Post-mortem | Blameless | Documentation incidents | Jeli, manuel (Notion) |
| Runbooks | Runbook.ai | Automatisation runbooks | Transposit, scripts custom |

### 6.5 Analytics Produit

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| Product Analytics | Amplitude | Analytics comportementaux | Mixpanel, Heap, PostHog |
| Session Replay | FullStory | Replay sessions utilisateur | Hotjar, LogRocket |
| A/B Testing | Optimizely | Tests A/B web | VWO, Google Optimize |
| Surveys | Delighted | NPS et satisfaction | SurveyMonkey, Typeform |
| Feedback | Productboard | Gestion feedback produit | Canny, UserVoice |

### 6.6 Communication & Collaboration

| Catégorie | Outil | Usage | Alternative |
|-----------|-------|-------|-------------|
| Team Chat | Slack | Communication équipe | Microsoft Teams, Discord |
| Video | Zoom | Réunions et War Room | Google Meet, Teams |
| Documentation | Notion | Documentation équipe | Confluence, GitBook |
| Knowledge Base | Notion/Guru | Base de connaissances support | Zendesk Guide, Helpjuice |

---

## 7. Rôles Impliqués

| Rôle | Niveau d'implication | Responsabilités |
|------|---------------------|-----------------|
| **Release Manager** | Lead | Coordination du release, Go/No-Go, checklists, communication |
| **Product Manager** | Fort | Définition scope release, priorités, communication stakeholders, GTM |
| **Engineering Lead** | Fort | Qualité technique, décisions architecture, coordination équipe dev |
| **DevOps/SRE** | Fort | Infrastructure, CI/CD, monitoring, on-call, runbooks |
| **QA Lead** | Fort | Test plan, validation release, critères qualité |
| **Product Marketing Manager (PMM)** | Fort (GTM) | Messaging, positioning, campagnes launch, assets marketing |
| **Customer Success Manager (CSM)** | Moyen | Feedback clients, onboarding, communication changements |
| **Technical Writer** | Moyen | Documentation utilisateur, release notes, guides |
| **Support Lead** | Moyen | Préparation équipe support, FAQ, playbooks support |
| **Security Engineer** | Variable | Review sécurité, compliance, tests de pénétration si requis |
| **Data Analyst** | Variable | Métriques de succès, dashboards, analyse post-launch |
| **Designer** | Variable | UX review, assets visuels, onboarding flows |

### Détails des Rôles Clés

#### Release Manager
```
Responsabilités:
- Planification et coordination du release
- Gestion du calendrier de release
- Animation des Go/No-Go meetings
- Communication cross-fonctionnelle
- Suivi des checklists et blockers
- Coordination rollback si nécessaire

Compétences:
- Gestion de projet
- Communication
- Connaissance technique suffisante
- Gestion de crise
```

#### DevOps/SRE
```
Responsabilités:
- Infrastructure et automation
- CI/CD pipeline maintenance
- Monitoring et alerting
- On-call et incident response
- Runbooks et documentation opérationnelle
- Capacity planning

Compétences:
- Infrastructure as Code
- Kubernetes, Docker
- Observabilité (Prometheus, Grafana, etc.)
- Scripting (Python, Bash)
- Cloud platforms (AWS, GCP, Azure)
```

#### Product Marketing Manager (PMM)
```
Responsabilités:
- Messaging et positioning
- Go-to-market strategy
- Launch campaigns
- Sales enablement
- Analyst relations
- Competitive intelligence

Compétences:
- Marketing stratégique
- Communication
- Connaissance produit
- Analyse de marché
- Project management
```

---

## 8. Livrables Attendus

### 8.1 Avant le Lancement

| Livrable | Description | Responsable | Format |
|----------|-------------|-------------|--------|
| Release Plan | Planning détaillé du release | Release Manager | Document/Confluence |
| Test Report | Résultats des tests (unit, integration, e2e) | QA Lead | Rapport PDF/HTML |
| Security Review | Rapport de review sécurité | Security Engineer | Document |
| Runbooks | Procédures opérationnelles | SRE/DevOps | Markdown/Wiki |
| Rollback Plan | Plan de rollback documenté | SRE/DevOps | Document |
| Release Notes | Notes de version | Product/Tech Writer | Markdown |
| Support FAQ | Questions/réponses pour support | Support Lead | Wiki/KB |
| GTM Assets | Matériel marketing (landing, emails, etc.) | PMM | Divers |
| Training Materials | Formation équipe support et sales | Various | Slides/Video |

### 8.2 Jour du Lancement

| Livrable | Description | Responsable | Format |
|----------|-------------|-------------|--------|
| Go/No-Go Decision | Décision documentée | Release Manager | Meeting notes |
| Deployment Log | Log du déploiement | DevOps | Timestamp log |
| Smoke Test Results | Résultats tests post-deploy | QA | Checklist |
| Status Updates | Communications pendant le launch | Comms Lead | Slack/Email |
| Incident Log (si applicable) | Timeline des incidents | Scribe | Document |

### 8.3 Après le Lancement

| Livrable | Description | Responsable | Format |
|----------|-------------|-------------|--------|
| Post-mortem | Analyse des incidents (si applicable) | Tech Lead | Template standard |
| Launch Metrics Report | Analyse des KPIs du launch | Product/Data | Dashboard/Report |
| Customer Feedback Summary | Synthèse feedback utilisateurs | CSM | Document |
| Lessons Learned | Learnings pour futurs releases | Release Manager | Document |
| Updated Documentation | Docs mises à jour post-launch | Tech Writer | Wiki |
| Retrospective Notes | Notes de la rétro d'équipe | Scrum Master | Document |

---

## 9. Transitions (Entrée/Sortie)

### 9.1 Critères d'Entrée (Entry Criteria)

```
┌─────────────────────────────────────────────────────────────────────┐
│                    CRITÈRES D'ENTRÉE PHASE 6                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  □ Code Feature-Complete                                             │
│    └── Toutes les fonctionnalités prévues sont implémentées         │
│                                                                      │
│  □ Tests Passés                                                      │
│    └── Unit tests, integration tests, e2e tests GREEN               │
│    └── Couverture de code > seuil défini (ex: 80%)                  │
│                                                                      │
│  □ Code Review Complété                                              │
│    └── Toutes les PRs merged après review                           │
│                                                                      │
│  □ Staging Validé                                                    │
│    └── Application déployée et testée sur staging                   │
│    └── UAT (User Acceptance Testing) passé                          │
│                                                                      │
│  □ Documentation Technique Prête                                     │
│    └── API documentation à jour                                      │
│    └── Architecture docs à jour                                      │
│                                                                      │
│  □ Infrastructure Prête                                              │
│    └── Environnement production provisionné                         │
│    └── Monitoring et alerting configurés                            │
│    └── Backups et DR testés                                         │
│                                                                      │
│  □ Équipe Prête                                                      │
│    └── On-call rotation définie                                      │
│    └── Runbooks créés et validés                                     │
│    └── Support formé                                                 │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### 9.2 Go/No-Go Checklist

```markdown
## Go/No-Go Meeting Checklist

### Technical Readiness (/10 points)
- [ ] (2) All tests passing (unit, integration, e2e)
- [ ] (2) Performance tests completed and acceptable
- [ ] (2) Security review completed, no critical issues
- [ ] (2) Monitoring and alerting verified
- [ ] (2) Rollback tested and documented

### Operational Readiness (/10 points)
- [ ] (2) On-call rotation scheduled
- [ ] (2) Runbooks created and reviewed
- [ ] (2) Incident response team identified
- [ ] (2) Communication channels established
- [ ] (2) Support team trained

### Business Readiness (/10 points)
- [ ] (2) Marketing assets ready
- [ ] (2) Documentation/Help center updated
- [ ] (2) Customer success team briefed
- [ ] (2) Sales team enabled
- [ ] (2) Release communications prepared

### Decision
- Score ≥ 24: GO ✅
- Score 18-23: CONDITIONAL GO (document risks)
- Score < 18: NO-GO ❌
```

### 9.3 Critères de Sortie (Exit Criteria)

```
┌─────────────────────────────────────────────────────────────────────┐
│                    CRITÈRES DE SORTIE PHASE 6                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  □ Déploiement Réussi                                                │
│    └── Application en production                                     │
│    └── Health checks passés                                          │
│    └── Smoke tests validés                                           │
│                                                                      │
│  □ Stabilité Confirmée                                               │
│    └── 24-48h sans incident majeur                                   │
│    └── SLOs respectés                                                │
│    └── Pas de rollback nécessaire                                    │
│                                                                      │
│  □ Métriques Initiales Collectées                                    │
│    └── Métriques d'adoption disponibles                              │
│    └── Baseline performance établie                                  │
│    └── Feedback initial collecté                                     │
│                                                                      │
│  □ Transfert Opérationnel                                            │
│    └── Équipe support autonome                                       │
│    └── Documentation opérationnelle complète                         │
│    └── On-call transféré à l'équipe régulière                       │
│                                                                      │
│  □ Communication Complète                                            │
│    └── Tous les stakeholders informés du succès                     │
│    └── Release notes publiées                                        │
│    └── Status page mise à jour                                       │
│                                                                      │
│  □ Post-mortem (si incidents)                                        │
│    └── Post-mortem complété dans les 48h                            │
│    └── Action items assignés                                         │
│                                                                      │
│  □ Célébration                                                       │
│    └── L'équipe a célébré le succès 🎉                              │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### 9.4 Transition vers Post-Launch

```
Phase 6: Lancement
       │
       ▼
┌─────────────────────────────────────┐
│         TRANSITION GATE             │
│                                     │
│  • Stabilité 48h confirmée          │
│  • Métriques de base collectées     │
│  • Support autonome                 │
│  • Post-mortem si incidents         │
│                                     │
└─────────────────────────────────────┘
       │
       ▼
Post-Launch: Optimisation & Scale
  • Analyse approfondie métriques
  • Itérations produit
  • Scale-up si succès
  • Retrospective complète
```

---

## 10. Citations Clés

### Sur le Release Management

> "Release management is the process of planning, scheduling, and controlling the build, test, and deployment of releases, and for delivering new functionality required by the business while protecting the integrity of existing services." — ITIL

### Sur les SLOs (Google SRE)

> "SLOs are the tool by which you measure your service's reliability." — Google SRE Book

> "The error budget provides a clear, objective metric that determines how unreliable the service is allowed to be within a single quarter." — Google SRE Book

> "If you're not occasionally burning through your error budget, you're probably being too conservative with releases." — Google SRE

### Sur le Blameless Post-mortem

> "A blameless post-mortem culture means that engineers whose actions have contributed to an accident can give a detailed account of what happened without fear of punishment or retribution." — Etsy Engineering

> "Human error is a symptom, not a cause. We should ask 'What conditions allowed this to happen?' rather than 'Who did this?'" — Sidney Dekker

### Sur les Feature Flags

> "Feature flags are the key to continuous delivery. They enable you to deploy code to production while keeping it hidden from users until it's ready." — Pete Hodgson

> "The real power of feature flags is that they decouple deployment from release." — LaunchDarkly

### Sur les Déploiements

> "If it hurts, do it more frequently." — Martin Fowler on Continuous Delivery

> "The goal is to make deploys boring." — Charity Majors, Honeycomb

> "Canary releases are about reducing the blast radius of a bad deployment." — Charity Majors

### Sur l'Incident Response

> "The primary value of the Incident Commander role is to free up the rest of the team to focus on problem-solving." — PagerDuty Incident Response

> "You are not your code. The quicker you can separate your identity from your work, the easier it will be to learn from failures." — Anonymous

### Sur le Go-to-Market

> "Time to value is the new time to market." — Product-Led Growth Movement

> "The best product marketing is when customers do the marketing for you." — Slack

### Sur la Culture DevOps

> "DevOps is the outcome of applying the most trusted principles from the domain of physical manufacturing and leadership to the IT value stream." — Gene Kim, The Phoenix Project

> "You build it, you run it." — Werner Vogels, Amazon CTO

---

## 11. Références Externes

### Livres

1. **"Site Reliability Engineering: How Google Runs Production Systems"** - Google SRE Team
   - Bible du SRE, couvre SLI/SLO/SLA, error budget, incident response
   - https://sre.google/sre-book/

2. **"The Site Reliability Workbook"** - Google SRE Team
   - Guide pratique avec exercices
   - https://sre.google/workbook/

3. **"Accelerate: Building and Scaling High Performing Technology Organizations"** - Nicole Forsgren, Jez Humble, Gene Kim
   - Recherche sur les métriques DORA
   - Lien entre pratiques DevOps et performance business

4. **"The Phoenix Project"** - Gene Kim, Kevin Behr, George Spafford
   - Roman sur la transformation DevOps
   - Introduction aux concepts clés

5. **"Release It!"** - Michael Nygard
   - Patterns de stabilité en production
   - Circuit breakers, bulkheads, etc.

6. **"Continuous Delivery"** - Jez Humble, David Farley
   - Bible du déploiement continu
   - Pipelines, automatisation, culture

### Articles et Guides

7. **Google SRE - Monitoring Distributed Systems**
   - https://sre.google/sre-book/monitoring-distributed-systems/

8. **Atlassian - Incident Management**
   - https://www.atlassian.com/incident-management

9. **Martin Fowler - Feature Toggles**
   - https://martinfowler.com/articles/feature-toggles.html

10. **Martin Fowler - Blue Green Deployment**
    - https://martinfowler.com/bliki/BlueGreenDeployment.html

11. **Martin Fowler - Canary Release**
    - https://martinfowler.com/bliki/CanaryRelease.html

12. **PagerDuty - Incident Response Documentation**
    - https://response.pagerduty.com/

13. **Gremlin - Chaos Engineering**
    - https://www.gremlin.com/chaos-engineering/

14. **LaunchDarkly - Feature Flag Best Practices**
    - https://launchdarkly.com/blog/

### Documentation Outils

15. **Kubernetes - Deployments**
    - https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

16. **Argo Rollouts - Progressive Delivery**
    - https://argoproj.github.io/argo-rollouts/

17. **Prometheus - Alerting**
    - https://prometheus.io/docs/alerting/

18. **Grafana - Dashboards**
    - https://grafana.com/docs/grafana/latest/

### Blogs Techniques

19. **Netflix Tech Blog**
    - Chaos engineering, progressive delivery
    - https://netflixtechblog.com/

20. **Slack Engineering**
    - Incident management, reliability
    - https://slack.engineering/

21. **Stripe Engineering**
    - API design, reliability
    - https://stripe.com/blog/engineering

22. **Shopify Engineering**
    - Black Friday reliability, scaling
    - https://shopify.engineering/

### Standards et Frameworks

23. **DORA Metrics**
    - https://cloud.google.com/devops
    - State of DevOps Reports

24. **ITIL - Release Management**
    - IT Infrastructure Library
    - https://www.axelos.com/certifications/itil-service-management

25. **SAFe - Release on Demand**
    - Scaled Agile Framework
    - https://www.scaledagileframework.com/release-on-demand/

### Communautés et Conférences

26. **SREcon**
    - Conférence USENIX sur le SRE
    - https://www.usenix.org/conferences/byname/925

27. **DevOpsDays**
    - Conférences DevOps mondiales
    - https://devopsdays.org/

28. **Chaos Engineering Slack**
    - Communauté Chaos Engineering
    - https://slofile.com/slack/chaos-community

### Outils Mentionnés (Documentation Officielle)

29. **LaunchDarkly Docs** - https://docs.launchdarkly.com/
30. **Datadog Docs** - https://docs.datadoghq.com/
31. **PagerDuty Docs** - https://support.pagerduty.com/
32. **ArgoCD Docs** - https://argo-cd.readthedocs.io/

---

*Document généré à partir du rapport Phase 6 - Lancement. Extraction complète sans résumé, incluant tous les exemples concrets, tableaux, diagrammes ASCII et citations.*
