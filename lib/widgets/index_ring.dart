import 'dart:math';
import 'package:flutter/material.dart';

class IndexRing extends StatelessWidget {
  final int value; // 0–100

  const IndexRing({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final progress = value.clamp(0, 100) / 100;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, animatedProgress, _) {
        return SizedBox(
          width: 180,
          height: 180,
          child: CustomPaint(
            painter: _RingPainter(
              progress: animatedProgress,
              color: _colorForValue(value),
            ),
            child: Center(
              child: Text(
                "$value",
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _colorForValue(int v) {
    if (v >= 75) return const Color(0xFF34C759); // Apple green
    if (v >= 50) return const Color(0xFFFFCC00); // Apple yellow
    return const Color(0xFFFF3B30); // Apple red
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _RingPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 10;

    final bgPaint = Paint()
      ..color = Colors.white10
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    final fgPaint = Paint()
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        startAngle: -pi / 2,
        endAngle: 3 * pi / 2,
        colors: [
          color.withOpacity(0.6),
          color,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, bgPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color;
  }
}
