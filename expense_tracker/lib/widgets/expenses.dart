import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/model/Expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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


  void _openAddExpenseOverlay(){
      showModalBottomSheet(context: context, builder: (ctx){
        return NewExpense();
        }
        );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker Chart"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, 
          icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('the Chart'),
          Expanded(child: ExpensesList(expenses: registeredExpenses))
        ],
    )
    );
  }
}