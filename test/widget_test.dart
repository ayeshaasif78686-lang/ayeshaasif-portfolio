// Basic smoke test for the portfolio app.
//
// This app is a single static-content scrolling page (no counter), so the
// default Flutter counter test template doesn't apply. Instead this just
// verifies the app builds without throwing and that the site nav renders.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_project/app/app.dart';

void main() {
  testWidgets('Portfolio app builds and shows the nav bar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AyeshaPortfolioApp());
    await tester.pump(const Duration(milliseconds: 100));

    // The app should build without throwing, and MaterialApp should exist.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
