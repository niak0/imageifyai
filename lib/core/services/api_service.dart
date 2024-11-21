/// API isteklerini yöneten merkezi servis.
/// Tüm HTTP istekleri bu servis üzerinden yapılmalıdır.
class ApiService {
  static const Duration timeout = Duration(seconds: 30);

  /// POST isteği gönderir
  /// [endpoint] API endpoint'i
  /// [body] istek gövdesi
  /// [headers] isteğe bağlı headers
  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      // API implementation
    } catch (e) {
      throw Exception('API Hatası: $e');
    }
  }

  /// GET isteği gönderir
  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    // Implementation
    //websocket ile haberleşme
  }
}

// Kullanım örneği:
// final apiService = ApiService();
// final response = await apiService.post(
//   '/generate-image',
//   body: {'prompt': 'bir kedi'},
// );
