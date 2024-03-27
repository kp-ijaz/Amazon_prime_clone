import 'package:amazonprime/presentation/pages/common_widgets/common_widget_appbar.dart';
import 'package:flutter/material.dart';

class Downloadpage extends StatelessWidget {
  const Downloadpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SafeArea(
              child: AppBarWidget(
            title: 'Downloads',
            isImage: false,
          ))),
      body: const Center(child: Text('Download page')),
    );
  }
}
