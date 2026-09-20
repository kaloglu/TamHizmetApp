# Provider App Feature — Agent Guide

## Amaç
Profesyonel (Pro/Hizmet Veren) modülünün tüm ekranlarını, iş mantığını ve veri katmanını yönetir. Pro; bölgesindeki açık talepleri listeler, teklif verir, müşteri ile mesajlaşır ve iletişim numarası satın alır.

---

## Klasör Yapısı

```
lib/features/provider_app/
├── data/
│   ├── models/
│   │   ├── provider_profile_model.dart
│   │   └── quote_model.dart
│   └── repositories/
│       ├── provider_profile_repository_impl.dart
│       └── quote_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── provider_profile_entity.dart
│   │   └── quote_entity.dart
│   └── usecases/
│       ├── get_open_requests_usecase.dart
│       ├── submit_quote_usecase.dart
│       └── unlock_contact_usecase.dart
└── presentation/
    ├── controllers/
    │   ├── request_list_controller.dart
    │   └── quote_controller.dart
    ├── screens/
    │   ├── home_screen.dart             ← Bölgeye göre açık talepler
    │   ├── request_detail_screen.dart   ← Talep detayı + teklif ver
    │   ├── my_quotes_screen.dart        ← Verilen teklifler
    │   └── profile_screen.dart         ← Pro profil & kredi bakiyesi
    └── widgets/
        ├── request_card_widget.dart
        ├── quote_form_widget.dart
        └── contact_unlock_button_widget.dart
```

---

## Temel İş Kuralları

1. **Onboarding Guard:** `provider_profiles` dokümanı eksikse kullanıcı profil tamamlama ekranına yönlendirilir.
2. **Teklif Verme:** Pro, aynı talebe yalnızca bir kez teklif verebilir.
3. **Pro Mesaj Limiti:** Teklif sonrası müşteriyle mesajlaşırken yalnızca **1 ek mesaj** hakkı vardır. `quotes/{id}.provider_reply_count >= 1` olduğunda mesaj input'u ve gönder butonu `disabled` yapılır.
4. **İletişim No Al:** "İletişim No Al" butonuna basıldığında teklif tutarının belirli bir yüzdesi `credit_balance`'dan Cloud Function üzerinden düşülür. Ajan, %10'luk kesinti oranını koda hardcode yazmayacaktır. Bu oran Firestore'daki settings/app_config dokümanından okunmalı ve burası admin panelden yönetilebilmelidir. Başarı durumunda `contact_unlocked = true` yapılır ve `url_launcher` ile WhatsApp açılır. Geri kalan tüm ücretlendirme ve hakediş süreci Müşteri ile Pro arasındadır; platform buna karışmaz.
5. **İş Bitirme & Puanlama:** İş tamamlandığında Ustanın (Pro) uygulama üzerinden "İşi Yaptım" butonuna basarak tetiklemesi ve Müşteriye puan/yorum vermesi beklenir. Bu işlem Müşteri tarafına onay bildirimi düşürür.
6. **Bölge Filtresi:** Açık talepler `provider_profiles.service_provinces / service_districts / service_neighborhoods` değerlerine göre filtrelenir.
6. **Ödeme Entegrasyonları:** Mobil (Google Play In-App Purchase), Web (PayTR / İyzico).
7. **Kredi Bakiyesi:** Pro'nun kredi bakiyesi `provider_profiles.credit_balance` alanında tutulur.
8. **Rol Değişimi:** Kullanıcı provider ise ve hizmet al seçip yeni uygulamaya geçtiyse customer profili oluşturup kayıt olana kadar role değiştirme yapılmaz; ne zaman ki customer profili oluşur o zaman kullanıcının rolü (provider'a ek olarak customer da oluştuğu için) BOTH olarak güncellenir. Bu işlem sonrasında `provider_profiles` dokümanı asla silinmez ve korunur.

---

## Bağımlılıklar
- `cloud_firestore`
- `firebase_functions`
- `flutter_riverpod`
- `url_launcher`
- `go_router`

---

## İlgili Görev & Testler
- Görev: İletişim No Al ve Pro Mesaj Guard görevleri
- İş Kuralı Referansı: `agent.md` Bölüm 4
