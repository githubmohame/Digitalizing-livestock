// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:final_project_year/common_component/background.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackgroundScreen(
            child: LayoutBuilder(builder: (context, constraint) {
          return ListView(children: [
            Container(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Spacer(),
                                    CustomeSearch(width: constraint.maxWidth / 2,text:  'ادخل اسم المزارع او المزرعة'),

                  Spacer(),
                ],
              ),
            ),
            Row(
              children: [Spacer(),
                Material(
                  elevation: 50,
                  color: Color(0xFF467061),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(height: 400,
                      
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column( 
                      children: [
                        
 
Wrap(alignment: WrapAlignment.spaceEvenly,crossAxisAlignment: WrapCrossAlignment.center,spacing: constraint.maxWidth/20,runSpacing: constraint.maxWidth/20,
   children: [
    Container(width: constraint.maxWidth/5,
      child: Card(
          color: Colors.white,
          child: Column(
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
    ),
     Container(width: constraint.maxWidth/5,
       child: Card(
         
          child: Column(
                crossAxisAlignment:
                  CrossAxisAlignment.center,
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
     ),
     Container(width: constraint.maxWidth/5,
       child: Card(
         
          child: Column(
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
     ) 
  ],
),


Wrap(alignment: WrapAlignment.spaceEvenly,crossAxisAlignment: WrapCrossAlignment.start,spacing: constraint.maxWidth/20,runSpacing: constraint.maxWidth/20,
   children: [ 
    Container(width: constraint.maxWidth/5,
      child: Card(
          color: Colors.white,
          child: Column(
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
    ),
     Container(width: constraint.maxWidth/5,
       child: Card(
         
          child: Column(
                crossAxisAlignment:
                  CrossAxisAlignment.center,
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
     ),
     Container(width: constraint.maxWidth/5,
       child: Card(
         
          child: Column(
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
     ) 
  ],
),Wrap(alignment: WrapAlignment.spaceEvenly,crossAxisAlignment: WrapCrossAlignment.start,spacing: constraint.maxWidth/20,runSpacing: constraint.maxWidth/20,runAlignment: WrapAlignment.spaceAround,
                           children: [ 
                            Container(width: constraint.maxWidth/5,
                              child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/farmer.png'),
                                      const Text(
                                        "عدد المربين الافراد",
                                        style: TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        6578654.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ),
                             Container(width: constraint.maxWidth/5,
                               child: Card(
                                 
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/farmer.png'),
                                      const Text(
                                        "عدد المربين الافراد",
                                        style: TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        6578654.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                             ),
                             Container(width: constraint.maxWidth/5,
                               child: Card(
                                 
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/farmer.png'),
                                      const Text(
                                        "عدد المربين الافراد",
                                        style: TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        6578654.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                             ) 
                          ],
                        ),

 
                        Spacer(),
                      ],
                    ),
                  ),
                ),Spacer(),
              ],
            ),
            Container(height: 50,),
            Row(
              children: [Spacer(),
                Material(
                  elevation: 50,
                  color: Color(0xFF467061),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(height: 300,
                      
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column( 
                      children: [
                        
Wrap(alignment: WrapAlignment.spaceEvenly,crossAxisAlignment: WrapCrossAlignment.start,spacing: constraint.maxWidth/20,runSpacing: constraint.maxWidth/20,
   children: [ 
    Container(width: constraint.maxWidth/5,
      child: Card(
          color: Colors.white,
          child: Column(
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
    ),
     Container(width: constraint.maxWidth/5,
       child: Card(
         
          child: Column(
                crossAxisAlignment:
                  CrossAxisAlignment.center,
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
     ),
     Container(width: constraint.maxWidth/5,
       child: Card(
         
          child: Column(
                mainAxisAlignment:
                  MainAxisAlignment.center,
                children: [
                Image.asset(
                    'assets/images/farmer.png'),
                const Text(
                  "عدد المربين الافراد",
                  style: TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  6578654.toString(),
                  style: const TextStyle(
                      color: Color(0xff9c6644),
                      fontWeight: FontWeight.bold),
                ),
                ],
          )),
     ) 
  ],
),Wrap(alignment: WrapAlignment.spaceEvenly,crossAxisAlignment: WrapCrossAlignment.start,spacing: constraint.maxWidth/20,runSpacing: constraint.maxWidth/20,runAlignment: WrapAlignment.spaceAround,
                           children: [ 
                            Container(width: constraint.maxWidth/5,
                              child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/farmer.png'),
                                      const Text(
                                        "عدد المربين الافراد",
                                        style: TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        6578654.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ),
                             Container(width: constraint.maxWidth/5,
                               child: Card(
                                 
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/farmer.png'),
                                      const Text(
                                        "عدد المربين الافراد",
                                        style: TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        6578654.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                             ),
                             Container(width: constraint.maxWidth/5,
                               child: Card(
                                 
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/farmer.png'),
                                      const Text(
                                        "عدد المربين الافراد",
                                        style: TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        6578654.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff9c6644),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                             ) 
                          ],
                        ),

 
                        Spacer(),
                      ],
                    ),
                  ),
                ),Spacer(),
              ],
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 500,
                width: 600,
                child: Wrap(alignment: WrapAlignment.spaceBetween,crossAxisAlignment: WrapCrossAlignment.start,spacing: constraint.maxWidth/20,runSpacing: constraint.maxWidth/20,
                  children: [
 
                    Container(height: 500,margin: EdgeInsets.only(left:120,right: 120,top: 30),
                      child: Card(
                        elevation: 50,
                        color: Color(0xFF467061),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          child: Column(
                            children: [
                              CustomeSearch(width: constraint.maxWidth / 2,text:  'ادخل اسم المزارع او المزرعة',),
                              Container(
                                height: 10,
                              ),
                              Expanded(
                                child: FlutterMap(
                                  options: MapOptions(
                                    center: LatLng(51.509364, -0.208928),
                                    zoom: 9.2,
                                  ),
                                  nonRotatedChildren: [
                                    AttributionWidget.defaultWidget(
                                      source: 'OpenStreetMap contributors',
                                      onSourceTapped: null,
                                    ),
                                  ],
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                )),
            Container(
              height: 100,
            )
          ]);
        })),
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
