import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/pill.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/tilt_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90),
      child: SiteWidth(
        child: Flex(
          direction: mobile ? Axis.vertical : Axis.horizontal,
          // A horizontal Flex lives inside the page's vertical SingleChildScrollView.
          // Its height is therefore unbounded; stretching the Row cross-axis forces
          // an infinite height on Flutter Web. Stretch is safe only for mobile's
          // vertical Flex, where the cross-axis is the bounded page width.
          crossAxisAlignment: mobile
              ? CrossAxisAlignment.stretch
              : CrossAxisAlignment.start,
          children: [
            ResponsiveExpanded(
              expand: !mobile,
              flex: 12,
              child: Reveal(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(width: 26, height: 1, color: Brand.rose),
                        const SizedBox(width: 10),
                        Text(
                          '01 • PROFESSIONAL PROFILE',
                          style: GoogleFonts.spaceMono(
                            color: Brand.roseSoft,
                            fontSize: 11,
                            letterSpacing: 2.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        style: GoogleFonts.inter(
                          color: Brand.cream,
                          fontSize: mobile ? 38 : 50,
                          height: 1.05,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          const TextSpan(text: "Hi, I'm "),
                          TextSpan(
                            text: 'Ayesha Asif',
                            style: GoogleFonts.cormorantGaramond(
                              color: Brand.rose,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              fontSize: mobile ? 44 : 58,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Turning ideas into meaningful digital experiences.',
                      style: GoogleFonts.spaceMono(color: Brand.cream, fontSize: 14, height: 1.6),
                    ),
                    const SizedBox(height: 18),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 610),
                      child: Text(
                        "I'm a BS Software Engineering student at COMSATS University Islamabad, Sahiwal Campus. I love building things that solve real problems — from responsive websites and Flutter apps to data analysis, machine learning, and AI-assisted systems.\nI enjoy learning new technologies and turning complex ideas into simple, useful solutions.",
                        style: GoogleFonts.inter(color: Brand.muted, fontSize: 14.5, height: 1.85),
                      ),
                    ),
                    const SizedBox(height: 30),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Expanded(child: _FactCard(icon: Icons.school_outlined, value: '3.95', label: 'CGPA')),
                          SizedBox(width: 12),
                          Expanded(child: _FactCard(icon: Icons.apartment_rounded, value: 'COMSATS', label: 'Sahiwal Campus')),
                          SizedBox(width: 12),
                          Expanded(child: _FactCard(icon: Icons.calendar_today_rounded, value: '2023 — 2027', label: 'BS Software Engineering')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    GlassPanel(
                      radius: 18,
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Brand.burgundy.withOpacity(.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.format_quote_rounded, color: Brand.roseSoft, size: 20),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'I believe in writing clean code, designing with purpose, and never stopping to learn.',
                              style: GoogleFonts.inter(
                                color: Brand.muted,
                                fontSize: 14,
                                height: 1.7,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: mobile ? 0 : 54, height: mobile ? 48 : 0),
            ResponsiveExpanded(
              expand: !mobile,
              flex: 9,
              child: Reveal(
                delay: const Duration(milliseconds: 120),
                from: const Offset(65, 0),
                startScale: .82,
                child: Column(
                  children: [
                    const _AboutAvatar(),
                    const SizedBox(height: 26),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        Pill('Problem solver'),
                        Pill('Fast learner'),
                        Pill('UI awareness'),
                        Pill('Data curious'),
                        Pill('Team collaboration'),
                        Pill('Tech explorer'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutAvatar extends StatelessWidget {
  const _AboutAvatar();

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    final size = mobile ? 320.0 : 420.0;
    return SizedBox(
      width: size,
      height: size * 1.18,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Brand.rose.withOpacity(.55), width: 1.4),
              ),
            ),
          ),
          Positioned(
            top: size * .11,
            child: Container(
              width: size * .78,
              height: size * .78,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Brand.rose.withOpacity(.16), Colors.transparent],
                ),
              ),
            ),
          ),
          // Full illustration, never cropped — BoxFit.contain keeps the hand,
          // scarf and full hair length inside the frame regardless of source
          // image aspect ratio.
          Positioned(
            top: 0,
            child: SizedBox(
              width: size * 1.06,
              height: size * 1.18,
              child: Image.asset(
                'lib/assets/images/contact_avatar.png',
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),

          Positioned(
            left: 0,
            top: size * .30,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Brand.rose,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Brand.rose.withOpacity(.6), blurRadius: 10)],
              ),
            ),
          ),
          Positioned(
            right: size * .04,
            top: size * .18,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Brand.roseSoft,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Brand.roseSoft.withOpacity(.6), blurRadius: 8)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FactCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _FactCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return TiltCard(
      maxTilt: 3,
      child: GlassPanel(
        radius: 16,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(color: Brand.burgundy.withOpacity(.7), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: Brand.roseSoft, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(color: Brand.muted, fontSize: 10.5, height: 1.25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

