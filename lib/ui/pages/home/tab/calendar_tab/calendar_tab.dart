import 'package:bonding/ui/pages/%08home/tab/calendar_tab/widget/calendar_tab_app_bar.dart';
import 'package:bonding/ui/pages/%08home/tab/calendar_tab/widget/calendar_tab_body.dart';
import 'package:flutter/material.dart';

class CalendarTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarTabAppBar(),
          Expanded(
            child: CalendarTabBody(),
          ), // Expanded 추가
        ],
      ),
    );
  }
}
