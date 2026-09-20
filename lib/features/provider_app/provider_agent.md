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
    ├── bloc/
    │   ├── request_list_bloc.dart
    │   └── quote_bloc.dart
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
4. **İletişim No Al:** "İletişim No Al" butonuna basıldığında teklif tutarının **%10'u** `credit_balance`'dan Cloud Function üzerinden düşülür. Başarı durumunda `contact_unlocked = true` yapılır ve `url_launcher` ile WhatsApp açılır. Bu kısım proje ayarlarından Admin tarafından panelde değiştirilebilir.    
5. **Bölge Filtresi:** Açık talepler `provider_profiles.service_provinces / service_districts / service_neighborhoods` değerlerine göre filtrelenir.
6. **Ödeme Entegrasyonları:** Mobil (Google Play In-App Purchase), Web (PayTR / İyzico).
7. **Kredi Bakiyesi:** Pro'nun kredi bakiyesi `provider_profiles.credit_balance` alanında tutulur.
8. **Rol Değişimi:** Pro, "Müşteri" rolüne geçmek isterse Profildeki menüden Hizmet Al seçeneğini kullanmalıdır. Bu işlem sonrasında `provider_profiles` dokümanı asla silinmez ve korunur. Kullanıcı Rolü her iki tipe de sahip olduğu için BOTH olarak değişir.

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
