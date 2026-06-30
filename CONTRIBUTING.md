# Contributing to BU Gateway

First off — **thank you for taking the time to contribute!** 🎉

BU Gateway is an open-source project built by students, for students. Whether you're fixing a typo, adding a feature, or reporting a bug, every contribution matters and is a great learning experience.

Please read this guide carefully before making your first contribution.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Branch & Workflow Strategy](#branch--workflow-strategy)
- [Submitting a Pull Request](#submitting-a-pull-request)
- [Commit Message Convention](#commit-message-convention)
- [Code Style Guide](#code-style-guide)
- [Getting Help](#getting-help)

---

## 📜 Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please read it — it sets the standard for a respectful, inclusive environment.

---

## 🙋 How Can I Contribute?

### 🐛 Reporting Bugs
- Search [existing issues](https://github.com/IT-SUPPORT-BU/BU-Gateway/issues) to make sure it hasn't been reported already.
- If not found, open a new issue using the **Bug Report** template.
- Include as much detail as possible (device, OS, steps to reproduce, screenshots).

### 💡 Suggesting Features
- Open a new issue using the **Feature Request** template.
- Describe what you'd like and why it would be useful to other students or staff.

### 👩‍💻 Writing Code
1. Find an open issue labelled `good first issue` or `help wanted`.
2. Comment on the issue: *"I'd like to work on this!"* — the instructor will assign it to you.
3. Follow the workflow below.

### 📝 Improving Documentation
- Typos, clearer explanations, missing setup steps — all are welcome!
- Follow the same PR process as code contributions.

---

## 🛠️ Development Setup

See the [Getting Started](README.md#-getting-started) section in the README for full setup instructions.

**Quick summary:**
```bash
git clone https://github.com/<YOUR-USERNAME>/BU-Gateway.git
cd BU-Gateway
flutter pub get
flutter run -d chrome   # test web version
```

---

## 🌿 Branch & Workflow Strategy

### Branch Naming

Always create a new branch for your work. Name it using this format:

```
feature/<issue-number>-<short-description>
fix/<issue-number>-<short-description>
docs/<issue-number>-<short-description>
```

**Examples:**
```
feature/3-home-screen-ui
fix/6-broken-payment-link
docs/8-setup-guide
```

### Step-by-Step Workflow

```bash
# Step 1: Sync your local develop branch with the upstream
git fetch upstream
git checkout develop
git merge upstream/develop

# Step 2: Create your feature branch from develop
git checkout -b feature/3-home-screen-ui

# Step 3: Write your code & commit often
git add .
git commit -m "feat(home): add BU logo and university name (#3)"

# Step 4: Push your branch to your fork
git push origin feature/3-home-screen-ui

# Step 5: Open a Pull Request on GitHub
# Target: IT-SUPPORT-BU/BU-Gateway  ←  branch: develop
```

### ⚠️ Important Rules

- ❌ **Never push directly to `main`** — it is branch-protected
- ❌ **Never push directly to `develop`** — it is branch-protected
- ✅ Always open a **Pull Request** and request review from the instructor
- ✅ One issue = one branch = one Pull Request
- ✅ Your PR must pass all CI checks before it can be merged

---

## 📬 Submitting a Pull Request

1. Make sure your branch is up to date with `develop`:
   ```bash
   git fetch upstream
   git rebase upstream/develop
   ```

2. Push and go to the repo on GitHub → click **"Compare & pull request"**

3. Fill in the PR template:
   - What does this PR do?
   - Which issue does it close? (use `Closes #<issue-number>`)
   - Screenshots (if UI changes)
   - Checklist completion

4. Request a review from `@instructor` (or your assigned reviewer)

5. Address any review comments, push updates, and wait for approval ✅

---

## 📝 Commit Message Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

```
<type>(<scope>): <short description> (#<issue-number>)
```

### Types

| Type | When to use |
|---|---|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation changes only |
| `style` | Formatting, missing semicolons (no code change) |
| `refactor` | Code change that's neither a fix nor a feature |
| `test` | Adding or updating tests |
| `chore` | Build process, dependency updates |

### Examples

```
feat(home): display BU logo on splash screen (#2)
fix(links): update payment status URL (#5)
docs(contributing): add commit convention guide (#8)
refactor(widgets): extract link card into separate widget (#4)
```

---

## 🎨 Code Style Guide

- Follow the official [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Run `flutter analyze` before committing — fix all warnings
- Run `dart format .` to auto-format your code
- Keep functions small and focused (single responsibility)
- Add comments for non-obvious logic

### File Naming

- Files: `snake_case.dart` (e.g., `home_screen.dart`)
- Classes: `PascalCase` (e.g., `HomeScreen`)
- Variables & functions: `camelCase` (e.g., `universityLinks`)
- Constants: `kCamelCase` (e.g., `kPrimaryColor`)

---

## 🆘 Getting Help

Stuck? Here's how to get help:

1. **Read the README** — most setup questions are answered there.
2. **Search existing issues** — someone may have had the same problem.
3. **Open a Discussion** — use GitHub Discussions for questions.
4. **Ask your instructor** — tag them in an issue or PR comment.

---

## 🏅 Recognition

All contributors will be listed in the project's contributors section. This is your portfolio — make it count!

---

*Thank you for being part of BU Gateway. You're helping build something that will be used by thousands of Bugema University students and staff.* 🚀
