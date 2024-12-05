// ignore_for_file: file_names

import 'package:flashcardquizapp/bloc/flashCardBloc.dart';
import 'package:flashcardquizapp/bloc/flashcardState.dart';
import 'package:flashcardquizapp/utils/popupAlert.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/appTheme.dart';
import '../utils/typography.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            popup(
                context: context,
                questionController: _questionController,
                answerController: _answerController);
          },
          backgroundColor: Apptheme.primaryColor,
          child: const Icon(
            CupertinoIcons.add_circled_solid,
            color: Apptheme.white,
            size: 30,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Apptheme.primaryColor,
          title: Text(
            'Flash Card Quiz'.toUpperCase(),
            style: appHeading(color: Apptheme.white, size: 24),
          ),
        ),
        body: BlocBuilder<FlashCardBloc, FlashCardState>(
          builder: (context, state) {
            if (state.flashCard.isEmpty) {
              return const Center(
                child: Text('No Data found'),
              );
            } else if (state.flashCard.isNotEmpty) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2.5,mainAxisSpacing: 10,crossAxisSpacing: 10,
                      crossAxisCount: 1,),itemCount: state.flashCard.length,
                  itemBuilder: (context, index) {
                    final question = state.flashCard.keys.elementAt(index);
                    final answer = state.flashCard[question];
                    return FlipCard(front: Card(
                      color: Apptheme.primaryColor,
                      shadowColor: Apptheme.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Center(child: Text(question.toUpperCase(),style: appHeading(size: 20, color: Apptheme.white,weight: FontWeight.w600),textAlign: TextAlign.left,)),
                      ),
                    ), back: Card(
                      color: Apptheme.tertiary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Center(child: Text(answer.toString(),style: appText(size: 16, color: Apptheme.black),textAlign: TextAlign.left,)),
                      )
                    ));
                  });
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}


