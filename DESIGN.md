---
name: TamHizmetApp / Pro Service Marketplace
colors:
  surface: '#F8FAFC'
  surface-dim: '#d2d9f4'
  surface-bright: '#faf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3ff'
  surface-container: '#EEF2F6'
  surface-container-high: '#E2E8F0'
  surface-container-highest: '#dae2fd'
  on-surface: '#131b2e'
  on-surface-variant: '#3c4a47'
  inverse-surface: '#283044'
  inverse-on-surface: '#eef0ff'
  outline: '#64748B'
  outline-variant: '#CBD5E1'
  surface-tint: '#006a62'
  primary: '#006a62'
  on-primary: '#003733'
  primary-container: '#C8FAF4'
  on-primary-container: '#004F49'
  inverse-primary: '#3adccc'
  secondary: '#306576'
  on-secondary: '#ffffff'
  secondary-container: '#D0E8ED'
  on-secondary-container: '#082B34'
  tertiary: '#545f73'
  on-tertiary: '#ffffff'
  tertiary-container: '#bfcae2'
  on-tertiary-container: '#4a5569'
  error: '#E11D48'
  on-error: '#ffffff'
  error-container: '#FFE4E6'
  on-error-container: '#881337'
  primary-fixed: '#61f9e9'
  primary-fixed-dim: '#3adccc'
  on-primary-fixed: '#00201d'
  on-primary-fixed-variant: '#005049'
  secondary-fixed: '#b6ebfe'
  secondary-fixed-dim: '#9acee1'
  on-secondary-fixed: '#001f28'
  on-secondary-fixed-variant: '#114d5d'
  tertiary-fixed: '#d8e3fb'
  tertiary-fixed-dim: '#bcc7de'
  on-tertiary-fixed: '#111c2d'
  on-tertiary-fixed-variant: '#3c475a'
  background: '#faf8ff'
  on-background: '#131b2e'
  surface-variant: '#dae2fd'
  badge-pending-bg: '#FEF3C7'
  badge-pending-text: '#92400E'
  badge-active-bg: '#CCFBF1'
  badge-active-text: '#0F766E'
typography:
  headline-xl:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-xl-mobile:
    fontFamily: Inter
    fontSize: 26px
    fontWeight: '700'
    lineHeight: 34px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 21px
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 18px
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-sm: 0.75rem
  margin: 1rem
  margin-lg: 1.5rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

Bu tasarım sistemi, iki taraflı hizmet pazaryerinin (hizmet talep eden müşteriler ve sahada çözüm üreten profesyoneller) operasyonel hızını, güvenini ve dakikliğini merkeze alır. Tasarım yaklaşımı, **Minimalist Modern** temellere dayanır: Görsel gürültüden arındırılmış zeminler, net bilgi hiyerarşisi ve amaca odaklı mikro etkileşimlerle yapılandırılmıştır.

UI deneyiminin kullanıcı gruplarında uyandırdığı duygusal karşılık:
- **Hizmet Alan:** Güven, süreç şeffaflığı, zahmetsiz rezervasyon ve anında çözüm hissi.
- **Hizmet Veren (Pro):** İş akışında profesyonellik, yüksek kontrastlı operasyonel okunabilirlik ve zorlu saha koşullarında dahi hatasız tek elle kontrol ergonomisi.

Görsel kimlik; ferah yüzeyler, dengeli koyu deniz tonları ve canlı `#40E0D0` turkuaz aksanlarla dinamik bir kontrast dengesi sunar.

## Colors

Renk paleti, canlı turkuaz temel alınarak yüksek kontrast ve erişilebilirlik ilkeleri doğrultusunda yeniden kurgulanmıştır:

