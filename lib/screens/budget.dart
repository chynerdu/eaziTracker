import 'package:eazytracker/components/form-components/customButtonThree.dart';
import 'package:eazytracker/components/form-components/numberFormField.dart';
import 'package:eazytracker/components/form-components/textFormField.dart';
import 'package:eazytracker/theme-data.dart';
import 'package:flutter/material.dart';

class Budget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BudgetState();
  }
}

class BudgetState extends State<Budget> {
  // construct hardcoded data
  // data should be fetched from an API in an actual development environment

  List<Map<String, dynamic>> budget = [
    {
      "title": "Rent",
      "description": "Budget for my rent",
      "amount": "800000.00",
      "spent": "250000.00"
    },
    {
      "title": "Transportation",
      "description": "Budget for transportation expenses for the month",
      "amount": "20000.00",
      "spent": "0.000"
    },
    {
      "title": "Food and Groceries",
      "description": "Budget for food and groceries",
      "amount": "35000.00",
      "spent": "10000.000"
    },
    {
      "title": "XBox Series X",
      "description": "Budget for XBox series x console",
      "amount": "190000.00",
      "spent": "200000.000"
    },
  ];

  // open buttomsheet for creating new budget
  void _budgetModalBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      // useRootNavigator: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      )
          // BorderRadius.circular(20.0),
          ),
      context: context,
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // You can wrap this Column with Padding of 8.0 for better design
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30,
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[createBudgetForm()])),
            ));
      },
    );
  }

  createBudget() {}

  // create New Budget
  Widget createBudgetForm() {
    return Form(
        // key: _formKey,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('New Budget',
            style: TextStyle(
                fontWeight: FontWeight.w600, height: 1.2, fontSize: 15)),
        Divider(color: Colors.black45),
        SizedBox(height: 15),
        Text('Budget Title',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, height: 1.2, fontSize: 11)),
        SizedBox(height: 5),
        CustomTextFormField(hint: 'Budget Name'),
        SizedBox(height: 15),
        Text('Budget Description',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, height: 1.2, fontSize: 11)),
        SizedBox(height: 5),
        CustomTextFormField(hint: 'Budget Description'),
        SizedBox(height: 15),
        Text('Budget Amount',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, height: 1.2, fontSize: 11)),
        SizedBox(height: 5),
        CustomNumberFormField(hint: 'Target Amount'),
        SizedBox(height: 15),
        CustomButtonThree(
          createBudget,
          'Create budget',
        ),
        SizedBox(height: 40),
        // FirstButton(next, 'CHANGE PASSWORD')
      ],
    )
        // )
        // )
        );
  }

  Widget budgetList() {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemCount: budget.length,
            itemBuilder: (BuildContext context, int index) {
              return listItem(budget[index]);
            }));
  }

  Widget listItem(budget) {
    return ListTile(
        title: Text('${budget['title']}', style: AppTheme.heading_black),
        subtitle: Text('${budget['description']}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.caption),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('\₦${budget['amount']}', style: AppTheme.header3),
            Wrap(
              children: [
                Text('spent:', style: AppTheme.captionDanger),
                Text('\₦${budget['spent']}', style: AppTheme.captionDanger)
              ],
            )
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0000cc),
          title: Text('My Budget'),
          actions: [
            FlatButton.icon(
                onPressed: () {
                  _budgetModalBottomSheet(context);
                },
                icon: Icon(Icons.add, color: Colors.white),
                label:
                    Text('New Budget', style: TextStyle(color: Colors.white)))
          ],
        ),
        body: budgetList());
  }
}
