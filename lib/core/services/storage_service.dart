import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/settings/model/settings_model.dart';

/// Local storage işlemlerini yöneten provider
class StorageService extends ChangeNotifier {
  late final SharedPreferences _prefs;

  // Storage keys
  static const String _settingsKey = 'settings';

  // State
  Settings _settings = Settings.defaultSettings();

  // Getters
  Settings get settings => _settings;
  ThemeMode get themeMode => _settings.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  String get language => _settings.language;

  /// Servisi başlat
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final jsonString = _prefs.getString(_settingsKey);
      if (jsonString != null) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        _settings = Settings.fromJson(json);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Settings yüklenirken hata: $e');
      _settings = Settings.defaultSettings();
    }
  }

  /// Ayarları kaydet
  Future<void> _saveSettings() async {
    try {
      final jsonString = jsonEncode(_settings.toJson());
      await _prefs.setString(_settingsKey, jsonString);
      notifyListeners();
    } catch (e) {
      debugPrint('Settings kaydedilirken hata: $e');
    }
  }

  /// Tek bir ayarı güncelle
  Future<void> updateSetting<T>(String key, T value) async {
    final Map<String, dynamic> json = _settings.toJson();
    json[key] = value;

    _settings = Settings.fromJson(json);
    await _saveSettings();
  }

  /// AI ayarlarını güncelle
  Future<void> updateAISettings({
    int? stepCount,
    double? guidanceScale,
    bool? useSeed,
    int? seedValue,
  }) async {
    _settings = _settings.copyWith(
      stepCount: stepCount,
      guidanceScale: guidanceScale,
      useSeed: useSeed,
      seedValue: seedValue,
    );
    await _saveSettings();
  }

  /// Tüm ayarları sıfırla
  Future<void> resetSettings() async {
    _settings = Settings.defaultSettings();
    await _saveSettings();
  }

  /// Belirli bir ayarı sil
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  /// Tüm ayarları sil
  Future<bool> clear() async {
    _settings = Settings.defaultSettings();
    return await _prefs.clear();
  }
}
