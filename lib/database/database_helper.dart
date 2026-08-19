import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/flashcard.dart';
import 'database_helper_mobile.dart';
import 'database_helper_web.dart';

abstract class DatabaseHelper {
  static DatabaseHelper? _instance;

  static DatabaseHelper get instance {
    _instance ??= kIsWeb ? DatabaseHelperWeb() : DatabaseHelperMobile();
    return _instance!;
  }

  Future<List<Flashcard>> getAllCards();
  Future<Flashcard> createCard(Flashcard card);
  Future<int> updateCard(Flashcard card);
  Future<int> deleteCard(String id);
  Future<void> deleteAllCards();
  Future<String?> getSetting(String key);
  Future<void> saveSetting(String key, String value);
}
