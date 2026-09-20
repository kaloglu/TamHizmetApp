# BEKLEYEN TESTLER

* C1-0001: Google Sign-In işlemi iptal edildiğinde veya hata aldığında kullanıcıya uygun hata bildirimi gösterilmeli.
* C1-0002: Google Sign-In başarıyla tamamlandığında Firebase Auth üzerinde oturum açılmış olmalı.
* C1-0003: İlk Google oturumu sonrası `users/{uid}` Firestore koleksiyonunda kullanıcı dokümanı oluşturulmuş olmalı.
* C1-0004: Başarılı giriş sonrası kullanıcı seçtiği role uygun akışa (veya profil formuna) yönlendirilmeli.
*** C2-0001: Web tarafında giriş yapıldıktan sonra aktif role göre doğru arayüze yönlendirilmeli.
*** C2-0002: Müşteri entry-point'inden (`main_customer.dart`) çalıştırıldığında Provider ekranlarına erişilememeli.
*** C2-0003: Provider entry-point'inden (`main_provider.dart`) çalıştırıldığında Customer ekranlarına erişilememeli.
** C1-0010: Giriş sonrası profil formu tamamlanmadan ilan oluşturma ekranına gidildiğinde RouteGuard profil formuna yönlendirmeli.
** C1-0011: Giriş sonrası profil formu tamamlanmadan teklif verme ekranına gidildiğinde RouteGuard profil formuna yönlendirmeli.
** C1-0012: Profil formu tamamen doldurulduktan sonra `customer_profiles` / `provider_profiles` koleksiyonunda ilgili doküman oluşturulmuş olmalı.
*** --- T2-0002: Dinamik Form (FormBuilderWidget) Test Senaryoları ---
*** C1-0005: `single_choice` tipindeki soru için ekranda `RadioListTile` görünmeli ve yalnızca bir seçenek seçilebilmeli.
*** C1-0006: `multiple_choice` tipindeki soru için ekranda `CheckboxListTile` görünmeli ve birden fazla seçenek seçilebilmeli.
*** C1-0007: `boolean` tipindeki soru için ekranda `SwitchListTile` görünmeli.
*** C1-0008: `text` tipindeki soru için ekranda `TextField` görünmeli.
*** C1-0009: Tüm soru tipleri doldurulduktan sonra `form_answers` `Map<String, dynamic>` olarak doğru biçimde derlenmeli.

---

# BAŞARILI TESTLER

(Henüz tamamlanan test yok)
