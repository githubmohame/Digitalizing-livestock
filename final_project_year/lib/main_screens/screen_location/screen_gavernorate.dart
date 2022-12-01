import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';

class ScreenGavernorate extends StatelessWidget {
  const ScreenGavernorate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('تعديل في المحافظات',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(
            child: BlocProvider(
              create: (context) =>
                  ChoiceCubit(city: 0, gavernorate: 0, village: 0),
              child: SelectGavernorate(title: 'المحافظة'),
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
                      borderSide: BorderSide(color: Colors.brown, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)),
                  focusColor: Colors.brown,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)))),
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
                        (states) => Colors.brown)),
                onPressed: () {},
                child: Text(
                  "حفظ",
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

class SelectGavernorate extends StatefulWidget {
  String? village;
  String title;
  SelectGavernorate({
    Key? key,
    this.village,
    required this.title,
  }) : super(key: key);
  @override
  State<SelectGavernorate> createState() => _SelectGavernorateState();
}

class _SelectGavernorateState extends State<SelectGavernorate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: CustomeDropdownButton(
                func: (int value) {
                  BlocProvider.of<ChoiceCubit>(context)
                      .updateGavernorate(value);
                },
                list: [
                  {"id": 0, "name": "اسيوط"},
                  {"id": 1, "name": "القاهرة"},
                  {"id": 2, "name": "المنةفية"}
                ],
                expanded: true,
                value: 0,
                text: widget.title)),
      ],
    );
  }
}

class SelectCity extends StatefulWidget {
  List<Map<String, dynamic>> list;
  String? village;
  List<String> titles;
  SelectCity({
    Key? key,
    required this.list,
    this.village,
    required this.titles,
  }) : super(key: key);
  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
            )),
            child: CustomeDropdownButton(
                func: (int value) {
                  BlocProvider.of<ChoiceCubit>(context).updateCity(value);
                },
                list: [
                  {"id": 1, "name": "القاهرة"},
                  {"id": 0, "name": "القاهرة"}
                ],
                expanded: true,
                value: 0,
                text: widget.titles[0])),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<ChoiceCubit, ChoiceState>(
            buildWhen: (previous, current) {
              //
              return previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              return CustomeDropdownButton(
                  func: (int value) {
                    BlocProvider.of<ChoiceCubit>(context).updateCity(value);
                  },
                  list: widget.list,
                  expanded: true,
                  value: 0,
                  text: widget.titles[1]);
            },
          ),
        ),
      ],
    );
  }
}

class ScreenCity extends StatelessWidget {
  const ScreenCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('تعديل في المحافظات',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(
            child: BlocProvider(
              create: (context) =>
                  ChoiceCubit(city: 0, gavernorate: 0, village: 0),
              child: SelectCity(
                titles: ['المحافظة', 'المركز'],
                list: [
                  {"id": 0, "name": "اسيوط"},
                  {"id": 1, "name": "القاهرة"},
                  {"id": 2, "name": "المنةفية"}
                ],
              ),
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
                      borderSide: BorderSide(color: Colors.brown, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)),
                  focusColor: Colors.brown,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)))),
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
                        (states) => Colors.brown)),
                onPressed: () {},
                child: Text(
                  "حفظ",
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

class ScreenVillage extends StatelessWidget {
  const ScreenVillage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('تعديل في المحافظات',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(
            child: BlocProvider(
              create: (context) =>
                  ChoiceCubit(city: 0, gavernorate: 0, village: 0),
              child: SelectLocation(),
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
                      borderSide: BorderSide(color: Colors.brown, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)),
                  focusColor: Colors.brown,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2)))),
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
                        (states) => Colors.brown)),
                onPressed: () {},
                child: Text(
                  "حفظ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}

class UpdateLocation extends StatefulWidget {
  UpdateLocation({Key? key}) : super(key: key);

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  List<Widget> list = [ScreenGavernorate(), ScreenCity(), ScreenVillage()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey,
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            selectedItemColor: Colors.brown,
            selectedLabelStyle: TextStyle(color: Colors.brown, fontSize: 20),
            items: [
              BottomNavigationBarItem(
                label: 'تعديل المحافظة',
                icon: Image(image: AssetImage('assets/images/gavernorate.png')),
              ),
              BottomNavigationBarItem(
                label: 'تعديل المركز او المدينة',
                icon: Image(image: AssetImage('assets/images/city.png')),
              ),
              BottomNavigationBarItem(
                label: 'تعديل القرية والشارع',
                icon: Image(image: AssetImage('assets/images/village.png')),
              ),
            ]),
        backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.brown,title: Text('تعديل الاماكن'),),
        drawer: MainDrawer(index: 6),
        body: list[index],
      ),
    );
  }
}
