import 'package:flutter/material.dart';
import '../../../core/base/base_view_model.dart';
import '../../../core/services/storage_service.dart';
import '../model/settings_model.dart';

class SettingsViewModel extends BaseViewModel {
  final StorageService _storage;

  SettingsViewModel({required StorageService storage}) : _storage = storage;

  // Getters
  Settings get settings => _storage.settings;
  bool get isDark => settings.isDarkMode;
  ThemeMode get themeMode => settings.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // Theme ayarları
  Future<void> toggleTheme() async {
    await handleAsync(() async {
      await _storage.updateSetting('isDarkMode', !settings.isDarkMode);
    });
  }

  // Bildirim ayarları
  Future<void> toggleNotifications(bool value) async {
    await handleAsync(() async {
      await _storage.updateSetting('notificationsEnabled', value);
    });
  }

  // Geçmiş kaydetme ayarları
  Future<void> toggleSaveHistory(bool value) async {
    await handleAsync(() async {
      await _storage.updateSetting('saveHistory', value);
    });
  }

  // Görüntü kalitesi ayarları
  Future<void> setImageQuality(String quality) async {
    await handleAsync(() async {
      await _storage.updateSetting('imageQuality', quality);
    });
  }

  // AI ayarları
  Future<void> updateAISettings({
    int? stepCount,
    double? guidanceScale,
    bool? useSeed,
    int? seedValue,
  }) async {
    await handleAsync(() async {
      await _storage.updateAISettings(
        stepCount: stepCount,
        guidanceScale: guidanceScale,
        useSeed: useSeed,
        seedValue: seedValue,
      );
    });
  }
}
