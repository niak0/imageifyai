import 'package:imageifyai/core/theme/theme_manager.dart';
import 'package:provider/provider.dart';

/// Gerçekten global olması gereken provider'lar
class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
        ChangeNotifierProvider.value(value: ThemeManager.instance),
        // ChangeNotifierProvider(create: (_) => LocalizationManager()),
        // Diğer global provider'lar...
      ];
}
