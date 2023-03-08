import 'dart:convert';

import 'package:dio/dio.dart' as dio;

void main() async {
  dio.Dio dio1 = dio.Dio();
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
  print(res);
}
