import 'package:bonding/ui/widgets/state_ui.dart';
import 'package:flutter/material.dart';

class CheckListView extends StatefulWidget {
  @override
  _CheckListViewState createState() => _CheckListViewState();
}

class _CheckListViewState extends State<CheckListView> {
  // 체크 리스트 항목
  List<Map<String, dynamic>> tasks = [
    {'title': 'POS 접속하기', 'isChecked': false},
    {'title': '매장 온도 체크하기', 'isChecked': false},
    {'title': '조명 및 전원 켜기', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0.1,
                  blurRadius: 5,
                  offset: Offset(4, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Title
                Row(
                  children: [
                    Text(
                      '오픈 30분전 업무',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    // TODO : 체크된 task에 따라 상태 변경하기
                    StateUI(state: StateType.inProgress),
                  ],
                ),
                SizedBox(height: 5),
                // 체크 리스트
                Column(
                  children: _buildTaskList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  // 체크 리스트 UI 생성
  List<Widget> _buildTaskList() {
    // 완료된 항목은 아래로 정렬
    List<Map<String, dynamic>> sortedTasks = List.from(tasks);
    sortedTasks.sort((a, b) => a['isChecked'] ? 1 : -1);

    return sortedTasks.map((task) {
      return GestureDetector(
        onTap: () {
          print('업무 선택됨');
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              // 체크박스
              Checkbox(
                value: task['isChecked'],
                onChanged: (bool? value) {
                  setState(() {
                    task['isChecked'] = value!;
                  });
                },
                activeColor: const Color.fromARGB(255, 85, 81, 255),
              ),
              // 체크 시 흐리게 처리
              Expanded(
                child: Text(
                  task['title'],
                  style: TextStyle(
                    fontSize: 15,
                    color: task['isChecked'] ? Colors.grey : Colors.black,
                    decoration:
                        task['isChecked'] ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      );
    }).toList();
  }
}
