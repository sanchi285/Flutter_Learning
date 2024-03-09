import 'package:expense_tracker/model/Expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<Expenses> createState(){
    
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses>{

  final List <Expense> registeredExpenses = [
    Expense(title: 'flutter course', 
    amount: 19.99, 
    date: DateTime.now(), 
    category: Category.work),
    Expense(title: 'Cenema', 
    amount: 9.99, 
    date: DateTime.now(), 
    category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Column(
        children: [
          Text('the Chart'),
          Text('Expense list')
        ],
    )
    );
  }
}