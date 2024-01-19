import 'package:expensetracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/widgets/expenses_list/expense_item.dart';
import 'package:expensetracker/widgets/expenses_list/expenses_list.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.expenses,required this.onRemoveExpenses});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpenses;
  Widget build(BuildContext context) {
   return ListView.builder(
     itemCount: expenses.length,
     itemBuilder: (ctx,index) => Dismissible(
       key:ValueKey(expenses[index]),
       background: Container(color:Theme.of(context).colorScheme.error,),
       onDismissed:(direction){
         onRemoveExpenses(expenses[index]);
       },
       child: ExpenseItem(
           expenses[index]),
     ),
   );
  } //
}