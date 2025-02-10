import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_check_list/check_list_view.dart';
import 'package:flutter/material.dart';

class HomeTabTabBar extends StatefulWidget {
  @override
  State<HomeTabTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> tabs = <Tab>[
    Tab(text: '매니저'),
    Tab(text: '주방'),
    Tab(text: '샌드위치'),
    Tab(text: '홀'),
    Tab(text: '파트 1'),
    Tab(text: '파트 2'),
    Tab(text: '파트 3'),
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
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '오늘의 체크리스트',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                print('탭 관리');
              },
              icon: Icon(Icons.pending_outlined),
            ),
          ],
        ),
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
                  return CheckListView();
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
