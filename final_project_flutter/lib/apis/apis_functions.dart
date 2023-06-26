// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, empty_catches

import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:final_project_year/common_component/button_show_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Future gavernorate_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/governorate',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));
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

Future<List<Map<String, dynamic>>> city_api({required int gavernorate}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': gavernorate});
    var res = await dio1.post('http://127.0.0.1:8000/city',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
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

Future<List<Map<String, dynamic>>> village_api({required int city}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': city});
    var res = await dio1.post('http://127.0.0.1:8000/village',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
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

Future<List<Map<String, dynamic>>> section_type_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/section_type',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));
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

Future<List<Map<String, dynamic>>> farm_type_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/farm_type',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));

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

Future<List<Map<String, dynamic>>> platoon_type_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/platoon',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));

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

Future<List<Map<String, dynamic>>> animal_species_api(
    {required int platoon}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': platoon});
    var res = await dio1.post('http://127.0.0.1:8000/species',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
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

Future<Map<String, dynamic>> modify_gavernorate_api(
    {required Map<String, dynamic> dic1}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(dic1);
    var res = await dio1.post('http://127.0.0.1:8000/modify_gavernorate',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    return res.data;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> modify_city_api(
    {required Map<String, dynamic> dic1}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.FormData formData = dio.FormData.fromMap(dic1);
    var res = await dio1.post('http://127.0.0.1:8000/modify_city',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));

    return res.data;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> modify_village_api(
    {required Map<String, dynamic> dic1}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(dic1);
    var res = await dio1.post('http://127.0.0.1:8000/modify_village',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));

    return res.data;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> modify_platoon_api(
    {required String operation,
    required String platoon,
    required String new_name}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(
        {'operation': operation, 'platoon': platoon, 'new_name': new_name});
    var res = await dio1.post('http://127.0.0.1:8000/modified_platoon',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    return res.data;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> modify_species_api(
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
    var res = await dio1.post('http://127.0.0.1:8000/modified_species',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    return res.data;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> farm_api({
  required dio.FormData form,
}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = form;
    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/farm_api',
            data: formData,
            queryParameters: <String, dynamic>{},
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));

    return res.data!;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> farmer_api({
  required dio.FormData form,
}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = form;
    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/farmer_api',
            data: formData,
            queryParameters: <String, dynamic>{},
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));
    return res.data!;
  } catch (e) {
    //
  }
  return {
    //
  };
}

Future<Map<String, dynamic>> add_farmer_animal_api({
  required dio.FormData form,
}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = form;
    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/add_farme_animal_api',
            data: formData,
            queryParameters: <String, dynamic>{},
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));

    return res.data!;
  } catch (e) {}
  return {};
}

Future<List<Map<String, dynamic>>> location_api({bool stop = false}) async {
  if (stop) {
    return [];
  }
  try {
    dio.Dio dio1 = dio.Dio();

    var res = await dio1.post('http://127.0.0.1:8000/location_api',
        queryParameters: <String, dynamic>{},
        options: dio.Options(
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

Future<List<Map<String, dynamic>>> animal_api() async {
  try {
    dio.Dio dio1 = dio.Dio();

    var res = await dio1.post('http://127.0.0.1:8000/animal_api',
        queryParameters: <String, dynamic>{},
        options: dio.Options(
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

Future<Map<String, dynamic>> change_password_email_api(
    {required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    var res = await dio1.post('http://127.0.0.1:8000/change_password_email',
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

Future<Map<String, dynamic>> change_password_email_done_api(
    {required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/change_password_done',
            queryParameters: <String, dynamic>{},
            data: formData,
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));

    return res.data!;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> connect_farm_farmer_api(
    {required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/connect_farm_farmer_api',
            queryParameters: <String, dynamic>{},
            data: formData,
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));

    return res.data!;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> login_api({required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    var res = await dio1.post('http://127.0.0.1:8000/login_api',
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

Future<Map<String, dynamic>> admin_api({required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/operation_admin_api',
            queryParameters: <String, dynamic>{},
            data: formData,
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));
    return res.data!;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> farm_info_api(
    {required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/operation_admin_api',
            queryParameters: <String, dynamic>{},
            data: formData,
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));
    return res.data!;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> dashBoard() async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/summary_governorate',
            queryParameters: <String, dynamic>{},
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));
    return res.data!;
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> get_data_map(
    {required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    List<Polygon> plogons = [];
    List<Marker> markers = [];
    Response<List> res = await dio1.post<List>(
        "http://127.0.0.1:8000/get_data_map",
        queryParameters: {},
        data: formData,
        options: dio.Options(responseType: ResponseType.json));
    for (var f in res.data!) {
      if (f['center'] != null) {
        Map m = json.decode(f["center"]);
        markers.add(Marker(
          rotate: true,
          anchorPos: AnchorPos.exactly(Anchor(0, 0)),
          rotateAlignment: Alignment.center,
          point: LatLng(m["coordinates"][1], m["coordinates"][0]),
          builder: (context) {
            /*return IconButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.resolveWith(
                    (states) => const Size(3, 3)),
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.blue),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.location_off,
                color: Colors.white,
              ),
            );*/
            return ShowInfoButtom(
              id: f["id"],
              name: f["farm_name"],
              numberOfWorkersInner: f["number_of_workers_inner"],
              numberOfWorkersOuter: f["number_of_workers_outer"],
              sectionType: f["section_type"]["name"],
              totalAreaOfFarm: f["total_area_of_farm"],
              totalCostFarm: f["total_cost_farm"],
            );
          },
        ));
      }
      if (f["location"] != null) {
        Map m = json.decode(f["location"]);
        if (m['type'] == 'MultiPolygon') {
          for (List main1 in m['coordinates']) {
            for (List plog in main1) {
              List<LatLng> points = [];
              for (List p1 in plog) {
                points.add(LatLng(p1[1], p1[0]));
              }
              plogons.add(Polygon(
                  points: points, color: Colors.grey, borderStrokeWidth: 12));
            }
          }
        }
        if (m['type'] == 'Polygon') {
          for (List main1 in m['coordinates']) {
            List<LatLng> points = [];
            for (List p1 in main1) {
              points.add(LatLng(p1[1], p1[0]));
            }
            plogons.add(Polygon(
              points: points,
              color: Colors.grey.withOpacity(0.4),
              borderColor: Colors.black,
              borderStrokeWidth: 5,
              isFilled: true,
            ));
          }
        }
      }
    }
    return {"ploygons": plogons, "markers": markers};
  } catch (e) {}
  return {};
}

Future<Map<String, dynamic>> location_dash_info(
    {required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/location_statistics',
            queryParameters: <String, dynamic>{},
            data: formData,
            options: dio.Options(
              //contentType: ,
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));

    return res.data!;
  } catch (e) {}
  return {};
}

Future<(String, List<Map<String, dynamic>>)?> farm_info_list(
    {required FormData formData, required String url}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.post(
        url.isEmpty ? 'http://127.0.0.1:8000/farm_info_list' : url,
        queryParameters: <String, dynamic>{},
        data: formData,
        options: dio.Options(
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
  } catch (e) {}
  return null;
}

Future<Map<String, dynamic>> farmInfo({required dio.FormData formData}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    dio.Response<Map<String, dynamic>> res =
        await dio1.post('http://127.0.0.1:8000/farm_info',
            queryParameters: <String, dynamic>{},
            data: formData,
            options: dio.Options(
              responseType: dio.ResponseType.json,
              listFormat: dio.ListFormat.multi,
            ));
    return res.data!;
  } catch (e) {}
  return {};
}

Future<List<Map<String, dynamic>>> platoon_type_farm_api(
    {required int farmId}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.post('http://127.0.0.1:8000/farm_platoon_api',
        data: {"farm_id": farmId},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, dynamic>> l1 = List.generate(res.data.length, (index) {
      Map<String, dynamic> map = <String, dynamic>{};
      map['name'] = res.data["data"][index]['name'];
      map['id'] = res.data["data"][index]['id'];
      return map;
    });

    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, dynamic>>> animal_species_farm_api(
    {required int platoon, required int farmId}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData =
        dio.FormData.fromMap({'filter': platoon, "farm_id": farmId});
    var res = await dio1.post('http://127.0.0.1:8000/farm_species_api',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
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

Future<List<Map<String, dynamic>>> animal_farm_api(
    {required int farmId}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    var res = await dio1.post('http://127.0.0.1:8000/animal_farm_api',
        data: FormData.fromMap({"farm_id": farmId}),
        queryParameters: <String, dynamic>{},
        options: dio.Options(
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

Future<List<LatLng>?> add_farm_map_bounder_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    List<LatLng> l1 = [];
    var res = await dio1.get('http://127.0.0.1:8000/farm_map_bounder_api',
        queryParameters: <String, dynamic>{},
        options: dio.Options(
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
      //print(l1);
      return l1;
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future<(List<Map<String, dynamic>>, dynamic?)> search_farm_api(
    {required String? farmerName}) async {
  try {
    dio.Dio dio1 = dio.Dio();

    var res = await dio1.post('http://127.0.0.1:8000/search_farmer_api',
        data: FormData.fromMap({"name": farmerName}),
        queryParameters: <String, dynamic>{},
        options: dio.Options(
          contentType: "application/json",
          responseType: dio.ResponseType.json,
          listFormat: dio.ListFormat.multi,
        ));
    if (res.data is Map) {
      List<Map<String, dynamic>> l1 = [];
      Map<String, dynamic> map = <String, dynamic>{};
       for (Map<String, dynamic> k in res.data["data"]) {
        map['name'] = k['fname'] + k['lname'];
        map['phone'] = k['phone'];
        print(k);
        map['farm_count'] = k['farm_count'];
        l1.add(map);
      }

      return (l1, res.data["next"] );
    }

    //return l1;
  } catch (e) {
    print(e);
  }
  return ([{"":""}], null);
}
