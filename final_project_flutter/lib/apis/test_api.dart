// ignore_for_file: unused_local_variable

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:dio/dio.dart' as dio;

void main() async {
  dio.Dio dio1 = dio.Dio();
  List<Polygon> plogons = [];
  var res = await dio1.post("http://192.168.1.6:8000/get_data_map");
  for (Map<String, dynamic> f in res.data) {
    if (f["location"].runtimeType == List) {
      for (List f2 in f["location"]["coordinates"]) {
        for (List f3 in f2) {
          List<LatLng> points = [];
          for (List f4 in f3) {
            points.add(LatLng(f2[0], f2[1]));
          }
          plogons.add(Polygon(points: points));
        }
      }
    }
  }
   
  }

  /*dio.Dio dio1 = dio.Dio();
  dio.FormData formData = dio.FormData.fromMap({
    'geometry': json.encode({
      "type": "Point",
      "coordinates": [125.6, 10.1]
    }),
    'attached_area': 12,
    r'farm_type': json.encode(['انتاج طلايع', 'انتاج البان']),
    'isolated_wards': 30,
    'number_of_arc': 30,
    'number_of_workers': 78,
    'playground': 12,
    'section_type': 'خاص',
    'wards': 40,
    'village': 'الجهاد 4'
  }, dio.ListFormat.multi, false);
  var res = await dio1.post('http://127.0.0.1:8000/insert_farm',
      data: formData,
      queryParameters: <String, dynamic>{},
      options: dio.Options(
        responseType: dio.ResponseType.json,
        listFormat: dio.ListFormat.multi,
      ));
  */
//}
