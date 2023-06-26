// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardDashBoard extends StatelessWidget {
  CardDashBoard(
      {super.key,
      this.right,
      required this.icon,
      required this.value,
      required this.color,
      required this.title});

  Color color;
  Widget icon;
  double? right;
  String title;
  String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Card(
          margin: EdgeInsets.only(right: right ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            //set border radius more than 50% of height and width to make circle
          ),
          elevation: 0,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  //margin: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 100,
                        child: Text(
                          value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}