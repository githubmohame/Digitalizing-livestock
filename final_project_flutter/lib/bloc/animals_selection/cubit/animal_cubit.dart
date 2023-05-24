// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:final_project_year/apis/apis_functions.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalInitial> {
  AnimalCubit({required int platoon, required int species})
      : super(AnimalInitial(platoon: platoon, species: species));
  void updatePlatoon({required int platoon}) async {
    List<Map<String, dynamic>> l2 = await animal_species_api(platoon: platoon);
    emit(AnimalInitial(platoon: platoon, species: l2.isNotEmpty?l2[0]['name']?? -1:-1));
  }
}
