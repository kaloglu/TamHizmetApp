# Tasarım Sistemi Manifestosu: TamHizmet.app

Bu doküman, TamHizmet.app projesinin görsel dilini, tasarım token'larını (tasarım bileşenlerini) ve bileşen mimarisini tanımlar. **Google Stitch** ve yazılım geliştirme sürecinde ortak bir rehber olarak kullanılmak üzere hazırlanmıştır.

## 1. Marka Kimliği & "Vibe" (Hissiyat)

*   **Hissiyat (Vibe):** Modern, Profesyonel, Güven Verici, Sade.
*   **Hedef Kitle:** Çift taraflı pazaryeri (Hizmet Alan Müşteriler & Hizmet Veren Profesyoneller / Pro'lar).
*   **Konsept:** Kusursuz bağlantı. Arayüz olabildiğince görünmez hissettirmeli, tamamen görevlerin netliğine ve iletişime odaklanmalıdır.

---

## 2. Tasarım Token'ları (Design Tokens)

### 2.1 Renk Paleti
Markanın ana kimliği kesinlikle Turkuaz rengi (`#40E0D0`) olarak sabitlenmiştir. Diğer yardımcı renkleri ve türetilmiş tonları Google Stitch kendi tasarım sistemine göre belirleyecektir.

| Token Adı | Görevi / Rolü | HEX Kodu | Kullanım Alanı |
|---|---|---|---|
| `primary` | Ana Marka Rengi | `#40E0D0` | Ana butonlar, aktif seçim durumları, vurgular. |
| `primary-variant` | Vurgu Tonu | `#17C3B2` | Gradyanlar, hover (üzerine gelme) durumları. |
| `bg-light` | Arka Plan (Açık) | `#F8F9FA` | Açık Tema (Light Mode) ana arka planı. |
| `bg-dark` | Arka Plan (Koyu) | `#1E1E1E` | Karanlık Tema (Dark Mode) ana arka planı (Koyu Gri). |
| `surface` | Kart / Yüzey | `#FFFFFF` | Açık temadaki kart ve katman arka planları. |
| `surface-dark` | Kart / Yüzey (Koyu) | `#2B2B2B` | Karanlık temadaki kart ve katman arka planları. |
| `text-primary` | Ana Metin | `#212529` | Başlıklar ve yoğun okunacak ana metinler. |
| `text-secondary` | Yan Metin | `#6C757D` | Açıklamalar, etiketler, yardımcı ipucu metinleri. |
| `error` | Hata / Uyarı | `#DC3545` | Doğrulama hataları, silme veya geri alınamaz aksiyonlar. |

### 2.2 Tipografi (Yazı Tipi Kuralları)
*   **Sistem Yazı Tipi:** Inter veya Roboto.
*   **Başlıklar (Headlines):** Yarı kalın (Semi-bold), harf arası boşluğu sıkı.
*   **Gövde Metni (Body):** Düzenli (Regular), okunurluğu artırmak için rahat satır yüksekliği (1.5).

### 2.3 Boşluklar & Köşe Oval hatları (Spacing & Radius)
*   **Temel Birim:** 4px.
*   **Izgara (Grid):** 4px'in katları (8, 16, 24, 32, 48, 64px).
*   **Köşe Ovalliği (Radius):**
    *   `sm`: 4px (Giriş alanları / Inputs)
    *   `md`: 12px (Küçük Kartlar, Modallar)
    *   `lg`: 24px (Ana Kapsayıcılar, Alt Sayfalar / Bottom Sheets)

---

## 3. Bileşen Mimarisi (Component Architecture)

### 3.1 Butonlar
*   **Birincil Buton (Primary):** Dolgulu Turkuaz, Beyaz metin, oval köşeler (24px).
*   **İkincil Buton (Secondary):** İçi boş, Turkuaz çerçeveli, şeffaf arka plan.
*   **Pasif Buton (Disabled):** Açık gri arka plan, silik metin rengi.

### 3.2 Kartlar (Pazaryeri Tarzı)
*   **Talep Kartı (Request Card):** Beyaz veya Koyu Gri arka plan, ince 1px çerçeve (`outlineVariant`), görevin özeti (Kategori, Tarih, Konum).
*   **Teklif Kartı (Quote Card):** "En İyi Fiyat" veya "Öne Çıkan" profesyoneller için hafif primary tonlarında arka plan veya şerit vurgusu.

### 3.3 Dinamik Formlar
*   **Giriş Alanları (Inputs):** Minimalist tarz, net etiketler. Odaklanıldığında (Focus) 2px kalınlığında Turkuaz çerçeve.
*   **Seçim Elemanları:** `RadioListTile` ve `CheckboxListTile` aktifken marka rengimiz olan Turkuaz'ı kullanır.

---

## 4. Modüllere Özel Temalandırma

Marka kimliği tek bir çizgide birleşik olsa da, modüller arasında kullanıcıya rehberlik edecek küçük görsel farklar bulunur:

*   **Tam Hizmet Al (Müşteri Modülü):** Sadelik ön plandadır. İkonlar daha yumuşak ve oval hatlara sahiptir.
*   **Tam Hizmet Ver (Profesyonel Modülü):** Veri ve işlevsellik ön plandadır. Ekranlar daha yoğun bilgi barındırabilir. Bölünmüş görevleri ayırmak için daha net çizgiler ve ayırıcılar kullanılır.

---

## 5. Stitch Yapay Zeka Komut Rehberi (Prompting Guidelines)

**Google Stitch** üzerinde bu proje için yeni bir ekran veya bileşen üreteceğiniz zaman, yapay zekaya projenin ruhunu tam aktarmak için aşağıdaki Türkçe komut şablonunu veya platformun diline göre İngilizce çevirisini kullanabilirsiniz:

> "Bir hizmet pazaryeri uygulaması için `DESIGN.md` manifestosunu takip eden bir UI tasarla. Tüm etkileşimli elemanlarda kesinlikle birincil renk kodu olarak #40E0D0 rengini kullan. Diğer yardımcı renk paletini ve katmanları Stitch sistemi otomatik belirlemeli. Material 3 bileşen mantığına kesinlikle uyulmalı."

---

## 6. Düzen & Duyarlılık (Layout & Responsiveness)
*   **Mobil Ekranlar:** Tek sütun, net ve odaklanmış aksiyonlar.
*   **Web Masaüstü Ekranlar:** Çoklu panel düzeni (Örn: Solda arama listesi, sağda detay paneli).
*   **Genişlik Engelleme (Overlay Blocker):** Genişliği 600px'den küçük olan web ekranlarında, kullanıcıyı doğrudan mobil uygulamaya yönlendiren tüm ekranı kaplayan sistem modalı devreye girer.
