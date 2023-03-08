// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:final_project_year/apis/apis_functions.dart';

part 'choice_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(
      {required String gavernorate,
      required String city,
      required String village})
      : super(LocationState(
            city: city, gavernorate: gavernorate, village: village));
  void updateGavernorate(
    String gavernorate,
  ) async {
    List<Map<String, String>> l2 = [];
    if (state.gavernorate != gavernorate) {
      List<Map<String, String>> l1 = await city_api(gavernorate: gavernorate);
      if (l1.isNotEmpty) {
        List<Map<String, String>> l2 = await village_api(city: l1[0]['name']!);
        emit(LocationState(
            city: l1[0]['name']!,
            gavernorate: gavernorate,
            village: l2[0]['name']!));
        return  ;
      }

      emit(LocationState(city: '', gavernorate: gavernorate, village: ''));
    }
  }

  void updateCity(
    String city,
  ) async {
    if (state.city != city) {
      List<Map<String, String>> l2 = await village_api(city: city);
      if (l2.isNotEmpty) {
        emit(LocationState(
            city: city,
            gavernorate: state.gavernorate,
            village: l2[0]['name']!));
        return;
      }

      emit(LocationState(
          city: city, gavernorate: state.gavernorate, village: l2[0]['name']!));
    }
  }

  void updateVillage(
    String village,
  ) {
    emit(LocationState(
        city: state.city, gavernorate: state.gavernorate, village: village));
  }
}
