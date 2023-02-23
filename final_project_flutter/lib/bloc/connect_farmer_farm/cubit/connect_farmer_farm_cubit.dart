import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connect_farmer_farm_state.dart';

class ConnectFarmerFarmCubit extends Cubit<ConnectFarmerFarmState> {
  ConnectFarmerFarmCubit() : super(ConnectFarmerFarmInitial());
  void delete({ 
    required int ssn,
    required  String farmCode,
    required bool female,
    required double cost,
    required String subtype,
    required int totalAnimal,
  }) {
    emit(ConnectFarmerFarmDelete(
        cost: cost, farmCode: farmCode, female: female,ssn: ssn,subtype: subtype,totalAnimal: totalAnimal ));
  }
}
