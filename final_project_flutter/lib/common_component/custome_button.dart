import 'package:flutter/material.dart';

class CustomeButton extends StatefulWidget {
  CustomeButton({super.key});

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  double elevation = 0;
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  Container(//color: Colors.red,
                    height: 30,
                    width: 150,
                    child: InkWell(onTapDown: (details) {
                       click = true;
                        elevation += 1;
                         setState(() {});
                    },
                      onTapUp: (details) {
                        click = false;
                        elevation += 1;
                         setState(() {});
                      },
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        fit: StackFit.expand,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          //

                           
                          AnimatedPositioned(
                              top: click ? 0 : 1,
                              left: click ? 0 : 0,
                              duration: Duration(microseconds: 1),
                              height: 30,
                              child: Container(
                                decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20)),
                                height: 100,
                                width: 100,
                              )),

                          AnimatedPositioned(
                              top: click ? 0 : 0,
                              left: click ? 0 : 1,
                              duration: Duration(microseconds: 1),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                                height: 30,
                                width: 150,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
