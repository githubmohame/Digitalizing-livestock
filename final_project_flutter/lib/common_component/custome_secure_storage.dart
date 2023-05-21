
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomeSecureStorage {
  static FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
  static void setssn({required String ssn}) {
    flutterSecureStorage.write(key: 'ssn', value: ssn);
  }

  static Future<String> getssn() async {
    return await flutterSecureStorage.read(key: 'ssn') ?? '';
  }

  static void setpassword({required String password}) {
    flutterSecureStorage.write(key: 'password', value: password);
  }

  static Future<String> getpassword() async {
    return await flutterSecureStorage.read(key: 'password') ?? '';
  }
static Future<List<Map<String, dynamic>>?> remove_all(
      ) async {
    
      FlutterSecureStorage storage = const FlutterSecureStorage();

      await storage.deleteAll();
      return null;

 
 

  }
}
