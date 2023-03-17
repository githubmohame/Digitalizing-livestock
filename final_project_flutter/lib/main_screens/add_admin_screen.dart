import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdmin extends StatelessWidget {
  AddAdmin({super.key});
  SelectLocation selectLocation = SelectLocation(village: '', city: '');
  CustomePasswordEnterTextField customePasswordEnterTextField =
      CustomePasswordEnterTextField(widgetIndex: 90);
  GlobalKey<FormState> f = GlobalKey<FormState>();
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'تسجيل المدرين',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.transparent,
          drawer: MainDrawer(index: 9),
          body: SingleChildScrollView(
            child: Center(
              child: Card(
                elevation: 20,
                color: Color(0xFF467061),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 700,
                      child: Form(
                          key: f,
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.person,
                                  color: Colors.grey, size: 50),
                              TextField(
                                  controller: list[0],
                                  contextMenuBuilder:
                                      (context, editableTextState) {
                                    final TextEditingValue value =
                                        editableTextState.textEditingValue;
                                    final List<ContextMenuButtonItem>
                                        buttonItems = editableTextState
                                            .contextMenuButtonItems;
                                    editableTextState.contextMenuAnchors;
                                    return TextButton(
                                        onPressed: () {}, child: Text('data'));
                                  },
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.brown),
                                  decoration: InputDecoration(
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white,
                                      hintText: "ادخل الاسم",
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.brown,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),
                                      focusColor: Colors.grey,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)))),
                              const SizedBox(height: 20),
                              TextField(
                                  controller: list[1],
                                  contextMenuBuilder:
                                      (context, editableTextState) {
                                    final TextEditingValue value =
                                        editableTextState.textEditingValue;
                                    final List<ContextMenuButtonItem>
                                        buttonItems = editableTextState
                                            .contextMenuButtonItems;
                                    editableTextState.contextMenuAnchors;
                                    return TextButton(
                                        onPressed: () {}, child: Text('data'));
                                  },
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.brown),
                                  decoration: InputDecoration(
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white,
                                      hintText: "ادخل  email",
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.brown,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),
                                      focusColor: Colors.grey,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)))),
                              const SizedBox(height: 20),
                              TextField(
                                  controller: list[2],
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.brown),
                                  decoration: InputDecoration(
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white,
                                      hintText: "ادخل رقم الهاتف  ",
                                      prefixIcon: Icon(
                                        Icons.security,
                                        color: Colors.brown,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),
                                      focusColor: Colors.grey,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)))),
                              customePasswordEnterTextField,
                              TextField(
                                  controller: list[3],
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.brown),
                                  decoration: InputDecoration(
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white,
                                      hintText: "ادخل الرقم القومي",
                                      prefixIcon: Icon(
                                        Icons.security,
                                        color: Colors.brown,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),
                                      focusColor: Colors.grey,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)))),
                              const SizedBox(height: 20),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 250,
                                child: Row(
                                  children: [
                                    /*Expanded(
                                    child: BlocProvider(
                                  create: (context) => LocationCubit(
                                      city: 'مركز دكرنس',
                                      gavernorate: 'الدقهلية',
                                      village: 'الجزيره'),
                                  child: Builder(builder: (context) {
                                    selectLocation.village =
                                        selectLocation == ''
                                            ? 'الجزيره'
                                            : selectLocation.village;
                                    selectLocation.city = 'مركز دكرنس';
                                    return selectLocation;
                                  }),
                                )),*/
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: TextButton(
                                    onPressed: () {
                                      if (f.currentState!.validate() &&
                                          customePasswordEnterTextField
                                              .f.currentState!
                                              .validate()) {
                                        Map<String, dynamic> dic1 = {
                                          'operation': "insert",
                                          "fname": list[0].text,
                                          'email': list[1].text,
                                          'phone': list[2].text,
                                          'ssn': list[3].text,
                                          "password": this
                                              .customePasswordEnterTextField
                                              .password,
                                        };

                                        operation_admin_api(
                                            formData: FormData.fromMap(dic1));
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: const BorderSide(
                                                    color: Colors.red))),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.grey),
                                        side: MaterialStateProperty.resolveWith(
                                            (states) => const BorderSide(
                                                color: Colors.grey,
                                                style: BorderStyle.solid))),
                                    child: const Text('تسجيل المدير',
                                        style: TextStyle(color: Colors.white))),
                              ),
                              SizedBox(
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
                                            (states) => Colors.red),
                                    overlayColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.red)),
                                onPressed: () {
                                  Map<String, dynamic> dic1 = {};
                                  if (list[3].text.isNotEmpty) {
                                    dic1['operation'] = 'delete';
                                    dic1['ssn'] = list[3].text;
                                    operation_admin_api(
                                        formData: FormData.fromMap(dic1));
                                    showSnackbardone(context: context, text: 'done');
                                  }
                                },
                                child: const Text(
                                  "حذف",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: TextButton(
                                    onPressed: () {
                                      if (list[3].text.isNotEmpty) {
                                        Map<String, dynamic> dic1 = {
                                          'operation': "insert",
                                          "fname": list[0].text.isEmpty
                                              ? null
                                              : list[0].text,
                                          'email': list[1].text.isEmpty
                                              ? null
                                              : list[1].text,
                                          'phone': list[2].text.isEmpty,
                                          'ssn': list[3].text,
                                          "password": this
                                              .customePasswordEnterTextField
                                              .password,
                                        };

                                        operation_admin_api(
                                            formData: FormData.fromMap(dic1));
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: const BorderSide(
                                                    color: Colors.red))),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.grey),
                                        side: MaterialStateProperty.resolveWith(
                                            (states) => const BorderSide(
                                                color: Colors.grey,
                                                style: BorderStyle.solid))),
                                    child: const Text('تسجيل المدير',
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String textInside) {
    return true;
  }
}
