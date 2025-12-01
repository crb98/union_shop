# Union Shop — Flutter Coursework

A simple Flutter storefront app created as coursework for M32605 Course name
User Experience Design And Implementation. The app demonstrates collections and product listing UI patterns, navigation between pages, product tiles with optional sale pricing, and a product detail page. Images are loaded from network URLs; pages use a shared AppShell for consistent layout.

Key features
- Collections grid with image tiles
- Collection detail pages with a products section
- Product tiles with image, title, price and optional sale price 
- Product detail page with non-functional drop-down menus
- Simple sign-in and about pages (UI placeholders)
- Responsive layout 

---

## Prerequisites

- Operating system: Windows (development done on Windows; Flutter supports macOS/Linux too)
- Flutter SDK (stable channel) installed and on PATH
- Dart SDK (bundled with Flutter)
- Git
- An editor: VS Code recommended (project includes hints for VS Code)
- Android/iOS simulator or a physical device (or use `flutter run -d windows` for desktop if enabled)

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

Replace `<https://github.com/crb98/union_shop>` with your repo HTTP/SSH URL.

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

Use `flutter run -d <device-id>` for specific targets. In VS Code press F5 or use the Run pane.

Hot-reload / hot-restart are supported during development.

---

## Project structure (relevant files)

- lib/
  - main.dart — app entry and home screen (Products section)
  - collections_page.dart — Collections listing page
  - collection_page.dart — Single collection page with product grid
  - sale_collection_page.dart — Sale collection layout
  - product_page.dart — Product detail page
  - sign_in_page.dart — Sign-in placeholder
  - about_us_page.dart — About page placeholder
  - widgets/
    - site_shell.dart — shared shell / scaffold used across pages (contains navigation bar and footer)

Images used are network URLs inside the code; adjust them in the product/collection arrays where needed.

---

## Usage / App flows

- Home (main.dart)
  - Shows a Products section matching the collection page sizing.
  - Product tiles are tappable and navigate to product detail.
- Collections (collections_page.dart)
  - Grid of collection tiles. Each tile shows an image with centered title overlay and navigates to a collection page.
- Collection page (collection_page.dart)
  - Shows a list/grid of products (same layout as home).
  - Product tiles show image, title, price, and optional sale price (with original struck through).
- Sale collection (sale_collection_page.dart)
  - Similar to collection page but focused on sale items.
- Product page (product_page.dart)
  - Product detail screen — replace placeholder data with real product info as needed.
- Sign in / About
  - UI placeholders you can extend to wire up authentication or app info.

---

## Configuration & customizing

- Product and collection data are defined in-page as lists/maps. Edit these arrays (title, image, price, sale) to change content.
- Image coverage, overlay darkness, and tile sizing are controlled in the tile widgets (see `_collectionTile`, `ProductCard`, `SaleProductCard`).
- Navigation currently uses `MaterialPageRoute` to push pages. Adapt to named routes if preferred.

---

## Tests

If you add tests, run them with:

```bash
flutter test
```

There are no automated tests included by default in this coursework project.

---

## Troubleshooting

- Overflow on small screens: adjust `childAspectRatio` on GridView.count or reduce font sizes.
- Network images not loading: ensure you have internet access and check the image URLs.
- Missing imports errors: run `flutter pub get` and check for any typos in import paths.

---

## Contact

Created by Connie Busby
Contact at <up2267061@myport.ac.uk>

