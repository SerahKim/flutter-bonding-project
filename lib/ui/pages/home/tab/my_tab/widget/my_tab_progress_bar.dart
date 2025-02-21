import 'package:bonding/ui/pages/%08home/tab/my_tab/widget/my_tab_progress_painter.dart';
import 'package:flutter/material.dart';

class MyTabProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '이번 주 업무 달성률',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 13),
            Row(
              children: [
                CustomPaint(
                  painter: MyTabProgressPainter(percentage: 0.8), // 80%
                  size: Size(100, 100),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '완료한 업무: 32/40 항목',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '남은 업무: 8 항목',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
