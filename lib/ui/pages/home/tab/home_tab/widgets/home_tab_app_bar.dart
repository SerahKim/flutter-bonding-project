import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_search_page.dart';
import 'package:flutter/material.dart';

class HomeTabAppBar extends StatefulWidget {
  @override
  State<HomeTabAppBar> createState() => _HomeTabAppBarState();
}

class _HomeTabAppBarState extends State<HomeTabAppBar> {
  int notificationCount = 3; // 예제 알림 개수
  String selectedStore = '뚜레쥬르 강남역점'; // 선택된 매장

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SizedBox(width: 10),
          // 매장 선택 드롭다운
          PopupMenuButton<String>(
            onSelected: (String store) {
              setState(() {
                selectedStore = store;
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: '뚜레쥬르 강남역점', child: Text('뚜레쥬르 강남역점')),
              PopupMenuItem(value: '스타벅스 강남점', child: Text('스타벅스 강남점')),
              PopupMenuItem(value: '이디야 강남점', child: Text('이디야 강남점')),
            ],
            child: Row(
              children: [
                Text(
                  selectedStore,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // 검색 버튼 (검색 화면으로 이동)
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          icon: Icon(Icons.search),
        ),
        // 알림 아이콘
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
                  constraints: BoxConstraints(minWidth: 18, minHeight: 18),
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
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
