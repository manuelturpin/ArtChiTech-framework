# US-003: Faisabilité Technique Hardware

> DeepSearch - Montre à Gousset Connectée IA
> Date: 2026-01-10

---

## 1. Analyse des Contraintes de Forme

### Spécifications Typiques Montre à Gousset

| Paramètre | Montre Classique | Proposition Smart |
|-----------|-----------------|-------------------|
| **Diamètre boîtier** | 45-55mm | 48-52mm |
| **Épaisseur** | 10-15mm | 12-16mm |
| **Poids** | 50-100g | 60-80g |
| **Matériaux** | Laiton, argent, or | Acier, titane, céramique |

### Avantages du Format Gousset

```
┌─────────────────────────────────────────────────────────────┐
│            AVANTAGES FORM FACTOR GOUSSET                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✅ Plus d'espace interne                                   │
│     - Batterie plus grande possible                         │
│     - Plus de capteurs intégrables                          │
│     - Meilleure dissipation thermique                       │
│                                                             │
│  ✅ Protection naturelle                                    │
│     - Couvercle protège l'écran                            │
│     - Rangé en poche = moins d'impacts                      │
│     - Chaîne empêche les chutes                            │
│                                                             │
│  ✅ Discrétion                                              │
│     - Écran caché par défaut                               │
│     - Consultation intentionnelle                           │
│     - Pas de "screen glare" en réunion                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Contraintes Spécifiques

| Contrainte | Impact | Mitigation |
|------------|--------|------------|
| **Ouverture couvercle** | Mécanisme usure | Charnière qualité horlogère |
| **Chaîne/attache** | Poids supplémentaire | Chaîne fine, clip moderne optionnel |
| **Positionnement capteurs** | Pas au poignet | Capteurs alternatifs (temp, mouvement) |
| **Consultation** | Geste nécessaire | Wake on motion, haptic feedback |

---

## 2. Composants Nécessaires

### Architecture Hardware Recommandée

```
┌─────────────────────────────────────────────────────────────┐
│                    ARCHITECTURE HARDWARE                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐     ┌──────────────┐                     │
│  │   MCU        │     │   Display    │                     │
│  │  nRF52840    │────▶│   E-Ink      │                     │
│  │  (Main)      │     │   1.54"      │                     │
│  └──────────────┘     └──────────────┘                     │
│         │                                                   │
│         ▼                                                   │
│  ┌──────────────┐     ┌──────────────┐                     │
│  │  Co-processor│     │   Sensors    │                     │
│  │  ESP32-C3    │     │  MPU6050     │                     │
│  │  (AI + WiFi) │     │  BME280      │                     │
│  └──────────────┘     │  MAX30102    │                     │
│         │             └──────────────┘                     │
│         ▼                                                   │
│  ┌──────────────┐     ┌──────────────┐                     │
│  │   Power      │     │   Storage    │                     │
│  │  LiPo 500mAh │     │   8MB Flash  │                     │
│  │  + BMS       │     │   + 2MB PSRAM│                     │
│  └──────────────┘     └──────────────┘                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Bill of Materials (BOM) Préliminaire

| Composant | Spécification | Coût Unitaire | Source |
|-----------|---------------|---------------|--------|
| **MCU Principal** | nRF52840 | $4-6 | Nordic |
| **Co-processeur AI** | ESP32-C3 | $2-4 | Espressif |
| **Écran E-Ink** | 1.54" 200x200 B/W | $8-12 | Good Display |
| **Batterie** | LiPo 500mAh | $3-5 | Generic |
| **Accéléromètre/Gyro** | MPU6050 | $1-2 | InvenSense |
| **Capteur env.** | BME280 | $2-3 | Bosch |
| **Capteur HR** | MAX30102 | $3-4 | Maxim |
| **Flash** | 8MB SPI | $1-2 | Winbond |
| **PSRAM** | 2MB | $1-2 | ESP-PSRAM |
| **Moteur vibration** | ERM 10mm | $0.50 | Generic |
| **Antenne BLE** | Céramique | $0.50 | Johanson |
| **RTC** | PCF85063A | $1 | NXP |
| **Chargeur** | TP4056 | $0.30 | Generic |
| **Connecteurs/PCB** | Custom 4-layer | $5-8 | JLCPCB |
| **Boîtier** | Acier inox CNC | $15-25 | Custom |
| **Verre/couvercle** | Saphir ou minéral | $5-15 | Custom |
| **Chaîne** | Acier/plaqué | $3-8 | Custom |

### Résumé BOM

| Catégorie | Coût Min | Coût Max |
|-----------|----------|----------|
| Électronique | $32 | $48 |
| Mécanique/Boîtier | $23 | $48 |
| **Total BOM** | **$55** | **$96** |
| Marge assemblage (+30%) | $17 | $29 |
| **Coût Landed** | **$72** | **$125** |

---

## 3. Comparaison Options Écran

### Tableau Comparatif

