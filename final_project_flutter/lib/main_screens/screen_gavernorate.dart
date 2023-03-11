// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';

class ScreenGavernorate extends StatefulWidget {
  ScreenGavernorate({Key? key}) : super(key: key);

  @override
  State<ScreenGavernorate> createState() => _ScreenGavernorateState();
}

class _ScreenGavernorateState extends State<ScreenGavernorate> {
  SelectGavernorate selectGavernorate = SelectGavernorate(
    title: 'المحافظة',
    list: const [
      {"id": "اسيوط"},
      {"id": "القاهرة"},
      {"id": "المنةفية"}
    ],
  );
  GoogleMapComponent googleMapComponent = GoogleMapComponent();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Container(
          width: 500,
          child: Card(
            color: Color(0xFF357515),
            elevation: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('تعديل في المحافظات',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                /*
                    
                    FutureBuilder(
                    future: location_api(),
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
                          child: selectCity,
                        );
                      }
                      return Container();
                    }),
                    
                    */
                Container(
                  child: FutureBuilder(
                      future: location_api(),
                      builder: (context, snap) {
                        if (snap.connectionState == ConnectionState.done &&
                            snap.data is List<Map<String, dynamic>> &&
                            snap.data!.isNotEmpty) {
                          return BlocProvider(
                            create: (context) =>LocationCubit(
                            city: snap.data![0]['city']!,
                            gavernorate: snap.data![0]['governorate'],
                            village: snap.data![0]['village']!,
                          ),
                            child: selectGavernorate,
                          );
                        }
                        return Container();
                      }),
                ),
                TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.brown),
                    decoration: InputDecoration(
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
                          'gavernorate':
                              selectGavernorate.gavernorate.toString(),
                          'new_name': controller.text
                        };
                        selectGavernorate = SelectGavernorate(
                          title: 'المحافظة',
                          list: const [
                            {"id": "اسيوط"},
                            {"id": "القاهرة"},
                            {"id": "المنةفية"}
                          ],
                        );
                        await modify_gavernorate_api(dic1: dic1);
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
                          'gavernorate':
                              selectGavernorate.gavernorate.toString(),
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
                        await modify_gavernorate_api(dic1: dic1);
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
                          'gavernorate':
                              selectGavernorate.gavernorate.toString(),
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
                        await modify_gavernorate_api(dic1: dic1);
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
    });
  }
}

class SelectGavernorate extends StatefulWidget {
  String? gavernorate;
  String title;
  List<Map<String, String>> list;
  SelectGavernorate({
    Key? key,
    this.gavernorate,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  State<SelectGavernorate> createState() => _SelectGavernorateState();
}

class _SelectGavernorateState extends State<SelectGavernorate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: gavernorate_api(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done &&
                  snap.data is List<Map<String, String>> &&
                  snap.data!.isNotEmpty) {
                print(snap.data);
                widget.gavernorate = snap.data![0]['id']!;
                return CustomeDropdownButton(
                    id: 'id',
                    func: (String value) {
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
  String? city;
  List<String> titles;
  SelectCity({
    Key? key,
    required this.list,
    required this.list2,
    this.city,
    required this.titles,
  }) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
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
                future: gavernorate_api(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, String>> &&
                      snap.data!.isNotEmpty)
                    return CustomeDropdownButton(
                        id: 'id',
                        func: (String value) {
                          BlocProvider.of<LocationCubit>(context)
                              .updateGavernorate(value);
                        },
                        list: snap.data ?? [],
                        expanded: true,
                        value: snap.data![0]['id']!,
                        text: widget.titles[0]);
                  return Container();
                })),
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
                  future: city_api(gavernorate: state.gavernorate),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, String>> &&
                        snap.data!.isNotEmpty) {
                      print(snap.data);
                      widget.city = snap.data![0]['id']!;
                      return CustomeDropdownButton(
                          id: 'id',
                          func: (String value) {
                            BlocProvider.of<LocationCubit>(context)
                                .updateCity(value);
                            widget.city = value;
                          },
                          list: snap.data ?? [],
                          expanded: true,
                          value: snap.data![0]['id']!,
                          text: widget.titles[1]);
                    }

                    return Container();
                  });
            },
          ),
        ),
      ],
    );
  }
}

class ScreenCity extends StatefulWidget {
  ScreenCity({Key? key}) : super(key: key);

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
  GoogleMapComponent googleMapComponent = GoogleMapComponent();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: SingleChildScrollView(
          child: Card(
            color: Color(0xFF357515),
            elevation: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('تعديل في المحافظات',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                FutureBuilder(
                    future: location_api(),
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
                          child: selectCity,
                        );
                      }
                      return Container();
                    }),
                TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.brown),
                    decoration: InputDecoration(
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
                        await modify_city_api(dic1: dic1);
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
                        await modify_city_api(dic1: dic1);
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
                        print('delete');
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
                        await modify_city_api(dic1: dic1);
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
  ScreenVillage({Key? key}) : super(key: key);

  @override
  State<ScreenVillage> createState() => _ScreenVillageState();
}

class _ScreenVillageState extends State<ScreenVillage> {
  SelectLocation selectLocation = SelectLocation(village: '', city: "");

  TextEditingController controller = TextEditingController();

  GoogleMapComponent googleMapComponent = GoogleMapComponent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: SingleChildScrollView(
        child: Card(
          color: Color(0xFF357515),
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('تعديل في المحافظات',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              BlocProvider(
                create: (context) => LocationCubit(
                    city: '039f34ca-a49f-4b95-8364-785d270b4b87',
                    gavernorate: '52dadd31-ce6a-47f2-9710-5232d67b9c23',
                    village: '254422a0-97f2-480e-b42d-eabf5c7c66b7'),
                child: Builder(builder: (context) {
                  selectLocation.village = '';
                  return selectLocation;
                }),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.brown),
                    decoration: InputDecoration(
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
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey),
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red)),
                    onPressed: () {
                      Map<String, dynamic> dic1 = {
                        'operation': 'delete',
                        'city': selectLocation.city,
                        'village': selectLocation.village.toString(),
                        'new_name': controller.text
                      };
                      selectLocation = SelectLocation(village: '', city: "");

                      modify_village_api(dic1: dic1);
                      selectLocation = SelectLocation(village: '', city: "");
                      print('delete');
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
                      modify_village_api(dic1: dic1);
                      selectLocation = SelectLocation(village: '', city: "");
                      selectLocation = SelectLocation(village: '', city: "");

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
                      modify_village_api(dic1: dic1);
                      selectLocation = SelectLocation(village: '', city: "");
                      selectLocation = SelectLocation(village: '', city: "");

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
      ),
    );
  }
}

class AddLocationScreen extends StatefulWidget {
  AddLocationScreen({Key? key}) : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  List<Widget> list = [ScreenGavernorate(), ScreenCity(), ScreenVillage()];
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
                    Color.fromARGB(255, 202, 197, 197).withOpacity(0.5),
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
            appBar: constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      'تعديل الاماكن',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : null,
            drawer: MainDrawer(index: 6),
            body: Column(
              children: [
                constraint.maxWidth > 900
                    ? Container(height: 100, child: ComputerDrawer(index: 6))
                    : Container(),
                Spacer(),
                list[index],
                Spacer(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
