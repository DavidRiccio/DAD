import 'dart:math' as math;
import 'package:flutter/material.dart';

enum HalfSide { left, right, top, bottom }

class HalfCircleBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final HalfSide side;

  HalfCircleBorderPainter({
    required this.color,
    required this.strokeWidth,
    this.side = HalfSide.right,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt; // <--- MODIFICADO (Era .round)

    final radius = (size.shortestSide / 2) - strokeWidth / 2;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    double startAngle;
    switch (side) {
      case HalfSide.right:
        startAngle = -math.pi / 2;
        break;
      case HalfSide.left:
        startAngle = math.pi / 2;
        break;
      case HalfSide.top:
        startAngle = math.pi;
        break;
      case HalfSide.bottom:
        startAngle = 0;
        break;
    }

    canvas.drawArc(rect, startAngle, math.pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}