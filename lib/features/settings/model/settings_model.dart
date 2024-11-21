// Ayarlar için model
class Settings {
  final bool isDarkMode;
  final String language;
  final bool notificationsEnabled;
  final bool saveHistory;
  final String imageQuality;
  // AI Görüntü ayarları
  final int stepCount;
  final double guidanceScale;
  final bool useSeed;
  final int seedValue;

  Settings({
    required this.isDarkMode,
    required this.language,
    required this.notificationsEnabled,
    required this.saveHistory,
    required this.imageQuality,
    this.stepCount = 30,
    this.guidanceScale = 7.5,
    this.useSeed = false,
    this.seedValue = 0,
  });
}
