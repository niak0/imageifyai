# Imageify AI - Proje Detayları
## Imageify AI - Proje Analizi
### Imageify AI
Imageify AI, yapay zeka tabanlı görüntü işleme ve üretme araçlarını bir araya getiren kapsamlı bir Flutter uygulamasıdır. Proje, modern yazılım mimarisi prensipleri gözetilerek üç ana katmanda (Core, Features, Product) yapılandırılmıştır.
#### Teknik Altyapı
Uygulama, Replicate platformu üzerinden çeşitli AI modellerine erişim sağlayacak ve Firebase Cloud Functions kullanarak webhook yönetimini gerçekleştirecektir. Görüntü işleme operasyonları tamamen sunucu tarafında yapılacak, böylece mobil cihaz performansı korunacaktır.
### Mimari Yapı
Core katmanı, uygulamanın temelini oluşturan bileşenleri içeriyor. Özellikle dikkat çeken noktalar:
* Merkezi hata yönetimi için BaseService yapısı
* Özelleştirilmiş UI bileşenleri (GradientScaffold, AppButton)
* Glow ve press animasyonları için extension'lar
* Material 3 tabanlı tema sistemi
### Features Katmanı
Features katmanı modüler bir yapıda tasarlanmış ve şu ana özellikleri içeriyor:
* Text to Image dönüşümü
* Arka plan kaldırma (RemBG)
* Görüntü iyileştirme (Upscaler)
### UI/UX Yaklaşımı
Uygulama modern bir görsel dile sahip:
* Gradient arka planlar
* Glow efektleri
* Press animasyonları
* Material 3 tasarım sistemi
Özellikle CustomAppBar ve GradientScaffold gibi özel bileşenler, uygulamaya özgün bir kimlik kazandırıyor.
### Gelecek Planları
* Premium özellikler ve abonelik sistemi entegrasyonu
* Replicate üzerinden yeni AI modellerinin eklenmesi
* İşlem takibi için olası WebSocket implementasyonu
* Performans optimizasyonları
### Teknik Notlar
* Offline kullanım şu aşamada planlanmıyor
* Authentication sistemi opsiyonel olarak Firebase Auth ile eklenebilir
* Görsel depolama şimdilik düşünülmüyor
* Progress tracking için WebSocket veya polling mekanizması değerlendirilecek
Bu yapısıyla Imageify AI, modern teknolojileri kullanan, ölçeklenebilir ve kullanıcı dostu bir AI görüntü işleme platformu olma yolunda ilerliyor. Özellikle UI/UX tarafındaki özgün yaklaşımı ve modüler mimarisi ile dikkat çekiyor.
## 1. Core Katmanı Detayları


### 1.1 Base Katmanı (/core/base/)
- **BaseService**: Tüm servisler için temel sınıf
  - HTTP istekleri için hata yönetimi
  - Response handling
  - ServiceException yapısı ile hata yönetimi
  - Generic response parsing

### 1.2 Theme (/core/theme/)
- **AppTheme**: Uygulama geneli tema yönetimi
  - Dark/Light tema desteği
  - Material 3 desteği
  - Text stilleri:
    - headlineLarge (24px, bold)
    - headlineMedium (20px, semi-bold)
    - bodyLarge (16px)
    - bodyMedium (14px)
    - bodySmall (12px)
  - AppBar teması:
    - Gradient background desteği
    - Merkezi başlık
    - Elevation kontrolü
  - ColorScheme:
    - Primary: #6C5CE7
    - Secondary: #A8A5FF
    - Surface: #1A1A1A
    - Background: #121212
    - Error: #FF5252

### 1.3 Extensions (/core/extensions/)
- **GlowExtensions**: UI elementleri için glow efektleri
  - Container glow efekti
  - Text glow efekti
  - BoxDecoration glow efekti
- **PressAnimation**: Basma animasyonu extension'ı
  - Scale animasyonu
  - Customizable duration
  - Easing curves

