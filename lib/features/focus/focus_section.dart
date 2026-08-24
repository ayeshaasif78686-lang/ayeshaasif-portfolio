import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/pill.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class FocusSection extends StatelessWidget {
  const FocusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: SiteWidth(
        child: Reveal(
          child: GlassPanel(
            radius: 30,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CURRENT FOCUS', style: GoogleFonts.spaceMono(color: Brand.rose, letterSpacing: 1.8, fontSize: 10)),
                const SizedBox(height: 14),
                Text('Becoming stronger where software, AI and data meet.', style: GoogleFonts.cormorantGaramond(color: Brand.cream, fontSize: 44, height: .95, fontWeight: FontWeight.w600)),
                const SizedBox(height: 24),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [Pill('Machine Learning'), Pill('Generative AI'), Pill('AI APIs'), Pill('Automation'), Pill('Data Engineering'), Pill('System Design')],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

