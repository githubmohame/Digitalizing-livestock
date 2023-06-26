// ignore_for_file: must_be_immutable

part of 'select_muilt_type_cubit.dart';

 abstract class SelectMuiltTypeState {
  List<int> list;
  SelectMuiltTypeState({
    required this.list,
  });
}

class SelectMuiltTypeInitial extends SelectMuiltTypeState {
  SelectMuiltTypeInitial({required  List<int> list}):super(list: list);
}
