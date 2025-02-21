import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_management/my_tab_management_item.dart';
import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_management/my_tab_management_participant.dart';
import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_management/my_tab_management_schedule.dart';
import 'package:flutter/material.dart';

class MyTabManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: Offset(4, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '관리',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            MyTabManagementItem(
              icon: Icons.people,
              text: '참여자 관리',
              nextPage: MyTabManagementParticipant(),
            ),
            Divider(), // 구분선 추가
            MyTabManagementItem(
              icon: Icons.calendar_today,
              text: '스케줄 관리',
              nextPage: MyTabManagementSchedule(),
            ),
          ],
        ),
      ),
    );
  }
}
