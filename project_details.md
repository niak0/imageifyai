# Imageify AI - Proje Detayları

## 1. Proje Yapısı

### 1.1 Klasör Yapısı 
dart
lib/
├── core/ # Temel yapılar ve utility'ler
│ ├── base/ # Base sınıflar
│ ├── constants/ # Sabitler
│ ├── extensions/ # Extension metodları
│ ├── init/ # Başlangıç ayarları
│ ├── services/ # Core servisler
│ └── widgets/ # Temel widget'lar
│
├── features/ # Uygulama özellikleri
│ ├── home/ # Ana sayfa feature'ı
│ ├── auth/ # Kimlik doğrulama
│ └── ai/ # AI işlemleri
│ ├── text_to_image/
│ ├── avatars/
│ └── ai_baby/
│
└── product/ # Uygulama geneli araçlar
├── styles/ # UI stilleri
├── tokens/ # Tasarım token'ları
└── widgets/ # Ortak widget'lar

### 1.2 Mimari Yapı
Uygulama MVVM (Model-View-ViewModel) mimarisi kullanılarak geliştirilmiştir:

- **Model**: Veri yapıları ve business logic
- **View**: UI katmanı (widget'lar)
- **ViewModel**: View ile Model arasındaki köprü

State Management için Provider kullanılmaktadır.

### 1.3 Temel Prensipler
- Feature-first yaklaşımı
- Clean Architecture prensipleri
- SOLID prensiplerine uyum
- Reusable component'ler
- Dependency Injection

## 2. Core Katmanı

### 2.1 Extensions

dart
// Glow efekti için extension'lar
extension GlowEffect on BoxDecoration {
BoxDecoration withGlowEffect({...})
}
// Press animasyonu için extension
extension PressAnimation on Widget {
Widget withPressAnimation({...})
}


### 2.2 Base Widget'lar
- BaseView: MVVM template'i
- BaseContainer: Temel container yapısı
- CustomAppBar: Özelleştirilmiş app bar

### 2.3 Servisler
- NavigationService: Sayfa yönetimi
- CacheService: Önbellekleme
- NetworkService: API istekleri

## 3. Feature'lar

### 3.1 Home Feature
Ana sayfa özelliği, kullanıcıya mevcut AI araçlarını sunar:
- Text to Image
- Avatar Generation
- AI Baby Generation

### 3.2 Text to Image Feature
Metin girişinden görüntü oluşturma özelliği:

dart
// Model
class TextToImageModel {
final String prompt;
final String? negativePrompt;
final ImageSize size;
// ...
}
// ViewModel
class TextToImageViewModel extends BaseViewModel {
Future<void> generateImage(String prompt) async {
// ...
}
}