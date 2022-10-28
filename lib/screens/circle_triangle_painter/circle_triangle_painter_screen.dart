import 'package:flutter/material.dart';

class CircleTriangleScreen extends StatelessWidget {
  const CircleTriangleScreen({super.key});

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
                    painter: CirclePainter(),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: TrianglePainter(),
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

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 1 / 4,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.moveTo(size.width * 1 / 2, size.height * 1 / 4);
    path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
