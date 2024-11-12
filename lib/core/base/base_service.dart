abstract class BaseService {
  Future<T> handleResponse<T>(Future<T> Function() request) async {
    try {
      return await request();
    } catch (e) {
      throw ServiceException(message: e.toString());
    }
  }
}

class ServiceException implements Exception {
  final String message;
  ServiceException({required this.message});
}
