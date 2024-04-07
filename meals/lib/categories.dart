

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';

import 'package:meals/wigets/category_grid_item.dart';
import 'package:meals/model/category.dart';

class CategoriesScreen extends StatelessWidget{

  const CategoriesScreen({super.key});


  void _selectedCategory(BuildContext context, Category category){

    final filteredmeals = dummyMeals.
    where((meal) => meal.categories.contains(category.id))
    .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: 
        (ctx)=>MealsScreen(
        title: category.title, 
        meals: filteredmeals)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
        children: [
          for(final category in availableCategories)
          CategoryGridItem(category: category, onSelectCategory: (){
            _selectedCategory(context, category);
          },)
        ],)
    );
  }
}