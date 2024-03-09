import "package:flutter/material.dart";
import 'package:flutter_application_2/question_screen.dart';
import 'package:flutter_application_2/start_screen.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/result_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}


 class _QuizState extends State<Quiz>{
   List<String> selectedAnswer = []; 
   var activeScreen = 'start-screen';

  void chooseAnswer(String answer){
        selectedAnswer.add(answer);
        if(selectedAnswer.length==questions.length){
          setState(() {
            //selectedAnswer=[];
            activeScreen = 'result-screen';
          });
        }
  }
  
  void switchScreen(){
      setState(() {
        activeScreen = 'question-screen';
      });
  }

  void Restart(){
     setState(() {
        selectedAnswer = [];
        activeScreen = 'start-screen';
      });
  }

  @override
  Widget build(context) {

    Widget screenWiget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen'){
      screenWiget =   QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    else if(activeScreen=='result-screen'){
      screenWiget = ResultsScreen(chooseAnswer: selectedAnswer, restartQuiz: Restart,);
    }
    else if(activeScreen=='start-screen'){
      screenWiget = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 90, 7, 235),Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft
            )
            ),
          child: screenWiget
        ,)
      ),
    );
  }
}