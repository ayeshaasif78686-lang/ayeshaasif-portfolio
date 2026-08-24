import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/gestures.dart';

class TiltCard extends StatefulWidget {
  final Widget child;
  final double maxTilt;
  final double hoverScale;

  const TiltCard({
    super.key,
    required this.child,
    this.maxTilt = 5.5,
    this.hoverScale = 1.015,
  });

  @override
  State<TiltCard> createState() => _TiltCardState();
}

class _TiltCardState extends State<TiltCard> {
  double rx = 0;
  double ry = 0;
  bool hover = false;

  void _move(PointerEvent e) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final p = box.globalToLocal(e.position);
    final x = (p.dx / box.size.width - .5) * 2;
    final y = (p.dy / box.size.height - .5) * 2;
    final max = widget.maxTilt * math.pi / 180;
    setState(() {
      ry = x * max;
      rx = -y * max;
      hover = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return MouseRegion(
      onHover: reduce ? null : _move,
      onExit: (_) => setState(() {
        rx = 0;
        ry = 0;
        hover = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, .0012)
          ..rotateX(rx)
          ..rotateY(ry)
          ..scale(hover && !reduce ? widget.hoverScale : 1),
        child: widget.child,
      ),
    );
  }
}

