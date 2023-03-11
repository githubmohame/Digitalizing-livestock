import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/bloc/location/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/screen_gavernorate.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAnimalScreen extends StatefulWidget {
  AddAnimalScreen({Key? key}) : super(key: key);

  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  SelectPlotoon selectPlotoon = SelectPlotoon(
    title: 'النوع',
    list: [
      {"id": "ابقار"},
    ],
  );

  TextEditingController controller = TextEditingController();

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
            child: FutureBuilder(
                future: animal_api(),
                builder: (context, snap) {
                  if (snap.data != null && snap.data!.length > 0) {
                    return BlocProvider(
                      create: (context) => AnimalCubit(
                          platoon:  snap.data![0]['platoon'],
                          species: snap.data![0]['species']),
                      child: selectPlotoon,
                    );
                  }
                  return Container();
                }),
          ),
          TextField(
              controller: controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "تعديل الاسم",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)))),
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
                onPressed: () async {
                  await modify_platoon_api(
                      operation: 'update',
                      platoon: selectPlotoon.village.toString(),
                      new_name: controller.text);
                  selectPlotoon = SelectPlotoon(
                    title: 'النوع',
                    list: [
                      {"id": "ابقار"},
                    ],
                  );
                  setState(() {});
                },
                child: const Text(
                  "حفظ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: 20,
                height: 20,
              ),
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
                  modify_platoon_api(
                      operation: 'delete',
                      platoon: selectPlotoon.village.toString(),
                      new_name: controller.text);
                  setState(() {});
                  selectPlotoon = SelectPlotoon(
                    title: 'النوع',
                    list: [
                      {"id": "ابقار"},
                    ],
                  );
                },
                child: const Text(
                  "حذف",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: 20,
                height: 20,
              ),
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
                onPressed: () async {
                  await modify_platoon_api(
                      operation: 'insert',
                      platoon: selectPlotoon.village.toString(),
                      new_name: controller.text);
                  selectPlotoon = SelectPlotoon(
                    title: 'النوع',
                    list: [
                      {"id": "ابقار"},
                    ],
                  );
                  setState(() {});
                },
                child: const Text(
                  "اضافة",
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
  ScreenAddAnimalSubtype({Key? key}) : super(key: key);
  SelectSpecies selectSpecies = SelectSpecies(
    titles: ['النوع', 'الفصيلة'],
    list: [
      {"id": "برازلي"},
    ],
    list2: const [
      {"id": "ابقار"},
    ],
  );
  TextEditingController controller = TextEditingController();
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
            child: FutureBuilder(future: animal_api(),
              builder: (context,snap) {
                  if (snap.data != null && snap.data!.length > 0) {
                    return BlocProvider(
                      create: (context) => AnimalCubit(
                          platoon:  snap.data![0]['platoon'],
                          species: snap.data![0]['species']),
                      child:  selectSpecies,
                    );
                  }
                  return Container();
              }
            ),
          ),
          TextField(
              controller: controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "تعديل الاسم",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)))),
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
                  print(selectSpecies.species);
                  modify_species_api(
                      new_name: controller.text,
                      operation: 'update',
                      species: selectSpecies.species.toString());
                },
                child: const Text(
                  "حفظ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: 20,
                height: 20,
              ),
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
                  print(selectSpecies.species);
                  modify_species_api(
                      new_name: controller.text,
                      operation: 'delete',
                      species: selectSpecies.species.toString());
                },
                child: const Text(
                  "حذف",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: 20,
                height: 20,
              ),
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
                  print(selectSpecies.species);
                  modify_species_api(
                      new_name: controller.text,
                      operation: 'insert',
                      species: selectSpecies.species.toString());
                },
                child: const Text(
                  "اضافة",
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
  List<Widget> list = [AddAnimalScreen(), ScreenAddAnimalSubtype()];
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
                  unselectedItemColor: Colors.white,
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  selectedItemColor: Colors.white,
                  selectedLabelStyle:
                      const TextStyle(color: Colors.brown, fontSize: 20),
                  items: [
                    BottomNavigationBarItem(
                        label: 'تعديل النوع', icon: Container()),
                    BottomNavigationBarItem(
                      label: "تعديل الفصيلة",
                      icon: Container(),
                    ),
                  ]),
              backgroundColor: Colors.transparent,
              appBar: constraint.maxWidth < 900
                  ? AppBar(
                      title: const Text(
                        "تعديل الفصيلة او النوع",
                        style: TextStyle(color: Colors.white),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent)
                  : null,
              drawer: MainDrawer(index: 7),
              body: Column(
                children: [
                  constraint.maxWidth > 900
                      ? Container(height: 100, child: ComputerDrawer(index: 7))
                      : Container(),
                  Spacer(),
                  Card(
                      elevation: 20,
                      color: Color(0xFF357515),
                      child: Container(
                        child: list[index],
                        width: 600,
                      )),
                  Spacer(),
                ],
              ));
        }),
      ),
    );
  }
}

class SelectPlotoon extends StatefulWidget {
  String? village;
  String title;
  List<Map<String, String>> list;
  SelectPlotoon({
    Key? key,
    this.village,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  State<SelectPlotoon> createState() => _SelectAnimalState();
}

class _SelectAnimalState extends State<SelectPlotoon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: platoon_type_api(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done &&
                  snap.data is List<Map<String, String>> &&
                  snap.data!.isNotEmpty) {
                widget.village = snap.data![0]['id']!;
                return CustomeDropdownButton(
                    id: 'id',
                    func: (String value) {
                      BlocProvider.of<AnimalCubit>(context)
                          .updatePlatoon(platoon: value);
                      widget.village = value;
                    },
                    list: snap.data!,
                    expanded: true,
                    value: snap.data![0]['id']!,
                    text: widget.title);
              }

              return Container();
            }),
      ],
    );
  }
}

class SelectSpecies extends StatefulWidget {
  List<Map<String, String>> list;
  List<Map<String, String>> list2;
  String? species;
  List<String> titles;
  SelectSpecies({
    Key? key,
    required this.list,
    required this.list2,
    this.species,
    required this.titles,
  }) : super(key: key);

  @override
  State<SelectSpecies> createState() => _SelectSpeciesState();
}

class _SelectSpeciesState extends State<SelectSpecies> {
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
                future: platoon_type_api(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, String>> &&
                      snap.data!.isNotEmpty) {
                    return CustomeDropdownButton(
                        id: 'id',
                        func: (String value) {
                          print(value);
                          BlocProvider.of<AnimalCubit>(context)
                              .updatePlatoon(platoon: value);
                        },
                        list: snap.data ?? [],
                        expanded: true,
                        value: snap.data![0]['id']!,
                        text: widget.titles[0]);
                  }

                  return Container();
                })),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<AnimalCubit, AnimalInitial>(
            buildWhen: (previous, current) {
              //
              return previous.species != current.species;
            },
            builder: (context, state) {
              return FutureBuilder(
                  future: animal_species_api(platoon: state.platoon),
                  builder: (context, snap) {
                    print(snap.data);
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, String>> &&
                        snap.data!.isNotEmpty) {
                      print(snap.data);
                      widget.species = snap.data![0]['id']!;
                      return CustomeDropdownButton(
                          id: 'id',
                          func: (String value) {
                            //BlocProvider.of<LocationCubit>(context)
                            //  .updateCity(value);
                          },
                          list: snap.data ?? [],
                          expanded: true,
                          value: snap.data![0]['id']!,
                          text: widget.titles[1]);
                    }
                    widget.species = null;
                    return Container();
                  });
            },
          ),
        ),
      ],
    );
  }
}
