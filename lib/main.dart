import 'package:flutter/material.dart';
import 'package:imageifyai/core/providers/app_providers.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'package:imageifyai/core/theme/theme_manager.dart';
import 'package:imageifyai/features/home/view/home_view.dart';
import 'package:imageifyai/product/config/app_config.dart';
import 'package:imageifyai/product/init/app_init.dart';
import 'package:provider/provider.dart';
import 'package:imageifyai/features/settings/pages/history/view_model/history_view_model.dart';
import 'package:imageifyai/features/settings/view_model/settings_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return Consumer<SettingsViewModel>(
      builder: (context, settingsViewModel, _) {
        return MaterialApp(
          title: AppConfig.appName,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: settingsViewModel.themeMode,
          navigatorKey: NavigationService.navigatorKey,
          home: const HomeView(),
        );
      },
    );
  }
}
