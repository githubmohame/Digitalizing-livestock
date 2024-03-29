// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_drower.dart';
import 'package:final_project_year/main_screens/add_admin_screen.dart';
import 'package:final_project_year/main_screens/connect_animal_farm_screen.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/connect_farm_farmer_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/screen_gavernorate.dart';
import 'package:flutter/material.dart';

import 'bash_board_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return constraint.maxWidth > 900
              ? DashBoardScreen()
              : Scaffold(
                  appBar: constraint.maxWidth < 900
                      ? AppBar(
                          elevation: 0,
                          title: const Text("مرحبا بك",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          leading: Container(
                              margin: const EdgeInsets.only(top: 0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              )),
                          backgroundColor: Colors.transparent)
                      : null,
                  backgroundColor: Colors.transparent,
                  key: scaffoldKey,
                  drawer: MainDrawer(index: 1),
                  body: SingleChildScrollView(
                    child: SizedBox(
                      height: 1894,
                      child: Column(
                        children: [
                          //Container(height: 100, child: ComputerDrawer(index:1))
                          SafeArea(
                              child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              width: 600,
                              color: const Color(0xFF357515),
                              child: Card(
                                elevation: 20,
                                color: Colors.transparent,
                                borderOnForeground: false,
                                child: Column(
                                  children: [
                                    /*Stack(
                                alignment: AlignmentDirectional.topStart,
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.only(bottomRight: Radius.circular(100)),
                                      color: Color(0xff9c6644),
                                    ),
                                  ),
                                  
                                 
                                ],
                              ),*/
                                    SizedBox(
                                      height: 200,
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: FloatingActionButton(
                                                mini: true,
                                                heroTag: 'farmer',
                                                backgroundColor: Colors.white,
                                                onPressed: () {},
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/farmer.png'),
                                                    const Text(
                                                      "عدد المربين الافراد",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff9c6644),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      6578654.toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff9c6644),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            child: FloatingActionButton(
                                                heroTag: 'farm',
                                                backgroundColor: Colors.white,
                                                onPressed: () {},
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/field.png'),
                                                    const Text(
                                                      "عدد المزارع\n",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff9c6644),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      6578654.toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff9c6644),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: FloatingActionButton(
                                                heroTag: 'cows',
                                                backgroundColor: Colors.white,
                                                onPressed: () {},
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/cow_head.png"),
                                                    const Text(
                                                      "عدد رؤس الماشية ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff9c6644),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      6578654.toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff9c6644),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          /*Expanded(
                                              
                                      child: FloatingActionButton(heroTag: 'statistics1',
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
                                              const Text(
                                                "الاحصائيات",
                                                style: TextStyle(
                                                    color: Color(0xff9c6644),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                    ),*/
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const UpdateAnimal(),
                                                    ));
                                              }),
                                              child: Card(
                                                color: const Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/add_animal.png'),
                                                        const Text(
                                                          "اضافة حيوان",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffa58363),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 100),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FarmerScreen(),
                                                    ));
                                              },
                                              child: Card(
                                                color: const Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/add_farmer.png'),
                                                        const Text(
                                                          "اضافه مربي",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffa58363),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const FarmScreen(),
                                                    ));
                                              }),
                                              child: Card(
                                                color: const Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/add_field.png'),
                                                        const Text(
                                                          "اضافة مزرعة",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffa58363),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                            AddLocationScreen(),
                                                    ));
                                              }),
                                              child: Card(
                                                color: const Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/location-pin.png'),
                                                        const Text(
                                                          "اضافة مكان",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffa58363),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AddAdmin(),
                                                    ));
                                              }),
                                              child: const Card(
                                                color: Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.person,
                                                            size: 80,
                                                            color:
                                                                Colors.brown),
                                                        Text("تسجيل المدرين"),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LogIN(),
                                                    ));
                                              }),
                                              child: const Card(
                                                color: Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.person,
                                                            size: 80,
                                                            color:
                                                                Colors.brown),
                                                        Text(
                                                          "تسجيل الدخول",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffa58363),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        /*Expanded(
                                    child: Container(margin: const EdgeInsets.only(  right: 100),
                                      child: GestureDetector(onTap: (() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>    ConnectSuppliersFarmer(),
                                  ));
                            }),
                                        child: Card(
                                          color: const Color(0xfffc5c4be),
                                          elevation: 10,
                                          child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                   const Icon( Icons.person,size:80,color:Colors.brown),
                                                  const Text("ربط المزرعة بالموردين"),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 100, left: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ConnectFarmAndFarmerScreen(),
                                                    ));
                                              }),
                                              child: const Card(
                                                color: Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.person,
                                                            size: 80,
                                                            color:
                                                                Colors.brown),
                                                        Text(
                                                            "ربط المزرعة بالمربين"),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 100, right: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                            ChangePasswordScreen(),
                                                    ));
                                              }),
                                              child: const Card(
                                                color: Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.person,
                                                            size: 80,
                                                            color:
                                                                Colors.brown),
                                                        Text(
                                                            "تغير كلمة المرور"),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /*Expanded(
                                    child: Container(margin: const EdgeInsets.only(left:100),
                                      child: GestureDetector( onTap: (() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddSupplierScreen(),
                                  ));
                            }),
                                        child: Card(
                                          color: const Color(0xfffc5c4be),
                                          elevation: 10,
                                          child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                   const Icon( Icons.person,size:80,color:Colors.brown),
                                                  const Text("اضاغة موردين",style: TextStyle(
                                                        color: Color(0xffa58363),
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold),),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 100, right: 100),
                                            child: GestureDetector(
                                              onTap: (() {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ConnectAnimalFarm(),
                                                    ));
                                              }),
                                              child: const Card(
                                                color: Color(0xfffc5c4be),
                                                elevation: 10,
                                                child: SizedBox(
                                                    width: 150,
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.person,
                                                            size: 80,
                                                            color:
                                                                Colors.brown),
                                                        Text(
                                                            "اضافة حيوانات للمزرعة"),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /*Expanded(
                                    child: Container(margin: const EdgeInsets.only( left:100),
                                      child: GestureDetector( onTap: (() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListFarmer(),
                                  ));
                            }),
                                        child: Card(
                                          color: const Color(0xfffc5c4be),
                                          elevation: 10,
                                          child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                   const Icon( Icons.person,size:80,color:Colors.brown),
                                                  const Text("عرض المربين",style: TextStyle(
                                                        color: Color(0xffa58363),
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold),),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                      ],
                                    ),
                                    /*Row(
                                children: [
                                  Expanded(
                                    child: Container(margin: const EdgeInsets.only(right: 100),
                                      child: GestureDetector(onTap: (() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  const ScreenConnectFarmWorkers(),
                                  ));
                            }),
                                        child: Card(
                                          color: const Color(0xfffc5c4be),
                                          elevation: 10,
                                          child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                   const Icon( Icons.person,size:80,color:Colors.brown),
                                                  const Text("ربط العمال بالمزرعة"),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                   Expanded(
                                    child: Container(margin: const EdgeInsets.only(left:100),
                                      child: GestureDetector( onTap: (() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddWorkerScreen(),
                                  ));
                            }),
                                        child: Card(
                                          color: const Color(0xfffc5c4be),
                                          elevation: 10,
                                          child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                   const Icon( Icons.person,size:80,color:Colors.brown),
                                                  const Text("اضافة عمال",style: TextStyle(
                                                        color: Color(0xffa58363),
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold),),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),*/
                                  ],
                                ),
                              ),
                            ),
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
