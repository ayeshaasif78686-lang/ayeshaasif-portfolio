import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/floaty.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section_heading.dart';
import '../../core/widgets/tilt_card.dart';
import '../../features/certificates/models/certificate_data.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  static const certs = [
    CertificateData('Introduction to Artificial Intelligence', 'Alison', '2026', 'lib/assets/certificates/alison_ai.jpg'),
    CertificateData('AI Fluency Framework & Foundation', 'Anthropic', 'Jul 2026', 'lib/assets/certificates/ai_fluency_framework.png'),
    CertificateData('Claude 101', 'Anthropic', 'Jul 2026', 'lib/assets/certificates/claude_101.png'),
    CertificateData('AI Capabilities & Limitations', 'Anthropic', '2026', 'lib/assets/certificates/ai_capabilities.png'),
    CertificateData('AI Fluency for Students', 'Anthropic', 'Jul 2026', 'lib/assets/certificates/ai_fluency_students.png'),
    CertificateData('Claude Code 101', 'Anthropic', 'Jul 2026', 'lib/assets/certificates/claude_code_101.png'),
    CertificateData('Claude Code in Action', 'Anthropic', 'Jul 2026', 'lib/assets/certificates/claude_code_action.png'),
    CertificateData('Claude with Anthropic API', 'Anthropic', 'Aug 2026', 'lib/assets/certificates/claude_api.png'),
    CertificateData('Introduction to Sub-agents', 'Anthropic', 'Aug 2026', 'lib/assets/certificates/subagents.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Brand.wine.withOpacity(.16),
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: SiteWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              kicker: '05 • Certificates',
              title: 'A learning archive, not a badge wall.',
              body: 'A horizontal perspective gallery keeps credentials elegant and secondary to the work itself.',
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 335,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: certs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 15),
                itemBuilder: (_, i) => Reveal(
                  delay: Duration(milliseconds: i * 45),
                  from: const Offset(20, 0),
                  child: Floaty(
                    distance: 4 + (i % 3).toDouble(),
                    duration: Duration(milliseconds: 3600 + (i % 5) * 260),
                    child: _CertificateCard(c: certs[i]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CertificateCard extends StatelessWidget {
  final CertificateData c;
  const _CertificateCard({required this.c});

  @override
  Widget build(BuildContext context) {
    return TiltCard(
      maxTilt: 7,
      child: Container(
        width: 290,
        decoration: BoxDecoration(
          color: Brand.surface(.88),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Brand.roseSoft.withOpacity(.12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFFEDE4E8),
                    child: Image.asset(c.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(c.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontWeight: FontWeight.w700, fontSize: 14)),
              const SizedBox(height: 5),
              Text('${c.issuer} • ${c.date}', style: GoogleFonts.inter(color: Brand.roseSoft, fontSize: 10.5)),
            ],
          ),
        ),
      ),
    );
  }
}