### 1.4 Widgets (/core/widgets/)
- **AppButton**: Özelleştirilebilir buton bileşeni
  - Primary, Secondary, Text varyantları
  - Loading state desteği
  - İkon desteği
  - Glow efekti
  - Press animasyonu
- **GradientScaffold**: Gradient arkaplan desteği olan scaffold

### 1.5 Constants (/core/constants/)
- API endpoint'leri
- Asset path'leri
- Route isimleri
- Uygulama sabitleri

### 1.6 Utils (/core/utils/)
- **ImageUtils**: Görüntü işleme yardımcıları
  - Image compression
  - Format dönüşümleri
  - Base64 işlemleri
- **ValidationUtils**: Form validasyonları
  - Email kontrolü
  - Password kontrolü
  - Input temizleme
- **DateUtils**: Tarih işlemleri
  - Format dönüşümleri
  - Tarih hesaplamaları
- **StringUtils**: String manipülasyonları
  - Slug oluşturma
  - Case dönüşümleri
  - Truncate işlemleri

### 1.7 Services (/core/services/)
- Network servisi
  - HTTP istekleri
  - API entegrasyonu
  - Error handling
- Cache servisi
  - Local storage
  - Memory cache
- Navigation servisi
  - Route yönetimi
  - Navigation stack kontrolü

## 2. Features Katmanı

### 2.1 Home Feature (/features/home/)
Ana sayfa modülü:
- **View**: 
  - CustomAppBar (gradient background)
  - AppDrawer
  - Tool kartları grid yapısı
- **Widgets**:
  - CustomAppBar
  - AppDrawer 
  - ToolCard

### 2.2 Text to Image Feature (/features/text_to_image/)
Metin girişinden görüntü oluşturma modülü:
- **View**:
  - Prompt input alanı
  - Ayar kontrolleri
  - Sonuç görüntüleme
  - GradientScaffold kullanımı

### 2.3 AI Tools Feature (/features/tools/)
Çeşitli AI araçları:
- **RemBG**: 
  - Arka plan kaldırma
  - Görüntü yükleme
  - Sonuç indirme
- **Upscaler**:
  - Görüntü iyileştirme
  - Kalite ayarları

### 2.4 Creative Feature (/features/creative/)

#### 1.1 Text to Image (/features/creative/text_to_image/)
Metin girişinden görüntü oluşturma modülü:

#### View Katmanı
- **TextToImageView**:
  - Prompt input alanı (çok satırlı)
  - Negative prompt input
  - Görüntü boyutu seçimi (dropdown)
  - Stil seçimi (grid)
  - Oluştur butonu
  - Loading state gösterimi
  - Sonuç görüntüleme alanı
  - İndirme ve paylaşma butonları

#### ViewModel Katmanı
- **TextToImageViewModel**:
  - Prompt validasyonu
  - API entegrasyonu (Stable Diffusion)
  - Loading state yönetimi
  - Görüntü oluşturma işlemi
  - Hata yönetimi
  - İndirme ve paylaşma fonksiyonları

#### Model Katmanı
- **TextToImageModel**:  ```dart
  class TextToImageModel {
    final String prompt;
    final String? negativePrompt;
    final ImageSize size;
    final String style;
    final String? resultImageUrl;
  }  ```

#### 1.2 AI Baby (/features/creative/ai_baby/)
Bebek görüntüsü oluşturma modülü:

#### View Katmanı
- **AiBabyView**:
  - Anne fotoğrafı yükleme
  - Baba fotoğrafı yükleme
  - Yaş seçimi (slider)
  - Cinsiyet seçimi
  - Oluştur butonu
  - Sonuç görüntüleme
  - Paylaşma seçenekleri

#### ViewModel Katmanı
- **AiBabyViewModel**:
  - Fotoğraf validasyonu
  - Fotoğraf compression
  - API entegrasyonu
  - Progress tracking
  - Sonuç cache'leme

#### Model Katmanı
- **AiBabyModel**:  ```dart
  class AiBabyModel {
    final String motherImagePath;
    final String fatherImagePath;
    final int ageInMonths;
    final Gender gender;
    final String? resultImageUrl;
  }  ```

