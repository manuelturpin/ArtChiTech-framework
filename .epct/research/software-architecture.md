# US-004: Architecture Logicielle Orientée Objet

> DeepSearch - Montre à Gousset Connectée IA
> Date: 2026-01-10

---

## 1. Vue d'Ensemble de l'Écosystème

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         ÉCOSYSTÈME GOUSSET IA                          │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌───────────────┐         ┌───────────────┐         ┌─────────────┐  │
│   │   FIRMWARE    │◄───────►│   APP MOBILE  │◄───────►│   CLOUD     │  │
│   │   (Montre)    │   BLE   │  (Companion)  │  HTTPS  │   (API)     │  │
│   └───────────────┘         └───────────────┘         └─────────────┘  │
│                                                                         │
│   C++ / Arduino            Swift/Kotlin               Node.js/Go       │
│   FreeRTOS                 SwiftUI/Jetpack            PostgreSQL       │
│                            Compose                     Redis           │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Diagramme de Classes UML - Firmware Embarqué

### Architecture Principale

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    FIRMWARE CLASS DIAGRAM (UML)                        │
└─────────────────────────────────────────────────────────────────────────┘

                            ┌──────────────────┐
                            │   Application    │
                            │    <<singleton>> │
                            ├──────────────────┤
                            │ - state: State   │
                            │ - modules[]      │
                            ├──────────────────┤
                            │ + init()         │
                            │ + run()          │
                            │ + sleep()        │
                            └────────┬─────────┘
                                     │ owns
         ┌───────────────────────────┼───────────────────────────┐
         │                           │                           │
         ▼                           ▼                           ▼
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│   <<interface>> │       │   <<interface>> │       │   <<interface>> │
│     IModule     │       │    IObserver    │       │   IRenderable   │
├─────────────────┤       ├─────────────────┤       ├─────────────────┤
│ + init()        │       │ + onEvent()     │       │ + render()      │
│ + update()      │       │ + getPriority() │       │ + getBounds()   │
│ + getName()     │       └─────────────────┘       └─────────────────┘
└─────────────────┘
         △
         │ implements
         │
┌────────┴────────┬─────────────────┬─────────────────┬────────────────┐
│                 │                 │                 │                │
▼                 ▼                 ▼                 ▼                ▼
┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐
│DisplayMgr │  │SensorMgr  │  │  AIEngine │  │  CommMgr  │  │ PowerMgr  │
├───────────┤  ├───────────┤  ├───────────┤  ├───────────┤  ├───────────┤
│-display   │  │-sensors[] │  │-models[]  │  │-ble       │  │-battery   │
│-watchFaces│  │-readings  │  │-context   │  │-wifi      │  │-state     │
├───────────┤  ├───────────┤  ├───────────┤  ├───────────┤  ├───────────┤
│+refresh() │  │+read()    │  │+infer()   │  │+send()    │  │+optimize()│
│+setFace() │  │+subscribe()│  │+learn()   │  │+receive() │  │+sleep()   │
└───────────┘  └───────────┘  └───────────┘  └───────────┘  └───────────┘
```

### Classes Détaillées - Domain Model

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         DOMAIN MODEL CLASSES                           │
└─────────────────────────────────────────────────────────────────────────┘

┌────────────────────┐       ┌────────────────────┐
│     WatchFace      │       │    Notification    │
│    <<abstract>>    │       ├────────────────────┤
├────────────────────┤       │ - id: uint32       │
│ - name: string     │       │ - type: NotifType  │
│ - theme: Theme     │       │ - title: string    │
├────────────────────┤       │ - body: string     │
│ + render()         │       │ - priority: uint8  │
│ + update(time)     │       │ - timestamp: time  │
│ + handleTouch()    │       ├────────────────────┤
└────────────────────┘       │ + display()        │
         △                   │ + dismiss()        │
         │                   └────────────────────┘
    ┌────┴────┐
    │         │               ┌────────────────────┐
┌───────────┐ ┌───────────┐   │   SensorReading    │
│ClassicFace│ │DigitalFace│   ├────────────────────┤
└───────────┘ └───────────┘   │ - type: SensorType │
                              │ - value: float     │
┌────────────────────┐        │ - unit: string     │
│      AIModel       │        │ - timestamp: time  │
│    <<abstract>>    │        │ - confidence: float│
├────────────────────┤        └────────────────────┘
│ - name: string     │
│ - size: uint32     │        ┌────────────────────┐
│ - version: string  │        │    UserContext     │
├────────────────────┤        ├────────────────────┤
│ + load()           │        │ - location: GPS    │
│ + infer(input)     │        │ - activity: enum   │
│ + getMemUsage()    │        │ - mood: float      │
└────────────────────┘        │ - schedule: Event[]│
         △                    │ - preferences: Map │
         │                    ├────────────────────┤
    ┌────┴────┬────┐          │ + update()         │
    │         │    │          │ + predict()        │
┌────────┐ ┌────────┐ ┌────────┐ └────────────────────┘
│Activity│ │Health  │ │Context │
│Classifier│ │Monitor│ │Analyzer│
└────────┘ └────────┘ └────────┘
```

