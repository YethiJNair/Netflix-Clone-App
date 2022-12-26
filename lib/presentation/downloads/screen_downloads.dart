import 'package:flutter/material.dart';

import 'package:netflix/presentation/downloads/widgets/section2.dart';
import 'package:netflix/presentation/downloads/widgets/section3.dart';
import 'package:netflix/presentation/downloads/widgets/smart_downloads.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: SafeArea(
                child: AppBarWidget(
              title: "Downloads",
            ))),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (ctx, index) => _widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(
            height: 25,
          ),
          itemCount: _widgetList.length,
        ));
  }
}
