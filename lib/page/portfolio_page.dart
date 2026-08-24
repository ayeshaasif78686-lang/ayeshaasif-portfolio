import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/ambient_background.dart';
import '../features/about/about_section.dart';
import '../features/certificates/certificates_section.dart';
import '../features/contact/contact_form_section.dart';
import '../features/contact/contact_section.dart';
import '../features/experience/experience_section.dart';
import '../features/focus/focus_section.dart';
import '../features/footer/footer_section.dart';
import '../features/hero/hero_section.dart';
import '../features/journey/journey_section.dart';
import '../features/navigation/site_nav.dart';
import '../features/projects/case_study_section.dart';
import '../features/projects/projects_section.dart';
import '../features/services_offered/services_section.dart';
import '../features/skills/skills_section.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final scroll = ScrollController();
  final keys = List.generate(9, (_) => GlobalKey());
  int active = 0;
  bool showIntro = true;

  final labels = const [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Certificates',
    'Journey',
    'Services',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    scroll.addListener(_trackSection);
    Future.delayed(const Duration(milliseconds: 2050), () {
      if (mounted) setState(() => showIntro = false);
    });
  }

  void _trackSection() {
    final viewportTop = 150.0;
    int found = active;
    for (var i = 0; i < keys.length; i++) {
      final ctx = keys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final y = box.localToGlobal(Offset.zero).dy;
      if (y <= viewportTop) found = i;
    }
    if (found != active && mounted) setState(() => active = found);
  }

  Future<void> go(int i) async {
    final ctx = keys[i].currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 850),
      curve: Curves.easeInOutCubic,
      alignment: .02,
    );
  }

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AmbientBackground()),
          SingleChildScrollView(
            controller: scroll,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                KeyedSubtree(key: keys[0], child: HeroSection(onExplore: () => go(4))),
                KeyedSubtree(key: keys[1], child: const AboutSection()),
                KeyedSubtree(key: keys[2], child: const SkillsSection()),
                KeyedSubtree(key: keys[3], child: const ExperienceSection()),
                KeyedSubtree(key: keys[4], child: const ProjectsSection()),
                const CaseStudySection(),
                KeyedSubtree(key: keys[5], child: const CertificatesSection()),
                KeyedSubtree(key: keys[6], child: const JourneySection()),
                KeyedSubtree(key: keys[7], child: const ServicesSection()),
                const FocusSection(),
                const ContactSection(),
                KeyedSubtree(key: keys[8], child: PortfolioContactFormSection()),
                const FooterSection(),
              ],
            ),
          ),
          SiteNav(labels: labels, active: active, onTap: go),
          Positioned(
            right: 10,
            top: 110,
            bottom: 36,
            child: _ScrollProgressRail(controller: scroll),
          ),
          IgnorePointer(
            ignoring: !showIntro,
            child: AnimatedOpacity(
              opacity: showIntro ? 1 : 0,
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutCubic,
              child: const _CinematicLoader(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CinematicLoader extends StatefulWidget {
  const _CinematicLoader();

  @override
  State<_CinematicLoader> createState() => _CinematicLoaderState();
}

class _CinematicLoaderState extends State<_CinematicLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1750),
  )..forward();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return ColoredBox(
      color: Brand.ink,
      child: Center(
        child: AnimatedBuilder(
          animation: c,
          builder: (_, __) {
            final t = reduce ? 1.0 : c.value;
            final eased = Curves.easeInOutCubic.transform(t);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: .82 + eased * .18,
                  child: Opacity(
                    opacity: .35 + eased * .65,
                    child: Image.asset('lib/assets/images/logo_mark.png', width: 76, height: 76),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'AYESHA ASIF',
                  style: GoogleFonts.spaceMono(
                    color: Brand.cream,
                    fontSize: 12,
                    letterSpacing: 5.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 190,
                  child: Stack(
                    children: [
                      Container(height: 1, color: Brand.line),
                      FractionallySizedBox(
                        widthFactor: eased,
                        child: Container(
                          height: 1.5,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [Brand.burgundy, Brand.rose, Brand.roseSoft]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'CODE  •  DATA  •  AI',
                  style: GoogleFonts.spaceMono(color: Brand.roseSoft, fontSize: 8.5, letterSpacing: 2.4),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ScrollProgressRail extends StatelessWidget {
  final ScrollController controller;
  const _ScrollProgressRail({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        double progress = 0;
        if (controller.hasClients && controller.position.hasContentDimensions && controller.position.maxScrollExtent > 0) {
          progress = (controller.offset / controller.position.maxScrollExtent).clamp(0.0, 1.0);
        }
        return IgnorePointer(
          child: SizedBox(
            width: 4,
            child: Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor: progress,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Brand.rose, Brand.roseSoft],
                    ),
                    boxShadow: [BoxShadow(color: Brand.rose.withOpacity(.35), blurRadius: 8)],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

