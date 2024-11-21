import 'package:flutter/material.dart';
import '../base/base_service.dart';
import '../route_animations/fade_route.dart';

class NavigationService implements BaseService {
  static final NavigationService _instance = NavigationService._internal();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory NavigationService() => _instance;
  NavigationService._internal();

  @override
  Future<void> initialize() async {
    await handleOperation(() async {});
  }

  NavigatorState get navigator => navigatorKey.currentState!;

  /// Yeni sayfaya fade animasyonu ile yönlendirir
  /// [page] açılacak sayfa widget'ı
  Future<T?> navigateToPage<T>(Widget page) async {
    return await handleOperation(() async {
      return await navigator.push(FadeRoute<T>(page: page));
    });
  }

  /// Belirli bir route'a fade animasyonu ile yönlendirir
  /// [routeName] hedef sayfa route'u
  /// [arguments] isteğe bağlı argümanlar
  Future<T?> navigateTo<T>(String routeName, {Object? arguments}) async {
    return await handleOperation(() async {
      return await navigator.pushNamed(
        routeName,
        arguments: arguments,
      );
    });
  }

  /// Geri döner
  /// [result] geri dönüş değeri
  void goBack<T>([T? result]) {
    handleOperation(() async {
      navigator.pop(result);
    });
  }

  /// Tüm sayfaları kapatıp yeni sayfaya yönlendirir
  /// [page] açılacak sayfa widget'ı
  Future<T?> navigateAndReplacePage<T>(Widget page) async {
    return await handleOperation(() async {
      return await navigator.pushAndRemoveUntil(
        FadeRoute<T>(page: page),
        (route) => false,
      );
    });
  }

  /// Tüm sayfaları kapatıp yeni route'a yönlendirir
  /// [routeName] hedef sayfa route'u
  /// [arguments] isteğe bağlı argümanlar
  Future<T?> navigateAndReplace<T>(String routeName, {Object? arguments}) async {
    return await handleOperation(() async {
      return await navigator.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    });
  }

  @override
  Future<T> handleOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } catch (e) {
      debugPrint('Service Error: $e');
      throw ServiceException(message: e.toString());
    }
  }
}
