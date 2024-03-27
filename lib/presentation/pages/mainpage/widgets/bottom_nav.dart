import 'package:amazonprime/core/colors/colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            backgroundColor: backgroundColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Store'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv_rounded), label: 'Live tv'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.file_download_outlined), label: 'Downloads'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
            ],
          );
        });
  }
}
