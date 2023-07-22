import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final Color color;

  CurvePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height / 20, size.width, 0);
    path.quadraticBezierTo(size.width / 2, -size.height / 20, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
