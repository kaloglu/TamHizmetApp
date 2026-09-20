# Agent Context & Architecture Guide: TamHizmet.app

## 1. Proje Özeti & Vizyon
**TamHizmet.app**, hizmet veren profesyoneller (Pro) ile hizmet almak isteyen müşterileri buluşturan çift taraflı (pazaryeri) bir platformdur.
* **Proje Tipi:** Tek Flutter kod tabanında, kullanıcı yetkilendirme rolüne (`UserRole`) göre dinamik ekranlar sunan çift modüllü yapı:
  * **Tam Hizmet Al:** Müşteri Modülü
  * **Tam Hizmet Ver:** Profesyonel (Pro) Modülü
* **Hedef Platformlar:** Android (Mobile App) ve Web (Responsive).

---

## 2. Teknoloji Yığını (Tech Stack)
* **Frontend Framework:** Flutter (Dart)
* **Backend Infrastructure:** Firebase (Authentication, Firestore, Cloud Functions, Cloud Messaging, Cloud Storage)
* **State Management:** Flutter Bloc / Riverpod (Standart ve modüler yapı)
* **Design System:** Material 3, Responsive Layout (LayoutBuilder & MediaQuery)
* **External Integration:** `url_launcher` (WhatsApp yönlendirmesi için)
* **Monetization & Payments:**
  * **Android Mobile:** Google Play In-App Purchase (IAP)
  * **Web:** Google Pay / PayTR / İyzico Entegrasyonu

---

## 3. Platform & Responsive İş Kuralları (Web Mobile Blocker)

### Mobil Web Engelleme (Overlay Blocker)
Web sürümü tarayıcıda açıldığında, ekran genişliği mobil boyuta (`width < 600px`) düştüğü anda tüm ekranı kaplayan bir **Overlay Blocker** devreye girmelidir.

* **Ekranda Görüntülenecek Metin:** "Daha iyi bir deneyim için hemen uygulamamızı indirin"
* **Yönlendirme Butonları (Google Play Store Links):**
  1. **Tam Hizmet Al (Google Play)** -> Müşteri uygulamasını indirme bağlantısı.
  2. **Tam Hizmet Ver (Google Play)** -> Pro uygulamasını indirme bağlantısı.
* **Kısıtlama:** Kullanıcı mobil web görünümünde web üzerinden işlem yapamaz; tıklamalar pasife alınır ve mağazaya yönlendirilir.

---

## 4. İletişim, Mesajlaşma ve WhatsApp Kuralları

### A. Teklif Sonrası Sohbet Kuralları
1. **Müşteri Tarafı:** Teklifi detaylandırmak ve soru sormak için Pro'ya **sınırsız** mesaj yazabilir.
2. **Pro (Profesyonel) Tarafı:** 
   * Teklif verdikten sonra Müşteri ile mesajlaşırken **sadece 1 kez ekstra mesaj/açıklama** yazma hakkına sahiptir.
   * `quotes` dokümanında `provider_reply_count >= 1` olduğunda Pro tarafındaki mesaj yazma input'u ve gönder butonu pasif (`disabled`) duruma gelir.

### B. WhatsApp / İletişim Numarası Açma ("İletişim No Al")
1. Pro ekranındaki teklif detayında **"İletişim No Al / WhatsApp'tan Yaz"** butonu bulunur.
2. Pro bu butona bastığında, sunduğu teklif tutarının **%10'u kadar kredi/ücret** hesabından düşer (Cloud Function üzerinden kontrol edilir).
3. Ödeme/Kredi düşme işlemi başarılı olduğunda ilgili teklifin `contact_unlocked` değeri `true` yapılır.
4. Müşterinin telefon numarası görünür hale gelir ve uygulama `url_launcher` kullanarak `https://wa.me/<customer_phone_number>` formatıyla cihazdaki WhatsApp uygulamasını doğrudan açar.

---

## 5. Veritabanı Mimarisi (Firestore JSON Schemas)

### `users` Collection
```json
{
  "uid": "string",
  "email": "string",
  "phone": "string",
  "display_name": "string",
  "active_role": "CUSTOMER | PROVIDER",
  "created_at": "timestamp"
}
```

