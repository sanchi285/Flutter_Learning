import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget
{
  const AnswerButton({super.key,
  required this.answerText,
  required this.onTap}
  );

  final String answerText;
  final void Function() onTap; 

  @override
  Widget build(context){
      return 
      ElevatedButton(onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 42, 43, 59),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ), 
      child: Text(answerText, textAlign: TextAlign.center),
      );
  }
}