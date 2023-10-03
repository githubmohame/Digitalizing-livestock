// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomeDropdownButton extends StatefulWidget {
  int value;
  String text;
  String id;
  Color? color;
  Color? textColor;
  bool expanded = false;
  List<Map<String, dynamic>> list;
  void Function(int value)? func;
  CustomeDropdownButton({
    Key? key,
    required this.id,
    this.textColor,
    this.func,
    required this.value,
    this.color,
    required this.text,
    required this.expanded,
    required this.list,
  }) : super(key: key);

  @override
  State<CustomeDropdownButton> createState() => _CustomeDropdownButtonState();
}

class _CustomeDropdownButtonState extends State<CustomeDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Colors.white,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: () async {
          return [
            {"": ""}
          ];
        }(),
        builder: (context, snapshot) => Wrap(
          children: [
            Text(
              widget.text,
              style: TextStyle(color: widget.textColor),
            ),
            DropdownButton<int>(
              dropdownColor: widget.color,
              style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              isExpanded: widget.expanded,
              underline: Container(),
              focusColor: widget.color ?? Colors.white,
              alignment: Alignment.bottomLeft,
              value: widget.value,
              items: List.generate(widget.list.length, (index) {
                return DropdownMenuItem(
                    value: widget.list[index][widget.id],
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.list[index]["name"].toString(),
                          style: TextStyle(color: widget.textColor),
                        ),
                      ],
                    ));
              }),
              onChanged: (value) {
                setState(() {
                  widget.value = value ?? widget.list[0]['id']!;
                  if (widget.func is Function(int value)) {
                    widget.func!(widget.value);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeDropDownButtonSelectAuth extends StatefulWidget {
  String value;
  String text;
  String id;
  Color? color;
  Color? textColor;
  bool expanded = false;
  List<Map<String, dynamic>> list;
  void Function(String value)? func;
  CustomeDropDownButtonSelectAuth({
    Key? key,
    required this.value,
    required this.id,
    required this.text,
    //required this.id,
    this.color,
    required this.func,
    this.textColor,
    required this.expanded,
    required this.list,
  }) : super(key: key);
  @override
  State<CustomeDropDownButtonSelectAuth> createState() =>
      _CustomeDropDownButtonSelectAuthState();
}

class _CustomeDropDownButtonSelectAuthState
    extends State<CustomeDropDownButtonSelectAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Colors.white,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: () async {
          return [
            {"": ""}
          ];
        }(),
        builder: (context, snapshot) => Wrap(
          children: [
            Text(
              widget.text,
              style: TextStyle(color: widget.textColor),
            ),
            DropdownButton<String>(
              dropdownColor: widget.color,
              style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              isExpanded: widget.expanded,
              underline: Container(),
              focusColor: widget.color ?? Colors.white,
              alignment: Alignment.bottomLeft,
              value: widget.value,
              items: List.generate(widget.list.length, (index) {
                return DropdownMenuItem<String>(
                    value: widget.list[index][widget.id],
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.list[index][widget.id],
                          style: TextStyle(color: widget.textColor),
                        ),
                      ],
                    ));
              }),
              onChanged: (value) {
                setState(() {
                  widget.value = value ?? "";
                  if (widget.func is Function(String value)) {
                    widget.func!(widget.value);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeDropDownButtonDrawer extends StatefulWidget {
  CustomeDropDownButtonDrawer(
      {super.key, required this.index, required this.text, required this.l1});
  String text;
  int index;
  List<DropdownMenuItem<int>> l1;
  @override
  State<CustomeDropDownButtonDrawer> createState() =>
      _CustomeDropDownButtonDrawerState();
}

class _CustomeDropDownButtonDrawerState
    extends State<CustomeDropDownButtonDrawer> {
  bool visable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(widget.text),
        Expanded(
          child: TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Color(0xff14452f)),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Color(0xff14452f))),
              onPressed: () {
                visable = !visable;
                setState(() {});
              },
              icon: Icon(Icons.arrow_drop_down),
              label: Text("الاضافة البيانات")),
        ),
        Expanded(
          child: Visibility(
              visible: visable,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Text("اضافة المزرعة"),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white)),
                    );
                  },
                ),
              )),
        )
      ],
    );
  }
}
/*
 BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Color(0xff14452f),
      ),
*/