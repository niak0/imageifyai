import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/app_constants.dart';
import 'package:imageifyai/core/providers/app_providers.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'package:imageifyai/features/home/view/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: AppProviders.providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.darkTheme,
      navigatorKey: NavigationService.navigatorKey,
      home: const HomeView(),
    );
  }
}
