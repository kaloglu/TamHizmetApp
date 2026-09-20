# Auth Feature — Agent Guide

## Amaç
Kullanıcı kimlik doğrulama (**Sadece Google Sign-In**), rol seçimi ve zorunlu profil tamamlama (Onboarding Guard) işlemlerini yönetir.

---

## Klasör Yapısı (Pragmatik Feature-First)

```
lib/features/auth/
├── data/
│   └── auth_repository.dart         → Firebase Auth & GoogleSignIn işlemleri
├── domain/
│   └── user_model.dart              → UserModel, UserRole enum (fromMap, toMap)
└── presentation/
    ├── controllers/
    │   └── auth_controller.dart     → Riverpod Notifier (AuthState, Google Sign-In)
    ├── screens/
    │   ├── role_selection_screen.dart ← Mobil ilk açılış: Hizmet Al / Hizmet Ver
    │   └── login_screen.dart          ← Web sekmeli / Mobil Google Sign-In butonu
    └── widgets/
        ├── google_sign_in_button.dart
        └── role_card_widget.dart
```

---

## Temel İş Kuralları

1. **Kimlik Doğrulama Yöntemi:** Yalnızca **Google Sign-In** kullanılır. E-posta ve şifre formları kullanılmaz.
2. **UserRole:** `CUSTOMER | PROVIDER | BOTH | ADMIN`
3. **Web Giriş:** LoginScreen'de "Hizmet Al" ve "Hizmet Ver" sekmeleri bulunur. Kullanıcı sekmesini seçer ve "Google ile Giriş Yap" butonuna tıklar. `active_role = BOTH` olan kullanıcı menüden rol değiştirebilir. Kullanıcı BOTH değilse menüden geçiş yerine "Hizmet Ver/Al Profili Oluştur" seçeneği çıkar. Eğer BOTH ise menüden switch ile ilgili rolün ana ekranına geçilir.
4. **Mobil Giriş:** Uygulama entry-point'i (`main_customer.dart` veya `main_provider.dart`) rolü sabitler. İlk girişte "Google ile Giriş Yap" butonu ile kimlik doğrulanır. Mobil cihazlarda BOTH seçeneği yoktur; kullanıcı kurulu olan uygulamayı kullanır.
5. **Onboarding Guard:** Google Sign-In sonrası kullanıcının `customer_profiles` veya `provider_profiles` dokümanı kontrol edilir. Profil oluşturulmamışsa hiçbir işlem yapamaz; RouteGuard eksik profili tespit edip profil tamamlama ekranına yönlendirir. AuthController, sadece Firebase oturum durumunu değil, aynı zamanda Firestore'daki ilgili customer_profiles veya provider_profiles dokümanının varlık durumunu da (State) tutmalıdır. go_router RouteGuard, yönlendirme kararını bu birleşik duruma göre vermelidir.
6. **Firestore Kaydı:** İlk Google girişinde `users/{uid}` dokümanı Google bilgileriyle (ad, e-posta, foto URL) oluşturulur.

---

## Bağımlılıklar
- `firebase_auth`
- `google_sign_in`
- `cloud_firestore`
- `flutter_riverpod` (AuthController için)
- `go_router` (RouteGuard için)

---

## İlgili Görev & Testler
- Görev: **T1-0003**
- Testler: C1-0001, C1-0003, C1-0004, C2-0001, C2-0002, C2-0003, C1-0010, C1-0011, C1-0012
