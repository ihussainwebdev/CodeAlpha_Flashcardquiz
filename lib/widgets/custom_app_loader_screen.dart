import 'package:flutter/material.dart';

class CustomAppLoaderScreen extends StatefulWidget {
  final Widget child;
  final String appTitle;

  const CustomAppLoaderScreen({
    super.key,
    required this.child,
    this.appTitle = "FLASHCARD QUIZ",
  });

  @override
  State<CustomAppLoaderScreen> createState() => _CustomAppLoaderScreenState();
}

class _CustomAppLoaderScreenState extends State<CustomAppLoaderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnim;
  late Animation<double> _fadeAnim;

  bool _isFinished = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _progressAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.85, curve: Curves.easeInOut),
      ),
    );

    _fadeAnim = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward().then((_) {
      if (mounted) setState(() => _isFinished = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFinished) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            // Black background always
            Container(color: Colors.black),

            // Loader UI fading out at end
            Opacity(
              opacity: _fadeAnim.value,
              child: _buildLoaderUI(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoaderUI() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Icon
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFD4AF37),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD4AF37).withValues(alpha: 0.35),
                    blurRadius: 28,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: const Icon(
                Icons.style_rounded,
                size: 52,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),

            // App Title
            Text(
              widget.appTitle,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Color(0xFFD4AF37),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Study with ease',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white38,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 48),

            // Progress bar
            SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        // Track
                        Container(
                          height: 6,
                          color: const Color(0xFFD4AF37).withValues(alpha: 0.18),
                        ),
                        // Fill
                        FractionallySizedBox(
                          widthFactor: _progressAnim.value,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFD4AF37),
                                  Color(0xFFFFF0A0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(_progressAnim.value * 100).toInt()}%',
                    style: const TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
