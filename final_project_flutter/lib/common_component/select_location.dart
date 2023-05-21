import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/custome_dropdownbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLocation extends StatelessWidget {
  String village;
  String city;
  SelectLocation({
    Key? key,
    required this.village,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: location_api(),
        builder: (context, snapOuter) {
          if (snapOuter.data is List<Map<String, dynamic>>) {
            return BlocProvider(
              create: (context) => LocationCubit(
                city: snapOuter.data![0]['city'],
                gavernorate: snapOuter.data![0]['governorate'],
                village: snapOuter.data![0]['village'],
              ),
              child: Builder(builder: (context) {
                city = snapOuter.data![0]['city'];
                village = snapOuter.data![0]['village'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        width: 500,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.white,
                        )),
                        child: FutureBuilder(
                            future: gavernorate_api(),
                            builder: (context, snap) {
                              try {
                                if (snap.connectionState ==
                                    ConnectionState.done) {
                                  return CustomeDropdownButton(
                                      id: 'id',
                                      func: (String value) {
                                        BlocProvider.of<LocationCubit>(context)
                                            .updateGavernorate(value);
                                      },
                                      list: snap.data ??
                                          const [
                                            {"name": "اسيوط"},
                                            {"name": "القاهرة"},
                                            {"name": "المنةفية"}
                                          ],
                                      expanded: true,
                                      value: snapOuter.data![0]
                                              ['governorate'] ??
                                          'اسيوط',
                                      text: "المحافظة");
                                }
                              } catch (e) {}

                              return Container();
                            })),
                    BlocBuilder<LocationCubit, LocationState>(
                      buildWhen: (previous, current) {
                        //
                        return previous.gavernorate != current.gavernorate;
                      },
                      builder: (context, state) {
                        return FutureBuilder(
                            future: city_api(gavernorate: state.gavernorate),
                            builder: (context, snap) {
                              if (snap.connectionState ==
                                      ConnectionState.done &&
                                  snap.data is List<Map<String, dynamic>> &&
                                  snap.data!.isNotEmpty) {
                                city = snap.data!.first['name'] ?? 'اسيوط';

                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.white,
                                  )),
                                  child: CustomeDropdownButton(
                                      id: 'id',
                                      func: (String value) {
                                        BlocProvider.of<LocationCubit>(context)
                                            .updateCity(value);
                                        city = value;
                                      },
                                      list: snap.data ??
                                          const [
                                            {"name": "اسيوط"},
                                            {"name": "القاهرة"},
                                            {"name": "المنةفية"}
                                          ],
                                      expanded: true,
                                      value: snap.data!.first['id'] ?? '1',
                                      text: "المركز او المدينة"),
                                );
                              }
                              return const SizedBox(
                                height: 0,
                                width: 0,
                              );
                            });
                      },
                    ),
                    BlocBuilder<LocationCubit, LocationState>(
                      buildWhen: (previous, current) {
                        return previous.city != current.city;
                      },
                      builder: (context, state) {
                        return FutureBuilder(
                            future: village_api(city: state.city),
                            builder: (context, snap) {
                              if (snap.connectionState ==
                                      ConnectionState.done &&
                                  snap.data is List<Map<String, dynamic>> &&
                                  snap.data!.isNotEmpty) {
                                village = snap.data!.first['id'] ?? '';
                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.white,
                                  )),
                                  child: CustomeDropdownButton(
                                      id: 'id',
                                      func: (String value) {
                                        BlocProvider.of<LocationCubit>(context)
                                            .updateVillage(value);
                                        village = value;
                                      },
                                      list: snap.data ??
                                          const [
                                            {"name": "اسيوط"},
                                            {"name": "القاهرة"},
                                            {"name": "المنةفية"}
                                          ],
                                      expanded: true,
                                      value: snap.data!.first['id'] ?? '1',
                                      text: "القرية او الشارع"),
                                );
                              }

                              return const SizedBox(
                                height: 0,
                                width: 0,
                              );
                            });
                      },
                    ),
                  ],
                );
              }),
            );
          }
          return Container();
        });
  }
}

