import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectFarmAndFarmerScreen extends StatelessWidget {
  ConnectFarmAndFarmerScreen({Key? key}) : super(key: key);
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return   LayoutBuilder(
      builder: (context,constraint) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: BackgroundScreen(
             
              child: Scaffold(
                backgroundColor: Colors.transparent,
                drawer: MainDrawer(index: 3),
                appBar: constraint.maxWidth<900? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text("ربط المزرعة بالمربين",style: TextStyle(color: Colors.white),)):null,
                body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:3)):Container(),
                    Spacer(),
                    Card(color: Color(0xFF357515

),elevation: 20,
                      child: Container(height: 400,
                        margin: EdgeInsets.all(20),
                        width: 600,
  
                        child: Form(
                            child: Column(
                          children: [
                            Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.transparent,
                                      )),
                                      margin: const EdgeInsets.all(10),
                                      child: Text("ربط المزرعة بالمربين",style: TextStyle(fontSize: 30,color: Colors.grey.shade900),
                                      ),
                                    ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    hintText: "السجل التجاري"),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    hintText: 'اسم المزرعة'),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: list[3],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    hintText: "التكلفة الكلية"),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(),
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: list[0],
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    hintText: "الرقم القومي للمربي"),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Wrap( 
                        children: [
                          
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith((states) =>
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green)),
                            onPressed: () {
                              
                            },
                            child: const Text(
                              "حفظ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ) ,Container(width: 20,height: 20,),
                           OutlinedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red)),
                        onPressed: () {
                        },
                        child: const Text(
                          "حذف",
                          style: TextStyle(color: Colors.white),
                        ),
                      ), 
                        ],
                      ),
                         
                          ],
                        )),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          );
      }
    );
  }
}
