import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_manager.dart';

class ProjectNavigationBar extends StatelessWidget {
  const ProjectNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarManager navigationBarManager = context.watch<NavigationBarManager>();
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // onPageChanged: (index) {
        //   navigationBarManager.setIndex(index);
        // },
        children: navigationBarManager.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: navigationBarManager.currentIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
          navigationBarManager.setIndex(index);
        },
        items: navigationBarManager.navBarItems,
      ),
    );
  }
}
