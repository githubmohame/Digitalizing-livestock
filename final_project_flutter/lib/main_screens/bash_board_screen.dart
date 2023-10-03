// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_logic_in_create_state
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/card_board.dart';
import 'package:final_project_year/common_component/google_map.dart';
import 'package:final_project_year/common_component/main_driwer.dart';
import 'package:final_project_year/common_component/pie_chart.dart';
import 'package:final_project_year/common_component/search_field.dart';
import 'package:final_project_year/common_component/select_location.dart';
import 'package:final_project_year/common_component/signup_dropdown_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis/apis_functions.dart';
import '../common_component/show_load_screen.dart';

/*


*/

class DashBoardScreen extends StatefulWidget {
  GoogleMapComponentDashBoardScreen con =
      const GoogleMapComponentDashBoardScreen();
  DashBoardScreen({super.key});
  Widget wid = StatisticFarm();
  @override
  State<DashBoardScreen> createState() {
    return _DashBoardScreenState(googleMapComponentDashBoardScreen: con);
  }
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  _DashBoardScreenState({required this.googleMapComponentDashBoardScreen});
  ScrollController con = ScrollController();
  GoogleMapComponentDashBoardScreen googleMapComponentDashBoardScreen;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SliverPadding;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return FutureBuilder(
        future: Api.dashBoard(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done &&
              snap.data != null &&
              snap.data!.isNotEmpty) {
            return LayoutBuilder(builder: (context, constraint) {
              return Scaffold(
                key: scaffoldKey,
                drawer: null,
                /*constraint.maxWidth < 1900.0
                        ? const CustomeDrawerView2()
                        : null,*/
                backgroundColor: const Color(0xFFf3f3f5),
                body: Row(
                  children: [
                    Expanded(
                        child: NestedScrollView(
                            controller: con,
                            headerSliverBuilder: (context, innerBoxIsScrolled) {
                              return [
                                SliverList(
                                  delegate: SliverChildListDelegate([
                                    Row(children: [
                                      //constraint.maxWidth < 1920.0
                                      //?
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.arrow_back,
                                              color: Colors.green,
                                            ),
                                            onPressed: () {
                                              /* Navigator.of(context)
                                                        .history
                                                        .forEach((element) {
                                                     });*/
                                              Navigator.of(context).pop();
                                              //Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      )
                                      //: Container(),
                                    ]),
                                    constraint.maxWidth > 1920.0
                                        ? Wrap(
                                            // mainAxisAlignment:
                                            //  MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.green,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    Container(height: 10),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      children: [
                                        CustomeDropdownButtomSignUp(value: 12),
                                         
                                      ],
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Wrap(
                                      children: [
                                        Wrap(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0),
                                              child: Wrap(
                                                runAlignment:
                                                    WrapAlignment.spaceBetween,
                                                spacing: 12,
                                                runSpacing: 12,
                                                alignment:
                                                    WrapAlignment.spaceAround,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                children: [
                                                  CardDashBoard(
                                                      value: snap.data!['data']
                                                              ['farm_milk']
                                                          .toString(),
                                                      icon: const Icon(
                                                          Icons.description,
                                                          color: Colors.blue),
                                                      color: Colors.blue,
                                                      title: 'مزارع  اللبان'),
                                                  CardDashBoard(
                                                      value: snap.data!['data']
                                                              ['farm_meat']
                                                          .toString(),
                                                      right: 20,
                                                      icon: const Image(
                                                          image: AssetImage(
                                                              'assets/icons/driver_google.png')),
                                                      color: Colors.amber,
                                                      title:
                                                          'عدد مزارع اللحوم'),
                                                  CardDashBoard(
                                                      value: snap.data!['data']
                                                              ['farmer_count']
                                                          .toString(),
                                                      right: 20,
                                                      icon: const Icon(
                                                          Icons.cloud,
                                                          color: Color.fromARGB(
                                                              255,
                                                              188,
                                                              76,
                                                              76)),
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 188, 76, 76),
                                                      title: 'عدد المربين'),
                                                  CardDashBoard(
                                                      value: snap.data!['data']
                                                              ['village_count']
                                                          .toString(),
                                                      right: 20,
                                                      icon: const Icon(
                                                          Icons
                                                              .access_time_outlined,
                                                          color: Colors.blue),
                                                      color: Colors.blue,
                                                      title: 'عدد الاماكن'),
                                                ],
                                              ),
                                            ),
                                            Container(height: 40),
                                            Container(height: 30),
                                            googleMapComponentDashBoardScreen
                                          ],
                                        ),
                                        Container(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                    constraint.maxWidth < 1900.0
                                        ? TotalStatisticsPieChart(
                                            text: "الاحصائيات عن النظام",
                                            width: 300,
                                            statistic: snap.data!['data']
                                                ["connect_animal_farm"],
                                          )
                                        : Container(),
                                    Container(
                                      height: 30,
                                    ),
                                  ]),
                                ),
                              ];
                            },
                            body: widget.wid)),
                    constraint.maxWidth >= 1900.0
                        ? TotalStatisticsPieChart(
                            text: "احصائيات عن النظام",
                            width: 400,
                            statistic: snap.data!['data']
                                ["connect_animal_farm"],
                          )
                        : Container(),
                  ],
                ),
              );
            });
          } else {
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.transparent,
              // drawer: const CustomeDrawerView2(),
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu, color: Colors.blue),
                  )),
              body: const SafeArea(child: Center(child: LoadingScreen())),
            );
          }
        });
  }
}

