import 'dart:math';

import 'package:flutter/material.dart';

class BlossomPainter extends CustomPainter {
  double dx = 0.0; // 좌우로 이동할 거리
  double dy = 0.0;
  BlossomPainter({this.dx = 0.0, this.dy = 0.0}); // 생성자

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink.shade300
      ..style = PaintingStyle.fill;

    final path = Path();
    final x = size.width / 2 + dx; // x좌표에 dx를 더해 좌우로 이동
    final y = size.height / 2 + dy;
    path.moveTo(x, y);
    path.quadraticBezierTo(x + 10, y + 10, x + 20, y - 10);
    path.quadraticBezierTo(x + 30, y - 10, x + 20, y + 20);
    path.quadraticBezierTo(x + 10, y + 30, x, y + 20);
    path.quadraticBezierTo(x - 10, y, x, y - 10);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MoveBlossom3 extends StatefulWidget {
  const MoveBlossom3({Key? key}) : super(key: key);

  @override
  BlossomWidgetState createState() => BlossomWidgetState();
}

class BlossomWidgetState extends State<MoveBlossom3> {
  double dx = 0.0;
  double dy = 0.0;
  double v = 0.8;
  final random = Random();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.blue,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.green,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.brown[700],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  if (dx >= screenWidth - 200 || dx <= -200) v *= -1;
                  dx += v * details.delta.dy;
                  dy = details.delta.dy;
                  dx = dx.clamp(-200, screenWidth - 200);
                });
                if (_scrollController.offset - dy > 0 &&
                    _scrollController.offset - dy <
                        _scrollController.position.maxScrollExtent) {
                  var position = _scrollController.offset / screenHeight;
                  //791
                  if (dy < 0) {
                    _scrollController.animateTo(screenHeight * (position + 1),
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn);
                  } else {
                    _scrollController.animateTo(screenHeight * (position - 1),
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn);
                  }
                }
              },
              child: CustomPaint(
                painter: BlossomPainter(dx: dx, dy: dy),
                size: const Size(100, 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
