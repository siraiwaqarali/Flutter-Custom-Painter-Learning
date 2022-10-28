import 'package:flutter/material.dart';

class LineSquareRectPainterScreen extends StatelessWidget {
  const LineSquareRectPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: LinePainter(),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: RectanglePainter(),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: RoundedRectanglePainter(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width * 1 / 6, size.height * 1 / 2), // starting point
      Offset(size.width * 5 / 6, size.height * 1 / 2), // ending point
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromPoints(
      Offset(size.width * 1 / 4, size.height * 1 / 4), // top left vcorner
      Offset(size.width * 3 / 4, size.height * 3 / 4), // bottom right corner
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromPoints(
      Offset(size.width * 1 / 4, size.height * 1 / 4), // top left vcorner
      Offset(size.width * 3 / 4, size.height * 3 / 4), // bottom right corner
    );

    final RRect rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(20),
    );

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
