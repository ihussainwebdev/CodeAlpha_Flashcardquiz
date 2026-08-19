import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/flashcard_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/flashcard_card.dart';
import 'manage_cards_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'FLASHCARD QUIZ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFD4AF37),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        // Dark/Light toggle directly in AppBar (replaces settings button)
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.black,
              size: 26,
            ),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        child: Column(
          children: [
            // Drawer Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(color: Color(0xFFD4AF37)),
              child: const SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.style, size: 50, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      'Flashcard Quiz',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Study with ease',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Manage Cards
            ListTile(
              leading: const Icon(Icons.style, color: Color(0xFFD4AF37), size: 28),
              title: Text(
                'Manage Cards',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ManageCardsScreen()),
                );
              },
            ),

            const Spacer(),

            // Footer
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Version 3.0.0',
                style: TextStyle(
                  color: isDark ? Colors.white38 : Colors.black38,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<FlashcardProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: const Color(0xFFD4AF37),
                backgroundColor:
                    isDark ? Colors.white12 : Colors.black12,
              ),
            );
          }

          if (provider.cards.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.style_outlined,
                    size: 80,
                    color: isDark ? const Color(0xFFD4AF37) : Colors.black26,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No Cards Available',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ManageCardsScreen()),
                    ),
                    child: const Text(
                      'ADD CARDS NOW',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }

          final currentCard = provider.currentCard;

          return Stack(
            children: [
              // Main content
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                child: Column(
                  children: [
                    // Card counter
                    Text(
                      'CARD ${provider.currentIndex + 1} OF ${provider.cards.length}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: isDark ? Colors.white : Colors.black,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // The Card
                    Expanded(
                      child: Center(
                        child: currentCard != null
                            ? FlashcardCard(
                                key: ValueKey(currentCard.id),
                                card: currentCard,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom LEFT — Previous <<
              Positioned(
                bottom: 20,
                left: 20,
                child: IconButton(
                  onPressed:
                      provider.currentIndex > 0 ? provider.previousCard : null,
                  icon: Icon(
                    Icons.keyboard_double_arrow_left_rounded,
                    size: 48,
                    color: provider.currentIndex > 0
                        ? (isDark ? Colors.white : Colors.black)
                        : (isDark ? Colors.white12 : Colors.black12),
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),

              // Bottom RIGHT — Next >>
              Positioned(
                bottom: 20,
                right: 20,
                child: IconButton(
                  onPressed: provider.currentIndex < provider.cards.length - 1
                      ? provider.nextCard
                      : null,
                  icon: Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    size: 48,
                    color: provider.currentIndex < provider.cards.length - 1
                        ? const Color(0xFFD4AF37)
                        : (isDark ? Colors.white12 : Colors.black12),
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
