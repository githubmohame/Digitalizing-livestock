// ignore_for_file: non_constant_identifier_names

import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/connect_animal_farm_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Worker_Screen extends StatelessWidget {
  Worker_Screen({Key? key, String? phone, this.edit = true, String? ssn, String? name,this.city,this.country,this.village})
      : super(key: key) {
    if (!edit) {
      list[0].text = "رقم التليفون$phone";
      list[1].text = "الرقم القومي:$ssn";
      list[2].text = "الاسم:$name";
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
      child: BackgroundScreen( 
        child: LayoutBuilder(
          builder: (context,constraint) {
            return Scaffold(backgroundColor: Colors.transparent,
              drawer: MainDrawer(index: 11),
              appBar:  constraint.maxWidth<900?AppBar(elevation: 0,
                  leading: !edit
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back))
                      : null,
                  backgroundColor: Colors.transparent,
                  title: const Text("اضافه عمال",style: TextStyle(color: Colors.white),)):null,
              body: Column(
                children: [
                  constraint.maxWidth>900?SizedBox(height: 100, child: ComputerDrawer(index:11)):Container(),
                  SizedBox(width:800,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(height: constraint.maxHeight/8),
                          Form(
                               child: Card(color: Colors.white.withOpacity(0.5) ,
                                child: Container(margin:const EdgeInsets.all(50) ,
                                  child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.center,     children: [
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      enabled: edit,
                                      controller: list[0],
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                          border: InputBorder.none, hintText: 'الاسم الاول'),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      enabled: edit,
                                      controller: list[0],
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                                          border: InputBorder.none, hintText: 'الاسم الثاني'),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
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
                                  SizedBox(
                                    height: 50,
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
                                  BlocProvider(
                                    create: (context) => SelectMuiltTypeCubit(list: []),
                                    child: Container(color: Colors.white,
                                      child: CustomeType(
                                        title: "نوع العمل",
                                        list: const [
                                          {"حلب": 1},
                                          {"تعليف": 0}
                                        ],
                                      ),
                                    ),
                                  ),
                                  CustomeCheckbox(text: 'عمل دائم',value: true,),
                                  CustomeCheckbox(text: 'مقيم',value: true,),
                                  !edit
                                      ? Container()
                                      :  Wrap( 
                        children: [
                          
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith((states) =>
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green)),
                            onPressed: () {
                              
                            },
                            child: const Text(
                              "حفظ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ) ,const SizedBox(width: 20,height: 20,),
                           OutlinedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red)),
                        onPressed: () {
                        },
                        child: const Text(
                          "حذف",
                          style: TextStyle(color: Colors.white),
                        ),
                      ), 
                        ],
                      ),
                                                        ],
                                                      ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
