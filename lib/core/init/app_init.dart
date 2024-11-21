import 'package:flutter/material.dart';

class AppInit {
  static Future<void> initialize() async {
    try {
      await _initializeErrorHandling();
      // Servisleri başlat

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
}
