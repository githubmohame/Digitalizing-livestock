import 'package:file_picker/file_picker.dart';
import 'package:final_project_year/common_component/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class GoogleMapComponentFarmScreen extends StatefulWidget {
  GoogleMapComponentFarmScreen({super.key});
  LatLng? point;
  String? file;
  List<LatLng> list1 = [];
  Polygon plogon = Polygon(points: []);
  bool draw = false;
  @override
  State<GoogleMapComponentFarmScreen> createState() =>
      _GoogleMapComponentFarmScreenState();
}

class _GoogleMapComponentFarmScreenState
    extends State<GoogleMapComponentFarmScreen> {
  Future<Style> _readStyle() => StyleReader(
        uri:
            'https://api.maptiler.com/maps/basic-v2/style.json?key=QYQUEU69gtldW1rv100f',
        apiKey: '',
      ).read();
  Style? _style;
  Object? _error;
  void _initStyle() async {
    try {
      _style = await _readStyle();
    } catch (e, stack) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(stack);
      _error = e;
    }
    setState(() {});
  }

  @override
  void initState() {
    _initStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("hellow");
                widget.draw = !widget.draw;
                widget.draw ? widget.point = null : null;
                setState(() {});
              },
              child: Icon(Icons.rectangle_sharp),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => widget.draw ? Colors.green : Colors.blue)),
            ),
            Container(
              width: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blue)),
              child: Text(
                'اخذ الاحداث اللحالي',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Position p = await _determinePosition();
                widget.point = LatLng(p.latitude, p.longitude);
                widget.list1 = [];
                setState(() {});
              },
            ),
            Container(
              width: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blue)),
              child: Text(
                'تحميل ملف سيغه shape file',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                    widget.list1 = [];
                  }
                  setState(() {});
                }
              },
            )
          ],
        ),
        Container(
          height: 350 - 18,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(31.582677, 25.157003),
              maxZoom: 6,
              onMove: (tapPosition, point) {
                /*
                if (!widget.draw) return null;
                widget.list1[2] = point;
                widget.list1[1] =
                    LatLng(point.latitude, widget.list1[0].longitude);
                widget.list1[3] =
                    LatLng(widget.list1[0].latitude, point.longitude);

                widget.plogon = Polygon(
                    points: widget.list1,
                    borderColor: Colors.black,
                    isFilled: true,
                    borderStrokeWidth: 2,
                    color: Colors.blue.withOpacity(0.2));
                //widget.draw = false;
                setState(() {});*/
              },
              onPointerDown: (event, point) {
                if (!widget.draw) return null;
                widget.list1.clear();
                widget.list1 = <LatLng>[
                  LatLng(0, 0),
                  LatLng(0, 0),
                  LatLng(0, 0),
                  LatLng(0, 0),
                ];
                widget.list1[0] = point;
              },
              onLongPress: (tapPosition, point) {},
              absorbPanEventsOnScrollables: false,
              onPointerHover: (event, point) {},
              enableScrollWheel: true,
              interactiveFlags: widget.draw
                  ? InteractiveFlag.pinchZoom |
                      InteractiveFlag.none |
                      //InteractiveFlag.pinchMove |
                      InteractiveFlag.flingAnimation // |
                  // InteractiveFlag.pinchMove
                  : InteractiveFlag.all & ~InteractiveFlag.rotate,
              onPointerCancel: (event, point) {},
              onPositionChanged: (position, hasGesture) {},
              onTap: (tapPosition, point) {
                print(point);
                widget.point = point;
                widget.list1 = [];
                setState(() {});
              },
              onMapEvent: (p0) {},
              onPointerUp: (event, point) {
                if (!widget.draw) return null;
                widget.list1[2] = point;
                widget.list1[1] =
                    LatLng(point.latitude, widget.list1[0].longitude);
                widget.list1[3] =
                    LatLng(widget.list1[0].latitude, point.longitude);
                print(widget.list1);
                widget.plogon = Polygon(
                    points: widget.list1,
                    borderColor: Colors.black,
                    isFilled: true,
                    borderStrokeWidth: 2,
                    color: Colors.blue.withOpacity(0.2));
                //widget.draw = false;
                setState(() {});
              },
            ),
            children: [
              VectorTileLayer(
                  theme: _style!.theme,
                  tileProviders: this._style!.providers,
                  maximumZoom: 22,
                  // tileOffset: TileOffset.mapbox,
                  layerMode: VectorTileLayerMode.raster),
              widget.point == null && widget.list1.isNotEmpty
                  ? PolygonLayer(polygons: () {
                      return [widget.plogon];
                    }())
                  : Container(),
              PolygonLayer(
                polygons: [
                  Polygon(points: [
                    LatLng(26.685791, 27.751608),
                    LatLng(28.850098, 27.751608),
                    LatLng(28.850098, 29.831114),
                    LatLng(26.685791, 27.751608),
                  ])
                ],
              ),
              !(widget.point == null)
                  ? MarkerLayer(
                      markers: [
                        Marker(
                            height: 200,
                            width: 200,
                            point: widget.point!,
                            builder: (context) => Icon(Icons.location_on))
                      ],
                    )
                  : Container(),
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
    return p;
  }
}

class GoogleMapComponentDashBoardScreen extends StatefulWidget {
  GoogleMapComponentDashBoardScreen({super.key});
  List<LatLng> list1 = [];
  Polygon plogon = Polygon(points: []);
  bool draw = false;
  @override
  State<GoogleMapComponentDashBoardScreen> createState() {
    return _GoogleMapComponentDashBoardScreenState();
  }
}

class _GoogleMapComponentDashBoardScreenState
    extends State<GoogleMapComponentDashBoardScreen> {
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 350,
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            PolygonLayer(polygons: () {
              return [widget.plogon];
            }()),
            widget.list1.isNotEmpty
                ? MarkerLayer(
                    markers: [
                      Marker(
                          height: 200,
                          width: 200,
                          point: widget.list1[0],
                          builder: (context) => Icon(Icons.location_on))
                    ],
                  )
                : Container(),
            Wrap(
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    width: 500,
                    child: SearchTextField(width: 100)),
                Container(
                  height: 50,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green)),
                      onPressed: () {},
                      child: Text('search',
                          style: TextStyle(color: Colors.white))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
