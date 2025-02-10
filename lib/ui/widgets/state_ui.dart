import 'package:flutter/material.dart';

// 상태 Enum 정의
enum StateType { notStarted, inProgress, completed }

class StateUI extends StatelessWidget {
  final StateType state; // 현재 상태

  StateUI({required this.state});

  @override
  Widget build(BuildContext context) {
    // 상태에 따른 UI 스타일 결정
    Map<StateType, Map<String, dynamic>> stateStyles = {
      StateType.notStarted: {
        'color': Colors.grey[300],
        'text': '시작 전',
        'textColor': Colors.black54
      },
      StateType.inProgress: {
        'color': Colors.blue[100],
        'text': '진행 중',
        'textColor': Colors.blue[900]
      },
      StateType.completed: {
        'color': Colors.green[100],
        'text': '완료',
        'textColor': Colors.green[900]
      },
    };

    return Container(
      decoration: BoxDecoration(
        color: stateStyles[state]!['color'],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        child: Text(
          stateStyles[state]!['text'],
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: stateStyles[state]!['textColor'],
          ),
        ),
      ),
    );
  }
}
