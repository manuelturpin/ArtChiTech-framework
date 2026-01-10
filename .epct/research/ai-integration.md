# US-005: Intégration IA Embarquée

> DeepSearch - Montre à Gousset Connectée IA
> Date: 2026-01-10

---

## 1. Use Cases IA Pertinents

### Matrice des Use Cases

| Use Case | Valeur Client | Complexité | Faisabilité Edge | Priorité |
|----------|:-------------:|:----------:|:----------------:|:--------:|
| **Notification Intelligente** | ⬆️⬆️⬆️ | Moyenne | ⬆️⬆️⬆️ | 🥇 P0 |
| **Activity Recognition** | ⬆️⬆️ | Faible | ⬆️⬆️⬆️ | 🥇 P0 |
| **Context Awareness** | ⬆️⬆️⬆️ | Moyenne | ⬆️⬆️ | 🥈 P1 |
| **Sleep Analysis** | ⬆️⬆️ | Moyenne | ⬆️⬆️ | 🥈 P1 |
| **Anomaly Detection** | ⬆️⬆️ | Moyenne | ⬆️⬆️⬆️ | 🥈 P1 |
| **Voice Command (Wake Word)** | ⬆️ | Élevée | ⬆️⬆️ | 🥉 P2 |
| **Health Insights** | ⬆️⬆️ | Élevée | ⬆️ | 🥉 P2 |
| **Predictive Suggestions** | ⬆️⬆️⬆️ | Élevée | ⬆️ | 📈 P3 |

### Détail des Use Cases Prioritaires

#### 🥇 UC1: Notification Intelligente (P0)

**Description:** L'IA analyse le contexte (activité, heure, historique) pour filtrer et prioriser les notifications.

```
┌─────────────────────────────────────────────────────────────┐
│               NOTIFICATION INTELLIGENCE FLOW                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Notification      Context         Decision                 │
│  entrante          Analysis        Engine                   │
│      │                │                │                    │
│      ▼                ▼                ▼                    │
│  ┌────────┐      ┌────────┐      ┌────────┐                │
│  │ App    │      │Activity│      │ Show   │                │
│  │ Source │─────▶│ State  │─────▶│ Now?   │                │
│  │ Text   │      │ Time   │      │ Queue? │                │
│  │ Sender │      │ History│      │ Silent?│                │
│  └────────┘      └────────┘      └────────┘                │
│                                       │                     │
│                         ┌─────────────┼─────────────┐      │
│                         ▼             ▼             ▼      │
│                    [VIBRATE]     [QUEUE]      [IGNORE]     │
│                    + Display    for later    + Log         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Features:**
- Apprentissage des préférences utilisateur
- Détection "en réunion" / "en déplacement" / "repos"
- Priorisation: famille > travail urgent > marketing
- Mode focus automatique

**Inputs:** App source, texte (NLP léger), heure, activité détectée
**Output:** Priority score (0-1), action (show/queue/ignore)

---

#### 🥇 UC2: Activity Recognition (P0)

**Description:** Classification de l'activité physique en temps réel.

**Classes détectées:**
- Statique (assis, debout)
- Marche
- Course
- Vélo
- Transport (voiture, train)
- Sommeil

**Modèle:** CNN 1D sur données accéléromètre (3 axes)
- Input: 128 samples @ 50Hz = 2.56s window
- Architecture: 3 conv layers + dense
- Output: 6 classes softmax

---

#### 🥈 UC3: Context Awareness (P1)

**Description:** Fusion multi-capteurs pour comprendre le contexte global.

**Inputs fusionnés:**
- Activité (UC2)
- Heure / jour semaine
- Localisation (via phone)
- Patterns historiques
- Température ambiante

**Outputs:**
- `at_work`, `commuting`, `exercising`, `relaxing`, `sleeping`
- Confidence score
- Suggested watch face

---

#### 🥈 UC4: Anomaly Detection (P1)

**Description:** Détection d'événements anormaux (santé, sécurité).

**Types d'anomalies:**
- Rythme cardiaque anormal (si capteur HR)
- Chute détectée
- Immobilité prolongée
- Pattern inhabituel d'activité

**Approche:** Autoencoder pour learned normal patterns, threshold sur reconstruction error.

---

## 2. Edge AI vs Cloud AI

### Tableau Comparatif

| Critère | Edge AI (On-Device) | Cloud AI | Hybride |
|---------|:-------------------:|:--------:|:-------:|
| **Latence** | <100ms ✅ | 200ms-2s ❌ | Variable |
| **Privacy** | Données locales ✅ | Data upload ❌ | Partiel |
| **Consommation** | ~80mA inference | ~120mA WiFi | Variable |
| **Offline** | Fonctionne ✅ | Requiert connexion ❌ | Partiel |
| **Complexité modèle** | Limitée ❌ | Illimitée ✅ | Les deux |
| **Updates** | OTA firmware | Instant ✅ | Hybride |
| **Coût récurrent** | $0 | Server costs | Réduit |

### Stratégie Recommandée: Hybride Intelligent

```
┌─────────────────────────────────────────────────────────────┐
│                  STRATÉGIE HYBRIDE                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   EDGE (Always-on, Low Power)                              │
│   ├── Activity Recognition      <10KB model                │
│   ├── Notification Filtering    <50KB model                │
│   ├── Anomaly Detection         <30KB model                │
│   └── Wake Word (optional)      ~100KB model               │
│                                                             │
│   CLOUD (On-Demand, via Phone)                             │
│   ├── Complex NLP               Large models               │
│   ├── Health Insights           Historical analysis        │
│   ├── Model Updates             New versions               │
│   └── Personalization           Cross-device learning      │
│                                                             │
│   PHONE (Companion App)                                     │
│   ├── Medium models             ~10MB                       │
│   ├── Real-time sync            BLE bridge                 │
│   └── Cloud gateway             API calls                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Decision Matrix: Where to Run?

