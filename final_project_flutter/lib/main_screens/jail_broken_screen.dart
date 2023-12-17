 import 'package:flutter/material.dart';

import '../common_component/background.dart';

class JailBreakScreen extends StatelessWidget {
  const JailBreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(child: Scaffold(backgroundColor: Colors.transparent,body: SafeArea(child: Center(child: Center(child: Wrap(
      children: [
        ElevatedButton(onPressed:() {
          
        },   child: const Text(" هذا الهاتف تم تغير اعداداتة الاصلية",style: TextStyle(color:Colors.white ,fontSize: 18 ),),) ,
      ],
    ))),)),);
  }
}