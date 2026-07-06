# BU Gateway — Detailed Project Structure

This document explains the folder structure of the BU Gateway Flutter project in depth. Understanding this structure is essential for all contributors.

---

## Top-Level Overview
```
lib/
├── main.dart                        # Entry point — runs the app
├── app.dart                         # Root MaterialApp widget, theme, routing
│
├── constants/                       # App-wide constants (never hardcode values!)
│   ├── colors.dart                  # BU brand colours (primary, secondary, etc.)
│   ├── links.dart                   # Raw link data → mapped into LinkModel list
│   ├── strings.dart                 # Text labels, nested per screen (AppStrings.home, etc.)
│   ├── sizes.dart                   # NEW — spacing, padding, radius constants
│   └── theme.dart                   # ThemeData configuration
│
├── models/                          # NEW — plain data classes
│   └── link_model.dart              # NEW — { label, url, category, icon }
│
├── screens/                         # Full-page views (one file per screen)
│   ├── splash/
│   │   └── splash_screen.dart       # App launch screen with BU logo
│   ├── home/
│   │   ├── home_screen.dart         # Scaffold + state wiring only
│   │   └── home_body.dart           # NEW — actual layout, kept out of screen file
│   ├── links/
│   │   ├── links_screen.dart        # Scaffold + state wiring only
│   │   └── links_body.dart          # NEW — categorised list layout
│   └── downloads/
│       └── downloads_screen.dart    # Static APK/IPA links, no provider needed
│
├── widgets/                         # Reusable UI components
│   ├── link_card.dart               # Accepts LinkModel?; null = skeleton state
│   ├── category_header.dart         # Section header (e.g. "Finance", "Library")
│   ├── bu_app_bar.dart              # Shared app bar with BU branding
│   ├── loading_view.dart            # NEW — shared loading state widget
│   └── error_view.dart              # NEW — shared error state widget
│
├── providers/                       # Riverpod state providers
│   └── links_provider.dart          # AsyncNotifierProvider<List<LinkModel>> (future-proofed for remote config)
│
└── utils/                           # NEW — small shared helpers
    └── launch_url.dart              # NEW — url_launcher wrapper with error handlingvides list of university links
```
---

## `constants/links.dart` — URL Registry

All university URLs are defined as constants in `links.dart`. **Never hardcode a URL anywhere else in the app.** Always import from this file.

Example structure:
```dart
class UniversityLinks {
  static const String officialWebsite = 'https://bugemauniv.ac.ug/';
  static const String studentPortal = 'https://erms.bugemauniv.ac.ug/student/login/';
  static const String staffPortal = 'https://erms.bugemauniv.ac.ug/staff/login/';
  // ...
}
```

---

## `screens/` vs `widgets/`

| | `screens/` | `widgets/` |
|---|---|---|
| **What** | Full pages | Small reusable components |
| **Navigation** | Pushed via router | Included inside screens |
| **Examples** | `HomeScreen`, `LinksScreen` | `LinkCard`, `BuAppBar` |
| **Rule** | One screen per file | One widget per file |

---

## `.github/` — Repository Configuration

```
.github/
├── ISSUE_TEMPLATE/
│   ├── bug_report.yml          # Bug report form
│   └── feature_request.yml     # Feature request form
├── workflows/
│   └── flutter_ci.yml          # CI: analyze, test, build on every PR
└── PULL_REQUEST_TEMPLATE.md    # Checklist shown when opening a PR
```

---

## `docs/` — Documentation

```
docs/
├── assets/
│   ├── bu_logo_placeholder.png # University logo (replace with official)
│   └── screenshots/            # App screenshots for README
└── PROJECT_STRUCTURE.md        # This file
```

---

## Key Files Explained

### `pubspec.yaml`
The project's configuration file. Defines:
- App name, version, description
- Flutter SDK constraints
- Dependencies (packages you install)
- Assets (images, fonts)

When you add a new package:
```bash
flutter pub add <package_name>
# This updates pubspec.yaml and pubspec.lock automatically
```

### `pubspec.lock`
Auto-generated. Records exact versions of all dependencies. **Always commit this file** — it ensures everyone on the team uses the same package versions.

### `main.dart`
The app entry point:
```dart
void main() {
  runApp(const ProviderScope(child: BuGatewayApp()));
}
```
Keep this file minimal. All configuration goes in `app.dart`.

---

## Naming Conventions

| Element | Convention | Example |
|---|---|---|
| Files | `snake_case` | `home_screen.dart` |
| Classes | `PascalCase` | `HomeScreen` |
| Variables | `camelCase` | `universityLinks` |
| Constants | `kCamelCase` | `kPrimaryColor` |
| Private members | `_camelCase` | `_isLoading` |

---

## Adding a New Screen (Step by Step)

1. Create `lib/screens/my_feature/my_feature_screen.dart`
2. Define your `StatelessWidget` or `StatefulWidget` class
3. Add a route in `app.dart`
4. Add a navigation call from wherever you need to open it
5. Write a widget test in `test/screens/my_feature_screen_test.dart`

---

*For questions about the structure, open a GitHub Discussion or ask your instructor.*
