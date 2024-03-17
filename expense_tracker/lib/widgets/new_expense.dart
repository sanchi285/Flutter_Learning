//import 'dart:ffi';
//import 'dart:html';

import 'package:expense_tracker/model/Expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget{

  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  var _enteredTitle = '';

  final _titleController =  TextEditingController();
  final _amountController =  TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {

    final now = DateTime.now();
    final fisrtdate = DateTime(now.year-1,now.month,now.day);
    final pickedDate = await showDatePicker(
    context: context,
    initialDate: now, 
    firstDate: fisrtdate, 
    lastDate: now);

    setState(() {
      _selectedDate =  pickedDate;
    });
  }
  
  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid =  enteredAmount==null || enteredAmount <= 0; 
    if(_titleController.text.trim().isEmpty 
    || amountIsInvalid
    || _selectedDate==null
    ){
      //show error
      showDialog(context: context, builder: (ctx)=>AlertDialog(
          title: const Text('Invalid input'), 
          content: const Text('Please make sure you entered the right input'),  
          actions: [
            TextButton(onPressed: (){Navigator.pop(ctx);}, 
            child: const Text('Close'))
          ],     
      ));
      return;
    }
    
    widget.onAddExpense(Expense(title: _titleController.text, 
    amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    
  }

  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _saveTitleInput(String inputValue){}

  @override
  Widget build (BuildContext context){
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
         
          TextField(
           controller: _titleController, 
           maxLength: 50,
           decoration: const InputDecoration(
            label: Text('Title')
           ),
          ),
          Row(
            
           children: [Expanded(child: TextField(
           controller: _amountController, 
           keyboardType: TextInputType.number,
           maxLength: 50,
           decoration: const InputDecoration(
            label: Text('Amout'),
            prefixText: "\$"
           ),
          )),
          const SizedBox(width: 16,),
          
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            
            Text(_selectedDate == null ?'Selected Date':formatter.format(_selectedDate!)),
            IconButton(onPressed: _presentDatePicker, 
            icon: const Icon(Icons.calendar_month))

          ]),)
          ]),
          
          Row(children: [
             DropdownButton(
            value: _selectedCategory ,
            items: Category.values.map(
            (category) => DropdownMenuItem    
            ( value: category,
              child: Text(category.name.toString(),),),).toList(), 
            onChanged: (value){
              
              if(value==null) return;
              setState(() {
                _selectedCategory = value;  
              });
              
            }),
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Cancel")),
            ElevatedButton(onPressed: (){
              print(_titleController.text);
              _submitExpenseData();
              print(_amountController.text);
            }, 
            child: const Text('Save expense'))
          ],)
        ]
      ),
    );
  }
}