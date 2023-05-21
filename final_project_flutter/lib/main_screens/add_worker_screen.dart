import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWorkerScreen extends StatelessWidget {
  const AddWorkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(builder: (context, constraint) {
        return Scaffold(
          drawer: MainDrawer(index: 50),
          appBar: constraint.maxWidth < 900
              ? AppBar(
                  backgroundColor: Colors.green,
                  title: const Text("اضافه عمال",style: TextStyle(color: Colors.white),))
              : null,
          body: SingleChildScrollView(
            child: Form(
                child: Card(color: const Color(0xFF357515

),
                  child: Container(padding: const EdgeInsets.all(50),
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
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "السجل التجاري"),
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
                      child: CustomeType(
                        title: "ظبيعة العمل",
                        list: const [
                          {"kill me": 1},
                          {"go to hell": 0}
                        ],
                      ),
                    ),
                    const CustomeCheckBox(),
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
                              ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}

class CustomeCheckBox extends StatefulWidget {
  const CustomeCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
        ),
        const Text("ساكن في المزرعة"),
      ],
    );
  }
}
