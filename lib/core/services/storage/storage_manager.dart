/// Yerel depolama işlemlerini yöneten sınıf
abstract class StorageManager {
  Future<void> initialize();
  Future<bool> setString(String key, String value);
  String? getString(String key);
  Future<bool> setBool(String key, bool value);
  bool? getBool(String key);
  Future<bool> remove(String key);
  Future<bool> clear();
}
