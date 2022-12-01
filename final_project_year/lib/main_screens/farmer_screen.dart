import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Farmer extends StatelessWidget {
  Farmer({Key? key, String? phone, this.edit = true, String? ssn, String? name,this.city,this.country,this.village})
      : super(key: key) {
    if (!edit) {
      list[0].text = "رقم التليفون" + phone.toString();
      list[1].text = "الرقم القومي:" + ssn.toString();
      list[2].text = "الاسم:" + name.toString();
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
    final _formKey = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold( 
        drawer: MainDrawer(index: 2),
        appBar: AppBar(leading: !edit?IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)):null,
            backgroundColor: Colors.brown, title: Text("اضافه المربين")),
        body: SingleChildScrollView( 
          child: Form(
              child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  enabled: edit,
                  controller: list[0],
                  validator: (value) {},
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "رقم التليفون"),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  enabled: edit,
                  controller: list[1],
                  validator: (value) {},
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "الرقم القومي"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  enabled: edit,
                  controller: list[2],
                  validator: (value) {
                    try {
                      return int.parse(value ?? "0") <= 0
                          ? "  0العدد يجب ان يكون اكبر من او يساوي"
                          : null;
                    } catch (e) {
                      return null;
                    }
                  } ,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "الاسم"),
                  keyboardType:TextInputType.name,
                ),
              ),
              !edit?Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                Container(height: 50,decoration: BoxDecoration(border:Border.all(color:Colors.black)),
                  child: Row(
                    children: [
                      Text("المحافظة"+":"),
                       Text(city.toString()),
                    ],
                  ),
                ),
                Container(height: 50,decoration: BoxDecoration(border:Border.all(color:Colors.black)),
                  child: Row(
                    children: [
                      Text("المركز و المدينة"),
                Text(country.toString()),
                    ],
                  ),
                ),
                Container(height: 50,decoration: BoxDecoration(border:Border.all(color:Colors.black)),
                  child: Row(
                    children: [
                      Text("قرية او الشارع"),
                Text(village.toString())
                    ],
                  ),
                ),
              ],),):Container(
                height:300,
                child: Row(
                  children: [
                    Expanded(
                        child: BlocProvider(
                      create: (context) =>
                          ChoiceCubit(city: 0, gavernorate: 0, village: 0),
                      child: SelectLocation(),
                    )),
                  ],
                ),
              ),
              !edit?Container():OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(200, 50)),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.grey),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.brown)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowInfoScreen(),
                      ));
                },
                child: Text(
                  "حفظ",
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
