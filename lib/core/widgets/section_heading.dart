import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeading extends StatelessWidget {
  final String kicker;
  final String title;
  final String? body;
  const SectionHeading({
    super.key,
    required this.kicker,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 700;
    return Reveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 26, height: 1, color: Brand.rose),
              const SizedBox(width: 10),
              Text(
                kicker.toUpperCase(),
                style: GoogleFonts.spaceMono(
                  color: Brand.roseSoft,
                  fontSize: 11,
                  letterSpacing: 2.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.cormorantGaramond(
              color: Brand.cream,
              fontSize: mobile ? 42 : 58,
              height: .95,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (body != null) ...[
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 690),
              child: Text(
                body!,
                style: GoogleFonts.inter(
                  color: Brand.muted,
                  fontSize: mobile ? 14 : 16,
                  height: 1.8,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

