import 'package:flutter/material.dart';
import 'package:imageifyai/features/settings/pages/history/view/history_view.dart';
import 'package:imageifyai/core/tokens/colors.dart';
import 'package:imageifyai/features/settings/view/settings_view.dart';
import 'package:imageifyai/features/settings/pages/about/view/about_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildThemeData(context),
      child: Drawer(
        child: Container(
          decoration: _buildDrawerDecoration(),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildMenuItems(context),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Tema verisi
  ThemeData _buildThemeData(BuildContext context) {
    return Theme.of(context).copyWith(
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.surface,
        scrimColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        width: 320,
      ),
    );
  }

  // Drawer dekorasyonu
  BoxDecoration _buildDrawerDecoration() {
    return BoxDecoration(
      color: AppColors.surface,
      border: Border(
        right: BorderSide(
          color: AppColors.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
    );
  }

  // Header bölümü
  Widget _buildHeader() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            const SizedBox(height: 16),
            _buildTitle(),
          ],
        ),
      ),
    );
  }

  // Logo container'ı
  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withOpacity(0.15),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Icon(
        Icons.auto_awesome,
        size: 48,
        color: AppColors.primary.withOpacity(0.9),
      ),
    );
  }

  // Başlık
  Widget _buildTitle() {
    return Builder(
      builder: (context) => Text(
        'Imageify AI',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white.withOpacity(0.9),
            ),
      ),
    );
  }

  // Menü öğeleri
  Widget _buildMenuItems(BuildContext context) {
    return Expanded(
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
              onTap: () => _navigateTo(context, const HistoryView()),
            ),
            _buildMenuItem(
              icon: Icons.settings_rounded,
              title: 'Ayarlar',
              color: AppColors.tertiary,
              onTap: () => _navigateTo(context, const SettingsView()),
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
              onTap: () => _navigateTo(context, const AboutView()),
            ),
          ],
        ),
      ),
    );
  }

  // Menü öğesi
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color.withOpacity(0.1),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: _buildMenuIcon(icon, color),
        title: _buildMenuTitle(title),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  // Menü ikonu
  Widget _buildMenuIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.15),
      ),
      child: Icon(icon, color: color, size: 22),
    );
  }

  // Menü başlığı
  Widget _buildMenuTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: 0.5,
      ),
    );
  }

  // Alt bilgi
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.rocket_launch_rounded,
            size: 18,
            color: AppColors.primary.withOpacity(0.7),
          ),
          const SizedBox(width: 8),
          Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Navigasyon yardımcı metodu
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
