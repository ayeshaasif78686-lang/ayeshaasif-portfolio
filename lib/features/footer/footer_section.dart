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
/// Links out to the official verification page for this credential ID.
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
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFDDE4E7)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF051F21).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPaint(
                  size: const Size(40, 40),
                  painter: _FlyRankMarkPainter(),
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
                        color: const Color(0xFF051F21).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Verified credential',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF051F21),
                        letterSpacing: -0.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'FR-D1-T668H-R789R',
                      style: GoogleFonts.spaceMono(
                        fontSize: 11,
                        color: const Color(0xFF1A7A4A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF54E399).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                      color: const Color(0xFF54E399).withOpacity(0.28),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        size: 13,
                        color: Color(0xFF1A7A4A),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Verify',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A7A4A),
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

/// Paints the FlyRank checkmark/bird mark from the original SVG:
/// a dark rounded-square background with the green flourish glyph on top.
class _FlyRankMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 96;

    final bgPaint = Paint()..color = const Color(0xFF051F21);
    final bgRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(22 * scale),
    );
    canvas.drawRRect(bgRRect, bgPaint);

    final glyphPath = Path()
      ..moveTo(28.2354 * scale, 74.2202 * scale)
      ..lineTo(28.2354 * scale, 67.9039 * scale)
      ..cubicTo(
        29.6419 * scale, 68.4369 * scale,
        31.3724 * scale, 68.7055 * scale,
        33.4311 * scale, 68.7055 * scale,
      )
      ..cubicTo(
        35.3235 * scale, 68.7055 * scale,
        36.8153 * scale, 68.2396 * scale,
        37.8979 * scale, 67.3079 * scale,
      )
      ..cubicTo(
        38.9805 * scale, 66.3762 * scale,
        39.9566 * scale, 64.8695 * scale,
        40.8218 * scale, 62.792 * scale,
      )
      ..lineTo(42.6887 * scale, 58.3139 * scale)
      ..lineTo(29.8976 * scale, 29.2879 * scale)
      ..cubicTo(
        35.0038 * scale, 29.2879 * scale,
        39.6028 * scale, 32.3307 * scale,
        41.5294 * scale, 36.9893 * scale,
      )
      ..lineTo(47.0746 * scale, 50.3985 * scale)
      ..lineTo(56.0126 * scale, 28.6038 * scale)
      ..cubicTo(
        57.9221 * scale, 23.9452 * scale,
        62.5168 * scale, 20.894 * scale,
        67.6187 * scale, 20.894 * scale,
      )
      ..lineTo(50.0795 * scale, 63.5936 * scale)
      ..cubicTo(
        48.4556 * scale, 67.5933 * scale,
        46.5205 * scale, 70.5102 * scale,
        44.2743 * scale, 72.3484 * scale,
      )
      ..cubicTo(
        42.0281 * scale, 74.1867 * scale,
        39.1169 * scale, 75.1058 * scale,
        35.5451 * scale, 75.1058 * scale,
      )
      ..cubicTo(
        32.6212 * scale, 75.1058 * scale,
        30.1875 * scale, 74.812 * scale,
        28.2354 * scale, 74.2244 * scale,
      )
      ..close();

    final glyphPaint = Paint()..color = const Color(0xFF54E399);
    canvas.drawPath(glyphPath, glyphPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
