import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseCategories extends StatelessWidget {
  final catgories = [
    {"title": "Travel", "amount": 25000.00, "icon": FontAwesomeIcons.car},
    {"title": "Groceries", "amount": 10000.00, "icon": FontAwesomeIcons.store},
    {"title": "Travel", "amount": 12000.00, "icon": FontAwesomeIcons.plane},
    {"title": "Others", "amount": 10000.00, "icon": FontAwesomeIcons.random},
  ];
  Widget build(BuildContext context) {
    customCardBoxDecorationBottom() {
      return BoxDecoration(
          color: Color(0xffe6e6ff),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(50.0),
            bottomLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0),
          ));
    }

    Widget categoryItem(category) {
      return Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.1,
          margin: EdgeInsets.only(right: 10, left: 10, top: 2),
          child: Column(
            children: [
              // header
              Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  decoration: customCardBoxDecorationBottom(),
                  child: ListTile(
                    // leading: buildImage(discount['image']),
                    // CircleAvatar(backgroundColor: Colors.deepPurple[900]),
                    title: Text('${category['title']}',
                        style: TextStyle(
                          fontFamily: 'Charlie',
                          // color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          height: 1.2,
                        )),
                    subtitle: Text('${category['amount']}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xff0000cc),
                          height: 1.2,
                          // color: Colors.white,
                        )),
                    trailing: FaIcon(category['icon'],
                        color: Color(0xff0000cc), size: 20),
                  )),
            ],
          ));
    }

    return Container(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemCount: catgories.length,
            itemBuilder: (BuildContext context, int index) {
              return categoryItem(catgories[index]);
            }));
  }
}
