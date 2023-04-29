import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({
    Key? key,
    required this.width,
  }) : super(key: key);

  double width;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: widget.width * (2 / 3),
              height: 40,
              color: Colors.white,
              child: TextField(
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 166, 197, 181),
                          fontSize: 20),
                      hintText: 'Search',
                      border: OutlineInputBorder(borderSide: BorderSide.none))),
            ),
          ),
        ],
      ),
    );
  }
}
