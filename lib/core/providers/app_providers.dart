import 'package:imageifyai/features/navigation_bar/navigation_bar_manager.dart';
import 'package:provider/provider.dart';

/// Gerçekten global olması gereken provider'lar
class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
        ChangeNotifierProvider(create: (_) => NavigationBarManager()),
        // ChangeNotifierProvider(create: (_) => ThemeManager()),
        // ChangeNotifierProvider(create: (_) => LocalizationManager()),
        // Diğer global provider'lar...
      ];
}
