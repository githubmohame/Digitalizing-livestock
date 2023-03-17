import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/custome_secure_storage.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';

import 'farmer_screen.dart';

class LogIN extends StatefulWidget {
  LogIN({Key? key}) : super(key: key);

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  TextEditingController _controller = TextEditingController();

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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:4)):Container(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        color: Color(0xFF357515),
                        elevation: 20,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Form(
                              child: Column(
                            children: [
                              const Icon(Icons.person,
                                  color: Colors.white, size: 50),
                              FutureBuilder(
                                  future: CustomeSecureStorage.getssn(),
                                  builder: (context, snap) {
                                    _controller.text = snap.data.toString();
                                    return TextField(
                                        controller: _controller,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(color: Colors.brown),
                                        decoration: InputDecoration(
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
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2)),
                                            focusColor: Colors.white,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2))));
                                  }),
                              const SizedBox(height: 20),
                              FutureBuilder(
                                  future: CustomeSecureStorage.getpassword(),
                                  builder: (context, snap) {
                                    customePasswordUpdateTextField
                                        .controller.text = snap.data.toString();
                                    return customePasswordUpdateTextField;
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              text,
                              Container(
                                height: 50,
                                child: TextButton(
                                    onPressed: () async {
                                      Map<String, dynamic> dic1 = {
                                        "ssn": _controller.text,
                                        "password":
                                            customePasswordUpdateTextField
                                                .controller.text
                                      };
                                      var f = await login_api(
                                          formData: FormData.fromMap(dic1));
                                      print(f['token'].runtimeType);
                                      if (f['token']) {
                                        CustomeSecureStorage.setssn(
                                            ssn: _controller.text);
                                        CustomeSecureStorage.setpassword(
                                            password:
                                                customePasswordUpdateTextField
                                                    .controller.text);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Farmer(),
                                            ));
                                      } else {
                                        text = Text(
                                          '  كلمة المرور او الرقم القومي عير صحيح',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        );
                                        setState(() {
                                          
                                        });
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                                side: const BorderSide(
                                                    color:
                                                        Colors.transparent))),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.green),
                                        side: MaterialStateProperty.resolveWith(
                                            (states) => const BorderSide(
                                                color: Colors.green,
                                                style: BorderStyle.solid))),
                                    child: const Text('تسجيل الدخول',
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
          );
        }),
      ),
    );
  }
}
