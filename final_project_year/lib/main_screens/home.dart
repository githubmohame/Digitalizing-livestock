import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/add_admin_screen.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/chart_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/screen_location/screen_gavernorate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(index: 1),
        body: SafeArea(
            child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(100)),
                        color: Color(0x0FF9c6644),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Text("مرحبا بك",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                          margin: EdgeInsets.only(top: 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: FloatingActionButton(heroTag: 'statistics',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/farmer.png'),
                              Text(
                                "عدد المربين الافراد",
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                6578654.toString(),
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () {}),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: FloatingActionButton(heroTag:'farm',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/field.png'),
                              Text(
                                "عدد المزارع\n",
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                6578654.toString(),
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () {}),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: FloatingActionButton(heroTag: 'cows',
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/cow_head.png"),
                              Text(
                                "عدد رؤس الماشية ",
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                6578654.toString(),
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: FloatingActionButton(heroTag: 'cows',
                          backgroundColor: Colors.white,
                          onPressed: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ChartScreen(),
                    ));
              }),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/drawer_statistics.png"),
                              Text(
                                "الاحصائيات",
                                style: TextStyle(
                                    color: Color(0x0FF9c6644),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(margin: EdgeInsets.only(right: 100),
                        child: GestureDetector(onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  UpdateAnimal(),
                    ));
              }),
                          child: Card(
                            color: Color(0x0FFFc5c4be),
                            elevation: 10,
                            child: Container(
                                width: 150,
                                height: 150,
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/add_animal.png'),
                                    Text(
                                      "اضافة حيوان",
                                      style: TextStyle(
                                          color: Color(0x0FFa58363),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(margin: EdgeInsets.only(left: 100),
                        child: GestureDetector(onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Farmer(),
                    ));
              },
                          child: Card(
                            color: Color(0x0FFFc5c4be),
                            elevation: 10,
                            child: Container(
                                width: 150,
                                height: 150,
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/add_farmer.png'),
                                    Text("اضافه مربي",style: TextStyle(
                                          color: Color(0x0FFa58363),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(margin: EdgeInsets.only(right: 100),
                        child: GestureDetector( onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FarmScreen(),
                    ));
              }),
                          child: Card(
                            color: Color(0x0FFFc5c4be),
                            elevation: 10,
                            child: Container(
                                width: 150,
                                height: 150,
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/add_field.png'),
                                    Text("اضافة مزرعة",style: TextStyle(
                                          color: Color(0x0FFa58363),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                      child: Container(margin: EdgeInsets.only(left: 100),
                        child: GestureDetector( onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  UpdateLocation(),
                    ));
              }), 
                          child: Card(
                            color: Color(0x0FFFc5c4be),
                            elevation: 10,
                            child: Container(
                                width: 150,
                                height: 150,
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/location-pin.png'),
                                    Text("اضافة مكان",style:  TextStyle(
                                          color: Color(0x0FFa58363),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    
                   
                  ],
                ),
                 Row(
                  children: [
                    Expanded(
                      child: Container(margin: EdgeInsets.only(right: 100),
                        child: GestureDetector(onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  AddAdmin(),
                    ));
              }),
                          child: Card(
                            color: Color(0x0FFFc5c4be),
                            elevation: 10,
                            child: Container(
                                width: 150,
                                height: 150,
                                child: Column(
                                  children: [
                                     Icon( Icons.person,size:80,color:Colors.brown),
                                    Text("تسجيل المدرين"),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                     Expanded(
                      child: Container(margin: EdgeInsets.only(left:100),
                        child: GestureDetector( onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogIN(),
                    ));
              }),
                          child: Card(
                            color: Color(0x0FFFc5c4be),
                            elevation: 10,
                            child: Container(
                                width: 150,
                                height: 150,
                                child: Column(
                                  children: [
                                     Icon( Icons.person,size:80,color:Colors.brown),
                                    Text("تسجيل الدخول",style: TextStyle(
                                          color: Color(0x0FFa58363),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

