part of 'connect_farmer_farm_cubit.dart';

@immutable
abstract class ConnectFarmerFarmState {
  int ssn;
  String farmCode;
  bool female;
  double cost;
  String subtype;
  int totalAnimal;
  String village;
  ConnectFarmerFarmState({
    required this.ssn,
    required this.farmCode,
    required this.female,
    required this.cost,
    required this.subtype,
    required this.totalAnimal,
    required this.village,
  });
}

// ignore: must_be_immutable
class ConnectFarmerFarmInitial extends ConnectFarmerFarmState {
  ConnectFarmerFarmInitial(
      {super.village='',super.ssn = 0,
      super.cost = 0,
      super.farmCode = "0",
      super.female = false,
      super.subtype = "",
      super.totalAnimal = 0});
}

class ConnectFarmerFarmDelete extends ConnectFarmerFarmState {
  ConnectFarmerFarmDelete(
      {super.village='',super.ssn = 0,
      super.cost = 0,
      super.farmCode = "0",
      super.female = false,
      super.subtype = "",
      super.totalAnimal = 0});
}
