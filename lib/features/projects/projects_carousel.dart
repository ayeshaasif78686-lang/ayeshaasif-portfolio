import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import '../../features/projects/models/project_data.dart';
import '../../features/projects/project_card.dart';

class ProjectsCarousel extends StatefulWidget {
  final List<ProjectData> projects;
  const ProjectsCarousel({super.key, required this.projects});

  @override
  State<ProjectsCarousel> createState() => _ProjectsCarouselState();
}

class _ProjectsCarouselState extends State<ProjectsCarousel> {
  // Large starting index so the PageView can scroll "infinitely" in either
  // direction while we mod back into the real project list.
  static const int _initialPage = 6000;

  PageController? _controller;
  Timer? _timer;
  double _page = _initialPage.toDouble();
  bool _paused = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Read the screen width once to pick how much of the row one card should
    // occupy — this is what lets the neighbouring cards visibly "peek" in
    // from the sides, matching the reference animation.
    if (_controller == null) {
      final mobile = MediaQuery.of(context).size.width < 720;
      final viewportFraction = mobile ? 0.82 : 0.4;
      _controller = PageController(initialPage: _initialPage, viewportFraction: viewportFraction)
        ..addListener(() {
          final p = _controller?.page;
          if (p != null) setState(() => _page = p);
        });
      _startAutoplay();
    }
  }

  void _startAutoplay() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      final controller = _controller;
      if (_paused || controller == null || !controller.hasClients) return;
      final next = (controller.page ?? _page).round() + 1;
      controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 850),
        curve: Curves.easeInOutCubic, // ease-in-ease-out slide from the reference video
      );
    });
  }

  void _setPaused(bool value) => setState(() => _paused = value);

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) {
      // First frame: controller not built yet (needs MediaQuery from
      // didChangeDependencies), so reserve the space and skip a frame.
      return const SizedBox(height: 470);
    }

    return MouseRegion(
      onEnter: (_) => _setPaused(true),
      onExit: (_) => _setPaused(false),
      child: SizedBox(
        height: 470,
        child: NotificationListener<ScrollNotification>(
          onNotification: (n) {
            // Pause autoplay while the user is actively dragging the carousel.
            if (n is ScrollStartNotification) _setPaused(true);
            if (n is ScrollEndNotification) _setPaused(false);
            return false;
          },
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              final p = widget.projects[index % widget.projects.length];

              // Distance of this card from the centre of the viewport: 0
              // when perfectly focused, growing towards 1 as it slides away —
              // this drives the blur/scale/opacity, same as the depth-of-field
              // effect in the reference video.
              final distance = (index - _page).abs().clamp(0.0, 1.0);
              final scale = 1 - (distance * 0.16);
              final blur = distance * 2.5;
              final opacity = (1 - distance * 0.25).clamp(0.6, 1.0);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                      child: ProjectCard(
                        project: p,
                        featured: distance < 0.05,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

