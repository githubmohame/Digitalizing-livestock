import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
     return SizedBox(height: 100,
            child: Container(color: Colors.white,
              child: const Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          Text("من فضلك تاكد من اتصالك بالنت",style: TextStyle(fontSize: 16),),
                          SizedBox(height: 50,width:50, child: CircularProgressIndicator.adaptive(semanticsLabel: "تحميل الاماكن",semanticsValue: "نتتتتت",backgroundColor: Colors.black,) ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer()
                ],
              ),
            ),
          );
  }
}