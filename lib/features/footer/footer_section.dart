import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> _openLink(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteWidth(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 34),
        child: Reveal(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _FlyRankBadge(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    '© 2026 Ayesha Asif',
                    style: GoogleFonts.inter(color: Brand.muted, fontSize: 11),
                  ),
                  const Spacer(),
                  Text(
                    'Code • Data • AI • Curiosity',
                    style: GoogleFonts.spaceMono(
                      color: Brand.roseSoft,
                      fontSize: 9,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// FlyRank AI Internship — verified credential badge.
/// Restyled to match the site's dark / rose glass-panel identity
/// (instead of the default white card) so it sits naturally in the footer.
class _FlyRankBadge extends StatelessWidget {
  const _FlyRankBadge();

  static const _verifyUrl =
      'https://internship.flyrank.ai/verify?id=FR-D1-T668H-R789R&first_name=Ayesha';

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      label:
          "Verify Ayesha Asif's FlyRank AI Internship credential FR-D1-T668H-R789R",
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _openLink(_verifyUrl),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: Brand.surface(0.72),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Brand.roseSoft.withOpacity(0.18)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Brand.rose.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Brand.rose.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      'y',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Brand.rose,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'FLYRANK AI INTERNSHIP',
                      style: GoogleFonts.spaceMono(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                        color: Brand.muted,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Verified credential',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Brand.cream,
                        letterSpacing: -0.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'FR-D1-T668H-R789R',
                      style: GoogleFonts.spaceMono(
                        fontSize: 10.5,
                        color: Brand.roseSoft,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Brand.rose.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(color: Brand.rose.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 13, color: Brand.roseSoft),
                      const SizedBox(width: 6),
                      Text(
                        'Verify',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Brand.roseSoft,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
