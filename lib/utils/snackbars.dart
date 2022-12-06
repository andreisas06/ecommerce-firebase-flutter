import 'package:flutter/material.dart';

openWarningSnackBar(context, String text, Widget icon) {
  // This should be called by an on pressed function
  // Example:
  // Button(
  //  onTap: (){
  //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   backgroundColor: Colors.blue,
  //   content: Text("Your Text"),
  //   duration: Duration(milliseconds: 1500),
  // ));
  // }
  //)
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Row(
      children: [
        icon,
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    ),
    duration: Duration(milliseconds: 12500),
  ));
}
