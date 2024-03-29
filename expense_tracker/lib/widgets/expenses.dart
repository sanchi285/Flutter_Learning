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

 void _addExpense(Expense expense){
    setState(() {
      registeredExpenses.add(expense);
    });
  }

void _removeExpense(Expense expense){
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted"),
        action: SnackBarAction(label: "Undo", 
        onPressed: (){
          setState(() {
            registeredExpenses.insert(expenseIndex,expense);
          });
        }
        
        ),
      ),
        
    );
  }
  
  void _openAddExpenseOverlay(){
      showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (ctx){
        return NewExpense(onAddExpense: _addExpense);
        }
        );
  }

 

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found start adding some'));

    if(registeredExpenses.isNotEmpty){
      mainContent = Column(
        children: [
          const Text('the Chart'),
          Expanded(child: ExpensesList(expenses: registeredExpenses, 
          onRemoveExpense: _removeExpense,))
        ],
    );
    }

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker Chart"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, 
          icon: const Icon(Icons.add))
        ],
      ),
      body: mainContent
    );
  }
}