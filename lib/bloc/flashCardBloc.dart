// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:flashcardquizapp/bloc/flashcardEvent.dart';
import 'package:flashcardquizapp/bloc/flashcardState.dart';


class FlashCardBloc extends Bloc<FlashcardEvent, FlashCardState> {
  final Map<String,dynamic> flashCard = {};
  FlashCardBloc() : super(const FlashCardState()) {
    on<AddFlashCard>(addFlashCard);
    // on<RemoveItems>(_removeItems);
  }
  void addFlashCard(AddFlashCard events, Emitter<FlashCardState> emit) {
    flashCard[events.question] = events.answer;
    emit(state.copyWith(flashCard: Map.from(flashCard)));
  }
  // void _removeItems(RemoveItems events, Emitter<TodoState> emit) {
  //   todolist.remove(events.text);
  //   emit(state.copyWith(todoList: Map.from(todolist)));
  // }
}