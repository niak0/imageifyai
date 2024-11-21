import 'package:dio/dio.dart';
import '../../config/app_config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  static ApiClient get instance => _instance;
  late final Dio _dio;

  Future<void> initialize() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.apiTimeout,
        receiveTimeout: AppConfig.apiTimeout,
      ),
    );

    _dio.interceptors.addAll([]);
  }
}
