import 'package:bloc/bloc.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:meta/meta.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalInitial> {
  AnimalCubit({required String platoon, required String species})
      : super(AnimalInitial(platoon: platoon, species: species));
  void updatePlatoon({required String platoon}) async {
    List<Map<String, String>> l2 = await animal_species_api(platoon: platoon);
    emit(AnimalInitial(platoon: platoon, species: l2.isNotEmpty?l2[0]['name']??"":''));
  }
}
