// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/circle_image_animation.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/input_validation/validations.dart';
import 'package:flutter/material.dart';

class FarmerScreen extends StatefulWidget {
  FarmerScreen(
      {Key? key,
      String? phone,
      this.edit = true,
      String? ssn,
      String? name,
      this.city,
      this.country,
      this.village})
      : super(key: key) {}
  String? villlage_code, city, country, village;
  double errorHeight = 0;

  bool edit = true;

  @override
  State<FarmerScreen> createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen> {
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  CircleImageAnimation c = CircleImageAnimation();
  CustomePasswordEnterTextField customePasswordEnterTextField =
      CustomePasswordEnterTextField(widgetIndex: 2);
  GlobalKey<FormState> f = GlobalKey<FormState>();
  double errorHeight = 0;
  void update_screen() {
    errorHeight = 0;
    errorHeight = funcStringValidation(
        value: controller[0].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: controller[1].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: controller[2].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        errorHeight: errorHeight, value: controller[3].text);
    errorHeight = funcStringValidation(
        value: controller[4].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: controller[5].text, errorHeight: errorHeight);
    errorHeight =
        funcNumValidation(value: controller[6].text, errorHeight: errorHeight);
    setState(() {});
  }

  @override
  void initState() {
    if (!widget.edit) {
      controller[0].text = "رقم التليفون$widget.phone";
      controller[1].text = "الرقم القومي:$widget.ssn";
      controller[2].text = "الاسم:$widget.name";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            drawer: MainDrawer(index: 2),
            appBar: constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "اضافه المربين",
                      style: TextStyle(color: Colors.white),
                    ))
                : null,
            body: SizedBox(
              height: 500 + 156 + 100 + errorHeight + 20 + 100 + 54 + 60 + 116,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 500 +
                      156 +
                      100 +
                      errorHeight +
                      100 +
                      20 +
                      100 +
                      54 +
                      60 +
                      116,
                  child: Column(
                    children: [
                      constraint.maxWidth > 900
                          ? SizedBox(
                              height: 100, child: ComputerDrawer(index: 2))
                          : Container(),
                      const Spacer(flex: 2),
                      Center(
                        child: Card(
                          color: const Color(0xFF357515),
                          elevation: 20,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            width: 600,
                            child: SingleChildScrollView(
                              child: Form(
                                  key: f,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      c,
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[0],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: 'الاسم الاول'),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[1],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: 'الاسم الثاني'),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[2],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: 'البريد الالكتروني'),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[3],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "رقم التليفون"),
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[4],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "الرقم القومي"),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[5],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "الوظيفة"),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: controller[6],
                                          validator: (value) {
                                            double d1 = funcNumValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'هذا الحقل يجب ادخالة';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "العمر"),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.all(10),
                                          child: customePasswordEnterTextField),
                                      !widget.edit
                                          ? Container()
                                          : OutlinedButton(
                                              style: ButtonStyle(
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          const Size(200, 50)),
                                                  shape: MaterialStateProperty.resolveWith(
                                                      (states) =>
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      30))),
                                                  backgroundColor: MaterialStateProperty.resolveWith(
                                                      (states) => Colors.green),
                                                  overlayColor:
                                                      MaterialStateProperty.resolveWith(
                                                          (states) => Colors.green)),
                                              onPressed: () async {
                                                update_screen();

                                                if (f.currentState!
                                                        .validate() &&
                                                    customePasswordEnterTextField
                                                        .f.currentState!
                                                        .validate()) {
                                                  Map<String, dynamic> dic1 = {
                                                    'operation': "insert",
                                                    "fname": controller[0].text,
                                                    'lname': controller[1].text,
                                                    'email': controller[2].text,
                                                    'phone': controller[3].text,
                                                    'ssn': controller[4].text,
                                                    'job': controller[5].text,
                                                    'age': controller[6].text,
                                                    "password":
                                                        customePasswordEnterTextField
                                                            .password,
                                                  };
                                                  if (c.image is File) {
                                                    dic1["img"] =
                                                        await MultipartFile
                                                            .fromBytes(
                                                                await c.image!
                                                                    .readAsBytes(),
                                                                filename:
                                                                    "hhyyttt");
                                                  }
                                                  print("&" * 789);
                                                  var res = await farmer_api(
                                                      form: FormData.fromMap(
                                                          dic1));

                                                  if (res
                                                      .containsKey('message')) {
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
                                                customePasswordEnterTextField
                                                    .f.currentState!
                                                    .validate();
                                              },
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      OutlinedButton(
                                        style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(200, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                30))),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red)),
                                        onPressed: () async {
                                          update_screen();
                                          Map<String, dynamic> dic1 = {};
                                          if (controller[4].text.isNotEmpty) {
                                            dic1['operation'] = 'delete';
                                            dic1['ssn'] = controller[4].text;
                                            var res = await farmer_api(
                                                form: FormData.fromMap(dic1));
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
                                          "حذف",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      OutlinedButton(
                                        style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(200, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                30))),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red)),
                                        onPressed: () async {
                                          update_screen();
                                          Map<String, dynamic> dic1 = {
                                            'operation': "update",
                                            "fname":
                                                controller[0].text.isNotEmpty
                                                    ? controller[0].text
                                                    : null,
                                            'lname':
                                                controller[1].text.isNotEmpty
                                                    ? controller[1].text
                                                    : null,
                                            'email':
                                                controller[2].text.isNotEmpty
                                                    ? controller[2].text
                                                    : null,
                                            'phone':
                                                controller[3].text.isNotEmpty
                                                    ? controller[3].text
                                                    : null,
                                            'ssn': controller[4].text.isNotEmpty
                                                ? controller[4].text
                                                : null,
                                            'job': controller[5].text.isNotEmpty
                                                ? controller[5].text
                                                : null,
                                            'age': controller[6].text.isNotEmpty
                                                ? controller[6].text
                                                : null,
                                            "password":
                                                customePasswordEnterTextField
                                                    .password,
                                          };
                                          if (c.image is File) {
                                            dic1["img"] =
                                                MultipartFile.fromBytes(
                                                    await c.image!
                                                        .readAsBytes(),
                                                    filename: "fsm1");
                                          }

                                          if (controller[4].text.isNotEmpty) {
                                            dic1['operation'] = 'update';
                                            var res = await farmer_api(
                                                form: FormData.fromMap(dic1));
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
                                          "تعديل",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
/*

  Map<String, dynamic> dic1 = {
                                                    'operation': "insert",
                                                    "fname":
                                                        widget.list[0].text.isNotEmpty?widget.list[0].text:null,
                                                    'lname':
                                                       widget.list[1].text.isNotEmpty? widget.list[1].text:null,
                                                    'email':
                                                        widget.list[2].text.isNotEmpty?widget.list[2].text:null,
                                                    'phone':
                                                       widget.list[3].text.isNotEmpty? widget.list[3].text:null,
                                                    'ssn':widget.list[4].text.isNotEmpty? widget.list[4].text:null,
                                                    "password": this
                                                        .customePasswordEnterTextField
                                                        .password,
                                                  };
*/