// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class FlashCardState extends Equatable {
  final Map<String,dynamic> flashCard;
  const FlashCardState({this.flashCard = const {}});

  FlashCardState copyWith({Map<String,dynamic>? flashCard}) {
    return FlashCardState(flashCard: flashCard ?? this.flashCard);
  }

  @override
  List<Object?> get props => [flashCard];
}