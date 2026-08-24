import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/theme/app_theme.dart';
import '../../core/widgets/orbit_chip.dart';

class OrbitalAvatar extends StatefulWidget {
  const OrbitalAvatar({super.key});

  @override
  State<OrbitalAvatar> createState() => _OrbitalAvatarState();
}

class _OrbitalAvatarState extends State<OrbitalAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 14),
  )..repeat();

  final chips = const [
    ('AI / ML', Icons.psychology_alt_outlined),
    ('DATA', Icons.query_stats_rounded),
    ('FLUTTER', Icons.phone_iphone_rounded),
    ('WEB', Icons.language_rounded),
  ];

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 820;
    final size = mobile ? 385.0 : 500.0;
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    Widget scene(double t) {
      final wave = math.sin(t * math.pi * 2);
      final avatarTilt = reduce ? 0.0 : math.sin(t * math.pi * 2) * .045;
      return SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size * .73,
              height: size * .73,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Brand.ink,
                boxShadow: [
                  BoxShadow(color: Brand.rose.withOpacity(.17), blurRadius: 70, spreadRadius: 4),
                ],
              ),
            ),
            ...[.86, .74, .62].asMap().entries.map((entry) {
              final i = entry.key;
              final f = entry.value;
              return Transform.rotate(
                angle: (i.isEven ? 1 : -1) * t * math.pi * 2 * (.07 + i * .025),
                child: Container(
                  width: size * f,
                  height: size * f,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: i == 0 ? Brand.rose.withOpacity(.43) : Brand.roseSoft.withOpacity(.22),
                      width: i == 0 ? 1.5 : .8,
                    ),
                  ),
                ),
              );
            }),
            Transform.translate(
              offset: Offset(0, reduce ? 0 : wave * 8),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, .0015)
                  ..rotateY(avatarTilt)
                  ..rotateX(-avatarTilt * .35),
                child: Container(
                  width: size * .50,
                  height: size * .68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size * .09),
                    border: Border.all(color: Brand.rose.withOpacity(.65), width: 2),
                    boxShadow: [
                      BoxShadow(color: Brand.rose.withOpacity(.18), blurRadius: 34, spreadRadius: 3),
                      BoxShadow(color: Colors.black.withOpacity(.55), blurRadius: 32, offset: const Offset(0, 20)),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size * .085),
                    child: Image.asset(
                      'lib/assets/images/hero_avatar.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
            ...List.generate(chips.length, (i) {
              final angle = (i / chips.length) * math.pi * 2 + t * math.pi * 2 * .12;
              final radius = size * .42;
              return Transform.translate(
                offset: Offset(math.cos(angle) * radius, math.sin(angle) * radius * .72),
                child: OrbitChip(label: chips[i].$1, icon: chips[i].$2),
              );
            }),
            ...List.generate(8, (i) {
              final angle = (i / 8) * math.pi * 2 - t * math.pi * 2 * .16;
              final radius = size * (.34 + (i % 2) * .07);
              return Transform.translate(
                offset: Offset(math.cos(angle) * radius, math.sin(angle) * radius * .68),
                child: Container(
                  width: i % 3 == 0 ? 9 : 6,
                  height: i % 3 == 0 ? 9 : 6,
                  decoration: BoxDecoration(
                    color: i.isEven ? Brand.rose : Brand.roseSoft,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Brand.rose.withOpacity(.45), blurRadius: 12)],
                  ),
                ),
              );
            }),
          ],
        ),
      );
    }

    if (reduce) return Center(child: scene(0));
    return AnimatedBuilder(animation: c, builder: (_, __) => Center(child: scene(c.value)));
  }
}

