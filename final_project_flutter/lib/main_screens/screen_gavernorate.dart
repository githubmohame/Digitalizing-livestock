// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:final_project_year/common_component/custome_dropdownbutton.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/google_map_farm.dart';
import 'package:final_project_year/common_component/select_location.dart';
import 'package:latlong2/latlong.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_drower.dart';

class ScreenGavernorate extends StatefulWidget {
  ScreenGavernorate({super.key}) {
    print("Constracture");
  }
  _ScreenGavernorateState _screenGavernorate = _ScreenGavernorateState();
  @override
  State<ScreenGavernorate> createState() {
    _ScreenGavernorateState wid = _ScreenGavernorateState();
    wid.selectGavernorate = _screenGavernorate.selectGavernorate;
    _screenGavernorate = wid;
    return _screenGavernorate;
  }
}

class _ScreenGavernorateState extends State<ScreenGavernorate>
    with AutomaticKeepAliveClientMixin {
  SelectGavernorate selectGavernorate = SelectGavernorate(
    title: 'المحافظة',
    list: const [
      {"id": "اسيوط"},
      {"id": "القاهرة"},
      {"id": "المنةفية"}
    ],
  );
  GoogleMapFarm googleMapComponent = GoogleMapComponentDesktopFarmScreen();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Card(
          color: const Color(0xFF357515),
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('تعديل في المحافظات',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              
              FutureBuilder(
                  future: Api.location_api(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, dynamic>> &&
                        snap.data!.isNotEmpty) {
                      return BlocProvider(
                        create: (context) {
                          selectGavernorate.gavernorate =
                              snap.data![0]['village']!;
                          return LocationCubit(
                            city: snap.data![0]['city']!,
                            gavernorate: snap.data![0]['governorate'],
                            village: snap.data![0]['village']!,
                          );
                        },
                        child: selectGavernorate,
                      );
                    }
                    return Container();
                  }),
              TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.brown),
                  decoration: const InputDecoration(
                      hintText: "تعديل الاسم",
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)),
                      focusColor: Colors.brown,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)))),
              //googleMapComponent,
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
                    onPressed: () async {
                      Map<String, dynamic> dic1 = {
                        'operation': 'delete',
                        'gavernorate': selectGavernorate.gavernorate.toString(),
                        'new_name': controller.text
                      };
                      var res = await Api.modify_gavernorate_api(dic1: dic1);
                      if (res.containsKey('message')) {
                        showSnackbardone(
                            context: context, text: res['message']!);
                      } else {
                        showSnackbarerror(
                            context: context, text: res['error']!);
                      }
                      selectGavernorate = SelectGavernorate(
                        title: 'المحافظة',
                        list: const [
                          {"id": "اسيوط"},
                          {"id": "القاهرة"},
                          {"id": "المنةفية"}
                        ],
                      );

                      selectGavernorate = SelectGavernorate(
                        title: 'المحافظة',
                        list: const [
                          {"id": "اسيوط"},
                          {"id": "القاهرة"},
                          {"id": "المنةفية"}
                        ],
                      );
                      setState(() {});
                    },
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
                    onPressed: () async {
                      Map<String, dynamic> dic1 = {
                        'operation': 'update',
                        'gavernorate': selectGavernorate.gavernorate.toString(),
                        'new_name': controller.text
                      };
                      if (googleMapComponent.point is LatLng) {
                        dic1['geometry'] = json.encode({
                          "type": "Point",
                          "coordinates": [
                            googleMapComponent.point!.latitude,
                            googleMapComponent.point!.longitude
                          ]
                        });
                      } else if (googleMapComponent.file is String) {
                        dic1['geometry'] = dio.MultipartFile.fromBytes(
                            await File(googleMapComponent.file.toString())
                                .readAsBytes(),
                            filename: 'locations.zip');
                      } else {
                        dic1['geometry'] = null;
                      }
                      selectGavernorate = SelectGavernorate(
                        title: 'المحافظة',
                        list: const [
                          {"id": "اسيوط"},
                          {"id": "القاهرة"},
                          {"id": "المنةفية"}
                        ],
                      );
                      var res = await Api.modify_gavernorate_api(dic1: dic1);
                      if (res.containsKey('message')) {
                        showSnackbardone(
                            context: context, text: res['message']!);
                      } else {
                        showSnackbarerror(
                            context: context, text: res['error']!);
                      }
                      selectGavernorate = SelectGavernorate(
                        title: 'المحافظة',
                        list: const [
                          {"id": "اسيوط"},
                          {"id": "القاهرة"},
                          {"id": "المنةفية"}
                        ],
                      );
                      setState(() {});
                    },
                    child: const Text(
                      "تعديل",
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
                    onPressed: () async {
                      Map<String, dynamic> dic1 = {
                        'operation': 'insert',
                        'gavernorate': selectGavernorate.gavernorate.toString(),
                        'new_name': controller.text
                      };
                      if (googleMapComponent.point is LatLng) {
                        dic1['geometry'] = json.encode({
                          "type": "Point",
                          "coordinates": [
                            googleMapComponent.point!.latitude,
                            googleMapComponent.point!.longitude
                          ]
                        });
                      } else if (googleMapComponent.file is String) {
                        dic1['geometry'] = dio.MultipartFile.fromBytes(
                            await File(googleMapComponent.file.toString())
                                .readAsBytes(),
                            filename: 'locations.zip');
                      } else {
                        dic1['geometry'] = null;
                      }
                      selectGavernorate = SelectGavernorate(
                        title: 'المحافظة',
                        list: const [
                          {"id": "اسيوط"},
                          {"id": "القاهرة"},
                          {"id": "المنةفية"}
                        ],
                      );
                      var res = await Api.modify_gavernorate_api(dic1: dic1);
                      if (res.containsKey('message')) {
                        showSnackbardone(
                            context: context, text: res['message']!);
                      } else {
                        showSnackbarerror(
                            context: context, text: res['error']!);
                      }
                      selectGavernorate = SelectGavernorate(
                        title: 'المحافظة',
                        list: const [
                          {"id": "اسيوط"},
                          {"id": "القاهرة"},
                          {"id": "المنةفية"}
                        ],
                      );
                      setState(() {});
                    },
                    child: const Text(
                      "اضافة",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SelectGavernorate extends StatefulWidget {
  int gavernorate;
  String title;
  List<Map<String, String>> list;
  SelectGavernorate({
    super.key,
    this.gavernorate = -1,
    required this.title,
    required this.list,
  });

  @override
  State<SelectGavernorate> createState() => _SelectGavernorateState();
}

class _SelectGavernorateState extends State<SelectGavernorate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: Api.gavernorate_api(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done &&
                  snap.data is List<Map<String, dynamic>> &&
                  snap.data!.isNotEmpty) {
                widget.gavernorate = snap.data![0]['id']!;
                return CustomeDropdownButton(
                    id: 'id',
                    func: (int value) {
                      BlocProvider.of<LocationCubit>(context)
                          .updateGavernorate(value);
                      widget.gavernorate = value;
                    },
                    list: snap.data!,
                    expanded: true,
                    value: snap.data![0]['id']!,
                    text: widget.title);
              }
              return Container();
            }),
      ],
    );
  }
}

