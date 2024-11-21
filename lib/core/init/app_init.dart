import 'package:flutter/material.dart';
import 'package:imageifyai/core/network/api/api_client.dart';
import '../services/storage/storage_service.dart';

class AppInit {
  static Future<void> initialize() async {
    try {
      // Hata yakalama
      await _initializeErrorHandling();
      // Servisleri başlat
      await _initializeServices();

      debugPrint('🚀 Uygulama başarıyla başlatıldı');
    } catch (e) {
      debugPrint('❌ Uygulama başlatma hatası: $e');
      rethrow;
    }
  }

  static Future<void> _initializeErrorHandling() async {
    FlutterError.onError = (details) {
      debugPrint('🔴 Flutter Error: ${details.exception}');
    };
  }

  static Future<void> _initializeServices() async {
    await StorageService.instance.initialize();
    await ApiClient.instance.initialize();
  }
}
