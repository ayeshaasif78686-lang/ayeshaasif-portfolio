import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Pill extends StatelessWidget {
  final String text;
  const Pill(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: Brand.burgundy.withOpacity(.45),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Brand.roseSoft.withOpacity(.1)),
      ),
      child: Text(text, style: GoogleFonts.inter(color: Brand.roseSoft, fontSize: 11)),
    );
  }
}

