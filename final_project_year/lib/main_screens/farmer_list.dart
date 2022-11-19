import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  String name;
  ItemList({
    Key? key,
    required this.name,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Color(0x0FFFb0b348),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Color(0x0FFFb0b348),
              borderRadius: BorderRadius.circular(30)),
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
                  Text('الاسم:' + 'محمد ايمن',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ],
              ),
              Expanded(child: SizedBox()),
              TextButton(
                child: Text(
                  'عرض المعلومات',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Farmer(city: 'مصر',country: 'مصر' ,village:  'مصر',
                              edit: false,
                              name: "محمد ايمن محمد سليمان",
                              phone: '0909888',
                              ssn: '755677889654')));
                },
              )
            ],
          )),
    );
  }
}

class ListFarmer extends StatelessWidget {
  const ListFarmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            drawer: MainDrawer(index: 5),
            appBar: AppBar(
              title: Center(
                child: Text('عرض المربين'),
              ),
              backgroundColor: Colors.green,
            ),
            backgroundColor: Color(0xFF848478),
            body: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ItemList(
                    name: "محمد ايمن",
                  );
                })));
  }
}
