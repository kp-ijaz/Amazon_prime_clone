import 'package:amazonprime/presentation/pages/common_widgets/carousal_slider.dart';
import 'package:amazonprime/presentation/pages/common_widgets/choice_chips.dart';
import 'package:amazonprime/presentation/pages/common_widgets/common_widget_appbar.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SafeArea(
                child: AppBarWidget(
              title: 'Store',
              isImage: false,
            ))),
        body: const Column(
          children: [
            ChoiceChips(chiptext: ['All', 'Rent', 'Channels']),
            CarouselCustom(),
          ],
        ));
  }
}
