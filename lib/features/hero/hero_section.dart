import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/shimmer_text.dart';
import '../../core/widgets/soft_button.dart';
import '../../core/widgets/tilt_card.dart';
import '../../resume_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExplore;
  const HeroSection({super.key, required this.onExplore});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = width < 900;
    return Container(
      constraints: BoxConstraints(minHeight: mobile ? 1180 : 860),
      color: Brand.ink,
      child: Stack(
        children: [
          const Positioned.fill(child: _HeroGrid()),
          const Positioned.fill(child: IgnorePointer(child: _HeroAmbientPulse())),
          Padding(
            padding: EdgeInsets.only(top: mobile ? 116 : 128, bottom: 46),
            child: SiteWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: mobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: mobile ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
                    children: [
                      ResponsiveExpanded(
                        expand: !mobile,
                        flex: 11,
                        child: Column(
                          crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                          children: [
                            Reveal(
                              from: const Offset(-55, 0),
                              startScale: .92,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                                decoration: BoxDecoration(
                                  color: Brand.rose.withOpacity(.10),
                                  borderRadius: BorderRadius.circular(99),
                                  border: Border.all(color: Brand.rose.withOpacity(.45)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.code_rounded, color: Brand.rose, size: 15),
                                    const SizedBox(width: 8),
                                    Text(
                                      'SOFTWARE ENGINEER',
                                      style: GoogleFonts.spaceMono(
                                        color: Brand.rose,
                                        fontSize: 11,
                                        letterSpacing: 1.6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Reveal(
                              delay: const Duration(milliseconds: 90),
                              from: const Offset(-70, 0),
                              startScale: .90,
                              startRotation: -.014,
                              child: Text.rich(
                                TextSpan(
                                  style: GoogleFonts.inter(
                                    color: Brand.cream,
                                    fontSize: mobile ? 38 : 52,
                                    height: 1.10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Building intelligent solutions '),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.baseline,
                                      baseline: TextBaseline.alphabetic,
                                      child: ShimmerText(
                                        text: 'with code',
                                        delay: const Duration(milliseconds: 1400),
                                        style: GoogleFonts.cormorantGaramond(
                                          color: Brand.rose,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w600,
                                          fontSize: mobile ? 42 : 56,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: mobile ? TextAlign.center : TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 22),
                            Reveal(
                              delay: const Duration(milliseconds: 190),
                              from: const Offset(-50, 0),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 560),
                                child: Text.rich(
                                  TextSpan(
                                    style: GoogleFonts.inter(color: Brand.muted, fontSize: 15, height: 1.75),
                                    children: [
                                      const TextSpan(
                                        text: 'Software Engineering student passionate about creating meaningful digital experiences through ',
                                      ),
                                      TextSpan(
                                        text: 'AI',
                                        style: GoogleFonts.inter(color: Brand.roseSoft, fontWeight: FontWeight.w600, fontSize: 15),
                                      ),
                                      const TextSpan(text: ', '),
                                      TextSpan(
                                        text: 'Data',
                                        style: GoogleFonts.inter(color: Brand.roseSoft, fontWeight: FontWeight.w600, fontSize: 15),
                                      ),
                                      const TextSpan(text: ', and modern Web technologies.'),
                                    ],
                                  ),
                                  textAlign: mobile ? TextAlign.center : TextAlign.left,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Reveal(
                              delay: const Duration(milliseconds: 290),
                              from: const Offset(0, 40),
                              startScale: .84,
                              child: Wrap(
                                alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
                                spacing: 14,
                                runSpacing: 14,
                                children: [
                                  SoftButton(label: 'View My Work', onTap: onExplore),
                                  SoftButton(
                                    label: 'Download CV',
                                    secondary: true,
                                    icon: Icons.download_rounded,
                                    onTap: () async {
                                      final ok = await downloadResume();
                                      if (!context.mounted) return;
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: ok ? const Color(0xFF241017) : const Color(0xFF3A1418),
                                          content: Text(
                                            ok
                                                ? 'Resume download started — check your Downloads folder.'
                                                : "Couldn't start the download. Please try again.",
                                            style: GoogleFonts.inter(color: Brand.cream, fontSize: 13),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 42),
                            Reveal(
                              delay: const Duration(milliseconds: 390),
                              from: const Offset(0, 40),
                              startScale: .84,
                              child: Column(
                                crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '02 • TECH STACK & EXPERTISE',
                                    style: GoogleFonts.spaceMono(color: Brand.muted, fontSize: 10.5, letterSpacing: 1.8),
                                  ),
                                  const SizedBox(height: 14),
                                  Wrap(
                                    alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      const _TechIcon(icon: SimpleIcons.python, color: Color(0xFF3776AB)),
                                      const _TechIcon(icon: SimpleIcons.flutter, color: Color(0xFF54C5F8)),
                                      const _TechIcon(icon: SimpleIcons.react, color: Color(0xFF61DAFB)),
                                      const _TechIcon(icon: SimpleIcons.javascript, color: Color(0xFF161616), bg: Color(0xFFF7DF1E)),
                                      const _TechIcon(icon: SimpleIcons.nodedotjs, color: Color(0xFF5FA04E)),
                                      const _TechIcon(icon: SimpleIcons.mongodb, color: Color(0xFF47A248)),
                                      _TechMoreIcon(onTap: onExplore),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: mobile ? 0 : 46, height: mobile ? 50 : 0),
                      ResponsiveExpanded(
                        expand: !mobile,
                        flex: 9,
                        child: Reveal(
                          delay: const Duration(milliseconds: 150),
                          from: const Offset(65, 0),
                          startScale: .80,
                          child: const _HeroWorkspaceArt(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                  Reveal(
                    delay: const Duration(milliseconds: 460),
                    from: const Offset(0, 36),
                    startScale: .92,
                    child: const _HeroStatsBar(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color? bg;
  const _TechIcon({required this.icon, required this.color, this.bg});

  @override
  Widget build(BuildContext context) {
    return TiltCard(
      maxTilt: 8,
      child: Container(
        width: 52,
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg ?? Brand.surface(.92),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Brand.roseSoft.withOpacity(.14)),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}

class _TechMoreIcon extends StatelessWidget {
  final VoidCallback onTap;
  const _TechMoreIcon({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TiltCard(
      maxTilt: 8,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 52,
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Brand.surface(.92),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Brand.roseSoft.withOpacity(.14)),
          ),
          child: const Icon(Icons.more_horiz_rounded, color: Brand.roseSoft, size: 22),
        ),
      ),
    );
  }
}

class _HeroWorkspaceArt extends StatelessWidget {
  const _HeroWorkspaceArt();

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    final size = mobile ? 320.0 : 460.0;
    final boxW = size * 1.30;
    final boxH = size * 1.18;
    return SizedBox(
      width: boxW,
      height: boxH,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: size * 1.02,
            height: size * 1.02,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Brand.rose.withOpacity(.18), Colors.transparent],
              ),
            ),
          ),
          Container(
            width: size * .90,
            height: size * .90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Brand.rose.withOpacity(.32), width: 1.2),
            ),
          ),
          Container(
            width: size * .68,
            height: size * .68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Brand.roseSoft.withOpacity(.18), width: .8),
            ),
          ),
          Positioned(
            left: boxW * .06,
            top: boxH * .16,
            child: Icon(Icons.auto_awesome_rounded, size: 15, color: Brand.roseSoft.withOpacity(.75)),
          ),
          Positioned(
            left: boxW * .16,
            top: boxH * .40,
            child: Icon(Icons.auto_awesome_rounded, size: 9, color: Brand.rose.withOpacity(.65)),
          ),
          Positioned(
            right: boxW * .10,
            bottom: boxH * .28,
            child: Icon(Icons.auto_awesome_rounded, size: 8, color: Brand.roseSoft.withOpacity(.6)),
          ),
          // Full illustration, never cropped.
          SizedBox(
            width: size * 1.08,
            height: size * 1.08,
            child: Image.asset(
              'lib/assets/images/hero_workspace.png',
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
          Positioned(
            right: -boxW * .04,
            top: boxH * .10,
            child: Transform.rotate(
              angle: .05,
              child: Column(
                children: [
                  Text(
                    'keep',
                    style: GoogleFonts.dancingScript(
                      color: Brand.roseSoft,
                      fontSize: size * .085,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    'building',
                    style: GoogleFonts.dancingScript(
                      color: Brand.roseSoft,
                      fontSize: size * .085,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Icon(Icons.favorite_rounded, color: Brand.rose, size: size * .05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroStatsBar extends StatelessWidget {
  const _HeroStatsBar();

  static const _stats = [
    (Icons.work_outline_rounded, '6+', 'Projects\nCompleted'),
    (Icons.school_outlined, '3+', 'Years\nLearning'),
    (Icons.psychology_alt_outlined, '5+', 'Technologies\nExplored'),
    (Icons.favorite_rounded, '100%', 'Passion &\nDedication'),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    return GlassPanel(
      radius: 22,
      padding: EdgeInsets.symmetric(horizontal: mobile ? 18 : 26, vertical: mobile ? 20 : 24),
      child: Flex(
        direction: mobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: mobile ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
        children: [
          for (final s in _stats) ...[
            Expanded(
              child: Row(
                mainAxisAlignment: mobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: Brand.burgundy.withOpacity(.7), borderRadius: BorderRadius.circular(12)),
                    child: Icon(s.$1, color: Brand.roseSoft, size: 19),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(s.$2, style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontWeight: FontWeight.w700, fontSize: 19)),
                        Text(
                          s.$3.replaceAll('\n', ' '),
                          textAlign: mobile ? TextAlign.center : TextAlign.left,
                          style: GoogleFonts.inter(color: Brand.muted, fontSize: 11, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (s != _stats.last) SizedBox(width: mobile ? 0 : 8, height: mobile ? 18 : 0),
          ],
          if (!mobile)
            Container(width: 1, height: 46, color: Brand.line, margin: const EdgeInsets.symmetric(horizontal: 14)),
          if (mobile) const SizedBox(height: 18),
          Expanded(
            flex: mobile ? 1 : 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.format_quote_rounded, color: Brand.rose, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'First, solve the problem.\nThen, write the code.',
                        style: GoogleFonts.inter(color: Brand.cream, fontSize: 13, height: 1.5, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 6),
                      Text('— John Johnson', style: GoogleFonts.spaceMono(color: Brand.roseSoft, fontSize: 10.5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroAmbientPulse extends StatefulWidget {
  const _HeroAmbientPulse();

  @override
  State<_HeroAmbientPulse> createState() => _HeroAmbientPulseState();
}

class _HeroAmbientPulseState extends State<_HeroAmbientPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat(reverse: true);

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (reduce) return const SizedBox.shrink();
    return AnimatedBuilder(
      animation: c,
      builder: (_, __) {
        final t = Curves.easeInOut.transform(c.value);
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-.58 + t * .08, -.05),
              radius: 1.05 + t * .10,
              colors: [
                Brand.rose.withOpacity(.055 + t * .035),
                Brand.burgundy.withOpacity(.025),
                Colors.transparent,
              ],
              stops: const [0, .45, 1],
            ),
          ),
        );
      },
    );
  }
}

class _HeroGrid extends StatelessWidget {
  const _HeroGrid();
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _HeroGridPainter()),
    );
  }
}

class _HeroGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.white.withOpacity(.025)..strokeWidth = .7;
    const step = 78.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), p);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeroSocial extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;
  const _HeroSocial({required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TiltCard(
      maxTilt: 10,
      hoverScale: 1.10,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 44,
          height: 44,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Brand.rose.withOpacity(.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Brand.rose.withOpacity(.30)),
          ),
          child: Image.asset(asset, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

