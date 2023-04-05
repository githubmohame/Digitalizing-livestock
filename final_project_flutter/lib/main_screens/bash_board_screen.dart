// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_year/main_screens/add_admin_screen.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/connect_farm_farmer_screen.dart';
import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/screen_gavernorate.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: constraint.maxWidth < 1900.0 ? CustomeDrawer() : null,
            backgroundColor: Color(0xFFf3f3f5),
            body: Row(
              children: [
                constraint.maxWidth >= 1920.0
                    ? CustomeDrawer()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ],
                      ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(height: 10),
                        Row(
                          children: [
                            Flexible(
                              flex: 11,
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                margin: EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        child: SearchTextField(
                                            width: constraint.maxWidth >= 500
                                                ? 600 - 200
                                                : constraint.maxWidth - 200),
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                    ),
                                    CustomeDropdownButtom(value: 12),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          height: constraint.maxWidth < 1900.0
                              ? 1700 + 400 + 300
                              : 700 + 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      child: Wrap(
                                        runAlignment:
                                            WrapAlignment.spaceBetween,
                                        spacing: 12,
                                        runSpacing: 12,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: [
                                          CardDashBoard(
                                              icon: Icon(Icons.description,
                                                  color: Colors.blue),
                                              color: Colors.blue,
                                              title: 'مزارع  اللبان'),
                                          CardDashBoard(
                                              right: 20,
                                              icon: Image(
                                                  image: AssetImage(
                                                      'assets/icons/driver_google.png')),
                                              color: Colors.amber,
                                              title: 'عدد مزارع اللحوم'),
                                          CardDashBoard(
                                              right: 20,
                                              icon: Icon(Icons.cloud,
                                                  color: Color.fromARGB(
                                                      255, 188, 76, 76)),
                                              color: Color.fromARGB(
                                                  255, 188, 76, 76),
                                              title: 'عدد المربين'),
                                          CardDashBoard(
                                              right: 20,
                                              icon: Icon(
                                                  Icons.access_time_outlined,
                                                  color: Colors.blue),
                                              color: Colors.blue,
                                              title: 'عدد الاماكن'),
                                        ],
                                      ),
                                    ),
                                    Container(height: 40),
                                    Container(height: 30),
                                    Container(
                                      height: 350,
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        height: 300 - 32,
                                        child: Stack(
                                          children: [
                                            FlutterMap(
                                              options: MapOptions(),
                                              children: [
                                                TileLayer(
                                                  urlTemplate:
                                                      "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                                  userAgentPackageName:
                                                      'dev.fleaflet.flutter_map.example',
                                                ),
                                                MarkerLayer(
                                                  markers: [
                                                    Marker(
                                                        height: 200,
                                                        width: 200,
                                                        point: LatLng(60, 60),
                                                        builder: (context) =>
                                                            Icon(Icons
                                                                .location_on))
                                                  ],
                                                ),
                                                Wrap(
                                                  children: [
                                                    Container(
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        width: 500,
                                                        child: SearchTextField(
                                                            width: 100)),
                                                    Container(
                                                      height: 50,
                                                      child: TextButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.resolveWith(
                                                                      (states) =>
                                                                          Colors
                                                                              .green)),
                                                          onPressed: () {},
                                                          child: Text('search',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white))),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (constraint.maxWidth < 1900.0)
                                      RecentFile()
                                    else
                                      Container(
                                          height: 500,
                                          child: SingleChildScrollView(
                                            child: RecentFile(),
                                          )),
                                    constraint.maxWidth < 1900.0
                                        ? StorageDetails(width: null)
                                        : Container(),
                                  ],
                                ),
                              ),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
                constraint.maxWidth >= 1900.0
                    ? StorageDetails(width: 400)
                    : Container(),
              ],
            ),
          );
        }));
  }
}

class CustomeDropdownButtom extends StatefulWidget {
  int value;
  CustomeDropdownButtom({
    Key? key,
    required this.value,
  }) : super(key: key);
  @override
  State<CustomeDropdownButtom> createState() => _CustomeDropdownButtomState();
}

class _CustomeDropdownButtomState extends State<CustomeDropdownButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(10),
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
          DropdownMenuItem<int>(
            child: Container(
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
            value: 13,
          ),
          DropdownMenuItem<int>(
            child: Container(
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/icons/profile_pic.png')),
                  Expanded(
                      child: Text(
                    'Mohamed',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                ],
              ),
            ),
            value: 12,
          ),
        ],
        onChanged: (value) {
          if (value == 13) {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return LogIN();
              },
            ));
          }
          ;
        },
      ),
    );
  }
}

class SearchTextField extends StatefulWidget {
  double width;
  SearchTextField({
    Key? key,
    required this.width,
  }) : super(key: key);
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    print('object' + "\t" + "const" + "  " + widget.width.toString());
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: widget.width * (2 / 3),
              height: 40,
              color: Colors.white,
              child: TextField(
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 166, 197, 181),
                          fontSize: 20),
                      hintText: 'Search',
                      border: OutlineInputBorder(borderSide: BorderSide.none))),
            ),
          ),
        ],
      ),
    );
  }
}

class StorageDetailsItem extends StatelessWidget {
  Widget icon;
  Widget diescript;
  double size;
  Widget text;
  StorageDetailsItem({
    Key? key,
    required this.icon,
    required this.diescript,
    required this.size,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      child: Row(children: [
        icon,
        Container(margin: EdgeInsets.only(left: 10), child: diescript),
        Spacer(),
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
      required this.color,
      required this.title});
  double? right;
  Widget icon;
  Color color;
  String title;
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
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 70,
                        child: Text(
                          '126',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Container(
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
              ),
            ],
          )),
    );
  }
}

