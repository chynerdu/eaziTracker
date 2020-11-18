import 'package:eazytracker/components/categoryBarChart.dart';
import 'package:eazytracker/components/overTimeLineChart.dart';
import 'package:eazytracker/theme-data.dart';
import 'package:flutter/material.dart';

class ExpenseGraphOverview extends StatelessWidget {
  final TabController _tabController;
  ExpenseGraphOverview(this._tabController);

  buildOvertimeExpenseChart() {
    // Expense over time graph shows expenses made withing the last 7 days
    // see OverTimeChart component
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Text('Expenses within the last 7 days', style: AppTheme.heading4),
        Container(child: OverTimeChart())
      ],
    );
  }

  buildCategoryExpenseChart() {
    // Expense based on category is a bar chat showing expenses made under each category
    // see ExpenseCategoryChart component
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Text('Expenses based on categories', style: AppTheme.heading4),
        Container(child: ExpenseCategoryChart())
      ],
    );
  }

  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.55,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: kMinInteractiveDimension,
            flexibleSpace: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new TabBar(
                  controller: _tabController,
                  tabs: [
                    new Tab(
                      child: Row(
                        children: <Widget>[
                          Visibility(
                              visible: true,
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  // width: 5,
                                  // height: 5,

                                  child: Icon(Icons.timer))),
                          Text(
                            'Overtime',
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: <Widget>[
                          Visibility(
                              visible: true,
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  // width: 5,
                                  // height: 5,

                                  child: Icon(Icons.category))),
                          Text(
                            'By Categories',
                          )
                        ],
                      ),
                    ),
                    // new Tab(icon: new Icon(Icons.directions_bike)),
                  ],
                  indicatorColor: Colors.deepOrange,
                  unselectedLabelColor: Color(0xff4d4dff),
                  labelColor: Colors.deepOrange,
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ],
            ),
            bottomOpacity: 1,
          ),
          body: TabBarView(
            children: [
              buildOvertimeExpenseChart(),
              buildCategoryExpenseChart(),
            ],
            controller: _tabController,
          ),
        ));
  }
}