class StatisticFarm extends StatefulWidget {
  Map<String, dynamic> list1 = {};
  LocationCubit locationCubit = LocationCubit(
    city: -1,
    gavernorate: -1,
    village: -1,
  );
  SelectLocationDashBoard selectLocationDashBoard = SelectLocationDashBoard();
  StatisticFarm({
    super.key,
    this.list1 = const {},
  });

  @override
  State<StatisticFarm> createState() => _StatisticFarmState();
}

class _StatisticFarmState extends State<StatisticFarm> {
  @override
  void initState() {
    // TODO: implement initState
    initStatisticGovernorate();
    super.initState();
  }

  void initStatisticGovernorate() {
    Api.location_dash_info(formData: FormData.fromMap({"type": "gov"}))
        .then((map) {
      List<dynamic> u = map["gov_data"];
      widget.list1 = {};
      for (var i in u) {
        if (widget.list1.containsKey(i["g_name"])) {
          widget.list1[i["g_name"]].addAll({i["farm_type_name"]: i["count"]});
        } else {
          widget.list1[i["g_name"]] = {i["farm_type_name"]: i["count"]};
        }
      }
      u = map["farm_type"];
       droplist = [];

      for (var i in u) {
        if (i["type"] != null) {
          droplist.add(DropdownMenuItem<String>(
            value: i["type"],
            child: Text(i["type"]),
          ));
        }
      }
      if (droplist.isNotEmpty) {
        drop = droplist[0].value.toString();
      }
      setState(() {});
    });
  }

