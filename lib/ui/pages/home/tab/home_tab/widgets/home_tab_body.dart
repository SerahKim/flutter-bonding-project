import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_tab_bar.dart';
import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_date.dart';
import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_profile.dart';
import 'package:flutter/material.dart';

class HomeTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeTabDate(),
            HomeTabProfile(),
            HomeTabTabBar(),
          ],
        ),
      ),
    );
  }
}
