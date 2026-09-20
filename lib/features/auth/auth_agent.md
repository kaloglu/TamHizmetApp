# Auth Feature — Agent Guide

## Amaç
Kullanıcı kimlik doğrulama, rol seçimi ve zorunlu profil tamamlama (Onboarding Guard) işlemlerini yönetir.

---

## Klasör Yapısı

```
lib/features/auth/
├── data/
│   ├── models/         → Firestore ↔ Dart dönüşüm sınıfları
│   │   └── user_model.dart
│   └── repositories/   → Firebase Auth işlemleri (AuthRepositoryImpl)
│       └── auth_repository_impl.dart
├── domain/
│   ├── entities/       → Saf Dart varlık sınıfları (iş mantığı bağımsız)
│   │   └── user_entity.dart
│   └── usecases/       → Tek sorumluluk iş kuralları
│       ├── sign_in_usecase.dart
│       ├── sign_up_usecase.dart
│       └── sign_out_usecase.dart
└── presentation/
    ├── bloc/           → AuthBloc / AuthNotifier (state yönetimi)
    │   ├── auth_bloc.dart
    │   ├── auth_event.dart
    │   └── auth_state.dart
    ├── screens/        → Ekranlar
    │   ├── role_selection_screen.dart   ← Mobil: Hizmet Al / Hizmet Ver
    │   ├── login_screen.dart            ← Web: Sekmeli giriş | Mobil: Standart
    │   └── register_screen.dart
    └── widgets/        → Ekranlara özgü küçük bileşenler
        ├── role_card_widget.dart
        └── auth_text_field_widget.dart
```

---

## Temel İş Kuralları

1. **UserRole:** `CUSTOMER | PROVIDER | BOTH | ADMIN`
2. **Web Giriş:** LoginScreen'de "Hizmet Al" ve "Hizmet Ver" sekmeleri bulunur. `active_role = BOTH` olan kullanıcı menüden rol değiştirebilir.
3. **Mobil Giriş:** Uygulama entry-point'i (`main_customer.dart` veya `main_provider.dart`) rolü sabitler. RoleSelectionScreen ilk kayıtta bir kez gösterilir.
4. **Onboarding Guard:** Kayıt sonrası `customer_profiles` veya `provider_profiles` dokümanı oluşturulmadan kullanıcı hiçbir işlem yapamaz. RouteGuard eksik profili tespit edince profil tamamlama ekranına yönlendirir.
5. **Firestore Yazımı:** Kayıt başarılı olduğunda `users/{uid}` dokümanı oluşturulur.

---

## Bağımlılıklar
- `firebase_auth`
- `cloud_firestore`
- `flutter_riverpod` (AuthNotifier için)
- `go_router` (RouteGuard için)

---

## İlgili Görev & Testler
- Görev: **T1-0003**
- Testler: C1-0001, C1-0002, C1-0003, C1-0004, C2-0001, C2-0002, C2-0003, C1-0010, C1-0011, C1-0012
