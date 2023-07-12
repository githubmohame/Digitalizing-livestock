import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BimetricScreen extends StatelessWidget {
  const BimetricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: Scaffold(backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Center(
          child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.blue),foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)),
            child: const Text("اضغط علي الزر للتاكد من الشخصية"),
            onPressed: ()async {
              
            if( await _checkBiometric()){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) =>const LogIN())) ;
            }
    
            },
          ),
        )),
      ),
    );
  }

  Future<bool> _checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biome trics $e");
    }

    print("biometric is available: $canCheckBiometrics");

    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }

    print("following biometrics are available");
    if (availableBiometrics.isNotEmpty) {
      for (var ab in availableBiometrics) {
        print("\ttech: $ab");
      }
    } else {
      print("no biometrics are available");
    }

    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Touch your finger on the sensor to login',
      );
    } catch (e) {
      print("error using biometric auth: $e");
    }

    print("authenticated: $authenticated");
    return authenticated;
  }
}
