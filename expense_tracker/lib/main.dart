import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData().copyWith(
      scaffoldBackgroundColor: Colors.amber
      ),
    home: Expenses(),    
  ));
}

