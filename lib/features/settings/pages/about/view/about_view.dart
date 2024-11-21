import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/colors.dart';
import 'package:provider/provider.dart';
import '../view_model/about_view_model.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AboutViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hakkında'),
        ),
        body: Consumer<AboutViewModel>(
          builder: (context, viewModel, child) {
            final aboutInfo = viewModel.aboutInfo;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Logo ve Uygulama Adı
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          size: 64,
                          color: AppColors.primary,
                        ).withEffect(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Imageify AI',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                      ).withEffect(),
                      const SizedBox(height: 8),
                      Text(
                        'Version ${aboutInfo.version} (${aboutInfo.buildNumber})',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // İletişim Bilgileri
                _buildSection(
                  title: 'İletişim',
                  children: [
                    _buildInfoTile(
                      icon: Icons.email_rounded,
                      title: 'E-posta',
                      subtitle: aboutInfo.email,
                      onTap: viewModel.sendEmail,
                    ),
                    _buildInfoTile(
                      icon: Icons.language_rounded,
                      title: 'Website',
                      subtitle: aboutInfo.website,
                      onTap: viewModel.openWebsite,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Geliştirici Bilgileri
                _buildSection(
                  title: 'Geliştirici',
                  children: [
                    _buildInfoTile(
                      icon: Icons.code_rounded,
                      title: 'Geliştirici',
                      subtitle: aboutInfo.developer,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Lisans Bilgileri
                _buildSection(
                  title: 'Lisans',
                  children: [
                    _buildInfoTile(
                      icon: Icons.description_rounded,
                      title: 'Lisans Bilgileri',
                      subtitle: 'MIT License',
                      onTap: () {
                        // TODO: Lisans detayları
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Geri Bildirim Butonu
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Geri bildirim dialog'u
                  },
                  icon: const Icon(Icons.feedback_rounded),
                  label: const Text('Geri Bildirim Gönder'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap != null ? const Icon(Icons.arrow_forward_ios_rounded, size: 16) : null,
      onTap: onTap,
    );
  }
}
