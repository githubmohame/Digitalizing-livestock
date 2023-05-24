// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:final_project_year/apis/apis_functions.dart';

part 'choice_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(
      {required int gavernorate,
      required int city,
      required int village})
      : super(LocationState(
            city: city, gavernorate: gavernorate, village: village));
  void updateGavernorate(
    int gavernorate,
  ) async {
    if (state.gavernorate != gavernorate) {
      List<Map<String, dynamic>> l1 = await city_api(gavernorate: gavernorate);
      if (l1.isNotEmpty) {
        List<Map<String, dynamic>> l2 = await village_api(city: l1[0]['id']!);
         
        emit(LocationState(
            city: l1.isNotEmpty?l1[0]['id']!:-1,
            gavernorate: gavernorate,
            village: l2.isNotEmpty?l2[0]['id']!:-1));
        return;
      }

      emit(LocationState(city:-1, gavernorate: gavernorate, village:-1));
    }
  }

  void updateCity(
    int city,
  ) async {
    if (state.city != city) {
      List<Map<String, dynamic>> l2 = await village_api(city: city);
      if (l2.isNotEmpty) {
        print("en" * 67);
        emit(LocationState(
            city: city, gavernorate: state.gavernorate, village: l2[0]['id']!));
        return;
      }
      print("out" * 67);
      emit(LocationState(
          city: city, gavernorate: state.gavernorate, village: -1));
    }
  }

  void updateVillage(
    int village,
  ) {
    emit(LocationState(
        city: state.city, gavernorate: state.gavernorate, village: village));
  }
}
