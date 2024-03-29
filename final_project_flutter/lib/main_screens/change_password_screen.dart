// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/main_drower.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key, this.showDrawer = true});
  bool showDrawer = true;
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int x = 0;
  bool error = false;
  CustomePasswordEnterTextField customePasswordEnterTextField =
      CustomePasswordEnterTextField(
    widgetIndex: 9,
  );
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            drawer: widget.showDrawer
                ? MainDrawer(
                    index: 10,
                  )
                : null,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: constraint.maxWidth > 900
                  ? Container()
                  : const Center(
                      child: Center(
                          child: Text(
                      'تغير الرقم السري',
                      style: TextStyle(color: Colors.white),
                    ))),
            ),
            /*constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Center(
                        child: Center(
                            child: Text(
                      'تغير الرقم السري',
                      style: TextStyle(color: Colors.white),
                    ))),
                  )
                : null,*/
            body: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*constraint.maxWidth > 900
                          ? SizedBox(height: 100, child: ComputerDrawer(index: 10))
                          : Container(),*/
                      Card(
                        color: const Color(0xFF357515),
                        elevation: 20,
                        child: SizedBox(
                          width: 600,
                          child: SafeArea(
                              child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                constraint.maxWidth > 900
                                    ? const Text(
                                        'تغير الرقم السري',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    : Container(),
                                Theme(
                                    data: ThemeData(
                                      primaryColor: Colors.green,
                                      colorScheme: const ColorScheme.light(),
                                      canvasColor: Colors.transparent,
                                    ),
                                    child: SizedBox(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          /*constraint.maxWidth > 900
                                                          ?Text('تغير رقم المرور',style: TextStyle(fontSize: 20,color: Colors.white),):Container(),*/
                                          Expanded(
                                            child: Stepper(
                                                margin: const EdgeInsets.all(5),
                                                elevation: 0,
                                                onStepContinue: x < 1
                                                    ? () {
                                                        if (!error) {
                                                          if (x < 1) {
                                                            setState(() {
                                                              x += 1;
                                                            });
                                                          }
                                                        }
                                                      }
                                                    : x == 1
                                                        ? () {}
                                                        : null,
                                                onStepCancel: x > 0
                                                    ? () {
                                                        x -= 1;
                                                        setState(() {});
                                                      }
                                                    : null,
                                                currentStep: x,
                                                onStepTapped: (value) {},
                                                type: StepperType.horizontal,
                                                controlsBuilder:
                                                    (context, details) {
                                                  _controller.clear();
                                                  return Container(
                                                      child: Wrap(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () async {
                                                          if (x == 0) {
                                                            Map<String, dynamic>
                                                                dic1 = {
                                                              "ssn": _controller
                                                                  .text
                                                            };
                                                            FormData formData =
                                                                FormData
                                                                    .fromMap(
                                                                        dic1);
                                                            Map b = await Api
                                                                .change_password_email_api(
                                                                    formData:
                                                                        formData);
                                                            if (b.containsKey(
                                                                'message')) {
                                                              showSnackbardone(
                                                                  context:
                                                                      context,
                                                                  text: b[
                                                                      'message']);
                                                              error = false;
                                                            } else {
                                                              showSnackbarerror(
                                                                  context:
                                                                      context,
                                                                  text: b[
                                                                      'error']);
                                                              error = true;
                                                            }
                                                          }
                                                          if (x == 1) {
                                                            customePasswordEnterTextField
                                                                .f.currentState!
                                                                .validate();
                                                            Map<String, dynamic>
                                                                dic1 = {
                                                              "code":
                                                                  _controller
                                                                      .text,
                                                              'password':
                                                                  customePasswordEnterTextField
                                                                      .password,
                                                            };
                                                            FormData formData =
                                                                FormData
                                                                    .fromMap(
                                                                        dic1);

                                                           Map<String,dynamic> message= await Api
                                                                .change_password_email_done_api(
                                                                    formData:
                                                                        formData);
                                                            showSnackbardone(context: context,text: message["message"]);
                                                          }
                                                          details
                                                              .onStepContinue!();
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .resolveWith(
                                                                        (states) {
                                                          if (details
                                                                  .onStepContinue ==
                                                              null) {
                                                            return Colors.brown;
                                                          } else if (x == 2) {
                                                            return Colors.green;
                                                          } else {
                                                            return Colors
                                                                .brown.shade300;
                                                          }
                                                        })),
                                                        child: Text(
                                                          x == 1
                                                              ? 'حفظ'
                                                              : 'استكمال',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                      x == 0
                                                          ? Container()
                                                          : TextButton(
                                                              onPressed: details
                                                                  .onStepCancel,
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.resolveWith((states) =>
                                                                    details.onStepCancel ==
                                                                            null
                                                                        ? Colors
                                                                            .brown
                                                                        : Colors
                                                                            .brown
                                                                            .shade300),
                                                              ),
                                                              child: const Text(
                                                                'تراجع',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ))
                                                    ],
                                                  ));
                                                },
                                                steps: [
                                                  Step(
                                                      isActive: x == 0,
                                                      title: const Text(
                                                          "ادخل الرقم القومي"),
                                                      content: Container(
                                                        //height: 400,
                                                        color: Colors.white,
                                                        child: Column(
                                                          children: [
                                                            TextField(
                                                              controller:
                                                                  _controller,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              decoration: const InputDecoration(
                                                                  focusColor: Colors.white,
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  border: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  hintText: "الرقم القومي"),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Step(
                                                      isActive: x == 1,
                                                      title: const Text(
                                                        'التأكيد',
                                                      ),
                                                      content: Container(
                                                        // height: 400,
                                                        color:
                                                            Colors.transparent,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                "لقد قمنا بارسال كود لك على البريد الالكتروني من فضلك ادخل الكود",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black)),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  _controller,
                                                              decoration: const InputDecoration(
                                                                  fillColor: Colors.white,
                                                                  focusColor: Colors.white,
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  filled: true,
                                                                  border: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  hintText: " ادخل الكود"),
                                                            ),
                                                            Container(
                                                                height: 10),
                                                            customePasswordEnterTextField
                                                          ],
                                                        ),
                                                      )),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )),
                        ),
                      ),
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
  Step(
                               
                                  content: )

*/