import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/add_anima_farm_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Worker_Screen extends StatelessWidget {
  Worker_Screen({Key? key, String? phone, this.edit = true, String? ssn, String? name,this.city,this.country,this.village})
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
                  title: const Text("اضافه عمال")):null,
              body: Column(
                children: [
                  constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:11)):Container(),
                  Container(width:800,color: Colors.white.withOpacity(0.5),padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Form(
                          child: Column(
                        children: [
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
                          Container(
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
                          Container(
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
                          Container(
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
                              : OutlinedButton(
                                  style: ButtonStyle(
                                      fixedSize:
                                          MaterialStateProperty.all(const Size(200, 50)),
                                      shape: MaterialStateProperty.resolveWith((states) =>
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30))),
                                      backgroundColor: MaterialStateProperty.resolveWith(
                                          (states) => Colors.grey),
                                      overlayColor: MaterialStateProperty.resolveWith(
                                          (states) => Colors.brown)),
                                  onPressed: () {},
                                  child: const Text(
                                    "حفظ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                        ],
                      )),
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
