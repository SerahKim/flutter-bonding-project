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
            SizedBox(width: 10),
            // 날짜 선택
            GestureDetector(
              onTap: () {
                print('매장 선택됨');
              },
              child: Text(
                '뚜레쥬르 강남역점',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
