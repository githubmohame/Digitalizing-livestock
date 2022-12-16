import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectFarmAndFarmerScreen extends StatelessWidget {
  ConnectFarmAndFarmerScreen({Key? key}) : super(key: key);
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return   Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/farm.jpg'))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: MainDrawer(index: 3),
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text("ربط المزرعة بالمربين")),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 600,
                  color: Colors.white.withOpacity(0.5),
                  child: Form(
                      child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: list[0],
                          validator: (value) {
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "السجل التجاري"),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: list[0],
                          validator: (value) {
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: 'اسم المزرعة'),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: list[3],
                          validator: (value) {
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "التكلفة الكلية"),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: list[0],
                          validator: (value) {
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "الرقم القومي للمربي"),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.red),
                                overlayColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.red)),
                            onPressed: () {},
                            child: const Text(
                              "مسح",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.green),
                                overlayColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.green)),
                            onPressed: () {},
                            child: const Text(
                              "حفظ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
