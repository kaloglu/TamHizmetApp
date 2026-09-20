# BEKLEYEN TESTLER

** C1-0001: Geçersiz e-posta ile kayıt olunmaya çalışıldığında hata mesajı gösterilmeli.
** C1-0002: Yanlış şifre ile giriş denendiğinde hata mesajı gösterilmeli.
** C1-0003: Başarılı kayıt sonrası `users` Firestore koleksiyonunda kullanıcı dokümanı oluşturulmuş olmalı.
** C1-0004: Başarılı kayıt/giriş sonrası kullanıcı seçtiği role uygun ana ekrana yönlendirilmeli.
** C2-0001: Web tarafında giriş yapıldıktan sonra rol seçim ekranı gösterilmeli (veya mevcut role göre otomatik yönlendirilmeli).
** C2-0002: Müşteri entry-point'inden (`main_customer.dart`) çalıştırıldığında Provider ekranlarına erişilememeli.
** C2-0003: Provider entry-point'inden (`main_provider.dart`) çalıştırıldığında Customer ekranlarına erişilememeli.
* C1-0010: Kayıt sonrası profil formu tamamlanmadan ilan oluşturma ekranına gidildiğinde RouteGuard profil formuna yönlendirmeli.
* C1-0011: Kayıt sonrası profil formu tamamlanmadan teklif verme ekranına gidildiğinde RouteGuard profil formuna yönlendirmeli.
* C1-0012: Profil formu tamamen doldurulduktan sonra `customer_profiles` / `provider_profiles` koleksiyonunda ilgili doküman oluşturulmuş olmalı.
** --- T2-0002: Dinamik Form (FormBuilderWidget) Test Senaryoları ---
** C1-0005: `single_choice` tipindeki soru için ekranda `RadioListTile` görünmeli ve yalnızca bir seçenek seçilebilmeli.
** C1-0006: `multiple_choice` tipindeki soru için ekranda `CheckboxListTile` görünmeli ve birden fazla seçenek seçilebilmeli.
** C1-0007: `boolean` tipindeki soru için ekranda `SwitchListTile` görünmeli.
** C1-0008: `text` tipindeki soru için ekranda `TextField` görünmeli.
** C1-0009: Tüm soru tipleri doldurulduktan sonra `form_answers` `Map<String, dynamic>` olarak doğru biçimde derlenmeli.

---

# BAŞARILI TESTLER

(Henüz tamamlanan test yok)
