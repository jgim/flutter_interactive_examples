import 'package:flutter/material.dart';

class BlossomPainter extends CustomPainter with ChangeNotifier {
  Animation<double>? _blossomAnim;
  late AnimationController _animationController;

  void setAnimationController(AnimationController controller) {
    _animationController = controller;
    _blossomAnim = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        notifyListeners();
      });
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink.shade300.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path = Path();
    final x = size.width / 2;
    final y = size.height / 2;
    final xOffset = x + (_animationController.value * 20);

    path.moveTo(xOffset, y);
    path.quadraticBezierTo(
      xOffset + 10 + _blossomAnim!.value,
      y + 10 + _blossomAnim!.value,
      xOffset + 20,
      y - 10,
    );
    path.quadraticBezierTo(
      xOffset + 30 + _blossomAnim!.value,
      y - 10 - _blossomAnim!.value,
      xOffset + 20,
      y + 20,
    );
    path.quadraticBezierTo(
      xOffset + 10 - _blossomAnim!.value,
      y + 30 + _blossomAnim!.value,
      xOffset,
      y + 20,
    );
    path.quadraticBezierTo(
      xOffset - 10 - _blossomAnim!.value,
      y - 10 - _blossomAnim!.value,
      xOffset,
      y - 10,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
