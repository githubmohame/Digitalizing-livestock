// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:final_project_year/api_function.dart/locations_api.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';

class ScreenGavernorate extends StatelessWidget {
  ScreenGavernorate({Key? key}) : super(key: key);
  SelectGavernorate selectGavernorate = SelectGavernorate(
    title: 'المحافظة',
    list: const [
      {"id": "اسيوط"},
      {"id": "القاهرة"},
      {"id": "المنةفية"}
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Card(
              color: Color(0xFF357515),
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('تعديل في المحافظات',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Container(
                    child: BlocProvider(
                      create: (context) => LocationCubit(
                          city: 'مركز دكرنس',
                          gavernorate: 'الدقهلية',
                          village: 'الجزيره'),
                      child: selectGavernorate,
                    ),
                  ),
                  const TextField(
                      style: TextStyle(color: Colors.brown),
                      decoration: InputDecoration(
                          hintText: "تعديل الاسم",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown, width: 5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown, width: 2)),
                          focusColor: Colors.brown,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown, width: 2)))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red)),
                        onPressed: () {
                          print(selectGavernorate.gavernorate);
                        },
                        child: const Text(
                          "مسح",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.brown)),
                        onPressed: () {},
                        child: const Text(
                          "حفظ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SelectGavernorate extends StatefulWidget {
  String? gavernorate;
  String title;
  List<Map<String, String>> list;
  SelectGavernorate({
    Key? key,
    this.gavernorate,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  State<SelectGavernorate> createState() => _SelectGavernorateState();
}

class _SelectGavernorateState extends State<SelectGavernorate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: gavernorate_api(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done &&
                  snap.data is List<Map<String, String>> &&
                  snap.data!.isNotEmpty)
                return CustomeDropdownButton(
                    func: (String value) {
                      BlocProvider.of<LocationCubit>(context)
                          .updateGavernorate(value);
                      widget.gavernorate = value;
                      print(widget.gavernorate);
                    },
                    list: snap.data!,
                    expanded: true,
                    value: snap.data![0]['name']!,
                    text: widget.title);
              return Container();
            }),
      ],
    );
  }
}

class SelectCity extends StatefulWidget {
  List<Map<String, String>> list;
  List<Map<String, String>> list2;
  String? city;
  List<String> titles;
  SelectCity({
    Key? key,
    required this.list,
    required this.list2,
    this.city,
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
            child: FutureBuilder(
                future: gavernorate_api(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, String>> &&
                      snap.data!.isNotEmpty)
                    return CustomeDropdownButton(
                        func: (String value) {
                          print(value);
                          BlocProvider.of<LocationCubit>(context)
                              .updateGavernorate(value);
                        },
                        list: snap.data ?? [],
                        expanded: true,
                        value: snap.data![0]['name']!,
                        text: widget.titles[0]);
                  return Container();
                })),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<LocationCubit, LocationState>(
            buildWhen: (previous, current) {
              //
              return previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              return FutureBuilder(
                  future: city_api(gavernorate: state.gavernorate),
                  builder: (context, snap) {
                    print(snap.data);
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, String>> &&
                        snap.data!.isNotEmpty)
                      return CustomeDropdownButton(
                          func: (String value) {
                            BlocProvider.of<LocationCubit>(context)
                                .updateCity(value);
                            widget.city = value;
                            print(widget.city);
                          },
                          list: snap.data ?? [],
                          expanded: true,
                          value: snap.data![0]['name']!,
                          text: widget.titles[1]);
                    return Container();
                  });
            },
          ),
        ),
      ],
    );
  }
}

class ScreenCity extends StatelessWidget {
  ScreenCity({Key? key}) : super(key: key);
  SelectCity selectCity = SelectCity(
    list2: const [
      {"id": "القاهرة"},
      {"id": "القاهرة"}
    ],
    titles: const ['المحافظة', 'المركز'],
    list: const [
      {"id": "اسيوط"},
      {"id": "القاهرة"},
      {"id": "المنةفية"}
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: SingleChildScrollView(
          child: Card(
            color: Color(0xFF357515),
            elevation: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('تعديل في المحافظات',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                BlocProvider(
                  create: (context) =>
                      LocationCubit(city: '', gavernorate: '', village: ''),
                  child: selectCity,
                ),
                const TextField(
                    style: TextStyle(color: Colors.brown),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "تعديل الاسم",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 5)),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 50)),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.red)),
                      onPressed: () {
                        print(selectCity.city);
                      },
                      child: const Text(
                        "مسح",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 50)),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.brown)),
                      onPressed: () {},
                      child: const Text(
                        "حفظ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenVillage extends StatelessWidget {
  ScreenVillage({Key? key}) : super(key: key);
  SelectLocation selectLocation = SelectLocation();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Color(0xFF357515),
        elevation: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('تعديل في المحافظات',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            BlocProvider(
              create: (context) => LocationCubit(
                  city: 'مركز دكرنس',
                  gavernorate: 'الدقهلية',
                  village: 'الجزيره'),
              child: selectLocation,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  style: TextStyle(color: Colors.brown),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "تعديل الاسم",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)),
                      focusColor: Colors.brown,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    print(selectLocation.village);
                  },
                  child: const Text(
                    "مسح",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  onPressed: () {},
                  child: const Text(
                    "حفظ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor:
                    Color.fromARGB(255, 202, 197, 197).withOpacity(0.5),
                currentIndex: index,
                unselectedFontSize: 15,
                showUnselectedLabels: true,
                selectedFontSize: 20,
                onTap: (value) {
                  setState(() {
                    index = value;
                  }); //
                },
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                selectedLabelStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
                items: const [
                  BottomNavigationBarItem(
                    label: 'تعديل المحافظة',
                    icon: Image(
                        image: AssetImage('assets/images/gavernorate.png')),
                  ),
                  BottomNavigationBarItem(
                    label: 'تعديل المركز او المدينة',
                    icon: Image(image: AssetImage('assets/images/city.png')),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: 'تعديل القرية والشارع',
                    icon: Image(image: AssetImage('assets/images/village.png')),
                  ),
                ]),
            backgroundColor: Colors.transparent,
            appBar: constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      'تعديل الاماكن',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : null,
            drawer: MainDrawer(index: 6),
            body: Column(
              children: [
                constraint.maxWidth > 900
                    ? Container(height: 100, child: ComputerDrawer(index: 6))
                    : Container(),
                Spacer(),
                list[index],
                Spacer(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
