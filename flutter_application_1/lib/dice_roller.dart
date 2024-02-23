import 'package:flutter/material.dart';
import 'package:flutter_application_1/style_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class DiceRoller extends StatefulWidget{
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState(){
    return _DiceRollerState();
  }

}

class _DiceRollerState extends State<DiceRoller>{

   var currentDiceRoll =  2;
   final ramdomizer = Random();
   void rollDice(){
     var diceRoll = ramdomizer.nextInt(6)+1;
     setState(() {
      currentDiceRoll =  diceRoll;//"assets/images/dice-$diceRoll.png"; 
     });
      
   }

  @override
  Widget build(context){
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [Image.asset("assets/images/dice-$currentDiceRoll.png"),
              const SizedBox(height: 25.5)
            ,TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.deepPurpleAccent), 
              child: const StyledText("Roll Dice")
              )
            ],) ;
  }
}