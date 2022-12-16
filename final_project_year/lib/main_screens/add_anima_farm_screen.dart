import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/bloc/connect_farmer_farm/cubit/connect_farmer_farm_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';

class AddAnimalScreen extends StatelessWidget {
  AddAnimalScreen({Key? key}) : super(key: key);
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MainDrawer(index: 12),
        appBar: AppBar(
            backgroundColor: const Color(0x0FF9c6644),
            title: const Text("اضافة حيوانات للمزرعة")),
        body: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: list[0],
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
                  controller: list[0],
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'اسم المزرعة'),
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
                  controller: list[2],
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "عدد الحيوانات"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      child: BlocProvider<ChoiceCubit>(
                        create: (context) =>
                            ChoiceCubit(gavernorate: 0, city: 0, village: 0),
                        child: SelectAnimalType(),
                      ),
                    ),
                  ],
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
                  controller: list[3],
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "التكلفة الكلية"),
                  keyboardType: TextInputType.number,
                ),
              ),
              CustomeCheckbox(
                value: false,
                text: "انثي",
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey),
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red)),
                    onPressed: () {},
                    child: const Text(
                      "مسح",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
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
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey),
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShowInfoScreen(),
                          ));
                    },
                    child: const Text(
                      "عرض",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class SelectAnimalType extends StatefulWidget {
  SelectAnimalType({Key? key, this.subtype}) : super(key: key);
  String? subtype;
  @override
  State<SelectAnimalType> createState() => _SelectAnimalTypeState();
}

class _SelectAnimalTypeState extends State<SelectAnimalType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
            )),
            child: CustomeDropdownButton(
                func: (int value) {
                  BlocProvider.of<ChoiceCubit>(context)
                      .updateGavernorate(value);
                },
                list: [
                  {"id": 0, "name": "اسيوط"},
                  {"id": 1, "name": "القاهرة"},
                  {"id": 2, "name": "المنةفية"}
                ],
                expanded: true,
                value: 0,
                text: "نوع الحيوان")),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<ChoiceCubit, ChoiceState>(
            buildWhen: (previous, current) {
              //
              return previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              return CustomeDropdownButton(
                  func: (int value) {
                    BlocProvider.of<ChoiceCubit>(context).updateCity(value);
                  },
                  list: [
                    {"id": 1, "name": "القاهرة"},
                    {"id": 0, "name": "القاهرة"}
                  ],
                  expanded: true,
                  value: 0,
                  text: "فصيله الحيوان");
            },
          ),
        )
      ],
    );
  }
}

//class CustomeContainer extends Container {}

/*
 OutlinedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.grey),
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.orange)),
                                    onPressed: () {},
                                    child: Text(
                                      "تعديل",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
*/
class CustomeCheckbox extends StatefulWidget {
  bool value;
  String text;
  CustomeCheckbox({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);
  @override
  State<CustomeCheckbox> createState() => _CustomeCheckboxState();
}

class _CustomeCheckboxState extends State<CustomeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(checkColor: Colors.grey,fillColor: MaterialStateProperty.resolveWith((states) => Colors.white)  ,
          value: widget.value,
          onChanged: (value) {
            setState(() {
              widget.value = value ?? false;
            });
          },
        ),
        Text(widget.text,style: TextStyle(color: Colors.black),)
      ],
    );
  }
}
