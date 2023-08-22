import 'package:flutter/material.dart';

class CustomeSearch extends StatefulWidget {
  CustomeSearch({
    Key? key,
    required this.width,required this.controller,
    required this.text,
  }) : super(key: key);

  String text;
  double? width;
  TextEditingController controller;
  @override
  State<CustomeSearch> createState() => _CustomeSearchState();
}

class _CustomeSearchState extends State<CustomeSearch> {
  double height = 100;
  bool visiable = false;

  @override
  Widget build(BuildContext context) {
    return Row ( children:[Spacer(),
        Expanded(
          child: Container(
            //width: 400,
              height: height,decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.all( Radius.circular(120))),
              child: TextField(controller: widget.controller,
                onChanged: (value) {
                  if (value.isEmpty && visiable) {
                    setState(() {
                      visiable = false;
                    });
                  } else if (!visiable) {
                    setState(() {
                      //height = 200;
                      visiable = true;
                    });
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(120) )),
                    hintText: 'ادخل اسم المزارع او المزرعة',
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white),
              )),
        ),Spacer(),
      ],
    );
  }
}