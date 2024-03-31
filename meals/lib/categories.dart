import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/wigets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget{

  const CategoriesScreen({super.key});

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
          CategoryGridItem(category: category)
        ],)
    );
  }
}