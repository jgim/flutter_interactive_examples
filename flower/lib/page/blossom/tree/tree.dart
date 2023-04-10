import 'dart:math';

import 'package:flutter/material.dart';

class TreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 10.0;

    final double startX = size.width - 50.0;
    final double startY = size.height - 50.0;
    final double height = 250.0;

    // 나무의 기둥 그리기
    canvas.drawLine(
      Offset(startX, startY),
      Offset(startX, startY - height),
      paint,
    );

    // 가지 그리기
    paint.color = Colors.green;
    _drawBranch(canvas, startX, startY - height, -1.0, paint, height * 0.4);
    _drawBranch(canvas, startX, startY - height, 1.0, paint, height * 0.3);
  }

  // 재귀적으로 가지를 그리는 메소드
  void _drawBranch(Canvas canvas, double x, double y, double direction,
      Paint paint, double length) {
    if (length < 10) return;

    final angle = direction * 0.5;
    final endX = x + length * direction * cos(angle);
    final endY = y - length * sin(angle);
    canvas.drawLine(
      Offset(x, y),
      Offset(endX, endY),
      paint,
    );
    _drawBranch(canvas, endX, endY, direction - 0.4, paint, length * 0.7);
    _drawBranch(canvas, endX, endY, direction + 0.4, paint, length * 0.7);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyTreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: TreePainter(),
        ),
      ),
    );
  }
}
