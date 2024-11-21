import 'package:shared_preferences/shared_preferences.dart';

/// Uygulama ayarlarını ve tercihlerini yönetmek için servis
class StorageService {
  static late final SharedPreferences _prefs;

  // Storage key'leri
  static const String _themeKey = 'theme_is_dark';
  static const String _notificationsKey = 'notifications_enabled';
  static const String _saveHistoryKey = 'save_history';
  static const String _imageQualityKey = 'image_quality';
  static const String _languageKey = 'language';
  static const String _stepCountKey = 'step_count';
  static const String _guidanceScaleKey = 'guidance_scale';
  static const String _useSeedKey = 'use_seed';
  static const String _seedValueKey = 'seed_value';

  // Storage servisini başlat
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Tema ayarını kaydet
  static Future<void> setTheme(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
  }

  // Tema ayarını getir
  static bool getTheme() {
    return _prefs.getBool(_themeKey) ?? false;
  }

  // Bildirim ayarını kaydet
  static Future<void> setNotifications(bool enabled) async {
    await _prefs.setBool(_notificationsKey, enabled);
  }

  // Bildirim ayarını getir
  static bool getNotifications() {
    return _prefs.getBool(_notificationsKey) ?? true;
  }

  // Geçmiş kaydetme ayarını kaydet
  static Future<void> setSaveHistory(bool enabled) async {
    await _prefs.setBool(_saveHistoryKey, enabled);
  }

  // Geçmiş kaydetme ayarını getir
  static bool getSaveHistory() {
    return _prefs.getBool(_saveHistoryKey) ?? true;
  }

  // Görsel kalitesi ayarını kaydet
  static Future<void> setImageQuality(String quality) async {
    await _prefs.setString(_imageQualityKey, quality);
  }

  // Görsel kalitesi ayarını getir
  static String getImageQuality() {
    return _prefs.getString(_imageQualityKey) ?? 'high';
  }

  // Dil ayarını kaydet
  static Future<void> setLanguage(String language) async {
    await _prefs.setString(_languageKey, language);
  }

  // Dil ayarını getir
  static String getLanguage() {
    return _prefs.getString(_languageKey) ?? 'tr';
  }

  // Step Count
  static Future<void> setStepCount(int value) async {
    await _prefs.setInt(_stepCountKey, value);
  }

  static int getStepCount() {
    return _prefs.getInt(_stepCountKey) ?? 30;
  }

  // Guidance Scale
  static Future<void> setGuidanceScale(double value) async {
    await _prefs.setDouble(_guidanceScaleKey, value);
  }

  static double getGuidanceScale() {
    return _prefs.getDouble(_guidanceScaleKey) ?? 7.5;
  }

  // Use Seed
  static Future<void> setUseSeed(bool value) async {
    await _prefs.setBool(_useSeedKey, value);
  }

  static bool getUseSeed() {
    return _prefs.getBool(_useSeedKey) ?? false;
  }

  // Seed Value
  static Future<void> setSeedValue(int value) async {
    await _prefs.setInt(_seedValueKey, value);
  }

  static int getSeedValue() {
    return _prefs.getInt(_seedValueKey) ?? 0;
  }
}
