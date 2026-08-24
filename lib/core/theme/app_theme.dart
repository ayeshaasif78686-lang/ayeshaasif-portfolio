import 'package:flutter/material.dart';

class Brand {
  // Palette restored from Ayesha's original portfolio reference:
  // burgundy wash on the left, near-black on the right, vivid rose accent.
  static const ink = Color(0xFF030304);
  static const inkSoft = Color(0xFF080507);
  static const wine = Color(0xFF17080E);
  static const burgundy = Color(0xFF4A1325);
  static const burgundyDeep = Color(0xFF2A0916);
  static const plum = Color(0xFF641A35);
  static const rose = Color(0xFFF64081);
  static const roseSoft = Color(0xFFE49AB6);
  static const violet = Color(0xFF9E57C9);
  static const cream = Color(0xFFF8F2F5);
  static const muted = Color(0xFFBDAEB5);
  static const line = Color(0xFF3A1C28);

  static Color surface([double opacity = 0.72]) =>
      const Color(0xFF11090D).withOpacity(opacity);
}

