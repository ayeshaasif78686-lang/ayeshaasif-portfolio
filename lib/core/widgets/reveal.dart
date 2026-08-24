import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Reveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset from;
  final double startScale;
  final double startRotation;
  final double startTiltX;
  final Duration duration;
  final Curve curve;

  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.from = const Offset(0, 46),
    this.startScale = .94,
    this.startRotation = 0,
    this.startTiltX = 0,
    this.duration = const Duration(milliseconds: 900),
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  bool _show = false;
  bool _fired = false;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (_fired || info.visibleFraction < .08) return;
        _fired = true;
        if (reduce) {
          if (mounted) setState(() => _show = true);
          return;
        }
        Future.delayed(widget.delay, () {
          if (mounted) setState(() => _show = true);
        });
      },
      child: AnimatedOpacity(
        opacity: _show ? 1 : 0,
        duration: reduce ? Duration.zero : widget.duration,
        curve: widget.curve,
        child: AnimatedContainer(
          duration: reduce ? Duration.zero : widget.duration,
          curve: widget.curve,
          transformAlignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, .0011)
            ..translate(_show ? 0.0 : widget.from.dx,
                _show ? 0.0 : widget.from.dy)
            ..rotateX(_show ? 0.0 : widget.startTiltX)
            ..rotateZ(_show ? 0.0 : widget.startRotation)
            ..scale(_show ? 1.0 : widget.startScale),
          child: widget.child,
        ),
      ),
    );
  }
}

/// A soft, continuously-sweeping gradient shimmer used to give the hero
/// headline's accent phrase a subtle "premium" polish once it has revealed.
