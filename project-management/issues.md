# BEKLEYEN GÖREVLER

** ## T1-0003: Firebase Authentication Entegrasyonu (Sadece Google Sign-In)
** - [ ] `google_sign_in` paketinin `pubspec.yaml`'a eklenmesi.
** - [ ] `UserRole` enum'u oluşturulması (`CUSTOMER`, `PROVIDER`, `BOTH`, `ADMIN`).
** - [ ] `UserModel` Dart sınıfının yazılması (fromMap, toMap, copyWith).
** - [ ] `AuthRepository` sınıfının yazılması (Google Sign-In ile oturum açma, oturumu kapatma, authStateChanges stream).
** - [ ] `AuthController` (Riverpod AsyncNotifier) ile kimlik doğrulama durumunun yönetilmesi.
** - [ ] İlk girişte `users/{uid}` dokümanının Google profil bilgileriyle (ad, e-posta, foto) Firestore'a kaydedilmesi.
** - [x] **Web** LoginScreen: "Hizmet Al" ve "Hizmet Ver" sekmeleri altında "Google ile Giriş Yap" butonu. (UI Tamamlandı)
** - [x] **Mobil** LoginScreen: "Google ile Giriş Yap" butonu. (UI Tamamlandı)
** - [ ] **Onboarding Guard:** Giriş sonrası kullanıcının profili (`customer_profiles` veya `provider_profiles`) yoksa profil tamamlama sayfasına yönlendirme.
** - [ ] Mobil için ayrı entry-point: `main_customer.dart` ve `main_provider.dart` iskeletlerinin oluşturulması.

*** ## T2-0002: Dinamik Form Altyapısı (FormBuilderWidget)
*** **⚠️ Bu görev T1-0003 (Auth) bittikten sonra başlanacaktır.**
*** - [ ] `CategoryModel` ve `QuestionModel` Dart sınıflarının oluşturulması (Firestore `categories` koleksiyon şemasına göre).
*** - [ ] `FormBuilderWidget` bileşeninin yazılması: Soru tipine göre widget seçimi:
***   - `single_choice` → `RadioListTile`
***   - `multiple_choice` → `CheckboxListTile`
***   - `boolean` → `SwitchListTile`
***   - `text` → `TextField`
*** - [ ] Yanıtların `Map<String, dynamic>` yapısında (`form_answers`) toplanması.
*** - [ ] Bileşenin `customer_app` hizmet talebi ekranında kullanılacak şekilde entegre edilmesi.

---

# TAMAMLANAN GÖREVLER

* ## D2-0004: Müşteri Giriş Ekranı (Mobil & Web) Geliştirmesi
* - [x] `lib/features/auth/presentation/screens/customer_login_screen.dart` dosyası oluşturuldu.
* - [x] `LayoutBuilder` kullanılarak Mobil ve Web için responsive geçiş sağlandı.
* - [x] `lib/features/auth/presentation/widgets/google_sign_in_button.dart` eklendi.
* - [x] `flutter_localizations` kurulumu ve `lib/l10n/app_tr.arb` metin girişi tamamlandı.
* - [x] Tasarım, Google Stitch ve `DESIGN.md` (Primary: #40E0D0) ile %100 uyumlu hale getirildi.

## D2-0003: Feature Agent Rehberleri ve Mimari Kurallarin Revizyonu
- [x] `agent.md` dosyasına Riverpod Code generation ve Notifier mimarisi kuralı eklendi.
- [x] `auth_agent.md`, `chat_agent.md`, `customer_agent.md`, `profile_agent.md` ve `provider_agent.md` dosyaları Riverpod mimarisine, yeni iş kurallarına ve rol geçiş mantığına uygun şekilde revize edildi.

## D2-0002: AppThemes Sınıfı ve Material 3 Tema Yönetimi
- [x] `lib/core/theme/app_themes.dart` dosyasının oluşturulması.
- [x] Marka rengi #40E0D0 olarak güncellendi.

## D1-0001: Flutter Proje Başlangıcı ve Temel Ayarlar
- [x] Flutter uygulamasının oluşturulması.

## D1-0002: Firebase Proje Kurulumu ve CLI Entegrasyonu
- [x] Firebase projesinin başlatılması ve entegrasyonu.

## D2-0001: Klasör Yapısının (Core/Features) Oluşturulması
- [x] Temel klasör mimarisi kuruldu.
