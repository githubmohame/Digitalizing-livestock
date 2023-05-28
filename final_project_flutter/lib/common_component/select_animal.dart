// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/bloc/animals_selection/cubit/animal_cubit.dart';
import 'package:final_project_year/common_component/custome_dropdownbutton.dart';

class SelectAnimalType extends StatefulWidget {
  
  int? platoon;
  Future<List<Map<String, dynamic>>>  Function() platoonApi;
  Future<List<Map<String, dynamic>>>  Function({required int platoon}) speciesApi;
    SelectAnimalType({
    Key? key,
    this.platoon,
    required this.platoonApi,
    required this.speciesApi,
  }) : super(key: key);
  @override
  State<SelectAnimalType> createState() => _SelectAnimalTypeState();
}

class _SelectAnimalTypeState extends State<SelectAnimalType> {
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
                future:  widget.platoonApi(),
                builder: (context, snap) {
                  // print(snap.data is List<Map<String, dynamic>>);
                  if (snap.connectionState == ConnectionState.done &&
                      snap.data is List<Map<String, dynamic>> &&
                      snap.data!.isNotEmpty) {
                    return BlocBuilder<AnimalCubit, AnimalInitial>(
                      builder: (context, state) {
                        widget.platoon = state.platoon;
                        // print(widget.platoon);
                        return CustomeDropdownButton(
                            id: 'id',
                            func: (int value) {
                              BlocProvider.of<AnimalCubit>(context)
                                  .updatePlatoon(platoon: value);
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
                      // print('llllllllllllllllllllllllllllllllllll' * 78);
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
