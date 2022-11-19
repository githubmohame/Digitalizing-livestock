import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/screen_location/screen_gavernorate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ScreenAddAnimal extends StatelessWidget {
  const ScreenAddAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('تعديل في النوع',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Container(
          child: BlocProvider(
            create: (context) =>
                ChoiceCubit(city: 0, gavernorate: 0, village: 0),
            child: SelectGavernorate(),
          ),
        ),
        TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "تعديل الاسم",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2)),
                focusColor: Colors.green,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2)))),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(200, 50)),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.red)),
              onPressed: () {},
              child: Text(
                "مسح",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(200, 50)),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green)),
              onPressed: () {},
              child: Text(
                "حفظ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}




class ScreenAddAnimalSubtype extends StatelessWidget {
  const ScreenAddAnimalSubtype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('تعديل في الفصيلة',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Container(
          child: BlocProvider(
            create: (context) =>
                ChoiceCubit(city: 0, gavernorate: 0, village: 0),
            child: SelectCity(),
          ),
        ),
        TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "تعديل الاسم",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2)),
                focusColor: Colors.green,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2)))),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(200, 50)),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.red)),
              onPressed: () {},
              child: Text(
                "مسح",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(200, 50)),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green)),
              onPressed: () {},
              child: Text(
                "حفظ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UpdateAnimal extends StatefulWidget {
  UpdateAnimal({Key? key}) : super(key: key);

  @override
  State<UpdateAnimal> createState() => _UpdateAnimalState();
}

class _UpdateAnimalState extends State<UpdateAnimal> {
  List<Widget> list = [ScreenAddAnimal(),  ScreenAddAnimalSubtype()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.green,
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },selectedItemColor: Colors.brown,selectedLabelStyle: TextStyle(  color: Colors.brown,fontSize: 20),
            items: [
              BottomNavigationBarItem(
                label: 'تعديل المركز او المدينة',
                icon: Container()
              ),
              BottomNavigationBarItem(
                label: 'تعديل القرية والشارع',
                icon:Container(),
              ),
            ]),
        backgroundColor: Color(0x0FFFb0b348),
        appBar: AppBar(elevation: 0, backgroundColor: Color(0x0FFFb0b348)),
        drawer: MainDrawer(index: 7),
        body: list[index],
      ),
    );
  }
}
