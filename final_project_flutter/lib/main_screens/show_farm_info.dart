// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/common_component/card_board.dart';
import 'package:final_project_year/common_component/google_map.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/common_component/pie_chart.dart';
import 'package:final_project_year/common_component/signup_dropdown_button.dart';

import '../apis/apis_functions.dart';

/*


*/
class FarmInfoScreen extends StatefulWidget {
  GoogleMapComponentDashBoardScreen con =
      const GoogleMapComponentDashBoardScreen();
  ScrollController con2 = ScrollController();
  FarmInfoScreen({super.key});
  late Widget wid;
  @override
  State<FarmInfoScreen> createState() {
     wid = StatisticFarm(
      con: con2,
    );
    return _FarmInfoScreenState(googleMapComponentDashBoardScreen: con);
  }
}

class _FarmInfoScreenState extends State<FarmInfoScreen> {
  _FarmInfoScreenState({required this.googleMapComponentDashBoardScreen});

  GoogleMapComponentDashBoardScreen googleMapComponentDashBoardScreen;

  @override
  Widget build(BuildContext context) {
    SliverPadding;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: farmInfo(formData: FormData.fromMap({"id": 123})),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done &&
                  snap.data != null) {
                 return LayoutBuilder(builder: (context, constraint) {
                  return Scaffold(
                    key: scaffoldKey,
                    drawer: constraint.maxWidth < 1900.0
                        ? const CustomeDrawerView2()
                        : null,
                    backgroundColor: const Color(0xFFf3f3f5),
                    body: Row(
                      children: [
                        constraint.maxWidth >= 1920.0
                            ? const CustomeDrawerView2()
                            : Container(),
                        Expanded(
                            child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: NestedScrollView(
                              controller: widget.con2,
                              headerSliverBuilder:
                                  (context, innerBoxIsScrolled) {
                                return [
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      Row(children: [
                                        constraint.maxWidth < 1920.0
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.menu,
                                                      color: Colors.green,
                                                    ),
                                                    onPressed: () {
                                                      scaffoldKey.currentState!
                                                          .openDrawer();
                                                    },
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                      ]),
                                      constraint.maxWidth > 1920.0
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.menu,
                                                    color: Colors.green,
                                                  ),
                                                  onPressed: () {
                                                    scaffoldKey.currentState!
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
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0),
                                                child: Wrap(
                                                  alignment:
                                                      WrapAlignment.center,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  spacing: 12,
                                                  runSpacing: 12,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
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
                                                            color: Colors.blue,
                                                            title: 'القارية')
                                                        : Container(),
                                                    snap.data!["village"]
                                                                ["city"] !=
                                                            null
                                                        ? CardDashBoard(
                                                            value: snap.data![
                                                                    "village"][
                                                                "city"]["name"],
                                                            right: 20,
                                                            icon: const Image(
                                                                image: AssetImage(
                                                                    'assets/icons/driver_google.png')),
                                                            color: Colors.amber,
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
                                                                color: Color.fromARGB(
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
                                                            color: Colors.blue,
                                                            title: 'القطاع')
                                                        : Container(),
                                                    snap
                                                                    .data![
                                                                "number_of_workers"] !=
                                                            0
                                                        ? CardDashBoard(
                                                            value: snap.data![
                                                                    "number_of_workers"]
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
                                                            title: 'عدد العمال')
                                                        : Container(),
                                                    snap
                                                                    .data![
                                                                "playground"] !=
                                                            0
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
                                                    snap
                                                                    .data![
                                                                'huge_playground'] !=
                                                            0
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
                                                            value: snap
                                                                .data!['wards']
                                                                .toString(),
                                                            right: 20,
                                                            icon: const Icon(
                                                                Icons.cloud,
                                                                color: Color.fromARGB(
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
                                                    snap
                                                                    .data![
                                                                "isolated_wards"] !=
                                                            0
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
                                                    snap
                                                                    .data![
                                                                "attached_area"] !=
                                                            0
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
                                              width: 300,
                                              statistic: [],
                                            )
                                          : Container(),
                                      Container(
                                        height: 30,
                                      ),
                                    ]),
                                  ),
                                ];
                              },
                              body: StatisticFarm(
                                con: widget.con2,
                              )),
                        )),
                        constraint.maxWidth >= 1900.0
                            ? TotalStatisticsPieChart(width: 400, statistic: [])
                            : Container(),
                      ],
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
            }));
  }
}

class StatisticFarm extends StatefulWidget {
  List<Map<String, dynamic>> list1 = [];
  ScrollController con;
  double f = 0;
  StatisticFarm({
    Key? key,
    required this.con,
  }) : super(key: key);
  @override
  State<StatisticFarm> createState() => _StatisticFarmState();
}

class _StatisticFarmState extends State<StatisticFarm> {
  String drop = "";

  int k = 0;
  @override
  void initState() {
     mock();
    super.initState();
  }

  Future<void> mock() async {
    setState(() {
      k += 10;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: k + 2,
            shrinkWrap: false,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(30),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
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
                  ),
                );
              } else {
                return Card(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "mjjkk",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        Text(index.toString()),
                        Text(
                          "gg" * 10,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        Checkbox(
                          value: true,
                          onChanged: (value) {
                            mock();
                          },
                        )
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
