import 'package:flutter/material.dart';

class BlossomPainter extends CustomPainter with ChangeNotifier {
  double _animationValue = 0.0;

  void setAnimationValue(double value) {
    _animationValue = value;
    notifyListeners();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink.shade300
      ..style = PaintingStyle.fill;

    final path = Path();
    final x = size.width / 2;
    final y = size.height / 2;
    final xOffset = x + (_animationValue * 20);
    path.moveTo(xOffset, y);
    path.quadraticBezierTo(xOffset + 10, y + 10, xOffset + 20, y - 10);
    path.quadraticBezierTo(xOffset + 30, y - 10, xOffset + 20, y + 20);
    path.quadraticBezierTo(xOffset + 10, y + 30, xOffset, y + 20);
    path.quadraticBezierTo(xOffset - 10, y, xOffset, y - 10);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MoveBlossom2 extends StatefulWidget {
  @override
  _BlossomWidgetState createState() => _BlossomWidgetState();
}

class _BlossomWidgetState extends State<MoveBlossom2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _blossomPainter = BlossomPainter();

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _controller.addListener(() {
      _blossomPainter.setAnimationValue(_controller.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: _blossomPainter,
          size: Size(100, 100),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
