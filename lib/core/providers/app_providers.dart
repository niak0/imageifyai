import 'package:provider/provider.dart';
import '../services/storage_service.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<StorageService>(
      create: (_) => StorageService()..initialize(),
    ),
  ];
}