- **Primary (`#40E0D0` - Turquoise):** Servis canlılığını ve onaylanan aksiyonları simgeler. Açık bir renk değeri taşıdığı için üzerinde kullanılan tipografi ve ikonlarda kesinlikle derin ton (`on-primary: #003733`) tercih edilir.
- **Secondary (`#0F4C5C` - Deep Ocean):** `#40E0D0` ile güçlü kontrast oluşturan derin okyanus petrol mavisi. İkincil butonlar, üst sekmeler ve yönetici rozetlerinde kullanılır.
- **Tertiary (`#1E293B` - Slate Blue):** Pro uzman modülünün operasyonel kartlarında ve teknik ayrıştırmalarda ağırlık sağlayan kurumsal koyu arduvaz.
- **Neutral (`#0F172A` - Dark Navy Ink):** Başlıklar, birincil gövde metinleri ve kritik semboller için yüksek kontrastlı mürekkep rengi.

### Yüzey ve Durum Renkleri
- **Konteynerler:** `primary-container` (`#C8FAF4`) turkuazın ferahlatıcı yumuşak zeminidir; `on-primary-container` (`#004F49`) ile eşleşir.
- **Kart ve Kanvas:** Zemin arka planı `#F8FAFC`, kart yüzeyleri `#FFFFFF` ve gruplama zeminleri `#EEF2F6` olarak kademelendirilir.
- **Servis Durumları:** Aktif/Onaylandı durumlarında `#CCFBF1` zemin üzerine `#0F766E`, beklemedeki taleplerde `#FEF3C7` zemin üzerine `#92400E`, iptal/red durumlarında ise `#FFE4E6` zemin üzerine `#881337` kullanılır.

## Typography

Tipografi sistemi, operasyonel hız ve yüksek veri yoğunluğunda kusursuz okunabilirlik sunan **Inter** yazı tipi ailesiyle sürdürülür.

- **Başlık Seviyeleri:** Negatif harf aralığı ile kompakt bir yapı sergiler. Mobilde ekran genişliğini korumak amacıyla sayfa ana başlıklarında doğrudan `headline-xl-mobile` devreye girer.
- **Gövde Metinleri:** Servis koşulları, fiyat dökümleri ve müşteri notları için 1.5 satır yüksekliği kuralı uygulanarak satır atlama kolaylaştırılmıştır.
- **Etiketler & Düğmeler:** Buton aksiyonları ve servis durum rozetlerinde harf boşlukları hafifçe açılarak (0.01em - 0.02em) küçük puntolarda net görünürlük garanti edilir.

## Layout & Spacing

4px ritmik ızgara yapısı korunur:

- **Mobil Ekranlar (< 600px):** 16px (`margin: 1rem`) dış kenar boşluğu ve dikey kart akışları için 12px-16px sütun aralıkları kullanılır. Kritik teklif verme ve onay butonları alt kısımdaki güvenli alana sabitlenir.
- **Tablet ve Masaüstü Ekranlar:** Dış kenar boşluğu 24px (`margin-lg: 1.5rem`) seviyesine genişler; servis talep detayları ve uzman profilleri iki sütunlu asimetrik ızgarada konumlandırılır.
- **Dahili Bileşen Mesafeleri:** Form etiketleri ve rozet iç dolgularında `space-xs` (4px) ve `space-sm` (8px); kart padding'lerinde `space-md` (16px); alt çekmece panellerinde (bottom sheets) `space-lg` (24px) uygulanır.

## Elevation & Depth

Derinlik kurgusu, yoğun gölgelerden kaçınarak yüzey hiyerarşisi ve ince ortam gölgeleriyle yapılandırılır:

- **Level 0 (Canvas):** `#F8FAFC` taban zemin; tüm pasif arayüz bu katta yerleşir.
- **Level 1 (Kartlar ve Hizmet Blokları):** `#FFFFFF` yüzey, `0 1px 3px rgba(15, 23, 42, 0.05)` difüze gölge ve `1px solid #E2E8F0` sınır çizgisi ile zeminden net biçimde ayrılır.
- **Level 2 (Yüzen Butonlar & Filtre Çekmeceleri):** `0 8px 20px rgba(15, 76, 92, 0.12)` derin gölge ile harita üstü pinler ve mobil alt paneller yükseltilir.
- **Level 3 (Modal ve Acil Durum Pencereleri):** `0 20px 40px rgba(15, 23, 42, 0.18)` belirgin odak derinliği ile kullanıcı aksiyonunu kilitler.

