import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/theme/app_theme.dart';
import '../../core/utils/launch_url.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/orbit_chip.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/soft_button.dart';
import '../../core/widgets/tilt_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 850;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: SiteWidth(
        child: Reveal(
          child: GlassPanel(
            radius: 32,
            padding: EdgeInsets.all(mobile ? 24 : 38),
            color: const Color(0xFF110A0E).withOpacity(.9),
            child: Flex(
              direction: mobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveExpanded(
                  expand: !mobile,
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("08 • LET'S CONNECT", style: GoogleFonts.spaceMono(color: Brand.rose, fontSize: 10, letterSpacing: 1.8)),
                      const SizedBox(height: 14),
                      Text("Let's build something\nthoughtful.", style: GoogleFonts.cormorantGaramond(color: Brand.cream, fontSize: mobile ? 48 : 62, height: .9, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 18),
                      Text('Open to internships, collaborations and interesting product conversations.', style: GoogleFonts.inter(color: Brand.muted, fontSize: 14, height: 1.65)),
                      const SizedBox(height: 28),
                      const _ContactLine(Icons.mail_outline_rounded, 'ishaasif389@gmail.com'),
                      const _ContactLine(Icons.phone_outlined, '+92 332 6278848'),
                      const _ContactLine(Icons.location_on_outlined, 'Kamalia, Punjab, Pakistan'),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          SoftButton(label: 'Email me', onTap: () => openLink('mailto:ishaasif389@gmail.com')),
                          SoftButton(label: 'LinkedIn', secondary: true, onTap: () => openLink('https://www.linkedin.com/in/ayesha-asif-696919369')),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: mobile ? 0 : 38, height: mobile ? 32 : 0),
                ResponsiveExpanded(
                  expand: !mobile,
                  flex: 9,
                  child: const _ConnectWorkspaceArt(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactLine(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          Icon(icon, color: Brand.roseSoft, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: GoogleFonts.inter(color: Brand.muted, fontSize: 12.5))),
        ],
      ),
    );
  }
}


class _ConnectWorkspaceArt extends StatelessWidget {
  const _ConnectWorkspaceArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390,
      child: Image.asset(
        'lib/assets/images/connect_workspace.png',
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class _ContactCardArt extends StatefulWidget {
  const _ContactCardArt();

  @override
  State<_ContactCardArt> createState() => _ContactCardArtState();
}

class _ContactCardArtState extends State<_ContactCardArt>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 13),
  )..repeat();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    Widget art(double t) {
      final wave = math.sin(t * math.pi * 2);
      return SizedBox(
        height: 390,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Transform.rotate(
              angle: t * math.pi * 2 * .16,
              child: Container(
                width: 326,
                height: 326,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Brand.rose.withOpacity(.22)),
                ),
              ),
            ),
            Transform.rotate(
              angle: -t * math.pi * 2 * .12,
              child: Container(
                width: 276,
                height: 276,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Brand.roseSoft.withOpacity(.12)),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, reduce ? 0 : wave * 7),
              child: TiltCard(
                maxTilt: 4.5,
                hoverScale: 1.018,
                child: Container(
                  width: 228,
                  height: 356,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B0709),
                    borderRadius: BorderRadius.circular(34),
                    border: Border.all(color: Brand.roseSoft.withOpacity(.28)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(.48), blurRadius: 34, offset: const Offset(0, 18)),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(33),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Use contain so the complete original portrait is visible.
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Image.asset(
                            'lib/assets/images/hero_avatar.png',
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(16, 34, 16, 14),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Brand.ink.withOpacity(.94)],
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('AYESHA ASIF', style: GoogleFonts.spaceMono(color: Brand.cream, fontSize: 10, letterSpacing: 1.7)),
                                const SizedBox(height: 4),
                                Text('AI • Data • Software', style: GoogleFonts.inter(color: Brand.roseSoft, fontSize: 10.5)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 22,
              right: -4,
              child: OrbitChip(label: 'Let’s create', icon: Icons.auto_awesome_rounded),
            ),
            const Positioned(
              bottom: 18,
              left: -2,
              child: OrbitChip(label: 'Open to work', icon: Icons.favorite_border_rounded),
            ),
            Positioned(
              top: 92 + wave * 4,
              left: 6,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(color: Brand.roseSoft, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      );
    }

    if (reduce) return art(0);
    return AnimatedBuilder(animation: c, builder: (_, __) => art(c.value));
  }
}


// Original-style contact form restored from Ayesha's earlier portfolio,
// recolored to the current burgundy/black brand and paired with the new
// transparent avatar for the restored contact section. The hero uses hero_avatar.png.
