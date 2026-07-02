
# ============================================================
# BU Gateway — Create Remaining GitHub Issues (#4 to #11)
# ============================================================
# INSTRUCTIONS:
#   1. Replace YOUR_TOKEN_HERE with your GitHub Personal Access Token
#   2. Open PowerShell in this folder
#   3. Run: .\create_remaining_issues.ps1
# ============================================================

$TOKEN = "YOUR_TOKEN_HERE"   # <-- paste your PAT here

$OWNER = "IT-SUPPORT-BU"
$REPO  = "BU-Gateway"
$BASE  = "https://api.github.com/repos/$OWNER/$REPO"
$HDR   = @{
    "Authorization"        = "Bearer $TOKEN"
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

function New-GHIssue($title, $body, [string[]]$labels) {
    $payload = @{ title = $title; body = $body; labels = $labels } | ConvertTo-Json -Depth 10
    $r = Invoke-RestMethod -Uri "$BASE/issues" -Method POST -Headers $HDR -Body $payload -ContentType "application/json"
    Write-Host "✅  #$($r.number)  $title"
}

Write-Host "`n🚀 Creating issues 4-11 for $OWNER/$REPO ...`n"

# ── Issue 4 ────────────────────────────────────────────────
New-GHIssue "[FEATURE] Implement University Quick Links Screen" @"
## 📋 Task Description

Build a screen that displays all official Bugema University platform links, organised by category. Each link should open in the device's default browser.

## 🎯 University Links to Include

| Category | Platform | URL |
|---|---|---|
| 🏫 Primary | Official University Website | https://bugemauniv.ac.ug/ |
| 🎓 Academic | Student Portal (ERMS) | https://erms.bugemauniv.ac.ug/student/login/ |
| 👨‍🏫 Staff | Staff Portal (ERMS) | https://erms.bugemauniv.ac.ug/staff/login/ |
| 📚 Learning | E-Learning (ODeL) | https://elearning.bugemauniv.ac.ug/ |
| 💳 Finance | Online Payments | https://payments.bugemauniv.ac.ug/payments/ |
| 🧾 Finance | Payment Status Tracker | https://payments.bugemauniv.ac.ug/payments/status/ |
| 📖 Library | Main E-Library Portal | http://lib.bugemauniv.ac.ug |
| 🔍 Library | Library Catalog (Koha OPAC) | https://koha.bugemauniv.ac.ug |
| 🗄️ Research | Institutional Repository (BUIR) | https://buir.bugemauniv.ac.ug/xmlui/ |
| 📰 Research | Scholarly Journals (OJS) | https://journal.bugemauniv.ac.ug/ |

## 🎯 Acceptance Criteria

- [ ] All 10 links are displayed in the app
- [ ] Links are grouped by category with section headers
- [ ] Each link card shows: icon, platform name, and short description
- [ ] Tapping a link opens it using ``url_launcher``
- [ ] All URLs are defined in ``lib/constants/links.dart`` — no hardcoding in UI files
- [ ] Works on Android, iOS, and Web

## 📚 Resources
- [``url_launcher`` package](https://pub.dev/packages/url_launcher)
- [BU Official Website](https://bugemauniv.ac.ug/)
"@ @("feature","good first issue")

# ── Issue 5 ────────────────────────────────────────────────
New-GHIssue "[UI] Apply Bugema University Branding & Design System" @"
## 📋 Task Description

Define and apply the official Bugema University visual identity throughout the app. This establishes the design system that all other UI issues will reference.

## 🎯 Acceptance Criteria

- [ ] Create ``lib/constants/colors.dart`` with BU brand colours (maroon/dark red primary, gold/yellow secondary)
- [ ] Create ``lib/constants/theme.dart`` with Material 3 ThemeData
- [ ] Apply the theme globally in ``lib/app.dart``
- [ ] Add a Google Font (e.g. ``Outfit`` or ``Inter``) via ``google_fonts`` package
- [ ] Test dark mode and light mode
- [ ] All colours reference ``lib/constants/colors.dart`` — no hardcoded hex values anywhere

## 📚 Resources
- [BU Official Website](https://bugemauniv.ac.ug/) — inspect for brand colours
- [``google_fonts`` package](https://pub.dev/packages/google_fonts)
- [Material 3 Colour System](https://m3.material.io/styles/color/overview)
"@ @("UI","feature","setup")

# ── Issue 6 ────────────────────────────────────────────────
New-GHIssue "[FEATURE] Add In-App WebView for University Portals" @"
## 📋 Task Description

Implement an in-app WebView so users can browse university portals without leaving the app.

## 🎯 Acceptance Criteria

- [ ] Tapping a link opens it in an in-app WebView screen
- [ ] WebView screen has a back button and an "Open in Browser" button
- [ ] Loading indicator shown while page loads
- [ ] Error state handled gracefully (e.g. no internet connection)
- [ ] Works on Android and iOS
- [ ] On Web, falls back to opening the URL in a new browser tab

## 📚 Resources
- [``webview_flutter`` package](https://pub.dev/packages/webview_flutter)
- [``url_launcher`` package](https://pub.dev/packages/url_launcher)

## 💡 Notes
Implement after Issue #4 (Quick Links Screen) is merged.
"@ @("feature","enhancement")

# ── Issue 7 ────────────────────────────────────────────────
New-GHIssue "[DEPLOY] Set Up Vercel Deployment for Flutter Web" @"
## 📋 Task Description

Configure the repository to automatically deploy the Flutter web build to Vercel on every push to ``main``.

## 🎯 Acceptance Criteria

- [ ] Vercel project created and linked to this GitHub repository
- [ ] ``vercel.json`` configuration file added to repo root
- [ ] Flutter web builds successfully (``flutter build web --release``)
- [ ] Build output (``build/web/``) deployed to Vercel
- [ ] Auto-deployment triggers on push to ``main``
- [ ] Web app accessible at the Vercel-provided URL
- [ ] Vercel URL documented in the README
- [ ] Note in README about future CNAME (pending BU System Admin for ``*.bugemauniv.ac.ug``)

## 📚 Resources
- [Vercel](https://vercel.com/)
- [Deploy Flutter Web to Vercel](https://vercel.com/guides/deploying-flutter-web-apps-to-vercel)

## 💡 Notes
The CNAME to point a BU subdomain to Vercel will be configured by the BU System Admin.
Coordinate with the instructor before making the app public.
"@ @("deploy","ci/cd")

# ── Issue 8 ────────────────────────────────────────────────
New-GHIssue "[FEATURE] Create App Downloads Page (APK & iOS IPA)" @"
## 📋 Task Description

Create a Downloads page in the web app where visitors can download the Android APK and iOS IPA files directly.

## 🎯 Acceptance Criteria

- [ ] A "Downloads" screen added to the app (accessible from the navigation bar)
- [ ] Two download cards: Android (APK) and iPhone (IPA)
- [ ] Each card shows: platform icon, file name, version number, file size, Download button
- [ ] Download buttons link to the actual APK/IPA files
- [ ] On mobile (Android/iOS), shows a message directing users to the web version for downloads
- [ ] Page is responsive and looks great on desktop web

## 💡 Notes
- Coordinate with Issue #7 (Vercel deployment) to ensure files are accessible
- Use placeholder links initially; update when CI produces real build files
"@ @("feature","UI","deploy")

# ── Issue 9 ────────────────────────────────────────────────
New-GHIssue "[CI] Verify & Extend GitHub Actions Flutter Build Workflow" @"
## 📋 Task Description

The ``.github/workflows/flutter_ci.yml`` file already exists in the repo. Verify it works and extend it to upload build artifacts for the Downloads page.

## 🎯 Acceptance Criteria

- [ ] Workflow runs successfully on a PR to ``develop`` or ``main``
- [ ] ``flutter analyze`` passes with zero errors
- [ ] ``flutter test`` passes
- [ ] Flutter web build (``flutter build web``) succeeds
- [ ] Android APK build succeeds
- [ ] Build artifacts (APK, web) uploaded as GitHub Actions artifacts
- [ ] CI status badge added to README

## 📚 Resources
- [GitHub Actions for Flutter](https://github.com/subosito/flutter-action)
- [Uploading artifacts](https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts)

## 💡 Notes
Can only be fully verified after Issue #1 (Flutter init) is merged.
"@ @("ci/cd","setup")

# ── Issue 10 ───────────────────────────────────────────────
New-GHIssue "[DOCS] Write Setup Guide & Contributor Onboarding Documentation" @"
## 📋 Task Description

Create detailed documentation to make it easier for new students to join the project.

## 🎯 Acceptance Criteria

- [ ] ``docs/SETUP_GUIDE.md`` created with:
  - Step-by-step Flutter installation for Windows, macOS, and Linux
  - How to run the app on each platform
  - Common errors and fixes (``flutter doctor`` issues)
  - How to set up an Android emulator
- [ ] ``docs/GLOSSARY.md`` with definitions of: Flutter, Dart, Widget, Riverpod, APK, IPA, CNAME, Vercel, PR, CI/CD
- [ ] README badges updated to reflect current project status
- [ ] Any outdated README sections corrected

## 💡 Notes
Great for someone who has already done the setup — document the problems you faced!
Write in simple English for students who are new to development.
"@ @("documentation","good first issue")

# ── Issue 11 ───────────────────────────────────────────────
New-GHIssue "[ACCESSIBILITY] Add Semantic Labels & Accessibility Support" @"
## 📋 Task Description

Ensure the BU Gateway app is accessible to all users, including those using screen readers.

## 🎯 Acceptance Criteria

- [ ] All images have semantic labels (``semanticLabel`` or ``Semantics`` widget)
- [ ] All tappable elements have descriptive screen reader labels
- [ ] Text contrast ratios meet WCAG 2.1 AA standard (4.5:1 for normal text)
- [ ] App navigable by keyboard only (on web)
- [ ] Link cards indicate they will "open in browser" to screen reader users
- [ ] Run Flutter accessibility checker — fix all reported issues

## 📚 Resources
- [Flutter Accessibility](https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility)
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Colour Contrast Checker](https://webaim.org/resources/contrastchecker/)

## 💡 Notes
Do this after the main UI issues (#2, #3, #4) are completed.
"@ @("accessibility","enhancement")

Write-Host "`n🎉 Done! All issues created."
Write-Host "View them at: https://github.com/$OWNER/$REPO/issues"
