import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/floaty.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/tilt_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const data = [
    ('AI & Automation', Icons.smart_toy_rounded, Color(0xFFF64081), 'AI-assisted workflows, useful automations and intelligent product concepts.'),
    ('Data & ML', SimpleIcons.python, Color(0xFF3776AB), 'EDA, predictive modeling and clean, explainable data-driven prototypes.'),
    ('Web Applications', SimpleIcons.react, Color(0xFF61DAFB), 'Responsive modern interfaces backed by full-stack development skills.'),
    ('Flutter / Mobile', SimpleIcons.flutter, Color(0xFF54C5F8), 'Cross-platform mobile interfaces with a strong usability focus.'),
    ('Cloud & DevOps', SimpleIcons.docker, Color(0xFF2496ED), 'Deployments, CI/CD thinking and scalable cloud-ready workflows.'),
    ('APIs & Integrations', Icons.hub_rounded, Color(0xFFE49AB6), 'REST APIs, third-party services and secure application integrations.'),
    ('UI/UX Design', SimpleIcons.figma, Color(0xFFF24E1E), 'Clean, user-centered interfaces that make complex things feel simple.'),
    ('Code & Problem Solving', SimpleIcons.github, Color(0xFFF2F2F2), 'Maintainable code, debugging and structured problem-solving.'),
    ('Databases', SimpleIcons.mongodb, Color(0xFF47A248), 'Designing and working with reliable SQL and MongoDB data layers.'),
    ('Testing & Quality', Icons.verified_rounded, Color(0xFFE49AB6), 'Testing, iteration and quality-minded engineering practices.'),
    ('Collaboration', Icons.groups_2_rounded, Color(0xFFE49AB6), 'Clear communication, teamwork, feedback and practical Git workflows.'),
    ('Mentoring & Learning', Icons.school_rounded, Color(0xFFE49AB6), 'Continuous learning, knowledge sharing and growing through real projects.'),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = width > 1120 ? 4 : width > 720 ? 2 : 1;
    final ratio = cols == 4 ? 1.32 : cols == 2 ? 1.36 : 1.65;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 112),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF451124), Color(0xFF250A17), Color(0xFF0B060A), Brand.ink],
          stops: [0, .28, .58, 1],
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: _CapabilityBackdrop()),
          SiteWidth(
            child: Column(
              children: [
                Reveal(
                  from: const Offset(0, 60),
                  startScale: .80,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 58, height: 1, color: Brand.roseSoft.withOpacity(.38)),
                          const SizedBox(width: 13),
                          Text('07 • CORE CAPABILITIES', style: GoogleFonts.spaceMono(color: Brand.roseSoft, fontSize: 11, letterSpacing: 2.0)),
                          const SizedBox(width: 13),
                          Container(width: 58, height: 1, color: Brand.roseSoft.withOpacity(.38)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          style: GoogleFonts.cormorantGaramond(
                            color: Brand.cream,
                            fontSize: width < 700 ? 48 : 70,
                            height: .92,
                            fontWeight: FontWeight.w600,
                          ),
                          children: const [
                            TextSpan(text: 'What I Can '),
                            TextSpan(text: 'Contribute.', style: TextStyle(color: Brand.rose)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 720),
                        child: Text(
                          'A concise capability layer for recruiters, collaborators and clients — practical, focused and grounded in what I actually build.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(color: Brand.muted, fontSize: 14, height: 1.7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 46),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cols,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: ratio,
                  ),
                  itemBuilder: (_, i) {
                    final d = data[i];
                    return Reveal(
                      delay: Duration(milliseconds: 115 * i),
                      from: Offset(i.isEven ? -55 : 55, 92),
                      startScale: .63,
                      startRotation: i.isEven ? -.045 : .045,
                      startTiltX: .18,
                      child: _CapabilityCard(
                        index: i,
                        title: d.$1,
                        icon: d.$2,
                        iconColor: d.$3,
                        description: d.$4,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CapabilityBackdrop extends StatelessWidget {
  const _CapabilityBackdrop();
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            left: -140,
            top: 130,
            child: Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Brand.rose.withOpacity(.08))),
            ),
          ),
          Positioned(
            right: -110,
            bottom: 70,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Brand.roseSoft.withOpacity(.07))),
            ),
          ),
        ],
      ),
    );
  }
}

class _CapabilityCard extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;
  final Color iconColor;
  final String description;
  const _CapabilityCard({
    required this.index,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Floaty(
      distance: 4.5,
      duration: Duration(milliseconds: 3200 + (index % 5) * 260),
      child: TiltCard(
        maxTilt: 6.5,
        hoverScale: 1.035,
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFF1C1117).withOpacity(.96), const Color(0xFF0C080B).withOpacity(.98)],
            ),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Brand.roseSoft.withOpacity(.17)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.34), blurRadius: 28, offset: const Offset(0, 16)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Floaty(
                    distance: 3.5,
                    duration: Duration(milliseconds: 2500 + (index % 4) * 220),
                    child: Transform.rotate(
                      angle: -.03,
                      child: Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Brand.rose.withOpacity(.22), Brand.burgundy.withOpacity(.40)],
                          ),
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Brand.roseSoft.withOpacity(.22)),
                          boxShadow: [
                            BoxShadow(color: Brand.rose.withOpacity(.10), blurRadius: 22, offset: const Offset(0, 10)),
                          ],
                        ),
                        child: Icon(icon, color: iconColor, size: 29),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${index + 1}'.padLeft(2, '0'),
                    style: GoogleFonts.spaceMono(color: Brand.roseSoft.withOpacity(.72), fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              Text(title, style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontSize: 18.5, fontWeight: FontWeight.w700)),
              const SizedBox(height: 9),
              Text(description, style: GoogleFonts.inter(color: Brand.muted, fontSize: 12.3, height: 1.58)),
            ],
          ),
        ),
      ),
    );
  }
}

