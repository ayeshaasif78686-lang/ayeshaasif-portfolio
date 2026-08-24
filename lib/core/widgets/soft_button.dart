import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class SoftButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool compact;
  final bool secondary;
  final IconData? icon;

  const SoftButton({
    super.key,
    required this.label,
    required this.onTap,
    this.compact = false,
    this.secondary = false,
    this.icon,
  });

  @override
  State<SoftButton> createState() => _SoftButtonState();
}

class _SoftButtonState extends State<SoftButton> {
  bool hover = false;
  double mx = 0;
  double my = 0;

  void _magnet(PointerHoverEvent e) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final local = box.globalToLocal(e.position);
    final nx = (local.dx / box.size.width - .5) * 2;
    final ny = (local.dy / box.size.height - .5) * 2;
    setState(() {
      hover = true;
      mx = nx * 5.5;
      my = ny * 3.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onHover: reduce ? null : _magnet,
      onExit: (_) => setState(() {
        hover = false;
        mx = 0;
        my = 0;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 16 : 22,
            vertical: widget.compact ? 11 : 15,
          ),
          decoration: BoxDecoration(
            color: widget.secondary
                ? Brand.surface(.88)
                : (hover ? const Color(0xFF922B50) : Brand.rose),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: widget.secondary ? Brand.roseSoft.withOpacity(.2) : Colors.transparent,
            ),
            boxShadow: widget.secondary
                ? const []
                : [
                    BoxShadow(
                      color: Brand.rose.withOpacity(hover ? .24 : .13),
                      blurRadius: hover ? 24 : 15,
                      offset: const Offset(0, 8),
                    )
                  ],
          ),
          transform: Matrix4.translationValues(mx, (hover ? -2 : 0) + my, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  color: Brand.cream,
                  fontSize: widget.compact ? 12 : 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 9),
              Icon(widget.icon ?? Icons.arrow_outward_rounded,
                  size: 17, color: Brand.cream),
            ],
          ),
        ),
      ),
    );
  }
}


