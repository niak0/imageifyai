// Ayarlar için model
class Settings {
  final bool isDarkMode;
  final String language;
  final bool notificationsEnabled;
  final String imageQuality;
  // AI Görüntü ayarları
  final int stepCount;
  final double guidanceScale;
  final bool useSeed;
  final int seedValue;

  const Settings({
    required this.isDarkMode,
    required this.language,
    required this.notificationsEnabled,
    required this.imageQuality,
    this.stepCount = 30,
    this.guidanceScale = 7.5,
    this.useSeed = false,
    this.seedValue = 0,
  });

  // Default settings
  factory Settings.defaultSettings() => const Settings(
        isDarkMode: false,
        language: 'tr',
        notificationsEnabled: false,
        imageQuality: 'high',
        stepCount: 30,
        guidanceScale: 7.5,
        useSeed: false,
        seedValue: 0,
      );

  // JSON serialization
  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      language: json['language'] as String? ?? 'tr',
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? false,
      imageQuality: json['imageQuality'] as String? ?? 'high',
      stepCount: json['stepCount'] as int? ?? 30,
      guidanceScale: (json['guidanceScale'] as num?)?.toDouble() ?? 7.5,
      useSeed: json['useSeed'] as bool? ?? false,
      seedValue: json['seedValue'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'isDarkMode': isDarkMode,
        'language': language,
        'notificationsEnabled': notificationsEnabled,
        'imageQuality': imageQuality,
        'stepCount': stepCount,
        'guidanceScale': guidanceScale,
        'useSeed': useSeed,
        'seedValue': seedValue,
      };

  Settings copyWith({
    bool? isDarkMode,
    String? language,
    bool? notificationsEnabled,
    bool? saveHistory,
    String? imageQuality,
    int? stepCount,
    double? guidanceScale,
    bool? useSeed,
    int? seedValue,
  }) {
    return Settings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      imageQuality: imageQuality ?? this.imageQuality,
      stepCount: stepCount ?? this.stepCount,
      guidanceScale: guidanceScale ?? this.guidanceScale,
      useSeed: useSeed ?? this.useSeed,
      seedValue: seedValue ?? this.seedValue,
    );
  }

  @override
  String toString() => 'Settings(isDarkMode: $isDarkMode, language: $language, ...)';
}
