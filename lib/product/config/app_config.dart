/// Bu sınıf, uygulamanın genel yapılandırma ayarlarını tutar ve
/// bu ayarları diğer sınıfların erişebileceği şekilde sağlar.
/// Uygulamanın adı, sürümü, geliştirme modu, API anahtarı,
/// maksimum yeniden deneme sayısı, analizlerin etkinleştirilmesi ve
/// hata raporlarının etkinleştirilmesi gibi ayarları içerir.
class AppConfig {
  static const String appName = 'Your App Name';
  static const String appVersion = '1.0.0';
  static const bool isDevelopment = true;

  // API Configuration
  static const String apiKey = 'your-api-key';
  static const int maxRetryAttempts = 3;

  // Feature Flags
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
}
