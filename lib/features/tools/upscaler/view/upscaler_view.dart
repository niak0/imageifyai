import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/widgets/buttons/app_button.dart';
import 'package:imageifyai/core/styles/button_styles.dart';
import 'package:imageifyai/core/styles/decorations.dart';
import 'package:imageifyai/core/tokens/app_tokens.dart';
import 'package:imageifyai/core/tokens/colors.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/tools/upscaler/view_model/upscaler_view_model.dart';
import 'package:provider/provider.dart';

class UpscalerView extends StatelessWidget {
  const UpscalerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpscalerViewModel(),
      child: Consumer<UpscalerViewModel>(
        builder: (context, viewModel, _) => GradientScaffold(
          backgroundColor: AppColors.card,
          appBar: AppBar(
            title: const Text('Kalite Yükseltici'),
          ),
          body: SingleChildScrollView(
            padding: AppTokens.paddingAllMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Resim seçme/yükleme alanı
                Container(
                  decoration: AppDecorations.baseContainer,
                  height: 300,
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
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Resim Yükle',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              've keyfine bak',
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
                  color: AppColors.utility,
                  text: 'Galeriden Resim Seç',
                  leftIcon: Icons.photo_library_outlined,
                  isFullWidth: true,
                  isLoading: viewModel.isLoading,
                  onPressed: () => viewModel.pickImage(ImageSource.gallery),
                ),

                if (viewModel.selectedImage != null) ...[
                  const SizedBox(height: 24),

                  // Kalite yükseltme butonu
                  AppButton(
                    color: AppColors.utility,
                    text: 'Kaliteyi Yükselt',
                    leftIcon: Icons.auto_awesome,
                    type: AppButtonType.secondary,
                    isFullWidth: true,
                    isLoading: viewModel.isLoading,
                    onPressed: viewModel.upscaleImage,
                  ),
                ],

                if (viewModel.resultImage != null) ...[
                  const SizedBox(height: 24),

                  // Sonuç resmi
                  Container(
                    decoration: AppDecorations.baseContainer,
                    height: 300,
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
