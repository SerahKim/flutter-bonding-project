import 'package:bonding/ui/pages/%08home/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Untitled 1'),
    Tab(text: 'Untitled 2'),
    Tab(text: 'Untitled 2'),
    Tab(text: 'Untitled 2'),
    Tab(text: 'Untitled 2'),
    Tab(text: 'Untitled 2'),
    Tab(text: 'Untitled 2'),
  ];

  final BottomBar bottomBar = BottomBar();

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

  // 탭 추가 메서드
  void addTab(String name) {
    setState(() {
      tabController.dispose(); // 기존 컨트롤러 해제
      tabs.add(Tab(text: name));
      tabController = TabController(
        vsync: this,
        length: tabs.length,
        initialIndex: tabs.length - 1,
      );
    });
  }

  // 탭 이름 변경 메서드
  void showRenameDialog(int index) {
    final TextEditingController textController = TextEditingController(
      text: tabs[index].text,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('탭 이름 변경'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: InputDecoration(hintText: '새로운 이름을 입력하세요'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                tabs[index] = Tab(text: textController.text);
              });
              Navigator.pop(context);
            },
            child: Text('확인'),
          ),
        ],
      ),
    );
  }

  // 탭 추가 다이얼로그
  void showAddTabDialog() {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('새로운 탭 추가'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: InputDecoration(hintText: '탭 이름을 입력하세요'),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              addTab(value);
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          TextButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                addTab(textController.text);
              }
              Navigator.pop(context);
            },
            child: Text('추가'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
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
                              print('글 추가 버튼 선택됨');
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
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
