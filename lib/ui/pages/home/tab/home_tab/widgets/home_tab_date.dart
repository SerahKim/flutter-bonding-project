import 'package:flutter/material.dart';

class HomeTabDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Text(
                '2025년 1월 24일',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    print('날짜 선택됨');
                  },
                  icon: Icon(Icons.calendar_month))
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
