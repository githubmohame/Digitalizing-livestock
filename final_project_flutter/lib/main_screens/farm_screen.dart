// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:final_project_year/common_component/custome_dropdownbutton.dart';
import 'package:final_project_year/common_component/custome_secure_storage.dart';
import 'package:final_project_year/common_component/google_map.dart';
import 'package:final_project_year/common_component/select_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/custome_text_field.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/input_validation/validations.dart';

enum Farm_type { farm, barn }


Future<List<Map<String, dynamic>>> f1() {
  return Future<List>.delayed(const Duration(seconds: 10)).then((value) => [
        {"kill": 'see'}
      ]);
}

class FarmScreen extends StatefulWidget {
  const FarmScreen({Key? key}) : super(key: key);

  @override
  State<FarmScreen> createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  @override
  void initState() {
    //await CustomeSecureStorage.remove_all( );
    super.initState();
  }

  FarmType farmType = FarmType();

  SectionType sectionType = SectionType();

  List<TextEditingController> controller =
      List.generate(9, (index) => TextEditingController());

  final _formGlobalKey = GlobalKey<FormState>();

  double errorHeight = 0;

  GoogleMapComponentFarmScreen googleMapComponent =
      GoogleMapComponentFarmScreen();
  SelectLocation selectLocation = SelectLocation(
    city: '',
    village: '',
  );
  void update_screen() {
    errorHeight = 0;
    if (_selectFarmType == Farm_type.farm) {
      errorHeight = funcNumValidation(
          value: controller[2].text, errorHeight: errorHeight);
      errorHeight = funcStringValidation(
          value: controller[4].text, errorHeight: errorHeight);
      errorHeight = funcStringValidation(
          value: controller[5].text, errorHeight: errorHeight);
      errorHeight = funcStringValidation(
          value: controller[6].text, errorHeight: errorHeight);
      errorHeight = funcStringValidation(
          value: controller[7].text, errorHeight: errorHeight);
      errorHeight = funcStringValidation(
          value: controller[8].text, errorHeight: errorHeight);
    }
    errorHeight =
        funcNumValidation(value: controller[1].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: controller[0].text, errorHeight: errorHeight);
    errorHeight =
        funcNumValidation(errorHeight: errorHeight, value: controller[3].text);

    setState(() {});
  }

