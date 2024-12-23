import 'package:flutter/material.dart';
import 'package:imageifyai/core/extensions/press_animation.dart';
import 'package:imageifyai/core/styles/decorations.dart';
import 'package:imageifyai/core/constants/app_constants.dart';
import 'package:imageifyai/core/constants/colors.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';
import 'package:imageifyai/features/tools/rem_bg/view_model/rem_bg_view_model.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/image_picker_dialog.dart';

class RemoveBackgroundView extends StatelessWidget {
  const RemoveBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RemoveBackgroundViewModel(),
      child: Consumer<RemoveBackgroundViewModel>(
        builder: (context, viewModel, _) => Scaffold(
          appBar: AppBar(
            title: const Text('Arka Plan Kaldır'),
          ),
          body: SingleChildScrollView(
            padding: AppConstants.paddingAllMd,
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
                ).withPressAnimation(
                  onTap: () => _handleImagePick(context),
                ),

                const SizedBox(height: 24),

                // Resim seçme butonu
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Galeriden Resim Seç'),
                  onPressed: () => _handleImagePick(context),
                ),

                if (viewModel.selectedImage != null) ...[
                  const SizedBox(height: 24),

                  // Arka plan kaldırma butonu
                  OutlinedButton.icon(
                    icon: const Icon(Icons.auto_fix_high),
                    label: const Text('Arka Planı Kaldır'),
                    onPressed: viewModel.removeBackground,
                  ),
                ],

                if (viewModel.resultImage != null) ...[
                  const SizedBox(height: 32),

                  // Sonuç alanı
                  Container(
                    decoration: AppDecorations.baseContainer,
                    child: Image.file(
                      viewModel.resultImage!,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // İndirme butonu
                  ElevatedButton.icon(
                    icon: const Icon(Icons.download),
                    label: const Text('Sonucu İndir'),
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

  Future<void> _handleImagePick(BuildContext context) async {
    final source = await ImagePickerDialog.show(context);
    if (source != null) {
      context.read<RemoveBackgroundViewModel>().pickImage(source);
    }
  }
}
