import 'package:flower/page/blossom/painter.dart';
import 'package:flutter/material.dart';

class MoveBlossom4 extends StatefulWidget {
  const MoveBlossom4({Key? key}) : super(key: key);

  @override
  BlossomWidgetState createState() => BlossomWidgetState();
}

class BlossomWidgetState extends State<MoveBlossom4>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _blossomPainter = BlossomPainter();

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _blossomPainter.setAnimationController(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: _blossomPainter,
          size: const Size(200, 200),
        );
      },
    );
  }
}
