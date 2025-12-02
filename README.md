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
This repository contains the coursework project for students enrolled in the **Programming Applications and Programming Languages (M30235)** and **User Experience Design and Implementation (M32605)** modules at the University of Portsmouth.

## Overview

The Student Union has an e-commerce website, which you can access via this link: [shop.upsu.net](https://shop.upsu.net)

In short, your task is to recreate the same website using Flutter. You must not start from scratch, as you need to begin by forking the GitHub repository that contains the incomplete code. [The getting started section of this document](#getting-started) will explain more. Once you have completed the application, you will submit the link to your forked repository on Moodle for assessment and demonstrate your application in a practical session. See the [submission](#submission) and [demonstration](#demonstration) sections for more information.

⚠️ The UPSU.net link on the navbar of the union website is a link to an external site. This is not part of the application that you need to develop. So ignore the link highlighted below:

![Union Shop Header](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_union_site_header.png)

## Getting Started

### Prerequisites

You have three options for your development environment:

1. **Firebase Studio** (browser-based, no installation required)
2. **University Windows computers** (via AppsAnywhere)
3. **Personal computer** (Windows or macOS)

Below is a quick guide for each option. For more information, you can refer to [Worksheet 0 — Introduction to Dart, Git and GitHub](https://manighahrmani.github.io/sandwich_shop/worksheet-0.html) and [Worksheet 1 — Introduction to Flutter](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html).

**Firebase Studio:**

- Access [idx.google.com](https://idx.google.com) with a personal Google account
- Create a new Flutter Workspace (choose the Flutter template in the "Start coding an app" section)
- Once the Flutter Workspace is created, open the integrated terminal (View → Terminal) and link this project to your forked GitHub repository by running the following commands (replace `YOUR-USERNAME` in the URL):

  ```bash
  rm -rf .git && git init && git remote add origin https://github.com/YOUR-USERNAME/union_shop.git && git fetch origin && git reset --hard origin/main
  ```

  This command should remove the existing Git history, initialize a new Git repository, add your forked repository as the remote named `origin`, fetch the data from it, and reset the local files to match the `main` branch of your forked repository. After running the above commands, open the Source Control view in Visual Studio Code and commit any local changes. This will create a commit that points to your forked repository. In the terminal you can push the commit to GitHub with:

  ```bash
  git push -u origin main
  ```

  If you're unsure that you're connected to the correct repository, check the remote with:

  ```bash
  git remote -v
  ```

  This should show the URL of your forked repository (`https://github.com/YOUR-USERNAME/union_shop.git` where `YOUR-USERNAME` is your GitHub username).

**University Computers:**

- Open [AppsAnywhere](https://appsanywhere.port.ac.uk/sso) and launch the following in the given order:
  - Git
  - Flutter And Dart SDK
  - Visual Studio Code

**Personal Windows Computer:**

- Install [Chocolatey package manager](https://chocolatey.org/install)
- Run in PowerShell (as Administrator):

  ```bash
  choco install git vscode flutter -y
  ```

**Personal macOS Computer:**

- Install [Homebrew package manager](https://brew.sh/)
- Run in Terminal:

  ```bash
  brew install --cask visual-studio-code flutter
  ```

After installation, verify your setup by running:

```bash
flutter --version
flutter doctor
```

---

## Clone and setup

Open a terminal (PowerShell / Windows Terminal) and run:
This command checks your environment and displays a report of the status of your Flutter installation.

For detailed step-by-step instructions, refer to [Worksheet 1 — Introduction to Flutter](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html), which covers the complete setup process for all three options.

### Fork the Repository

Go to the repository containing the code for the coursework and click on the fork button as shown in the screenshot: [github.com/manighahrmani/union_shop/fork](https://github.com/manighahrmani/union_shop/fork) (Alternatively, just use this link: [github.com/manighahrmani/union_shop/fork](https://github.com/manighahrmani/union_shop/fork).)

![Fork Button](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_button.png)

Do not change anything and click on the Create fork button. You should then have a public fork of my repository with a URL like (YOUR-USERNAME replaced with your username): [github.com/YOUR-USERNAME/union_shop](https://github.com/YOUR-USERNAME/union_shop)

![Fork Settings](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_settings.png)

Note that the name of this created fork must be “union_shop”. If you already have a repository with this name, you need to rename it beforehand.

### Clone Your Forked Repository

If you are using Firebase, access idx.google.com with a personal Google account. Create a new Flutter Workspace named `union_shop` (choose the Flutter template in the “Start coding an app” section). Once the Flutter Workspace is created, open the integrated terminal (View → Terminal) and link this project to your forked GitHub repository by running the following commands (replace YOUR-USERNAME in the URL): 

```bash
rm -rf .git && git init && git remote add origin https://github.com/YOUR-USERNAME/union_shop.git && git fetch origin && git reset --hard origin/main 
```

This command should remove the existing Git history, initialize a new Git repository, add your forked repository as the remote named origin, fetch the data from it. It should also reset the local files to match the main branch of your forked repository. After running the above commands, open the Source Control view and commit any local changes.  

Otherwise, open a terminal, change to your desired directory, and run the following commands:

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
