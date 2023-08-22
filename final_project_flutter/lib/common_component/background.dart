// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
 class BackgroundScreen extends StatelessWidget {
  Widget child;
    BackgroundScreen({
    Key? key,
    required this.child,
  }) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    return Container(decoration: const BoxDecoration(  color: Color.fromARGB(234, 36, 93, 19),
                  //image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/farm.jpg'))
                ),child:    child,);
  }
}
