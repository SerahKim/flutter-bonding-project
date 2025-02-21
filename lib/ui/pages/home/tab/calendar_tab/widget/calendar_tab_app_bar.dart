import 'package:flutter/material.dart';

class CalendarTabAppBar extends StatefulWidget {
  @override
  State<CalendarTabAppBar> createState() => _CalendarTabAppBarState();
}

class _CalendarTabAppBarState extends State<CalendarTabAppBar> {
  int notificationCount = 3;
  // 예제 알림 개수

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          print('메뉴 선택됨');
        },
      ),
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              print('이전 달 선택됨');
            },
            icon: Icon(Icons.chevron_left),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              print('날짜 선택됨');
            },
            child: Text('2025년 1월 24일'),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              print('다음 달 선택됨');
            },
            icon: Icon(Icons.chevron_right),
          ),
        ],
      ), // 검색창 UI
      actions: [
        // 🔔 알림 아이콘 (배지 표시)
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none_rounded),
              onPressed: () {
                setState(() {
                  notificationCount = 0; // 알림 클릭 시 초기화
                });
              },
            ),
            if (notificationCount > 0)
              Positioned(
                right: 5,
                top: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
