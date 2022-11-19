part of 'select_muilt_type_cubit.dart';

@immutable
abstract class SelectMuiltTypeState {
  List<int> list;
  SelectMuiltTypeState({
    required this.list,
  });
}

class SelectMuiltTypeInitial extends SelectMuiltTypeState {
  SelectMuiltTypeInitial({required  List<int> list}):super(list: list){

  }
}