---

## 3. Design Patterns Appliqués

### Pattern 1: Observer (Événements)

```cpp
// Observer Pattern pour les événements système

class IEventObserver {
public:
    virtual void onEvent(Event& event) = 0;
    virtual int getPriority() const = 0;
    virtual ~IEventObserver() = default;
};

class EventBus {
private:
    std::vector<IEventObserver*> observers;
    static EventBus* instance;

public:
    static EventBus* getInstance();
    void subscribe(IEventObserver* observer);
    void unsubscribe(IEventObserver* observer);
    void publish(Event& event);
};

// Usage
class NotificationManager : public IEventObserver {
public:
    void onEvent(Event& event) override {
        if (event.type == EventType::BLE_NOTIFICATION) {
            processNotification(event.data);
        }
    }
    int getPriority() const override { return 10; }
};
```

**Justification:** Découplage entre producteurs et consommateurs d'événements (BLE, capteurs, UI).

---

### Pattern 2: State (Machine à États)

```cpp
// State Pattern pour les modes de la montre

class WatchState {
public:
    virtual void enter(WatchContext& ctx) = 0;
    virtual void update(WatchContext& ctx) = 0;
    virtual void exit(WatchContext& ctx) = 0;
    virtual void handleInput(WatchContext& ctx, Input input) = 0;
};

class ActiveState : public WatchState {
public:
    void enter(WatchContext& ctx) override {
        ctx.display.wake();
        ctx.sensors.enable();
    }
    void update(WatchContext& ctx) override {
        ctx.display.refresh();
    }
    void handleInput(WatchContext& ctx, Input input) override {
        if (input == Input::IDLE_TIMEOUT) {
            ctx.setState(new SleepState());
        }
    }
};

class SleepState : public WatchState {
    // Deep sleep, minimal power
};

class AIInferenceState : public WatchState {
    // ESP32 active, running ML inference
};
```

**États définis:**
- `BootState` - Initialisation
- `ActiveState` - Écran actif, interaction
- `SleepState` - Deep sleep, RTC only
- `AIInferenceState` - Inference IA en cours
- `SyncState` - Synchronisation BLE/WiFi
- `ChargingState` - En charge

---

### Pattern 3: Strategy (Algorithmes IA)

```cpp
// Strategy Pattern pour les algorithmes IA interchangeables

class IInferenceStrategy {
public:
    virtual InferenceResult infer(const SensorData& data) = 0;
    virtual size_t getModelSize() const = 0;
    virtual uint32_t getInferenceTime() const = 0;
};

class ActivityClassifier : public IInferenceStrategy {
public:
    InferenceResult infer(const SensorData& data) override {
        // Classify: walking, running, sitting, sleeping
        return tflite_infer(activityModel, data);
    }
};

class ContextAnalyzer : public IInferenceStrategy {
public:
    InferenceResult infer(const SensorData& data) override {
        // Analyze context for smart notifications
        return tflite_infer(contextModel, data);
    }
};

class AIEngine {
private:
    IInferenceStrategy* currentStrategy;
public:
    void setStrategy(IInferenceStrategy* strategy) {
        currentStrategy = strategy;
    }
    InferenceResult process(const SensorData& data) {
        return currentStrategy->infer(data);
    }
};
```

