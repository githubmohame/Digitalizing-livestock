import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';

class ScreenConnectFarmWorkers extends StatelessWidget {
  const ScreenConnectFarmWorkers({super.key});

  @override
  Widget build(BuildContext context) {
   return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen( 
        child: Scaffold(backgroundColor: Colors.transparent,
          drawer:MainDrawer(index: 14),
          appBar:
              AppBar(backgroundColor: Colors.transparent,elevation: 0, title: const Text("ربط العمال بالمزرعة",style: TextStyle(color: Colors.white),)),
          body: Center(
            child: Container(padding: EdgeInsets.all(10),width: 700 ,
              child: SingleChildScrollView(
                child: Form(
                    child: Card(color: Color(0xFF467061),elevation: 20,
                      child: Container(margin: EdgeInsets.all(50),
                        child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                        TextFormField(
                          validator: (value) {},
                          decoration:
                              const InputDecoration(fillColor: Colors.white,filled: true,border: InputBorder.none, hintText: "الرقم القومي للعمل"),
                          keyboardType: TextInputType.text,
                        ),Container(height: 10,),
                        TextFormField(
                          validator: (value) {},
                          decoration:
                              const InputDecoration(fillColor: Colors.white,filled: true,border: InputBorder.none, hintText: "اسم المزرعة"),
                          keyboardType: TextInputType.text,
                        ),Container(height: 10,),
                        TextFormField(
                          validator: (value) {},
                          decoration:
                              const InputDecoration(fillColor: Colors.white,filled: true,border: InputBorder.none, hintText: "السجل التجاري"),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 10),
                         Row(
                        children: [
                          Spacer(),
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
                          ),Spacer(),
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
                      ),Spacer()
                        ],
                      ),
                                        ],
                                      ),
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}