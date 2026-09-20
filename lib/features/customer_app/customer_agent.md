# Customer App Feature — Agent Guide

## Amaç
Müşteri modülünün tüm ekranlarını, iş mantığını ve veri katmanını yönetir. Müşteri; kategori seçip dinamik form doldurarak hizmet talebi (request) oluşturur, gelen teklifleri inceler ve Pro ile mesajlaşır.

---

## Klasör Yapısı

```
lib/features/customer_app/
├── data/
│   ├── models/         → Firestore ↔ Dart dönüşüm sınıfları
│   │   ├── request_model.dart
│   │   └── quote_model.dart
│   └── repositories/   → Firestore CRUD işlemleri
│       ├── request_repository_impl.dart
│       └── quote_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── request_entity.dart
│   │   └── quote_entity.dart
│   └── usecases/
│       ├── create_request_usecase.dart
│       ├── get_quotes_usecase.dart
│       └── accept_quote_usecase.dart
└── presentation/
    ├── bloc/
    │   ├── request_bloc.dart
    │   └── quote_bloc.dart
    ├── screens/
    │   ├── home_screen.dart             ← Kategori listesi
    │   ├── category_form_screen.dart    ← Dinamik form (FormBuilderWidget)
    │   ├── my_requests_screen.dart      ← Açık/kapanan talepler
    │   └── quotes_screen.dart          ← Gelen teklifler
    └── widgets/
        ├── category_card_widget.dart
        └── quote_card_widget.dart
```

---

## Temel İş Kuralları

1. **Onboarding Guard:** `customer_profiles` dokümanı eksikse kullanıcı profil ekranına yönlendirilir.
2. **Dinamik Form:** `categories/{id}` dokümanındaki `questions` dizisi `FormBuilderWidget` tarafından otomatik render edilir.
3. **Teklif Limiti:** Bir talep en fazla `max_quotes` (varsayılan: 5) teklif alabilir.
4. **Müşteri Mesajı:** Teklif sonrası Pro'ya sınırsız mesaj gönderebilir.
5. **Talep Durumu:** `OPEN → IN_PROGRESS → COMPLETED | CANCELLED`
6. **Konum:** `requests` dokümanında `location.province / district / neighborhood` kullanılır.

---

## Bağımlılıklar
- `cloud_firestore`
- `flutter_riverpod`
- `go_router`
- `FormBuilderWidget` (`core/widgets/`)

---

## İlgili Görev & Testler
- Görev: **T2-0002** (FormBuilderWidget), sonraki müşteri ekran görevleri
- Testler: C1-0005 → C1-0009
