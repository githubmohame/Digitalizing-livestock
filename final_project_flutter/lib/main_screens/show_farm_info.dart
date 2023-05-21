import 'package:dio/dio.dart';
import 'package:final_project_year/common_component/google_map.dart';
import 'package:final_project_year/common_component/search_field.dart';
import 'package:final_project_year/main_screens/add_admin_screen.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/connect_farm_farmer_screen.dart';
import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/screen_gavernorate.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/main_screens/farm_screen.dart';

import '../apis/apis_functions.dart';

/*


*/

class DashBoardScreen extends StatefulWidget {
  GoogleMapComponentDashBoardScreen con =
      const GoogleMapComponentDashBoardScreen();
  DashBoardScreen({super.key});
  Widget wid = StatisticGovernorate();
  @override
  State<DashBoardScreen> createState() {
    return _DashBoardScreenState(googleMapComponentDashBoardScreen: con);
  }
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  _DashBoardScreenState({required this.googleMapComponentDashBoardScreen});
  ScrollController con = ScrollController();
  GoogleMapComponentDashBoardScreen googleMapComponentDashBoardScreen;

  @override
  Widget build(BuildContext context) {
    SliverPadding;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            key: scaffoldKey,
            drawer: constraint.maxWidth < 1900.0 ? const CustomeDrawer() : null,
            backgroundColor: const Color(0xFFf3f3f5),
            body: Row(
              children: [
                constraint.maxWidth >= 1920.0
                    ? const CustomeDrawer()
                    : Container(),
                Expanded(
                  child: FutureBuilder(
                      future: farm_info_api(formData: FormData.fromMap({})),
                      builder: (context, snap) {
                        if (snap.connectionState == ConnectionState.done) {
                          return NestedScrollView(
                              controller: con,
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
                                        children: [
                                          SizedBox(
                                            height: 200,
                                            width: double.infinity,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 100,
                                                    child: SearchTextField(
                                                        width: constraint
                                                                    .maxWidth >=
                                                                500
                                                            ? 600 - 200
                                                            : constraint
                                                                    .maxWidth -
                                                                200),
                                                  ),
                                                ),
                                                Container(
                                                  width: 70,
                                                ),
                                                CustomeDropdownButtomSignUpDashboard(
                                                    value: 12),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 10,
                                      ),
                                      Wrap(
                                        runAlignment:
                                            WrapAlignment
                                                .spaceBetween,
                                        spacing: 12,
                                        runSpacing: 12,
                                        crossAxisAlignment:
                                            WrapCrossAlignment
                                                .start,
                                        children: [
                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'number_of_arc']
                                                  .toString(),
                                              icon: const Icon(
                                                  Icons
                                                      .description,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  'عدد الافدنة  للمزرعة'),
                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'farm_name']
                                                  .toString(),
                                              right: 20,
                                              icon: const Image(
                                                  image: AssetImage(
                                                      'assets/icons/driver_google.png')),
                                              color: Colors.amber,
                                              title:
                                                  'اسم المزرعة'),
                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'id']
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
                                                  'كود المزرعة'),
                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'number_of_workers']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  'عدد  العمال'),

                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'playground']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  'عدد   الملاعب'),
                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'huge_playground']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  'سعة الملاعب'),
                                          CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'wards']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  'عدد  العنابر'),
                                            CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'isolated_wards']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  ' عدد  العنابر العزل'),
                                              CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'section_type']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  ' نوع  القطاع'),
                                                  CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'village']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  ' اسم  القارية'),
                                           CardDashBoard(
                                              value: snap
                                                  .data!['data'][
                                                      'village']
                                                  .toString(),
                                              right: 20,
                                              icon: const Icon(
                                                  Icons
                                                      .access_time_outlined,
                                                  color: Colors
                                                      .blue),
                                              color: Colors.blue,
                                              title:
                                                  ' عدد  الافدنة الملحقهة'),
                                                 Container(height: 40),
                                      Container(height: 30),
                                      googleMapComponentDashBoardScreen,
                                      Container(
                                      width: 10,
                                      )  
                                        ],
                                      ),
                                      
                                      Container(
                                        height: 30,
                                      ),
                                    ]),
                                  ),
                                ];
                              },
                              body: StatisticGovernorate(
                                list1: () {
                                  List<Map<String, dynamic>> map = [];
                                  for (var f in snap.data!['data']
                                      ['gov_data']) {
                                    map.add(f);
                                  }
                                  return map;
                                }(),
                              ));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ),
                 
              ],
            ),
          );
        }));
  }
}

