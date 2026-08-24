import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass_panel.dart';
import '../../core/widgets/pill.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section_heading.dart';
import '../../core/widgets/tilt_card.dart';
import '../../features/experience/models/experience_item.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const items = [
    ExperienceItem('Front-end AI Engineer — Internship', 'FlyRank AI', 'Jun 2026 — Present', 'Remote', 'Working on front-end AI engineering and user-facing intelligent experiences.', ['AI', 'Front-end', 'JavaScript']),
    ExperienceItem('Artificial Intelligence Intern', 'Innoverse', 'Aug 2025 — Sep 2025', 'Remote', 'Worked on data-science tasks, exploratory analysis and AI-based project work.', ['Python', 'Data Science', 'EDA']),
    ExperienceItem('Web Development Intern', 'Geego Tech Lahore', 'Jul 2025 — Sep 2025', 'Hybrid', 'Built responsive interfaces, improved UI/UX across devices and followed a collaborative Git workflow.', ['HTML', 'CSS', 'JavaScript', 'Git']),
    ExperienceItem('Machine Learning Intern', 'Elevvo Pathways', 'Aug 2025', 'Remote', 'Implemented ML models and explored predictive analytics workflows.', ['Python', 'Machine Learning']),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: SiteWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              kicker: '03 • Experience',
              title: 'Learning by building in the real world.',
              body: 'A growing journey across AI, web engineering, data and machine learning — with each role adding a different layer to how I approach products.',
            ),
            const SizedBox(height: 42),
            ...List.generate(items.length, (i) {
              final e = items[i];
              return Reveal(
                delay: Duration(milliseconds: i * 60),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          _TimelinePulseNode(active: i == 0, delay: i),
                          if (i != items.length - 1)
                            Container(width: 1, height: 138, color: Brand.line),
                        ],
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: TiltCard(
                          maxTilt: 2.5,
                          child: GlassPanel(
                            padding: const EdgeInsets.all(22),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runSpacing: 12,
                              children: [
                                SizedBox(
                                  width: 660,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(e.role, style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontWeight: FontWeight.w700, fontSize: 17)),
                                      const SizedBox(height: 5),
                                      Text('${e.company}  •  ${e.date}  •  ${e.mode}', style: GoogleFonts.inter(color: Brand.roseSoft, fontSize: 11)),
                                      const SizedBox(height: 12),
                                      Text(e.body, style: GoogleFonts.inter(color: Brand.muted, height: 1.65, fontSize: 13)),
                                      const SizedBox(height: 14),
                                      Wrap(spacing: 7, runSpacing: 7, children: e.tags.map(Pill.new).toList()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class _TimelinePulseNode extends StatefulWidget {
  final bool active;
  final int delay;
  const _TimelinePulseNode({required this.active, required this.delay});

  @override
  State<_TimelinePulseNode> createState() => _TimelinePulseNodeState();
}

class _TimelinePulseNodeState extends State<_TimelinePulseNode>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1800 + widget.delay * 140),
  )..repeat(reverse: true);

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (reduce) return _dot(0);
    return AnimatedBuilder(animation: c, builder: (_, __) => _dot(c.value));
  }

  Widget _dot(double t) {
    final glow = widget.active ? .18 + t * .24 : .06 + t * .08;
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.active ? Brand.rose : Brand.burgundy,
        border: Border.all(color: Brand.roseSoft.withOpacity(.5)),
        boxShadow: [BoxShadow(color: Brand.rose.withOpacity(glow), blurRadius: 7 + t * 12, spreadRadius: t * 2)],
      ),
    );
  }
}

