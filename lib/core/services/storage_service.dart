import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/settings/model/settings_model.dart';
import '../base/base_service.dart';

/// Local storage işlemlerini yöneten provider
class StorageService extends ChangeNotifier implements BaseService {
  late final SharedPreferences _prefs;

  static const String _settingsKey = 'settings';

  Settings _settings = Settings.defaultSettings();

  Settings get settings => _settings;
  ThemeMode get themeMode => _settings.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  String get language => _settings.language;

  @override
  Future<void> initialize() async {
    await handleOperation(() async {
      _prefs = await SharedPreferences.getInstance();
      await _loadSettings();
    });
  }

  Future<void> _loadSettings() async {
    await handleOperation(() async {
      final jsonString = _prefs.getString(_settingsKey);
      if (jsonString != null) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        _settings = Settings.fromJson(json);
        notifyListeners();
      }
    });
  }

  Future<void> _saveSettings() async {
    await handleOperation(() async {
      final jsonString = jsonEncode(_settings.toJson());
      await _prefs.setString(_settingsKey, jsonString);
      notifyListeners();
    });
  }

  Future<void> updateSetting<T>(String key, T value) async {
    await handleOperation(() async {
      final Map<String, dynamic> json = _settings.toJson();
      json[key] = value;

      _settings = Settings.fromJson(json);
      await _saveSettings();
    });
  }

  Future<void> updateAISettings({
    int? stepCount,
    double? guidanceScale,
    bool? useSeed,
    int? seedValue,
  }) async {
    await handleOperation(() async {
      _settings = _settings.copyWith(
        stepCount: stepCount,
        guidanceScale: guidanceScale,
        useSeed: useSeed,
        seedValue: seedValue,
      );
      await _saveSettings();
    });
  }

  Future<void> resetSettings() async {
    await handleOperation(() async {
      _settings = Settings.defaultSettings();
      await _saveSettings();
    });
  }

  Future<bool> remove(String key) async {
    return await handleOperation(() => _prefs.remove(key));
  }

  Future<bool> clear() async {
    return await handleOperation(() async {
      _settings = Settings.defaultSettings();
      return await _prefs.clear();
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
