import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_drower.dart';

import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSupplierScreen extends StatelessWidget {
  const AddSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: Scaffold(backgroundColor: Colors.transparent,
          drawer: MainDrawer(index: 50),
          appBar:
              AppBar(backgroundColor: Colors.green, title: const Text("اضافه عمال",style: TextStyle(color: Colors.white),)),
          body: Card(
            child: SingleChildScrollView(
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "رقم التليفون"),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        return null;
                      },
                      decoration:
                          const InputDecoration(border: InputBorder.none, hintText: "السجل التجاري"),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "الاسم"),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                   BlocProvider(
                    create: (context) => SelectMuiltTypeCubit(list: []),
                    child: Container(
                      child: CustomeType(title:  "اسم المنتج",
                        list: const [
                          {"kill me": 1},
                          {"go to hell": 0}
                        ],
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey),
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.green)),
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
        ),
      ),
    );
  }
}
