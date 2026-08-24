import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/launch_url.dart';
import '../../core/widgets/pill.dart';
import '../../core/widgets/tilt_card.dart';
import '../../features/projects/models/project_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectCard extends StatefulWidget {
  final ProjectData project;
  final bool featured;
  const ProjectCard({super.key, required this.project, this.featured = false});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: TiltCard(
        maxTilt: 4,
        hoverScale: 1.03,
        child: AnimatedContainer(
          width: double.infinity,
          duration: const Duration(milliseconds: 220),
          decoration: BoxDecoration(
            color: Brand.surface(.85),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: hover ? Brand.rose.withOpacity(.35) : Brand.roseSoft.withOpacity(.11)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 215,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Solid dark backdrop so BoxFit.contain never leaves a
                      // hard/odd edge — matches the near-black background the
                      // project mockups already use, so it blends seamlessly.
                      Container(color: Brand.ink),
                      AnimatedScale(
                        duration: const Duration(milliseconds: 450),
                        scale: hover ? 1.045 : 1,
                        child: Image.asset(
                          p.image,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0xBB090609)],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        left: 14,
                        child: Pill(p.category),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p.title, style: GoogleFonts.spaceGrotesk(color: Brand.cream, fontSize: 20, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 9),
                        Text(p.body, maxLines: 3, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(color: Brand.muted, fontSize: 12.5, height: 1.55)),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(child: Wrap(spacing: 6, runSpacing: 6, children: p.tags.take(2).map(Pill.new).toList())),
                            IconButton(
                              onPressed: () => openLink(p.github),
                              icon: const Icon(Icons.arrow_outward_rounded, color: Brand.roseSoft),
                            )
                          ],
                        )
                      ],
                    ),
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

