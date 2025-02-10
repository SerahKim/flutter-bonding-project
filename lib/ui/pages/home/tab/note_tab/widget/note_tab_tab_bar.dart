import 'package:bonding/ui/pages/%08home/tab/note_tab/widget/note_tab_note_list/note_list_view.dart';
import 'package:flutter/material.dart';

class NoteTabTabBar extends StatefulWidget {
  @override
  State<NoteTabTabBar> createState() => _NoteTabTabBarState();
}

class _NoteTabTabBarState extends State<NoteTabTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> tabs = <Tab>[
    Tab(text: '공지사항'),
    Tab(text: '샌드위치 레시피'),
    Tab(text: '음료 레시피'),
    Tab(text: '조리빵 레시피'),
    Tab(text: '발주'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        // TabBar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15.0),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 13.0),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabs: tabs,
          ),
        ),
        // TabBarView를 SizedBox로 감싸 높이를 제한
        // TODO : SizedBox의 높이가 체크리스트 개수와 높이에 따라 변화할 수 있음.
        SizedBox(
          height: 5000,
          child: TabBarView(
            controller: tabController,
            children: tabs.map((tab) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(), // 내부 스크롤 방지
                shrinkWrap: true,
                itemCount: 20, // 예제 데이터
                itemBuilder: (context, index) {
                  return NoteListView();
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
