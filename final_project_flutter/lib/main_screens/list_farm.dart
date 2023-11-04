// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/color_plette.dart';
import 'package:final_project_year/common_component/show_load_screen.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';
import 'package:flutter/material.dart';

import '../common_component/custome_search_field.dart';
import '../common_component/main_drower.dart';
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
         Api.search_farm_api(
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
    /*Api.search_farm_api(farmerName: null, url: widget.url).then((value) {
      if (value is (List<Map<String, dynamic>>, dynamic)) {
        widget.l1 = value.$1;
        widget.url = value.$2;
        setState(() {});
      }
    });*/
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
                    'عرض  المزارع',
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
                    sliver: SliverFixedExtentList.builder(
                      itemExtent: 100,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .stretch, //,runAlignment: WrapAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomeSearch(
                                  controller: controller,
                                  width: 5000,
                                  text: 'ادخل اسم المربي'),
                            ),
                          ],
                        );
                      },
                      itemCount: 1,
                    ),
                  ),
                  SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 300,
                        maxCrossAxisExtent: 300,
                        //mainAxisSpacing: 5,
                        //childAspectRatio: 5,
                        crossAxisSpacing: 150),
                    itemBuilder: (context2, index) {
                      if (index < widget.l1.length) {
                        return FarmItem(color: CustomeColor.colorListItem[index%CustomeColor.colorListItem.length],
                          context2: context,
                          city: widget.l1[index]["city"],
                          farmName: widget.l1[index]["farm_name"],
                          governorate: widget.l1[index]["governorate"],
                          id: widget.l1[index]["id"],
                          sectionType: widget.l1[index]["section_type"],
                          village: widget.l1[index]["village"],
                          workers: widget.l1[index]["workers"],
                        );
                      } else if (widget.url is String) {
                        Api.search_farm_api(
                                farmerName: controller.text, url: widget.url)
                            .then((value) {
                          if (value is (List<Map<String, dynamic>>, dynamic)) {
                            widget.l1 += value.$1;
                            widget.url = value.$2;
                            setState(() {});
                          }
                        });
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
                                      Text(s, style: TextStyle(fontSize: 20)),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      }
                      if (widget.url != null)
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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

class FarmItem extends StatelessWidget {
  String farmName, village, city, governorate, sectionType, id;
  BuildContext context2;
  int workers;
  Color color;
  FarmItem({
    Key? key,
    required this.farmName,required this.color,
    required this.village,
    required this.context2,
    required this.city,
    required this.governorate,
    required this.sectionType,
    required this.id,
    required this.workers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
             Navigator.push(context , MaterialPageRoute(
              builder: (context) {
                return FarmInfoScreen(
                  farmId: id,
                );
              },
            ));
          },
          child: Card(
            color: color ,
            elevation: 5,
            surfaceTintColor: Colors.brown.shade700, // const Color(0xFF467061),
            child: Column( 
              children: [
                Wrap(
                  children: [
                    const Text(
                      'كود المزرعة' ":",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      id.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  children: [
                    const Text(
                      'اسم المزرعة' ":",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(farmName,
                        style: const TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(//clipBehavior: Clip.hardEdge  ,
                //runAlignment: WrapAlignment.spaceAround,alignment: WrapAlignment.spaceBetween,
                verticalDirection: VerticalDirection.down,textDirection: TextDirection.rtl,
                  children: [
                    const Text(
                     " الموقع: ",
                     style: TextStyle(fontSize: 20, color: Colors.white),
                                      ),
                    Text(
                      "$village->",  overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "$city->",  overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      governorate,  overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  children: [
                    const Text(
                      'عدد العمال' ":",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      workers.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  children: [
                    const Text(
                      'نوع القطاع: ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      sectionType.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
