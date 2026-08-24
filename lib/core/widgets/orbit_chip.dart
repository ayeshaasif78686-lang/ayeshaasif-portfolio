import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class OrbitChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const OrbitChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Brand.ink.withOpacity(.84),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Brand.rose.withOpacity(.34)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.28), blurRadius: 14)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Brand.rose, size: 13),
          const SizedBox(width: 5),
          Text(label, style: GoogleFonts.spaceMono(color: Brand.cream, fontSize: 8.5, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