### `provider_profiles` Collection
```json
{
  "user_id": "string",
  "categories": ["cat_1", "cat_2"],
  "service_cities": ["İstanbul"],
  "credit_balance": 150.0,
  "rating_avg": 4.8,
  "review_count": 12,
  "is_verified": true
}
```


### categories Collection (Dinamik Soru Şeması)
```json
{
  "category_id": "ev_temizligi",
  "category_name": "Ev Temizliği",
  "icon": "cleaning_services",
  "questions": [
    {
      "id": "oda_sayisi",
      "label": "Eviniz kaç oda 1 salon?",
      "type": "single_choice",
      "options": ["1+1", "2+1", "3+1", "4+1 ve üzeri"]
    },
    {
      "id": "evcil_hayvan",
      "label": "Evde evcil hayvan var mı?",
      "type": "boolean",
      "options": ["Evet", "Hayır"]
    },
    {
      "id": "ekstra_hizmetler",
      "label": "Ekstra istekleriniz nelerdir?",
      "type": "multiple_choice",
      "options": ["Ütü İstiyorum", "Balkon Yıkama", "Fırın Temizliği"]
    }
  ]
}
```

### requests Collection (Hizmet Talepleri)
```json
{
  "request_id": "req_1001",
  "customer_id": "user_customer_1",
  "category_id": "ev_temizligi",
  "form_answers": {
    "oda_sayisi": "3+1",
    "evcil_hayvan": "Evet",
    "ekstra_hizmetler": ["Ütü İstiyorum", "Balkon Yıkama"]
  },
  "location": {
    "city": "İstanbul",
    "district": "Kadıköy"
  },
  "status": "OPEN | IN_PROGRESS | COMPLETED | CANCELLED",
  "max_quotes": 5,
  "current_quote_count": 2,
  "created_at": "timestamp"
}
```

### quotes Collection (Teklifler)
```json
{
  "quote_id": "quote_5001",
  "request_id": "req_1001",
  "provider_id": "user_provider_1",
  "price": 1500.00,
  "note": "Tüm malzemeler tarafımdan karşılanacaktır.",
  "provider_reply_count": 0,
  "contact_unlocked": false,
  "status": "PENDING | ACCEPTED | REJECTED",
  "created_at": "timestamp"
}
```

### chats & messages Sub-collections
```json
// chats/{chat_id}
{
  "request_id": "req_1001",
  "quote_id": "quote_5001",
  "customer_id": "user_customer_1",
  "provider_id": "user_provider_1",
  "last_message": "Saat 10:00'da adreste olabilirim.",
  "updated_at": "timestamp"
}

// chats/{chat_id}/messages/{message_id}
{
  "sender_id": "string",
  "sender_role": "CUSTOMER | PROVIDER",
  "message_text": "string",
  "sent_at": "timestamp"
}
```

## 6. Geliştirici Ajan (Agent) İçin Kodlama ve Mimari Kuralları
**Feature-First / Clean Architecture Klasör Yapısı:**
```
lib/
├── core/
│   ├── constants/
│   ├── services/ (Firebase, Payment, UrlLauncher)
│   ├── utils/
│   └── widgets/ (FormBuilderWidget, ResponsiveOverlayBlocker)
├── features/
│   ├── auth/
│   ├── customer_app/ (Tam Hizmet Al ekranları ve logic)
│   ├── provider_app/ (Tam Hizmet Ver ekranları ve logic)
│   ├── chat/
│   └── profile/
└── main.dart
```

**Dynamic Form Generator:** Firestore categories koleksiyonundaki questions JSON dizisini okuyarak single_choice, multiple_choice, boolean ve text tiplerine göre otomatik Flutter form elemanları oluşturan modüler bir FormBuilderWidget yazılmalıdır.

**Type Safety & Models:** Tüm Firestore koleksiyonları için fromJson ve toJson dönüşüm metodlarına sahip tip güvenli (strongly-typed) Dart sınıf modelleri (UserModel, RequestModel, QuoteModel, CategoryModel) kullanılmalıdır.

