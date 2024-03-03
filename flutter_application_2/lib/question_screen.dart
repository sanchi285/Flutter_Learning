

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/answer_button.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{

  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState(){
    return _QuestionScreenState();
  }

}

class _QuestionScreenState extends State<QuestionScreen>{

  var currentQuestionsIndex = 0;
  void answerQuestion(String selectedAnswer){
     widget.onSelectAnswer(selectedAnswer);
     setState(() {
        currentQuestionsIndex++;
        log("hello");
      });
    
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionsIndex];

    return   SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Text(currentQuestions.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestions.getSuffeledAnswers().map((answer) 
              {
              return AnswerButton(
              answerText: answer,
              onTap: (){
                  answerQuestion(answer);
                }
              );
              })
              
          ],
        ),
      ),
    );
  }
}