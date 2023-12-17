// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ShowInfoScreen extends StatelessWidget {
  const ShowInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 70 - 14),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: AppBar(
                    backgroundColor: Colors.brown,
                    title: const Center(
                      child: Text(
                        "عرض معلومات المربي",
                        style: TextStyle(color: Colors.white),
                      ),
                    )))),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, con) {
            return SizedBox(
              width: con.maxWidth > 800 ? con.maxWidth : 800,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: con.maxWidth > 800 ? con.maxWidth : 800,
                    child: Column(
                      children: [
                        Row(
                          children: [
                             const Expanded(child: Text('عدد الرؤوس')),
                            const Expanded(child: Text('الفصيلة')),
                            const Expanded(child: Text('التاريخ')),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {}, child: const Text('الخريطة'))),
                            
                          ],
                        ),
                        Container(height: 1,color: Colors.grey,),
                        SizedBox(height: 900-20,
                              child: ListView.builder(itemCount: 100,
                                itemBuilder: (context, index) {
                                 return SizedBox(height: 70,
                                    child: Row(
                                      children: [
                                         const Expanded(child: Text('عدد الرؤوس')),
                                        const Expanded(child: Text('الفصيلة')),
                                        const Expanded(child: Text('التاريخ')),
                                        Expanded(
                                            child: Container()),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                      ],
                    )),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  //int index;
  int ssn;
  String farmCode;
  bool female;
  double cost;
  String subtype;
  Color customeMainColor;
  Color customeSecondColor;
  int totalAnimal;
  CustomeButton(
      {super.key, required this.ssn,
      required this.customeSecondColor,
      required this.farmCode,
      required this.female,
      required this.cost,
      required this.subtype,
      required this.totalAnimal,
      required this.customeMainColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => customeMainColor),
          overlayColor:
              MaterialStateProperty.resolveWith((states) => Colors.orange)),
      child: const Text(
        "تعديل",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
