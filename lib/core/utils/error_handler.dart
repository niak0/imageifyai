import 'dart:async';

import 'package:flutter/material.dart';

/// Uygulama genelinde hata yönetimini sağlar.
/// Hata mesajlarını standartlaştırır ve kullanıcı dostu hale getirir.
class ErrorHandler {
  /// Hata tipine göre uygun mesajı döndürür
  /// [error] yakalanan hata
  static String handleError(dynamic error) {
    if (error is TimeoutException) {
      return 'Bağlantı zaman aşımına uğradı';
    }
    // if (error is NetworkException) {
    //   return 'İnternet bağlantınızı kontrol edin';
    // }
    // if (error is ApiException) {
    //   return 'Servis şu anda kullanılamıyor';
    // }
    return 'Beklenmeyen bir hata oluştu';
  }

  /// Hata dialog'u gösterir
  static void showErrorDialog(BuildContext context, String message) {
    // Implementation
  }
}

// Kullanım örneği:
// try {
//   await generateImage();
// } catch (e) {
//   final message = ErrorHandler.handleError(e);
//   ErrorHandler.showErrorDialog(context, message);
// }