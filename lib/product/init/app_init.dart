import 'package:flutter/material.dart';
import '../config/app_config.dart';

///Bu sınıfın amacı, Flutter uygulamasının başlangıcında gerekli
///hizmetleri başlatmak ve hata işleme mekanizmalarını yapılandırmaktır.
///Uygulamanın doğru bir şekilde başlatılmasını ve hata durumlarında
///doğru şekilde davranmasını sağlar.
class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize services
    await _initializeServices();

    // Configure error handling
    _configureErrorHandling();
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
