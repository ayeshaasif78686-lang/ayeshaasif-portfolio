import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/satin_grid.dart';

class AmbientBackground extends StatefulWidget {
  const AmbientBackground({super.key});

  @override
  State<AmbientBackground> createState() => _AmbientBackgroundState();
}

class _AmbientBackgroundState extends State<AmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 18),
  )..repeat();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (reduce) {
      return const ColoredBox(color: Brand.ink, child: SatinGrid(t: 0));
    }
    return AnimatedBuilder(
      animation: c,
      builder: (_, __) => ColoredBox(
        color: Brand.ink,
        child: SatinGrid(t: c.value),
      ),
    );
  }
}

