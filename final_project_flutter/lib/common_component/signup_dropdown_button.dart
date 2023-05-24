import 'package:final_project_year/main_screens/login.dart';
import 'package:flutter/material.dart';

class CustomeDropdownButtomSignUp extends StatefulWidget {
  int value;
  CustomeDropdownButtomSignUp({
    Key? key,
    required this.value,
  }) : super(key: key);
  @override
  State<CustomeDropdownButtomSignUp> createState() => _CustomeDropdownButtomSignUpState();
}

class _CustomeDropdownButtomSignUpState extends State<CustomeDropdownButtomSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: DropdownButton(
        isDense: true,
        isExpanded: true,
        underline: Container(),
        value: widget.value,
        items: [
          DropdownMenuItem<int>(
            child: Container(
              child: Row(
                children: [
                  Expanded(child: Icon(Icons.person_2_rounded)),
                  Expanded(
                      child: Text(
                    'SignOut',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                ],
              ),
            ),
            value: 13,
          ),
          DropdownMenuItem<int>(
            child: Container(
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/icons/profile_pic.png')),
                  Expanded(
                      child: Text(
                    'Mohamed',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                ],
              ),
            ),
            value: 12,
          ),
        ],
        onChanged: (value) {
          if (value == 13) {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return LogIN();
              },
            ));
          }
          ;
        },
      ),
    );
  }
}