class SelectLocationDashBoard extends StatelessWidget {
  String village = '';
  String city = '';
  String governorate = "";
  SelectLocationDashBoard({
    Key? key,
    //required this.village,
    //required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        height: 78,
        child: Builder(builder: (context) {
          return Row(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.white,
                    )),
                    child: FutureBuilder(
                        future: gavernorate_api(),
                        builder: (context, snap) {
                          try {
                            if (snap.connectionState == ConnectionState.done) {
                              print(snap.data);
                              (snap.data as List)
                                  .add({"id": "__", "name": "__"});
                              return SizedBox(
                                child:
                                    BlocBuilder<LocationCubit, LocationState>(
                                  builder: (context, state) {

                                    print("the governorate value ="+state.gavernorate.toString());
                                    return CustomeDropdownButton(
                                        color: Color(0xffc79154),
                                        textColor: Colors.white,
                                        id: 'id',
                                        func: (String value) {
                                          BlocProvider.of<LocationCubit>(
                                                  context)
                                              .updateGavernorate(value);
                                        },
                                        list: snap.data ??
                                            const [
                                              {"name": "اسيوط"},
                                              {"name": "القاهرة"},
                                              {"name": "المنةفية"}
                                            ],
                                        expanded: true,
                                        value: state.gavernorate,
                                        text: "المحافظة");
                                  },
                                ),
                              );
                            }
                          } catch (e) {}

                          return Container();
                        })),
              ),
              Expanded(
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
                              snap.data is List<Map<String, dynamic>> &&
                              snap.data!.isNotEmpty) {
                            (snap.data as List).add({"id": "__", "name": "__"});
                            city = snap.data!.first['name'] ?? 'اسيوط';

                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.white,
                              )),
                              child: CustomeDropdownButton(
                                  color: Color(0xffc79154),
                                  textColor: Colors.white,
                                  id: 'id',
                                  func: (String value) {
                                    BlocProvider.of<LocationCubit>(context)
                                        .updateCity(value);
                                    city = value;
                                  },
                                  list: snap.data ??
                                      const [
                                        {"name": "اسيوط"},
                                        {"name": "القاهرة"},
                                        {"name": "المنةفية"}
                                      ],
                                  expanded: true,
                                  value: snap.data!.first['id'] ?? '1',
                                  text: "المركز او المدينة"),
                            );
                          }
                          return const SizedBox(
                            height: 0,
                            width: 0,
                          );
                        });
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<LocationCubit, LocationState>(
                  buildWhen: (previous, current) {
                    print(current.city);
                    return previous.city != current.city;
                  },
                  builder: (context, state) {
                    return FutureBuilder(
                        future: village_api(city: state.city),
                        builder: (context, snap) {
                          if (snap.connectionState == ConnectionState.done &&
                              snap.data is List<Map<String, dynamic>> &&
                              snap.data!.isNotEmpty) {
                            village = snap.data!.first['id'] ?? '';
                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.white,
                              )),
                              child: CustomeDropdownButton(
                                  color: Color(0xffc79154),
                                  textColor: Colors.white,
                                  id: 'id',
                                  func: (String value) {
                                    BlocProvider.of<LocationCubit>(context)
                                        .updateVillage(value);
                                    village = value;
                                  },
                                  list: snap.data ??
                                      const [
                                        {"name": "اسيوط"},
                                        {"name": "القاهرة"},
                                        {"name": "المنةفية"}
                                      ],
                                  expanded: true,
                                  value: snap.data!.first['id'] ?? '1',
                                  text: "القرية او الشارع"),
                            );
                          }

                          return const SizedBox(
                            height: 0,
                            width: 0,
                          );
                        });
                  },
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}
