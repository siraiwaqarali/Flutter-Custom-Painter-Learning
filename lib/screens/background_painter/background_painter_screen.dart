import 'package:flutter/material.dart';

class BackgroundPainerScreen extends StatelessWidget {
  const BackgroundPainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[800],
        child: CustomPaint(
          painter: BackgroundPainter(),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white.withOpacity(0.1);

    final Path path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(size.width * 0.2, 0);
    path1.lineTo(0, size.height * 0.4);
    path1.close();

    final Path path2 = Path();
    path2.moveTo(size.width, 0);
    path2.lineTo(size.width * 0.8, 0);
    path2.lineTo(size.width * 0.2, size.height);
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
