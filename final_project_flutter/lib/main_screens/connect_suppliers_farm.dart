import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_drower.dart';
import 'package:flutter/material.dart';

class ConnectSuppliersFarmer extends StatelessWidget {
  const ConnectSuppliersFarmer({super.key});

  @override
  Widget build(BuildContext context) {
   return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen( 
        child: Scaffold(backgroundColor: Colors.transparent,
          drawer:MainDrawer(index: 15),
          appBar:
              AppBar(elevation: 0,backgroundColor: Colors.transparent, title: const Text("ربط الموردين بالمزرعة",style: TextStyle(color: Colors.white),)),
          body: Center(
            child: Card(color: const Color(0xFF467061),elevation: 20,
              child: Container(padding: const EdgeInsets.all(50),width: 700,
                child: SingleChildScrollView(
                  child: Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (value) {
                          return null;
                        },
                        decoration:
                            const InputDecoration(fillColor: Colors.white,filled: true,border: InputBorder.none, hintText: "الرقم القومي للمورد"),
                        keyboardType: TextInputType.text,
                      ),Container(height: 10,),
                      TextFormField(
                        validator: (value) {
                          return null;
                        },
                        decoration:
                            const InputDecoration(fillColor: Colors.white,filled: true,border: InputBorder.none, hintText: "اسم المزرعة"),
                        keyboardType: TextInputType.text,
                      ),Container(height: 10,),
                      TextFormField(
                        validator: (value) {
                          return null;
                        },
                        decoration:
                            const InputDecoration(fillColor: Colors.white,filled: true,border: InputBorder.none, hintText: "السجل التجاري"),
                        keyboardType: TextInputType.text,
                      ),Container(height: 10,),
                      Row(
                        children: [
                          const Spacer(),
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith((states) =>
                                    const RoundedRectangleBorder(
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
                          ),const Spacer(),
                           OutlinedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                const RoundedRectangleBorder(
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
                      ),const Spacer()
                        ],
                      ),
                      
                     
                    ],
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}