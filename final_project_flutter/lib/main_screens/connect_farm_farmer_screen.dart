// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/main_drower.dart';
import 'package:final_project_year/input_validation/validations.dart';
import 'package:flutter/material.dart';

class ConnectFarmAndFarmerScreen extends StatefulWidget {
  const ConnectFarmAndFarmerScreen({Key? key}) : super(key: key);

  @override
  State<ConnectFarmAndFarmerScreen> createState() => _ConnectFarmAndFarmerScreenState();
}

class _ConnectFarmAndFarmerScreenState extends State<ConnectFarmAndFarmerScreen> {
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  bool isCheck = false;

  bool delete = false;
      @override
  void dispose() {
    for(TextEditingController f in controller){
      f.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return LayoutBuilder(builder: (context, constraint) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: BackgroundScreen(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: MainDrawer(index: 3),
            appBar:AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "ربط المزرعة بالمربين",
                      style: TextStyle(color: Colors.white),
                    )),
            /* constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "ربط المزرعة بالمربين",
                      style: TextStyle(color: Colors.white),
                    ))
                : null,*/
            body: Center(
              child: SingleChildScrollView(
                child: SizedBox(height:800 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     /* constraint.maxWidth > 900
                          ? SizedBox(height: 100, child: ComputerDrawer(index: 3))
                          : Container(),*/
                      const Spacer(),
                      Card(
                        color: const Color(0xFF357515),
                        elevation: 20,
                        child: Container(
                          height: 500,
                          margin: const EdgeInsets.all(20),
                          width: 600,
                          child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.transparent,
                                    )),
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                      "ربط المزرعة بالمربين",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.grey.shade900),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(),
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: controller[0],
                                      validator: (value) {
                                        double num = funcStringValidation(
                                            value: controller[0].text, errorHeight: 0.0);
                                        if (num == 0) {
                                          return null;
                                        }
                                        return 'the field should not be empty';
                                      },
                                      decoration: const InputDecoration(
                                          errorStyle: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: "السجل التجاري"),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  /* Container(
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: list[1],
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
                                  ),*/
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(),
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: controller[1],
                                      validator: (value) {
                                        if (delete) {
                                          return null;
                                        }
                                        double num = funcStringValidation(
                                            value: controller[1].text, errorHeight: 0.0);
                                        if (num == 0) {
                                          return null;
                                        }
                                        return 'the field should not be empty';
                                      },
                                      decoration: const InputDecoration(
                                          errorStyle: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: "التكلفة الكلية"),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(),
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: controller[2],
                                      validator: (value) {
                                        double num = funcNumValidation(
                                            value: controller[2].text, errorHeight: 0.0);
                                        if (num == 0) {
                                          return null;
                                        }
                                        return 'the field should not be empty';
                                      },
                                      decoration: const InputDecoration(
                                          errorStyle: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: "الرقم القومي للمربي"),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      OutlinedButton(
                                        style: ButtonStyle(
                                            fixedSize: MaterialStateProperty.all(
                                                const Size(200, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) => const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero)),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.green),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.green)),
                                        onPressed: () async {
                                          if (formKey.currentState!.validate()) {
                                            Map<String, dynamic> dic1 = {
                                              'operation': "insert",
                                              "farmer_id": controller[2].text,
                                              'farm_id': controller[0].text,
                                              'total_cost': controller[1].text
                                            };
                                            FormData formData =
                                                FormData.fromMap(dic1);
                                            var res= await Api.connect_farm_farmer_api(
                                                formData: formData);
                            
                                                 if (res.containsKey('message')) {
                                                  showSnackbardone(
                                                      context: context,
                                                      text: res['message']);
                                                } else {
                                                  showSnackbarerror(
                                                      context: context,
                                                      text: res['error']);
                                                }
                                                return;
                                          }
                                        },
                                        child: const Text(
                                          "حفظ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                        height: 20,
                                      ),
                                      OutlinedButton(
                                        style: ButtonStyle(
                                            fixedSize: MaterialStateProperty.all(
                                                const Size(200, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) => const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero)),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red)),
                                        onPressed: () async{
                                          delete = true;
                                          if (controller[2].text.isNotEmpty) {
                                            Map<String, dynamic> dic1 = {
                                              'operation': "delete",
                                              "farmer_id": controller[2].text,
                                              'farm_id': controller[0].text,
                                            };
                                            FormData formData =
                                                FormData.fromMap(dic1);
                                            var res =await Api.connect_farm_farmer_api(
                                                formData: formData);
                                               if (res.containsKey('message')) {
                                                  showSnackbardone(
                                                      context: context,
                                                      text: res['message']);
                                                } else {
                                                  showSnackbarerror(
                                                      context: context,
                                                      text: res['error']);
                                                }
                                                return;
                                          }
                                          delete = false;
                                        },
                                        child: const Text(
                                          "حذف",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