**Pro Message Guard:** Pro tarafında mesaj gönderilirken provider_reply_count kontrol edilmeli; ilk mesaj gönderildikten sonra bu sayaç 1 artırılmalı ve yeni mesaj girişi engellenmelidir.

**Web Mobile Blocking Implementation:** Global MaterialApp seviyesinde LayoutBuilder veya MediaQuery kullanılarak web platformunda genişlik < 600px olduğunda ekranın üzerine z-index seviyesi yüksek yönlendirme Modal'ı yerleştirilmelidir.

## 7. Proje Yönetimi ve Dosya Sistemi Kuralları (Project Management)

Geliştirme süreci boyunca tüm proje yönetimi, görev takibi ve dokümantasyon güncellemeleri ana dizindeki `project-management/` klasörü içinde yürütülecektir. Ajan, bu klasördeki markdown dosyalarını aşağıdaki katı kurallara göre yönetecek ve güncelleyecektir. Öncelik seviyeleri her zaman 1 ile 9 arasındadır (1 en yüksek öncelik).

### 7.1. Dosya Türleri ve Formatları
Sadece özet başlıkların ve durumların takip edildiği, detayların ise ayrıştırıldığı bir yapı kullanılacaktır.

*   **`todo.md` (Yapılacaklar):** Sadece bekleyen işlerin özet başlıkları yer alır.
    *   Format: `T<Öncelik>-SıraNo: Özet Başlık` (Örn: `T1-0001: Firestore Auth Entegrasyonu`)
    *   Görevler her zaman önem derecesine (1'den 9'a doğru) sıralanır.
*   **`DONE.md` (Tamamlananlar):** Biten işler `todo.md` dosyasından buraya taşınır.
    *   Format: `T` harfi `D` olur. (Örn: `D1-0001: Firestore Auth Entegrasyonu`)
*   **`issues.md` (Görev Detayları):** Görevlerin teknik detayları ve açıklamaları burada tutulur.
    *   **Üst Kısım (Bekleyenler):** `todo.md` içindeki `T` ile başlayan görevlerin detaylı açıklamaları.
    *   **Alt Kısım (Bitenler):** `DONE.md` içindeki `D` ile başlayan görevlerin detaylı açıklamaları.
*   **`Questions.md` (Kritik Sorular):** Projenin işleyişi hakkında netleşmesi gereken sorular.
    *   Bekleyen Soru Formatı: `Q<Öncelik>-0001: Soru metni` (Örn: `Q1-0001: ...`)
    *   Cevaplananlar dosyanın en altına taşınır.
    *   Cevap Formatı: Cevaplar `A: ` önekiyle eklenir. Ajan, kullanıcıdan aldığı cevabı kopyala-yapıştır yapmamalı, **kendi anladığı şekilde teknik bir özete dönüştürerek** kaydetmelidir.
*   **`Test.md` (Test Senaryoları):** Test edilecek modüller ve özellikler.
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
2. **Tamamlanan Görevler:** `todo.md` dosyasından `DONE.md` dosyasına taşınan (yani tamamlanan) işler varsa, commit başlığında veya açıklamasında bu işlerin referans numaraları (`D` prefixi ile) mutlaka belirtilmelidir.
3. **Yeni Eklenen veya Güncellenen Öğeler (Q, A, C/CH):** Bu commit kapsamında `Questions.md` veya `Test.md` dosyalarında oluşturulan yeni Sorular (`Q`), eklenen Cevaplar (`A`) veya yeni Test/Kontrol maddeleri (`C` veya `CH`) varsa, commit mesajının açıklama (body) kısmında referans numaralarıyla listelenmelidir.

**Örnek Commit Mesajı Formatı:**
```text
feat: profesyonel iletişim no alma butonu eklendi

- D1-0004 ve D2-0007 numaralı görevler tamamlandı.
- Q1-0002 numaralı soru eklendi ve A1-0002 olarak cevaplandı.
- C1-0005 numaralı test senaryosu oluşturuldu.
```