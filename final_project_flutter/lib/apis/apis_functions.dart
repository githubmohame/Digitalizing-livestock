// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, empty_catches

import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:final_project_year/common_component/create_map_component.dart';
import 'package:final_project_year/common_component/custome_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:otp/otp.dart';

class Api {
  static String url = "http://192.168.1.6:8000/";
  static Future<Map<String, String>> createHeader() async {
    return {
      //"code": await CustomeSecureStorage.gettotp(),
      //"password": await CustomeSecureStorage.getpassword(),
      "ssn": await CustomeSecureStorage.getssn(),
      "totpy": OTP.generateTOTPCodeString(await CustomeSecureStorage.gettotp(),
          DateTime.now().millisecondsSinceEpoch,
          algorithm: Algorithm.SHA1, isGoogle: true, interval: 60),
    };
  }

  static Future gavernorate_api() async {
    try {
      dio.Dio dio1 = dio.Dio();
      var res = await dio1.get(Api.url + 'governorate',
          data: {},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];
        return map;
      });
       return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> city_api(
      {required int gavernorate}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap({'filter': gavernorate});
      var res = await dio1.post(Api.url + 'city',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];
        return map;
      });
      return l1;
    } catch (e) {
     }
    return [];
  }

  static Future<List<Map<String, dynamic>>> village_api(
      {required int city}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap({'filter': city});
      var res = await dio1.post(Api.url + 'village',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];
        return map;
      });
      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> section_type_api() async {
    try {
      dio.Dio dio1 = dio.Dio();
      var res = await dio1.get(Api.url + 'section_type',
          data: {},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];
        return map;
      });
      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> farm_type_api() async {
    try {
      dio.Dio dio1 = dio.Dio();
      var res = await dio1.get(Api.url + 'farm_type',
          data: {},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));

      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];

        return map;
      });

      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> platoon_type_api() async {
    try {
      dio.Dio dio1 = dio.Dio();
      var res = await dio1.get(Api.url + 'platoon',
          data: {},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));

      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];
        return map;
      });

      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> animal_species_api(
      {required int platoon}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap({'filter': platoon});
      var res = await dio1.post(Api.url + 'species',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data[index]['name'];
        map['id'] = res.data[index]['id'];
        return map;
      });

      return l1;
    } catch (e) {}
    return [];
  }

  static Future<Map<String, dynamic>> modify_gavernorate_api(
      {required Map<String, dynamic> dic1}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap(dic1);
      var res = await dio1.post(Api.url + 'modify_gavernorate',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> modify_city_api(
      {required Map<String, dynamic> dic1}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.FormData formData = dio.FormData.fromMap(dic1);
      var res = await dio1.post(Api.url + 'modify_city',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));

      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> modify_village_api(
      {required Map<String, dynamic> dic1}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap(dic1);
      var res = await dio1.post(Api.url + 'modify_village',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));

      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> modify_platoon_api(
      {required String operation,
      required String platoon,
      required String new_name}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap(
          {'operation': operation, 'platoon': platoon, 'new_name': new_name});
      var res = await dio1.post(Api.url + 'modified_platoon',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> modify_species_api(
      {required String operation,
      required int species,
      int? platoon,
      required String new_name}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap({
        'operation': operation,
        'species': species,
        'new_name': new_name,
        'platoon': platoon
      });
      var res = await dio1.post(Api.url + 'modified_species',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> farm_api({
    required dio.FormData form,
  }) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = form;
      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'farm_api',
              data: formData,
              queryParameters: <String, dynamic>{},
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));

      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> farmer_api({
    required dio.FormData form,
  }) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = form;
      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'farmer_api',
              data: formData,
              queryParameters: <String, dynamic>{},
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multiCompatible,
              ));
      return res.data!;
    } catch (e) {}
    return {
      //
    };
  }

  static Future<Map<String, dynamic>> add_farmer_animal_api({
    required dio.FormData form,
  }) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData = form;
      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'add_farme_animal_api',
              data: formData,
              queryParameters: <String, dynamic>{},
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));

      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<List<Map<String, dynamic>>> location_api(
      {bool stop = false}) async {
    if (stop) {
      return [];
    }
    try {
      dio.Dio dio1 = dio.Dio();

      var res = await dio1.post(Api.url + 'location_api',
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));

      List<Map<String, dynamic>> l1 = [];
      Map<String, dynamic> map = <String, dynamic>{};
      map['governorate'] = res.data['city']['governorate_id'];

      map['city'] = res.data['city']['id'];
      map['village'] = res.data['id'];
      l1.add(map);
      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> animal_api() async {
    try {
      dio.Dio dio1 = dio.Dio();

      var res = await dio1.post(Api.url + 'animal_api',
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      if (res.data is Map) {
        List<Map<String, dynamic>> l1 = [];
        Map<String, dynamic> map = <String, dynamic>{};
        map['id'] = res.data['id'];
        map['platoon'] = res.data['platoon'];
        l1.add(map);
        return l1;
      }
      List<Map<String, dynamic>> l1 = [];
      Map<String, dynamic> map = <String, String>{};
      map['species'] = res.data['id'];
      map['platoon'] = res.data['platoon'];
      l1.add(map);
      return l1;
    } catch (e) {}
    return [];
  }

  static Future<Map<String, dynamic>> change_password_email_api(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      var res = await dio1.post(Api.url + 'change_password_email',
          queryParameters: <String, dynamic>{},
          data: formData,
          options: dio.Options(
            headers: await Api.createHeader(),
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));

      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> change_password_email_done_api(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'change_password_done',
              queryParameters: <String, dynamic>{},
              data: formData,
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));

      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> connect_farm_farmer_api(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'connect_farm_farmer_api',
              queryParameters: <String, dynamic>{},
              data: formData,
              options: dio.Options(
                //headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));

      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> login_api(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();
       var res = await dio1.post(Api.url + 'login_api',
          queryParameters: <String, dynamic>{},
          data: formData,
          options: dio.Options(
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      return res.data;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> admin_api(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'admin_api',
              queryParameters: <String, dynamic>{},
              data: formData,
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));
      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> farm_info_api(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'operation_admin_api',
              queryParameters: <String, dynamic>{},
              data: formData,
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));
      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> dashBoard() async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'summary_governorate',
              queryParameters: <String, dynamic>{},
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));
       return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<Map<String, dynamic>> get_data_map(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      List<Polygon> plogons = [];
      List<Marker> markers = [];
      Response<List> res = await dio1.post<List>(Api.url + "get_data_map",
          queryParameters: {},
          data: formData,
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: ResponseType.json));
      for (var f in res.data!) {
        if (f['center'] != null) {
          markers.add(createMarker(f));
        }
        if (f["location"] != null) {
          createPolygon(plogons, f);
        }
      }
       return {"ploygons": plogons, "markers": markers};
    } catch (e) {
     }
    return {};
  }

  static Future<Map<String, dynamic>> location_dash_info(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'location_statistics',
              queryParameters: <String, dynamic>{},
              data: formData,
              options: dio.Options(
                headers: await Api.createHeader(),
                //contentType: ,
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));

      return res.data!;
    } catch (e) {}
    return {};
  }

  static Future<(String, List<Map<String, dynamic>>)?> farm_info_list(
      {required FormData formData, required String url}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      var res = await dio1.post(url.isEmpty ? Api.url + 'farm_info_list' : url,
          queryParameters: <String, dynamic>{},
          data: formData,
          options: dio.Options(
            headers: await Api.createHeader(),
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      List<Map<String, dynamic>> l1 = [];

       
      for (var i in res.data["data"]) {
        Map<String, dynamic> map = <String, dynamic>{};
        map["animal_sub_type"] = i["animal_sub_type"]["name"];
        map["animal_number"] = i['animal_number'];
        map["is_male"] = i['is_male'];
        map['date'] = i['date'];
        l1.add(map);
      }
       return (res.data["next"].toString(), l1);
    } catch (e) {
     }
    return null;
  }

  static Future<Map<String, dynamic>> farmInfo(
      {required dio.FormData formData}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      dio.Response<Map<String, dynamic>> res =
          await dio1.post(Api.url + 'farm_info',
              queryParameters: <String, dynamic>{},
              data: formData,
              options: dio.Options(
                headers: await Api.createHeader(),
                responseType: dio.ResponseType.json,
                listFormat: dio.ListFormat.multi,
              ));
     
      return res.data!;
    } catch (e) {
     }
    return {};
  }

  static Future<List<Map<String, dynamic>>> platoon_type_farm_api(
      {required String farmId}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      var res = await dio1.post(Api.url + 'farm_platoon_api',
          data: {"farm_id": farmId},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      
      List<Map<String, dynamic>> l1 =
          List.generate(res.data["data"].length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data["data"][index]['name'];
        map['id'] = res.data["data"][index]['id'];
        return map;
      });

      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> animal_species_farm_api(
      {required int platoon, required String farmId}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      dio.FormData formData =
          dio.FormData.fromMap({'filter': platoon, "farm_id": farmId});
      var res = await dio1.post(Api.url + 'farm_species_api',
          data: formData,
          queryParameters: <String, dynamic>{},
          options: dio.Options(
              headers: await Api.createHeader(),
              responseType: dio.ResponseType.json));
      List<Map<String, dynamic>> l1 =
          List.generate(res.data["data"].length, (index) {
        Map<String, dynamic> map = <String, dynamic>{};
        map['name'] = res.data["data"][index]['name'];
        map['id'] = res.data["data"][index]['id'];

        return map;
      });
      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<Map<String, dynamic>>> animal_farm_api(
      {required String farmId}) async {
    try {
      dio.Dio dio1 = dio.Dio();

      var res = await dio1.post(Api.url + 'animal_farm_api',
          data: FormData.fromMap({"farm_id": farmId}),
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            contentType: "application/json",
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      if (res.data is Map) {
        List<Map<String, dynamic>> l1 = [];
        Map<String, dynamic> map = <String, dynamic>{};
        map['id'] = res.data['id'];
        map['platoon'] = res.data['platoon'];
        l1.add(map);
        return l1;
      }
      List<Map<String, dynamic>> l1 = [];
      Map<String, dynamic> map = <String, String>{};
      map['species'] = res.data['id'];
      map['platoon'] = res.data['platoon'];
      l1.add(map);
      return l1;
    } catch (e) {}
    return [];
  }

  static Future<List<LatLng>?> add_farm_map_bounder_api() async {
    try {
      dio.Dio dio1 = dio.Dio();
      List<LatLng> l1 = [];
      var res = await dio1.get(Api.url + 'farm_map_bounder_api',
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      if (res.data is Map) {
        for (List l in res.data["map"]) {
          try {
            for (List ln in l) {
              try {
                for (List ln2 in ln) {
                  l1.add(LatLng(ln2[0], ln2[1]));
                }
              } catch (e) {
                l1.add(LatLng(ln[1], ln[0]));
              }
            }
          } catch (e) {
            l1.add(LatLng(l[1], l[0]));
          }
        }
         return l1;
      }
    } catch (e) {
     }
    return null;
  }

  static Future<(List<Map<String, dynamic>>, dynamic)?> search_farmer_api(
      {required String? farmerName, required String? url}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      if (url == null) {
        return null;
      }
      if (url == '') {
        url = Api.url + 'search_farmer_api';
      }
      var res = await dio1.post(url,
          data: FormData.fromMap({"name": farmerName}),
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            contentType: "application/json",
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
       if (res.data is Map) {
        List<Map<String, dynamic>> l1 = [];

        for (Map<String, dynamic> k in res.data["data"]) {
          Map<String, dynamic> map = <String, dynamic>{};
          map["ssn"] = k["ssn"];
          map['name'] = k['fname'] + " " + k['lname'];
          map['phone'] = k['phone'];
          map['farm_count'] = k['farm_count'];
          l1.add(map);
        }

        return (l1, res.data["next"]);
      }

      //return l1;
    } catch (e) {
     }
    return (
      [
        {"": ""}
      ],
      null
    );
  }

  static Future<(List<Map<String, dynamic>>, dynamic)?> search_farm_api(
      {required String? farmerName, required String? url, String? ssn}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      if (url == null) {
        return null;
      }
      if (url == '') {
        url = Api.url + 'search_farm_api';
      }
      Map<String, dynamic> map = {};

      if (ssn is String) {
        map["ssn"] = ssn;
      }
      map["name"] = farmerName;
      map["auth"] = (await CustomeSecureStorage.getauth());
      var res = await dio1.post(url,
          data: FormData.fromMap(map),
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            contentType: "application/json",
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      if (res.data is Map) {
        List<Map<String, dynamic>> l1 = [];

        for (Map<String, dynamic> k in res.data["data"]) {
          Map<String, dynamic> map = <String, dynamic>{};
          map["id"] = k["id"];
          map['farm_name'] = k['farm_name'];
          map['workers'] =
              k['number_of_workers_inner'] + k['number_of_workers_outer'];
          map['village'] = k['village']["name"];
          map['city'] = k['village']["city"]["name"];
          map["governorate"] = k["village"]["city"]["governorate"]["name"];
          map['section_type'] = k['section_type']["name"];
          l1.add(map);
        }
        return (l1, res.data["next"]);
      }

      //return l1;
    } catch (e) {
     }
    return null;
  }

  static Future<ImageProvider<Object>> image_farmer_api(
      {required String ssn}) async {
    Map<String, String> u = (await Api.createHeader());
    Map<String, String> header = <String, String>{"ssn": ssn};
    header.addAll(u);
    return NetworkImage(
      Api.url + "img_farmer_api",
      headers: header,
    );
  }

  static Future<bool> check_totp_api() async {
    try {
      Map<String, String> header = <String, String>{
        "ssn": await CustomeSecureStorage.getssn(),
        "password": await CustomeSecureStorage.getpassword(),
        "totp": await CustomeSecureStorage.gettotp(),
      };
      Dio dio1 = Dio();
      var res = await dio1.get(Api.url + "check_totp",
          options: dio.Options(
            headers: header,
          ));
       return res.data["find"];
    } catch (e) {
       return false;
    }
  }

  static Future<Map<String, dynamic>> send_email_totp() async {
    try {
      Map<String, String> header = <String, String>{
        "ssn": await CustomeSecureStorage.getssn(),
        "password": await CustomeSecureStorage.getpassword(),
      };
      Dio dio1 = Dio();
      var res = await dio1.post(Api.url + "change_password_email_template",
          options: dio.Options(
            headers: header,
          ));
      return res.data;
    } catch (e) {
      return {"error": "يوجد مشاكل في الخدمة"};
    }
  }

  static Future<List<Map<String, dynamic>>> user_athority() async {
    try {
      Map<String, String> header = await createHeader();
      Dio dio1 = Dio();
      var res = await dio1.post(Api.url + "user_group",
          options: dio.Options(
            headers: header,
          ));
      List<Map<String, dynamic>> list = [];
      for (Map<String, dynamic> map in res.data) {
        list.add(map);
      }
      return list;
    } catch (e) {
       return [
        {"error": "يوجد مشاكل في الخدمة"}
      ];
    }
  }

  static Future<(List<Map<String, dynamic>>, dynamic)?>
      search_farm_google_map_api({required String? url, String? search}) async {
    try {
      dio.Dio dio1 = dio.Dio();
      if (url == null) {
        return null;
      }
      if (url == '') {
        url = Api.url + 'search_google_map';
      }
      Map<String, dynamic> map = {};

      if (search is String) {
        map["search"] = search;
      }
      //map["name"] = farmerName;
      //map["auth"] = (await CustomeSecureStorage.getauth());
      var res = await dio1.post(url,
          data: FormData.fromMap(map),
          queryParameters: <String, dynamic>{},
          options: dio.Options(
            headers: await Api.createHeader(),
            contentType: "application/json",
            responseType: dio.ResponseType.json,
            listFormat: dio.ListFormat.multi,
          ));
      if (res.data is Map) {
         List<Map<String, dynamic>> l1 = [];

        for (Map<String, dynamic> k in res.data["data"]) {
          Map<String, dynamic> map = <String, dynamic>{};
           var lk=json.decode(k["center"])  ;
          map["id"] = k["id"];
          map["center"] = LatLng (lk["coordinates"][1] , lk["coordinates"][0]  );
           map['farm_name'] = k['farm_name'];
          // map['workers'] = k['number_of_workers_inner'] + k['number_of_workers_outer'];
          map['village'] = k['village']["name"];
          map['city'] = k['village']["city"]["name"];
          map["governorate"] = k["village"]["city"]["governorate"]["name"];
          //map['section_type'] = k['section_type']["name"];
          l1.add(map);
        }
        return (l1, res.data["next"]);
      }

      //return l1;
    } catch (e) {
     }
    return null;
  }
}
