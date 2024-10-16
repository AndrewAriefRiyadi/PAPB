import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const TextStyle large = TextStyle(
    fontFamily: 'Coolvetica',
    fontSize: 32,
  );

  static const TextStyle largeShadow = TextStyle(
      fontFamily: 'Coolvetica',
      fontSize: 32,
      shadows: [
        Shadow(
            color: Color.fromARGB(40, 0, 0, 0),
            offset: Offset(0, 4),
            blurRadius: 4)
      ]);

  static const TextStyle medium = TextStyle(
    fontFamily: 'Coolvetica',
    fontSize: 24,
  );

  static const TextStyle small = TextStyle(
    fontFamily: 'Coolvetica',
    fontSize: 18,
  );

  static TextStyle body = GoogleFonts.barlow(
    fontSize: 16,
  );

  static TextStyle bodySmall = GoogleFonts.barlow(
    fontSize: 12,
  );
}
