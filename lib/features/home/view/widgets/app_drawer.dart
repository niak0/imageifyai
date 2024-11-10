import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/themes/cyberpunk/extensions/cyberpunk_icon_extension.dart';
import 'package:imageifyai/core/themes/cyberpunk/extensions/cyberpunk_text_extension.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.backgroundDark,
          scrimColor: Colors.black54,
          elevation: 0,
        ),
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundDark,
            border: Border(
              right: BorderSide(
                color: AppColors.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.1),
                      AppColors.secondary.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'AI Studio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ).withNeonEffect(),
                ),
              ),
              // Menü öğeleri
              ListTile(
                leading: Icon(Icons.home).withNeonEffect(),
                title: const Text('Ana Sayfa'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.settings).withNeonEffect(color: AppColors.secondary),
                title: const Text('Ayarlar'),
                onTap: () {
                  Navigator.pop(context);
                  // Ayarlar sayfasına git
                },
              ),
              ListTile(
                leading: Icon(Icons.info).withNeonEffect(color: AppColors.tertiary),
                title: const Text('Hakkında'),
                onTap: () {
                  Navigator.pop(context);
                  // Hakkında sayfasına git
                },
              ),
              const Spacer(),
              // Alt kısım
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
