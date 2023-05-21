import 'package:flutter/material.dart';

class CustomeDropdownButton extends StatefulWidget {
  String value;
  String text;
  String id;
  Color? color;
  Color? textColor;
  bool expanded = false;
  List<Map<String, dynamic>> list;
  void Function(String value)? func;
  CustomeDropdownButton({
    Key? key,
    required this.id,this.textColor,
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
        builder: (context, snapshot) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(color: widget.textColor),
                ),
              ],
            ),
            Row( 
              children: [
                Expanded(
                  child: DropdownButton<String>(dropdownColor: widget.color,
                    style:   TextStyle(color: Colors.brown,fontSize: 15,fontWeight: FontWeight.bold),
                    isExpanded: widget.expanded,
                    underline: Container(),
                    focusColor: widget.color ?? Colors.white,
                    
                    alignment: Alignment.bottomLeft,
                    value: widget.value,
                    items: List.generate(widget.list.length, (index) {
                      return DropdownMenuItem(
                          value: widget.list[index]["id"],
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.list[index]["name"].toString(),style: TextStyle(color: widget.textColor),
                              ),
                            ],
                          ));
                    }),
                    onChanged: (value) {
                      setState(() {
                        widget.value = value ?? widget.list[0]['name']!;
                
                        if (widget.func is Function(String value)) {
                          widget.func!(widget.value);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
