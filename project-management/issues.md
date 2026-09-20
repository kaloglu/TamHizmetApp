# BEKLEYEN GÖREVLER

* ## T1-0003: Firebase Authentication Entegrasyonu (Auth Modülü)
* - [ ] `UserRole` enum'u oluşturulması (`CUSTOMER`, `PROVIDER`, `BOTH`, `ADMIN`).
* - [ ] `UserModel`, `CustomerProfileModel`, `ProviderProfileModel` Dart sınıflarının yazılması (güncel Firestore şemasına göre).
* - [ ] `AuthRepository` ve `AuthService` sınıflarının yazılması (e-posta/şifre ile kayıt & giriş).
* - [ ] `AuthBloc` (veya `AuthNotifier`) ile state yönetiminin kurulması.
* - [ ] **Web** giriş ekranı: "Hizmet Al" / "Hizmet Ver" sekmeleri ile rol seçimli LoginScreen.
* - [ ] **Mobil** RoleSelectionScreen: "Hizmet Almak İstiyorum" / "Hizmet Vermek İstiyorum" seçimi (tek seferlik).
* - [ ] Kayıt ekranı (RegisterScreen): ad, e-posta, şifre.
* - [ ] Başarılı kayıtta `users` Firestore koleksiyonuna `UserModel` kaydedilmesi.
* - [ ] **Onboarding Guard:** Kayıt sonrası role göre zorunlu profil formu ekranına yönlendirme. Profil tamamlanmadan işlem yapan kullanıcı RouteGuard ile bu ekrana döndürülür.
* - [ ] Mobil için ayrı entry-point: `main_customer.dart` ve `main_provider.dart` iskeletlerinin oluşturulması.

* ## T2-0002: Dinamik Form Altyapısı (FormBuilderWidget)
* **⚠️ Bu görev T1-0003 (Auth) bittikten sonra başlanacaktır.**
* - [ ] `CategoryModel` ve `QuestionModel` Dart sınıflarının oluşturulması (Firestore `categories` koleksiyon şemasına göre).
* - [ ] `FormBuilderWidget` bileşeninin yazılması: Soru tipine göre widget seçimi:
*   - `single_choice` → `RadioListTile`
*   - `multiple_choice` → `CheckboxListTile`
*   - `boolean` → `SwitchListTile`
*   - `text` → `TextField`
* - [ ] Yanıtların `Map<String, dynamic>` yapısında (`form_answers`) toplanması.
* - [ ] Bileşenin `customer_app` hizmet talebi ekranında kullanılacak şekilde entegre edilmesi.

---

# TAMAMLANAN GÖREVLER

** ## D1-0001: Flutter Proje Başlangıcı ve Temel Ayarlar
** - [x] Flutter uygulamasının (TamHizmetApp) oluşturulması.
** - [x] `pubspec.yaml` bağımlılıklarının eklenmesi (Riverpod, Firebase, url_launcher vb.).
** 
** ## D1-0002: Firebase Proje Kurulumu ve CLI Entegrasyonu
** - [x] Firebase projesinin başlatılması ve `flutterfire configure` ile entegrasyonu.
** - [x] Kullanılacak Firebase servislerinin aktif edilmesi (Auth, Firestore, Cloud Functions).
** 
** ## D2-0001: Klasör Yapısının (Core/Features) Oluşturulması
** - [x] `lib/core` ve alt dizinlerinin (constants, services, utils, widgets) oluşturulması.
** - [x] `lib/features` ve alt dizinlerinin (auth, customer_app, provider_app, vb.) oluşturulması.
