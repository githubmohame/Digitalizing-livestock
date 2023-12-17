// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/color_plette.dart';
import 'package:final_project_year/common_component/show_load_screen.dart';
import 'package:final_project_year/main_screens/show_farmer_info.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_drower.dart';

import '../common_component/custome_search_field.dart';

class FarmerItem extends StatelessWidget {
  String name;
  int farm_count;
  String ssn;
  String phone;
  bool isNavigation;
  Color color;
  FarmerItem({
    super.key,
    required this.name,required this.color,
    required this.isNavigation,
    required this.ssn,
    required this.farm_count,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isNavigation) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowFarmerInfo(ssn: ssn),
              ));
        }
      },
      child: Card(
        elevation: 40,
        margin: const EdgeInsets.all(0),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(120))),
        child: Material(
          borderOnForeground: true,
          color: color,
          child: //Container(height: 100,width: 100,color: Colors.amber,)

              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder(
                      future: Api.image_farmer_api(ssn: ssn),
                      builder: (context, snap) {
                        if (snap.data is ImageProvider<Object>) {
                          return CircleAvatar(
                            minRadius: 40,
                            backgroundImage: snap.data,
                          );
                        }
                        return Container();
                      }),
                ],
              ),
              Wrap(
                children: [
                  const Text('الاسم:',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(name, style: const TextStyle(color: Colors.white, fontSize: 20))
                ],
              ),
              Wrap(
                children: [
                  const Text('عدد المزارع',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(farm_count.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
              Wrap(
                children: [
                  const Text('رقم التليقون:',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(phone, style: const TextStyle(color: Colors.white, fontSize: 20))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListFarmer extends StatefulWidget {
  ListFarmer({super.key});
  List<Map<String, dynamic>> l1 = [];
  String? url = "";

  @override
  State<ListFarmer> createState() {
     return _ListFarmerState();
  }
}

class _ListFarmerState extends State<ListFarmer> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
 
    controller.addListener(
      () {
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
                    padding: const EdgeInsets.only(bottom: 50 ),
                    sliver: SliverFixedExtentList(
                      delegate: SliverChildListDelegate.fixed([
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomeSearch(
                              controller: controller,
                              width: null,
                              text: 'ادخل اسم المربي'),
                        ),
                      ], semanticIndexOffset: 0),
                      itemExtent: 60,
                    ),
                  ),
                  SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 300,
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                       if (index < widget.l1.length) {
                        return FarmerItem(color: CustomeColor.colorListItem[index%CustomeColor.colorListItem.length],
                          isNavigation: true,
                          ssn: widget.l1[index]["ssn"]?? "0",
                          farm_count: widget.l1[index]["farm_count"] ,
                          phone: widget.l1[index]["phone"]??"0",
                          name: widget.l1[index]["name"]??"7777",
                        );
                      } else if (widget.url is String) {
                        Api.search_farmer_api(
                                farmerName: controller.text, url: widget.url)
                            .then((value) {
                          if (value is (List<Map<String, dynamic>>, dynamic)) {
                            widget.l1 += value.$1;
                            widget.url = value.$2;
                             setState(() {});
                          }
                        });
                        // return const LoadingScreen();
                      }

                      return Container();
                    },
                    itemCount: widget.l1.length + 1,
                  ),
                  SliverFixedExtentList.builder(
                    itemBuilder: (context, index) {
                      if (widget.l1.isEmpty) {
                         String s = "هذه المزرعة غير موجود";
                        if (widget.l1.isEmpty && controller.text.isEmpty) {
                          s = "لا يوجد مزارع مسجلة";
                        }
                        return Wrap(
                          alignment: WrapAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              color: Colors.lightGreen,
                              child: SizedBox(
                                  width: 400,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(s, style: const TextStyle(fontSize: 20)),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      }
                      if (widget.url != null) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 500,
                            ),
                            const SizedBox(width: 50, child: LoadingScreen()),
                            const Spacer(),
                          ],
                        );
                      return null;
                      }
                      return null;
                    },
                    itemExtent: 200,
                    itemCount: 1,
                  ),
                ],
              )),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
