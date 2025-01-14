import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_app_bar.dart';
import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_bar.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          HomeTabAppBar(),
          HomeTabBar(),
        ],
      ),
    );
  }
}