  Farm_type _selectFarmType = Farm_type.barn;
  Future<dynamic> get_location() async {
    googleMapComponent;
    if (googleMapComponent.point == null && googleMapComponent.list1.isEmpty) {
      var f = dio.MultipartFile.fromBytes(
          await File(googleMapComponent.file.toString()).readAsBytes(),
          filename: googleMapComponent.file.toString().split(
              '/')[googleMapComponent.file.toString().split('/').length - 1]);

      return f;
    } else if (googleMapComponent.point != null) {
      print(googleMapComponent.point?.latitude);
      print(googleMapComponent.point);
      return  json.encode({
          "point": {
            "coordinates": [
              googleMapComponent.point?.longitude,
              googleMapComponent.point?.latitude
            ]
          }
        });
       
    } else if (googleMapComponent.list1.isNotEmpty) {
      String s1 = """
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [[
          [
            ${googleMapComponent.list1[0].longitude},${googleMapComponent.list1[0].latitude}
          ],
           [
            ${googleMapComponent.list1[1].longitude},${googleMapComponent.list1[1].latitude}
          ],
           [
            ${googleMapComponent.list1[2].longitude},${googleMapComponent.list1[2].latitude}
          ],
           [
            ${googleMapComponent.list1[3].longitude},${googleMapComponent.list1[3].latitude}
          ] 
        ]],
        "type": "Polygon"
      }
    }
  ]
}
""";
      var f = dio.MultipartFile.fromString(s1, filename: "file1.json");
      return f;
    }
    print("the value null ");
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            appBar: constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "اضافه المزرعة",
                      style: TextStyle(color: Colors.white),
                    ))
                : null,
            backgroundColor: Colors.red.withOpacity(0),
            drawer: constraint.maxWidth < 900 ? MainDrawer(index: 0) : null,
            body: SingleChildScrollView(
              child: SizedBox(
                height: 800 +
                    496 +
                    90 +
                    errorHeight +
                    (_selectFarmType == Farm_type.farm
                        ? 584 + 186 + 880
                        : 350) //+ 150 + 52 + 70 + 50 + 25 + 100
                ,
                child: Container(
                  child: Column(
                    children: [
                      constraint.maxWidth > 900
                          ? SizedBox(
                              height: 100, child: ComputerDrawer(index: 0))
                          : Container(),
                      Container(height: 20),
                      Card(
                        elevation: 30,
                        color: const Color(0xFF357515),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 800 +
                              496 +
                              40 +
                              18 +
                              errorHeight +
                              (_selectFarmType == Farm_type.farm
                                  ? 584 + 16 + 54
                                  : 160) //+ 150 + 52 + 70 + 50 + 25 + 100
                          ,
                          width: 700,
                          child: Form(
                              key: _formGlobalKey,
                              child: Column(
                                children: [
                                  constraint.maxWidth > 900
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Colors.transparent,
                                              )),
                                              margin: const EdgeInsets.all(10),
                                              child: const Text(
                                                "اضافة مزرعة",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  Row(
                                    children: [
                                      Radio(
                                        focusColor: Colors.blue,
                                        activeColor: Colors.blue,
                                        value: Farm_type.farm,
                                        groupValue: _selectFarmType,
                                        onChanged: (value) {
                                          if (value is Farm_type) {
                                            _selectFarmType = value;
                                          }
                                          setState(() {});
                                        },
                                      ),
                                      const Text(
                                        'المزرعة',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      Radio(
                                        focusColor: Colors.blue,
                                        activeColor: Colors.blue,
                                        value: Farm_type.barn,
                                        groupValue: _selectFarmType,
                                        onChanged: (value) {
                                          if (value is Farm_type) {
                                            _selectFarmType = value;
                                          }
                                          setState(() {});
                                        },
                                      ),
                                      const Text(
                                        'الحظيرة',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: const Text(
                                          ' ارقم السجل الضريبي او كود المزرعة',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomeTextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[ا-ي0-9]'))
                                    ],
                                    controller: controller[0],
                                    validator: (value) {
                                      String s1 = isEmpty(s1: value.toString());

                                      if (s1.isNotEmpty) {
                                        return s1;
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: const Text(
                                          'عدد عمال المزرعة',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomeTextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'))
                                    ],
                                    controller: controller[1],
                                    validator: (value) {
                                      String s1 = isEmpty(s1: value.toString());
                                      if (s1.isNotEmpty) {
                                        return s1;
                                      }
                                      s1 += biggerMin(
                                          s1: value.toString(), min: 0);
                                      if (s1.isEmpty) {
                                        return null;
                                      }

                                      return s1;
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                  _selectFarmType == Farm_type.farm
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: const Text(
                                                    'المساحة الكلية للمزرعة',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomeTextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]'))
                                              ],
                                              controller: controller[2],
                                              validator: (value) {
                                                if (_selectFarmType ==
                                                    Farm_type.farm) return null;
                                                String s1 = isEmpty(
                                                    s1: value.toString());
                                                if (s1.isNotEmpty) {
                                                  return s1;
                                                }
                                                s1 += biggerMin(
                                                    s1: value.toString(),
                                                    min: 0);
                                                if (s1.isEmpty) {
                                                  return null;
                                                }

                                                return s1;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: const Text(
                                          'ادخل اسم المزرعة',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomeTextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^[ا-ي ]{1,}[0-8]{0,8}'))
                                    ],
                                    controller: controller[3],
                                    validator: (value) {
                                      String s1 = isEmpty(s1: value.toString());
                                      if (s1.isNotEmpty) {
                                        return s1;
                                      }
                                      if (s1.isNotEmpty) {
                                        return s1;
                                      }
                                      if (s1.isEmpty) {
                                        return null;
                                      }

                                      return s1;
                                    },
                                    keyboardType: TextInputType.text,
                                  ),
                                  _selectFarmType == Farm_type.farm
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: const Text(
                                                    "اعدد الملاعب",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomeTextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]'))
                                              ],
                                              controller: controller[4],
                                              validator: (value) {
                                                if (_selectFarmType ==
                                                    Farm_type.farm) return null;
                                                String s1 = isEmpty(
                                                    s1: value.toString());
                                                if (s1.isNotEmpty) {
                                                  return s1;
                                                }

                                                s1 += biggerMin(
                                                    s1: value.toString(),
                                                    min: 0);

                                                if (s1.isEmpty) {
                                                  return null;
                                                }

                                                return s1;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  _selectFarmType == Farm_type.farm
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: const Text(
                                                    "سعة الملاعب",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomeTextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]'))
                                              ],
                                              controller: controller[5],
                                              validator: (value) {
                                                if (_selectFarmType ==
                                                    Farm_type.farm) return null;
                                                String s1 = isEmpty(
                                                    s1: value.toString());
                                                if (s1.isNotEmpty) {
                                                  return s1;
                                                }

                                                s1 += biggerMin(
                                                    s1: value.toString(),
                                                    min: 0);
                                                if (s1.isEmpty) {
                                                  return null;
                                                }

                                                return s1;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  _selectFarmType == Farm_type.farm
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: const Text(
                                                    "اعدد العنابر",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomeTextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]'))
                                              ],
                                              controller: controller[6],
                                              validator: (value) {
                                                if (_selectFarmType ==
                                                    Farm_type.farm) return null;
                                                String s1 = isEmpty(
                                                    s1: value.toString());

                                                if (s1.isNotEmpty) {
                                                  return s1;
                                                }

                                                s1 += biggerMin(
                                                    s1: value.toString(),
                                                    min: 0);
                                                if (s1.isEmpty) {
                                                  return null;
                                                }

                                                return s1;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  _selectFarmType == Farm_type.farm
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: const Text(
                                                    'عدد عنابر العزل',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomeTextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]'))
                                              ],
                                              controller: controller[7],
                                              validator: (value) {
                                                if (_selectFarmType ==
                                                    Farm_type.farm) return null;
                                                String s1 = isEmpty(
                                                    s1: value.toString());

                                                if (s1.isNotEmpty) {
                                                  return s1;
                                                }

                                                s1 += biggerMin(
                                                    s1: value.toString(),
                                                    min: 0);
                                                if (s1.isEmpty) {
                                                  return null;
                                                }

                                                return s1;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  _selectFarmType == Farm_type.farm
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: const Text(
                                                    "ادخل عدد الافدنة الملحقة",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomeTextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]'))
                                              ],
                                              controller: controller[8],
                                              validator: (value) {
                                                if (_selectFarmType ==
                                                    Farm_type.farm) return null;
                                                String s1 = isEmpty(
                                                    s1: value.toString());

                                                if (s1.isNotEmpty) {
                                                  return s1;
                                                }

                                                s1 += biggerMin(
                                                    s1: value.toString(),
                                                    min: 0);
                                                if (s1.isEmpty) {
                                                  return null;
                                                }

                                                return s1;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  sectionType,
                                  Container(
                                      height: 360,
                                      margin: const EdgeInsets.all(10),
                                      child: googleMapComponent),
                                  SizedBox(
                                    height: 300,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: selectLocation,
                                        ),
                                      ],
                                    ),
                                  ),
                                  farmType,
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(100, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                0))),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.green),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.green)),
                                        onPressed: () async {
                                          await CustomeSecureStorage
                                              .remove_all();
                                          update_screen();
                                          if (_formGlobalKey.currentState!
                                              .validate()) {
                                            dio.Dio dio1 = dio.Dio();
                                            Map<String, dynamic> dic1 = {
                                              'operation': "insert",
                                              'attached_area': 12,
                                              r'farm_type': farmType
                                                      .customeFarmType
                                                      .item_choose
                                                      .isNotEmpty
                                                  ? json.encode(farmType
                                                      .customeFarmType
                                                      .item_choose)
                                                  : null,
                                              r'isolated_wards': int.parse(
                                                  controller[7].text.isEmpty
                                                      ? '0'
                                                      : controller[7].text),
                                              'number_of_arc': int.parse(
                                                  controller[8].text.isEmpty
                                                      ? '0'
                                                      : controller[8].text),
                                              'number_of_workers': int.parse(
                                                  controller[1].text.isEmpty
                                                      ? '0'
                                                      : controller[1].text),
                                              'playground': int.parse(
                                                  controller[4].text.isEmpty
                                                      ? '0'
                                                      : controller[4].text),
                                              'section_type': sectionType
                                                      .customeDropdownButtonSectionType
                                                      .value
                                                      .isNotEmpty
                                                  ? sectionType
                                                      .customeDropdownButtonSectionType
                                                      .value
                                                  : null,
                                              'wards':
                                                  controller[6].text.isNotEmpty
                                                      ? int.parse(
                                                          controller[6].text)
                                                      : 0,
                                              'total_area_of_farm':
                                                  controller[2].text.isNotEmpty
                                                      ? int.parse(
                                                          controller[2].text)
                                                      : 0,
                                              'farm_name':
                                                  controller[3].text.isNotEmpty
                                                      ? controller[3].text
                                                      : 0,
                                              'huge_playground':
                                                  controller[5].text.isNotEmpty
                                                      ? int.parse(
                                                          controller[5].text)
                                                      : 0,
                                              'id': controller[0].text,
                                              "city": selectLocation.city,
                                              'village':
                                                  selectLocation.village
                                            };
                                            print("belly");
                                            dic1["geometry"] =
                                                await get_location();
                                            print(dic1["geometry"]);
                                            dio.FormData formData =
                                                dio.FormData.fromMap(
                                                    dic1,
                                                    dio.ListFormat
                                                        .multiCompatible,
                                                    false);
                                            Map<String, dynamic> res =
                                                await farm_api(form: formData);
                                            if (res.containsKey('message')) {
                                              showSnackbardone(
                                                  context: context,
                                                  text: res['message']);
                                            } else {
                                              showSnackbarerror(
                                                  context: context,
                                                  text: res['error']);
                                            }
                                            return;
                                          }
                                        },
                                        child: const Text(
                                          "حفظ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(100, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                0))),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red)),
                                        onPressed: () async {
                                          dio.FormData formData =
                                              dio.FormData.fromMap({
                                            'id': controller[0].text,
                                            'operation': 'delete'
                                          });
                                          var res =
                                              await farm_api(form: formData);
                                          if (res.containsKey('message')) {
                                            showSnackbardone(
                                                context: context,
                                                text: res['message']);
                                          } else {
                                            showSnackbarerror(
                                                context: context,
                                                text: res['error']);
                                          }
                                          return;
                                        },
                                        child: const Text(
                                          "حذف",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(100, 50)),
                                            shape: MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                0))),
                                            backgroundColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red),
                                            overlayColor:
                                                MaterialStateProperty.resolveWith(
                                                    (states) => Colors.red)),
                                        onPressed: () async {
                                          var f = dio.MultipartFile.fromBytes(
                                              await File(
                                                      '/home/mohamed/IdeaProjects/MainFinalProject/final_project_backend/egy_admbnda_adm1_capmas_20170421.zip')
                                                  .readAsBytes(),
                                              filename: 'locations.shp');
                                          dio.Dio dio1 = dio.Dio();
                                          Map<String, dynamic> dic1 = {
                                            'operation': "update",
                                            'attached_area': 12,
                                            r'farm_type': farmType
                                                    .customeFarmType
                                                    .item_choose
                                                    .isNotEmpty
                                                ? json.encode(farmType
                                                    .customeFarmType
                                                    .item_choose)
                                                : null,
                                            r'isolated_wards': int.parse(
                                                controller[7].text.isEmpty
                                                    ? '0'
                                                    : controller[7].text),
                                            'number_of_arc': int.parse(
                                                controller[8].text.isEmpty
                                                    ? '0'
                                                    : controller[8].text),
                                            'number_of_workers': int.parse(
                                                controller[1].text.isEmpty
                                                    ? '0'
                                                    : controller[1].text),
                                            'playground': int.parse(
                                                controller[4].text.isEmpty
                                                    ? '0'
                                                    : controller[4].text),
                                            'section_type': sectionType
                                                    .customeDropdownButtonSectionType
                                                    .value
                                                    .isNotEmpty
                                                ? sectionType
                                                    .customeDropdownButtonSectionType
                                                    .value
                                                : null,
                                            'wards': controller[6]
                                                    .text
                                                    .isNotEmpty
                                                ? int.parse(controller[6].text)
                                                : 0,
                                            'total_area_of_farm': controller[2]
                                                    .text
                                                    .isNotEmpty
                                                ? int.parse(controller[2].text)
                                                : 0,
                                            'farm_name':
                                                controller[3].text.isNotEmpty
                                                    ? controller[3].text
                                                    : 0,
                                            'huge_playground': controller[5]
                                                    .text
                                                    .isNotEmpty
                                                ? int.parse(controller[5].text)
                                                : 0,
                                            'id': controller[0].text,
                                            "city": selectLocation.city,
                                            'village':
                                                selectLocation.village
                                          };
                                          dic1["geometry"] =
                                              await get_location();
                                          dio.FormData formData =
                                              dio.FormData.fromMap(dic1,
                                                  dio.ListFormat.multi, false);
                                          var res =
                                              await farm_api(form: formData);

                                          if (res.containsKey('message')) {
                                            showSnackbardone(
                                                context: context,
                                                text: res['message']);
                                          } else {
                                            showSnackbarerror(
                                                context: context,
                                                text: res['error']);
                                          }
                                          return;
                                        },
                                        child: const Text(
                                          "تعديل",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
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

class FarmType extends StatelessWidget {
  CustomeType customeFarmType = CustomeType(title: "نوع المزرعة", list: const []);

  FarmType({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: farm_type_api(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            customeFarmType =
                CustomeType(title: "نوع المزرعة", list: snap.data ?? []);
            return BlocProvider(
              create: (context) => SelectMuiltTypeCubit(list: []),
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(10),
                child: customeFarmType,
              ),
            );
          }
          return Container();
        });
  }
}

class SectionType extends StatelessWidget {
  SectionType({super.key});
  CustomeDropdownButton customeDropdownButtonSectionType =
      CustomeDropdownButton(
    id: 'id',
    list: const [
      {"name": "عام"},
      {"name": "خاص"}
    ],
    expanded: true,
    text: "نوع القطاع",
    value: '1',
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(10),
      child: FutureBuilder(
          future: section_type_api(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              customeDropdownButtonSectionType = CustomeDropdownButton(
                  id: 'id',
                  list: snap.data ??
                      const [
                        {"name": "عام"},
                        {"name": "خاص"}
                      ],
                  expanded: true,
                  text: "نوع القطاع",
                  value: snap.data![0]['id'].toString());
              return customeDropdownButtonSectionType;
            }
            return Container();
          }),
    );
  }
}


