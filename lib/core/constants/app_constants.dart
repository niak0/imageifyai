class AppConstants {
  // App bilgileri
  static const String appName = "ImageifyAI";
  static const String appVersion = "1.0.0";

  // API anahtarı artık .env'den okunacak
  static const String REPLICATE_API_KEY = String.fromEnvironment('REPLICATE_API_KEY');

  // Padding değerleri
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Diğer sabitler
  static const String baseUrl = "https://api.replicate.com/v1";
  static const String textToImageModel = "stability-ai/sdxl:39ed52f2a78e934b3ba6e2a89f5b1c712de7dfea535525255b1aa35c5565e08b";
  static const String upscalerModel = "nightmareai/real-esrgan:42fed1c4974146d4d2414e2be2c5277c7fcf05fcc3a73abf41610695738c1d7b";
  static const String remBgModel = "cjwbw/rembg:fb8af171cfa1616ddcf1242c093f9c46bcada5ad4cf6f2fbe8b81b330ec5c003";
}
