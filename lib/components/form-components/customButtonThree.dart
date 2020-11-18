import 'package:flutter/material.dart';

class CustomButtonThree extends StatelessWidget {
  final Function initFunction;
  final String title;
  CustomButtonThree(this.initFunction, this.title);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        initFunction();
        //  Navigator.pushReplacementNamed(context, '/dashboard');
        // Navigator.pushReplacementNamed(context, '/listing');
      },
      child: Text(
        title,
        style: TextStyle(
            fontSize: 12,
            fontFamily: 'SFUIDisplay',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white),
      ),
      // color: Color(0xff3700b3),
      color: Color(0xff0000cc),
      elevation: 0,
      // minWidth: 350,
      height: 35,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
