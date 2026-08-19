import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardCard extends StatefulWidget {
  final Flashcard card;

  const FlashcardCard({super.key, required this.card});

  @override
  State<FlashcardCard> createState() => _FlashcardCardState();
}

class _FlashcardCardState extends State<FlashcardCard> {
  bool _showAnswer = false;

  @override
  void didUpdateWidget(covariant FlashcardCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.card.id != widget.card.id) {
      setState(() {
        _showAnswer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 500),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: _showAnswer ? const Color(0xFFD4AF37) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: _showAnswer ? Colors.white : const Color(0xFFD4AF37),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD4AF37).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _showAnswer ? 'ANSWER' : 'QUESTION',
            style: TextStyle(
              color: _showAnswer ? Colors.black54 : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                _showAnswer ? widget.card.answer : widget.card.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _showAnswer ? 26 : 28,
                  fontWeight: FontWeight.w900,
                  color: _showAnswer ? Colors.black : Colors.black,
                  height: 1.4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _showAnswer ? Colors.white : Colors.black,
              foregroundColor: _showAnswer ? Colors.black : const Color(0xFFD4AF37),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              setState(() {
                _showAnswer = !_showAnswer;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _showAnswer ? Icons.refresh : Icons.touch_app,
                  color: _showAnswer ? Colors.black : const Color(0xFFD4AF37),
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  _showAnswer ? 'SHOW QUESTION' : 'SHOW ANSWER',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
