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
  String phone;
  ItemList({
    Key? key,
    required this.name,
    required this.farm_count,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Color(0xFF467061),
      child: Card(
          elevation: 10,
          surfaceTintColor: Color(0xFF467061),
          child: Row(
            children: [
              CircleAvatar(
                minRadius: 30,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1664575602554-2087b04935a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('الاسم:' 'محمد ايمن',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  Text(
                    'عدد المزارع:${farm_count}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('رقم التليقون:${phone}')
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
  State<ListFarmer> createState() => _ListFarmerState();
}

class _ListFarmerState extends State<ListFarmer> {
  @override
  void initState() {
    search_farm_api(farmerName: null).then((value) {
      widget.l1 = value.$1;
      widget.url = value.$2;
      setState(() {});
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
                                width: double.infinity,
                                text: 'ادخل اسم المربي'),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: widget.l1.length + 1,
                                  itemBuilder: (context, index) {
                                    // print(index.toString() +"   hhhhh  "+ widget.l1.length.toString());
                                    if (index < widget.l1.length) {
                                      return ItemList(
                                        farm_count: widget.l1[index]
                                            ["farm_count"],
                                        phone: widget.l1[index]["phone"],
                                        name: widget.l1[index]["name"],
                                      );
                                    } else if (widget.url is String) {
                                      search_farm_api(farmerName: null)
                                          .then((value) {
                                        widget.l1 = value.$1;
                                        widget.url = value.$2;
                                        setState(() {});
                                      });
                                      return const LoadingScreen();
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
}