class SelectCity extends StatefulWidget {
  List<Map<String, String>> list;
  List<Map<String, String>> list2;
  int? city;
  List<String> titles;
  SelectCity({
    super.key,
    required this.list,
    required this.list2,
    this.city,
    required this.titles,
  });

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.location_api(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done &&
              snap.data is List<Map<String, dynamic>> &&
              snap.data!.isNotEmpty) {
            return BlocProvider(
              create: (context) => LocationCubit(
                city: snap.data![0]['city']!,
                gavernorate: snap.data![0]['governorate'],
                village: snap.data![0]['village']!,
              ),
              child: Builder(builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocBuilder<LocationCubit, LocationState>(
                        builder: (context, state) {
                          return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.grey,
                              )),
                              child: FutureBuilder(
                                  future: Api.gavernorate_api(),
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                            ConnectionState.done &&
                                        snap.data
                                            is List<Map<String, dynamic>> &&
                                        snap.data!.isNotEmpty) {
                                      return CustomeDropdownButton(
                                          id: 'id',
                                          func: (int value) {
                                            BlocProvider.of<LocationCubit>(
                                                    context)
                                                .updateGavernorate(value);
                                          },
                                          list: snap.data ?? [],
                                          expanded: true,
                                          value: state.gavernorate,
                                          text: widget.titles[0]);
                                    }
                                    return Container();
                                  }));
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                        )),
                        child: BlocBuilder<LocationCubit, LocationState>(
                          buildWhen: (previous, current) {
                            //
                            return previous.gavernorate != current.gavernorate;
                          },
                          builder: (context, state) {
                            return FutureBuilder(
                                future: Api.city_api(
                                    gavernorate: state.gavernorate),
                                builder: (context, snap) {
                                  if (snap.connectionState ==
                                          ConnectionState.done &&
                                      snap.data is List<Map<String, dynamic>> &&
                                      snap.data!.isNotEmpty) {
                                    widget.city = snap.data![0]['id']!;
                                    return CustomeDropdownButton(
                                        id: 'id',
                                        func: (int value) {
                                          BlocProvider.of<LocationCubit>(
                                                  context)
                                              .updateCity(value);
                                          widget.city = value;
                                        },
                                        list: snap.data ?? [],
                                        expanded: true,
                                        value: state.city,
                                        text: widget.titles[1]);
                                  }

                                  return Container();
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }
          return Container();

          ////////////////////////////////VFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        });
  }
}

class ScreenCity extends StatefulWidget {
  const ScreenCity({super.key});

  @override
  State<ScreenCity> createState() => _ScreenCityState();
}

class _ScreenCityState extends State<ScreenCity> {
  SelectCity selectCity = SelectCity(
    list2: const [
      {"id": "القاهرة"},
      {"id": "القاهرة"}
    ],
    titles: const ['المحافظة', 'المركز'],
    list: const [
      {"id": "اسيوط"},
      {"id": "القاهرة"},
      {"id": "المنةفية"}
    ],
  );
  GoogleMapFarm googleMapComponent = GoogleMapComponentDesktopFarmScreen();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Card(
            color: const Color(0xFF357515),
            elevation: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('تعديل في المحافظات',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                selectCity,
                TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.brown),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "تعديل الاسم",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 5)),
                    )),
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
                      onPressed: () async {
                        Map<String, dynamic> dic1 = {
                          'operation': 'insert',
                          'city': selectCity.city.toString(),
                          'new_name': controller.text
                        };
                        if (googleMapComponent.point is LatLng) {
                          dic1['geometry'] = json.encode({
                            "type": "Point",
                            "coordinates": [
                              googleMapComponent.point!.latitude,
                              googleMapComponent.point!.longitude
                            ]
                          });
                        } else if (googleMapComponent.file is String) {
                          dic1['geometry'] = dio.MultipartFile.fromBytes(
                              await File(googleMapComponent.file.toString())
                                  .readAsBytes(),
                              filename: 'locations.zip');
                        } else {
                          dic1['geometry'] = null;
                        }
                        var res = await Api.modify_gavernorate_api(dic1: dic1);
                        if (res.containsKey('message')) {
                          showSnackbardone(
                              context: context, text: res['message']!);
                        } else {
                          showSnackbarerror(
                              context: context, text: res['error']!);
                        }
                        selectCity = SelectCity(
                          list2: const [
                            {"id": "القاهرة"},
                            {"id": "القاهرة"}
                          ],
                          titles: const ['المحافظة', 'المركز'],
                          list: const [
                            {"id": "اسيوط"},
                            {"id": "القاهرة"},
                            {"id": "المنةفية"}
                          ],
                        );
                        setState(() {});
                      },
                      child: const Text(
                        "اضافة",
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
                              (states) => Colors.red)),
                      onPressed: () async {
                        Map<String, dynamic> dic1 = {
                          'operation': 'delete',
                          'city': selectCity.city.toString(),
                          'new_name': controller.text
                        };
                        var res = await Api.modify_gavernorate_api(dic1: dic1);
                        selectCity = SelectCity(
                          list2: const [
                            {"id": "القاهرة"},
                            {"id": "القاهرة"}
                          ],
                          titles: const ['المحافظة', 'المركز'],
                          list: const [
                            {"id": "اسيوط"},
                            {"id": "القاهرة"},
                            {"id": "المنةفية"}
                          ],
                        );
                        setState(() {});
                        if (res.containsKey('message')) {
                          showSnackbardone(
                              context: context, text: res['message']!);
                        } else {
                          showSnackbarerror(
                              context: context, text: res['error']!);
                        }
                      },
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
                      onPressed: () async {
                        Map<String, dynamic> dic1 = {
                          'operation': 'update',
                          'city': selectCity.city.toString(),
                          'new_name': controller.text
                        };
                        if (googleMapComponent.point is LatLng) {
                          dic1['geometry'] = json.encode({
                            "type": "Point",
                            "coordinates": [
                              googleMapComponent.point!.latitude,
                              googleMapComponent.point!.longitude
                            ]
                          });
                        } else if (googleMapComponent.file is String) {
                          dic1['geometry'] = dio.MultipartFile.fromBytes(
                              await File(googleMapComponent.file.toString())
                                  .readAsBytes(),
                              filename: 'locations.zip');
                        } else {
                          dic1['geometry'] = null;
                        }
                        var res = await Api.modify_gavernorate_api(dic1: dic1);
                        selectCity = SelectCity(
                          list2: const [
                            {"id": "القاهرة"},
                            {"id": "القاهرة"}
                          ],
                          titles: const ['المحافظة', 'المركز'],
                          list: const [
                            {"id": "اسيوط"},
                            {"id": "القاهرة"},
                            {"id": "المنةفية"}
                          ],
                        );
                        setState(() {});
                        if (res.containsKey('message')) {
                          showSnackbardone(
                              context: context, text: res['message']!);
                        } else {
                          showSnackbarerror(
                              context: context, text: res['error']!);
                        }
                      },
                      child: const Text(
                        "حفظ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenVillage extends StatefulWidget {
  const ScreenVillage({super.key});

  @override
  State<ScreenVillage> createState() => _ScreenVillageState();
}

