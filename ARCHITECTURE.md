# Project Architecture

The original app shipped as a single 4,352-line `lib/main.dart`. It has been
refactored into a **feature-first, layered Flutter architecture** with the
exact same UI and behaviour — no visual or logic changes, only reorganized
code. Every widget, model, and helper class was extracted 1:1 from the
original file (see `main.dart.bak` note below if you want to diff).

## Folder structure

```
lib/
├── main.dart                     # App entry point only (runApp)
├── app/
│   ├── app.dart                  # MaterialApp + theme wiring (AyeshaPortfolioApp)
│   └── routes.dart                # Route name constants
├── core/                         # Shared, reusable, presentation-agnostic pieces
│   ├── theme/
│   │   └── app_theme.dart        # Brand colors/typography constants
│   └── widgets/                  # Generic building blocks used by 2+ features
│       ├── reveal.dart           # Scroll-in reveal animation wrapper
│       ├── shimmer_text.dart
│       ├── tilt_card.dart
│       ├── floaty.dart
│       ├── glass_panel.dart
│       ├── soft_button.dart
│       ├── pill.dart
│       ├── section_heading.dart
│       ├── responsive_layout.dart  # ResponsiveExpanded, SiteWidth
│       ├── ambient_background.dart
│       ├── satin_grid.dart
│       └── orbit_chip.dart
│   └── utils/
│       └── launch_url.dart       # Shared `launch(url)` helper (opens links/mail/tel)
├── features/                     # One folder per portfolio section
│   ├── navigation/site_nav.dart
│   ├── hero/
│   │   ├── hero_section.dart
│   │   └── orbital_avatar.dart
│   ├── about/about_section.dart
│   ├── skills/
│   │   ├── models/skill_brand.dart
│   │   └── skills_section.dart
│   ├── experience/
│   │   ├── models/experience_item.dart
│   │   └── experience_section.dart
│   ├── projects/
│   │   ├── models/project_data.dart
│   │   ├── projects_section.dart
│   │   ├── projects_carousel.dart
│   │   ├── project_card.dart
│   │   └── case_study_section.dart
│   ├── certificates/
│   │   ├── models/certificate_data.dart
│   │   └── certificates_section.dart
│   ├── journey/journey_section.dart
│   ├── services_offered/services_section.dart
│   ├── focus/focus_section.dart
│   ├── contact/
│   │   ├── contact_section.dart
│   │   └── contact_form_section.dart
│   └── footer/footer_section.dart
├── page/
│   └── portfolio_page.dart       # Assembles all sections into the scrolling page
├── resume_downloader.dart        # Conditional export (web vs stub)
├── resume_downloader_web.dart
├── resume_downloader_stub.dart
├── services/                     # (empty placeholder removed — was dead code)
└── assets/                       # images, certificates, resume PDF
```

## Why this structure

- **`core/`** holds anything reused by 2+ sections (buttons, cards, layout
  helpers, theme). Change a color or animation once, it updates everywhere.
- **`features/`** holds one folder per portfolio section (Hero, About,
  Skills, Experience, Projects, Certificates, Journey, Services, Focus,
  Contact, Footer). Each section's widgets, private helper widgets, and data
  models live together, so a developer can open one folder to work on one
  part of the site without touching anything else.
- **`models/`** subfolders (inside `skills/`, `experience/`, `projects/`,
  `certificates/`) hold the plain data classes (`ProjectData`,
  `ExperienceItem`, etc.) separately from the widgets that render them.
- **`page/portfolio_page.dart`** is the only file that imports every
  section and lays them out in order — this is the single place to
  reorder, add, or remove a section.
- **`app/app.dart`** is the only place that wires up `MaterialApp` and the
  global theme.
- Two previously-private helper widgets (`OrbitChip`, used by both the Hero
  and Contact sections, and the skill data model) were made public since
  they're now shared across files — everything else keeps its original
  visibility.

## Build fixes applied (v2)

The first split accidentally trapped two things inside the wrong file
boundaries, which caused compile errors:

- A stray top-level `launch(String url)` helper had landed at the bottom of
  `soft_button.dart` instead of being its own shared utility. It's now
  `core/utils/launch_url.dart`, imported by every section that opens a link,
  email, or phone number (Hero, Projects, Contact).
- `soft_button.dart`, `tilt_card.dart`, and `skills_section.dart` use
  `PointerHoverEvent` / `PointerEvent` for hover/drag tracking, which needs
  `package:flutter/gestures.dart` — that import was missing and has been
  added.

Both were verified by parsing every generated file and confirming every
referenced class/function has a matching import, and that every `{`/`}` in
every file balances.

## Build fixes applied (v2)

The first split accidentally trapped two things inside the wrong file
boundaries, which caused compile errors:

- A stray top-level `launch(String url)` helper had landed at the bottom of
  `soft_button.dart` instead of being its own shared utility. It's now
  `core/utils/launch_url.dart`, imported by every section that opens a link,
  email, or phone number (Hero, Projects, Contact).
- `soft_button.dart`, `tilt_card.dart`, and `skills_section.dart` use
  `PointerHoverEvent` / `PointerEvent` for hover/drag tracking, which needs
  `package:flutter/gestures.dart` — that import was missing and has been
  added.

Both were verified by parsing every generated file and confirming every
referenced class/function has a matching import, and that every `{`/`}` in
every file balances.

## Build fixes applied (v3)

- **Ambiguous import fixed**: `package:url_launcher` itself still exports a
  deprecated top-level `launch()` function for backwards compatibility. Our
  own `core/utils/launch_url.dart` also defined a function called `launch`,
  so any file importing both (like `contact_form_section.dart`, which needs
  `launchUrl`/`canLaunchUrl` directly for the mailto send button) hit an
  "is imported from both ... and ..." ambiguous-import error. The helper
  was renamed to **`openLink`** everywhere (Hero, Projects, Contact) — no
  more collision, regardless of what else a file imports.
- **Added `test/widget_test.dart`**: the previous zip had no test folder,
  so IDEs auto-generated Flutter's default counter-app template, which
  referenced a `MyApp` class that doesn't exist in this project — hence the
  compile error in `test/widget_test.dart`. A correct smoke test that
  builds `AyeshaPortfolioApp` and checks it renders is now included.

## What was NOT changed

- No UI, animation, copy, or business logic was altered.
- `pubspec.yaml`, assets, and platform folders (`android/`, `linux/`) are
  untouched.
- `services/resume_service.dart` (an empty, unused stub with a no-op
  `download()` method) was removed as dead code — it was never referenced
  anywhere in the app; the real resume download logic lives in
  `resume_downloader*.dart`, which is preserved as-is.

## Next steps for a developer

1. `flutter pub get`
2. `flutter run -d chrome` (or your platform of choice)
3. To edit a section, go to `lib/features/<section>/`.
4. To change a shared component (button, card, colors), go to `lib/core/`.
