// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/show_load_screen.dart';
import 'package:flutter/material.dart';

import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';

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
    return Card(
      borderOnForeground: true,
      color: const Color(0xFF467061),
      child: Card(
          elevation: 10,
          surfaceTintColor: const Color(0xFF467061),
          child: Row(
            children: [
              FutureBuilder(
                  future: Api.image_farmer_api(ssn: ssn),
                  builder: (context, snap) {
                    if (snap.data is ImageProvider<Object>) {
                      return CircleAvatar(
                        minRadius: 30,
                        backgroundImage: snap.data,
                      );
                    }
                    return Container();
                  }),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('الاسم:$name',
                      style: const TextStyle(color: Colors.black, fontSize: 15)),
                  Text(
                    'عدد المزارع:$farm_count',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('رقم التليقون:$phone')
                ],
              ),
            ],
          )),
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
    Api.search_farmer_api(farmerName: null, url: widget.url).then((value) {
      if (value is (List<Map<String, dynamic>>, dynamic)) {
        widget.l1 = value.$1;
        widget.url = value.$2;
        setState(() {});
      }
    });
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
              body: LayoutBuilder(builder: (context, constraint) {
                return Row(children: [
                  constraint.maxWidth >= 1000 ? const Spacer() : Container(),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: 400,
                      color: const Color(0xFF357515),
                      child: Card(
                        color: const Color(0xFF357515),
                        elevation: 20,
                        child: Column(
                          children: [
                            CustomeSearch(
                                controller: controller,
                                width: double.infinity,
                                text: 'ادخل اسم المربي'),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: widget.l1.length + 1,
                                  itemBuilder: (context, index) {
                                    // print(index.toString() +"   hhhhh  "+ widget.l1.length.toString());
                                    if (index < widget.l1.length) {
                                      print(index);
                                      print(widget.l1);
                                      return ItemList(
                                        ssn: widget.l1[index]["ssn"],
                                        farm_count: widget.l1[index]
                                            ["farm_count"],
                                        phone: widget.l1[index]["phone"],
                                        name: widget.l1[index]["name"],
                                      );
                                    } else if (widget.url is String) {
                                      Api.search_farmer_api(
                                              farmerName: controller.text,
                                              url: widget.url)
                                          .then((value) {
                                        if (value is (
                                          List<Map<String, dynamic>>,
                                          dynamic
                                        )) {
                                          widget.l1 += value.$1;
                                          widget.url = value.$2;
                                          setState(() {});
                                        }
                                      });
                                      return const LoadingScreen();
                                    }
                                    if (widget.l1.isEmpty) {
                                      return const Card(
                                        child: SizedBox(
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("هذا العميل غير موجود",
                                                        style: TextStyle(
                                                            fontSize: 20)),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      );
                                    }
                                    return Container();
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  constraint.maxWidth >= 1000 ? const Spacer() : Container(),
                ]);
              })),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
