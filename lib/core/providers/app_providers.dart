import 'package:provider/provider.dart';
import '../services/storage_service.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    // Sadece global StorageService
    ChangeNotifierProvider<StorageService>(
      create: (_) => StorageService()..initialize(),
    ),
  ];
}
