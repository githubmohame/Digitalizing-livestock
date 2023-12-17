// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import "package:flutter/foundation.dart";
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:final_project_year/common_component/circle_image_animation.dart';
import 'package:final_project_year/common_component/custome_dropdownbutton.dart';
import 'package:final_project_year/common_component/custome_radio_button.dart';
//import 'package:final_project_year/common_component/google_map.dart';
import 'package:final_project_year/common_component/google_map_farm.dart';
import 'package:final_project_year/common_component/select_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/custome_text_field.dart';
import 'package:final_project_year/common_component/main_drower.dart';
import 'package:final_project_year/input_validation/validations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../common_component/show_load_screen.dart';

enum FarmTypeEnum { farm, barn }

Future<List<Map<String, dynamic>>> f1() {
  return Future<List>.delayed(const Duration(seconds: 10)).then((value) => [
        {"kill": 'see'}
      ]);
}

class FarmScreen extends StatefulWidget {
  const FarmScreen({super.key});

  @override
  State<FarmScreen> createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  CircleImageAnimation c = CircleImageAnimation();
  @override
  void initState() {
    //await CustomeSecureStorage.remove_all( );
    Api.add_farm_map_bounder_api().then((value) {
      if (value is List<LatLng>) {
        if (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS) {
          googleMapComponent.googleMapComponent = GoogleMapFarmPhone(
            l1: LatLngBounds.fromPoints(value),
          );
        } else {
          /*
          googleMapComponent.googleMapComponent =
              GoogleMapComponentDesktopFarmScreen(
            l1: LatLngBounds.fromPoints(value),
          );*/
          googleMapComponent.googleMapComponent = GoogleMapFarmPhone(
            l1: LatLngBounds.fromPoints(value),
          );
        }
      }
      setState(() {});
    });
    super.initState();
  }

  FarmType farmType = FarmType();

  SectionType sectionType = SectionType();

  List<TextEditingController> controller =
      List.generate(10, (index) => TextEditingController());

  final _formGlobalKey = GlobalKey<FormState>();

  double errorHeight = 0;

