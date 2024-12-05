class Flashcard {
  final String cardId;
  final String flashQuestion;
  final String flashAnswer;

  Flashcard(
      {required this.cardId,
      required this.flashQuestion,
      required this.flashAnswer});

  Map<String, dynamic> toMap() {
    return {
      'cardId': cardId,
      'flashQuestion': flashQuestion,
      'flashAnswer': flashAnswer
    };
  }

  factory Flashcard.fromMap(Map<String, dynamic> json) {
    return Flashcard(
        cardId: json['cardId'],
        flashQuestion: json['flashQuestion'],
        flashAnswer: json['flashAnswer']);
  }
}
