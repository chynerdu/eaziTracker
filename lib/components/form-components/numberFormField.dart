import 'package:flutter/material.dart';

class CustomNumberFormField extends StatelessWidget {
  final String hint;
  CustomNumberFormField({this.hint});

  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, top: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black26)),
        child: Form(
            child: TextFormField(
          keyboardType: TextInputType.number,
          // textCapitalization: TextCapitalization.characters,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 10.0),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return "Field can't be empty";
            }
          },
          onSaved: (String value) {
            // widget.onSave(value);
          },
        )));
  }
}
