# BEKLEYEN SORULAR

(Henüz bekleyen soru yok)

---

# CEVAPLANAN SORULAR

* Q1-0001: Web'de kullanıcı her oturum açışında rol seçimi mi yapacak, yoksa seçim bir kez yapılıp Firestore'a kaydedilip otomatik mi yönlendirilecek?
* A1-0001: Web giriş ekranında "Hizmet Al" ve "Hizmet Ver" sekmeleri kalıcıdır; kullanıcı her zaman bu sekmelerden birini seçerek sisteme girer. `active_role` değeri `BOTH` olan kullanıcılar ayrıca profil menüsü üzerinden aktif rollerini değiştirebilir. Otomatik yönlendirme yapılmaz.

* Q2-0001: Mobil uygulamalarda (customer/provider) kullanıcı rolünü sonradan değiştirebilecek mi?
* A2-0001: Mobil uygulamada rol değiştirme yoktur; kullanıcı her zaman kurulu olduğu uygulamayı (Customer veya Provider APK) kullanmak zorundadır. Diğer role geçmek istiyorsa o platforma ait ayrı uygulamayı indirip açması gerekir. Uygulama menüsünde karşı uygulamaya yönlendirici bir bağlantı bulunabilir.
