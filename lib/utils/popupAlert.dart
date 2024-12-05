// ignore_for_file: file_names
import 'package:flashcardquizapp/bloc/flashCardBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/flashcardEvent.dart';
import 'appTheme.dart';
import 'typography.dart';

Future popup({
  required BuildContext context,
  required TextEditingController questionController,
  required TextEditingController answerController,
}) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      title: Text(
        "Add Flash Card".toUpperCase(),
        style: appHeading(
            size: 24, color: Apptheme.primaryColor, weight: FontWeight.w700),
      ),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Question Feild
            TextField(
              controller: questionController,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              style: appText(size: 18, color: Apptheme.primaryColor),
              cursorColor: Apptheme.primaryColor,
              cursorWidth: 3,
              cursorRadius: const Radius.circular(20),
              decoration: InputDecoration(
                label: Text(
                  'Quiz Question',
                  style: appHeading(size: 20, color: Apptheme.primaryColor),
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Apptheme.primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Apptheme.primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Apptheme.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //answer Feild
            TextField(
              controller: answerController,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              style: appText(size: 18, color: Apptheme.primaryColor),
              cursorColor: Apptheme.primaryColor,
              cursorWidth: 3,
              cursorRadius: const Radius.circular(20),
              decoration: InputDecoration(
                label: Text(
                  'Quiz Answer',
                  style: appHeading(size: 20, color: Apptheme.primaryColor),
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Apptheme.primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Apptheme.primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Apptheme.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shadowColor: Colors.black45,
                    elevation: 8,
                    minimumSize: const Size(150, 50),
                    maximumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text(
                  'Discard'.toUpperCase(),
                  style: appHeading(size: 20, color: Apptheme.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shadowColor: Colors.black45,
                    elevation: 8,
                    minimumSize: const Size(150, 50),
                    maximumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  String ques = questionController.text.toString();
                  String ans = answerController.text.toString();
                  ctx
                      .read<FlashCardBloc>()
                      .add(AddFlashCard(question: ques, answer: ans));
                  answerController.clear();
                  questionController.clear();
                  Navigator.pop(ctx);

                },
                child: Text(
                  'Save'.toUpperCase(),
                  style: appHeading(size: 20, color: Apptheme.white),
                )),
          ],
        ),
      ],
    ),
  );
}
