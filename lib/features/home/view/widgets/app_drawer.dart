import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/colors.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';
import 'package:provider/provider.dart';
import 'package:imageifyai/features/settings/pages/history/view/history_view.dart';
import 'package:imageifyai/features/settings/view/settings_view.dart';
import 'package:imageifyai/features/settings/pages/about/view/about_view.dart';
import 'package:imageifyai/features/settings/view_model/settings_view_model.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = context.read<SettingsViewModel>();

    return Theme(
      data: Theme.of(context).copyWith(
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.surface,
          scrimColor: Colors.black.withOpacity(0.6),
          elevation: 0,
          width: 300,
        ),
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border(
              right: BorderSide(
                color: AppColors.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.surface,
                AppColors.surface.withOpacity(0.95),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary.withOpacity(0.2),
                        AppColors.secondary.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.15),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.3),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          size: 44,
                          color: AppColors.primary,
                        ).withEffect(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'AI Studio',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                      ).withEffect(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.home_rounded,
                          title: 'Ana Sayfa',
                          color: AppColors.primary,
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildMenuItem(
                          icon: Icons.history_rounded,
                          title: 'Geçmiş',
                          color: AppColors.secondary,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const HistoryView()),
                            );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.settings_rounded,
                          title: 'Ayarlar',
                          color: AppColors.tertiary,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SettingsView()),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(
                            color: AppColors.outline,
                            thickness: 1,
                          ),
                        ),
                        _buildMenuItem(
                          icon: Icons.info_rounded,
                          title: 'Hakkında',
                          color: AppColors.info,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const AboutView()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.rocket_launch_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ).withEffect(),
                      const SizedBox(width: 8),
                      Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color.withOpacity(0.1),
        border: Border.all(
          color: color.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
          ),
          child: Icon(icon, color: color, size: 22).withEffect(),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
