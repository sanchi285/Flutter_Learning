import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';


class MealItem extends StatelessWidget{

  const MealItem({super.key,
  required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(child: InkWell(
      onTap: (){},
      child: Stack(
        children: [
          FadeInImage(placeholder: MemoryImage(kTransparentImage
          ), image: NetworkImage(meal.imageUrl)
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Column(
                children: [
                  Text(meal.title, 
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,

                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                    ],
                  )
                ],
              ),
            ))
        ],
      ),
    ));
  }

}