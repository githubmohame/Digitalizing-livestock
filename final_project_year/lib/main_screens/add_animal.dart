import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/screen_location/screen_gavernorate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ScreenAddAnimal extends StatelessWidget {
  const ScreenAddAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('تعديل في النوع',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(
            child: BlocProvider(
              create: (context) =>
                  ChoiceCubit(city: 0, gavernorate: 0, village: 0),
              child: SelectGavernorate(title: 'النوع'),
            ),
          ),
          const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "تعديل الاسم",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)),
                  focusColor: Colors.brown,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)))),
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
      ),
    );
  }
}




class ScreenAddAnimalSubtype extends StatelessWidget {
  const ScreenAddAnimalSubtype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('تعديل في الفصيلة',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(
            child: BlocProvider(
              create: (context) =>
                  ChoiceCubit(city: 0, gavernorate: 0, village: 0),
              child: SelectCity(titles: ['النوع','الفصيلة'],list: [
                    {"id": 0, "name": "اسيوط"},
                    {"id": 1, "name": "القاهرة"},
                    {"id": 2, "name": "المنةفية"}
                  ],),
            ),
          ),
          const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "تعديل الاسم",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)),
                  focusColor: Colors.brown,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)))),
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
      ),
    );
  }
}

class UpdateAnimal extends StatefulWidget {
  UpdateAnimal({Key? key}) : super(key: key);

  @override
  State<UpdateAnimal> createState() => _UpdateAnimalState();
}

class _UpdateAnimalState extends State<UpdateAnimal> {
  List<Widget> list = [const ScreenAddAnimal(),  const ScreenAddAnimalSubtype()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: BackgroundScreen (
        child: LayoutBuilder(
          builder: (context,constraint) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(backgroundColor: Color.fromARGB(255, 202, 197, 197).withOpacity(0.5),unselectedItemColor: Colors.white,
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },selectedItemColor: Colors.white,selectedLabelStyle: const TextStyle(  color: Colors.brown,fontSize: 20),
                  items: [
                    BottomNavigationBarItem(
                      label: 'تعديل النوع',
                      icon: Container()
                    ),
                    BottomNavigationBarItem(
                      label: "تعديل الفصيلة",
                      icon:Container(),
                    ),
                  ]),
              backgroundColor: Colors.transparent,
              appBar:constraint.maxWidth<900?AppBar(title:const Text("تعديل الفصيلة او النوع",style: TextStyle(color: Colors.white),),elevation: 0, backgroundColor: Colors.transparent):null,
              drawer: MainDrawer(index: 7),
              body:  Column(
                children: [
                constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:7)):Container(),
                Spacer(),
                  Card(elevation: 20,color:Color(0xFF467061),child: Container( child: list[index],width: 600,)),
                  Spacer(),
                ],)
            );
          }
        ),
      ),
    );
  }
}
