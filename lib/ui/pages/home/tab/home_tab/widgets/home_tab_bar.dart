import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_list_view.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatefulWidget {
  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> tabs = <Tab>[
    Tab(text: '공지사항'),
    Tab(text: '업무 체크리스트'),
    Tab(text: '매니저'),
    Tab(text: '주방'),
    Tab(text: '샌드위치'),
    Tab(text: '홀'),
  ];

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
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 13),
              // 팀 이름
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    print('팀 이름 선택됨');
                  },
                  child: Text(
                    '뚜레쥬르 강남역점',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              // 탭 추가 다이얼로그 호출
              // IconButton(
              //   icon: Icon(Icons.add),
              //   onPressed: showAddTabDialog,
              // ),
              IconButton(
                onPressed: () {
                  print('탭관리 버튼 선택됨');
                },
                icon: Icon(Icons.more_horiz_rounded),
              ),
            ],
          ),
          // TabBar
          TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.blueAccent, // 선택된 탭의 배경색
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.white,
            dividerColor: Colors.grey,
            tabs: tabs,
            isScrollable: true,
            padding: EdgeInsets.zero,
          ),
          // TapBarView
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, bottom: 20, right: 10),
              child: TabBarView(
                controller: tabController,
                children: tabs.map((tab) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          // 탭 이름
                          Text(
                            '${tab.text} ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              print('필터링');
                            },
                            icon: Icon(Icons.filter_list),
                          ),
                          IconButton(
                            onPressed: () {
                              print('글 추가 버튼 선택됨');
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      HomeTabListView(),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
