import 'package:flutter/material.dart';

void showSnackbardone(
    {required BuildContext context,
    required String text,
    }) {
  var scaffoldMessenger = ScaffoldMessenger.of(context);
   scaffoldMessenger.hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 1700),
      content: Container(
        child: Row(
          children: [
            Icon(Icons.task_alt, color: Colors.green),
            Text(text, style: TextStyle(color: Colors.green))
          ],
        ),
        height: 20,
      )));
}

void showSnackbarerror({required BuildContext context, required String text}) {
  var scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 700),
      content: Container(
        child: Row(
          children: [
            Icon(Icons.error, color: Colors.red),
            Text(text, style: TextStyle(color: Colors.red))
          ],
        ),
        height: 20,
      )));
}