| Critère | E-Ink B/W | E-Ink Couleur | OLED | Hybrid (Aiguilles+E-ink) |
|---------|:---------:|:-------------:|:----:|:------------------------:|
| **Autonomie** | ⬆️⬆️⬆️ 30+ jours | ⬆️⬆️ 14 jours | ⬆️ 1-3 jours | ⬆️⬆️⬆️ 30+ jours |
| **Lisibilité soleil** | ⬆️⬆️⬆️ | ⬆️⬆️⬆️ | ⬆️ | ⬆️⬆️⬆️ |
| **Refresh rate** | ⬇️ 0.5-2s | ⬇️ 1-3s | ⬆️⬆️⬆️ 60fps | ⬆️ (aiguilles fluides) |
| **Coût** | ⬆️⬆️ $8-12 | ⬆️ $20-35 | ⬆️⬆️ $10-15 | ⬇️ $25-40 |
| **Esthétique vintage** | ⬆️⬆️ | ⬆️⬆️ | ⬆️ | ⬆️⬆️⬆️ |
| **Complexité** | ⬆️⬆️⬆️ Simple | ⬆️⬆️ | ⬆️⬆️ | ⬇️ Complexe |

### Recommandation: E-Ink B/W (Premier modèle)

**Justification:**
1. **Autonomie maximale** - Aligné avec le positionnement "slow tech"
2. **Coût maîtrisé** - Permet prix compétitif
3. **Esthétique cohérente** - Look rétro/vintage
4. **Fiabilité** - Technologie mature
5. **Consommation IA** - Plus de budget power pour l'IA

**Option future:** E-Ink couleur pour édition premium (V2)

### Spécifications E-Ink Recommandées

| Paramètre | Valeur |
|-----------|--------|
| Taille | 1.54" diagonal |
| Résolution | 200x200 pixels |
| Couleurs | B/W (+ rouge optionnel) |
| Refresh | Partiel <0.3s, Full <1s |
| Viewing angle | 180° |
| Power (static) | 0mW |
| Power (refresh) | 26mW |

---

## 4. Analyse Autonomie

### Budget Énergétique

**Batterie: 500mAh LiPo @ 3.7V = 1850mWh**

| Composant | Mode | Consommation | Utilisation/jour | mWh/jour |
|-----------|------|--------------|------------------|----------|
| **nRF52840** | Sleep | 0.3µA | 23.9h | 0.03 |
| **nRF52840** | Active | 3mA | 0.1h | 1.1 |
| **ESP32-C3** | Sleep | 5µA | 23h | 0.4 |
| **ESP32-C3** | AI inference | 80mA | 0.5h | 148 |
| **ESP32-C3** | WiFi sync | 120mA | 0.5h | 222 |
| **E-Ink** | Refresh | 26mW | 50x/jour | 3.6 |
| **Capteurs** | Active | 5mA | 1h | 18.5 |
| **RTC** | Always | 0.5µA | 24h | 0.04 |
| **Vibration** | Active | 100mA | 2min | 12 |

### Scénarios d'Autonomie

| Scénario | Description | Conso/jour | Autonomie |
|----------|-------------|------------|-----------|
| **Minimal** | Heure + 10 notifs | ~50mWh | **37 jours** |
| **Normal** | + 30 IA inferences + sync WiFi 1x | ~200mWh | **9 jours** |
| **Intensif** | + 100 IA + sync 3x + capteurs continus | ~450mWh | **4 jours** |

### Stratégies d'Optimisation

1. **AI Inference batching** - Grouper les inférences
2. **WiFi sync nocturne** - Sync pendant charge
3. **E-Ink partiel refresh** - Éviter full refresh
4. **Capteurs on-demand** - Pas de monitoring continu
5. **Deep sleep agressif** - MCU en sleep max

**Objectif réaliste: 7-14 jours en usage normal**

---

## 5. Estimation Coûts de Fabrication

### Structure de Coûts

