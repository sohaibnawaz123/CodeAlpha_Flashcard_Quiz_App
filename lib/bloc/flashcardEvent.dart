// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class FlashcardEvent extends Equatable {
  const FlashcardEvent();
}

class AddFlashCard extends FlashcardEvent {
  final String question;
  final String answer;
  const AddFlashCard({required this.question, required this.answer, });
  @override
  List<Object> get props => [question,answer];
}
