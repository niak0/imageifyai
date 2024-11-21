import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/app_providers.dart';
import 'core/theme/app_theme.dart';
import 'features/home/view/home_view.dart';
import 'core/config/app_config.dart';
import 'core/init/app_init.dart';
import 'features/settings/view_model/settings_view_model.dart';

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
    return Consumer<SettingsViewModel>(
      builder: (context, settingsViewModel, _) {
        return MaterialApp(
          title: AppConfig.appName,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: settingsViewModel.themeMode,
          home: const HomeView(),
        );
      },
    );
  }
}
