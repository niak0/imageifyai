import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/utils/image_picker_dialog.dart';
import '../../../../../product/tokens/colors.dart';

class ParentImageSelector extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? image;
  final Function(ImageSource) onSelect;
  final bool isLoading;

  const ParentImageSelector({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onSelect,
    this.isLoading = false,
  });

  Future<void> _showImageSourceDialog(BuildContext context) async {
    final source = await ImagePickerDialog.show(context);
    if (source != null) {
      onSelect(source);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: isLoading ? null : () => _showImageSourceDialog(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: image != null ? AppColors.primary : AppColors.textLow,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : image != null
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(
                              File(image!),
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.5),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 40,
                              color: AppColors.primary.withOpacity(0.5),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subtitle,
                              style: const TextStyle(
                                color: AppColors.text,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
