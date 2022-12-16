// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit(
      {required int gavernorate, required int city, required int village})
      : super(ChoiceState(
            city: city, gavernorate: gavernorate, village: village));
  void updateGavernorate(
    int gavernorate,
  ) {
    emit(ChoiceState(city: -1, gavernorate: gavernorate, village: -1));
  }

  void updateCity(
    int city,
  ) {
    emit(ChoiceState(city: city, gavernorate: state.gavernorate, village: 0));
  }

  void updateVillage(
    int village,
  ) {
    emit(ChoiceState(
        city: state.city, gavernorate: state.gavernorate, village: village));
  }
}
