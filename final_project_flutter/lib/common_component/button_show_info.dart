import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowInfoButtom extends StatefulWidget {
  const ShowInfoButtom({super.key});

  @override
  State<ShowInfoButtom> createState() => _ShowInfoButtomState();
}

class _ShowInfoButtomState extends State<ShowInfoButtom> {
  bool is_visb = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [Text("kkkkkkk")],
              );
            },
          );
        },
        icon: Icon(Icons.location_on));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