#### 1.3 Avatar Generator (/features/creative/avatar/)
Kişiselleştirilmiş avatar oluşturma modülü:

#### View Katmanı
- **AvatarView**:
  - Stil seçimi (grid)
  - Kişisel fotoğraf yükleme
  - Cinsiyet seçimi
  - Yaş aralığı seçimi
  - Oluştur butonu
  - Avatar önizleme
  - İndirme seçenekleri

#### ViewModel Katmanı
- **AvatarViewModel**:
  - Fotoğraf işleme
  - Stil yönetimi
  - API entegrasyonu
  - Cache mekanizması
  - Hata yönetimi

#### Model Katmanı
- **AvatarModel**:  ```dart
  class AvatarModel {
    final String sourceImagePath;
    final AvatarStyle style;
    final Gender gender;
    final AgeRange ageRange;
    final List<String>? resultImageUrls;
  }  ```

#### 1.4 Shared Components
- **ImageUploader**: Fotoğraf seçme/yükleme komponenti
- **StyleSelector**: Stil seçim grid'i
- **ResultViewer**: Sonuç görüntüleme ve paylaşma
- **ProgressTracker**: İşlem progress'i gösterimi

#### 1.5 Utils
- **ImageProcessor**: Fotoğraf işleme yardımcıları
- **ValidationUtils**: Input validasyonları
- **CacheManager**: Sonuç cache'leme

### 2.5 Home Feature (/features/home/)
Ana sayfa modülü:

#### View Katmanı
- **HomeView**:
  - CustomAppBar:
    - Logo
    - Profil butonu
    - Bildirim butonu
  - Tool kartları grid yapısı:
    - Animasyonlu kartlar
    - Tool ikonları
    - Tool açıklamaları
  - Bottom Navigation Bar:
    - Ana sayfa
    - Favoriler
    - Ayarlar

#### ViewModel Katmanı
- **HomeViewModel**:
  - Tool listesi yönetimi
  - Kullanıcı durumu kontrolü
  - Navigation yönetimi
  - Bildirim kontrolü
  - Cache yönetimi

#### Model Katmanı
- **ToolModel**:  ```dart
  class ToolModel {
    final String id;
    final String name;
    final String description;
    final String iconPath;
    final ToolType type;
    final bool isPremium;
  }  ```

#### Widgets
- **ToolCard**: Tool kartı komponenti
  - Glow efekti
  - Press animasyonu
  - Premium badge
- **CustomAppBar**: Özel app bar
  - Gradient background
  - Animasyonlu logo
- **BottomNavBar**: Navigation bar
  - Seçili item gösterimi
  - Badge desteği

### 2.6 Tools Feature (/features/tools/)

#### 1. RemBG Tool (/features/tools/rem_bg/)
Arka plan kaldırma aracı:

##### View Katmanı
- **RemBgView**:
  - Görüntü yükleme alanı
    - Drag & drop desteği
    - Çoklu görüntü seçimi
  - İşlem kontrolleri:
    - Hassasiyet ayarı
    - Kenar yumuşatma
  - Sonuç görüntüleme:
    - Before/After karşılaştırma
    - Zoom kontrolü
  - İndirme seçenekleri:
    - PNG/JPG format
    - Kalite ayarı

##### ViewModel Katmanı
- **RemBgViewModel**:
  - Görüntü işleme
  - API entegrasyonu
  - Progress tracking
  - Cache yönetimi
  - Hata kontrolü

##### Model Katmanı
- **RemBgModel**:  ```dart
  class RemBgModel {
    final String sourceImagePath;
    final RemBgSettings settings;
    final String? resultImagePath;
    final ProcessStatus status;
  }  ```

#### 2. Image Enhancer (/features/tools/enhancer/)
Görüntü iyileştirme aracı:

##### View Katmanı
- **EnhancerView**:
  - Görüntü seçimi
  - İyileştirme seçenekleri:
    - Çözünürlük artırma
    - Gürültü azaltma
    - Keskinlik ayarı
  - Preview alanı
  - İndirme seçenekleri

