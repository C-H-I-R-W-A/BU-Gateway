<div align="center">

<img src="docs/assets/bu_logo_placeholder.png" alt="Bugema University Logo" width="120" />

# 🎓 BU Gateway

**The official student & staff companion app for Bugema University**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-000000?logo=vercel)](https://vercel.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![GitHub Issues](https://img.shields.io/github/issues/IT-SUPPORT-BU/BU-Gateway)](https://github.com/IT-SUPPORT-BU/BU-Gateway/issues)

*Available on Android · iOS · Web*

</div>

---

## 📖 About

**BU Gateway** is an open-source, cross-platform mobile and web application built for students, staff, and faculty at [Bugema University](https://bugemauniv.ac.ug/). It provides a single, beautiful entry point to all official university digital platforms — from the student portal and e-learning to payments and the library.

This project is also a **learning experience** — built collaboratively by the IT Support team at Bugema University as a stepping stone into professional software development practices.

---

## ✨ Features (MVP)

- 🏫 University branding — name, logo, and official colours
- 🔗 Quick links to all official university platforms
- 📱 Downloadable APK (Android) and IPA (iOS) from the web app
- 🌐 Fully functional web version hosted on Vercel
- 🎨 Clean, responsive UI built with Flutter

---

## 🛠️ Tech Stack

| Layer | Technology | Why |
|---|---|---|
| **Framework** | [Flutter 3.x](https://flutter.dev) | Single codebase → Android, iOS & Web |
| **Language** | [Dart 3.x](https://dart.dev) | Modern, type-safe, easy to learn |
| **State Management** | [Riverpod](https://riverpod.dev) | Scalable, testable state management |
| **Web Hosting** | [Vercel](https://vercel.com) | Free, fast, CI/CD built-in |
| **Custom Domain** | CNAME → `*.bugemauniv.ac.ug` | University sub-domain (pending Sys Admin) |
| **App Distribution** | Hosted on web app | APK & IPA downloadable from web |
| **Version Control** | Git + GitHub | Collaborative, open-source workflow |
| **CI/CD** | GitHub Actions | Auto-build checks on every PR |

### Why Flutter?

> Flutter lets us write **one codebase** and deploy to Android, iPhone, and the web simultaneously. It is backed by Google, fully open-source, and has excellent documentation — making it ideal for a student team learning cross-platform development.

---

## 📁 Project Structure

```
BU-Gateway/
│
├── .github/                        # GitHub configuration
│   ├── ISSUE_TEMPLATE/             # Templates for bug reports & features
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   ├── workflows/                  # GitHub Actions CI/CD pipelines
│   │   └── flutter_ci.yml
│   └── PULL_REQUEST_TEMPLATE.md    # PR checklist for contributors
│
├── docs/                           # Project documentation
│   ├── assets/                     # Docs images (logo, screenshots)
│   └── PROJECT_STRUCTURE.md        # Detailed architecture guide
│
├── lib/                            # Flutter app source code
│   ├── main.dart                   # App entry point
│   ├── app.dart                    # Root widget & theme
│   ├── constants/                  # App-wide constants
│   │   ├── colors.dart             # BU brand colours
│   │   ├── links.dart              # All university URLs
│   │   └── strings.dart            # App text & labels
│   ├── screens/                    # Full-page UI screens
│   │   ├── home/
│   │   ├── links/
│   │   └── downloads/
│   ├── widgets/                    # Reusable UI components
│   └── providers/                  # Riverpod state providers
│
├── android/                        # Android-specific configuration
├── ios/                            # iOS-specific configuration
├── web/                            # Web-specific configuration
├── test/                           # Unit & widget tests
│
├── pubspec.yaml                    # Flutter dependencies
├── README.md                       # You are here 👋
├── CONTRIBUTING.md                 # How to contribute
├── CODE_OF_CONDUCT.md              # Community standards
└── LICENSE                         # MIT License
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

| Tool | Version | Install |
|---|---|---|
| Flutter SDK | ≥ 3.0.0 | [flutter.dev/docs/get-started](https://docs.flutter.dev/get-started/install) |
| Dart SDK | ≥ 3.0.0 | Included with Flutter |
| Git | Latest | [git-scm.com](https://git-scm.com/) |
| VS Code or Android Studio | Latest | Recommended IDEs |

Verify your Flutter installation:

```bash
flutter doctor
```

All items should show ✅ (or ⚠️ for optional tools).

---

### 📥 Cloning the Project

**Step 1 — Fork the repository** *(first-time contributors)*

Click the **Fork** button at the top-right of this page to create your own copy.

**Step 2 — Clone your fork locally**

```bash
git clone https://github.com/<YOUR-USERNAME>/BU-Gateway.git
cd BU-Gateway
```

> Replace `<YOUR-USERNAME>` with your GitHub username.

**Step 3 — Add the upstream remote** *(to stay in sync with the main project)*

```bash
git remote add upstream https://github.com/IT-SUPPORT-BU/BU-Gateway.git
```

**Step 4 — Install Flutter dependencies**

```bash
flutter pub get
```

**Step 5 — Run the app**

```bash
# Run on Chrome (web)
flutter run -d chrome

# Run on Android emulator
flutter run -d android

# Run on iOS simulator (macOS only)
flutter run -d ios
```

---

## 🌿 Branch Strategy

We follow a structured branching model to keep the codebase clean and professional:

```
main                    ← 🔒 Protected. Production-ready code only.
│
├── develop             ← 🔄 Integration branch. All features merge here first.
│
├── it-support          ← 🛠️  IT Support team's shared working branch.
│
└── feature/            ← 🌿 Individual feature branches (one per issue).
    ├── feature/1-flutter-init
    ├── feature/2-splash-screen
    └── feature/5-quick-links
```

### Branch Rules

| Branch | Direct Push | Description |
|---|---|---|
| `main` | ❌ **Blocked** | Only merged via reviewed PR |
| `develop` | ❌ **Blocked** | Only merged via PR from feature branches |
| `it-support` | ✅ Allowed | Team working branch |
| `feature/*` | ✅ Allowed | Your personal working branch |

---

## 🤝 Contributing

We love contributions! Please read our **[CONTRIBUTING.md](CONTRIBUTING.md)** guide before getting started.

### Quick Workflow

```bash
# 1. Sync with the latest upstream changes
git fetch upstream
git checkout develop
git merge upstream/develop

# 2. Create your feature branch (use the issue number!)
git checkout -b feature/5-quick-links

# 3. Make your changes, then commit
git add .
git commit -m "feat(links): add university quick links screen (#5)"

# 4. Push your branch
git push origin feature/5-quick-links

# 5. Open a Pull Request → target: develop
```

### Commit Message Format

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short description> (#issue-number)

Types: feat | fix | docs | style | refactor | test | chore
```

**Examples:**
```
feat(home): add BU logo to splash screen (#2)
fix(links): correct payment portal URL (#5)
docs(readme): update setup instructions (#8)
```

---

## 🌐 Web Deployment

The web version is deployed automatically to **Vercel** on every merge to `main`.

- **Vercel URL**: `https://bu-gateway.vercel.app` *(auto-generated)*
- **Production Domain**: `*.bugemauniv.ac.ug` *(CNAME pending System Admin)*

To build the web version locally:

```bash
flutter build web --release
```

Output will be in `build/web/`.

---

## 📲 App Downloads

The compiled Android APK and iOS IPA files will be hosted and downloadable directly from the web app.

| Platform | Format | Status |
|---|---|---|
| Android | `.apk` | 🔜 Coming soon |
| iPhone (iOS) | `.ipa` | 🔜 Coming soon |

---

## 🔗 University Links

| Category | Platform | URL |
|---|---|---|
| 🏫 Primary | Official University Website | [bugemauniv.ac.ug](https://bugemauniv.ac.ug/) |
| 🎓 Academic | Student Portal (ERMS) | [erms.bugemauniv.ac.ug/student](https://erms.bugemauniv.ac.ug/student/login/) |
| 👨‍🏫 Staff | Staff Portal (ERMS) | [erms.bugemauniv.ac.ug/staff](https://erms.bugemauniv.ac.ug/staff/login/) |
| 📚 Learning | E-Learning (ODeL) | [elearning.bugemauniv.ac.ug](https://elearning.bugemauniv.ac.ug/) |
| 💳 Finance | Online Payments | [payments.bugemauniv.ac.ug](https://payments.bugemauniv.ac.ug/payments/) |
| 🧾 Finance | Payment Status Tracker | [payments.bugemauniv.ac.ug/status](https://payments.bugemauniv.ac.ug/payments/status/) |
| 📖 Library | Main E-Library Portal | [lib.bugemauniv.ac.ug](http://lib.bugemauniv.ac.ug) |
| 🔍 Library | Library Catalog (Koha OPAC) | [koha.bugemauniv.ac.ug](https://koha.bugemauniv.ac.ug) |
| 🗄️ Research | Institutional Repository (BUIR) | [buir.bugemauniv.ac.ug](https://buir.bugemauniv.ac.ug/xmlui/) |
| 📰 Research | Scholarly Journals (OJS) | [journal.bugemauniv.ac.ug](https://journal.bugemauniv.ac.ug/) |

---

## 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

Built with ❤️ by the **IT Support team at Bugema University**.

Special thanks to all student contributors who are learning and growing through this project.

---

<div align="center">

**[Bugema University](https://bugemauniv.ac.ug/) · Kampala–Gulu Road, Bugema, Uganda**

*"Excellence in Adventist Education"*

</div>
