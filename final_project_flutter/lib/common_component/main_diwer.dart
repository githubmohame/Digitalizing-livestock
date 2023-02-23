import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/chart_screen.dart';
import 'package:final_project_year/main_screens/connect_farm_farmer_screen.dart';
import 'package:final_project_year/main_screens/connect_suppliers_farm.dart';
import 'package:final_project_year/main_screens/connect_workers_farm.dart';
import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/supplier_screeen.dart';
import 'package:final_project_year/main_screens/workers_screen.dart';
import 'package:final_project_year/screen_location/screen_gavernorate.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/main_screens/connect_animal_farm_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/home.dart';

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
                        builder: (context) => const HomeScreen(),
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
                          builder: (context) => Farmer(),
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
                      builder: (context) => LogIN(),
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
                      builder: (context) => const ListFarmer(),
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
                      builder: (context) => UpdateLocation(),
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
                      builder: (context) => UpdateAnimal(),
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
          ),/*
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
          ),/*
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
                        builder: (context) => const HomeScreen(),
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
                          builder: (context) => Farmer(),
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
                      builder: (context) => LogIN(),
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
                      builder: (context) => const ListFarmer(),
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
                      builder: (context) => UpdateLocation(),
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
                      builder: (context) => UpdateAnimal(),
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
          ),
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
          Container(
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
          ),
          Container(
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
                      builder: (context) => Supplier(),
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
          ),
        ],
      ),
    );
  }
}
