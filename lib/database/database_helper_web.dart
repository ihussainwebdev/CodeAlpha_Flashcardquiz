import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/flashcard.dart';
import 'database_helper.dart';

// Web fallback using SharedPreferences (localStorage)
class DatabaseHelperWeb extends DatabaseHelper {
  static const String _cardsKey = 'flashcards_v3';

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<List<Flashcard>> getAllCards() async {
    final prefs = await _prefs;
    final String? jsonString = prefs.getString(_cardsKey);
    if (jsonString == null || jsonString.isEmpty) return [];
    final List<dynamic> decoded = json.decode(jsonString);
    return decoded.map((item) => Flashcard.fromMap(item)).toList();
  }

  Future<void> _saveCards(List<Flashcard> cards) async {
    final prefs = await _prefs;
    final encoded = json.encode(cards.map((c) => c.toMap()).toList());
    await prefs.setString(_cardsKey, encoded);
  }

  @override
  Future<Flashcard> createCard(Flashcard card) async {
    final cards = await getAllCards();
    cards.add(card);
    await _saveCards(cards);
    return card;
  }

  @override
  Future<int> updateCard(Flashcard card) async {
    final cards = await getAllCards();
    final index = cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      cards[index] = card;
      await _saveCards(cards);
      return 1;
    }
    return 0;
  }

  @override
  Future<int> deleteCard(String id) async {
    final cards = await getAllCards();
    final before = cards.length;
    cards.removeWhere((c) => c.id == id);
    await _saveCards(cards);
    return before - cards.length;
  }

  @override
  Future<void> deleteAllCards() async {
    await _saveCards([]);
  }

  @override
  Future<String?> getSetting(String key) async {
    final prefs = await _prefs;
    return prefs.getString('setting_$key');
  }

  @override
  Future<void> saveSetting(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString('setting_$key', value);
  }
}
