import 'package:flutter/material.dart';

class MoveBlossom extends StatefulWidget {
  const MoveBlossom({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MoveBlossom>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (ScrollNotification? notification) {
          if (notification != null) {
            setState(() {
              _offset = notification.metrics.pixels / 2;
            });
            return true;
          }
          return false;
        },
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(_offset, 0),
                  child: CustomPaint(
                    size: const Size(40, 40),
                    painter: _CherryBlossomPainter(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CherryBlossomPainter extends CustomPainter {
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
  bool shouldRepaint(_CherryBlossomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CherryBlossomPainter oldDelegate) => false;
}
