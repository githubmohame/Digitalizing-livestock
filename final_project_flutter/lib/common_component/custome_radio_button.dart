// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomeRadioButton extends StatefulWidget {
  String text1;
  String text2;
  Function() f1;
  Function() f2;
  TextStyle? textStyle1, textStyle2;
  CustomeRadioButton({
    super.key,
    this.textStyle1,
    this.textStyle2,
    required this.text1,
    required this.text2,
    required this.f1,
    required this.f2,
  });

  @override
  State<CustomeRadioButton> createState() => _CustomeRadioButtonState();
}

class _CustomeRadioButtonState extends State<CustomeRadioButton> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    //widget.textStyle1!.copyWith();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Wrap(
          children: [
            GestureDetector(
              onTap: () {
                click = false;
                setState(() {});

                widget.f1();
              },
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: click ? 0 : 1,
                    duration: const Duration(milliseconds: 1),
                    child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(left: 3),
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightGreen.withOpacity(0.4)),
                        child: Wrap(
                          children: [
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.lightGreen,
                              child: Center(
                                  child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.white,
                              )),
                            ),
                            Text(
                              widget.text1,
                              style: widget.textStyle1,
                            )
                          ],
                        )),
                  ),
                  AnimatedOpacity(
                    opacity: click ? 1 : 0,
                    duration: const Duration(milliseconds: 1),
                    child: Wrap(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.lightGreen.withOpacity(0.8),
                                  width: 3),
                              shape: BoxShape.circle),
                        ),
                        Text(
                          widget.text1,
                          style: widget.textStyle1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                click = true;
 
                widget.f2();
                setState(() {});
              },
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: click ? 1 : 0,
                    duration: const Duration(milliseconds: 1),
                    child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(left: 3),
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightGreen.withOpacity(0.4)),
                        child: Wrap(
                          children: [
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.lightGreen,
                              child: Center(
                                  child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.white,
                              )),
                            ),
                            Text(widget.text2)
                          ],
                        )),
                  ),
                  AnimatedOpacity(
                    opacity: click ? 0 : 1,
                    duration: const Duration(milliseconds: 1),
                    child: Wrap(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.lightGreen.withOpacity(0.8),
                                  width: 3),
                              shape: BoxShape.circle),
                        ),
                        Text(widget.text2)
                      ],
                    ),
                  )
                ],
              ),
            ),

            //,Text("المزرعة")
          ],
        ));
  }
}
