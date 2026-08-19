import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/flashcard_provider.dart';
import 'providers/theme_provider.dart';
import 'views/home_screen.dart';
import 'widgets/custom_app_loader_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
    ),
  );

  // Pre-load theme from SQLite BEFORE runApp — no white flash
  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();

  runApp(FlashcardApp(themeProvider: themeProvider));
}

class FlashcardApp extends StatelessWidget {
  final ThemeProvider themeProvider;
  const FlashcardApp({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashcardProvider()),
        ChangeNotifierProvider.value(value: themeProvider),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, tp, child) {
          return MaterialApp(
            title: 'Flashcard Quiz',
            debugShowCheckedModeBanner: false,
            theme: tp.themeData,
            // Black background during any transition
            color: Colors.black,
            home: const CustomAppLoaderScreen(
              appTitle: 'FLASHCARD QUIZ',
              child: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