**Justification:** Permet de changer l'algorithme IA selon le contexte (batterie faible → modèle léger).

---

### Pattern 4: Factory (Création d'objets)

```cpp
// Factory Pattern pour les Watch Faces

class WatchFaceFactory {
public:
    static std::unique_ptr<WatchFace> create(WatchFaceType type) {
        switch(type) {
            case WatchFaceType::CLASSIC:
                return std::make_unique<ClassicFace>();
            case WatchFaceType::DIGITAL:
                return std::make_unique<DigitalFace>();
            case WatchFaceType::MINIMAL:
                return std::make_unique<MinimalFace>();
            case WatchFaceType::HEALTH:
                return std::make_unique<HealthDashboardFace>();
            default:
                return std::make_unique<ClassicFace>();
        }
    }
};

// Factory pour les notifications
class NotificationFactory {
public:
    static std::unique_ptr<Notification> fromBLEPayload(
        const uint8_t* data, size_t len
    );
};
```

---

### Pattern 5: Singleton (Ressources partagées)

```cpp
// Singleton pour les managers de ressources

class PowerManager {
private:
    static PowerManager* instance;
    BatteryState batteryState;
    PowerMode currentMode;

    PowerManager() {} // Private constructor

public:
    static PowerManager* getInstance() {
        if (!instance) {
            instance = new PowerManager();
        }
        return instance;
    }

    void enterLowPowerMode();
    void optimizeForAI();
    BatteryState getBatteryState();
};
```

**Singletons identifiés:**
- `PowerManager`
- `DisplayManager`
- `EventBus`
- `ConfigManager`

---

## 4. Architecture App Companion (Mobile)

### Architecture MVVM

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    APP COMPANION ARCHITECTURE                          │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                              VIEW LAYER                                │
├─────────────────────────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌────────────┐  │
│  │ HomeScreen   │  │ WatchFaces   │  │ Settings     │  │ Health     │  │
│  │              │  │ Gallery      │  │ Screen       │  │ Dashboard  │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  └────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                           VIEWMODEL LAYER                              │
├─────────────────────────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌────────────┐  │
│  │ HomeVM       │  │ WatchFaceVM  │  │ SettingsVM   │  │ HealthVM   │  │
│  │ - watchState │  │ - faces[]    │  │ - config     │  │ - metrics  │  │
│  │ - connection │  │ - selected   │  │ - sync       │  │ - history  │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  └────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                           REPOSITORY LAYER                             │
├─────────────────────────────────────────────────────────────────────────┤
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────────┐  │
│  │ WatchRepository  │  │ HealthRepository │  │ CloudRepository      │  │
│  │ - bleService     │  │ - localStorage   │  │ - apiClient          │  │
│  │ - cache          │  │ - healthKit      │  │ - authManager        │  │
│  └──────────────────┘  └──────────────────┘  └──────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                            DATA SOURCES                                │
├─────────────────────────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌────────────┐  │
│  │ BLE Service  │  │ Local DB     │  │ REST API     │  │ HealthKit/ │  │
│  │ (CoreBT)     │  │ (SQLite)     │  │ (Retrofit)   │  │ Google Fit │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  └────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
```

### Classes Principales (Kotlin/Swift)

```kotlin
// ViewModel example (Kotlin)
class WatchConnectionViewModel : ViewModel() {
    private val bleRepository: BLERepository
    private val _connectionState = MutableStateFlow<ConnectionState>(Disconnected)
    val connectionState: StateFlow<ConnectionState> = _connectionState

    fun connect(deviceId: String) {
        viewModelScope.launch {
            bleRepository.connect(deviceId)
                .collect { state -> _connectionState.value = state }
        }
    }

    fun syncWatchFace(face: WatchFace) {
        viewModelScope.launch {
            bleRepository.sendCommand(
                Command.SyncWatchFace(face.toBytes())
            )
        }
    }
}

// Repository Pattern
interface WatchRepository {
    suspend fun connect(deviceId: String): Flow<ConnectionState>
    suspend fun sendCommand(command: Command): Result<Response>
    suspend fun getSensorData(): Flow<SensorData>
}
```

---

## 5. API Design - Synchronisation Cloud

### REST API Endpoints

```yaml
# OpenAPI 3.0 Specification

