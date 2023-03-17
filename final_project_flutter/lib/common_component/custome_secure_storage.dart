import 'dart:convert';

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
  }

  static Future<String> getpassword() async {
    return await flutterSecureStorage.read(key: 'password') ?? '';
  }

  static void setlocation({required Map<String, dynamic> map}) async {
    try {
      await flutterSecureStorage.write(
          key: 'location', value: json.encode(map));
    } catch (e) {
      print(e);
    }

    print(await getlocation());
  }

  static Future<Map<String, dynamic>?> getlocation() async {
    try {
      return json.decode(
              (await flutterSecureStorage.read(key: 'location')).toString()) ??
          '';
    } catch (e) {
      print(e);
      return null;
    }
  }

  static void setgovernorate({required List<Map<String, dynamic>> map}) {
    flutterSecureStorage.write(key: 'governorate', value: json.encode(map));
    //print(map);
  }

  static Future<List<Map<String, dynamic>>?> getgovernorate() async {
    try {
      List l1 = json.decode(
              (await flutterSecureStorage.read(key: 'governorate'))
                  .toString()) ??
          '';
      List<Map<String, dynamic>> l2 =
          List<Map<String, dynamic>>.generate(l1.length, (index) => l1[index]);
      //print(l2[0].runtimeType);
      return l2;
    } catch (e) {
      return null;
    }
  }

  static void setupdate_governorate() {
    flutterSecureStorage.write(
        key: 'update_governorate', value: true.toString());
    //print(map);
  }

  static Future<bool> getupdate_governorate() async {
    try {
      bool f = await flutterSecureStorage.read(key: 'update_governorate') ==
          true.toString();
      flutterSecureStorage.delete(key: 'update_governorate');
      return f;
    } catch (e) {
      return false;
    }
  }

static void setupdate_city() {
    flutterSecureStorage.write(
        key: 'update_city', value: true.toString());
    //print(map);
  }

  static Future<bool> getupdate_city() async {
    try {
      bool f = await flutterSecureStorage.read(key: 'update_city') ==
          true.toString();
      flutterSecureStorage.delete(key: 'update_city');
      return f;
    } catch (e) {
      return false;
    }
  }

static void setupdate_village() {
      flutterSecureStorage.write(
        key: 'update_village', value: true.toString());
    //print(map);
  }

  static Future<bool> getupdate_village() async {
    try {
      bool f = await flutterSecureStorage.read(key: 'update_village') ==
          true.toString();
      flutterSecureStorage.delete(key: 'update_village');
      return f;
    } catch (e) {
      return false;
    }
  }

  static void setcity(
      {required List<Map<String, dynamic>> map,
      required String governorate}) async {
    String s1 =
        (await flutterSecureStorage.read(key: 'governorate_city')).toString();
    await flutterSecureStorage.delete(key: s1);

    await flutterSecureStorage.write(
        key: 'governorate_city', value: governorate);
    flutterSecureStorage.write(key: governorate, value: json.encode(map));
  }

  static Future<List<Map<String, dynamic>>?> getcity(
      {required String city}) async {
    try {
      List l1 =
          json.decode((await flutterSecureStorage.read(key: city)).toString());

      List<Map<String, dynamic>> l2 =
          List<Map<String, dynamic>>.generate(l1.length, (index) => l1[index]);
      return l2;
    } catch (e) {
      return null;
    }
  }

  static void setvillage(
      {required List<Map<String, dynamic>> map, required String city}) async {
    String s1 =
        (await flutterSecureStorage.read(key: 'city_village')).toString();
    await flutterSecureStorage.delete(key: s1);

    await flutterSecureStorage.write(key: 'city_village', value: city);
    flutterSecureStorage.write(key: city, value: json.encode(map));
  }

  static Future<List<Map<String, dynamic>>?> getvillage(
      {required String city}) async {
    try {
      List l1 =
          json.decode((await flutterSecureStorage.read(key: city)).toString());

      List<Map<String, dynamic>> l2 =
          List<Map<String, dynamic>>.generate(l1.length, (index) => l1[index]);
      return l2;
    } catch (e) {
      return null;
    }
  }
}
