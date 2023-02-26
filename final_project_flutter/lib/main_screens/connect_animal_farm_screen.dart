import 'package:final_project_year/api_function.dart/locations_api.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';

class ConnectAnimalFarm extends StatelessWidget {
  ConnectAnimalFarm({Key? key}) : super(key: key);
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
      child: BackgroundScreen(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: MainDrawer(index: 13),
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                "اضافة حيوانات للمزرعة",
                style: TextStyle(color: Colors.white),
              )),
          body: Center(
            child: Card(
              color: Color(0xFF357515),
              child: Container(
                padding: EdgeInsets.all(50),
                width: 700,
                child: SingleChildScrollView(
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: list[0],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: "السجل التجاري"),
                        keyboardType: TextInputType.text,
                      ),
                      Container(
                        height: 10,
                      ),
                      TextFormField(
                        controller: list[0],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'اسم المزرعة'),
                        keyboardType: TextInputType.text,
                      ),
                      Container(
                        height: 10,
                      ),
                      TextFormField(
                        controller: list[2],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: "عدد الحيوانات"),
                        keyboardType: TextInputType.number,
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: BlocProvider<AnimalCubit>(
                                create: (context) => AnimalCubit(
                                    platoon: 'الابقار', species: ''),
                                child: SelectAnimalType(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0,
                      ),
                      TextFormField(
                        controller: list[3],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: "التكلفة الكلية"),
                        keyboardType: TextInputType.number,
                      ),
                      Container(
                        height: 0,
                      ),
                      CustomeCheckbox(
                        value: false,
                        text: "انثي",
                      ),
                      Container(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.green),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green)),
                            onPressed: () {},
                            child: const Text(
                              "حفظ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.red),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.red)),
                            onPressed: () {},
                            child: const Text(
                              "حذف",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),
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
            child: FutureBuilder(
                future: platoon_type_api(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, String>> &&
                      snap.data!.isNotEmpty)
                    return CustomeDropdownButton(
                        func: (String value) {
                          BlocProvider.of<AnimalCubit>(context)
                              .updatePlatoon(platoon: value);
                        },
                        list: snap.data ??
                            [
                              {"id": '', "name": "ابقار"},
                            ],
                        expanded: true,
                        value:'الابقار'?? 'ابقار',
                        text: "نوع الحيوان");
                  return Container();
                })),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<AnimalCubit, AnimalInitial>(
            buildWhen: (previous, current) {
              //
              return previous.platoon != current.platoon;
            },
            builder: (context, state) {
              return FutureBuilder(
                  future: animal_species_api(platoon: state.platoon),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, String>> &&
                        snap.data!.isNotEmpty)
                      return CustomeDropdownButton(
                          func: (String value) {},
                          list: snap.data ??
                              [
                                {"id": '', "name": "البراازلي"},
                              ],
                          expanded: true,
                          value: snap.data![0]['name'] ?? 'ابقار',
                          text: "فصيله الحيوان");
                    return Container();
                  });
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
        Checkbox(
          checkColor: Colors.grey,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.white),
          value: widget.value,
          onChanged: (value) {
            setState(() {
              widget.value = value ?? false;
            });
          },
        ),
        Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
