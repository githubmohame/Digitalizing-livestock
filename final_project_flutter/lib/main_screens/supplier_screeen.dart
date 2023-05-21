import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Supplier extends StatelessWidget {
  Supplier({Key? key, String? phone, this.edit = true, String? ssn, String? name,this.city,this.country,this.village})
      : super(key: key) {
    if (!edit) {
      list[0].text = "رقم التليفون$phone";
      list[1].text = "الرقم القومي:$ssn";
      list[2].text = "الاسم:$name";
    }
  }
  bool edit = true;
  String? villlage_code,city,country,village;
  List<TextEditingController> list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen( 
        child: Scaffold( backgroundColor: Colors.transparent,
          drawer: MainDrawer(index: 12),
          appBar: AppBar(elevation: 0,leading: !edit?IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)):null,
              backgroundColor: Colors.transparent, title: const Text("اضافه موردين",style: TextStyle(color: Colors.white),)),
          body: Center(
            child: Card(color: const Color(0xFF467061),elevation: 20,
              child: SingleChildScrollView( 
                child: Container(padding: const EdgeInsets.all(20),width: 700,color: Colors.white.withOpacity(0.5),
                  child: Form(
                      child: Column(
                    children: [
                       TextFormField(
                         enabled: edit,
                         controller: list[0],
                         validator: (value) {
                           return null;
                         },
                         decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                             border: InputBorder.none, hintText:'الاسم الاول'),
                         keyboardType: TextInputType.text,
                       ),Container(height: 10,),
                      TextFormField(
                        enabled: edit,
                        controller: list[0],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                            border: InputBorder.none, hintText:'الاسم الثاني'),
                        keyboardType: TextInputType.text,
                      ),Container(height: 10,),
                      TextFormField(
                        enabled: edit,
                        controller: list[0],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                            border: InputBorder.none, hintText: "رقم التليفون"),
                        keyboardType: TextInputType.phone,
                      ),Container(height: 10,),
                      TextFormField(
                        enabled: edit,
                        controller: list[1],
                        validator: (value) {
                          return null;
                        },
                        decoration: const InputDecoration(fillColor: Colors.white,filled: true,
                            border: InputBorder.none, hintText: "الرقم القومي"),
                        keyboardType: TextInputType.number,
                      ),Container(height: 10,),
                      BlocProvider(
                        create: (context) => SelectMuiltTypeCubit(list: []),
                        child: Container(
                          child: CustomeType(
                            title: "نوع التوريد",
                            list: const [
                              {"برسيم": 1},
                              {"حبوب": 0}
                            ],
                          ),
                        ),
                      ),
                      !edit?Container():OutlinedButton(
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