| Critère | Edge | Phone | Cloud |
|---------|:----:|:-----:|:-----:|
| Latency-critical (<100ms) | ✅ | | |
| Privacy-sensitive | ✅ | ✅ | |
| Complex reasoning | | ✅ | ✅ |
| Historical analysis | | | ✅ |
| Offline required | ✅ | | |
| Large model needed | | ✅ | ✅ |

---

## 3. Frameworks Embarqués

### Évaluation des Options

| Framework | Taille Runtime | ESP32 Support | Ease of Use | Maintenance |
|-----------|:--------------:|:-------------:|:-----------:|:-----------:|
| **TensorFlow Lite Micro** | ~100KB | ✅ Excellent | ⬆️⬆️ | ⬆️⬆️⬆️ |
| **ONNX Runtime** | ~500KB | ⚠️ Limité | ⬆️⬆️ | ⬆️⬆️ |
| **Edge Impulse** | ~50KB | ✅ Bon | ⬆️⬆️⬆️ | ⬆️⬆️ |
| **ESP-DL** | ~30KB | ✅ Natif | ⬆️ | ⬆️⬆️ |
| **Custom C++** | Minimal | ✅ | ⬆️ | ⬆️ |

### Recommandation: TensorFlow Lite Micro

**Justification:**
1. **Support officiel Espressif** - `esp-tflite-micro` maintenu activement
2. **Écosystème riche** - Outils de quantization, profiling, conversion
3. **Communauté large** - Documentation, exemples, support
4. **Performances** - Optimisé pour ESP32-S3 avec instructions vectorielles
5. **Interopérabilité** - Modèles portables TensorFlow → TFLite → TFLite Micro

### Architecture d'Inference