openapi: 3.0.0
info:
  title: Gousset AI Cloud API
  version: 1.0.0

paths:
  /api/v1/devices:
    get:
      summary: List user's registered devices
      responses:
        200:
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Device'
    post:
      summary: Register new device
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/DeviceRegistration'

  /api/v1/devices/{deviceId}/sync:
    post:
      summary: Sync device data to cloud
      parameters:
        - name: deviceId
          in: path
          required: true
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/SyncPayload'

  /api/v1/devices/{deviceId}/watchfaces:
    get:
      summary: Get available watch faces
    post:
      summary: Upload custom watch face

  /api/v1/health/metrics:
    get:
      summary: Get health metrics history
      parameters:
        - name: startDate
        - name: endDate
        - name: metrics[]

  /api/v1/ai/models:
    get:
      summary: Get available AI models
    post:
      summary: Request model update

components:
  schemas:
    Device:
      type: object
      properties:
        id: string
        name: string
        firmwareVersion: string
        lastSeen: datetime
        batteryLevel: integer

    SyncPayload:
      type: object
      properties:
        sensorData: array
        notifications: array
        aiInsights: array
        timestamp: datetime
```

### WebSocket pour Real-time

```typescript
// WebSocket events for real-time sync

interface WSMessage {
  type: 'notification' | 'command' | 'sync' | 'ai_insight';
  payload: any;
  timestamp: number;
}

// Server -> Device
interface PushNotification {
  type: 'notification';
  payload: {
    id: string;
    app: string;
    title: string;
    body: string;
    priority: 'low' | 'medium' | 'high' | 'urgent';
    actions?: Action[];
  };
}

// Device -> Server
interface SensorSync {
  type: 'sync';
  payload: {
    deviceId: string;
    readings: SensorReading[];
    aiContext: AIContext;
  };
}
```

---

## 6. Séparation des Concerns

### Architecture en Couches (Firmware)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         FIRMWARE LAYERS                                │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│  APPLICATION LAYER                                                     │
│  ├── WatchFaceManager                                                   │
│  ├── NotificationHandler                                                │
│  ├── HealthTracker                                                      │
│  └── UserSettings                                                       │
├─────────────────────────────────────────────────────────────────────────┤
│  AI LAYER                                                              │
│  ├── AIEngine                                                          │
│  ├── ModelManager                                                       │
│  ├── ContextAnalyzer                                                    │
│  └── InferenceScheduler                                                │
├─────────────────────────────────────────────────────────────────────────┤
│  SERVICE LAYER                                                         │
│  ├── DisplayService                                                     │
│  ├── SensorService                                                      │
│  ├── CommunicationService                                               │
│  └── StorageService                                                     │
├─────────────────────────────────────────────────────────────────────────┤
│  HAL (Hardware Abstraction Layer)                                      │
│  ├── EInkDriver                                                        │
│  ├── BLEDriver                                                         │
│  ├── I2CDriver                                                         │
│  ├── SPIDriver                                                         │
│  └── GPIODriver                                                        │
├─────────────────────────────────────────────────────────────────────────┤
│  RTOS LAYER (FreeRTOS)                                                 │
│  ├── TaskScheduler                                                      │
│  ├── MemoryManager                                                      │
│  └── PowerManager                                                       │
└─────────────────────────────────────────────────────────────────────────┘
```

### Modules et Responsabilités

| Module | Responsabilité | Dépendances |
|--------|---------------|-------------|
| **UI** | Affichage, interaction, animations | DisplayService, EventBus |
| **Sensors** | Lecture capteurs, filtrage, calibration | HAL, StorageService |
| **AI** | Inference, context, predictions | SensorService, StorageService |
| **Communication** | BLE, WiFi, protocoles | HAL, EventBus |
| **Power** | Gestion énergie, sleep modes | Tous (transversal) |

### Dependency Injection (Firmware)

