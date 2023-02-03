// ignore_for_file: non_constant_identifier_names

import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Farmer extends StatelessWidget {
  Farmer({Key? key, String? phone, this.edit = true, String? ssn, String? name,this.city,this.country,this.village})
      : super(key: key) {
    if (!edit) {
      list[0].text = "رقم التليفون" + phone.toString();
      list[1].text = "الرقم القومي:" + ssn.toString();
      list[2].text = "الاسم:" + name.toString();
    }
  }
  bool edit = true;
  String? villlage_code,city,country,village;
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(decoration:BoxDecoration(color: Colors.transparent,image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/farm.jpg'))),
        child: LayoutBuilder(
          builder: (context,constraint) {
            return Scaffold( backgroundColor: Colors.transparent,
              drawer: MainDrawer(index: 2),
              appBar: constraint.maxWidth<900?AppBar(elevation: 0,leading: !edit?IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)):null,
                  backgroundColor: Colors.transparent, title: const Text("اضافه المربين")):null,
              body: Column(
                children: [
                  constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:2)):Container(),
                  Spacer(flex: 2),
                  Center(
                    child: Container(margin: EdgeInsets.all(20),width:600,color: Colors.white.withOpacity(0.5),
                      child: SingleChildScrollView( 
                        child: Form(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                          children: [
                             Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: edit,
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                    border: InputBorder.none, hintText:'الاسم الاول'),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: edit,
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                    border: InputBorder.none, hintText:'الاسم الثاني'),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: edit,
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                    border: InputBorder.none, hintText:'البريد الالكتروني'),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: edit,
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                    border: InputBorder.none, hintText: "رقم التليفون"),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: edit,
                                controller: list[1],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                    border: InputBorder.none, hintText: "الرقم القومي"),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(margin: EdgeInsets.all(10),child: CustomePasswordEnterTextField(widgetIndex: 2)),
                            !edit?Container():OutlinedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                  shape: MaterialStateProperty.resolveWith((states) =>
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  backgroundColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.green),
                                  overlayColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.green)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ShowInfoScreen(),
                                    ));
                              },
                              child: const Text(
                                "حفظ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                             SizedBox(height: 10,),
                            OutlinedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                  shape: MaterialStateProperty.resolveWith((states) =>
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  backgroundColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.red),
                                  overlayColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ShowInfoScreen(),
                                    ));
                              },
                              child: const Text(
                                "حذف",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                   Spacer(flex: 2),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
