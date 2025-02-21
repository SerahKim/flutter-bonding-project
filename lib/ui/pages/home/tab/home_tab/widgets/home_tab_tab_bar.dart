import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_check_list/check_list_view.dart';

class HomeTabTabBar extends StatefulWidget {
  @override
  State<HomeTabTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  TextEditingController tabNameController = TextEditingController();

  List<Tab> tabs = <Tab>[
    Tab(text: '매니저'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    tabNameController.dispose();
    super.dispose();
  }

  // 바텀시트 표시
  void showBottomSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                print('탭 관리 선택됨');
                // TODO: 탭 관리 페이지 이동 또는 기능 추가
              },
              child: Text('탭 관리'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                showTabNameDialog();
              },
              child: Text('탭 추가'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('취소', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }

  // 탭 이름 입력 Dialog
  void showTabNameDialog() {
    tabNameController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('새 탭 추가'),
          content: TextField(
            controller: tabNameController,
            decoration: InputDecoration(hintText: '탭 이름 입력'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                addNewTab(tabNameController.text.trim());
              },
              child: Text('추가'),
            ),
          ],
        );
      },
    );
  }

  // 새로운 탭 추가
  void addNewTab(String tabName) {
    setState(() {
      String newTabName =
          tabName.isNotEmpty ? tabName : '새 탭 ${tabs.length + 1}';
      tabs.add(Tab(text: newTabName));

      tabController.dispose();
      tabController = TabController(vsync: this, length: tabs.length);
    });
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: showBottomSheet,
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
        SizedBox(
          height: 5000,
          child: TabBarView(
            controller: tabController,
            children: tabs.map((tab) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
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
