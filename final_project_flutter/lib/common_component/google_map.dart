import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class GoogleMapComponent extends StatefulWidget {
  GoogleMapComponent({super.key});
  LatLng? point;
  String? file;
  @override
  State<GoogleMapComponent> createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFF857e7b))),
                child: Text(
                  'ادخال الاحداثيات',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFF857e7b))),
                child: Text(
                  'اخذ الاحداث اللحالي',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Position p = await _determinePosition();
                  widget.point = LatLng(p.latitude, p.longitude);
                  setState(() {});
                },
              ),
            ),
            Container(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Color(0xFF857e7b))),
                child: Text(
                  'تحميل ملف سيغه shape file',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: [
                        'geojson',
                        'json',
                        'zip',
                      ]);
                  if (result is FilePickerResult) {
                    PlatformFile r1 = result.files[0];
                    widget.file = r1.path;
                    if (widget.file is String) {
                      widget.point = null;
                    }
                    setState(() {});
                  }
                },
              ),
            )
          ],
        ),
        Container(
          height: 300 - 32,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(27, 24),
              zoom: 5,
              onTap: (tapPosition, point) {
                widget.point = point;
                widget.file = null;
                setState(() {});
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                markers: widget.point is LatLng
                    ? [
                        Marker(
                            height: 200,
                            width: 200,
                            point: widget.point!,
                            builder: (context) => Icon(Icons.location_on))
                      ]
                    : [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<Position> _determinePosition() async {
    Position p = await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
    );
    widget.point = LatLng(p.latitude, p.longitude);
    setState(() {});
   
    LocationPermission permission = await Geolocator.requestPermission();
    bool serviceEnabled;
    // Test if location services are enabled.
   
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    } 
     
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print('done' * 123);
     return p;
  }
}
