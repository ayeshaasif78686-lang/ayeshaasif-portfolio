import 'package:flutter/material.dart';

class ResponsiveExpanded extends StatelessWidget {
  final bool expand;
  final int flex;
  final Widget child;

  const ResponsiveExpanded({
    super.key,
    required this.expand,
    required this.child,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return expand ? Expanded(flex: flex, child: child) : child;
  }
}

class SiteWidth extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const SiteWidth({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 1240),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 26),
        child: child,
      ),
    );
  }
}

