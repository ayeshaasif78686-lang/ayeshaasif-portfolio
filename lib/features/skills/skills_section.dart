import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/theme/app_theme.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../features/skills/models/skill_brand.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static final skills = <SkillBrand>[
    const SkillBrand('HTML5', SimpleIcons.html5, 'WEB', Color(0xFFE34F26)),
    const SkillBrand('CSS', SimpleIcons.css, 'WEB', Color(0xFF1572B6)),
    const SkillBrand('React', SimpleIcons.react, 'WEB', Color(0xFF61DAFB)),
    const SkillBrand('Node.js', SimpleIcons.nodedotjs, 'WEB', Color(0xFF5FA04E)),
    const SkillBrand('Python', SimpleIcons.python, 'DATA / AI', Color(0xFF3776AB)),
    const SkillBrand('MongoDB', SimpleIcons.mongodb, 'DATABASE', Color(0xFF47A248)),
    const SkillBrand('GitHub', SimpleIcons.github, 'TOOLS', Color(0xFFF2F2F2)),
    const SkillBrand('Tailwind CSS', SimpleIcons.tailwindcss, 'WEB', Color(0xFF06B6D4)),
    const SkillBrand('Firebase', SimpleIcons.firebase, 'BACKEND', Color(0xFFFFCA28)),
    const SkillBrand('Figma', SimpleIcons.figma, 'DESIGN', Color(0xFFF24E1E)),
    const SkillBrand('Docker', SimpleIcons.docker, 'DEVOPS', Color(0xFF2496ED)),
    const SkillBrand('Flutter', SimpleIcons.flutter, 'MOBILE', Color(0xFF54C5F8)),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = width < 780;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 108),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF210913), Color(0xFF0B070C), Brand.ink],
          stops: [0, .44, 1],
        ),
      ),
      child: SiteWidth(
        child: Column(
          children: [
            Reveal(
              from: const Offset(0, 55),
              startScale: .82,
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.cormorantGaramond(
                        color: Brand.cream,
                        fontSize: mobile ? 52 : 68,
                        height: .9,
                        fontWeight: FontWeight.w700,
                      ),
                      children: const [
                        TextSpan(text: 'MY '),
                        TextSpan(text: 'SKILLS', style: TextStyle(color: Brand.roseSoft)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Technologies I work with to create impactful and beautiful solutions.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(color: Brand.muted, fontSize: 14, height: 1.65),
                  ),
                ],
              ),
            ),
            SizedBox(height: mobile ? 34 : 18),
            mobile ? _MobileSkillGrid(skills: skills) : _DesktopSkillUniverse(skills: skills),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: Reveal(
                delay: const Duration(milliseconds: 1050),
                from: const Offset(38, 0),
                startScale: .80,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: Brand.ink.withOpacity(.78),
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(color: Brand.rose.withOpacity(.28)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('VIEW EXPERIENCE', style: GoogleFonts.spaceMono(color: Brand.cream, fontSize: 9.5, letterSpacing: 1.15)),
                      const SizedBox(width: 9),
                      const Icon(Icons.arrow_forward_rounded, color: Brand.rose, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopSkillUniverse extends StatelessWidget {
  final List<SkillBrand> skills;
  const _DesktopSkillUniverse({required this.skills});

  static const positions = <Offset>[
    Offset(.12, .09), Offset(.34, .05), Offset(.57, .10), Offset(.79, .06),
    Offset(.04, .36), Offset(.27, .32), Offset(.51, .37), Offset(.75, .32),
    Offset(.13, .63), Offset(.37, .64), Offset(.59, .67), Offset(.80, .63),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final tileW = w > 1150 ? 160.0 : 148.0;
        final tileH = w > 1150 ? 142.0 : 132.0;
        final h = w > 1150 ? 650.0 : 610.0;
        return SizedBox(
          height: h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Positioned.fill(child: _MovingSkillOrbits()),
              Positioned(
                left: 6,
                bottom: 24,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: .70,
                    child: Transform.rotate(
                      angle: -.20,
                      child: Icon(Icons.local_florist_rounded, color: Brand.roseSoft.withOpacity(.24), size: 110),
                    ),
                  ),
                ),
              ),
              ...List.generate(skills.length, (i) {
                final pos = positions[i];
                final left = (w - tileW) * pos.dx;
                final top = (h - tileH - 55) * pos.dy + 36;
                return Positioned(
                  left: left,
                  top: top,
                  width: tileW,
                  height: tileH,
                  child: Reveal(
                    delay: Duration(milliseconds: 105 + (i * 105)),
                    from: Offset(i.isEven ? -50 : 50, 88),
                    startScale: .62,
                    startRotation: i.isEven ? -.065 : .065,
                    startTiltX: .22,
                    child: _AnimatedSkillCube(skill: skills[i], index: i),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _MobileSkillGrid extends StatelessWidget {
  final List<SkillBrand> skills;
  const _MobileSkillGrid({required this.skills});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = width > 510 ? 2 : 1;
    return GridView.builder(
      itemCount: skills.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        crossAxisSpacing: 18,
        mainAxisSpacing: 20,
        childAspectRatio: cols == 1 ? 1.55 : 1.05,
      ),
      itemBuilder: (_, i) => Reveal(
        delay: Duration(milliseconds: 90 * i),
        from: Offset(i.isEven ? -42 : 42, 70),
        startScale: .68,
        startRotation: i.isEven ? -.05 : .05,
        startTiltX: .18,
        child: _AnimatedSkillCube(skill: skills[i], index: i),
      ),
    );
  }
}

class _MovingSkillOrbits extends StatefulWidget {
  const _MovingSkillOrbits();
  @override
  State<_MovingSkillOrbits> createState() => _MovingSkillOrbitsState();
}

class _MovingSkillOrbitsState extends State<_MovingSkillOrbits>
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
    if (reduce) return const CustomPaint(painter: _SkillOrbitPainter(0));
    return AnimatedBuilder(
      animation: c,
      builder: (_, __) => CustomPaint(painter: _SkillOrbitPainter(c.value)),
    );
  }
}

class _SkillOrbitPainter extends CustomPainter {
  final double t;
  const _SkillOrbitPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * .50, size.height * .52);
    final orbitPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Brand.roseSoft.withOpacity(.17);

    final rects = [
      Rect.fromCenter(center: center, width: size.width * .90, height: size.height * .58),
      Rect.fromCenter(center: center.translate(0, 8), width: size.width * .75, height: size.height * .77),
      Rect.fromCenter(center: center.translate(-18, -6), width: size.width * .58, height: size.height * .88),
    ];
    for (var i = 0; i < rects.length; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate((i - 1) * .10);
      canvas.translate(-center.dx, -center.dy);
      canvas.drawOval(rects[i], orbitPaint);
      canvas.restore();
    }

    final glow = Paint()..color = Brand.rose.withOpacity(.75);
    for (var i = 0; i < 13; i++) {
      final a = (i / 13) * math.pi * 2 + t * math.pi * 2 * (i.isEven ? .08 : -.05);
      final rx = size.width * (.35 + (i % 3) * .035);
      final ry = size.height * (.25 + (i % 2) * .055);
      final p = Offset(center.dx + math.cos(a) * rx, center.dy + math.sin(a) * ry);
      canvas.drawCircle(p, i % 4 == 0 ? 3.2 : 1.8, glow);
      if (i % 4 == 0) {
        canvas.drawCircle(p, 8.5, Paint()..color = Brand.rose.withOpacity(.07));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SkillOrbitPainter oldDelegate) => oldDelegate.t != t;
}

class _AnimatedSkillCube extends StatefulWidget {
  final SkillBrand skill;
  final int index;
  const _AnimatedSkillCube({required this.skill, required this.index});

  @override
  State<_AnimatedSkillCube> createState() => _AnimatedSkillCubeState();
}

class _AnimatedSkillCubeState extends State<_AnimatedSkillCube>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 3200 + (widget.index % 5) * 310),
  )..repeat(reverse: true);
  double rx = 0;
  double ry = 0;
  bool hover = false;

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  void _move(PointerEvent e) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final p = box.globalToLocal(e.position);
    final nx = (p.dx / box.size.width - .5) * 2;
    final ny = (p.dy / box.size.height - .5) * 2;
    setState(() {
      ry = nx * .16;
      rx = -ny * .14;
      hover = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    Widget tile(double t) {
      final phase = widget.index * .47;
      final wave = math.sin(t * math.pi * 2 + phase);
      final sway = math.cos(t * math.pi * 2 + phase);
      return MouseRegion(
        onHover: reduce ? null : _move,
        onExit: (_) => setState(() {
          rx = 0;
          ry = 0;
          hover = false;
        }),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, .0017)
            ..translate(0.0, reduce ? 0.0 : wave * 9.5, hover && !reduce ? 22.0 : 0.0)
            ..rotateX(rx + (reduce ? 0 : wave * .035))
            ..rotateY(ry + (reduce ? 0 : sway * .050))
            ..rotateZ(reduce ? 0 : wave * .008),
          child: AnimatedScale(
            scale: hover && !reduce ? 1.075 : 1,
            duration: const Duration(milliseconds: 170),
            curve: Curves.easeOutBack,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 10,
                  top: 11,
                  right: -5,
                  bottom: -6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF09060B),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Brand.roseSoft.withOpacity(.15)),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(.42), blurRadius: 22, offset: const Offset(0, 12))],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: hover
                            ? [const Color(0xFF31172A), const Color(0xFF130B15)]
                            : [const Color(0xFF211421), const Color(0xFF0E0910)],
                      ),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Brand.roseSoft.withOpacity(hover ? .55 : .26), width: hover ? 1.3 : 1),
                      boxShadow: [
                        BoxShadow(color: Brand.rose.withOpacity(hover ? .18 : .07), blurRadius: hover ? 32 : 18, spreadRadius: hover ? 2 : 0),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: widget.skill.brandColor.withOpacity(.09),
                                border: Border.all(color: widget.skill.brandColor.withOpacity(.20)),
                              ),
                            ),
                            Icon(widget.skill.icon, color: widget.skill.brandColor, size: 31),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.skill.label,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.skill.category,
                          style: GoogleFonts.spaceMono(color: Brand.roseSoft.withOpacity(.72), fontSize: 7.5, letterSpacing: 1.15),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 12,
                  child: AnimatedOpacity(
                    opacity: hover ? 1 : .18,
                    duration: const Duration(milliseconds: 180),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Brand.rose,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Brand.rose.withOpacity(.8), blurRadius: 13, spreadRadius: 2)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (reduce) return tile(0);
    return AnimatedBuilder(animation: c, builder: (_, __) => tile(c.value));
  }
}