  GoogleMapFarmScreen googleMapComponent = GoogleMapFarmScreen();
  SelectLocation selectLocation = SelectLocation(
    city: -1,
    village: -1,
  );
  void updateScreen() {
    errorHeight = 0;
    if (_selectFarmType == FarmTypeEnum.farm) {
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
        funcNumValidation(value: controller[2].text, errorHeight: errorHeight);
    errorHeight =
        funcNumValidation(value: controller[9].text, errorHeight: errorHeight);
    errorHeight =
        funcNumValidation(value: controller[1].text, errorHeight: errorHeight);
    errorHeight = funcStringValidation(
        value: controller[0].text, errorHeight: errorHeight);
    errorHeight =
        funcNumValidation(errorHeight: errorHeight, value: controller[3].text);

    setState(() {});
  }

  FarmTypeEnum _selectFarmType = FarmTypeEnum.barn;
  Future<dynamic> getLocation() async {
    print(googleMapComponent.googleMapComponent.point);
    googleMapComponent.googleMapComponent;
    if (googleMapComponent.googleMapComponent.point == null &&
        googleMapComponent.googleMapComponent.list1.isEmpty &&
        googleMapComponent.googleMapComponent.file != null) {
      var f = dio.MultipartFile.fromBytes(
          await File(googleMapComponent.googleMapComponent.file.toString())
              .readAsBytes(),
          filename: googleMapComponent.googleMapComponent.file
              .toString()
              .split('/')[googleMapComponent.googleMapComponent.file
                  .toString()
                  .split('/')
                  .length -
              1]);

      return f;
    } else if (googleMapComponent.googleMapComponent.point != null) {
      return json.encode({
        "point": {
          "coordinates": [
            googleMapComponent.googleMapComponent.point?.longitude,
            googleMapComponent.googleMapComponent.point?.latitude
          ]
        }
      });
    } else if (googleMapComponent.googleMapComponent.list1.isNotEmpty) {
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
            ${googleMapComponent.googleMapComponent.list1[0].longitude},${googleMapComponent.googleMapComponent.list1[0].latitude}
          ],
           [
            ${googleMapComponent.googleMapComponent.list1[1].longitude},${googleMapComponent.googleMapComponent.list1[1].latitude}
          ],
           [
            ${googleMapComponent.googleMapComponent.list1[2].longitude},${googleMapComponent.googleMapComponent.list1[2].latitude}
          ],
           [
            ${googleMapComponent.googleMapComponent.list1[3].longitude},${googleMapComponent.googleMapComponent.list1[3].latitude}
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
    return null;
  }

  @override
  void dispose() {
    for (TextEditingController f in controller) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text(
                  "اضافه المزرعة",
                  style: TextStyle(color: Colors.white),
                )) /*constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "اضافه المزرعة",
                      style: TextStyle(color: Colors.white),
                    ))
                : null*/
            ,
            backgroundColor: Colors.red.withOpacity(0),
            drawer: MainDrawer(
                index:
                    0), //constraint.maxWidth < 900 ? MainDrawer(index: 0) : null,
            body: SingleChildScrollView(
              child: SizedBox(
                height: 900 +
                    14 +
                    74 +
                    496 +
                    90 +
                    100 +
                    errorHeight +
                    (_selectFarmType == FarmTypeEnum.farm
                        ? 584 + 186 + 37
                        : 350 + 14) //+ 150 + 52 + 70 + 50 + 25 + 100
                ,
                child: Center(
                  child: Card(
                    elevation: 30,
                    color: const Color(0xFF357515),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 890 +
                          40 +
                          496 +
                          40 +
                          18 +
                          100 +
                          errorHeight +
                          (_selectFarmType == FarmTypeEnum.farm
                              ? 584 + 16 + 54 + 90 + 14
                              : 14 +
                                  40 +
                                  160 +
                                  14) //+ 150 + 52 + 70 + 50 + 25 + 100
                      ,
                      width: 700,
                      child: Form(
                          key: _formGlobalKey,
                          child: Column(
                            children: [
                              constraint.maxWidth > 900
                                  ? Wrap(
                                      alignment: WrapAlignment.start,
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.center,
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
                              c,
                              Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  //direction: Axis.vertical,
                                  children: [
                                    CustomeRadioButton(
                                      textStyle1: const TextStyle(fontSize: 15),
                                      text1: "مزرعة",
                                      f1: () {
                                        if (_selectFarmType ==
                                            FarmTypeEnum.barn) {
                                          setState(() {});
                                          _selectFarmType = FarmTypeEnum.farm;
                                        }
                                      },
                                      text2: "حظيرة",
                                      f2: () {
                                        if (_selectFarmType ==
                                            FarmTypeEnum.farm) {
                                          setState(() {});
                                          _selectFarmType = FarmTypeEnum.barn;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Wrap(
                                  textDirection: TextDirection.rtl,
                                  alignment: WrapAlignment.end,
                                  runAlignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment
                                      .end, //direction: Axis.vertical,
                                  //mainAxisAlignment: MainAxisAlignment.start,
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
                                      'عدد عمال المزرعة الداخلين',
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
                                  s1 += biggerMin(s1: value.toString(), min: 0);
                                  if (s1.isEmpty) {
                                    return null;
                                  }

                                  return s1;
                                },
                                keyboardType: TextInputType.number,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text(
                                      'عدد عمال المزرعة الخارجين',
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
                                controller: controller[9],
                                validator: (value) {
                                  String s1 = isEmpty(s1: value.toString());
                                  if (s1.isNotEmpty) {
                                    return s1;
                                  }
                                  s1 += biggerMin(s1: value.toString(), min: 0);
                                  if (s1.isEmpty) {
                                    return null;
                                  }

                                  return s1;
                                },
                                keyboardType: TextInputType.number,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: const Text(
                                          'المساحة الكلية للمزرعة',
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
                                    controller: controller[2],
                                    validator: (value) {
                                      if (_selectFarmType ==
                                          FarmTypeEnum.farm) {
                                        return null;
                                      }
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
                                ],
                              ),
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
                              _selectFarmType == FarmTypeEnum.farm
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
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
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'))
                                          ],
                                          controller: controller[4],
                                          validator: (value) {
                                            if (_selectFarmType !=
                                                FarmTypeEnum.farm) {
                                              return null;
                                            }
                                            String s1 =
                                                isEmpty(s1: value.toString());
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
                                      ],
                                    )
                                  : Container(),
                              _selectFarmType == FarmTypeEnum.farm
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
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
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'))
                                          ],
                                          controller: controller[5],
                                          validator: (value) {
                                            if (_selectFarmType !=
                                                FarmTypeEnum.farm) {
                                              return null;
                                            }
                                            String s1 =
                                                isEmpty(s1: value.toString());
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
                                      ],
                                    )
                                  : Container(),
                              _selectFarmType == FarmTypeEnum.farm
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
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
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'))
                                          ],
                                          controller: controller[6],
                                          validator: (value) {
                                            if (_selectFarmType !=
                                                FarmTypeEnum.farm) {
                                              return null;
                                            }
                                            String s1 =
                                                isEmpty(s1: value.toString());

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
                                      ],
                                    )
                                  : Container(),
                              _selectFarmType == FarmTypeEnum.farm
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
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
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'))
                                          ],
                                          controller: controller[7],
                                          validator: (value) {
                                            if (_selectFarmType !=
                                                FarmTypeEnum.farm) {
                                              return null;
                                            }
                                            String s1 =
                                                isEmpty(s1: value.toString());

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
                                      ],
                                    )
                                  : Container(),
                              _selectFarmType == FarmTypeEnum.farm
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
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
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'))
                                          ],
                                          controller: controller[8],
                                          validator: (value) {
                                            if (_selectFarmType !=
                                                FarmTypeEnum.farm) {
                                              return null;
                                            }
                                            String s1 =
                                                isEmpty(s1: value.toString());

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
                                      ],
                                    )
                                  : Container(),
                              sectionType,
                              defaultTargetPlatform == TargetPlatform.android ||
                                      defaultTargetPlatform ==
                                          TargetPlatform.iOS
                                  ? TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return Scaffold(
                                              body: googleMapComponent,
                                            );
                                          },
                                        ));
                                      },
                                      child: const Text("اختيار مكان علي الخريطة"))
                                  : Container(
                                      //width: double.infinity,
                                      //height: 360,
                                      margin: const EdgeInsets.all(10),
                                      child: googleMapComponent),
                              SizedBox(
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
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(100, 50)),
                                        shape: MaterialStateProperty.resolveWith(
                                            (states) => RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0))),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.green),
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.green)),
                                    onPressed: () async {
                                      /// await CustomeSecureStorage.remove_all();
                                      updateScreen();
                                      if (_formGlobalKey.currentState!
                                          .validate()) {
                                        Map<String, dynamic> dic1 = {
                                          'operation': "insert",
                                          'attached_area': 12,
                                          r'farm_type': farmType.customeFarmType
                                                  .itemChoose.isNotEmpty
                                              ? json.encode(farmType
                                                  .customeFarmType.itemChoose)
                                              : null,
                                          r'isolated_wards': int.parse(
                                              controller[7].text.isEmpty
                                                  ? '0'
                                                  : controller[7].text),
                                          'number_of_arc': int.parse(
                                              controller[8].text.isEmpty
                                                  ? '0'
                                                  : controller[8].text),
                                          'number_of_workers_inner': int.parse(
                                              controller[1].text.isEmpty
                                                  ? '0'
                                                  : controller[1].text),
                                          'number_of_workers_outer': int.parse(
                                              controller[9].text.isEmpty
                                                  ? '0'
                                                  : controller[9].text),
                                          'playground': int.parse(
                                              controller[4].text.isEmpty
                                                  ? '0'
                                                  : controller[4].text),
                                          'section_type': sectionType
                                                  .customeDropdownButtonSectionType
                                                  .list
                                                  .isNotEmpty
                                              ? sectionType
                                                  .customeDropdownButtonSectionType
                                                  .value
                                              : null,
                                          'wards': controller[6].text.isNotEmpty
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
                                          'village': selectLocation.village
                                        };
                                        dic1["geometry"] = await getLocation();
                                        if (c.image is File) {
                                          dic1["img"] =
                                              await MultipartFile.fromFile(
                                                  c.image!.path,
                                                  filename: "jjyyttttt");
                                        }
                                        dio.FormData formData =
                                            dio.FormData.fromMap(
                                          dic1,
                                        );
                                        Map<String, dynamic> res =
                                            await Api.farm_api(form: formData);
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
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(100, 50)),
                                        shape: MaterialStateProperty.resolveWith(
                                            (states) => RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0))),
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
                                          await Api.farm_api(form: formData);
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
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(100, 50)),
                                        shape: MaterialStateProperty.resolveWith(
                                            (states) => RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0))),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.red),
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.red)),
                                    onPressed: () async {
                                      Map<String, dynamic> dic1 = {
                                        'operation': "update",
                                        'attached_area': 12,
                                        r'farm_type': farmType.customeFarmType
                                                .itemChoose.isNotEmpty
                                            ? json.encode(farmType
                                                .customeFarmType.itemChoose)
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
                                                .list
                                                .isNotEmpty
                                            ? sectionType
                                                .customeDropdownButtonSectionType
                                                .value
                                            : null,
                                        'wards': controller[6].text.isNotEmpty
                                            ? int.parse(controller[6].text)
                                            : 0,
                                        'total_area_of_farm':
                                            controller[2].text.isNotEmpty
                                                ? int.parse(controller[2].text)
                                                : 0,
                                        'farm_name':
                                            controller[3].text.isNotEmpty
                                                ? controller[3].text
                                                : 0,
                                        'huge_playground':
                                            controller[5].text.isNotEmpty
                                                ? int.parse(controller[5].text)
                                                : 0,
                                        'id': controller[0].text,
                                        "city": selectLocation.city,
                                        'village': selectLocation.village
                                      };
                                      dic1["geometry"] = await getLocation();
                                      if (c.image is File) {
                                        dic1["img"] =
                                            await MultipartFile.fromFile(
                                                c.image!.path,
                                                filename: 'iiiiu');
                                      }
                                      dio.FormData formData =
                                          dio.FormData.fromMap(
                                        dic1,
                                      );
                                      var res =
                                          await Api.farm_api(form: formData);

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
  CustomeType customeFarmType =
      CustomeType(title: "نوع المزرعة", list: const []);

  FarmType({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.farm_type_api(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done &&
              snap.data is List &&
              snap.data!.isNotEmpty) {
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
          return const LoadingScreen();
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
    value: -1,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(10),
      child: FutureBuilder(
          future: Api.section_type_api(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done &&
                snap.data is List &&
                snap.data!.isNotEmpty) {
              customeDropdownButtonSectionType = CustomeDropdownButton(
                  id: 'id',
                  list: snap.data ??
                      const [
                        {"name": "عام"},
                        {"name": "خاص"}
                      ],
                  expanded: true,
                  text: "نوع القطاع",
                  value: snap.data![0]['id']);
              return customeDropdownButtonSectionType;
            }
            return const LoadingScreen();
          }),
    );
  }
}

class CustomeType extends StatefulWidget {
  List<Map<String, dynamic>> list;
  String title;
  bool visiable = false;
  List<String> itemChoose = [];
  _CustomeTypeState state = _CustomeTypeState();
  CustomeType({super.key, required this.list, required this.title});
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
            height: 70,
            child: BlocBuilder<SelectMuiltTypeCubit, SelectMuiltTypeState>(
              builder: (context, state) {
                List<int> list = state.list;
                widget.itemChoose = List.generate(list.length, (index) {
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
    super.key,
    required this.text,
    required this.customeColor,
    required this.click,
    required this.f,
  });

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.resolveWith(
              (states) => const Size(100, 100)),
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
