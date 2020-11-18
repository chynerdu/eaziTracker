import 'package:eazytracker/components/expenseCategories.dart';
import 'package:eazytracker/components/expenseGraphOverview.dart';
import 'package:eazytracker/components/recentExpenses.dart';
import 'package:eazytracker/components/sideDrawer.dart';
import 'package:eazytracker/screens/expenses.dart';
import 'package:eazytracker/theme-data.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  // total Expenses Overview
  buildTotalExpenses() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Expenses',
              style: AppTheme.header_light,
            ),
            SizedBox(height: 20),
            Text("\₦124999.00",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  height: 0.9,
                  letterSpacing: 1,
                  color: Colors.white,
                )),
            SizedBox(height: 40),
          ],
        ));
  }

  Widget buildContent() {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        decoration: customCardBoxDecorationBottom(),
        width: MediaQuery.of(context).size.width * 100,
        child: SingleChildScrollView(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // expense tabs and charts component
            ExpenseGraphOverview(_tabController),
            // expense categories
            Text('Expense Categories', style: AppTheme.heading4),
            SizedBox(height: 10),
            ExpenseCategories(),
            SizedBox(height: 30),
            // showing recent expenses
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Expenses', style: AppTheme.heading4),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Expenses()));
                        },
                        child: Text('See all',
                            style: TextStyle(color: Colors.deepOrange))),
                    Icon(Icons.arrow_right, color: Colors.deepOrange)
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            RecentExpenses()
          ],
        ))));
  }

  Widget buildBody() {
    return Container(
        child: Column(
      children: [
        buildTotalExpenses(),
        Expanded(flex: 3, child: buildContent())
      ],
    ));
  }

  customCardBoxDecorationBottom() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(50.0),
            topRight: const Radius.circular(50.0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0000cc),
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: SideDrawer(),
        body: buildBody());
  }
}