class CustomeType extends StatefulWidget {
  List<Map<String, dynamic>> list;
  String title;
  bool visiable = false;
  List<String> item_choose = [];
  _CustomeTypeState state = _CustomeTypeState();
  CustomeType({Key? key, required this.list, required this.title})
      : super(key: key);
  @override
  State<CustomeType> createState() {
    return _CustomeTypeState();
  }
}

class _CustomeTypeState extends State<CustomeType> {
  _CustomeTypeState();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.white,
            )),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white)),
                  onPressed: () {
                    widget.visiable = !widget.visiable;
                    setState(() {});
                  },
                  icon: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        textDirection: TextDirection.rtl,
                        size: 24,
                      )),
                  label: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(widget.title,
                          style: const TextStyle(color: Colors.black)))),
            )),
        Visibility(
          visible: widget.visiable,
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
            )),
            height: 50,
            child: BlocBuilder<SelectMuiltTypeCubit, SelectMuiltTypeState>(
              builder: (context, state) {
                List<int> list = state.list;
                widget.item_choose = List.generate(list.length, (index) {
                  return widget.list[list[index]]['name'];
                });
                return ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    CustomeButton d;
                    if (list.contains(index)) {
                      d = CustomeButton(
                        customeColor: Colors.grey,
                        f: (bool click) {
                          if (click) {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .addToList(index);
                          } else {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .removeToList(index);
                          }
                        },
                        click: true,
                        text: widget.list[index].values.toList()[0],
                      );
                    } else {
                      d = CustomeButton(
                        customeColor: Colors.white,
                        f: (bool click) {
                          if (click) {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .addToList(index);
                          } else {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .removeToList(index);
                          }
                        },
                        click: false,
                        text: widget.list[index].values.toList()[0],
                      );
                    }
                    return d;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomeButton extends StatefulWidget {
  String text;
  bool click;
  Function f;
  Color customeColor;
  CustomeButton({
    Key? key,
    required this.text,
    required this.customeColor,
    required this.click,
    required this.f,
  }) : super(key: key);

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: const BorderSide(color: Colors.grey))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => widget.click ? widget.customeColor : null)),
      onPressed: () {
        widget.click = !widget.click;
        widget.f(widget.click);
        setState(() {});
      },
      child: Text(widget.text, style: const TextStyle(color: Colors.black)),
    );
  }
}
