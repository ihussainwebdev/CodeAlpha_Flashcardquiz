# Flashcard Quiz App

A simple and elegant flashcard quiz app built with Flutter for studying with ease.

---

## 📱 APK File Location (Android Installation File)

### Release APK (Ready to install on phone):

```
flashcard_quiz_app/
└── build/
    └── app/
        └── outputs/
            ├── flutter-apk/
            │   └── app-release.apk   ← USE THIS FILE (recommended)
            └── apk/
                └── release/
                    └── app-release.apk   ← Also same file
```

**Direct path:**
```
build\app\outputs\flutter-apk\app-release.apk
```

**File size:** ~47 MB

---

## 📲 How to Install APK on Android Phone

1. **Transfer APK file** to your phone (via USB cable, WhatsApp, or Google Drive)
2. Open **Settings** → **Security** → Enable **Unknown Sources**
   - Or: Settings → Apps → Special App Access → Install Unknown Apps
3. Open **File Manager** and locate the APK file
4. **Tap** on the APK file
5. Press **Install** button
6. Done! App is installed

---

## 🔨 Build New APK

To build a fresh release APK:

```bash
flutter build apk --release
```

The APK will be automatically generated at:
```
build\app\outputs\flutter-apk\app-release.apk
```

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

## 🚀 How to Run (Development)

### Requirements:
- Flutter SDK installed ([Install Guide](https://flutter.dev/docs/get-started/install))
- Android Studio or VS Code
- Android device or emulator

### Steps:

```bash
# 1. Install dependencies
flutter pub get

# 2. Run app on connected device
flutter run

# 3. Run on Chrome (web)
flutter run -d chrome

# 4. Build release APK for Android
flutter build apk --release
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

- Windows platform requires Visual Studio with "Desktop development with C++" workload
- Web platform uses SharedPreferences (localStorage) instead of SQLite

---

## 🔮 Future Enhancements

- [ ] Card categories/tags
- [ ] Study statistics
- [ ] Spaced repetition algorithm
- [ ] Import/Export flashcards
- [ ] Cloud sync

---

**Happy Studying! 📚**
