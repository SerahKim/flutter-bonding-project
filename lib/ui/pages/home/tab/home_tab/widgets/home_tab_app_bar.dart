import 'package:flutter/material.dart';

class HomeTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            //프로필
            CircleAvatar(
              backgroundColor: Colors.orange[800],
              child: Text(
                '시은',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10),
            // 날짜 선택
            Text(
              '2025 1월 13일(월)',
              style: TextStyle(fontSize: 20),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      actions: [
        // 검색
        IconButton(
          onPressed: () {
            print('검색 버튼 선택됨');
          },
          icon: Icon(Icons.search),
        ),
        // 알림
        IconButton(
          onPressed: () {
            print('알림 버튼 선택됨');
          },
          icon: Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}
