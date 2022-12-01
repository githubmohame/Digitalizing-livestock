import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';

class LogIN extends StatelessWidget {
  LogIN({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold( appBar: AppBar(backgroundColor: Colors.brown ,elevation: 0,title: Text('تسجيل الدخول'),),backgroundColor: Colors.white,drawer: MainDrawer(index: 4),   body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
        Form(child: Column(children: [
          Icon(Icons.person,color:Colors.white,size:50),
              TextField(keyboardType: TextInputType.number,style:TextStyle(color:Colors.brown),decoration: InputDecoration(hintText: "ادخل الرقم القومي",prefixIcon: Icon(Icons.email,color: Colors.brown,),border :OutlineInputBorder(borderSide: BorderSide(color:Colors.grey,width: 5)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2)) ,focusColor: Colors.grey,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2)))),
              SizedBox(height: 20),
              TextField(style:TextStyle(color:Colors.brown),decoration: InputDecoration(hintText: "اكتب الرقم السري",prefixIcon: Icon(Icons.password,color: Colors.brown,),border :OutlineInputBorder(borderSide: BorderSide(color:Colors.grey,width: 5)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2)) ,focusColor: Colors.green,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2)))),
              SizedBox(height:20,),
              Container(height: 50,width: 200,
                child: TextButton(onPressed: () {
                  
                }, style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.transparent)
      )
      ),backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey),side:MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.grey,style: BorderStyle.solid)) ),child: Text('تسجيل الدخول',style:TextStyle(color: Colors.white))),
              ),
        ],))
          ],),),
    );
  }
}
/*
Center(child: Text('تسجيل الدخول',style:TextStyle(fontSize: 20,color: Colors.white,))),
              TextField(style:TextStyle(color:Colors.green),decoration: InputDecoration(hintText: "ادخل الرقم القومي",prefixIcon: Icon(Icons.email,color: Colors.green,),border :OutlineInputBorder(borderSide: BorderSide(color:Colors.green,width: 5)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)) ,focusColor: Colors.green,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)))),
              SizedBox(height: 20),
              TextField(style:TextStyle(color:Colors.green),decoration: InputDecoration(hintText: "اكتب الرقم السري",prefixIcon: Icon(Icons.password,color: Colors.green,),border :OutlineInputBorder(borderSide: BorderSide(color:Colors.green,width: 5)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)) ,focusColor: Colors.green,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)))),
              SizedBox(height:20,),
              Container(height: 50,width: 200,
                child: TextButton(onPressed: () {
                  
                }, style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red)
      )
      ),backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),side:MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.green,style: BorderStyle.solid)) ),child: Text('تسجيل الدخول',style:TextStyle(color: Colors.white))),
              ),
*/