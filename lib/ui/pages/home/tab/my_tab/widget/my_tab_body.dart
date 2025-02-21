import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_management/my_tab_management.dart';
import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_profile.dart';
import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_progress_bar.dart';
import 'package:flutter/material.dart';

class MyTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 내용이 많아 스크롤이 필요할 경우를 대비
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            MyTabProfile(),
            SizedBox(height: 15),
            MyTabProgressBar(),
            SizedBox(height: 15),
            MyTabManagement(),
          ],
        ),
      ),
    );
  }
}
