import 'package:flutter/material.dart';

import "package:flutter/material.dart";

class StartScreen extends StatelessWidget{

  const StartScreen(this.startQuiz,{super.key});
  
  final void Function() startQuiz;

  @override
  Widget build(context){
      return Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', 
          width: 300.5,
          color: Color.fromARGB(158, 196, 177, 199),
          ),
          const SizedBox(height: 70.5,),
          const Text('Learn flutter the fun way', 
          style: TextStyle(color: Colors.white, 
          fontSize: 24
          ),),
          const SizedBox(height: 40,),
          OutlinedButton.icon(
            onPressed: startQuiz, 
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
    
          )
        ],
      ));
  }

}