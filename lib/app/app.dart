import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../page/portfolio_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AyeshaPortfolioApp extends StatelessWidget {
  const AyeshaPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayesha Asif — AI • Data • Software',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Brand.ink,
        colorScheme: const ColorScheme.dark(
          primary: Brand.rose,
          secondary: Brand.roseSoft,
          surface: Brand.wine,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}

