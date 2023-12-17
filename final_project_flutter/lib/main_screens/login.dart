import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/custome_secure_storage.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/auth_screen.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/show_farmer_info.dart';
import 'package:final_project_year/main_screens/totp_screen.dart';
import 'package:flutter/material.dart';

import 'farmer_screen.dart';

class LogIN extends StatefulWidget {
  const LogIN({super.key});

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  final TextEditingController _controller = TextEditingController();

  CustomePasswordUpdateTextField customePasswordUpdateTextField =
      CustomePasswordUpdateTextField();
  @override
  void initState() {
    super.initState();
    /*_controller.text = await CustomeSecureStorage.getssn();
    customePasswordUpdateTextField.controller.text =
        await CustomeSecureStorage.getpassword();*/
  }

  final _formKey = GlobalKey<FormState>();
  Widget text = Container();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(color: Colors.white),
                    ))
                : null //, drawer: MainDrawer(index: 4)
            ,
            body: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: constraint.maxWidth > 900 ? 500 : null,
                  height: 450,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:4)):Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Card(
                              color: const Color(0xFF357515),
                              elevation: 20,
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Form(
                                    child: Column(
                                  children: [
                                    const Icon(Icons.person,
                                        color: Colors.white, size: 50),
                                    FutureBuilder(
                                        future: CustomeSecureStorage.getssn(),
                                        builder: (context, snap) {
                                          _controller.text =
                                              snap.data.toString();
                                          return TextField(
                                              controller: _controller,
                                              keyboardType: TextInputType
                                                  .number,
                                              style: const TextStyle(
                                                  color: Colors.brown),
                                              decoration: const InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "ادخل الرقم القومي",
                                                  prefixIcon: Icon(
                                                    Icons.email,
                                                    color: Colors.grey,
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 5)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2)),
                                                  focusColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2))));
                                        }),
                                    const SizedBox(height: 20),
                                    FutureBuilder(
                                        future:
                                            CustomeSecureStorage.getpassword(),
                                        builder: (context, snap) {
                                          customePasswordUpdateTextField
                                              .controller
                                              .text = snap.data.toString();
                                          return customePasswordUpdateTextField;
                                        }),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    text,
                                    Row(
                                      children: [
                                        TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith((states) =>
                                                            Colors.green
                                                                .shade400)),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return ChangePasswordScreen(
                                                    showDrawer: false,
                                                  );
                                                },
                                              ));
                                            },
                                            child: const Text(
                                              "تغير كلمة المرور",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 70,
                                      child: TextButton(
                                          onPressed: () async {
                                            Map<String, dynamic> dic1 = {
                                              "ssn": _controller.text,
                                              "password":
                                                  customePasswordUpdateTextField
                                                      .controller.text
                                            };
                                            var f = await Api.login_api(
                                                formData:
                                                    FormData.fromMap(dic1));
                                            if (f['token']) {
                                              CustomeSecureStorage.setssn(
                                                  ssn: _controller.text);

                                              CustomeSecureStorage.setpassword(
                                                  password:
                                                      customePasswordUpdateTextField
                                                          .controller.text);
                                              Map m = {};
                                              if (await Api.check_totp_api()) {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                  builder: (context) {
                                                    return FutureBuilder(
                                                      future:
                                                          Api.user_athority(),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .done) {
                                                          print(snapshot.data);
                                                          CustomeSecureStorage
                                                              .setauthCount(
                                                                  user_auth:
                                                                      snapshot
                                                                          .data!
                                                                          .length);
                                                          if (snapshot.data!
                                                                  .length >
                                                              1) {
                                                            return AuthScreen(
                                                              list: snapshot
                                                                  .data!,
                                                            );
                                                          }
                                                          CustomeSecureStorage.setauth(
                                                              user_auth: snapshot
                                                                      .data![0]
                                                                  ["name"]);
                                                          if (snapshot.data![0]
                                                                  ["name"] ==
                                                              "farmer") {
                                                            print(
                                                                customePasswordUpdateTextField
                                                                    .controller
                                                                    .text);
                                                            return ShowFarmerInfo(
                                                                ssn: customePasswordUpdateTextField
                                                                    .controller
                                                                    .text);
                                                          } else if (snapshot
                                                                      .data![0]
                                                                  ["name"] ==
                                                              "admin") {
                                                            return const UpdateAnimal();
                                                          } else if (snapshot
                                                                      .data![0]
                                                                  ["name"] ==
                                                              "supervisor") {
                                                            return DashBoardScreen();
                                                          } else if (snapshot
                                                                      .data![0]
                                                                  ["name"] ==
                                                              "fockeltpoint") {
                                                            return FarmerScreen();
                                                          }
                                                        }
                                                        return Container();
                                                      },
                                                    );
                                                  },
                                                ));
                                              } else if ((m = (await Api
                                                      .send_email_totp()))
                                                  .containsKey("message")) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TotpScreen(),
                                                    ));
                                              } else {
                                                showSnackbarerror(
                                                    context: context,
                                                    text: m["error"]);
                                              }
                                            } else {
                                              text = const Text(
                                                '  كلمة المرور او الرقم القومي عير صحيح',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              );
                                              setState(() {});
                                            }
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent))),
                                              backgroundColor:
                                                  MaterialStateProperty.resolveWith(
                                                      (states) => Colors.green),
                                              side: MaterialStateProperty.resolveWith(
                                                  (states) => const BorderSide(
                                                      color: Colors.green,
                                                      style:
                                                          BorderStyle.solid))),
                                          child: const Text('تسجيل الدخول', style: TextStyle(color: Colors.white))),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer()
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
