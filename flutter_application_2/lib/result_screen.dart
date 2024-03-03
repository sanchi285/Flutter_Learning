import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/questions_summary.dart';


class ResultsScreen extends StatelessWidget{
  
 const ResultsScreen({super.key, required this.chooseAnswer});
 final List<String> chooseAnswer; 
 List<Map<String, Object>> getSummaryData(){
  final List<Map<String, Object>> summary = [];
  for(var i=0;i<chooseAnswer.length;i++){
    summary.add({
      'question_index': i,
      'question': questions[i].text,
      'correct_answer':questions[i].answers[0],
      'user_answer': chooseAnswer[i]
    });
  }
  return summary;
 } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final summaryData =  getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summaryData.where(
      (data){return data['user_answer']==data['correct_answer'];}
      ).length;

    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answerd $numCorrectQuestion out of $numTotalQuestions question correctly'),
            const SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30,),
            TextButton(onPressed: (){}, child: Text('restart quiz'))
          ],
          ),
      )
    );
  }
}