class _ScreenVillageState extends State<ScreenVillage> {
  SelectLocation selectLocation = SelectLocation(village: -1, city: -1);

  TextEditingController controller = TextEditingController();

  GoogleMapFarm googleMapComponent = GoogleMapComponentDesktopFarmScreen();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        color: const Color(0xFF357515),
        elevation: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('تعديل في المحافظات',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            selectLocation,
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.brown),
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "تعديل الاسم",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)),
                      focusColor: Colors.brown,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)))),
            ),
            //googleMapComponent,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.red)),
                  onPressed: () async {
                    Map<String, dynamic> dic1 = {
                      'operation': 'delete',
                      'city': selectLocation.city,
                      'village': selectLocation.village.toString(),
                      'new_name': controller.text
                    };

                    Map<String, dynamic> map =
                        await Api.modify_gavernorate_api(dic1: dic1);

                    if (map.containsKey('message')) {}
                    selectLocation = SelectLocation(village: -1, city: -1);
                    //selectLocation = SelectLocation(village: -1, city: "");
                    setState(() {});
                  },
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
                      fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.brown)),
                  onPressed: () async {
                    Map<String, dynamic> dic1 = {
                      'operation': 'insert',
                      'city': selectLocation.city,
                      'village': selectLocation.village.toString(),
                      'new_name': controller.text
                    };
                    if (googleMapComponent.point is LatLng) {
                      dic1['geometry'] = json.encode({
                        "type": "Point",
                        "coordinates": [
                          googleMapComponent.point!.latitude,
                          googleMapComponent.point!.longitude
                        ]
                      });
                    } else if (googleMapComponent.file is String) {
                      dic1['geometry'] = dio.MultipartFile.fromBytes(
                          await File(googleMapComponent.file.toString())
                              .readAsBytes(),
                          filename: 'locations.zip');
                    } else {
                      dic1['geometry'] = null;
                    }
                    Map<String, dynamic> map =
                        await Api.modify_gavernorate_api(dic1: dic1);
                    if (map.containsKey('message')) {}
                    selectLocation = SelectLocation(village: -1, city: -1);
                    setState(() {});
                  },
                  child: const Text(
                    "اضافة",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.brown)),
                  onPressed: () async {
                    Map<String, dynamic> dic1 = {
                      'operation': 'insert',
                      'city': selectLocation.city,
                      'village': selectLocation.village.toString(),
                      'new_name': controller.text
                    };
                    if (googleMapComponent.point is LatLng) {
                      dic1['geometry'] = json.encode({
                        "type": "Point",
                        "coordinates": [
                          googleMapComponent.point!.latitude,
                          googleMapComponent.point!.longitude
                        ]
                      });
                    } else if (googleMapComponent.file is String) {
                      dic1['geometry'] = dio.MultipartFile.fromBytes(
                          await File(googleMapComponent.file.toString())
                              .readAsBytes(),
                          filename: 'locations.zip');
                    } else {
                      dic1['geometry'] = null;
                    }
                    Map<String, dynamic> map =
                        await Api.modify_gavernorate_api(dic1: dic1);
                    if (map.containsKey('message')) {}
                    selectLocation = SelectLocation(village: -1, city: -1);
                    selectLocation = SelectLocation(village: -1, city: -1);

                    setState(() {});
                  },
                  child: const Text(
                    "حفظ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddLocationScreen extends StatefulWidget {
  AddLocationScreen({super.key});
  // _AddLocationScreenState _addLocationScreenState = _AddLocationScreenState();
  List<Widget> list = [
    ScreenGavernorate(),
    const ScreenCity(),
    const ScreenVillage()
  ];
  @override
  State<AddLocationScreen> createState() {
    _AddLocationScreenState wid = _AddLocationScreenState();
    //wid.list = _addLocationScreenState.list;
    //wid.index = _addLocationScreenState.index;
    //_addLocationScreenState = wid;
    //return _addLocationScreenState;
    return wid;
  }
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor:
                    const Color.fromARGB(255, 202, 197, 197).withOpacity(0.5),
                currentIndex: index,
                unselectedFontSize: 15,
                showUnselectedLabels: true,
                selectedFontSize: 20,
                onTap: (value) {
                  setState(() {
                    index = value;
                  }); //
                },
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                selectedLabelStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
                items: const [
                  BottomNavigationBarItem(
                    label: 'تعديل المحافظة',
                    icon: Image(
                        image: AssetImage('assets/images/gavernorate.png')),
                  ),
                  BottomNavigationBarItem(
                    label: 'تعديل المركز او المدينة',
                    icon: Image(image: AssetImage('assets/images/city.png')),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: 'تعديل القرية والشارع',
                    icon: Image(image: AssetImage('assets/images/village.png')),
                  ),
                ]),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'تعديل الاماكن',
                style: TextStyle(color: Colors.white),
              ),
            )
            /*constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      'تعديل الاماكن',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : null,*/
            ,
            drawer: MainDrawer(index: 6),
            body: Center(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    /* constraint.maxWidth > 900
                        ? SizedBox(height: 100, child: ComputerDrawer(index: 6))
                        : Container(),*/
                    constraint.maxWidth > 900
                        ? SizedBox(height: constraint.maxHeight / 4)
                        : Container(),
                    Center(child: Column(
                      children: [SizedBox(height: index==1?null:0,child: widget.list[1]),
                        SizedBox(height: index==0?null:0,child: widget.list[0]),
                        SizedBox(height: index==2?null:0,child: widget.list[2]),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
