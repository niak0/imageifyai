abstract class BaseService {
  Future<void> handleError(Function callback) async {
    try {
      await callback();
    } catch (e) {
      throw Exception('Service Error: $e');
    }
  }
}