class StorageDetails extends StatelessWidget {
  StorageDetails({super.key, this.width});
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width is double ? 400 : null,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 10, bottom: 2),
                child: Text(
                  'System Details',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            Container(
              height: 70,
              margin: EdgeInsets.all(90),
              child: Stack(
                children: [
                  Expanded(
                    child:
                        PieChart(PieChartData(centerSpaceRadius: 70, sections: [
                      PieChartSectionData(
                          showTitle: false,
                          value: 12,
                          radius: 12,
                          color: Color(0xff9e65ff)),
                      PieChartSectionData(
                        showTitle: false,
                        value: 25,
                        radius: 12,
                        color: Colors.green,
                      ),
                      PieChartSectionData(
                          showTitle: false,
                          value: 25,
                          radius: 12,
                          color: Color(0xFF222d40)),
                      PieChartSectionData(
                          showTitle: false,
                          value: 25,
                          radius: 12,
                          color: Color(0xFFfea43a)),
                      PieChartSectionData(
                          showTitle: false,
                          value: 30,
                          radius: 12,
                          color: Colors.blue)
                    ])),
                  ),
                ],
              ),
            ),
            StorageDetailsItem(
              text: Text(
                '145 files',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontSize: 15),
              ),
              icon: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 5,
              ),
              diescript: Row(
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
              size: 145,
            ),
            StorageDetailsItem(
              icon: CircleAvatar(radius: 5, backgroundColor: Color(0xff9e65ff)),
              diescript: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الماعز',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9e65ff),
                        fontSize: 15),
                  ),
                ],
              ),
              size: 145,
              text: Text(
                '145 files',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9e65ff),
                    fontSize: 15),
              ),
            ),
            StorageDetailsItem(
              icon: CircleAvatar(
                radius: 5,
                backgroundColor: Color(0xFF222d40),
              ),
              diescript: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الجمال',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222d40),
                        fontSize: 15),
                  ),
                ],
              ),
              size: 145,
              text: Text(
                '145 files',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222d40),
                    fontSize: 15),
              ),
            ),
            StorageDetailsItem(
              icon: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.blue,
              ),
              diescript: Row(
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
              size: 145,
              text: Text(
                '145 files',
                style: TextStyle(
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

class RecentFile extends StatelessWidget {
  const RecentFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          //set border radius more than 50% of height and width to make circle
        ),
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'المحافظة',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    Expanded(
                        child: Text(
                      'عدد الرؤوس',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                    Container(
                      width: 80,
                      child: DropdownButton(
                        dropdownColor: Colors.grey,
                        iconEnabledColor: Colors.transparent,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        focusColor: Colors.transparent,
                        isExpanded: true,
                        underline: Container(),
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(0),
                        value: 'الابقار',
                        items: [
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
                    Spacer()
                  ],
                ),
              ),
              ...List.generate(30, (index) {
                if (index % 2 == 0)
                  return Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.black.withOpacity(0.4),
                  );
                else
                  return Container(
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
  }
}

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({super.key});

  @override
  State<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Card(
          child: Container(
            width: 300,
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                Row(
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
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'اضافة مربين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FarmScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'اضافة مزرعة',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
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
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.store_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'ربط المزرعه بالمربين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return AddLocationScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'تعديل مكان',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return UpdateAnimal();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'تعديل حيوان',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
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
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/pie-chart.png'),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'اضافة مودرين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
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
                        return ChangePasswordScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'تغير كلمة المرور',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
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
                        return ListFarmer();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'عرض مربين',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
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
                        return ListFarmer();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, bottom: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code_2_outlined,
                          color: Color(0xFF5f6271),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'عرض المزرعة',
                          style: TextStyle(color: Color(0xff6f766f)),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomeSearch extends StatefulWidget {
  double width;
  String text;
  CustomeSearch({
    Key? key,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomeSearch> createState() => _CustomeSearchState();
}

class _CustomeSearchState extends State<CustomeSearch> {
  bool visiable = false;
  double height = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                if (value.isEmpty && visiable)
                  setState(() {
                    visiable = false;
                  });
                else if (!visiable)
                  setState(() {
                    height = 200;
                    visiable = true;
                  });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ادخل اسم المزارع او المزرعة',
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white),
            ),
            Visibility(
              visible: visiable,
              child: Expanded(
                  child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black))),
                            child: IconButton(
                                style: ButtonStyle(),
                                onPressed: () {
                                  setState(() {
                                    visiable = false;
                                    height = 100;
                                  });
                                },
                                icon: Row(
                                  children: [
                                    Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(
                                          'https://www.agri2day.com/wp-content/uploads/2019/04/-%D9%85%D8%B2%D8%A7%D8%B1%D8%B9-%D8%A7%D9%84%D8%A5%D9%86%D8%AA%D8%A7%D8%AC-%D8%A7%D9%84%D8%AD%D9%8A%D9%88%D8%A7%D9%86%D9%8A-%D8%A8%D8%A7%D9%84%D8%B4%D8%B1%D9%82%D9%8A%D8%A9-e1554558511203.jpeg'),
                                    ),
                                    Text('data')
                                  ],
                                )),
                          );
                        },
                      ))),
            ),
          ],
        ));
  }
}
