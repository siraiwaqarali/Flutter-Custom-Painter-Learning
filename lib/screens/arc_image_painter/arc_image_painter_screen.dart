import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class ArcImagePainterScreen extends StatefulWidget {
  const ArcImagePainterScreen({super.key});

  @override
  State<ArcImagePainterScreen> createState() => _ArcImagePainterScreenState();
}

class _ArcImagePainterScreenState extends State<ArcImagePainterScreen> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage('assets/images/image.jpg');
  }

  Future<void> loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Image image = await decodeImageFromList(bytes);

    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: image == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
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
                          painter: ArcPainter(),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 300,
                        height: 300,
                        child: FittedBox(
                          child: SizedBox(
                            width: image!.width.toDouble(),
                            height: image!.height.toDouble(),
                            child: CustomPaint(
                              painter: ImagePainter(image!),
                            ),
                          ),
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

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke;

    final Path arc1 = Path();
    arc1.moveTo(size.width * 0.2, size.height * 0.2);
    arc1.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.2),
      radius: const Radius.circular(150),
      clockwise: false,
    );

    final Path arc2 = Path();
    arc2.moveTo(size.width * 0.2, size.height * 0.8);
    arc2.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.8),
      radius: const Radius.circular(150),
    );

    canvas.drawPath(arc1, paint);
    canvas.drawPath(arc2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ImagePainter extends CustomPainter {
  final ui.Image image;

  ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    canvas.drawImage(image, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
