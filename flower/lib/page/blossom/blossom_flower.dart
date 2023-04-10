import 'package:flutter/material.dart';

class BlossomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink.shade300
      ..style = PaintingStyle.fill;

    final path = Path();
    final x = size.width / 2;
    final y = size.height / 2;
    path.moveTo(x, y);
    path.quadraticBezierTo(x + 10, y + 10, x + 20, y - 10);
    path.quadraticBezierTo(x + 30, y - 10, x + 20, y + 20);
    path.quadraticBezierTo(x + 10, y + 30, x, y + 20);
    path.quadraticBezierTo(x - 10, y, x, y - 10);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BlossomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BlossomPainter(),
      size: Size(100, 100),
    );
  }
}
