import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ShimmerText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration delay;
  const ShimmerText({super.key, required this.text, required this.style, this.delay = Duration.zero});

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText> with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2600),
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) c.repeat();
    });
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (reduce) return Text(widget.text, style: widget.style);
    return AnimatedBuilder(
      animation: c,
      builder: (context, child) {
        final t = c.value;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            final dx = bounds.width * 1.6;
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.style.color ?? Brand.rose,
                Brand.roseSoft,
                Brand.cream,
                Brand.roseSoft,
                widget.style.color ?? Brand.rose,
              ],
              stops: const [0, .35, .5, .65, 1],
              transform: _SlideGradient(dx * t - dx / 2),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: Text(widget.text, style: widget.style),
    );
  }
}

class _SlideGradient extends GradientTransform {
  final double dx;
  const _SlideGradient(this.dx);
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) => Matrix4.translationValues(dx, 0, 0);
}

