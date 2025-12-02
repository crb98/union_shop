# Union Shop — Flutter Coursework

A simple Flutter storefront app created as coursework for M32605 User Experience Design And Implementation. The app demonstrates collections and product listing UI patterns, navigation between pages, product tiles with optional sale pricing, and a product detail page. Images are loaded from local assets (assets/images/) and pages use a shared AppShell for consistent layout.

Key features

- Collections grid from a collectionTile
- Collection detail pages with a products section
- Product tiles with image, title, price and optional sale price
- Product detail page with drop-down options and quantity selector
- Simple sign-in and about pages (UI placeholders)
- Responsive layout  

---

## Prerequisites

- Operating system: Windows (development done on Windows; Flutter supports macOS/Linux too)
- Flutter SDK (stable channel) installed and on PATH
- Dart SDK (bundled with Flutter)
- Git
- An editor: VS Code recommended

Verify Flutter setup:

```bash
flutter --version
flutter doctor
```

---

## Clone and setup

Open a terminal (PowerShell / Windows Terminal) and run:

```bash
git clone <https://github.com/crb98/union_shop>
cd union_shop
flutter pub get
```
---

## Assets

This project uses local images placed under `assets/images/`. Ensure `pubspec.yaml` contains:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

Then run:

```bash
flutter pub get
flutter clean
flutter pub get
```

---

## Run the app

Start an emulator or connect a device, then:

```bash
flutter run
```

To run on Windows desktop (if desktop is enabled):

```bash
flutter run -d windows
```

---

## Project structure (relevant files)

- lib/
  - main.dart
  - views/
    - collections_page.dart
    - collection_page.dart
    - sale_collection_page.dart
    - product_page.dart
    - sign_in_page.dart
    - about_us_page.dart
  - widgets/
    - site_shell.dart
    - product_card.dart
  - repositories/
    - product_repository.dart
  - models/
    - product.dart

---

## Tests

Run tests with:

```bash
flutter test
```

If tests fail due to layout overflows, increase the test MediaQuery size or adjust the responsive breakpoints in the views.

---

## Contact

Created by Connie Busby  
Contact: <up2267061@myport.ac.uk>
