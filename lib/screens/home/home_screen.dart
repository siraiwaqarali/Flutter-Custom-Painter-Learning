import 'package:custompainterlearning/screens/arc_image_painter/arc_image_painter_screen.dart';
import 'package:custompainterlearning/screens/background_painter/background_painter_screen.dart';
import 'package:custompainterlearning/screens/circle_triangle_painter/circle_triangle_painter_screen.dart';
import 'package:custompainterlearning/screens/line_square_rect_painter/line_square_rect_painter_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const LineSquareRectPainterScreen(),
                      ),
                    ),
                    child: const Text('Line Square and Rect Painter'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CircleTriangleScreen(),
                      ),
                    ),
                    child: const Text('Circle and Triangle Painter'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ArcImagePainterScreen(),
                      ),
                    ),
                    child: const Text('Arc and Image Painter'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BackgroundPainerScreen(),
                      ),
                    ),
                    child: const Text('Background Painter'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
