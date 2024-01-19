import 'package:expensetracker/widgets/new_expense.dart';
import 'package:expensetracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(title:'Flutter course',
      amount:19.99,
      date:DateTime.now(),
      category:Category.work,),
    Expense(title:'dart course',
      amount:15.99,
      date:DateTime.now(),
      category:Category.health,)
  ];

 void _openAddExpenseOverlay(){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder:(ctx) => NewExpense(OnAddExpense:_addExpense),
        );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense){
   final expenseIndex = _registeredExpenses.indexOf(expense);
   setState(() {
     _registeredExpenses.remove(expense);
   });
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(duration:Duration(seconds: 3),
     content: Text('Expense deleted.'),
       action: SnackBarAction(
         label: 'Undo',
         onPressed: (){
           setState(() {
             _registeredExpenses.insert(expenseIndex, expense);
           });
         },
       ),));
  }

  @override
  Widget build(BuildContext context) {
   Widget mainContent = const Center(child:Text('No expenses found .start adding some !'),
   );

   if(_registeredExpenses.isNotEmpty)
     {
       mainContent = ExpensesList(
         expenses: _registeredExpenses,onRemoveExpenses: _removeExpenses,);
     }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter expense Tracker'),
        actions: [
          IconButton(
            onPressed:_openAddExpenseOverlay,
              icon:const Icon(Icons.add),
          ),
        ],
      ),
      body:Column(
        children:  [
          Text('The Chart'),
         Expanded(child:mainContent,
         ),
        ],
      ),
    );
  }

  }