```cpp
// Simple DI Container for embedded

class ServiceContainer {
private:
    std::map<std::string, void*> services;

public:
    template<typename T>
    void registerService(const std::string& name, T* service) {
        services[name] = static_cast<void*>(service);
    }

    template<typename T>
    T* getService(const std::string& name) {
        return static_cast<T*>(services[name]);
    }
};

// Initialization
void initServices(ServiceContainer& container) {
    // HAL
    container.registerService("eink", new EInkDriver());
    container.registerService("ble", new BLEDriver());

    // Services
    container.registerService("display",
        new DisplayService(container.getService<EInkDriver>("eink")));
    container.registerService("comm",
        new CommService(container.getService<BLEDriver>("ble")));

    // AI
    container.registerService("ai",
        new AIEngine(container.getService<StorageService>("storage")));
}
```

---

## 7. Diagrammes de Séquence

### Séquence: Réception Notification

```
┌────────┐     ┌─────────┐     ┌──────────┐     ┌─────────┐     ┌────────┐
│  BLE   │     │CommMgr  │     │ AIEngine │     │NotifMgr │     │Display │
└────┬───┘     └────┬────┘     └────┬─────┘     └────┬────┘     └────┬───┘
     │              │               │                │               │
     │ BLE_DATA_RX  │               │                │               │
     │─────────────►│               │                │               │
     │              │               │                │               │
     │              │ parseNotif()  │                │               │
     │              │──────────────►│ analyzeContext()               │
     │              │               │───────────────►│               │
     │              │               │                │               │
     │              │               │◄───────────────│               │
     │              │               │  priority      │               │
     │              │               │                │               │
     │              │               │                │ shouldShow()  │
     │              │               │                │───────────────►
     │              │               │                │               │
     │              │               │                │◄──────────────│
     │              │               │                │  shown        │
     │              │               │                │               │
```

### Séquence: Inference IA

```
┌────────┐     ┌──────────┐     ┌─────────┐     ┌────────────┐     ┌───────┐
│Sensors │     │SensorMgr │     │AIEngine │     │ESP32       │     │Power  │
└────┬───┘     └────┬─────┘     └────┬────┘     └─────┬──────┘     └───┬───┘
     │              │                │                │               │
     │ read()       │                │                │               │
     │─────────────►│                │                │               │
     │              │                │                │               │
     │              │ onNewData()    │                │               │
     │              │───────────────►│                │               │
     │              │                │                │               │
     │              │                │ wakeESP32()    │               │
     │              │                │───────────────►│               │
     │              │                │                │ requestPower()│
     │              │                │                │──────────────►│
     │              │                │                │               │
     │              │                │                │◄──────────────│
     │              │                │                │  granted      │
     │              │                │                │               │
     │              │                │ runInference() │               │
     │              │                │───────────────►│               │
     │              │                │                │               │
     │              │                │◄───────────────│               │
     │              │                │   result       │               │
     │              │                │                │               │
     │              │                │ sleepESP32()   │               │
     │              │                │───────────────►│               │
```

---

## 8. Conclusions Architecture

### ✅ Points Forts

1. **Séparation claire** - 5 couches distinctes avec responsabilités définies
2. **Extensibilité** - Patterns permettent ajout de features sans refactoring
3. **Testabilité** - Interfaces facilitent mocking et unit tests
4. **Power-aware** - Architecture conçue pour optimisation énergétique
5. **Cross-platform** - App companion portable iOS/Android

### ⚠️ Complexité

1. **Multi-MCU** - Coordination nRF52/ESP32 ajoute complexité
2. **Real-time constraints** - FreeRTOS require expertise
3. **Memory limits** - OOP overhead sur MCU limité

### 📊 Score Architecture: 8/10

**Verdict**: Architecture solide, adaptée aux contraintes embarquées, évolutive pour futures fonctionnalités.

---

## Annexe: Stack Technique

| Composant | Technologie | Justification |
|-----------|-------------|---------------|
| **Firmware nRF52** | C++ / Arduino | Écosystème riche, BLE natif |
| **Firmware ESP32** | C++ / ESP-IDF | TensorFlow Lite support |
| **RTOS** | FreeRTOS | Standard industrie, léger |
| **App iOS** | Swift / SwiftUI | UI moderne, CoreBluetooth |
| **App Android** | Kotlin / Compose | UI moderne, BLE support |
| **Backend** | Node.js / NestJS | Scalable, TypeScript |
| **Database** | PostgreSQL + Redis | Relationnel + cache |
| **ML Framework** | TensorFlow Lite Micro | Standard TinyML |
