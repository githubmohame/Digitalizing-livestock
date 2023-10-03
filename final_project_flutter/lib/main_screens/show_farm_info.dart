// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/common_component/select_animal.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/common_component/card_board.dart';
import 'package:final_project_year/common_component/google_map.dart';
import 'package:final_project_year/common_component/main_driwer.dart';
import 'package:final_project_year/common_component/pie_chart.dart';
import 'package:final_project_year/common_component/signup_dropdown_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis/apis_functions.dart';

/*


*/
class FarmInfoScreen extends StatefulWidget {
  late GoogleCompenentFarmInfo con;
  String farmId;
  ScrollController con2 = ScrollController();
  FarmInfoScreen({super.key, required this.farmId}) {
    wid = StatisticFarm(farmId: farmId);
  }
  late Widget wid;

  @override
  State<FarmInfoScreen> createState() => _FarmInfoScreenState();
}

class _FarmInfoScreenState extends State<FarmInfoScreen> {
  _FarmInfoScreenState();

  @override
  void initState() {
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SliverPadding;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: FutureBuilder(
              future: Api.farmInfo(
                  formData: FormData.fromMap({"id": widget.farmId})),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.done &&
                    snap.data != null) {
                  return LayoutBuilder(builder: (context, constraint) {
                    return Scaffold(
                      key: scaffoldKey,
                      //drawer: constraint.maxWidth < 1900.0? const CustomeDrawerView2(): null,
                      backgroundColor: const Color(0xFFf3f3f5),
                      body: SafeArea(
                        child: Row(
                          children: [
                            Expanded(
                                child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: NestedScrollView(
                                  //controller: widget.con2,
                                  headerSliverBuilder:
                                      (context, innerBoxIsScrolled) {
                                    return [
                                      SliverList(
                                        delegate: SliverChildListDelegate([
                                          Wrap(
                                              // mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                 IconButton(
                                                        icon: const Icon(
                                                          Icons.arrow_back,
                                                          color: Colors.green,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                     ,
                                              ]),
                                          constraint.maxWidth > 1920.0
                                              ? Wrap(
                                                  //mainAxisAlignment:
                                                  // MainAxisAlignment.start,
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(
                                                        Icons.menu,
                                                        color: Colors.green,
                                                      ),
                                                      onPressed: () {
                                                        scaffoldKey
                                                            .currentState!
                                                            .openDrawer();
                                                      },
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                          Container(height: 10),
                                          Wrap(
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              CustomeDropdownButtomSignUp(
                                                  value: 12),
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
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Wrap(
                                                      alignment:
                                                          WrapAlignment.center,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      spacing: 12,
                                                      runSpacing: 12,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      children: [
                                                        snap.data!["village"] !=
                                                                null
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "village"]
                                                                    ["name"],
                                                                icon: const Icon(
                                                                    Icons
                                                                        .description,
                                                                    color: Colors
                                                                        .blue),
                                                                color:
                                                                    Colors.blue,
                                                                title:
                                                                    'القارية')
                                                            : Container(),
                                                        snap.data!["village"]
                                                                    ["city"] !=
                                                                null
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                            "village"]
                                                                        ["city"]
                                                                    ["name"],
                                                                right: 20,
                                                                icon: const Image(
                                                                    image: AssetImage(
                                                                        'assets/icons/driver_google.png')),
                                                                color: Colors
                                                                    .amber,
                                                                title:
                                                                    'المدينة او المركز')
                                                            : Container(),
                                                        snap.data!["village"]["city"]["governorate"] !=
                                                                null
                                                            ? CardDashBoard(
                                                                value: snap.data!["village"]
                                                                            ["city"]
                                                                        ["governorate"]
                                                                    ["name"],
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color:
                                                                    const Color.fromARGB(
                                                                        255,
                                                                        188,
                                                                        76,
                                                                        76),
                                                                title: 'المحافظة')
                                                            : Container(),
                                                        snap.data!["section_type"] !=
                                                                null
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "section_type"]
                                                                    ["name"],
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons
                                                                        .access_time_outlined,
                                                                    color: Colors
                                                                        .blue),
                                                                color:
                                                                    Colors.blue,
                                                                title: 'القطاع')
                                                            : Container(),
                                                        snap.data!["number_of_workers_outer"] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "number_of_workers_outer"]
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    ' عدد العمال الخارجين')
                                                            : Container(),
                                                        snap.data!["number_of_workers_inner"] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "number_of_workers_inner"]
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    ' عدد العمال الداخلين')
                                                            : Container(),
                                                        snap.data!["playground"] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "playground"]
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    'عدد الملاعب')
                                                            : Container(),
                                                        snap.data!['huge_playground'] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        'huge_playground']
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    'سعة الملعب ')
                                                            : Container(),
                                                        snap.data!['wards'] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        'wards']
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    'عدد العنابر')
                                                            : Container(),
                                                        snap.data!["isolated_wards"] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "isolated_wards"]
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    'عدد عنابر العزل')
                                                            : Container(),
                                                        snap.data!["attached_area"] != 0
                                                            ? CardDashBoard(
                                                                value: snap.data![
                                                                        "attached_area"]
                                                                    .toString(),
                                                                right: 20,
                                                                icon: const Icon(
                                                                    Icons.cloud,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            188,
                                                                            76,
                                                                            76)),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    188,
                                                                    76,
                                                                    76),
                                                                title:
                                                                    'عدد الفدنة الملحقة')
                                                            : Container(),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(height: 40),
                                                  Container(height: 30),
                                                  Builder(builder: (context) {
                                                    widget.con =
                                                        GoogleCompenentFarmInfo(
                                                            f: snap.data!);
                                                    return widget.con;
                                                  })
                                                ],
                                              ),
                                              Container(
                                                width: 10,
                                              )
                                            ],
                                          ),
                                          constraint.maxWidth < 1900.0
                                              ? TotalStatisticsPieChart(
                                                  text: "احصائيات عن المزرعة",
                                                  width: 300,
                                                  statistic: snap.data![
                                                      "connect_animal_farm"],
                                                )
                                              : Container(),
                                          Container(
                                            height: 30,
                                          ),
                                        ]),
                                      ),
                                    ];
                                  },
                                  body: widget.wid),
                            )),
                            constraint.maxWidth >= 1900.0
                                ? TotalStatisticsPieChart(
                                    text: "احصائيات عن المزرعة",
                                    width: 400,
                                    statistic:
                                        snap.data!["connect_animal_farm"])
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  });
                } else {
                  return const Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          SizedBox(
                              height: 40,
                              width: 100,
                              child: CircularProgressIndicator.adaptive()),
                          Spacer()
                        ],
                      ),
                      Spacer(),
                    ],
                  );
                }
              }) 
    );
  }
}

