import 'package:provider/provider.dart';
import '../services/storage/storage_service.dart';
import '../../features/settings/view_model/settings_view_model.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<StorageService>(
      create: (_) => StorageService.instance,
    ),
    ChangeNotifierProvider<SettingsViewModel>(
      create: (context) => SettingsViewModel(
        storage: context.read<StorageService>(),
      ),
    ),
  ];
}
