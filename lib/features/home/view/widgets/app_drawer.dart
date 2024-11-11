import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'package:imageifyai/core/theme/extensions/theme_extensions.dart';

import '../../../../core/theme/widgets/glass_container.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.padding.top;

    return Theme(
      data: Theme.of(context).copyWith(
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.surfaceDark,
          scrimColor: Colors.black54,
          elevation: 0,
        ),
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            border: Border(
              right: BorderSide(
                color: AppColors.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header bölümü - SafeArea'dan sonra
                SizedBox(
                  height: 140, // DrawerHeader yerine sabit yükseklik
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withOpacity(0.15),
                          AppColors.secondary.withOpacity(0.15),
                        ],
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo veya İkon
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withOpacity(0.1),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            size: 40,
                            color: AppColors.primary,
                          ).withEffect(),
                        ),
                        const SizedBox(height: 16),
                        // Uygulama Adı
                        const Text(
                          'AI Studio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ).withEffect(),
                      ],
                    ),
                  ),
                ),

                // Menü öğeleri - Scrollable alan
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.home,
                          title: 'Ana Sayfa',
                          color: AppColors.primary,
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildMenuItem(
                          icon: Icons.history,
                          title: 'Geçmiş',
                          color: AppColors.secondary,
                          onTap: () {
                            Navigator.pop(context);
                            // Geçmiş sayfasına git
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.settings,
                          title: 'Ayarlar',
                          color: AppColors.tertiary,
                          onTap: () {
                            Navigator.pop(context);
                            // Ayarlar sayfasına git
                          },
                        ),
                        const Divider(
                          color: AppColors.outline,
                          thickness: 1,
                          height: 32,
                          indent: 16,
                          endIndent: 16,
                        ),
                        _buildMenuItem(
                          icon: Icons.info,
                          title: 'Hakkında',
                          color: AppColors.info,
                          onTap: () {
                            // Karanlık/Aydınlık modu değiştirme
                            AppTheme.instance.setDarkMode(true);
                            Navigator.pop(context);
                            // Hakkında sayfasına git
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Karanlık Mod Seçimi
                SwitchListTile(
                  title: const Text('Karanlık Mod'),
                  value: AppTheme.instance.isDark,
                  onChanged: (value) {
                    AppTheme.instance.setDarkMode(value);
                  },
                ),

                // Alt kısım - Her zaman altta
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(
                        color: AppColors.outline,
                        thickness: 1,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.rocket_launch,
                            size: 16,
                            color: AppColors.primary,
                          ).withEffect(),
                          const SizedBox(width: 8),
                          Text(
                            'Version 1.0.0',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: BaseContainer(
        color: color,
        child: ListTile(
          leading: Icon(icon, color: color).withEffect(),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