class CustomeDropdownButtomSignUpDashboard extends StatefulWidget {
  CustomeDropdownButtomSignUpDashboard({
    Key? key,
    required this.value,
  }) : super(key: key);

  int value;

  @override
  State<CustomeDropdownButtomSignUpDashboard> createState() =>
      _CustomeDropdownButtomSignUpDashboardState();
}

class _CustomeDropdownButtomSignUpDashboardState
    extends State<CustomeDropdownButtomSignUpDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: DropdownButton(
        isDense: true,
        isExpanded: true,
        underline: Container(),
        value: widget.value,
        items: [
          const DropdownMenuItem<int>(
            value: 13,
            child: Row(
              children: [
                Expanded(child: Icon(Icons.person_2_rounded)),
                Expanded(
                    child: Text(
                  'SignOut',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )),
              ],
            ),
          ),
          DropdownMenuItem<int>(
            value: 12,
            child: Row(
              children: [
                Expanded(child: Image.asset('assets/icons/profile_pic.png')),
                const Expanded(
                    child: Text(
                  'Mohamed',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )),
              ],
            ),
          ),
        ],
        onChanged: (value) {
          if (value == 13) {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const LogIN();
              },
            ));
          }
        },
      ),
    );
  }
}

class StorageDetailsItem extends StatelessWidget {
  StorageDetailsItem({
    Key? key,
    required this.icon,
    required this.diescript,
    required this.size,
    required this.text,
  }) : super(key: key);

  Widget diescript;
  Widget icon;
  double size;
  Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      child: Row(children: [
        icon,
        Container(margin: const EdgeInsets.only(left: 10), child: diescript),
        const Spacer(),
        text,
      ]),
    );
  }
}

class CardDashBoard extends StatelessWidget {
  CardDashBoard(
      {super.key,
      this.right,
      required this.icon,
      required this.value,
      required this.color,
      required this.title});

  Color color;
  Widget icon;
  double? right;
  String title;
  String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Card(
          margin: EdgeInsets.only(right: right ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            //set border radius more than 50% of height and width to make circle
          ),
          elevation: 0,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 70,
                        child: Text(
                          value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              /*Container(
                margin: EdgeInsets.only(left: 0, top: 20),
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: icon,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: color, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.5),
                                blurRadius: 10,
                              )
                            ])),
                  ],
                ),
              ),*/
            ],
          )),
    );
  }
}

