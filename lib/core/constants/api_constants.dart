/// API ile ilgili sabit değerler
abstract class ApiConstants {
  // Endpoints
  static const String predictions = '/predictions';
  static const String models = '/models';

  // Headers
  static const String authHeader = 'Authorization';
  static const String contentType = 'Content-Type';

  // Error Messages
  static const String networkError = 'İnternet bağlantınızı kontrol edin';
  static const String serverError = 'Sunucu hatası';
  static const String timeoutError = 'İstek zaman aşımına uğradı';
}