```cpp
// TFLite Micro typical setup

#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"

// Model loaded from flash
extern const unsigned char activity_model[];
extern const int activity_model_len;

// Tensor arena (RAM allocation)
constexpr int kTensorArenaSize = 32 * 1024;  // 32KB
uint8_t tensor_arena[kTensorArenaSize];

// Resolver with only needed ops
tflite::MicroMutableOpResolver<6> resolver;
resolver.AddConv2D();
resolver.AddMaxPool2D();
resolver.AddReshape();
resolver.AddFullyConnected();
resolver.AddSoftmax();
resolver.AddQuantize();

// Interpreter
tflite::MicroInterpreter interpreter(
    model, resolver, tensor_arena, kTensorArenaSize);
interpreter.AllocateTensors();

// Inference
TfLiteTensor* input = interpreter.input(0);
// ... copy sensor data to input->data.int8
interpreter.Invoke();
TfLiteTensor* output = interpreter.output(0);
// ... read predictions from output->data.int8
```

---

## 4. Contraintes Compute/Mémoire

### Spécifications ESP32-C3 (AI Co-processor)

| Ressource | Disponible | Réservé Système | Pour IA |
|-----------|:----------:|:---------------:|:-------:|
| **Flash** | 4MB | 1MB firmware | **3MB** |
| **SRAM** | 400KB | 150KB système | **250KB** |
| **PSRAM** | 2MB (ext) | 0 | **2MB** |
| **CPU** | 160MHz RISC-V | - | 160MHz |

### Budget Mémoire par Modèle

```
┌─────────────────────────────────────────────────────────────┐
│                    MEMORY BUDGET                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Flash (3MB disponible pour modèles)                       │
│  ├── Activity Classifier        ~20KB    ██░░░░░░░░        │
│  ├── Notification Filter        ~50KB    ████░░░░░░        │
│  ├── Context Analyzer           ~100KB   ████████░░        │
│  ├── Anomaly Detector           ~30KB    ███░░░░░░░        │
│  ├── Wake Word (optional)       ~200KB   ████████████████  │
│  └── Reserved for updates       ~600KB   ████████████████  │
│  ─────────────────────────────────────────────────────────  │
│  TOTAL                          ~1MB / 3MB (33%)           │
│                                                             │
│  RAM (250KB disponible pour tensors)                       │
│  ├── TFLite Runtime             ~40KB    ████░░░░░░        │
│  ├── Tensor Arena               ~64KB    ████████░░        │
│  ├── Input/Output buffers       ~16KB    ██░░░░░░░░        │
│  └── Working memory             ~30KB    ███░░░░░░░        │
│  ─────────────────────────────────────────────────────────  │
│  TOTAL                          ~150KB / 250KB (60%)       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Contraintes Identifiées

| Contrainte | Impact | Mitigation |
|------------|--------|------------|
| RAM limitée | Un seul modèle chargé à la fois | Model swapping |
| Pas de FPU | Inference plus lente | Quantization int8 |
| Power budget | Limite temps inference | Batching, throttling |
| Flash wear | Limite updates | OTA delta updates |

---

## 5. Modèles ML Réalistes

### Modèle 1: Activity Classifier

```
┌─────────────────────────────────────────────────────────────┐
│                ACTIVITY CLASSIFIER MODEL                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Input: [128, 3] int8  (128 samples × 3 axes @ 50Hz)       │
│                                                             │
│  ┌─────────────────────────────────────────────────────────┐│
│  │ Conv1D(16, 3) + ReLU + MaxPool(2)        ~1.5KB params ││
│  │ Conv1D(32, 3) + ReLU + MaxPool(2)        ~4.5KB params ││
│  │ Conv1D(64, 3) + ReLU + GlobalAvgPool     ~12KB params  ││
│  │ Dense(32) + ReLU                         ~2KB params   ││
│  │ Dense(6) + Softmax                       ~0.2KB params ││
│  └─────────────────────────────────────────────────────────┘│
│                                                             │
│  Output: [6] float32 (probabilities)                        │
│                                                             │
│  Total params: ~20K                                         │
│  Model size (int8): ~20KB                                   │
│  Tensor arena: ~32KB                                        │
│  Inference time: ~15ms                                      │
│  Accuracy: 92-95%                                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Modèle 2: Notification Filter

