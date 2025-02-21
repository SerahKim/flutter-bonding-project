import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_app_bar.dart';
import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_body.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          MyTabAppBar(),
          MyTabBody(),
        ],
      ),
    );
  }
}
