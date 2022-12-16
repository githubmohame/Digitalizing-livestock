// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ShowInfoScreen extends StatelessWidget {
  const ShowInfoScreen({Key? key}) : super(key: key);

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
                      child: Text("عرض معلومات المربي"),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.brown.shade100),
                        child: LayoutBuilder(builder: (context, con) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: con.maxWidth / 6,
                                    child: const Text("السجل التجاري")),
                                Expanded(
                                    child: SizedBox(
                                        width: con.maxWidth / 6,
                                        child: const Text("عدد الرؤس"))),
                                Expanded(
                                    child: SizedBox(
                                        width: con.maxWidth / 6,
                                        child: const Text("الفصيلة"))),
                                Expanded(
                                    child: SizedBox(
                                        width: con.maxWidth / 5,
                                        child: const Text("التكلفة الكلية"))),
                                SizedBox(
                                    width: con.maxWidth / 6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text("اتثي"),
                                      ],
                                    )),
                                Expanded(
                                    child: Container(
                                  width: con.maxWidth / 6,
                                ))
                              ]);
                        }),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height - 55 - 18,
                          width: con.maxWidth > 800.0 ? con.maxWidth : 800.0,
                          decoration:
                              BoxDecoration(color: Colors.blue.shade100),
                          child: ListView.builder(
                              itemCount: 1000,
                              // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                              itemBuilder: (BuildContext, int) {
                                if (int % 2 == 0) {
                                  return Container(
                                    color: Colors.brown,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                              child: Text(
                                                  "5tty667yyyuuuuiioo")),
                                          Expanded(
                                              child: Container(
                                                  child: const Text("128797"))),
                                          Expanded(
                                              child: Container(
                                                  child: const Text(
                                                      "اافغغععهعاففققثث"))),
                                          Expanded(
                                              child: const Text("896667787666689")),
                                          Expanded(
                                            child: Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomeButton(customeSecondColor: Colors.grey,
                                              customeMainColor: Colors.brown,
                                              cost: 655788543,
                                              farmCode: 'ooiuu6788',
                                              ssn: 9880088877,
                                              female: true,
                                              subtype: 'kklliio',
                                              totalAnimal: 86,
                                            ),
                                          )
                                        ]),
                                  );
                                } else {
                                  //print(int % 2 == 0);
                                  return Container(
                                    color: Colors.grey,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                              child: Text(
                                                  "5tty667yyyuuuuiioo")),
                                          const Expanded(
                                              child: Text("128797")),
                                          const Expanded(
                                              child: Text(
                                                  "اافغغععهعاففققثث")),
                                          Expanded(
                                              child: Container(
                                                  child:
                                                      const Text("896667787666689"))),
                                          Expanded(
                                            child: Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomeButton(customeSecondColor: Colors.brown,
                                              customeMainColor: Colors.grey,
                                              cost: 655788543,
                                              farmCode: 'ooiuu6788',
                                              ssn: 9880088877,
                                              female: true,
                                              subtype: 'kklliio',
                                              totalAnimal: 86,
                                            ),
                                          )
                                        ]),
                                  );
                                }
                              })),
                    ],
                  ),
                ),
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
      {required this.ssn,required this.customeSecondColor,
      required this.farmCode,
      required this.female,
      required this.cost,
      required this.subtype,
      required this.totalAnimal,
      required this.customeMainColor});

  @override
  Widget build(BuildContext context) {
    print(female);
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
