import 'package:flutter/material.dart';

class NoteTabAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _NoteTabAppBarState createState() => _NoteTabAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NoteTabAppBarState extends State<NoteTabAppBar> {
  TextEditingController searchController = TextEditingController();
  int notificationCount = 3; // 예제 알림 개수
  final FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose(); // FocusNode 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // 메뉴 버튼 액션 추가 가능
        },
      ),
      title: buildSearchBar(), // 검색창 UI
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

  /// 검색창 UI (검색 아이콘과 하나의 디자인)
  Widget buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // 반투명 배경
        borderRadius: BorderRadius.circular(10), // 둥근 모서리
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              style: TextStyle(color: Colors.black), // 글씨색 흰색
              decoration: InputDecoration(
                hintText: "검색",
                hintStyle: TextStyle(color: Colors.grey[700]),
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value) {
                print("검색어: $value");
              },
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.search, color: Colors.grey[700]), // 검색 아이콘
        ],
      ),
    );
  }
}
