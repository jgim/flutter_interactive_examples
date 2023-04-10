import 'package:flutter/material.dart';
import 'dart:math';

class TreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final trunkPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = size.width / 30; // 화면의 10분의 3에서 시작해서 10분의 1이 되도록 두께를 줄임

    final double startX = size.width / 2;
    final double startY = size.height;
    final double height = size.height * 0.8;

    canvas.drawLine(
      Offset(startX, startY),
      Offset(startX, startY - height),
      trunkPaint,
    );

    _drawBranch(
        canvas, startX, startY - height, -1.0, trunkPaint, height * 0.4, 0);
    _drawBranch(
        canvas, startX, startY - height, 1.0, trunkPaint, height * 0.3, 0);
  }

  void _drawBranch(Canvas canvas, double x, double y, double direction,
      Paint paint, double length, int depth) {
    if (depth > 7) return;

    final angle = direction * 0.5;
    final endX = x + length * direction * cos(angle);
    final endY = y - length * sin(angle);
    canvas.drawLine(
      Offset(x, y),
      Offset(endX, endY),
      paint,
    );

    final nextDirection = direction + (Random().nextDouble() - 0.5) * 0.5;
    final nextLength = length * (0.6 + Random().nextDouble() * 0.4);
    final nextDepth = depth + 1;

    _drawBranch(
        canvas, endX, endY, nextDirection, paint, nextLength, nextDepth);
    _drawBranch(
        canvas, endX, endY, nextDirection, paint, nextLength, nextDepth);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyTreePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF9BCFB8), Color(0xFF55828B)],
          ),
        ),
        child: CustomPaint(
          painter: TreePainter(),
        ),
      ),
    );
  }
}
