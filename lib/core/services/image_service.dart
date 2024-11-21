import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../base/base_service.dart';

class ImageService implements BaseService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<void> initialize() async {
    await handleOperation(() async {
      // Image picker için izin kontrolü vs.
    });
  }

  Future<String?> pickImage(ImageSource source) async {
    return await handleOperation(() async {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      return pickedFile?.path;
    });
  }

  @override
  Future<T> handleOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } catch (e) {
      debugPrint('Service Error: $e');
      throw ServiceException(message: e.toString());
    }
  }
}
