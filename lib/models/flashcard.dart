class Flashcard {
  final String id;
  final String question;
  final String answer;
  final String category;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    this.category = 'General',
  });

  Flashcard copyWith({
    String? id,
    String? question,
    String? answer,
    String? category,
  }) {
    return Flashcard(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
    };
  }

  factory Flashcard.fromMap(Map<String, dynamic> map) {
    return Flashcard(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      category: map['category'] ?? 'General',
    );
  }
}
