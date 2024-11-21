import 'package:flutter/material.dart';
import 'package:imageifyai/core/route_animations/fade_route.dart';

/// Uygulama içi navigasyonu yönetir.
/// Context gerektirmeden navigasyon işlemlerini sağlar.
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory NavigationService() => _instance;
  NavigationService._internal();

  /// Geçerli Navigator state'ini döndürür
  NavigatorState get navigator => navigatorKey.currentState!;

  /// Yeni sayfaya fade animasyonu ile yönlendirir
  /// [page] açılacak sayfa widget'ı
  Future<T?> navigateToPage<T>(Widget page) {
    return navigator.push(FadeRoute<T>(page: page));
  }

  /// Belirli bir route'a fade animasyonu ile yönlendirir
  /// [routeName] hedef sayfa route'u
  /// [arguments] isteğe bağlı argümanlar
  Future<T?> navigateTo<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Geri döner
  /// [result] geri dönüş değeri
  void goBack<T>([T? result]) {
    return navigator.pop(result);
  }

  /// Tüm sayfaları kapatıp yeni sayfaya yönlendirir
  /// [page] açılacak sayfa widget'ı
  Future<T?> navigateAndReplacePage<T>(Widget page) {
    return navigator.pushAndRemoveUntil(
      FadeRoute<T>(page: page),
      (route) => false,
    );
  }

  /// Tüm sayfaları kapatıp yeni route'a yönlendirir
  /// [routeName] hedef sayfa route'u
  /// [arguments] isteğe bağlı argümanlar
  Future<T?> navigateAndReplace<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