```
┌─────────────────────────────────────────────────────────────┐
│              STRUCTURE COÛTS (1000 unités)                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  BOM Électronique           $40-50      ████████░░  40%    │
│  Boîtier + Mécanique        $25-35      █████░░░░░  28%    │
│  Assemblage                 $15-20      ███░░░░░░░  15%    │
│  QC + Test                  $5-8        █░░░░░░░░░   6%    │
│  Packaging                  $5-10       ██░░░░░░░░   7%    │
│  Logistics                  $3-5        █░░░░░░░░░   4%    │
│  ─────────────────────────────────────────────────────────  │
│  TOTAL LANDED               $93-128                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Projections par Volume

| Volume | Coût Unitaire | Prix Vente | Marge Brute |
|--------|---------------|------------|-------------|
| 100 (proto) | $180-250 | - | - |
| 500 (pilot) | $130-160 | $499 | 65-72% |
| 1,000 | $93-128 | $499 | 74-81% |
| 5,000 | $75-100 | $449 | 77-83% |
| 10,000+ | $60-85 | $399 | 78-85% |

### Investissement Initial

| Poste | Coût Estimé |
|-------|-------------|
| Tooling (moules, jigs) | $15,000-25,000 |
| Certification (FCC, CE) | $10,000-20,000 |
| Prototypes (10x) | $3,000-5,000 |
| Tests/validation | $5,000-10,000 |
| **Total NRE** | **$33,000-60,000** |

---

## 6. Risques Techniques et Mitigations

### Matrice des Risques

| Risque | Probabilité | Impact | Mitigation |
|--------|:-----------:|:------:|------------|
| Autonomie insuffisante | Moyenne | ⬆️⬆️⬆️ | Batterie 700mAh, optimisation firmware |
| E-Ink refresh lent | Faible | ⬆️ | Partial refresh, animation simplifiée |
| Charnière usure | Moyenne | ⬆️⬆️ | Composants horlogerie, test 10K cycles |
| Chaleur AI inference | Moyenne | ⬆️⬆️ | Throttling, dissipation boîtier métal |
| Étanchéité | Faible | ⬆️ | IP54 suffisant (pas de submersion) |
| Certification FCC/CE | Faible | ⬆️⬆️⬆️ | Modules pré-certifiés |

---

## 7. Architecture Technique Proposée

### Schéma Bloc

```
                    ┌─────────────────────────────────────┐
                    │         MONTRE GOUSSET IA           │
                    └─────────────────────────────────────┘
                                     │
        ┌────────────────────────────┼────────────────────────────┐
        │                            │                            │
        ▼                            ▼                            ▼
┌───────────────┐          ┌───────────────┐          ┌───────────────┐
│   POWER       │          │   COMPUTE     │          │   SENSORS     │
│   DOMAIN      │          │   DOMAIN      │          │   DOMAIN      │
├───────────────┤          ├───────────────┤          ├───────────────┤
│ LiPo 500mAh   │          │ nRF52840 Main │          │ MPU6050       │
│ TP4056 Charge │          │ ESP32-C3 AI   │          │ BME280        │
│ BMS/Protect   │          │ 8MB Flash     │          │ MAX30102 (opt)│
│ LDO 3.3V      │          │ 2MB PSRAM     │          │ Microphone    │
└───────────────┘          └───────────────┘          └───────────────┘
                                     │
        ┌────────────────────────────┼────────────────────────────┐
        │                            │                            │
        ▼                            ▼                            ▼
┌───────────────┐          ┌───────────────┐          ┌───────────────┐
│   DISPLAY     │          │   COMMS       │          │   UI          │
│   DOMAIN      │          │   DOMAIN      │          │   DOMAIN      │
├───────────────┤          ├───────────────┤          ├───────────────┤
│ E-Ink 1.54"   │          │ BLE 5.0       │          │ Vibration     │
│ 200x200 B/W   │          │ WiFi (ESP32)  │          │ LED status    │
│ SPI interface │          │ Antenne cér.  │          │ Bouton        │
└───────────────┘          └───────────────┘          └───────────────┘
```

---

## 8. Conclusions

### ✅ Faisabilité Confirmée

1. **Techniquement viable** - Composants existants et matures
2. **Coût maîtrisable** - BOM $60-125 selon volume
3. **Différenciation possible** - Form factor unique + IA edge
4. **Autonomie acceptable** - 7-14 jours réalistes

### ⚠️ Points d'Attention

1. **Charnière couvercle** - Élément critique, besoin expertise horlogère
2. **Optimisation power** - Firmware critique pour autonomie
3. **Certification** - Budget et temps à prévoir
4. **Form factor capteurs** - Pas de HR au poignet = alternatives

### 📊 Score Technique: 7/10

**Verdict**: Faisable avec les technologies actuelles. Le principal défi est l'optimisation énergétique pour l'IA embarquée.

---

## Sources

- [CNX Software - Spectra ESP32/nRF52 Smartwatch](https://www.cnx-software.com/2024/10/18/spectra-customizable-javascript-esp32-s3-nrf52832-smartwatch/)
- [E-Ink Wearables Info](https://www.e-ink-info.com/e-ink-devices/wearables)
- [Hackaday - nRF52 SmartWatch](https://hackaday.io/project/169967-nrf52-smartwatch)
- [Crowd Supply - Watchy](https://www.crowdsupply.com/sqfmi/watchy)
- [Nordic Semiconductor - Wearables](https://www.nordicsemi.com/Applications/Wearables)
- [TinyML Applications - ThinkRobotics](https://thinkrobotics.com/blogs/learn/tinyml-applications-on-microcontrollers-revolutionizing-edge-ai)
- [Southmont AI - E-Ink Health Tech](https://southmont.ai/2025/05/15/news_17/)
- [Promwad - Ultra-Low-Power MCUs 2026](https://promwad.com/news/ultra-low-power-mcus-in-2026-ai-tinyml)
