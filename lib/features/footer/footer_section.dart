import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteWidth(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 34),
        child: Reveal(
          child: Row(
            children: [
              Text('© 2026 Ayesha Asif', style: GoogleFonts.inter(color: Brand.muted, fontSize: 11)),
              const Spacer(),
              Text('Code • Data • AI • Curiosity', style: GoogleFonts.spaceMono(color: Brand.roseSoft, fontSize: 9, letterSpacing: 1.2)),
            ],
          ),
        ),
      ),
    );
  }
}
