# Chat Feature — Agent Guide

## Amaç
Müşteri ile Pro arasındaki teklif sonrası mesajlaşmayı yönetir. `chats` ve `chats/{id}/messages` Firestore alt koleksiyonlarını kullanır.

---

## Klasör Yapısı

```
lib/features/chat/
├── data/
│   ├── models/
│   │   ├── chat_model.dart
│   │   └── message_model.dart
│   └── repositories/
│       └── chat_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── chat_entity.dart
│   │   └── message_entity.dart
│   └── usecases/
│       ├── send_message_usecase.dart
│       └── get_messages_usecase.dart
└── presentation/
    ├── controllers/
    │   └── chat_controller.dart
    ├── screens/
    │   └── chat_screen.dart
    └── widgets/
        ├── message_bubble_widget.dart
        └── message_input_widget.dart    ← Pro için disabled kontrolü burada
```

---

## Temel İş Kuralları

1. **Müşteri:** Sınırsız mesaj gönderebilir.
2. **Pro Mesaj Limiti:** `quotes/{id}.provider_reply_count >= 1` olduğunda `MessageInputWidget` `disabled` duruma geçer; yeni mesaj gönderilemez. İlk mesaj gönderildiğinde provider_reply_count kesinlikle bir Cloud Function veya Firestore Transaction ile backend tarafında güvenli şekilde 1 artırılır. İstemci sadece veriyi okur.
3. **Gerçek Zamanlı:** Mesajlar Firestore `snapshots()` stream'i ile anlık gösterilir.
4. **Chat Oluşturma:** Chat dokümanı, Pro teklif verdiği anda arka planda oluşturulur (quotes ile aynı anda). Böylece müşteri teklifi gördüğünde anında mesaj yazmaya başlayabilir.
5. **Sender Rol Etiketi:** Her mesaj `sender_role: CUSTOMER | PROVIDER` alanı taşır; balon rengi buna göre ayrışır.

---

## Firestore Şeması
```
chats/{chat_id}
  - request_id, quote_id, customer_id, provider_id, last_message, updated_at

chats/{chat_id}/messages/{message_id}
  - sender_id, sender_role, message_text, sent_at
```

---

## Bağımlılıklar
- `cloud_firestore`
- `flutter_riverpod`
- `go_router`
