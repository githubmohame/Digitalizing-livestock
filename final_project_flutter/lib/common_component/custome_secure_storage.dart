import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomeSecureStorage {
  static FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  static void setssn({required String ssn}) {
    flutterSecureStorage.write(key: 'ssn', value: ssn);
  }

  static Future<String> getssn() async {
    return await flutterSecureStorage.read(key: 'ssn') ?? '';
  }

  static void setpassword({required String password}) {
    flutterSecureStorage.write(key: 'password', value: password);
    print(password);
  }

  static Future<String> getpassword() async {
    print(await flutterSecureStorage.read(key: 'password') );
    return await flutterSecureStorage.read(key: 'password') ?? '';
  }
}
