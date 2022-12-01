import 'package:final_project_year/bloc/connect_farmer_farm/cubit/connect_farmer_farm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowInfoScreen extends StatelessWidget {
  const ShowInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 70 - 14),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: AppBar(
                    backgroundColor: Colors.brown,
                    title: Center(
                      child: Text("عرض معلومات المربي"),
                    )))),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, con) {
            return Container(
              width: con.maxWidth > 800 ? con.maxWidth : 800,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
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
                                Container(
                                    width: con.maxWidth / 6,
                                    child: Text("كود المزرعة")),
                                Expanded(
                                    child: Container(
                                        width: con.maxWidth / 6,
                                        child: Text("عدد الرؤس"))),
                                Expanded(
                                    child: Container(
                                        width: con.maxWidth / 6,
                                        child: Text("الفصيلة"))),
                                Expanded(
                                    child: Container(
                                        width: con.maxWidth / 5,
                                        child: Text("التكلفة الكلية"))),
                                Container(
                                    width: con.maxWidth / 6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
                              itemBuilder: (BuildContext, int) {
                                if (int % 2 == 0) {
                                  return Container(
                                    color: Colors.brown,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "5tty667yyyuuuuiioo"))),
                                          Expanded(
                                              child: Container(
                                                  child: Text("128797"))),
                                          Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "اافغغععهعاففققثث"))),
                                          Expanded(
                                              child: Container(
                                                  child:
                                                      Text("896667787666689"))),
                                          Expanded(
                                            child: Container(
                                                child: Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )),
                                          ),
                                          Expanded(
                                            child: Container(
                                                child: CustomeButton(customeSecondColor: Colors.grey,
                                              customeMainColor: Colors.brown,
                                              cost: 655788543,
                                              farmCode: 'ooiuu6788',
                                              ssn: 9880088877,
                                              female: true,
                                              subtype: 'kklliio',
                                              totalAnimal: 86,
                                            )),
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
                                          Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "5tty667yyyuuuuiioo"))),
                                          Expanded(
                                              child: Container(
                                                  child: Text("128797"))),
                                          Expanded(
                                              child: Container(
                                                  child: Text(
                                                      "اافغغععهعاففققثث"))),
                                          Expanded(
                                              child: Container(
                                                  child:
                                                      Text("896667787666689"))),
                                          Expanded(
                                            child: Container(
                                                child: Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            )),
                                          ),
                                          Expanded(
                                            child: Container(
                                                child: CustomeButton(customeSecondColor: Colors.brown,
                                              customeMainColor: Colors.grey,
                                              cost: 655788543,
                                              farmCode: 'ooiuu6788',
                                              ssn: 9880088877,
                                              female: true,
                                              subtype: 'kklliio',
                                              totalAnimal: 86,
                                            )),
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
      child: Text(
        "تعديل",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
