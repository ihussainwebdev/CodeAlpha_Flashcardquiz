import 'package:flutter/foundation.dart';
import '../models/flashcard.dart';
import '../database/database_helper.dart';

class FlashcardProvider extends ChangeNotifier {
  List<Flashcard> _cards = [];
  int _currentIndex = 0;
  bool _isLoading = true;

  List<Flashcard> get cards => _cards;
  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;

  Flashcard? get currentCard {
    if (_cards.isEmpty || _currentIndex >= _cards.length) return null;
    return _cards[_currentIndex];
  }

  FlashcardProvider() {
    _loadCards();
  }

  Future<void> _loadCards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cards = await DatabaseHelper.instance.getAllCards();
      if (_cards.isEmpty) {
        await _addDefaultCards();
        _cards = await DatabaseHelper.instance.getAllCards();
      }
    } catch (e) {
      debugPrint('Error loading cards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _addDefaultCards() async {
    final defaultCards = [
      Flashcard(
        id: '1',
        question: 'What does UI stand for?',
        answer: 'User Interface.',
        category: 'Basics',
      ),
      Flashcard(
        id: '2',
        question: 'What is a Widget in Flutter?',
        answer: 'Everything on the screen (buttons, text, images) is a Widget.',
        category: 'Flutter',
      ),
    ];

    for (var card in defaultCards) {
      await DatabaseHelper.instance.createCard(card);
    }
  }

  void nextCard() {
    if (_cards.isNotEmpty && _currentIndex < _cards.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousCard() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  Future<void> addCard(String question, String answer, {String category = 'General'}) async {
    final newCard = Flashcard(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      question: question.trim(),
      answer: answer.trim(),
      category: category.trim().isEmpty ? 'General' : category.trim(),
    );
    await DatabaseHelper.instance.createCard(newCard);
    await _loadCards();
  }

  Future<void> updateCard(String id, String question, String answer, {String category = 'General'}) async {
    final index = _cards.indexWhere((c) => c.id == id);
    if (index != -1) {
      final updatedCard = _cards[index].copyWith(
        question: question.trim(),
        answer: answer.trim(),
        category: category.trim().isEmpty ? 'General' : category.trim(),
      );
      await DatabaseHelper.instance.updateCard(updatedCard);
      await _loadCards();
    }
  }

  Future<void> deleteCard(String id) async {
    await DatabaseHelper.instance.deleteCard(id);
    if (_currentIndex >= _cards.length - 1 && _cards.length > 1) {
      _currentIndex = _cards.length - 2;
    } else if (_cards.length == 1) {
      _currentIndex = 0;
    }
    await _loadCards();
  }

  Future<void> resetToDefault() async {
    await DatabaseHelper.instance.deleteAllCards();
    await _addDefaultCards();
    _currentIndex = 0;
    await _loadCards();
  }
}
