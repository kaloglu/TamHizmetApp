# Profile Feature — Agent Guide

## Amaç
Hem müşteri hem de profesyonelin profil bilgilerini görüntülemesini, düzenlemesini ve Onboarding Guard kapsamında zorunlu profil tamamlama formunu sunmasını sağlar.

---

## Klasör Yapısı

```
lib/features/profile/
├── data/
│   ├── models/
│   │   ├── customer_profile_model.dart
│   │   └── provider_profile_model.dart
│   └── repositories/
│       ├── customer_profile_repository_impl.dart
│       └── provider_profile_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── customer_profile_entity.dart
│   │   └── provider_profile_entity.dart
│   └── usecases/
│       ├── save_customer_profile_usecase.dart
│       ├── save_provider_profile_usecase.dart
│       └── get_profile_usecase.dart
└── presentation/
    ├── bloc/
    │   └── profile_bloc.dart
    ├── screens/
    │   ├── customer_profile_form_screen.dart  ← Onboarding zorunlu form
    │   ├── provider_profile_form_screen.dart  ← Onboarding zorunlu form
    │   └── profile_view_screen.dart           ← Profil görüntüleme
    └── widgets/
        ├── profile_avatar_widget.dart
        └── province_district_picker_widget.dart
```

---

## Temel İş Kuralları

1. **Zorunlu Alanlar — Müşteri (`customer_profiles`):**
   - `province`, `district`, `neighborhood`, `address`
   - Eksik ise RouteGuard `customer_profile_form_screen`'e yönlendirir.

2. **Zorunlu Alanlar — Pro (`provider_profiles`):**
   - `categories` (en az 1), `service_provinces`, `service_districts`, `service_neighborhoods`
   - Eksik ise RouteGuard `provider_profile_form_screen`'e yönlendirir.

3. **Onboarding Guard Tetikleme:** Auth feature'daki RouteGuard, bu feature'ın repository'sini çağırarak profil varlığını kontrol eder. Doküman yoksa veya gerekli alanlar boşsa yönlendirme yapılır.

4. **Profil Güncelleme:** Kullanıcı sonradan profil sayfasından bilgileri güncelleyebilir. Güncelleme sonrası Firestore'daki ilgili doküman (`customer_profiles/{uid}` veya `provider_profiles/{uid}`) üzerine yazılır.

5. **Web Rol Geçişi:** `active_role = BOTH` olan kullanıcı profil menüsündeki role-switch butonu aracılığıyla aktif rolünü değiştirir; bu `users/{uid}.active_role` alanını günceller.

6. **Müşterinin "Hizmet Ver" Rolüne Geçişi:**
Müşteri, Profil ekranındaki menüden "Hizmet Ver" seçeneğini seçerek profesyonel rolüne geçebilir. Bu işlem sırasında mevcut müşteri profili (`customer_profiles`) korunarak kullanıcıya yeni bir profesyonel profili (`provider_profiles`) oluşturulur. Kullanıcının `users/{uid}` kaydındaki `active_role` değeri `BOTH` olarak güncellenir. Artık kullanıcı her iki rolün de özelliklerine sahiptir. 

7. **Profesyonelin "Hizmet Al" Rolüne Geçişi:**
Profesyonel, Profil ekranındaki menüden "Hizmet Al" seçeneğini seçerek müşteri rolüne geçebilir. Bu işlem sırasında mevcut profesyonel profili (`provider_profiles`) korunarak kullanıcıya yeni bir müşteri profili (`customer_profiles`) oluşturulur. Kullanıcının `users/{uid}` kaydındaki `active_role` değeri `BOTH` olarak güncellenir. Artık kullanıcı her iki rolün de özelliklerine sahiptir. 

8. **Hesabın silinmesi**
Kullanıcı profil sayfasından hesabını silebilir. Bu işlem sırasında `users/{uid}` dokümanı silinir. Bununla birlikte, customeri provider yada both olmasına bakılmaksızın `customer_profiles` ve `provider_profiles` dokümanları inactive olarak işaretlenir ve 30 gün boyunca saklanır. 30 günde bir inactive verilerin tamamen silinmesi için gerekli betik hazırlanır.

---

## Firestore Şeması
```
customer_profiles/{uid}
  - user_id, created_at, province, district, neighborhood, address, rating_avg, review_count

provider_profiles/{uid}
  - user_id, categories[], service_provinces[], service_districts[], service_neighborhoods[]
  - credit_balance, rating_avg, review_count, is_verified, created_at
```

---

## Bağımlılıklar
- `cloud_firestore`
- `flutter_riverpod`
- `go_router`

---

## İlgili Görev & Testler
- Görev: **T1-0003** (Onboarding Guard), profil yönetimi görevleri
- Testler: C1-0010, C1-0011, C1-0012
