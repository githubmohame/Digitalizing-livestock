import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';

class LogIN extends StatelessWidget {
  LogIN({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child:  BackgroundScreen( 
        child: LayoutBuilder(
          builder: (context,constraint) {
            return Scaffold( backgroundColor: Colors.transparent, appBar:constraint.maxWidth<900? AppBar(elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: const Text("تسجيل الدخول",style: TextStyle(color: Colors.white),)):null, drawer: MainDrawer(index: 4), 
                   body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,children: [
                   constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:4)):Container(),
                   Spacer(),Card( color:Color(0xFF357515

),elevation: 20,
                     child: Container(margin: EdgeInsets.all(20),width:600 ,
                       child: Form(child: Column(children: [
                        const Icon(Icons.person,color:Colors.white,size:50),
                            const TextField(keyboardType: TextInputType.number,style:TextStyle(color:Colors.brown),decoration: InputDecoration(filled: true,fillColor: Colors.white,hintText: "ادخل الرقم القومي",prefixIcon: Icon(Icons.email,color: Colors.grey,),border :OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 5)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2)) ,focusColor: Colors.white,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2)))),
                            const SizedBox(height: 20),
                            CustomePasswordUpdateTextField()   ,          const SizedBox(height:20,),
                            Container(height: 50,width: 200,
                              child: TextButton(onPressed: () {
                                
                              }, style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: const BorderSide(color: Colors.transparent)
                                   )
                                   ),backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),side:MaterialStateProperty.resolveWith((states) => const BorderSide(color: Colors.green,style: BorderStyle.solid)) ),child: const Text('تسجيل الدخول',style:TextStyle(color: Colors.white))),
                            ),
                                     ],)),
                     ),
                   ) ,Spacer()
                    ],),
               );
          }
        ),
      ),
      ) ;
  }
}