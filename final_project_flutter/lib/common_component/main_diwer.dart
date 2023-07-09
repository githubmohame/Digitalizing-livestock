// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_year/main_screens/list_farm.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/main_screens/add_admin_screen.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/connect_animal_farm_screen.dart';
import 'package:final_project_year/main_screens/connect_farm_farmer_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/screen_gavernorate.dart';

class MainDrawer extends StatelessWidget {
  int index;
  MainDrawer({
    Key? key,
    required this.index,
  }) : super(key: key);
  //>
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF003e29),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 100,
            color: index == 0 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              leading: Image.asset('assets/images/field.png'),
              title: const Text("اضافة مزرعة",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FarmScreen(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          //
          Container(
            color: index == 1 ? Colors.grey : const Color(0xFF003e29),
            height: 100,
            child: Center(
              child: ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.home, size: 35, color: Colors.white),
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: const Text("صفحة الترحيب",
                    style: TextStyle(color: Colors.white)),
                onTap: (() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBoardScreen(),
                      ));
                }),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 2 ? Colors.grey : const Color(0xFF003e29),
            child: Center(
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 1,
                  leading: Image.asset('assets/images/farmer.png',
                      height: 100, width: 50),
                  title: const Text("اضافة مربي",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FarmerScreen(),
                        ));
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 3 ? Colors.grey : const Color(0xFF003e29),
            child: Center(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 1,
                leading: Image.asset('assets/images/network.png'),
                title: const Text("ربط المزرعة اضافة بالمربين",
                    style: TextStyle(color: Colors.white)),
                onTap: (() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConnectFarmAndFarmerScreen(),
                      ));
                }),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 4 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.person, size: 50, color: Colors.grey),
              title: const Text("تسجيل الدخول",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIN(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 5 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Image(image: AssetImage('assets/images/list.png')),
              title: const Text("عرض المربين",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListFarmer(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 6 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.location_on),
              title: const Text("اضافة او تعديل مكان",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddLocationScreen(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 7 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.pets),
              title: const Text("اضافة او تعديل حيوان",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateAnimal(),
                    ));
              }),
            ),
          ),
          /*Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 8 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Image(
                  image: AssetImage('assets/images/drawer_statistics.png')),
              title: const Text("االاحصائيات",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartScreen(),
                    ));
              }),
            ),
          ),*/
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 10 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.password),
              title: const Text('تسجيل كلمة المرور',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(),
                    ));
              }),
            ),
          ),
          /*
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 11 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة عمال',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Worker_Screen(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 12 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة مواردين',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Supplier(),
                    ));
              }),
            ),
          ),*/
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 13 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة حيوانات للمزرعة',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConnectAnimalFarm(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 13 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة   مودرين',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAdmin(),
                    ));
              }),
            ),
          ),
           Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 13 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('عرض المزارع',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmList(),
                    ));
              }),
            ),
          ),
          /*
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 14 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('ربط المزرعة بالعمال',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenConnectFarmWorkers(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: index == 15 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('ربط المزرعة بالموردين',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConnectSuppliersFarmer(),
                    ));
              }),
            ),
          ),*/
        ],
      ),
    );
  }
}

//
class ComputerDrawer extends StatelessWidget {
  int index;
  ComputerDrawer({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF003e29),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 0 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              leading: Image.asset('assets/images/field.png'),
              title: const Text("اضافة مزرعة",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FarmScreen(),
                    ));
              }),
            ),
          ),
          Container(height: 1, color: Colors.black, width: 1),
          Container(
            width: 400,
            color: index == 1 ? Colors.grey : const Color(0xFF003e29),
            height: 10,
            child: Center(
              child: ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.home, size: 35, color: Colors.white),
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: const Text("صفحة الترحيب",
                    style: TextStyle(color: Colors.white)),
                onTap: (() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBoardScreen(),
                      ));
                }),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 2 ? Colors.grey : const Color(0xFF003e29),
            child: Center(
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 1,
                  leading: Image.asset('assets/images/farmer.png',
                      height: 100, width: 50),
                  title: const Text("اضافة مربي",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FarmerScreen(),
                        ));
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 3 ? Colors.grey : const Color(0xFF003e29),
            child: Center(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 1,
                leading: Image.asset('assets/images/network.png'),
                title: const Text("ربط المزرعة اضافة بالمربين",
                    style: TextStyle(color: Colors.white)),
                onTap: (() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConnectFarmAndFarmerScreen(),
                      ));
                }),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 4 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.person, size: 50, color: Colors.grey),
              title: const Text("تسجيل الدخول",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIN(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 5 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Image(image: AssetImage('assets/images/list.png')),
              title: const Text("عرض المربين",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListFarmer(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 6 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.location_on),
              title: const Text("اضافة او تعديل مكان",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddLocationScreen(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 7 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.pets),
              title: const Text("اضافة او تعديل حيوان",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateAnimal(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          /*
          Container(
            width: 400,
            height: 10,
            color: index == 8 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Image(
                  image: AssetImage('assets/images/drawer_statistics.png')),
              title: const Text("االاحصائيات",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartScreen(),
                    ));
              }),
            ),
          ),*/
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 10 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              leading: const Icon(Icons.password),
              title: const Text('تسجيل كلمة المرور',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(),
                    ));
              }),
            ),
          ),
          /* Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 11 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة عمال',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Worker_Screen(),
                    ));
              }),
            ),
          ),*/
          /*Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 12 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة مواردين',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAdmin(),
                    ));
              }),
            ),
          ),*/
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 13 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة حيوانات للمزرعة',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConnectAnimalFarm(),
                    ));
              }),
            ),
          ),
          /*Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 14 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('ربط المزرعة بالعمال',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenConnectFarmWorkers(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 15 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('ربط المزرعة بالموردين',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConnectSuppliersFarmer(),
                    ));
              }),
            ),
          ),*/
          //AddAdmin
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 10,
            color: index == 14 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('اضافة مودرين',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAdmin(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
            width: 1,
          ),
          Container(
            width: 400,
            height: 30,
            color: index == 15 ? Colors.grey : const Color(0xFF003e29),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 1,
              title: const Text('عرض المزارع',
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmList(),
                    ));
              }),
            ),
          ),
          //

        ],
      ),
    );
  }
}

class CustomeDrawerView2 extends StatefulWidget {
  const CustomeDrawerView2({super.key});

  @override
  State<CustomeDrawerView2> createState() => _CustomeDrawerView2State();
}

class _CustomeDrawerView2State extends State<CustomeDrawerView2> {
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ListFarmer();
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
                    Navigator.pushReplacement(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ListFarmer();
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

abstract class A {
  int u;
  A({
    required this.u,
  });

  int sq({int u=90});
}

class B extends A {
  int u;

  B({required super.u, required int m}) : u = m;
  
  @override
  int sq({int sq1=90,u=89}) {
    // TODO: implement sq
    throw UnimplementedError();
  }
}
