import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/screen_location/screen_gavernorate.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/main_screens/connect_farm_and_farmer.dart';
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
      backgroundColor: Color(0x0FFFb0b348),
      child: ListView(
         children: [
          Container(
            height: 100 ,color:index==0? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(
              leading: Image.asset('assets/images/field.png'),
              title: Text("اضافة مزرعة", style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmScreen(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          //
          Container(color: index==1? Colors.green:Color(0x0FFFb0b348),
            height: 100 ,
            child: ListTile(horizontalTitleGap: 0,leading: Icon(Icons.home,size: 35,color:Colors.grey ),
            contentPadding:EdgeInsets.zero ,minVerticalPadding: 0,
              title:
                  Text("صفحة الترحيب", style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(height: 100,color:index==2? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(contentPadding:EdgeInsets.zero ,minVerticalPadding: 1,leading: Image.asset('assets/images/farmer.png',height: 50,width:50),
              title: Text("اضافة مربي", style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Farmer(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100 ,color:index==3? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(contentPadding:EdgeInsets.zero ,minVerticalPadding: 1,
              leading: Image.asset('assets/images/network.png'),
              title: Text("ربط المزرعة اضافة بالمربين",
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
          Container(
            height: 1,
            color: Colors.black,
          ),
          Container(
            height: 100 ,color:index==4? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(contentPadding:EdgeInsets.zero ,minVerticalPadding: 1,
              leading: Icon(Icons.person,size: 50,color:Colors.grey),
              title: Text( "تسجيل الدخول",
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
            height: 100 ,color:index==5? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(contentPadding:EdgeInsets.zero ,minVerticalPadding: 1,
              leading:  Image(image: AssetImage('assets/images/list.png')),
              title: Text( "عرض المربين",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ListFarmer(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
           Container(
            height: 100 ,color:index==6? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(contentPadding:EdgeInsets.zero ,minVerticalPadding: 1,
              leading:  Icon(Icons.location_on),
              title: Text(  "اضافة او تعديل مكان",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  UpdateLocation(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
           Container(
            height: 100 ,color:index==7? Colors.green:Color(0x0FFFb0b348) ,
            child: ListTile(contentPadding:EdgeInsets.zero ,minVerticalPadding: 1,
              leading:  Icon(Icons.pets),
              title: Text(  "اضافة او تعديل حيوان",
                  style: TextStyle(color: Colors.white)),
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  UpdateLocation(),
                    ));
              }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

//