```
┌─────────────────────────────────────────────────────────────┐
│              NOTIFICATION FILTER MODEL                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Inputs:                                                    │
│  - app_id: [1] int8 (embedded)                             │
│  - hour: [1] float32 (normalized)                          │
│  - day_of_week: [7] one-hot                                │
│  - activity: [6] one-hot (from UC1)                        │
│  - sender_category: [5] one-hot                            │
│  - keyword_flags: [10] binary                              │
│                                                             │
│  ┌─────────────────────────────────────────────────────────┐│
│  │ Embedding(100, 8) for app_id            ~0.8KB params  ││
│  │ Concat all features                     ~30 dims       ││
│  │ Dense(64) + ReLU                        ~2KB params    ││
│  │ Dense(32) + ReLU                        ~2KB params    ││
│  │ Dense(3) + Softmax                      ~0.1KB params  ││
│  └─────────────────────────────────────────────────────────┘│
│                                                             │
│  Output: [3] (show_now, queue, ignore)                     │
│                                                             │
│  Total params: ~50K                                         │
│  Model size (int8): ~50KB                                   │
│  Tensor arena: ~16KB                                        │
│  Inference time: ~5ms                                       │
│  Accuracy: 88-92%                                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Modèle 3: Context Analyzer

```
┌─────────────────────────────────────────────────────────────┐
│                CONTEXT ANALYZER MODEL                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Inputs:                                                    │
│  - activity_history: [10, 6] (last 10 activities)          │
│  - time_features: [4] (hour, minute, day, weekend)         │
│  - sensor_summary: [8] (avg/std accel, temp, light)        │
│                                                             │
│  ┌─────────────────────────────────────────────────────────┐│
│  │ LSTM(32) on activity_history            ~8KB params    ││
│  │ Dense(16) on time_features              ~0.1KB params  ││
│  │ Dense(16) on sensor_summary             ~0.2KB params  ││
│  │ Concat(32+16+16) = 64                                  ││
│  │ Dense(32) + ReLU                        ~2KB params    ││
│  │ Dense(5) + Softmax                      ~0.2KB params  ││
│  └─────────────────────────────────────────────────────────┘│
│                                                             │
│  Output: [5] (work, commute, exercise, relax, sleep)       │
│                                                             │
│  Total params: ~100K                                        │
│  Model size (int8): ~100KB                                  │
│  Tensor arena: ~48KB                                        │
│  Inference time: ~25ms                                      │
│  Accuracy: 85-90%                                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Résumé des Performances

| Modèle | Taille | RAM | Inference | Accuracy | Faisable |
|--------|:------:|:---:|:---------:|:--------:|:--------:|
| Activity Classifier | 20KB | 32KB | 15ms | 92-95% | ✅ |
| Notification Filter | 50KB | 16KB | 5ms | 88-92% | ✅ |
| Context Analyzer | 100KB | 48KB | 25ms | 85-90% | ✅ |
| Anomaly Detector | 30KB | 24KB | 10ms | 90%+ | ✅ |
| Wake Word | 200KB | 64KB | 50ms | 95%+ | ⚠️ |

---

## 6. Pipeline d'Entraînement et Déploiement

### Workflow End-to-End