class StorageDetails extends StatelessWidget {
  StorageDetails({super.key, this.width, required this.statistic}) {
    if (statistic.isEmpty) {
      statistic = [0, 0, 0];
    }
  }
  List<int> statistic;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 2),
                child: const Text(
                  'معلومات عن النظام',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            LayoutBuilder(builder: (context, constraint) {
              return Container(
                width: constraint.maxWidth / 3,
                height: 70,
                margin: EdgeInsets.all(constraint.maxWidth / 6),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(100),
                      child: PieChart(PieChartData(
                          borderData: FlBorderData(
                            show: true,
                          ),
                          centerSpaceRadius: 0,
                          sections: [
                            PieChartSectionData(
                                title: "الجمال",
                                titleStyle:
                                    const TextStyle(color: Colors.white),
                                showTitle: true,
                                value: statistic[0].toDouble(),
                                radius: 120,
                                color: const Color(0xff9e65ff)),
                            PieChartSectionData(
                                title: "الابقار",
                                titleStyle:
                                    const TextStyle(color: Colors.white),
                                showTitle: true,
                                value: statistic[2].toDouble(),
                                radius: 120,
                                color: const Color(0xFFfea43a)),
                            PieChartSectionData(
                                title: "الخرفان",
                                titleStyle:
                                    const TextStyle(color: Colors.white),
                                showTitle: true,
                                value: statistic[1].toDouble(),
                                radius: 120,
                                color: Colors.blue)
                          ])),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 100,
            ),
            StorageDetailsItem(
              text: Text(
                statistic[2].toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontSize: 15),
              ),
              icon: const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 5,
              ),
              diescript: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الابقار',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 15),
                  ),
                ],
              ),
              size: statistic[2].toDouble(),
            ),
            StorageDetailsItem(
              icon: const CircleAvatar(
                  radius: 5, backgroundColor: Color(0xff9e65ff)),
              diescript: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الجمال',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9e65ff),
                        fontSize: 15),
                  ),
                ],
              ),
              size: statistic[0].toDouble(),
              text: Text(
                statistic[0].toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9e65ff),
                    fontSize: 15),
              ),
            ),
            StorageDetailsItem(
              icon: const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.blue,
              ),
              diescript: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الخرفان',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 15),
                  ),
                ],
              ),
              size: statistic[0].toDouble(),
              text: Text(
                statistic[0].toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentFile2 extends SliverChildBuilderDelegate {
  RecentFile2(
    super.builder, {
    super.childCount = 1000000,
  });
  static Widget builder2(BuildContext context, int index) {
    if (index == 0) {
      return Card(
        child: Column(children: [
          Row(
            children: [
              const Expanded(
                  child: Text(
                'المحافظة',
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
              const Expanded(
                  child: Text(
                'عدد الرؤوس',
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
              SizedBox(
                width: 80,
                child: DropdownButton(
                  dropdownColor: Colors.grey,
                  iconEnabledColor: Colors.transparent,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  focusColor: Colors.transparent,
                  isExpanded: true,
                  underline: Container(),
                  alignment: Alignment.center,
                  borderRadius: BorderRadius.circular(0),
                  value: 'الابقار',
                  items: const [
                    DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: "الابقار",
                        child: Text('ابقار')),
                    DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: "الاغنام",
                        child: Text('الاغنام'))
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          )
        ]),
      );
    } else {
      return Card(
        child: SizedBox(
            height: 130,
            //margin: EdgeInsets.all(30),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(right: 30, left: 10),
                child: const Row(
                  children: [
                    Expanded(
                        child: Text(
                      'اسم',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    Expanded(
                        child: Text(
                      '33333333',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    Spacer(),
                  ],
                ),
              )
            ])),
      );
    }
  }
}

class StatisticGovernorate extends StatefulWidget {
  List<Map<String, dynamic>> list1 = [];
  StatisticGovernorate({
    super.key,
    this.list1 = const [],
  });

  @override
  State<StatisticGovernorate> createState() => _StatisticGovernorateState();
}

class _StatisticGovernorateState extends State<StatisticGovernorate> {
  String drop = "farm_meat_gov";
  ScrollController con = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
          itemCount: widget.list1.length + 1,
          separatorBuilder: (context, index) {
            return Container();
          },
          cacheExtent: 10,
          clipBehavior: Clip.none,
          physics: const ClampingScrollPhysics(),
          reverse: false,
          padding: const EdgeInsets.all(30),
          itemBuilder: (context, index) {
            print(widget.list1.length);
            if (index == 0) {
              return Container(
                height: 200,
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'المحافظة',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    const Expanded(
                        child: Text(
                      'عدد الرؤوس',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    SizedBox(
                      width: 80,
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
                        borderRadius: BorderRadius.circular(0),
                        value: drop,
                        items: const [
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: "farm_meat_gov",
                              child: Text('مزارع اللحوم')),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: "farm_milk_gov",
                              child: Text('مزارع الالبان')),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: "total_villages",
                              child: Text('عدد القري'))
                        ],
                        onChanged: (value) {
                          setState(() {
                            drop = value ?? drop;
                          });
                        },
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                          ),
                          Container(
                            width: 5,
                          ),
                          Text(
                            widget.list1[index - 1]['g_name'],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      widget.list1[index - 1][drop].toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    const Spacer(),
                  ],
                ),
              );
            }
          }),
    );
  }
}

/*
  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                              ),
                              Container(
                                width: 5,
                              ),
                              Text(
                                'القاهرة',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Text(
                          '3456',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                        Spacer(),
                      ],
                    ),
                  );
              }),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                width: double.infinity,
                height: 1,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
        
*/
class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({super.key});

  @override
  State<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.play_arrow_rounded,
                      weight: 12,
                      size: 70,
                      color: Color(0XFF48ad69),
                    ),
                    Text(
                      'DashBoard',
                      style: TextStyle(
                          color: Color(0xff5d5d5d),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
                Container(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FarmerScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'اضافة مربين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const FarmScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'اضافة مزرعة',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ConnectFarmAndFarmerScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.store_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'ربط المزرعه بالمربين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const AddLocationScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'تعديل مكان',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const UpdateAnimal();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'تعديل حيوان',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return AddAdmin();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/pie-chart.png'),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'اضافة مودرين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const ChangePasswordScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'تغير كلمة المرور',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const ListFarmer();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'عرض مربين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const ListFarmer();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'عرض المزرعة',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 