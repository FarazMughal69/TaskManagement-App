import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final bool isSelected;

  MyPainter({
    required this.isSelected,
  });
  final double outerRadius = 10;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.14),
      Offset(size.width * 0.1, size.height * 1),
      paint,
    );
    Offset circleOffset = Offset(size.width * 0.1, size.height * 0.06);
    canvas.drawCircle(circleOffset, outerRadius, paint);
    if (isSelected) {
      final Paint innerCirclePaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill;
      final double innerRadius = outerRadius * 0.8;
      canvas.drawCircle(circleOffset, innerRadius, innerCirclePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
