import 'package:flutter/material.dart';

class NavbarContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Start at the left side
    path.moveTo(0, size.height / 2);

    // Draw the left circle arc
    path.arcToPoint(
      Offset(0, size.height / 2),
      radius: Radius.circular(size.height / 2),
      clockwise: false,
    );

    // Draw the top straight line
    path.lineTo(size.width - size.height / 2, 0);

    // Draw the right circle arc
    path.arcToPoint(
      Offset(size.width, size.height / 2),
      radius: Radius.circular(size.height / 2),
      clockwise: true,
    );

    // Draw the bottom straight line
    path.lineTo(size.height / 2, size.height);

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
