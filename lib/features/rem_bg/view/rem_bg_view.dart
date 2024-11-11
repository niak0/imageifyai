import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/components/buttons/app_button.dart';
import 'package:imageifyai/core/constants/app_constants.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/widgets/glass_container.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/rem_bg/view_model/rem_bg_view_model.dart';
import 'package:provider/provider.dart';

class RemoveBackgroundView extends StatelessWidget {
  const RemoveBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RemoveBackgroundViewModel(),
      child: Consumer<RemoveBackgroundViewModel>(
        builder: (context, viewModel, _) => GradientScaffold(
          backgroundStyle: BackgroundStyle.particles,
          backgroundColor: AppColors.utilityBackground,
          appBar: AppBar(
            title: const Text('Arka Plan Kaldır'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Resim seçme/yükleme alanı
                BaseContainer(
                  onTap: () {},
                  height: 300,
                  color: AppColors.utility,
                  child: viewModel.selectedImage != null
                      ? Image.file(
                          viewModel.selectedImage!,
                          fit: BoxFit.contain,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_upload_outlined,
                              size: 48,
                              color: AppColors.utility,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Resim Yükle',
                              style: TextStyle(
                                color: AppColors.utility,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              've keyfine bak',
                              style: TextStyle(
                                color: AppColors.utility.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                ),

                const SizedBox(height: 24),

                // Resim seçme butonu
                AppButton(
                  color: AppColors.utility,
                  text: 'Galeriden Resim Seç',
                  leftIcon: Icons.photo_library_outlined,
                  isFullWidth: true,
                  isLoading: viewModel.isLoading,
                  onPressed: () => viewModel.pickImage(ImageSource.gallery),
                ),

                if (viewModel.selectedImage != null) ...[
                  const SizedBox(height: 24),

                  // Arka plan kaldırma butonu
                  AppButton(
                    color: AppColors.utility,
                    type: AppButtonType.secondary,
                    text: 'Arka Planı Kaldır',
                    leftIcon: Icons.auto_fix_high,
                    isFullWidth: true,
                    isLoading: viewModel.isLoading,
                    onPressed: viewModel.removeBackground,
                  ),
                ],

                if (viewModel.resultImage != null) ...[
                  const SizedBox(height: 32),

                  // Sonuç alanı
                  BaseContainer(
                    color: AppColors.utility,
                    child: Image.file(
                      viewModel.resultImage!,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // İndirme butonu
                  AppButton(
                    color: AppColors.utility,
                    text: 'Sonucu İndir',
                    leftIcon: Icons.download,
                    isFullWidth: true,
                    isLoading: viewModel.isLoading,
                    onPressed: viewModel.downloadResult,
                  ),
                ],

                // Hata mesajı
                if (viewModel.error != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    viewModel.error!,
                    style: const TextStyle(
                      color: AppColors.error,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
