import 'package:bonding/ui/pages/%08home/home_view_model.dart';
import 'package:bonding/ui/pages/%08home/tab/calendar_tab/calendar_tab.dart';
import 'package:bonding/ui/pages/%08home/tab/home_tab/home_tab.dart';
import 'package:bonding/ui/pages/%08home/tab/my_tab/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeIndexedStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.watch(homeViewModel);
        return IndexedStack(
          index: currentIndex,
          children: [
            HomeTab(),
            CalendarTab(),
            MyTab(),
          ],
        );
      },
    );
  }
}
