# Agent Context & Architecture Guide: TamHizmet.app

## 1. Proje Özeti & Vizyon
**TamHizmet.app**, hizmet veren profesyoneller (Pro) ile hizmet almak isteyen müşterileri buluşturan çift taraflı (pazaryeri) bir platformdur.

* **Proje Tipi:** Tek Flutter kod tabanı — `UserRole` değerine göre iki ayrı modül:
  * **Tam Hizmet Al:** Müşteri Modülü → [`customer_agent.md`](lib/features/customer_app/customer_agent.md)
  * **Tam Hizmet Ver:** Profesyonel (Pro) Modülü → [`provider_agent.md`](lib/features/provider_app/provider_agent.md)
* **Hedef Platformlar:** Android (iki ayrı APK) ve Web (tek uygulama, rol seçimli).

---

## 2. Teknoloji Yığını (Tech Stack)

| Katman | Teknoloji |
|---|---|
| Frontend | Flutter (Dart) |
| Backend | Firebase (Auth, Firestore, Cloud Functions, Cloud Messaging, Storage) |
| State Management | Riverpod (Code generation ile @riverpod notasyonu kullanılarak Notifier mimarisi uygulanacaktır) |
| Routing | go_router (RouteGuard ile Onboarding kontrolü) |
| Design System | Material 3 + Responsive Layout |
| Harici | `url_launcher` (WhatsApp), Google Play IAP (Mobil), PayTR/İyzico (Web) |

---

## 3. Mimari Yapı & Feature Rehberleri

Proje **Feature-First / Clean Architecture** prensibine göre yapılandırılmıştır. Her feature `data / domain / presentation` katmanlarına sahiptir. **Tüm teknik detaylar, iş kuralları ve implementasyon adımları ilgili feature'ın kendi agent dosyasında açıklanmıştır.**

> [!CRITICAL]
> **KATI KURAL:** Herhangi bir feature ile çalışmaya başlamadan önce mutlaka ilgili feature'ın `.md` (agent) dosyası dikkatlice incelenmeli, yapılacak değişiklikler ya da yapılan düzenlemeler o dosyaya uygun şekilde işlenmelidir! Her işten önce ilgili feature agent dosyalarının kontrol edilmesi zorunludur.

```
lib/
├── core/           → Paylaşımlı servisler, widget'lar, sabitler
├── features/
│   ├── auth/
│   ├── customer_app/
│   ├── provider_app/
│   ├── chat/
│   └── profile/
├── main_customer.dart   ← Müşteri APK giriş noktası
├── main_provider.dart   ← Pro APK giriş noktası
└── main.dart            ← Web giriş noktası (rol seçimli)
```

### Feature Agent Dosyaları

| Feature | Kapsam | Agent Dosyası |
|---|---|---|
| **Core** | Paylaşımlı servisler, FormBuilderWidget, Overlay Blocker | [`core_agent.md`](lib/core/core_agent.md) |
| **Auth** | Kayıt, giriş, rol seçimi, Onboarding Guard | [`auth_agent.md`](lib/features/auth/auth_agent.md) |
| **Customer App** | Hizmet talebi, dinamik form, teklifler | [`customer_agent.md`](lib/features/customer_app/customer_agent.md) |
| **Provider App** | Talep listeleme, teklif verme, iletişim no al | [`provider_agent.md`](lib/features/provider_app/provider_agent.md) |
| **Chat** | Teklif sonrası mesajlaşma, Pro mesaj limiti | [`chat_agent.md`](lib/features/chat/chat_agent.md) |
| **Profile** | Müşteri & Pro profil formu, Onboarding Guard | [`profile_agent.md`](lib/features/profile/profile_agent.md) |

---

## 4. Kritik Platform Kuralları (Özet)

> Detaylar için ilgili feature agent dosyasına bakın.

* **Mobil / Web App Ayrımı:** Mobil'de iki ayrı APK (`main_customer.dart`, `main_provider.dart`). Web'de tek uygulama — kullanıcı "Hizmet Al / Hizmet Ver" sekmeleriyle giriş yapar. → [`auth_agent.md`](lib/features/auth/auth_agent.md)

* **Onboarding Guard:** Kayıt sonrası profil formu doldurulmadan hiçbir işlem yapılamaz. RouteGuard eksik profili tespit eder. → [`profile_agent.md`](lib/features/profile/profile_agent.md)

* **Web Mobil Engelleme (Overlay Blocker):** Web'de `width < 600px` olduğunda tüm ekranı kaplayan yönlendirme modalı devreye girer. → [`core_agent.md`](lib/core/core_agent.md)

