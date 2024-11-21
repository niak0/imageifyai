import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/storage_service.dart';
import '../model/settings_model.dart';

class SettingsViewModel extends ChangeNotifier {
  Settings _settings = Settings(
    isDarkMode: StorageService.getTheme(),
    language: StorageService.getLanguage(),
    notificationsEnabled: StorageService.getNotifications(),
    saveHistory: StorageService.getSaveHistory(),
    imageQuality: StorageService.getImageQuality(),
    stepCount: StorageService.getStepCount(),
    guidanceScale: StorageService.getGuidanceScale(),
    useSeed: StorageService.getUseSeed(),
    seedValue: StorageService.getSeedValue(),
  );

  Settings get settings => _settings;
  bool get isDark => _settings.isDarkMode;
  ThemeMode get themeMode => _settings.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> toggleTheme() async {
    await StorageService.setTheme(!_settings.isDarkMode);
    _settings = Settings(
      isDarkMode: !_settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: _settings.saveHistory,
      imageQuality: _settings.imageQuality,
      stepCount: _settings.stepCount,
      guidanceScale: _settings.guidanceScale,
      useSeed: _settings.useSeed,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> toggleNotifications(bool value) async {
    await StorageService.setNotifications(value);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: value,
      saveHistory: _settings.saveHistory,
      imageQuality: _settings.imageQuality,
      stepCount: _settings.stepCount,
      guidanceScale: _settings.guidanceScale,
      useSeed: _settings.useSeed,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> toggleSaveHistory(bool value) async {
    await StorageService.setSaveHistory(value);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: value,
      imageQuality: _settings.imageQuality,
      stepCount: _settings.stepCount,
      guidanceScale: _settings.guidanceScale,
      useSeed: _settings.useSeed,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> setImageQuality(String quality) async {
    await StorageService.setImageQuality(quality);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: _settings.saveHistory,
      imageQuality: quality,
      stepCount: _settings.stepCount,
      guidanceScale: _settings.guidanceScale,
      useSeed: _settings.useSeed,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> setStepCount(int value) async {
    await StorageService.setStepCount(value);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: _settings.saveHistory,
      imageQuality: _settings.imageQuality,
      stepCount: value,
      guidanceScale: _settings.guidanceScale,
      useSeed: _settings.useSeed,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> setGuidanceScale(double value) async {
    await StorageService.setGuidanceScale(value);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: _settings.saveHistory,
      imageQuality: _settings.imageQuality,
      stepCount: _settings.stepCount,
      guidanceScale: value,
      useSeed: _settings.useSeed,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> toggleUseSeed(bool value) async {
    await StorageService.setUseSeed(value);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: _settings.saveHistory,
      imageQuality: _settings.imageQuality,
      stepCount: _settings.stepCount,
      guidanceScale: _settings.guidanceScale,
      useSeed: value,
      seedValue: _settings.seedValue,
    );
    notifyListeners();
  }

  Future<void> setSeedValue(int value) async {
    await StorageService.setSeedValue(value);
    _settings = Settings(
      isDarkMode: _settings.isDarkMode,
      language: _settings.language,
      notificationsEnabled: _settings.notificationsEnabled,
      saveHistory: _settings.saveHistory,
      imageQuality: _settings.imageQuality,
      stepCount: _settings.stepCount,
      guidanceScale: _settings.guidanceScale,
      useSeed: _settings.useSeed,
      seedValue: value,
    );
    notifyListeners();
  }
}
