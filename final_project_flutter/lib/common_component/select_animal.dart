// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously, non_constant_identifier_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/common_component/custome_dropdownbutton.dart';

class SelectAnimalType extends StatefulWidget {
  int? platoon;
  Future<List<Map<String, dynamic>>> Function() platoonApi;
  Future<List<Map<String, dynamic>>> Function({required int platoon})
      speciesApi;
  SelectAnimalType({
    super.key,
    this.platoon,
    required this.platoonApi,
    required this.speciesApi,
  });
  @override
  State<SelectAnimalType> createState() => _SelectAnimalTypeState();
}

class _SelectAnimalTypeState extends State<SelectAnimalType> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
            )),
            child: FutureBuilder(
                future: widget.platoonApi(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, dynamic>> &&
                      snap.data!.isNotEmpty) {
                    return BlocBuilder<AnimalCubit, AnimalInitial>(
                      builder: (context, state) {
                        widget.platoon = state.platoon;
                        return CustomeDropdownButton(
                            id: 'id',
                            func: (int value) async {
                              List<Map<String, dynamic>> l2 =
                                  await Api.animal_species_api(platoon: value);
                              BlocProvider.of<AnimalCubit>(context)
                                  .updatePlatoon(
                                      platoon: value,
                                      species: l2.isNotEmpty
                                          ? l2[0]['id'] ?? -1
                                          : -1);
                            },
                            list: snap.data ??
                                [
                                  {"id": '1', "name": "ابقار"},
                                ],
                            expanded: true,
                            value: widget.platoon ?? -1,
                            text: "نوع الحيوان");
                      },
                    );
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
              return previous.platoon != current.platoon;
            },
            builder: (context, state) {
              return FutureBuilder(
                  future: widget.speciesApi(platoon: state.platoon),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, dynamic>> &&
                        snap.data!.isNotEmpty) {
                      widget.platoon = snap.data![0]['id'];
                      return CustomeDropdownButton(
                          id: 'id',
                          func: (int value) {
                            widget.platoon = value;
                          },
                          list: snap.data ??
                              [
                                {"id": '1', "name": "البراازلي"},
                              ],
                          expanded: true,
                          value: snap.data![0]['id'] ?? '1',
                          text: "فصيله الحيوان");
                    }

                    return Container();
                  });
            },
          ),
        )
      ],
    );
  }
}

class SelectAnimalTypeFarm extends StatefulWidget {
  int? platoon;
  int? species;
  String farmId;
  Future<List<Map<String, dynamic>>> Function(
      {required int platoon, required String farmId}) speciesApi;
  Future<List<Map<String, dynamic>>> Function({required String farmId})
      platoonApi;

  SelectAnimalTypeFarm({
    super.key,
    required this.farmId,
    this.platoon,
    this.species,
    required this.platoonApi,
    required this.speciesApi,
  });
  @override
  State<SelectAnimalTypeFarm> createState() => _SelectAnimalTypeFarmState();
}

class _SelectAnimalTypeFarmState extends State<SelectAnimalTypeFarm> {
  @override
  void initState() {}

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
                future: widget.platoonApi(farmId: widget.farmId),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, dynamic>> &&
                      snap.data!.isNotEmpty) {
                    snap.data!.add({"name": "__", "id": -1});
                    return BlocBuilder<AnimalCubit, AnimalInitial>(
                      builder: (context, state) {
                        widget.platoon = state.platoon;
                        if (state.platoon == -1) {
                          widget.platoon = null;
                        }
                        return CustomeDropdownButton(
                            id: 'id',
                            func: (int value) async {
                              List<Map<String, dynamic>> l2 =
                                  await Api.animal_species_farm_api(
                                      platoon: value, farmId: widget.farmId);
                              BlocProvider.of<AnimalCubit>(context)
                                  .updatePlatoon(
                                      platoon: value,
                                      species: l2.isNotEmpty
                                          ? l2[0]['id'] ?? -1
                                          : -1);
                            },
                            list: snap.data ??
                                [
                                  {"id": '1', "name": "ابقار"},
                                ],
                            expanded: true,
                            value: state.platoon,
                            text: "نوع الحيوان");
                      },
                    );
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
              return previous.platoon != current.platoon;
            },
            builder: (context, state) {
              return FutureBuilder(
                  future: widget.speciesApi(
                      farmId: widget.farmId, platoon: state.platoon),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done &&
                        snap.data is List<Map<String, dynamic>> &&
                        snap.data!.isNotEmpty) {
                      snap.data!.add({"name": "__", "id": -1});
                      widget.species = snap.data![0]['id'];
                      return CustomeDropdownButton(
                          id: 'id',
                          func: (int value) {
                            if (value == -1) {
                              widget.species = null;
                              return;
                            }
                            widget.species = value;
                          },
                          list: snap.data ??
                              [
                                {"id": '1', "name": "البراازلي"},
                              ],
                          expanded: true,
                          value: widget.species ?? -1,
                          text: "فصيله الحيوان");
                    }
                    widget.species = null;
                    return Container();
                  });
            },
          ),
        )
      ],
    );
  }
}
