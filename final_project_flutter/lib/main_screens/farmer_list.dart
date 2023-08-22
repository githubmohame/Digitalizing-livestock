// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/show_load_screen.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';

import '../common_component/custome_search_field.dart';

class ItemList extends StatelessWidget {
  String name;
  int farm_count;
  String ssn;
  String phone;
  ItemList({
    Key? key,
    required this.name,
    required this.ssn,
    required this.farm_count,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 40,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(120))),
      child: Material(
        borderOnForeground: true,
        color: Color(0xfff0ba94),
        child: //Container(height: 100,width: 100,color: Colors.amber,)

            Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: Api.image_farmer_api(ssn: ssn),
                    builder: (context, snap) {
                      if (snap.data is ImageProvider<Object>) {
                        return CircleAvatar(
                          minRadius: 60,
                          backgroundImage: snap.data,
                        );
                      }
                      return Container();
                    }),
              ],
            ),
            Text('الاسم:$name',
                style: const TextStyle(color: Colors.black, fontSize: 15)),
            Text(
              'عدد المزارع:$farm_count',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('رقم التليقون:$phone')
          ],
        ),
      ),
    );
  }
}

class ListFarmer extends StatefulWidget {
  ListFarmer({Key? key}) : super(key: key);
  List<Map<String, dynamic>> l1 = [];
  String? url = "";

  @override
  State<ListFarmer> createState() {
    print("kiiiiii");
    return _ListFarmerState();
  }
}

class _ListFarmerState extends State<ListFarmer> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    print("hhhyy");

    controller.addListener(
      () {
        print("it listener is already");
        Api.search_farmer_api(
                farmerName: controller.text.isEmpty ? null : controller.text,
                url: '')
            .then((value) {
          if (value is (List<Map<String, dynamic>>, dynamic)) {
            widget.l1 = value.$1;
            widget.url = value.$2;
            setState(() {});
          }
        });
      },
    );
    /*Api.search_farmer_api(farmerName: null, url: widget.url).then((value) {
      if (value is (List<Map<String, dynamic>>, dynamic)) {
        widget.l1 = value.$1;
        widget.url = value.$2;
        print("&" * 778);
        print(widget.l1);
        print(widget.url);
        setState(() {});
      }
    });*/
    /*Timer.periodic(Duration(seconds: 3), (timer) {
      print("0"*1234);
      setState(() {});
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: BackgroundScreen(
          child: Scaffold(
              drawer: MainDrawer(index: 5),
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    'عرض المربين',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 50),
                    sliver: SliverFixedExtentList(
                      delegate: SliverChildListDelegate.fixed([
                        Wrap(
                         // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomeSearch(
                                controller: controller,
                                width: null,
                                text: 'ادخل اسم المربي'),
                          ],
                        ),
                      ], semanticIndexOffset: 0),
                      itemExtent: 60,
                    ),
                  ),
                  SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 300,
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1,
                        crossAxisSpacing: 0),
                    itemBuilder: (context, index) {
                      print(widget.l1.length);
                      if (index < widget.l1.length) {
                        return ItemList(
                          ssn: widget.l1[index]["ssn"],
                          farm_count: widget.l1[index]["farm_count"],
                          phone: widget.l1[index]["phone"],
                          name: widget.l1[index]["name"],
                        );
                      } else if (widget.url is String) {
                        Api.search_farmer_api(
                                farmerName: controller.text, url: widget.url).then((value) {
                          if (value is (List<Map<String, dynamic>>, dynamic)) {
                            widget.l1 += value.$1;
                            widget.url = value.$2;
                            print('object' * 123);
                            setState(() {});
                          }
                        });
                       // return const LoadingScreen();
                      }
                      /*if (widget.l1.isEmpty) {
                        return const Card(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("هذا العميل غير موجود",
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      }*/
                      return Container();
                    },
                    itemCount: widget.l1.length + 1,
                  ),
                   SliverFixedExtentList.builder(
                    itemBuilder: (context, index) {
                      if (widget.l1.isEmpty) {
                        print('the done');
                        String s = "هذه المزرعة غير موجود";
                        if (widget.l1.isEmpty && controller.text.isEmpty) {
                          s = "لا يوجد مزارع مسجلة";
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Card(
                              child: SizedBox(
                                  //width: 200,
                                 // height: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.center ,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(s,
                                              style: TextStyle(fontSize: 20)),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      }
                      if (widget.url != null)
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 500,
                            ),
                            SizedBox(width: 50, child: const LoadingScreen()),
                            Spacer(),
                          ],
                        );
                    },
                    itemExtent: 200,
                    itemCount: 1,
                  ),
                ],
              )

              ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
