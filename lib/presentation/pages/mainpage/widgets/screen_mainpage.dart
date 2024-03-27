import 'package:amazonprime/presentation/pages/downloads/downloads.dart';
import 'package:amazonprime/presentation/pages/home/home.dart';
import 'package:amazonprime/presentation/pages/live_tv/live_tv.dart';
import 'package:amazonprime/presentation/pages/store/store_page.dart';
import 'package:flutter/material.dart';

import '../../search/searchpage.dart';
import 'bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const HomePage(),
    const StorePage(),
    const LiveTv(),
    const Downloadpage(),
    const SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (cotext, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
