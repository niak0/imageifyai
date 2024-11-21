import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:provider/provider.dart';
import 'core/providers/app_providers.dart';
import 'core/theme/app_theme.dart';
import 'features/home/view/home_view.dart';
import 'core/config/app_config.dart';
import 'core/init/app_init.dart';
import 'core/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Servisleri başlat
  await AppInit.initialize();

  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StorageService>(
      builder: (context, storage, child) {
        final isDark = storage.settings.isDarkMode;
        return MaterialApp(
          title: AppConfig.appName,
          theme: isDark ? AppTheme.dark : AppTheme.light,
          locale: Locale(storage.language),
          navigatorKey: NavigationService.navigatorKey,
          home: const HomeView(),
        );
      },
    );
  }
}
