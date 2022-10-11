import 'package:flutter/material.dart';

class MarkCross extends StatelessWidget {
  final Color color;
  final double strokeWidth;

  const MarkCross({
    this.color = Colors.green,
    this.strokeWidth = 8,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CrossPainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const _CrossPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, 0),
      painter,
    );

    canvas.drawLine(
      Offset(size.width, size.height),
      const Offset(0, 0),
      painter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
