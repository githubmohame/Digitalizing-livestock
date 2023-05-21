import 'package:flutter/material.dart';

void showSnackbardone(
    {required BuildContext context,
    required String text,
    }) {
  var scaffoldMessenger = ScaffoldMessenger.of(context);
   scaffoldMessenger.hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: const Duration(milliseconds: 1700),
      content: SizedBox(
        height: 20,
        child: Row(
          children: [
            const Icon(Icons.task_alt, color: Colors.green),
            Text(text, style: const TextStyle(color: Colors.green))
          ],
        ),
      )));
}

void showSnackbarerror({required BuildContext context, required String text}) {
  var scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: const Duration(milliseconds: 700),
      content: SizedBox(
        height: 20,
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.red),
            Text(text, style: const TextStyle(color: Colors.red))
          ],
        ),
      )));
}
