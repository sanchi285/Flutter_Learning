
import 'package:expense_tracker/model/Expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context){
    return ListView.builder(itemCount: expenses.length,itemBuilder: (cxt,index)=>
    ExpenseItem(expenses[index]),
    );
  }
}