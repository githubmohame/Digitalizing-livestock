import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/color_plette.dart';
import 'package:final_project_year/common_component/custome_search_field.dart';
import 'package:final_project_year/common_component/show_load_screen.dart';
import 'package:final_project_year/main_screens/farmer_list.dart';
import 'package:final_project_year/main_screens/list_farm.dart';
import 'package:flutter/material.dart';

class ShowFarmerInfo extends StatefulWidget {
  ShowFarmerInfo({super.key, required this.ssn});
  TextEditingController controller = TextEditingController();
  String ssn;
  List l1 = [];
  String? url = "";
  @override
  State<ShowFarmerInfo> createState() => _ShowFarmerInfoState();
}

class _ShowFarmerInfoState extends State<ShowFarmerInfo> {
  @override
  void initState() {
    // TODO: implement initState
    widget.controller.addListener(
      () {
         Api.search_farm_api(ssn: widget.ssn,
                farmerName: widget.controller.text.isEmpty
                    ? null
                    : widget.controller.text,
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: CustomScrollView(slivers: [
            SliverFixedExtentList.list(itemExtent: 200, children: [
              FarmerItem(color:CustomeColor.colorListItem[ 0] ,
                isNavigation: false,
                farm_count: 123,
                name: "uuuuyyy",
                phone: "01024215977",
                ssn: "30109061201153",
              )
            ]),
            SliverPadding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50),
              sliver: SliverFixedExtentList.list(itemExtent: 50, children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomeSearch(
                          controller: widget.controller,
                          width: null,
                          text: 'ادخل اسم المربي'),
                    ),
                  ],
                )
              ]),
            ),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 300,
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0),
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
                  Api.search_farm_api(ssn: widget.ssn,
                          farmerName: widget.controller.text, url: widget.url)
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
                  if (widget.l1.isEmpty && widget.controller.text.isEmpty) {
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
              itemCount: widget.l1.length + 1,
            ),
          ]),
        ),
      ),
    );
  }
}
/*

ItemList

*/