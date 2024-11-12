import 'package:flutter/material.dart';
import 'package:imageifyai/core/providers/app_providers.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'package:imageifyai/core/theme/theme_manager.dart';
import 'package:imageifyai/features/home/view/home_view.dart';
import 'package:imageifyai/product/config/app_config.dart';
import 'package:imageifyai/product/init/app_init.dart';
import 'package:provider/provider.dart';

void main() async {
  await AppInit.init();

  runApp(MultiProvider(
    providers: AppProviders.providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(builder: (context, themeManager, _) {
      return MaterialApp(
        title: AppConfig.appName,
        theme: themeManager.isDark ? AppTheme.dark : AppTheme.light,
        navigatorKey: NavigationService.navigatorKey,
        home: const HomeView(),
      );
    });
  }
}