* **Pro Mesaj Limiti:** Pro teklif sonrası yalnızca 1 mesaj hakkına sahiptir. → [`chat_agent.md`](lib/features/chat/chat_agent.md)

* **Dinamik Form:** `categories` koleksiyonundaki `questions` dizisi `FormBuilderWidget` ile otomatik render edilir. → [`customer_agent.md`](lib/features/customer_app/customer_agent.md) & [`core_agent.md`](lib/core/core_agent.md)

---

## 5. Gelir Modeli ve Monetizasyon (Özet)

> Detaylar için [`provider_agent.md`](lib/features/provider_app/provider_agent.md) dosyasına bakın.


---

## 6. Veritabanı Şeması (Özet)

> Tam JSON şemaları ve alan açıklamaları ilgili feature agent dosyalarındadır.

| Koleksiyon | Sahip Feature |
|---|---|
| `users` | [`auth_agent.md`](lib/features/auth/auth_agent.md) |
| `customer_profiles` | [`profile_agent.md`](lib/features/profile/profile_agent.md) |
| `provider_profiles` | [`profile_agent.md`](lib/features/profile/profile_agent.md) |
| `categories` | [`customer_agent.md`](lib/features/customer_app/customer_agent.md) |
| `requests` | [`customer_agent.md`](lib/features/customer_app/customer_agent.md) |
| `quotes` | [`provider_agent.md`](lib/features/provider_app/provider_agent.md) |
| `chats` & `messages` | [`chat_agent.md`](lib/features/chat/chat_agent.md) |

---

## 7. Proje Yönetimi ve Dosya Sistemi Kuralları (Project Management)

Geliştirme süreci boyunca tüm proje yönetimi, görev takibi ve dokümantasyon güncellemeleri ana dizindeki `project-management/` klasörü içinde yürütülecektir. Ajan, bu klasördeki markdown dosyalarını aşağıdaki katı kurallara göre yönetecek ve güncelleyecektir. Öncelik seviyeleri her zaman 1 ile 9 arasındadır (1 en yüksek öncelik).

### 7.1. Dosya Türleri ve Formatları
Sadece özet başlıkların ve durumların takip edildiği, detayların ise ayrıştırıldığı bir yapı kullanılacaktır.

*   **`todo.md` (Yapılacaklar):** Sadece bekleyen işlerin özet başlıkları yer alır.
    *   Format: `T<Öncelik>-SıraNo: Özet Başlık` (Örn: `T1-0001: Firestore Auth Entegrasyonu`)
    *   Görevler her zaman önem derecesine (1'den 9'a doğru) sıralanır.
*   **`done.md` (Tamamlananlar):** Biten işler `todo.md` dosyasından buraya taşınır.
    *   Format: `T` harfi `D` olur. (Örn: `D1-0001: Firestore Auth Entegrasyonu`)
*   **`issues.md` (Görev Detayları):** Görevlerin teknik detayları ve açıklamaları burada tutulur.
    *   **Üst Kısım (Bekleyenler):** `todo.md` içindeki `T` ile başlayan görevlerin detaylı açıklamaları.
    *   **Alt Kısım (Bitenler):** `done.md` içindeki `D` ile başlayan görevlerin detaylı açıklamaları.
*   **`questions.md` (Kritik Sorular):** Projenin işleyişi hakkında netleşmesi gereken sorular.
    *   Bekleyen Soru Formatı: `Q<Öncelik>-0001: Soru metni` (Örn: `Q1-0001: ...`)
    *   Cevaplananlar dosyanın en altına taşınır.
    *   Cevap Formatı: Cevaplar `A: ` önekiyle eklenir. Ajan, kullanıcıdan aldığı cevabı kopyala-yapıştır yapmamalı, **kendi anladığı şekilde teknik bir özete dönüştürerek** kaydetmelidir.
*   **`tests.md` (Test Senaryoları):** Test edilecek modüller ve özellikler.
    *   Bekleyen Test Formatı: `C<Öncelik>-0001: Test edilecek işlem` (Örn: `C2-0001: ...`)
    *   Başarıyla biten testler dosyanın en altına taşınır.

### 7.2. Satır İçi Değişiklik Takibi (Rolling Asterisk System)
`project-management/` klasöründeki herhangi bir `.md` dosyasında yapılan tüm değişiklikler (yeni eklenenler veya güncellenenler) ajanın uygulayacağı bir "Yıldız Döngüsü" (Eskime Payı) ile takip edilecektir.

Bir dosyada her yeni güncelleme (commit/mesaj döngüsü) yapıldığında ajan tüm satırların başındaki yıldızları şu kurala göre kaydıracaktır:

