import 'package:dio/dio.dart' as dio;
import 'dart:convert';

Future gavernorate_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/governorate',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> city_api(
    {required String gavernorate}) async {
  print('api call');
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': gavernorate});
    var res = await dio1.post('http://127.0.0.1:8000/city',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {
    print(e);
  }
  return [];
}

Future<List<Map<String, String>>> village_api({required String city}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': city});
    var res = await dio1.post('http://127.0.0.1:8000/village',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> section_type_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/section_type',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> farm_type_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/farm_type',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> platoon_type_api() async {
  try {
    dio.Dio dio1 = dio.Dio();
    var res = await dio1.get('http://127.0.0.1:8000/platoon',
        data: {}, options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> animal_species_api(
    {required String platoon}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': platoon});
    var res = await dio1.post('http://127.0.0.1:8000/species',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> modify_gavernorate_api(
    {required Map<String, dynamic> dic1}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(dic1);
    var res = await dio1.post('http://127.0.0.1:8000/modify_gavernorate',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      print('doneeee');
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> modify_city_api(
    {required Map<String, dynamic> dic1}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(dic1);
    var res = await dio1.post('http://127.0.0.1:8000/modify_city',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> modify_village_api(
    {required Map<String, dynamic> dic1}) async {
  try {
    print('kkiii');
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(dic1);
    var res = await dio1.post('http://127.0.0.1:8000/modify_village',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> modify_platoon_api(
    {required String operation,
    required String platoon,
    required String new_name}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(
        {'operation': operation, 'platton': platoon, 'new_name': new_name});
    var res = await dio1.post('http://127.0.0.1:8000/modified_platoon',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<List<Map<String, String>>> modify_species_api(
    {required String operation,
    required String species,
    required String new_name}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(
        {'operation': operation, 'species': species, 'new_name': new_name});
    var res = await dio1.post('http://127.0.0.1:8000/modified_species',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      return map;
    });
    return l1;
  } catch (e) {}
  return [];
}

Future<dio.Response> farm_api({
  required dio.FormData form,
}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = form;
    var res = await dio1.post('http://127.0.0.1:8000/farm_api',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(
          responseType: dio.ResponseType.json,
          listFormat: dio.ListFormat.multi,
        ));

    return res;
  } catch (e) {}
  return dio.Response(requestOptions: dio.RequestOptions());
}

Future<dio.Response> farmer_api({
  required dio.FormData form,
}) async {
  try {
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = form;
    var res = await dio1.post('http://127.0.0.1:8000/farmer_api',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(
          responseType: dio.ResponseType.json,
          listFormat: dio.ListFormat.multi,
        ));

    return res;
  } catch (e) {}
  return dio.Response(requestOptions: dio.RequestOptions());
}