## Shapes

Tasarım dili, modern hizmet pazaryerinin çevik ve erişilebilir doğasını yansıtan **Rounded** geometrisini kullanır:

- **Formlar ve Giriş Elemanları:** 8px (`0.5rem`) köşe kavisiyle stabil ve güvenilir bir çerçeve çizer.
- **Hizmet Kartları:** 16px (`1rem` / `rounded-lg`) köşe yuvarlaklığı ile dokunmatik cihazlarda taranabilir ayrık yüzeyler oluşturur.
- **Aksiyon Düğmeleri ve Rozetler:** 24px - 9999px tam dairesel (pill) form faktörüyle etkileşim davetkarlığını maksimize eder.

## Components

### Butonlar (Buttons)
- **Primary Button:** Canlı turkuaz `#40E0D0` dolgusu, derin kontrastlı `#003733` metin ve ikon rengi, `label-lg` font, 48px dokunma yüksekliği, 24px tam oval radius. Aktifleştiğinde parlaklık yerine hafifçe koyulaşarak basılma hissi verir.
- **Secondary Button:** Dolgusuz şeffaf arka plan, 1.5px `#0F4C5C` kenarlık ve `#0F4C5C` metin rengi.
- **Tertiary / Ghost Button:** Çerçevesiz, `#0F4C5C` metin, hafif hover durumunda `#C8FAF4` zemin tint'i.
- **Disabled State:** `#E2E8F0` dolgu zemin, `#94A3B8` metin rengi.

### Form Elemanları (Inputs)
- **Text Fields:** 48px yükseklik, 8px radius, `#FFFFFF` zemin ve `1px solid #CBD5E1` kenarlık. Odaklandığında kenarlık `2px solid #40E0D0` turkuazına bürünür ve yumuşak bir turkuaz halo (`0 0 0 3px rgba(64, 224, 208, 0.25)`) eklenir.
- **Radio & Checkbox:** Seçildiğinde dolgu `#40E0D0`, onay ikonu ise `#003733`; boşta iken `1.5px solid #64748B`.

### Hizmet ve Teklif Kartları (Cards)
- **Standart Servis Kartı:** `#FFFFFF` arka plan, 16px radius, `1px solid #E2E8F0`. Kategori ikonu, servis sağlayıcı unvanı, taban fiyat ve lokasyon bilgisi dikey grid ile konumlanır.
- **Öne Çıkan / Premium Teklif Kartı:** Kartın sol kenarında 4px dikey `#40E0D0` turkuaz şerit, tepe alanında `primary-container` zeminli "En Uygun / Öne Çıkan" durum çipi bulunur.

### Durum Rozetleri (Status Chips)
- **Aktif / Tamamlandı:** `#CCFBF1` zemin, `#0F766E` koyu teal metin.
- **Beklemede / Teklif Hazırlanıyor:** `#FEF3C7` zemin, `#92400E` amber metin.
- **İptal Edildi:** `#FFE4E6` zemin, `#881337` gül kurusu metin.
- **Pill Şekli:** `label-sm` tipografi, dikey 4px ve yatay 10px iç boşluk, tam kavisli kenarlar.

### Liste Öğeleri (List Tiles)
- 64px taban yüksekliği, sol blokta `#EEF2F6` zeminli yuvarlak servis ikonu, orta alanda iki kademeli hiyerarşik metin (`body-md` ve `body-sm`), sağ blokta ise servis tutarı ve yönlendirme oku yer alır.