##### ViewModel Katmanı
- **EnhancerViewModel**:
  - AI model entegrasyonu
  - İşlem yönetimi
  - Cache sistemi
  - Error handling

##### Model Katmanı
- **EnhancerModel**:  ```dart
  class EnhancerModel {
    final String imagePath;
    final EnhanceSettings settings;
    final String? enhancedImagePath;
    final double progress;
  }  ```

#### Shared Components
- **ImagePicker**: Görüntü seçme komponenti
- **ProcessingIndicator**: İşlem göstergesi
- **ResultComparer**: Before/After karşılaştırma
- **DownloadOptions**: İndirme seçenekleri paneli

#### Utils
- **ImageProcessor**: Görüntü işleme yardımcıları
- **FileManager**: Dosya işlemleri
- **CacheManager**: Önbellekleme sistemi

## 3. Product Katmanı

### 3.1 Styles (/product/styles/)
Uygulama geneli stil tanımlamaları:

#### ButtonStyles
- Primary button stili
- Secondary button stili
- Text button stili
- Boyut varyasyonları:
  - Small (32px height)
  - Medium (40px height)
  - Large (48px height)
- Disabled durumları
- Loading durumları

#### ContainerStyles
- Base container
- Card container
- Dialog container
- Bottom sheet container
- Glow varyasyonları

#### TextStyles
- Heading stilleri
- Body text stilleri
- Caption stilleri
- Link stilleri
- Error text stili

### 3.2 Tokens (/product/tokens/)

#### ColorTokens
- **AppColors**:
  - Primary: `#6C5CE7`
  - Secondary: `#A8A5FF`
  - Surface: `#1A1A1A`
  - Background: `#121212`
  - Text: `#FFFFFF`
  - TextLow: `#9E9E9E`
  - Error: `#FF5252`
  - Success: `#4CAF50`

#### SpacingTokens
- **AppSpacing**:
  - xs: 4.0
  - sm: 8.0
  - md: 16.0
  - lg: 24.0
  - xl: 32.0
  - xxl: 48.0

#### AnimationTokens
- **AppAnimations**:
  - fast: 200ms
  - normal: 300ms
  - slow: 500ms
  - Easing curves:
    - standard
    - decelerate
    - accelerate

#### RadiusTokens
- **AppRadius**:
  - small: 4.0
  - medium: 8.0
  - large: 16.0
  - circular: 999.0

### 3.3 Widgets (/product/widgets/)

#### Cards
- **GlassCard**: Cam efektli kart
  - Blur efekti
  - Border highlight
  - İçerik padding
- **FeatureCard**: Özellik kartı
  - İkon alanı
  - Başlık
  - Açıklama
  - Premium badge

#### Inputs
- **AppTextField**: Özel text input
  - Label
  - Hint text
  - Error state
  - Counter text
  - Clear button
- **SearchField**: Arama input'u
  - Search icon
  - Clear button
  - Suggestions listesi

#### Dialogs
- **AppDialog**: Temel dialog
  - Başlık
  - İçerik
  - Aksiyon butonları
- **LoadingDialog**: Yükleme dialog'u
  - Progress indicator
  - İptal butonu

#### Indicators
- **LoadingIndicator**: Yükleme göstergesi
  - Circular
  - Linear
  - Custom animasyon
- **ProgressBar**: İlerleme çubuğu
  - Yüzde gösterimi
  - Renk geçişleri

### 3.4 Utils (/product/utils/)

#### NavigationUtils
- Route tanımlamaları
- Navigation helper metodları
- Route middleware'leri

#### UIUtils
- Screen size helpers
- Responsive breakpoints
- Safe area calculations

#### AssetUtils
- Asset path helpers
- Image preloading
- SVG handling

### 3.5 Constants (/product/constants/)

#### AppConstants
- API URLs
- Timeout süreleri
- Cache keys
- Regex patterns

#### UIConstants
- Min/max boyutlar
- Default padding/margin
- Z-index değerleri
- Grid system değerleri