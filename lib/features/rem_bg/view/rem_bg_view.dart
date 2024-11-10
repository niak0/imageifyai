import 'package:flutter/material.dart';
import 'package:imageifyai/core/components/buttons/app_button.dart';
import 'package:imageifyai/core/constants/app_constants.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/widgets/glass_container.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';

class RemoveBackgroundView extends StatelessWidget {
  const RemoveBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Text('Arka Plan Kaldır'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Resim seçme/yükleme alanı
            GlassContainer(
              borderColor: AppColors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 48,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Resim Yükle',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'veya sürükle bırak',
                    style: TextStyle(
                      color: AppColors.primary.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Resim seçme butonu
            AppButton(
              text: 'Galeriden Resim Seç',
              leftIcon: Icons.photo_library_outlined,
              isFullWidth: true,
              onPressed: () {
                // Galeri işlemleri
              },
            ),

            const SizedBox(height: 32),

            // Sonuç alanı (başlangıçta gizli olacak)
            GlassContainer(
              borderColor: AppColors.secondary,
              child: Center(
                child: Text(
                  'İşlem sonucu burada görüntülenecek',
                  style: TextStyle(
                    color: AppColors.secondary.withOpacity(0.7),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // İndirme butonu (başlangıçta gizli olacak)
            AppButton(
              text: 'Sonucu İndir',
              leftIcon: Icons.download,
              isFullWidth: true,
              onPressed: null, // Başlangıçta deaktif
            ),
          ],
        ),
      ),
    );
  }
}
