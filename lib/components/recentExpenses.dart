import 'package:eazytracker/theme-data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecentExpenses extends StatelessWidget {
  // construct hardcoded data
  // data should be fetched from an API in an actual development environment

  final List<Map<String, dynamic>> recentExpenses = [
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
      "category": "Others",
      "amount": 10000.00,
      "date": "16 NOV 2020, 06.00 PM",
      "icon": FontAwesomeIcons.random
    },
  ];
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: recentExpenses
                .map((expense) => new ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffccccff),
                      child: FaIcon(
                        expense['icon'],
                        color: Color(0xff0000cc),
                      ),
                    ),
                    title: Text('${expense['category']}',
                        style: AppTheme.heading_black),
                    subtitle:
                        Text('${expense['date']}', style: AppTheme.caption),
                    trailing:
                        Text('${expense['amount']}', style: AppTheme.header3)))
                .toList()));
  }
}
