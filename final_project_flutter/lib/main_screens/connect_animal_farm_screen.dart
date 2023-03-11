import 'package:dio/dio.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:final_project_year/validations.dart';
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
  CustomeCheckbox customeCheckbox = CustomeCheckbox(
    value: false,
    text: "انثي",
  );
  DateTime? date;
  SelectAnimalType animalType = SelectAnimalType();
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
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: list[0],
                            validator: (value) {
                              if (funcStringValidation(
                                      value: value.toString(),
                                      errorHeight: 0.0) ==
                                  0.0) {
                                return null;
                              }
                              return 'the field is required';
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
                            controller: list[1],
                            validator: (value) {
                              if (funcNumValidation(
                                      value: value.toString(),
                                      errorHeight: 0.0) ==
                                  0) {
                                return null;
                              }
                              return 'the number is not a number';
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
                                    child: animalType,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 0,
                          ),
                          /*TextFormField(
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
                      ),*/
                          customeCheckbox,
                          ElevatedButton(
                              onPressed: () async {
                                date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2050));
                              },
                              child: Text('choose date')),
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
                                    overlayColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.green)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    int k = 0;
                                    print(customeCheckbox.value);
                                    if (customeCheckbox.value) {
                                      k = 1;
                                    }
                                    print(k);
                                    Map<String, dynamic> dic1 = {
                                      'operation': "insert",
                                      'species': animalType.subtype,
                                      "farm_id": list[0].text,
                                      'animal_number': list[1].text,
                                      'date': date,
                                      "is_male": k,
                                    };
                                    print(animalType.subtype);
                                    FormData formData = FormData.fromMap(
                                        dic1, ListFormat.multi, false);
                                    add_farmer_animal_api(form: formData);
                                  }
                                },
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
                                    overlayColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.red)),
                                onPressed: () {
                                  int k = 0;
                                  print(customeCheckbox.value);
                                  if (customeCheckbox.value) {
                                    k = 1;
                                  }
                                  Map<String, dynamic> dic1 = {
                                    'operation': "delete",
                                    'species': animalType.subtype,
                                    "farm_id": list[0].text,
                                    'animal_number': list[1].text,
                                    'date': date,
                                    "is_male": k,
                                  };
                                  print(animalType.subtype);
                                  FormData formData = FormData.fromMap(
                                      dic1, ListFormat.multi, false);
                                  add_farmer_animal_api(form: formData);
                                },
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
                        id: 'id',
                        func: (String value) {
                          BlocProvider.of<AnimalCubit>(context)
                              .updatePlatoon(platoon: value);
                        },
                        list: snap.data ??
                            [
                              {"id": '1', "name": "ابقار"},
                            ],
                        expanded: true,
                        value: snap.data![0]['id'].toString(),
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
                          id: 'id',
                          func: (String value) {
                            widget.subtype = value;
                          },
                          list: snap.data ??
                              [
                                {"id": '1', "name": "البراازلي"},
                              ],
                          expanded: true,
                          value: snap.data![0]['id'] ?? '1',
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
