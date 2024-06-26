
import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryGridItem extends StatelessWidget{
  
  const CategoryGridItem({
    super.key,
  required this.category,
  required this.onSelectCategory
  });

  
  final Category category;
  final void Function() onSelectCategory;
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ), 
        ),
         child: Text(category.title)
         
      ),
    );
  }
}