1.  **Yeni Eklenen veya O An Değişen Satır:** Başına `*` konur. (En yeni)
2.  **Önceki Güncellemeden Kalan `*` Satırları:** Başına bir yıldız daha eklenerek `**` yapılır. (Bir tur eski)
3.  **Önceki Güncellemeden Kalan `**` Satırları:** Başına bir yıldız daha eklenerek `***` yapılır. (İki tur eski)
4.  **Önceki Güncellemeden Kalan `***` Satırları:** Yıldızlar tamamen temizlenir ve normal metne dönüşür. (Artık standart/eski kabul edilir).

**Örnek Uygulama Döngüsü:**
*   *1. Güncelleme:* `* T1-0001: Yeni görev eklendi`
*   *2. Güncelleme:* `** T1-0001: Yeni görev eklendi` (Eskidi) \n `* T2-0002: Başka görev eklendi` (Yeni)
*   *3. Güncelleme:* `*** T1-0001` \n `** T2-0002` \n `* T1-0003`
*   *4. Güncelleme:* `T1-0001` (Yıldızlar silindi) \n `*** T2-0002` \n `** T1-0003` \n `* D1-0004`

### 7.3. Versiyon Kontrolü (Git) ve Commit Mesajı Kuralları
Ajan, projede kod değişikliklerini commit ederken aşağıdaki kurallara harfiyen uymalıdır:

1. **Dil:** Tüm commit mesajları kesinlikle **Türkçe** yazılacaktır.
2. **Tamamlanan Görevler:** `todo.md` dosyasından `done.md` dosyasına taşınan (yani tamamlanan) işler varsa, commit başlığında veya açıklamasında bu işlerin referans numaraları (`D` prefixi ile) mutlaka belirtilmelidir.
3. **Yeni Eklenen veya Güncellenen Öğeler (Q, A, C/CH):** Bu commit kapsamında `questions.md` veya `tests.md` dosyalarında oluşturulan yeni Sorular (`Q`), eklenen Cevaplar (`A`) veya yeni Test/Kontrol maddeleri (`C` veya `CH`) varsa, commit mesajının açıklama (body) kısmında referans numaralarıyla listelenmelidir.

**Örnek Commit Mesajı Formatı:**
```text
feat: profesyonel iletişim no alma butonu eklendi

- D1-0004 ve D2-0007 numaralı görevler tamamlandı.
- Q1-0002 numaralı soru eklendi ve A1-0002 olarak cevaplandı.
- C1-0005 numaralı test senaryosu oluşturuldu.
```

## 8. UI, Tasarım Sistemi ve Dil Yönetimi (Theming & Localization)

Ajan, kullanıcı arayüzü (UI) geliştirirken aşağıdaki tasarım ve metin kurallarına kesinlikle uymak zorundadır. Kolaya kaçarak hardcoded değer kullanmak yasaktır.

### 8.1. Renk ve Tema Yönetimi (Zero Hardcoded Colors)
* Uygulama genelinde `Colors.red`, `Color(0xFF...)` gibi statik renk tanımlamaları UI widget'ları içinde **kesinlikle kullanılamaz**.
* Tüm renkler `Theme.of(context).colorScheme` (örn: `primary`, `secondary`, `surface`, `error`) üzerinden çağrılacaktır.
* `lib/core/theme/app_themes.dart` dosyası oluşturulacak ve uygulamanın temaları (Default Light, Dark ve Özel Temalar örn: "29Ekim") `ThemeData` ve `ColorScheme.fromSeed` kullanılarak burada merkezi olarak tanımlanacaktır.

### 8.2. Metin ve Çoklu Dil Yönetimi (Zero Hardcoded Strings)
* Ekranda kullanıcıya gösterilen hiçbir metin (buton, başlık, uyarı mesajı) UI widget'ı içine statik string olarak (Örn: `Text('Giriş Yap')`) **yazılamaz**.
* Projede `flutter_localizations` yapısı kurulacak ve tüm metinler `lib/l10n/app_tr.arb` dosyası içinde anahtar-değer (key-value) şeklinde tutulacaktır.
* UI bileşenlerinde metinler `AppLocalizations.of(context)!.keyName` formatında çağrılacaktır.

### 8.3. Bileşen Mimarisi (Reusable Widgets)
* Projede sık kullanılan UI elemanları (Ana Butonlar, Custom TextField'lar, Yükleme İndikatörleri) `lib/core/widgets/` altına ayrıştırılacak ve her yerde bu ortak bileşenler kullanılacaktır. Padding ve margin değerleri için standart sabitler (Örn: `AppSpacing.md`) oluşturulacaktır.