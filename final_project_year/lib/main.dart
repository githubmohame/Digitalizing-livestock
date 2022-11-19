import 'package:final_project_year/main_screens/add_worker_screen.dart';
import 'package:final_project_year/main_screens/chart_screen.dart';
import 'package:final_project_year/main_screens/connect_farm_and_farmer.dart';
import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/home.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/add_animal.dart';
import 'package:final_project_year/main_screens/screen_location/screen_gavernorate.dart';
import 'package:flutter/material.dart';

import 'main_screens/farm_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: ChartScreen(),
    );
  }
}
