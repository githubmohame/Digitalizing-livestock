// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/show_load_screen.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';
import 'package:flutter/material.dart';

import '../common_component/main_diwer.dart';
import 'show_farm_info.dart';

class FarmList extends StatefulWidget {
  FarmList({super.key});
  List<Map<String, dynamic>> l1 = [];
  String? url = "";
  @override
  State<FarmList> createState() => _FarmListState();
}

class _FarmListState extends State<FarmList> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(
      () {
        print("it listener is already");
        search_farm_api(
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
    search_farm_api(farmerName: null, url: widget.url).then((value) {
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
              drawer: MainDrawer(index: 15),
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
                print(constraint.maxWidth);
                return Row(children: [
                  constraint.maxWidth >= 1000 ? const Spacer() : Container(),
                  Expanded(
                    child: Container(
                      width: 400,
                      color: const Color(0xFF357515),
                      child: Card(
                        color: const Color(0xFF357515),
                        elevation: 20,
                        child: Column(
                          children: [
                            CustomeSearch(
                                width: double.infinity,
                                text: 'ادخل اسم المربي',
                                controller: controller),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: widget.l1.length + 1,
                                  itemBuilder: (context, index) {
                                    // print(index.toString() +"   hhhhh  "+ widget.l1.length.toString());
                                    if (index < widget.l1.length) {
                                      print(index);
                                      print(widget.l1);
                                      return FarmItem(
                                        city: widget.l1[index]["city"],
                                        farmName: widget.l1[index]["farm_name"],
                                        governorate: widget.l1[index]
                                            ["governorate"],
                                        id: widget.l1[index]["id"],
                                        sectionType: widget.l1[index]
                                            ["section_type"],
                                        village: widget.l1[index]["village"],
                                        workers: widget.l1[index]["workers"],
                                      );
                                    } else if (widget.url is String) {
                                      search_farm_api(
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

class FarmItem extends StatelessWidget {
  String farmName, village, city, governorate, sectionType, id;

  int workers;
  FarmItem({
    Key? key,
    required this.farmName,
    required this.village,
    required this.city,
    required this.governorate,
    required this.sectionType,
    required this.id,
    required this.workers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return FarmInfoScreen(
              farmId: id,
            );
          },
        ));
      },
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.white, // const Color(0xFF467061),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'كود المزرعة' ":",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  id.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text(
                  'اسم المزرعة' ":",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(farmName,
                    style: const TextStyle(fontSize: 20, color: Colors.red))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(Icons.location_on),
                const Text(
                  " الموقع: ",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Text(
                  "$village-",
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  "$city-",
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  governorate,
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text(
                  'عدد العمال' ":",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  workers.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text(
                  'نوع القطاع: ',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  sectionType.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
