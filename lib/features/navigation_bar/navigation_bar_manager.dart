import 'package:flutter/material.dart';
import 'package:imageifyai/features/profile/profile_view.dart';

import '../home/view/home_view.dart';

class NavigationBarManager with ChangeNotifier {
  int _currentIndex = 0;
  final _home = const HomeView();
  final _profile = const ProfileView();

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }

  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Anasayfa'),
    BottomNavigationBarItem(icon: Icon(Icons.notification_add_outlined), label: 'Fallarım'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
  ];

  String getAppBarTitle() => navBarItems[_currentIndex].label ?? "null";

  List<Widget> get _pages => [_home, _profile];
  List<Widget> get pages => _pages;
}
