import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';

class ScreenConnectFarmWorkers extends StatelessWidget {
  const ScreenConnectFarmWorkers({super.key});

  @override
  Widget build(BuildContext context) {
   return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(decoration:BoxDecoration(color: Colors.transparent,image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/farm.jpg'))),
        child: Scaffold(backgroundColor: Colors.transparent,
          drawer:MainDrawer(index: 14),
          appBar:
              AppBar(backgroundColor: Colors.transparent,elevation: 0, title: const Text("ربط العمال بالمزرعة")),
          body: Center(
            child: Container(padding: EdgeInsets.all(10),width: 700,color: Colors.white.withOpacity(0.5),
              child: SingleChildScrollView(
                child: Form(
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
                    OutlinedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.brown)),
                      onPressed: () {
                         
                      },
                      child: const Text(
                        "حفظ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                     SizedBox(height: 10,),
                    OutlinedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey),
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
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}