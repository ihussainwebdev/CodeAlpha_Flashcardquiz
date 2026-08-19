# Flashcard Quiz App

A simple and elegant flashcard quiz app built with Flutter for studying with ease.

---

## APK File Kahan Hai? (Android Install File)

### Release APK (Phone pe install karne wali file):

```
flashcard_quiz_app/
└── build/
    └── app/
        └── outputs/
            ├── flutter-apk/
            │   └── app-release.apk   ← YE WALI use karo (recommended)
            └── apk/
                └── release/
                    └── app-release.apk   ← Ye bhi same hai
```

**Seedha path:**
```
build\app\outputs\flutter-apk\app-release.apk
```

### Phone pe Install Kaise Karein:

1. **APK file** apne phone mein transfer karo (USB cable ya WhatsApp ya Google Drive)
2. Phone mein **Settings** → **Security** → **Unknown Sources** ON karo
   - (Ya: Settings → Apps → Special App Access → Install Unknown Apps)
3. File Manager mein APK file dhundo aur **tap** karo
4. **Install** button press karo
5. Done! App install ho jayegi

### Naya APK Build Karna Ho Toh:

```bash
# Release APK banao (phone ke liye)
flutter build apk --release

# APK automatically yahan save hogi:
# build\app\outputs\flutter-apk\app-release.apk
```

---

## Features

- **Flashcard Study Mode** — Question front pe, Answer back pe
- **Show Answer Button** — Tap karo answer dekhne ke liye
- **Next / Previous Navigation** — Bottom corners mein `<<` `>>` arrows
- **Add / Edit / Delete Cards** — Drawer → Manage Cards
- **Search** — Manage Cards screen mein search bar (question/answer search)
- **Dark / Light Mode** — AppBar mein toggle button, SQLite mein save hota hai
- **Splash Loader** — App start pe smooth loading screen
- **SQLite Database** — Android/iOS pe (Web pe SharedPreferences)

---

## UI Design

- **Color Scheme:** Black, White, Gold (#D4AF37)
- **Default Theme:** Light Mode
- **Clean Interface:** Minimal aur easy to use

---

## Project Structure

```
flashcard_quiz_app/
├── lib/
│   ├── database/
│   │   ├── database_helper.dart          # Abstract DB interface
│   │   ├── database_helper_mobile.dart   # SQLite (Android/iOS)
│   │   └── database_helper_web.dart      # SharedPreferences (Web)
│   ├── models/
│   │   └── flashcard.dart                # Flashcard data model
│   ├── providers/
│   │   ├── flashcard_provider.dart       # Cards state management
│   │   └── theme_provider.dart           # Dark/Light theme + SQLite save
│   ├── views/
│   │   ├── home_screen.dart              # Main screen
│   │   ├── manage_cards_screen.dart      # Add/Edit/Delete + Search
│   │   └── settings_screen.dart         # Settings
│   ├── widgets/
│   │   ├── custom_app_loader_screen.dart # Splash loader
│   │   └── flashcard_card.dart          # Flashcard widget (flip)
│   └── main.dart                         # App entry point
│
├── android/                              # Android config
├── build/
│   └── app/
│       └── outputs/
│           └── flutter-apk/
│               └── app-release.apk       # ← INSTALL FILE YAHAN HAI
│
├── pubspec.yaml                          # Dependencies
└── README.md                             # Ye file
```

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2        # State management
  sqflite: ^2.3.0         # SQLite database (mobile)
  path: ^1.8.3            # File paths
  shared_preferences: ^2.2.2  # Web storage fallback
  cupertino_icons: ^1.0.6
```

---

## Run Kaise Karein (Development)

### Requirements:
- Flutter SDK installed
- Android Studio ya VS Code
- Android device ya emulator

### Steps:

```bash
# 1. Dependencies install karo
flutter pub get

# 2. App run karo (connected device pe)
flutter run

# 3. Chrome mein run karo (web)
flutter run -d chrome

# 4. Release APK build karo
flutter build apk --release
```

---

## Platform Support

| Platform | Status | Storage |
|----------|--------|---------|
| Android  | ✅ Full support | SQLite |
| iOS      | ✅ Full support | SQLite |
| Web      | ✅ Works | SharedPreferences |
| Windows  | ⚠️ Needs Visual Studio | - |

---

## Version

**3.0.0** — SQLite storage, Dark/Light theme, Search, Splash loader

---

## Tech Stack

- **Flutter 3.x** — UI Framework
- **Provider** — State Management
- **sqflite** — Local SQLite Database
- **shared_preferences** — Web fallback storage
- **Material Design 3** — Design System
