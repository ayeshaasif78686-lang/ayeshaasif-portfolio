import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section_heading.dart';
import '../../features/projects/models/project_data.dart';
import '../../features/projects/projects_carousel.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const projects = [
    ProjectData('Shaheen Mobile Stores', 'Full-stack MERN', 'lib/assets/images/shaheen_mobile_store.png', 'Full-stack e-commerce platform with product listing, search and a fully responsive UI, built on the MERN stack.', ['MERN', 'Node.js', 'Responsive UI'], 'https://github.com/ayeshaasif50'),
    ProjectData('Heart Disease Prediction', 'Machine learning', 'lib/assets/images/heart_disease.png', 'Classification model built with Scikit-learn, covering preprocessing, feature scaling and evaluation for early heart-disease risk detection.', ['Python', 'Scikit-learn', 'ML'], 'https://github.com/ayeshaasif50/heart-disease'),
    ProjectData('Breast Cancer Prediction', 'Machine learning', 'lib/assets/images/breast_cancer.png', 'Classification model built with Scikit-learn, including preprocessing and feature scaling, to predict breast-cancer risk from patient data.', ['Python', 'Scikit-learn', 'ML'], 'https://github.com/ayeshaasif50'),
    ProjectData('Student Marks Prediction', 'Regression', 'lib/assets/images/student_marks.png', 'Regression model built to explore and predict students\u2019 academic performance from structured data.', ['Python', 'Regression', 'Pandas'], 'https://github.com/ayeshaasif50'),
    ProjectData('Coffee Shop App', 'Flutter mobile', 'lib/assets/images/coffee_shop.png', 'UI-based Flutter mobile app featuring menu displays, navigation and cart functionality for a seamless ordering experience.', ['Flutter', 'Dart', 'Mobile UX'], 'https://github.com/ayeshaasif50/coffee-shop'),
    ProjectData('Legal Lens', 'AI + Flutter', 'lib/assets/images/legal_lens.png', 'AI-powered legal assistant in Flutter that simplifies legal documents and answers queries in plain, easy-to-understand language.', ['AI', 'Flutter', 'Dart'], 'https://github.com/ayeshaasif50'),
    ProjectData('PhishShield', 'Flutter + Blockchain', 'lib/assets/images/phishshield.png', 'Phishing-detection app that scans URLs and QR codes using machine learning, pairing Flutter with blockchain for extra security.', ['Flutter', 'Blockchain', 'ML'], 'https://github.com/ayeshaasif50'),
    ProjectData('Pet E-commerce App', 'Flutter mobile', 'lib/assets/images/pet_app.png', 'Cat-products e-commerce mobile app with product browsing, cart and checkout functionality, built end-to-end in Flutter.', ['Flutter', 'Dart', 'E-commerce'], 'https://github.com/ayeshaasif50'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Brand.wine.withOpacity(.16),
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: SiteWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Reveal(
              delay: Duration.zero,
              from: const Offset(0, 30),
              startScale: 1,
              child: const SectionHeading(
                kicker: '04 • Projects',
                title: 'Real products, built end to end.',
                body: 'A curated selection of full-stack, mobile and machine-learning projects — each one taken from concept to a working, deployed experience.',
              ),
            ),
            const SizedBox(height: 40),
            Reveal(
              delay: const Duration(milliseconds: 120),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutCubic,
              from: const Offset(0, 50),
              child: ProjectsCarousel(projects: projects),
            ),
          ],
        ),
      ),
    );
  }
}

/// Center-focus carousel: the card nearest the middle scales up and stays
/// sharp, side cards blur/shrink slightly, and the whole set auto-advances
/// with an ease-in-ease-out slide, looping continuously.
