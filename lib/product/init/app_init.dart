import 'package:flutter/material.dart';
import '../config/app_config.dart';
import 'package:imageifyai/core/services/storage_service.dart';

///Bu sınıfın amacı, Flutter uygulamasının başlangıcında gerekli
///hizmetleri başlatmak ve hata işleme mekanizmalarını yapılandırmaktır.
///Uygulamanın doğru bir şekilde başlatılmasını ve hata durumlarında
///doğru şekilde davranmasını sağlar.
class AppInit {
  static Future<void> init() async {
    // Initialize services
    await _initializeServices();

    // Configure error handling
    _configureErrorHandling();

    // Initialize StorageService
    await StorageService.init();
  }

  static Future<void> _initializeServices() async {
    // Initialize your services here
    // await HiveService.init();
    // await FirebaseService.init();
  }

  static void _configureErrorHandling() {
    if (!AppConfig.isDevelopment) {
      // Configure production error handling
      // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
  }
}
