import 'package:dio/dio.dart' as dio;
import 'dart:convert';

Future<List<Map<String, String>>> gavernorate_api() async {
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
  try {
    print('gavernorate :     '+gavernorate);
    dio.Dio dio1 = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap({'filter': gavernorate});
    var res = await dio1.post('http://127.0.0.1:8000/city',
        data: formData,
        queryParameters: <String, dynamic>{},
        options: dio.Options(responseType: dio.ResponseType.json));
    List<Map<String, String>> l1 = List.generate(res.data.length, (index) {
      Map<String, String> map = Map<String, String>();
      map['name'] = res.data[index]['name'];
      print('the test' + map.toString());
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
Future<List<Map<String, String>>> animal_species_api({required String platoon}) async {
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
