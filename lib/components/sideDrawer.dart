import 'package:eazytracker/screens/budget.dart';
import 'package:eazytracker/screens/expenses.dart';
import 'package:eazytracker/theme-data.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    DrawerHeader(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(color: Color(0xff0000cc)
                            // image:
                            ),
                        child: Container(
                            // height: MediaQuery.of(context).size.height * 0.1,
                            child: Center(
                                child: Row(children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 48.0,
                              height: 48.0,
                              child: Center(
                                  child: Text('UC',
                                      style: TextStyle(
                                          fontSize: 21,
                                          letterSpacing: 1,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold))),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                // Color(0xff1763DD)
                                // image: new DecorationImage(
                                //   fit: BoxFit.fill,
                                //   image: AssetImage(
                                //     'assets/user-avatar.png',
                                //   ),
                                // )
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hello, Chinedu!',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTheme.userIntroDark4),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Budget()));
                                },
                                child: Text('View Budgets',
                                    style: TextStyle(
                                        fontFamily: 'Boing',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        height: 0.9,
                                        color: Colors.white)),
                              )
                            ],
                          )
                        ])))),
                    SizedBox(height: 20),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Expenses()));
                      },
                      dense: true,
                      leading: Icon(Icons.dashboard),
                      title: Text('My Expenses', style: AppTheme.menu),
                      subtitle: Text('View all expenses'),
                    ),
                    ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Budget()));
                        },
                        dense: true,
                        leading: Icon(Icons.money_off),
                        title: Text('My Budgets', style: AppTheme.menu),
                        subtitle: Text('View/Create budget')),
                  ], // Populate the Drawer in the next step.
                ))),
      ],
    )));
  }
}
