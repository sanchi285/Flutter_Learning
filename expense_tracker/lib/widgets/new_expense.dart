import 'package:expense_tracker/model/Expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget{
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
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Cancel")),
            ElevatedButton(onPressed: (){
              print(_titleController.text);
             // print(_amountController.text);
            }, 
            child: const Text('Save expense'))
          ],)
        ]
      ),
    );
  }
}