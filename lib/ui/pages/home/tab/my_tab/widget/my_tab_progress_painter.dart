import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyTabProgressPainter extends CustomPainter {
  final double percentage;

  MyTabProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 10;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // 배경 원
    final bgPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    // 진행률 원
    final progressPaint = Paint()
      ..color = const Color.fromARGB(255, 85, 81, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double progressAngle = 2 * math.pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // 시작 각도
      progressAngle,
      false,
      progressPaint,
    );

    // 퍼센트 텍스트
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(percentage * 100).toInt()}%',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(center.dx - textPainter.width / 2,
            center.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
