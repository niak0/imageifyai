import 'package:flutter/material.dart';
import '../../../core/services/storage/storage_service.dart';
import '../model/settings_model.dart';

class SettingsViewModel extends ChangeNotifier {
  final StorageService _storage;

  SettingsViewModel({required StorageService storage}) : _storage = storage {
    _loadSettings();
  }

  late Settings _settings;
  Settings get settings => _settings;
  bool get isDark => _settings.isDarkMode;
  ThemeMode get themeMode => _settings.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void _loadSettings() {
    _settings = Settings(
      isDarkMode: _storage.getTheme(),
      language: _storage.getLanguage(),
      notificationsEnabled: _storage.getNotifications(),
      saveHistory: _storage.getSaveHistory(),
      imageQuality: _storage.getImageQuality(),
      stepCount: _storage.getStepCount(),
      guidanceScale: _storage.getGuidanceScale(),
      useSeed: _storage.getUseSeed(),
      seedValue: _storage.getSeedValue(),
    );
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    await _storage.setTheme(!_settings.isDarkMode);
    _loadSettings();
  }

  Future<void> toggleNotifications(bool value) async {
    await _storage.setNotifications(value);
    _loadSettings();
  }

  Future<void> toggleSaveHistory(bool value) async {
    await _storage.setSaveHistory(value);
    _loadSettings();
  }

  Future<void> setImageQuality(String quality) async {
    await _storage.setImageQuality(quality);
    _loadSettings();
  }

  Future<void> setStepCount(int value) async {
    await _storage.setStepCount(value);
    _loadSettings();
  }

  Future<void> setGuidanceScale(double value) async {
    await _storage.setGuidanceScale(value);
    _loadSettings();
  }

  Future<void> toggleUseSeed(bool value) async {
    await _storage.setUseSeed(value);
    _loadSettings();
  }

  Future<void> setSeedValue(int value) async {
    await _storage.setSeedValue(value);
    _loadSettings();
  }
}
