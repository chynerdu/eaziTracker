import 'package:eazytracker/theme-data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpensesState();
  }
}

class ExpensesState extends State<Expenses> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  // construct hardcoded data
  // data should be fetched from an API in an actual development environment

  List<Map<String, dynamic>> expenses = [
    {
      "category": "Travel",
      "amount": 25000.00,
      "date": "18 NOV 2020, 02.00 PM",
      "icon": FontAwesomeIcons.car
    },
    {
      "category": "Entertainment",
      "amount": 10000.00,
      "date": "17 NOV 2020, 01.00 PM",
      "icon": FontAwesomeIcons.gamepad
    },
    {
      "category": "Travel",
      "amount": 12000.00,
      "date": "17 NOV 2020, 09.00 AM",
      "icon": FontAwesomeIcons.plane
    },
    {
      "category": "Entertainment",
      "amount": 2000.00,
      "date": "16 NOV 2020, 09.00 PM",
      "icon": FontAwesomeIcons.gamepad
    },
    {
      "category": "Travel",
      "amount": 15000.00,
      "date": "15 NOV 2020, 09.00 AM",
      "icon": FontAwesomeIcons.plane
    },
    {
      "category": "Groceries",
      "amount": 17500.00,
      "date": "15 NOV 2020, 11.00 AM",
      "icon": FontAwesomeIcons.store
    },
    {
      "category": "Others",
      "amount": 10000.00,
      "date": "14 NOV 2020, 06.00 PM",
      "icon": FontAwesomeIcons.random
    },
  ];

  endDrawerWidget() {
    return SafeArea(
        child: Drawer(
            elevation: 16.0,
            child: Center(child: Text('Implement Filter Here')
                // padding: EdgeInsets.only(top: 10),

                )));
  }

  Widget expensesList() {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemCount: expenses.length,
            itemBuilder: (BuildContext context, int index) {
              return listItem(expenses[index]);
            }));
  }

  Widget listItem(expense) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xffccccff),
          child: FaIcon(
            expense['icon'],
            color: Color(0xff0000cc),
          ),
        ),
        title: Text('${expense['category']}', style: AppTheme.heading_black),
        subtitle: Text('${expense['date']}', style: AppTheme.caption),
        trailing: Text('${expense['amount']}', style: AppTheme.header3));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xff0000cc),
          title: Text('All Expenses'),
          actions: [
            FlatButton.icon(
              label: Text('Filter Expenses ',
                  style: TextStyle(color: Colors.white)),
              // alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 0, right: 0),
              icon: Icon(Icons.filter_list, color: Colors.white, size: 26),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
            )
          ],
        ),
        endDrawer: endDrawerWidget(),
        body: expensesList());
  }
}
