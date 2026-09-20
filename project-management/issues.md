# BEKLEYEN GÖREVLER

* ## T1-0003: Firebase Authentication Entegrasyonu (Sadece Google Sign-In)
* - [ ] `google_sign_in` paketinin `pubspec.yaml`'a eklenmesi.
* - [ ] `UserRole` enum'u oluşturulması (`CUSTOMER`, `PROVIDER`, `BOTH`, `ADMIN`).
* - [ ] `UserModel` Dart sınıfının yazılması (fromMap, toMap, copyWith).
* - [ ] `AuthRepository` sınıfının yazılması (Google Sign-In ile oturum açma, oturumu kapatma, authStateChanges stream).
* - [ ] `AuthController` (Riverpod AsyncNotifier) ile kimlik doğrulama durumunun yönetilmesi.
* - [ ] İlk girişte `users/{uid}` dokümanının Google profil bilgileriyle (ad, e-posta, foto) Firestore'a kaydedilmesi.
* - [ ] **Web** LoginScreen: "Hizmet Al" ve "Hizmet Ver" sekmeleri altında "Google ile Giriş Yap" butonu.
* - [ ] **Mobil** LoginScreen: "Google ile Giriş Yap" butonu.
* - [ ] **Onboarding Guard:** Giriş sonrası kullanıcının profili (`customer_profiles` veya `provider_profiles`) yoksa profil tamamlama sayfasına yönlendirme.
* - [ ] Mobil için ayrı entry-point: `main_customer.dart` ve `main_provider.dart` iskeletlerinin oluşturulması.

** ## T2-0002: Dinamik Form Altyapısı (FormBuilderWidget)
** **⚠️ Bu görev T1-0003 (Auth) bittikten sonra başlanacaktır.**
** - [ ] `CategoryModel` ve `QuestionModel` Dart sınıflarının oluşturulması (Firestore `categories` koleksiyon şemasına göre).
** - [ ] `FormBuilderWidget` bileşeninin yazılması: Soru tipine göre widget seçimi:
**   - `single_choice` → `RadioListTile`
**   - `multiple_choice` → `CheckboxListTile`
**   - `boolean` → `SwitchListTile`
**   - `text` → `TextField`
** - [ ] Yanıtların `Map<String, dynamic>` yapısında (`form_answers`) toplanması.
** - [ ] Bileşenin `customer_app` hizmet talebi ekranında kullanılacak şekilde entegre edilmesi.

---

# TAMAMLANAN GÖREVLER

* ## D2-0003: Feature Agent Rehberleri ve Mimari Kurallarin Revizyonu
* - [x] `agent.md` dosyasına Riverpod Code generation ve Notifier mimarisi kuralı eklendi.
* - [x] `auth_agent.md`, `chat_agent.md`, `customer_agent.md`, `profile_agent.md` ve `provider_agent.md` dosyaları Riverpod mimarisine, yeni iş kurallarına ve rol geçiş mantığına uygun şekilde revize edildi.
* - [x] Klasör yapılarındaki eski `bloc/` dizinleri `controllers/` veya `providers/` olarak güncellendi.

* ## D2-0002: AppThemes Sınıfı ve Material 3 Tema Yönetimi
* - [x] `lib/core/theme/app_themes.dart` dosyasının oluşturulması.
* - [x] `AppThemes` sınıfının tanımlanması.
* - [x] `lightTheme` ThemeData oluşturulması (Arka plan: #F8F9FA, primary: #00C4B5, useMaterial3: true).
* - [x] `darkTheme` ThemeData oluşturulması (Arka plan: #1E1E1E, primary: #00C4B5, useMaterial3: true).
* - [x] Section 8.1'deki merkezi tema yönetimi ve sıfır hardcoded renk kullanımı kurallarına uygun altyapının hazırlanması.

## D1-0001: Flutter Proje Başlangıcı ve Temel Ayarlar
- [x] Flutter uygulamasının (TamHizmetApp) oluşturulması.
- [x] `pubspec.yaml` bağımlılıklarının eklenmesi (Riverpod, Firebase, url_launcher vb.).

## D1-0002: Firebase Proje Kurulumu ve CLI Entegrasyonu
- [x] Firebase projesinin başlatılması ve `flutterfire configure` ile entegrasyonu.
- [x] Kullanılacak Firebase servislerinin aktif edilmesi (Auth, Firestore, Cloud Functions).

## D2-0001: Klasör Yapısının (Core/Features) Oluşturulması
- [x] `lib/core` ve alt dizinlerinin (constants, services, utils, widgets) oluşturulması.
- [x] `lib/features` ve alt dizinlerinin (auth, customer_app, provider_app, vb.) oluşturulması.
