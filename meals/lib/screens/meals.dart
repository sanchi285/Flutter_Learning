import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/wigets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context){
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (
        (context, index) => MealItem(meal: meals[index])));

    if(meals.isEmpty){
      content = const Center(child: Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text('Uh oh nothing here'),
        SizedBox(height: 16),
      ]
      ,),);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: content
    );
  }
}