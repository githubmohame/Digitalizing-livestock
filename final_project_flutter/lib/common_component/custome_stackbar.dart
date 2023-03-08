import 'package:flutter/material.dart';

void showSnackbar({required BuildContext context,required List<Widget> row,}) {
  var scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 700),
      content: Container(
        child: Row(
          children:row
        ),
        height: 20,
      )));
}
