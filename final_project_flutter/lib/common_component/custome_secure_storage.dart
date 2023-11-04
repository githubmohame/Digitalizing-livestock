
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
  static void settotp({required String totp}) async{
    await flutterSecureStorage.write(key: 'totp', value: totp);
  }
  static Future<String> gettotp( ) async{
   return await flutterSecureStorage.read(key:"totp" )??"";
  }
  static Future<String> getpassword() async {
    return await flutterSecureStorage.read(key: 'password') ?? '';
  }
static Future< void> remove_all(
      ) async {
    
      FlutterSecureStorage storage = const FlutterSecureStorage();

      await storage.deleteAll();
      return null;
}
static Future<String> getauth() async {
    return await flutterSecureStorage.read(key: 'user_auth') ?? '';
  } 
  static void setauth({required String user_auth}) async{
    await flutterSecureStorage.write(key: 'user_auth', value: user_auth);
  }
  static Future<int?> getauthCount() async {
    return int.parse((await flutterSecureStorage.read(key: 'user_auth_count')).toString()) ;
  } 
  static void setauthCount({required int user_auth}) async{
    await flutterSecureStorage.write(key: 'user_auth_count', value: user_auth.toString());
  }
}