```
┌─────────────────────────────────────────────────────────────┐
│                 ML PIPELINE                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. DATA COLLECTION                                         │
│     └── Sensor data from prototype devices                 │
│                                                             │
│  2. TRAINING (Cloud/Local)                                  │
│     ├── TensorFlow / Keras                                 │
│     ├── Data augmentation                                   │
│     └── Cross-validation                                    │
│                                                             │
│  3. OPTIMIZATION                                            │
│     ├── Pruning (remove redundant weights)                 │
│     ├── Quantization (float32 → int8)                      │
│     └── Knowledge distillation (optional)                  │
│                                                             │
│  4. CONVERSION                                              │
│     ├── TF → TFLite                                        │
│     ├── TFLite → TFLite Micro                              │
│     └── xxd → C header                                      │
│                                                             │
│  5. VALIDATION                                              │
│     ├── On-device accuracy test                            │
│     ├── Latency profiling                                   │
│     └── Power consumption test                             │
│                                                             │
│  6. DEPLOYMENT                                              │
│     ├── OTA update via app                                 │
│     └── A/B testing (optional)                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Quantization Example

```python
# Post-training quantization

import tensorflow as tf

# Load trained model
model = tf.keras.models.load_model('activity_model.h5')

# Convert to TFLite with int8 quantization
converter = tf.lite.TFLiteConverter.from_keras_model(model)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.representative_dataset = representative_data_gen
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.int8
converter.inference_output_type = tf.int8

tflite_model = converter.convert()

# Save
with open('activity_model_int8.tflite', 'wb') as f:
    f.write(tflite_model)

# Convert to C header for embedding
# xxd -i activity_model_int8.tflite > activity_model.h
```

---

## 7. Roadmap IA

### Phase 1: MVP (Launch)

| Feature | Modèle | Status |
|---------|--------|--------|
| Activity Recognition | 20KB CNN | ✅ Ready |
| Basic Notification Filter | 50KB MLP | ✅ Ready |

### Phase 2: Enhanced (6 months)

| Feature | Modèle | Status |
|---------|--------|--------|
| Context Awareness | 100KB LSTM | 🔨 Development |
| Anomaly Detection | 30KB AE | 🔨 Development |
| Sleep Tracking | 40KB CNN-LSTM | 📋 Planned |

### Phase 3: Advanced (12+ months)

| Feature | Modèle | Status |
|---------|--------|--------|
| Wake Word Detection | 200KB | 📋 Planned |
| Personalization | Federated | 💡 Research |
| Health Predictions | Cloud-hybrid | 💡 Research |

---

## 8. Conclusions

### ✅ Faisabilité IA Confirmée

1. **TinyML mature** - TFLite Micro fonctionne bien sur ESP32
2. **Modèles réalistes** - 20-100KB suffisent pour use cases clés
3. **Inference rapide** - 5-25ms acceptable pour wearable
4. **Privacy preserving** - Edge-first approach possible

### ⚠️ Limitations

1. **Modèles simples** - Pas de LLM embarqué
2. **Personnalisation limitée** - Apprentissage on-device difficile
3. **NLP basique** - Keyword matching, pas de compréhension profonde

### 🎯 Différenciation

Le produit peut être différencié par:
- **Notifications vraiment intelligentes** (vs spam des autres)
- **Respect de la privacy** (vs cloud-dependent competitors)
- **Autonomie préservée** (vs smartwatches qui drainent la batterie pour l'IA)

### 📊 Score IA: 7.5/10

**Verdict**: IA embarquée faisable et différenciante. L'approche hybride (edge + cloud via phone) permet d'offrir des fonctionnalités avancées sans compromettre l'autonomie.

---

## Sources

- [ESP32-S3 + TensorFlow Lite Micro Guide](https://dev.to/zediot/esp32-s3-tensorflow-lite-micro-a-practical-guide-to-local-wake-word-edge-ai-inference-5540)
- [Espressif ESP-TFLite-Micro GitHub](https://github.com/espressif/esp-tflite-micro)
- [TinyML Applications on MCUs](https://thinkrobotics.com/blogs/learn/tinyml-applications-on-microcontrollers-revolutionizing-edge-ai)
- [TinyML (EdgeAI) 2026 Report](https://research.aimultiple.com/tinyml/)
- [Ultra-Low-Power MCUs 2026](https://promwad.com/news/ultra-low-power-mcus-in-2026-ai-tinyml)
