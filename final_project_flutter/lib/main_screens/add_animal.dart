// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/main_diwer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common_component/custome_dropdownbutton.dart';

class AddAnimalScreen extends StatefulWidget {
  const AddAnimalScreen({Key? key}) : super(key: key);

  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  SelectPlotoon selectPlotoon = SelectPlotoon(
    title: 'النوع',
    list: const [
      {"id": -1},
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
          FutureBuilder(
              future: Api.animal_api(),
              builder: (context, snap) {
                if (snap.data != null && snap.data!.isNotEmpty) {
                  return BlocProvider(
                    create: (context) => AnimalCubit(
                        platoon: snap.data![0]['platoon'],
                        species: snap.data![0]['species']),
                    child: selectPlotoon,
                  );
                }
                return Container();
              }),
          TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
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
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green)),
                onPressed: () async {
                  await Api.modify_platoon_api(
                      operation: 'update',
                      platoon: selectPlotoon.village.toString(),
                      new_name: controller.text);
                  selectPlotoon = SelectPlotoon(
                    title: 'النوع',
                    list: const [
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
              const SizedBox(
                width: 20,
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red)),
                onPressed: () {
                  Api.modify_platoon_api(
                      operation: 'delete',
                      platoon: selectPlotoon.village.toString(),
                      new_name: controller.text);
                  setState(() {});
                  selectPlotoon = SelectPlotoon(
                    title: 'النوع',
                    list: const [
                      {"id": "ابقار"},
                    ],
                  );
                },
                child: const Text(
                  "حذف",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red)),
                onPressed: () async {
                  await Api.modify_platoon_api(
                      operation: 'insert',
                      platoon: selectPlotoon.village.toString(),
                      new_name: controller.text);
                  selectPlotoon = SelectPlotoon(
                    title: 'النوع',
                    list: const [
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

class ScreenAddAnimalSubtype extends StatefulWidget {
  const ScreenAddAnimalSubtype({Key? key}) : super(key: key);

  @override
  State<ScreenAddAnimalSubtype> createState() => _ScreenAddAnimalSubtypeState();
}

class _ScreenAddAnimalSubtypeState extends State<ScreenAddAnimalSubtype> {
  SelectSpecies selectSpecies = SelectSpecies(
    titles: const ['النوع', 'الفصيلة'],
    list: const [
      {"id": "برازلي"},
    ],
    list2: const [
      {"id": "ابقار"},
    ],
  );

  TextEditingController controller = TextEditingController();
      @override
  void dispose() {
     controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('تعديل في الفصيلة',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          FutureBuilder(
              future: Api.animal_api(),
              builder: (context, snap) {
                if (snap.data != null && snap.data!.isNotEmpty) {
                  selectSpecies.species = snap.data![0]['id'];
                  return BlocProvider(
                    create: (context) => AnimalCubit(
                        platoon: snap.data![0]['platoon'],
                        species: snap.data![0]['id']),
                    child: selectSpecies,
                  );
                }
                return Container();
              }),
          TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
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
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green)),
                onPressed: () async {
                  var res = await Api.modify_species_api(
                      new_name: controller.text,
                      operation: 'update',
                      species: selectSpecies.species ?? -1);
                  if (res.containsKey('message')) {
                    showSnackbardone(context: context, text: res['message']!);
                  } else {
                    showSnackbarerror(context: context, text: res['error']!);
                  }
                  selectSpecies = SelectSpecies(
                    titles: const ['النوع', 'الفصيلة'],
                    list: const [
                      {"id": "برازلي"},
                    ],
                    list2: const [
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
              const SizedBox(
                width: 20,
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red)),
                onPressed: () async {
                  var res = await  Api.modify_species_api(
                      new_name: controller.text,
                      operation: 'delete',
                      species: selectSpecies.species ?? -1);
                  if (res.containsKey('message')) {
                    showSnackbardone(context: context, text: res['message']!);
                  } else {
                    showSnackbarerror(context: context, text: res['error']!);
                  }
                  selectSpecies = SelectSpecies(
                    titles: const ['النوع', 'الفصيلة'],
                    list: const [
                      {"id": "برازلي"},
                    ],
                    list2: const [
                      {"id": "ابقار"},
                    ],
                  );
                  setState(() {});
                },
                child: const Text(
                  "حذف",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red)),
                onPressed: () async {
                  var res = await Api.modify_species_api(
                      platoon: selectSpecies.platoon,
                      new_name: controller.text,
                      operation: 'insert',
                      species: selectSpecies.species ?? -1);
                  if (res.containsKey('message')) {
                    showSnackbardone(context: context, text: res['message']!);
                  } else {
                    showSnackbarerror(context: context, text: res['error']!);
                  }
                  selectSpecies = SelectSpecies(
                    titles: const ['النوع', 'الفصيلة'],
                    list: const [
                      {"id": "برازلي"},
                    ],
                    list2: const [
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

class UpdateAnimal extends StatefulWidget {
  const UpdateAnimal({Key? key}) : super(key: key);

  @override
  State<UpdateAnimal> createState() => _UpdateAnimalState();
}

class _UpdateAnimalState extends State<UpdateAnimal> {
  List<Widget> list = [const AddAnimalScreen(), const ScreenAddAnimalSubtype()];
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
                      const Color.fromARGB(255, 202, 197, 197).withOpacity(0.5),
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    constraint.maxWidth > 900
                        ? SizedBox(height: 100, child: ComputerDrawer(index: 7))
                        : Container(),
                       constraint.maxWidth > 900
                        ? SizedBox(height: constraint.maxHeight/4, )
                        : Container(), 
                     Card(
                        elevation: 20,
                        color: const Color(0xFF357515),
                        child: SizedBox(
                          width: 600,
                          child: list[index],
                        )),
                   ],
                ),
              ));
        }),
      ),
    );
  }
}

class SelectPlotoon extends StatefulWidget {
  int? village;
  String title;
  List<Map<String, dynamic>> list;
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
            future: Api.platoon_type_api(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done &&
                  snap.data is List<Map<String, dynamic>> &&
                  snap.data!.isNotEmpty) {
                widget.village = snap.data![0]['id']!;
                return CustomeDropdownButton(
                    id: 'id',
                    func: (int value) async {
                      List<Map<String, dynamic>> l2 =
                          await Api.animal_species_api(platoon: value);

                      BlocProvider.of<AnimalCubit>(context).updatePlatoon(
                          platoon: value,
                          species: l2.isNotEmpty ? l2[0]['id'] ?? -1 : -1);
                      widget.village = value;
                    },
                    list: snap.data!,
                    expanded: true,
                    value: widget.village!,
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
  int? species;
  int? platoon;
  List<String> titles;
  SelectSpecies({
    Key? key,
    required this.list,
    required this.list2,
    this.species,
    this.platoon,
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
            child: BlocBuilder< AnimalCubit, AnimalInitial>(
              builder: (context, state) {
                return FutureBuilder(
                            future: Api.platoon_type_api(),
                            builder: (context, snap) {
                              if (snap.connectionState == ConnectionState.done &&
                                  snap.data is List<Map<String, dynamic>> &&
                                  snap.data!.isNotEmpty) {
                                widget.platoon =state.platoon ;
                                 return CustomeDropdownButton(
                                    id: 'id',
                                    func: (int value) async {
                                      List<Map<String, dynamic>> l2 =
                                          await Api.animal_species_api(platoon: value);
                                      BlocProvider.of<AnimalCubit>(context).updatePlatoon(
                                          platoon: value,
                                          species: l2.isNotEmpty ? l2[0]['id'] ?? -1 : -1);
                                      widget.platoon = value;
                                    },
                                    list: snap.data ?? [],
                                    expanded: true,
                                    value: state.platoon,
                                    text: widget.titles[0]);
                              }
                              return Container();
                            });
              },
            )),
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
                    future: Api.animal_species_api(platoon: state.platoon),
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.done &&
                          snap.data is List<Map<String, dynamic>> &&
                          snap.data!.isNotEmpty) {
                        widget.species = snap.data![0]['id']!;
                        return CustomeDropdownButton(
                            id: 'id',
                            func: (int value) {
                              //BlocProvider.of<LocationCubit>(context)
                              //  .updateCity(value);
                              widget.species = value;
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
