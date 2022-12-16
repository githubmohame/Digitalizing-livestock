import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';

class ScreenConnectFarmWorkers extends StatelessWidget {
  const ScreenConnectFarmWorkers({super.key});

  @override
  Widget build(BuildContext context) {
   return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer:MainDrawer(index: 14),
        appBar:
            AppBar(backgroundColor: Colors.brown, title: const Text("ربط العمال بالمزرعة")),
        body: SingleChildScrollView(
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {},
                  decoration:
                      const InputDecoration(border: InputBorder.none, hintText: "الرقم القومي للعمل"),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {},
                  decoration:
                      const InputDecoration(border: InputBorder.none, hintText: "اسم المزرعة"),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {},
                  decoration:
                      const InputDecoration(border: InputBorder.none, hintText: "السجل التجاري"),
                  keyboardType: TextInputType.text,
                ),
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
    );
  }
}