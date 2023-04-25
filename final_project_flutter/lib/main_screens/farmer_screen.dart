// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/input_validation/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      : super(key: key) {
    if (!edit) {
      list[0].text = "رقم التليفون" + phone.toString();
      list[1].text = "الرقم القومي:" + ssn.toString();
      list[2].text = "الاسم:" + name.toString();
    }
  }
  String? villlage_code, city, country, village;
  double errorHeight = 0;
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  bool edit = true;

  @override
  State<FarmerScreen> createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen> {
  CustomePasswordEnterTextField customePasswordEnterTextField =
      CustomePasswordEnterTextField(widgetIndex: 2);
  GlobalKey<FormState> f = GlobalKey<FormState>();
  double errorHeight = 0;
  void update_screen() {
    errorHeight = 0;
    errorHeight = funcStringValidation(
        value: widget.list[0].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: widget.list[1].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: widget.list[2].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        errorHeight: errorHeight, value: widget.list[3].text);
    errorHeight = funcStringValidation(
        value: widget.list[4].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: widget.list[5].text, errorHeight: errorHeight);
    errorHeight =
        funcNumValidation(value: widget.list[6].text, errorHeight: errorHeight);
    setState(() {
      print(errorHeight);
    });
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
            body: Container(
              height: 500 + 156 +100+ errorHeight + 20 + 54 + 60 + 116,
              child: SingleChildScrollView(
                child: Container(
                  height: 500 + 156 + 100+errorHeight + 20 + 54 + 60 + 116,
                  child: Column(
                    children: [
                      constraint.maxWidth > 900
                          ? Container(
                              height: 100, child: ComputerDrawer(index: 2))
                          : Container(),
                      Spacer(flex: 2),
                      Center(
                        child: Card(
                          color: Color(0xFF357515),
                          elevation: 20,
                          child: Container(
                            margin: EdgeInsets.all(20),
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
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[0],
                                          validator: (value) {
                                            print('done1');
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: 'الاسم الاول'),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[1],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              print('done2');
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              errorStyle:
                                                  TextStyle(color: Colors.red),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: 'الاسم الثاني'),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[2],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              print('done3');
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: 'البريد الالكتروني'),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[3],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            if (d1 != 0) {
                                              print('done4');
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "رقم التليفون"),
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[4],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            print('done5');
                                            if (d1 != 0) {
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "الرقم القومي"),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[5],
                                          validator: (value) {
                                            double d1 = funcStringValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            print('done5');
                                            if (d1 != 0) {
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "الوظيفة"),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enabled: widget.edit,
                                          controller: widget.list[6],
                                          validator: (value) {
                                            double d1 = funcNumValidation(
                                                value: value.toString(),
                                                errorHeight: 0.0);
                                            print('done5');
                                            if (d1 != 0) {
                                              return 'the field should have a value';
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: "العمر"),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.all(10),
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
                                              onPressed: () async{
                                                update_screen();

                                                if (f.currentState!
                                                        .validate() &&
                                                    customePasswordEnterTextField
                                                        .f.currentState!
                                                        .validate()) {
                                                  Map<String, dynamic> dic1 = {
                                                    'operation': "insert",
                                                    "fname":
                                                        widget.list[0].text,
                                                    'lname':
                                                        widget.list[1].text,
                                                    'email':
                                                        widget.list[2].text,
                                                    'phone':
                                                        widget.list[3].text,
                                                    'ssn': widget.list[4].text,
                                                    'job': widget.list[5].text,
                                                    'age': widget.list[6].text,
                                                    "password": this
                                                        .customePasswordEnterTextField
                                                        .password,
                                                  };

                                                  var res =await farmer_api(
                                                      form: FormData.fromMap(
                                                          dic1));

                                                    if (res.containsKey('message')) {
                                            showSnackbardone(
                                                context: context,
                                                text: res['message']);
                                          } else {
                                            showSnackbarerror(
                                                context: context,
                                                text: res['error']);
                                          }
                                          return null;       
                                                }
                                              },
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                      SizedBox(
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
                                        onPressed: ()async {
                                          update_screen();
                                          Map<String, dynamic> dic1 = {};
                                          if (widget.list[4].text.isNotEmpty) {
                                            dic1['operation'] = 'delete';
                                            dic1['ssn'] = widget.list[4].text;
                                           var res= await farmer_api(
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
                                          return null;
                                          }
                                        },
                                        child: const Text(
                                          "حذف",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
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
                                        onPressed: () async{
                                          update_screen();
                                          Map<String, dynamic> dic1 = {
                                            'operation': "update",
                                            "fname":
                                                widget.list[0].text.isNotEmpty
                                                    ? widget.list[0].text
                                                    : null,
                                            'lname':
                                                widget.list[1].text.isNotEmpty
                                                    ? widget.list[1].text
                                                    : null,
                                            'email':
                                                widget.list[2].text.isNotEmpty
                                                    ? widget.list[2].text
                                                    : null,
                                            'phone':
                                                widget.list[3].text.isNotEmpty
                                                    ? widget.list[3].text
                                                    : null,
                                            'ssn':
                                                widget.list[4].text.isNotEmpty
                                                    ? widget.list[4].text
                                                    : null,
                                            'job':
                                                widget.list[5].text.isNotEmpty
                                                    ? widget.list[5].text
                                                    : null,
                                            'age':
                                                widget.list[6].text.isNotEmpty
                                                    ? widget.list[6].text
                                                    : null,
                                            "password": this
                                                .customePasswordEnterTextField
                                                .password,
                                          };
                                          if (widget.list[4].text.isNotEmpty) {
                                            dic1['operation'] = 'update';
                                            var res=await farmer_api(
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
                                          return null;
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
                      Spacer(flex: 2),
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