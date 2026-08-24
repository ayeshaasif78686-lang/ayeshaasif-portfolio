import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/theme/app_theme.dart';

class SatinGrid extends StatelessWidget {
  final double t;
  const SatinGrid({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: SatinPainter(t));
  }
}

class SatinPainter extends CustomPainter {
  final double t;
  SatinPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Brand.ink, Color(0xFF0A0709), Brand.ink],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, bg);

    final grid = Paint()
      ..color = Colors.white.withOpacity(.025)
      ..strokeWidth = .55;
    const step = 58.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    final blobs = [
      Offset(size.width * (.14 + .025 * math.sin(t * math.pi * 2)),
          size.height * .18),
      Offset(size.width * .86,
          size.height * (.39 + .04 * math.cos(t * math.pi * 2))),
      Offset(size.width * (.46 + .025 * math.cos(t * math.pi * 2)),
          size.height * .78),
    ];
    final radii = [260.0, 300.0, 220.0];
    final colors = [Brand.burgundy, Brand.plum, Brand.rose];
    for (var i = 0; i < blobs.length; i++) {
      final p = Paint()
        ..shader = RadialGradient(
          colors: [colors[i].withOpacity(.12), Colors.transparent],
        ).createShader(Rect.fromCircle(center: blobs[i], radius: radii[i]));
      canvas.drawCircle(blobs[i], radii[i], p);
    }
  }

  @override
  bool shouldRepaint(covariant SatinPainter oldDelegate) => oldDelegate.t != t;
}

