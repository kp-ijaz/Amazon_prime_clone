import 'package:amazonprime/presentation/pages/common_widgets/common_widget_appbar.dart';
import 'package:flutter/material.dart';

class LiveTv extends StatelessWidget {
  const LiveTv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SafeArea(
              child: AppBarWidget(
            goldencolour: false,
            title: 'Live TV ',
            isImage: false,
          ))),
      body: const Center(child: Text('Live Tv Page')),
    );
  }
}
