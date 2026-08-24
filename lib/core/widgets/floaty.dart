import 'package:flutter/material.dart';

class Floaty extends StatefulWidget {
  final Widget child;
  final double distance;
  final Duration duration;

  const Floaty({
    super.key,
    required this.child,
    this.distance = 8,
    this.duration = const Duration(milliseconds: 3800),
  });

  @override
  State<Floaty> createState() => _FloatyState();
}

class _FloatyState extends State<Floaty>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: widget.duration)
        ..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (reduce) return widget.child;
    return AnimatedBuilder(
      animation: _c,
      child: widget.child,
      builder: (_, child) {
        final t = Curves.easeInOut.transform(_c.value);
        return Transform.translate(
          offset: Offset(0, (t - .5) * 2 * widget.distance),
          child: child,
        );
      },
    );
  }
}

