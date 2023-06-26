import 'package:bloc/bloc.dart';

part 'select_muilt_type_state.dart';

class SelectMuiltTypeCubit extends Cubit<SelectMuiltTypeState> {
  SelectMuiltTypeCubit({required List<int> list})
      : super(SelectMuiltTypeInitial(list: list));
  void addToList(int number) {
    List<int> list = state.list;
    list.add(number);
    emit(SelectMuiltTypeInitial(list: list));
  }

  void removeToList(int number) {
    List<int> list = state.list;
    list.remove(number);
    emit(SelectMuiltTypeInitial(list: list));
  }

  List<int> retutnList() {
    return state.list;
  }
}
