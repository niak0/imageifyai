import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/widgets/buttons/app_button.dart';
import 'package:imageifyai/product/styles/button_styles.dart';
import 'package:imageifyai/product/tokens/app_tokens.dart';
import 'package:imageifyai/product/tokens/colors.dart';
import 'package:imageifyai/core/extensions/theme_extensions.dart';
import 'package:imageifyai/core/widgets/glass_container.dart';
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
          backgroundColor: AppColors.primaryBackground,
          appBar: AppBar(
            title: const Text('Arka Plan Kaldır'),
          ),
          body: SingleChildScrollView(
            padding: AppTokens.paddingAllMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Resim seçme/yükleme alanı
                BaseContainer(
                  onTap: () {},
                  height: 300,
                  color: AppColors.primary,
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
                              color: AppColors.primary,
                            ).withEffect(color: AppColors.primary.withOpacity(0.6)),
                            const SizedBox(height: 16),
                            const Text(
                              'Resim Yükle',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ).withEffect(color: AppColors.primary.withOpacity(0.6)),
                            const SizedBox(height: 8),
                            Text(
                              've keyfine bak',
                              style: TextStyle(
                                color: AppColors.primary.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ).withEffect(color: AppColors.primary.withOpacity(0.6)),
                          ],
                        ),
                ),

                const SizedBox(height: 24),

                // Resim seçme butonu
                AppButton(
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