class StatisticFarm extends StatefulWidget {
  List<Map<String, dynamic>> list1 = [];
  ScrollController con = ScrollController();
  String farmId;
  double f = 0;
  AnimalCubit? animalCubit;
  SelectAnimalTypeFarm? selectAnimal;
  String url = "";
  DateTime? startDate;
  DateTime? endDate;
  StatisticFarm({
    Key? key,
    required this.farmId,
  }) : super(key: key);
  @override
  State<StatisticFarm> createState() => _StatisticFarmState();
}

class _StatisticFarmState extends State<StatisticFarm> {
  String drop = "";

  int k = 0;
  @override
  void initState() {
    widget.con.addListener(() {
      if (widget.con.position.minScrollExtent == widget.con.offset) {}
    });
    super.initState();
  }

  Future<void> mock() async {
    setState(() {
      k += 10;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: ListView.builder(
            // controller: widget.con,
            itemCount: widget.list1.length + 3,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(30),
            itemBuilder: (context, index) {
              if (index == 0) {
                return FutureBuilder(
                    future: Api.animal_farm_api(farmId: widget.farmId),
                    builder: (context, snap) {
                      if (snap.data != null &&
                          snap.data!.isNotEmpty &&
                          snap.data![0]['platoon'] != null) {
                        return BlocProvider(
                          create: (context) {
                            widget.animalCubit ??=
                                AnimalCubit(platoon: -1, species: -1);
                            return widget.animalCubit!;
                          },
                          child: Builder(builder: (context) {
                            widget.selectAnimal ??= SelectAnimalTypeFarm(
                              farmId: widget.farmId,
                              platoonApi: Api.platoon_type_farm_api,
                              speciesApi: Api.animal_species_farm_api,
                            );

                            return Wrap(
                              children: [
                                SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: widget.selectAnimal),
                                TextButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      backgroundColor: Colors.red,

                                      disabledForegroundColor:
                                          Colors.blue.withOpacity(0.38),
                                      disabledBackgroundColor: Colors.blue
                                          .withOpacity(0.12), // surface color
                                      shadowColor: Colors
                                          .grey, //shadow prop is a very nice prop for every button or card widgets.
                                      elevation:
                                          5, // we can set elevation of this beautiful button
                                      side: BorderSide(
                                          color: Colors.redAccent
                                              .shade400, //change border color
                                          width: 2, //change border width
                                          style: BorderStyle
                                              .solid), // change border side of this beautiful button

                                      tapTargetSize:
                                          MaterialTapTargetSize.padded,
                                    ),
                                    onPressed: () async {
                                      widget.startDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2040)
                                          // lastDate: DateTime.now()
                                          );
                                    },
                                    child: const Text("تاريخ البدأ",
                                        style: TextStyle(color: Colors.black))),
                                TextButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      backgroundColor: Colors.red,

                                      disabledForegroundColor:
                                          Colors.blue.withOpacity(0.38),
                                      disabledBackgroundColor: Colors.blue
                                          .withOpacity(0.12), // surface color
                                      shadowColor: Colors
                                          .grey, //shadow prop is a very nice prop for every button or card widgets.
                                      elevation:
                                          5, // we can set elevation of this beautiful button
                                      side: BorderSide(
                                          color: Colors.redAccent
                                              .shade400, //change border color
                                          //change border width
                                          style: BorderStyle
                                              .solid), // change border side of this beautiful button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            30), //change border radius of this beautiful button thanks to BorderRadius.circular function
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.padded,
                                    ),
                                    onPressed: () async {
                                      widget.endDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2040),
                                        // lastDate: DateTime.now()
                                      );
                                    },
                                    child: const Text("تاريخ الانتهاء",
                                        style: TextStyle(color: Colors.black))),
                                TextButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      backgroundColor: Colors.red,
                                      disabledForegroundColor:
                                          Colors.blue.withOpacity(0.38),
                                      disabledBackgroundColor: Colors.blue
                                          .withOpacity(0.12), // surface color
                                      shadowColor: Colors
                                          .grey, //shadow prop is a very nice prop for every button or card widgets.
                                      elevation:
                                          5, // we can set elevation of this beautiful button
                                      side: BorderSide(
                                          color: Colors.redAccent
                                              .shade400, //change border color
                                          //change border width
                                          style: BorderStyle
                                              .solid), // change border side of this beautiful button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            30), //change border radius of this beautiful button thanks to BorderRadius.circular function
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.padded,
                                    ),
                                    onPressed: () async {
                                      Map<String, dynamic> dic1 = {
                                        "farm_id": widget.farmId,
                                      };
                                      dic1.addAll({
                                        "start_date": widget.startDate,
                                        "end_date": widget.endDate,
                                      });
                                      if (widget.selectAnimal?.species !=
                                          null) {
                                        dic1.addAll({
                                          "species":
                                              widget.selectAnimal?.species
                                        });
                                      } else if (widget.selectAnimal?.platoon !=
                                          null) {
                                        dic1.addAll({
                                          "platoon":
                                              widget.selectAnimal?.platoon,
                                        });
                                      }

                                      widget.list1.clear();
                                      Api.farm_info_list(
                                              url: "",
                                              formData: FormData.fromMap(dic1))
                                          .then((value) {
                                        if (value is (
                                          String,
                                          List<Map<String, dynamic>>
                                        )) {
                                          var (m, l) = value;
                                          widget.list1.addAll(l);
                                          widget.url = m;
                                          setState(() {});
                                        }
                                      });
                                    },
                                    child: const Text("بحث",
                                        style: TextStyle(color: Colors.black))),
                              ],
                            );
                          }),
                        );
                      }
                      return Container();
                    });
              }
              if (index == 1) {
                return const Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Text(
                      'الفصيلة',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      'عدد الرؤوس',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      'التاريخ',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      'انثي',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                );
              } else {
                if (index - 2 < widget.list1.length) {
                  return Card(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            widget.list1[index - 2]["animal_sub_type"]
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            widget.list1[index - 2]["animal_number"].toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            widget.list1[index - 2]["date"].toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          Checkbox(
                            value: widget.list1[index - 2]["is_male"],
                            onChanged: (value) {
                              //mock();
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  );
                } else if (widget.url != "null") {
                  Map<String, dynamic> dic1 = {};
                  if (widget.selectAnimal?.species == null) {
                    dic1 = {
                      "farm_id": widget.farmId,
                      "start_date": widget.startDate,
                      "end_date": widget.endDate,
                      "species": widget.selectAnimal?.species
                    };
                  } else if (widget.selectAnimal?.platoon == null) {
                    dic1 = {
                      "farm_id": widget.farmId,
                      "start_date": widget.startDate,
                      "end_date": widget.endDate,
                      "platoon": widget.selectAnimal?.platoon
                    };
                  }

                  Api.farm_info_list(
                          url: widget.url, formData: FormData.fromMap(dic1))
                      .then((value) {
                    if (value is (String, List<Map<String, dynamic>>)) {
                      var (m, l) = value;
                      widget.list1.addAll(l);
                      widget.url = m;
                      setState(() {});
                    }
                  });
                  return const CircularProgressIndicator();
                }
              }
              return null;
            }));
  }
}
