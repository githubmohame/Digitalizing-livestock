// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  Widget child;
    BackgroundScreen({
    Key? key,
    required this.child,
  }) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    return Container(decoration: const BoxDecoration( //color: Color(0xFF003e29),
                  image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/farm.jpg'))
                ),child:    child,);
  }
}