  String drop = "";
  List<DropdownMenuItem<String>> droplist = [];
  ScrollController con = ScrollController();
  bool ini = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.location_api(stop: ini),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done &&
              snap.data != null &&
              (snap.data!.isNotEmpty || ini)) {
            widget.locationCubit = LocationCubit(
                gavernorate: !ini
                    ? snap.data![0]['governorate']
                    : widget.locationCubit.state.gavernorate,
                city: !ini
                    ? snap.data![0]['city']
                    : widget.locationCubit.state.city,
                village: !ini
                    ? snap.data![0]['village']
                    : widget.locationCubit.state.village);
            ini = true;
            return BlocProvider(
              create: (context) => widget.locationCubit,
              child: ListView.separated(
                  itemCount: widget.list1.length + 2,
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  cacheExtent: 10,
                  clipBehavior: Clip.none,
                  physics: const ClampingScrollPhysics(),
                  reverse: false,
                  padding: const EdgeInsets.all(30),
                  itemBuilder: (context, index) {
                    List<String> u = widget.list1.keys.toList();
                    if (index == 0) {
                      return widget.selectLocationDashBoard;
                    }
                    if (index == 1) {
                      return Builder(builder: (context) {
                        return BlocListener<LocationCubit, LocationState>(
                          listenWhen: (previous, current) {
                            return true;
                          },
                          listener: (context, state) async {
                            if (state.gavernorate == -1) {
                              Map<String, dynamic> map =
                                  ((await Api.location_dash_info(
                                      formData:
                                          FormData.fromMap({"type": "gov"}))));
                              List<dynamic> u = map["gov_data"];
                              widget.list1 = {};
                              for (var i in u) {
                                if (widget.list1.containsKey(i["g_name"])) {
                                  widget.list1[i["g_name"]].addAll(
                                      {i["farm_type_name"]: i["count"]});
                                } else {
                                  widget.list1[i["g_name"]] = {
                                    i["farm_type_name"]: i["count"]
                                  };
                                }
                              }
                              u = map["farm_type"];
                               droplist = [];

                              for (var i in u) {
                                if (i["type"] != null) {
                                  droplist.add(DropdownMenuItem<String>(
                                    value: i["type"],
                                    child: Text(i["type"]),
                                  ));
                                }
                              }
                              if (droplist.isNotEmpty) {
                                drop = droplist[0].value.toString();
                              }
                              setState(() {});
                            } else if (state.city == -1) {
                              Map<String, dynamic> map =
                                  ((await Api.location_dash_info(
                                      formData: FormData.fromMap({
                                "type": "city",
                                "id": state.gavernorate
                              }))));
                              List<dynamic> u = map["gov_data"];
                              widget.list1 = {};
                              for (var i in u) {
                                if (widget.list1.containsKey(i["g_name"])) {
                                  widget.list1[i["g_name"]].addAll(
                                      {i["farm_type_name"]: i["count"]});
                                } else {
                                  widget.list1[i["g_name"]] = {
                                    i["farm_type_name"]: i["count"]
                                  };
                                }
                              }
                              u = map["farm_type"];
                               droplist = [];

                              for (var i in u) {
                                if (i["type"] != null) {
                                  droplist.add(DropdownMenuItem<String>(
                                    value: i["type"],
                                    child: Text(i["type"]),
                                  ));
                                }
                              }
                              if (droplist.isNotEmpty) {
                                drop = droplist[0].value.toString();
                              }
                              setState(() {});
                            } else {
                               Map<String, dynamic> map =
                                  ((await Api.location_dash_info(
                                      formData: FormData.fromMap({
                                "type": "village",
                                "id": state.city
                              }))));
                              List<dynamic> u = map["gov_data"];
                              widget.list1 = {};
                              for (var i in u) {
                                if (widget.list1.containsKey(i["g_name"])) {
                                  widget.list1[i["g_name"]].addAll(
                                      {i["farm_type_name"]: i["count"]});
                                } else {
                                  widget.list1[i["g_name"]] = {
                                    i["farm_type_name"]: i["count"]
                                  };
                                }
                              }
                              u = map["farm_type"];
                               droplist = [];

                              for (var i in u) {
                                if (i["type"] != null) {
                                  droplist.add(DropdownMenuItem<String>(
                                    value: i["type"],
                                    child: Text(i["type"]),
                                  ));
                                }
                              }
                              if (droplist.isNotEmpty) {
                                drop = droplist[0].value.toString();
                              }
                              setState(() {});
                            }
                          },
                          child: Builder(builder: (context) {
                            return Container(
                              child: Wrap(
                                alignment: WrapAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'المحافظة',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  const Text(
                                    'عدد المزارع',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Builder(builder: (context) {
                                    if (droplist.isNotEmpty) {
                                      return SizedBox(
                                        height: 60,
                                        width: 200,
                                        child: DropdownButton(
                                          dropdownColor: Colors.white,
                                          iconEnabledColor: Colors.transparent,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                          focusColor: Colors.transparent,
                                          isExpanded: true,
                                          underline: Container(),
                                          alignment: Alignment.center,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          value: drop,
                                          items: droplist,
                                          onChanged: (value) {
                                            setState(() {
                                              drop = value ?? drop;
                                            });
                                          },
                                        ),
                                      );
                                    }
                                    return Container();
                                  }),
                                ],
                              ),
                            );
                          }),
                        );
                      });
                    } else {
                      return Card(
                        child: SizedBox(
                          height: 150,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                u[index - 2],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    () {
                                      if (widget.list1[u[index - 2]]
                                          .containsKey(drop)) {
                                        return widget.list1[u[index - 2]][drop]
                                            .toString();
                                      }
                                      return "0";
                                    }(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Container(width: 10),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            );
          }

          return Container();
        });
  }
}
