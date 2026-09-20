# Core — Agent Guide

## Amaç
Tüm feature'lar tarafından paylaşılan yardımcı sınıflar, servisler, sabitler ve genel widget'ları barındırır. Hiçbir feature-spesifik iş mantığı buraya girmez.

---

## Klasör Yapısı

```
lib/core/
├── constants/          → Uygulama geneli sabitler
│   ├── app_colors.dart
│   ├── app_strings.dart
│   └── app_routes.dart
├── services/           → Firebase ve harici servis wrappers
│   ├── firebase_auth_service.dart
│   ├── firestore_service.dart
│   ├── cloud_functions_service.dart
│   └── url_launcher_service.dart
├── utils/              → Yardımcı fonksiyonlar
│   ├── validators.dart          → Form doğrulama kuralları
│   ├── date_formatter.dart
│   └── logger.dart
└── widgets/            → Tüm feature'larda kullanılan genel bileşenler
    ├── form_builder_widget.dart         ← T2-0002 (Dinamik Form)
    ├── responsive_overlay_blocker.dart  ← Web mobil engelleme
    ├── loading_widget.dart
    └── error_widget.dart
```

---

## Temel Kurallar

1. **Bağımlılık yönü:** Yalnızca `core → dış kütüphaneler` yönünde bağımlılık olabilir. Hiçbir `feature` doğrudan başka bir `feature`'a bağımlı olamaz; ortak ihtiyaçlar `core` üzerinden sağlanır.
2. **FormBuilderWidget (T2-0002):** `categories/{id}` dokümanındaki `questions` dizisini alır; soru tipine göre (`single_choice`, `multiple_choice`, `boolean`, `text`) uygun Flutter widget'ını render eder. Yanıtları `Map<String, dynamic>` olarak callback ile döner.
3. **ResponsiveOverlayBlocker:** Web'de `width < 600px` olduğunda tüm ekranı kaplar. Google Play'e yönlendirme butonları (Hizmet Al / Hizmet Ver) içerir.
4. **UrlLauncherService:** `https://wa.me/<phone>` formatında WhatsApp açma işlemini sarmalayan tek sorumluluk sınıfıdır.
5. **Validators:** E-posta, şifre, telefon doğrulama kuralları buradadır; tüm formlar bu utility'yi kullanır.

---

## Bağımlılıklar
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_functions`
- `url_launcher`
- `flutter_riverpod`
