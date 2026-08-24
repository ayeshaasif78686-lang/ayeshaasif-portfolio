import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/pill.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section_heading.dart';
import '../../core/widgets/tilt_card.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 860;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: SiteWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              kicker: '06 • Education & Journey',
              title: 'Still early. Already in motion.',
              body: 'The academic foundation matters, but the real story is how quickly theory turns into projects, internships and experiments.',
            ),
            const SizedBox(height: 40),
            Flex(
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
                  child: Reveal(
                    child: TiltCard(
                      child: GlassPanel(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.school_outlined, color: Brand.rose, size: 26),
                            const SizedBox(height: 18),
                            Text('BS Software Engineering', style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontSize: 20, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 7),
                            Text('COMSATS University Islamabad — Sahiwal', style: GoogleFonts.inter(color: Brand.roseSoft, fontSize: 12)),
                            const SizedBox(height: 12),
                            Text('2023 — Expected 2027  •  CGPA 3.95', style: GoogleFonts.inter(color: Brand.muted, fontSize: 12)),
                            const SizedBox(height: 18),
                            const Wrap(spacing: 7, runSpacing: 7, children: [Pill('Data Structures'), Pill('DBMS'), Pill('Software Engineering'), Pill('Probability & Statistics')]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: mobile ? 0 : 16, height: mobile ? 16 : 0),
                ResponsiveExpanded(
                  expand: !mobile,
                  child: Reveal(
                    delay: const Duration(milliseconds: 80),
                    child: TiltCard(
                      child: GlassPanel(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.route_outlined, color: Brand.rose, size: 26),
                            const SizedBox(height: 18),
                            Text('Learning path', style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontSize: 20, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 12),
                            const _JourneyLine(year: '2025', text: 'Web, data and ML internships + applied projects'),
                            const _JourneyLine(year: '2026', text: 'Front-end AI engineering + Anthropic learning track'),
                            const _JourneyLine(year: 'Next', text: 'Deeper AI systems, data engineering and strong product case studies'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _JourneyLine extends StatelessWidget {
  final String year;
  final String text;
  const _JourneyLine({required this.year, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 42, child: Text(year, style: GoogleFonts.spaceMono(color: Brand.rose, fontSize: 10))),
          Expanded(child: Text(text, style: GoogleFonts.inter(color: Brand.muted, fontSize: 12.5, height: 1.5))),
        ],
      ),
    );
  }
}

