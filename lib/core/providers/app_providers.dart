import 'package:imageifyai/core/theme/theme_manager.dart';
import 'package:imageifyai/features/navigation_bar/navigation_bar_manager.dart';
import 'package:provider/provider.dart';

/// Gerçekten global olması gereken provider'lar
class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
        ChangeNotifierProvider(create: (_) => NavigationBarManager()),
        ChangeNotifierProvider.value(value: ThemeManager.instance),
        // ChangeNotifierProvider(create: (_) => LocalizationManager()),
        // Diğer global provider'lar...
      ];
}
