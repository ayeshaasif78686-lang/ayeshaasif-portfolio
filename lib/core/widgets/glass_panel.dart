import 'package:flutter/material.dart';
import 'dart:ui';
import '../../core/theme/app_theme.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Color? color;
  const GlassPanel({
    super.key,
    required this.child,
    this.radius = 22,
    this.padding = const EdgeInsets.all(20),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? Brand.surface(.72),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Brand.roseSoft.withOpacity(.12)),
          ),
          child: child,
        ),
      ),
    );
  }
}

