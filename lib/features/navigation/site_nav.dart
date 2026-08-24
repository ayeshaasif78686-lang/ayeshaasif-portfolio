import 'package:flutter/material.dart';
import 'dart:ui';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/soft_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SiteNav extends StatelessWidget {
  final List<String> labels;
  final int active;
  final ValueChanged<int> onTap;

  const SiteNav({
    super.key,
    required this.labels,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final mobile = w < 760;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(mobile ? 14 : 30, 14, mobile ? 14 : 30, 0),
        child: Center(
          heightFactor: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1220),
                height: mobile ? 62 : 70,
                padding: EdgeInsets.symmetric(horizontal: mobile ? 12 : 18),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A0709).withOpacity(.83),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Brand.roseSoft.withOpacity(.13)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.38),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _NavLogo(size: mobile ? 40 : 48),
                    if (!mobile) ...[
                      const SizedBox(width: 10),
                      Text(
                        'AYESHA ASIF',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.4,
                          fontSize: 12,
                          color: Brand.cream,
                        ),
                      ),
                      const Spacer(),
                      ...List.generate(
                        labels.length,
                        (i) => i == 6 || i == 7
                            ? const SizedBox.shrink()
                            : _NavText(
                                label: labels[i],
                                active: active == i,
                                onTap: () => onTap(i),
                              ),
                      ),
                      const SizedBox(width: 10),
                      SoftButton(label: "Let's talk", onTap: () => onTap(8), compact: true),
                    ] else ...[
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.menu_rounded, color: Brand.cream),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          backgroundColor: const Color(0xFF0F090C),
                          showDragHandle: true,
                          builder: (sheetContext) => SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                              child: Wrap(
                                runSpacing: 8,
                                children: List.generate(
                                  labels.length,
                                  (i) => ListTile(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                    tileColor: active == i ? Brand.burgundy.withOpacity(.7) : null,
                                    title: Text(labels[i], style: GoogleFonts.inter(color: Brand.cream)),
                                    trailing: Icon(Icons.north_east_rounded,
                                        size: 18,
                                        color: active == i ? Brand.rose : Brand.muted),
                                    onTap: () {
                                      Navigator.pop(sheetContext);
                                      onTap(i);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLogo extends StatefulWidget {
  final double size;
  const _NavLogo({required this.size});

  @override
  State<_NavLogo> createState() => _NavLogoState();
}

class _NavLogoState extends State<_NavLogo> {
  bool _hover = false;
  bool _mounted = false;

  @override
  void initState() {
    super.initState();
    // Small delay so the logo gently pops in after the nav bar itself settles.
    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) setState(() => _mounted = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: _mounted ? 1 : 0),
        duration: reduce ? Duration.zero : const Duration(milliseconds: 650),
        curve: Curves.easeOutBack,
        builder: (context, entrance, child) {
          final hoverScale = _hover ? 1.08 : 1.0;
          return Opacity(
            opacity: entrance.clamp(0, 1),
            child: Transform.scale(
              scale: (.6 + entrance * .4) * hoverScale,
              child: Transform.rotate(
                angle: _hover ? .05 : 0,
                child: child,
              ),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: _hover
                ? [BoxShadow(color: Brand.rose.withOpacity(.35), blurRadius: 18, spreadRadius: 1)]
                : const [],
          ),
          child: Image.asset('lib/assets/images/logo_mark.png', width: widget.size),
        ),
      ),
    );
  }
}

class _NavText extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _NavText({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 180),
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          color: active ? Brand.rose : Brand.muted,
        ),
        child: Text(label),
      ),
    );
  }
}

