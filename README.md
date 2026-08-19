# Flashcard Quiz App

A simple and elegant flashcard quiz app built with Flutter for studying with ease.

---

## 📱 Download & Install APK

### ⚠️ APK File Not Included in Repository

The APK file is **not included** in this repository due to its large size (~47 MB). You need to build it yourself.

### 🔨 How to Build APK

**Prerequisites:**
- Flutter SDK installed ([Install Guide](https://flutter.dev/docs/get-started/install))
- Android SDK installed (comes with Android Studio)

**Build Steps:**

```bash
# 1. Clone this repository
git clone https://github.com/YOUR_USERNAME/flashcard-quiz-app.git
cd flashcard-quiz-app

# 2. Install dependencies
flutter pub get

# 3. Build release APK
flutter build apk --release
```

**Build Time:** ~2-3 minutes (first build may take longer)

### 📍 Where to Find Built APK

After successful build, the APK will be located at:

```
flashcard_quiz_app/
└── build/
    └── app/
        └── outputs/
            └── flutter-apk/
                └── app-release.apk   ← YOUR APK FILE HERE
```

**Full Path:**
```
build/app/outputs/flutter-apk/app-release.apk
```

**File Size:** ~47 MB

---

## 📲 Install APK on Android Phone

Once you have built the APK:

1. **Transfer APK** to your Android phone (USB, WhatsApp, Google Drive, etc.)
2. On your phone, go to **Settings** → **Security** → Enable **"Install from Unknown Sources"**
   - Modern Android: Settings → Apps → Special Access → Install Unknown Apps
3. Open **File Manager** and locate the `app-release.apk` file
4. **Tap** on the APK file
5. Press **Install**
6. Done! Open the app

---

## ✨ Features

- ✅ **Flashcard Study Mode** — Question on front, Answer on back
- ✅ **Show Answer Button** — Tap to reveal answer
- ✅ **Navigation Controls** — Bottom corner arrows (`<<` `>>`)
- ✅ **Add / Edit / Delete Cards** — Drawer → Manage Cards
- ✅ **Search Functionality** — Search cards by question/answer/category
- ✅ **Dark / Light Mode** — AppBar toggle button, saved in SQLite
- ✅ **Splash Loader** — Smooth loading screen on startup
- ✅ **SQLite Database** — Persistent storage (Android/iOS)
- ✅ **Web Support** — SharedPreferences fallback for web platform

---

## 🎨 UI Design

- **Color Scheme:** Black, White, and Gold (#D4AF37)
- **Default Theme:** Light Mode
- **Design:** Clean, minimal interface for easy usage

---

## 📁 Project Structure

```
flashcard_quiz_app/
├── lib/
│   ├── database/
│   │   ├── database_helper.dart          # Abstract database interface
│   │   ├── database_helper_mobile.dart   # SQLite implementation (Android/iOS)
│   │   └── database_helper_web.dart      # SharedPreferences (Web)
│   ├── models/
│   │   └── flashcard.dart                # Flashcard data model
│   ├── providers/
│   │   ├── flashcard_provider.dart       # Flashcard state management
│   │   └── theme_provider.dart           # Theme management + persistence
│   ├── views/
│   │   ├── home_screen.dart              # Main flashcard screen
│   │   ├── manage_cards_screen.dart      # Add/Edit/Delete + Search
│   │   └── settings_screen.dart          # App settings
│   ├── widgets/
│   │   ├── custom_app_loader_screen.dart # Splash loader animation
│   │   └── flashcard_card.dart           # Flashcard flip widget
│   └── main.dart                          # App entry point
│
├── android/                               # Android platform config
├── build/
│   └── app/
│       └── outputs/
│           └── flutter-apk/
│               └── app-release.apk        # ← INSTALL FILE HERE
│
├── pubspec.yaml                           # Project dependencies
└── README.md                              # This file
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2              # State management
  sqflite: ^2.3.0               # SQLite database (mobile)
  path: ^1.8.3                  # File path utilities
  shared_preferences: ^2.2.2    # Web storage fallback
  cupertino_icons: ^1.0.6       # iOS icons
```

---

## 🚀 Quick Start Guide

### For Users (Just Want to Use the App):

1. **Build the APK** (see "Download & Install APK" section above)
2. Transfer to your phone and install
3. Start studying! 📚

### For Developers (Want to Modify/Run):

```bash
# 1. Clone repository
git clone https://github.com/YOUR_USERNAME/flashcard-quiz-app.git
cd flashcard-quiz-app

# 2. Install dependencies
flutter pub get

# 3. Check Flutter setup
flutter doctor

# 4. Run on connected device
flutter run

# 5. Or run on Chrome (web version)
flutter run -d chrome
```

---

## 🛠️ Development Setup

### Requirements:
- **Flutter SDK** ([Install Guide](https://flutter.dev/docs/get-started/install))
- **Android Studio** or **VS Code**
- **Android device** or emulator (for Android testing)

### Commands:

```bash
# Install dependencies
flutter pub get

# Run app (debug mode)
flutter run

# Run on specific device
flutter run -d chrome        # Web
flutter run -d windows       # Windows (requires Visual Studio)

# Build release APK
flutter build apk --release

# Build release iOS (Mac only)
flutter build ios --release

# Analyze code
flutter analyze

# Run tests
flutter test
```

---

## 🖥️ Platform Support

| Platform | Status | Storage Backend |
|----------|--------|-----------------|
| Android  | ✅ Full support | SQLite |
| iOS      | ✅ Full support | SQLite |
| Web      | ✅ Supported | SharedPreferences |
| Windows  | ⚠️ Requires Visual Studio | - |

---

## 📸 Screenshots

(Add screenshots here if needed)

---

## 🔧 Tech Stack

- **Flutter 3.x** — Cross-platform UI framework
- **Provider** — State management solution
- **sqflite** — Local SQLite database
- **shared_preferences** — Web fallback storage
- **Material Design 3** — Modern design system

---

## 📝 Version

**3.0.0** — SQLite storage, Dark/Light theme toggle, Search functionality, Splash loader

---

## 📄 License

This project is open source and available for educational purposes.

---

## 👨‍💻 Developer

Built with Flutter ❤️

---

## 🐛 Known Issues

- ⚠️ **APK file not in repository** — Must be built manually (see build instructions above)
- ⚠️ Windows platform requires Visual Studio with "Desktop development with C++" workload
- ⚠️ Web platform uses SharedPreferences (localStorage) instead of SQLite
- ⚠️ First build may take 5-10 minutes to download dependencies

---

## ❓ FAQ

**Q: Where is the APK file?**  
A: APK is not included in the repo. Build it using `flutter build apk --release`. It will be generated at `build/app/outputs/flutter-apk/app-release.apk`

**Q: Why isn't the APK included in the repository?**  
A: APK files are large (~47 MB) and change with every build. GitHub best practice is to exclude build artifacts.

**Q: Can I download a pre-built APK?**  
A: Check the [Releases](https://github.com/YOUR_USERNAME/flashcard-quiz-app/releases) page for pre-built APKs (if available).

**Q: Build failed. What should I do?**  
A: Run `flutter doctor` to check your setup. Make sure Flutter SDK and Android SDK are properly installed.

**Q: How to run on my phone for testing?**  
A: Enable USB debugging on your phone, connect via USB, and run `flutter run`.

---

## 🔮 Future Enhancements

- [ ] Card categories/tags
- [ ] Study statistics
- [ ] Spaced repetition algorithm
- [ ] Import/Export flashcards
- [ ] Cloud sync

---

**Happy Studying! 📚**
