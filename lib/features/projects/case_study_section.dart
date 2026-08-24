import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/launch_url.dart';
import '../../core/widgets/floaty.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/pill.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/soft_button.dart';
import '../../core/widgets/tilt_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CaseStudySection extends StatelessWidget {
  const CaseStudySection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 880;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: SiteWidth(
        child: Reveal(
          child: TiltCard(
            maxTilt: 2,
            child: GlassPanel(
              radius: 30,
              padding: const EdgeInsets.all(28),
              color: const Color(0xFF110A0E).withOpacity(.88),
              child: Flex(
                direction: mobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResponsiveExpanded(
                    expand: !mobile,
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('03 • FEATURED PROJECTS', style: GoogleFonts.spaceMono(color: Brand.rose, fontSize: 10, letterSpacing: 1.8)),
                        const SizedBox(height: 13),
                        Text('Heart Disease\nPrediction', style: GoogleFonts.cormorantGaramond(color: Brand.cream, fontWeight: FontWeight.w600, fontSize: mobile ? 43 : 56, height: .9)),
                        const SizedBox(height: 18),
                        Text('A machine-learning classification workflow covering preprocessing, training and evaluation — presented as an end-to-end product story instead of a small generic card.', style: GoogleFonts.inter(color: Brand.muted, height: 1.7, fontSize: 13.5)),
                        const SizedBox(height: 22),
                        const Wrap(spacing: 8, runSpacing: 8, children: [Pill('Python'), Pill('Scikit-learn'), Pill('Classification'), Pill('Evaluation')]),
                        const SizedBox(height: 24),
                        SoftButton(label: 'View repository', onTap: () => openLink('https://github.com/ayeshaasif50/heart-disease')),
                      ],
                    ),
                  ),
                  SizedBox(width: mobile ? 0 : 35, height: mobile ? 30 : 0),
                  ResponsiveExpanded(
                    expand: !mobile,
                    flex: 11,
                    child: Floaty(
                      distance: 5,
                      child: Transform.rotate(
                        angle: mobile ? 0 : -.025,
                        child: Container(
                          height: mobile ? 290 : 390,
                          decoration: BoxDecoration(
                            color: Brand.ink,
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(color: Brand.roseSoft.withOpacity(.16)),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.45), blurRadius: 28, offset: const Offset(0, 18))],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'lib/assets/images/heart_disease.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

