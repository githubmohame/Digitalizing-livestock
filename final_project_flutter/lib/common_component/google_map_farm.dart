import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geoclue/geoclue.dart';
import 'show_load_screen.dart';

abstract class GoogleMapFarm extends StatefulWidget {
  GoogleMapFarm({super.key, this.l1});
  LatLng? point;
  String? file;
  LatLngBounds? l1;
  List<LatLng> list1 = [];
  Polygon plogon = Polygon(points: []);
  bool draw = false;
  Future<LatLng> _determinePosition() async {
    if (Platform.isLinux) {
      final location = await GeoClue.getLocation(desktopId: '<desktop-id>');
      print('Current location: $location');

      print('Waiting 10s for location updates...');
      late final StreamSubscription sub;
      sub = GeoClue.getLocationUpdates(desktopId: '<desktop-id>')
          .timeout(const Duration(seconds: 10), onTimeout: (_) => sub.cancel())
          .listen((location) {
        print('... $location');
      });
      location.latitude;
      print("hhhyyyu");
      return LatLng(location.latitude, location.longitude);
    }
    Position p = await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
    );
    point = LatLng(p.latitude, p.longitude);
    //setState(() {});

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
    return LatLng(
      p.latitude,
      p.longitude,
    );
  }
}

class _GoogleMapComponentFarmDesktopScreenState
    extends State<GoogleMapComponentDesktopFarmScreen> {
  void _initStyle() async {
    try {} catch (e) {}
    setState(() {});
  }

  MapController mapController = MapController();
  @override
  void initState() {
    _initStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.draw = !widget.draw;
                widget.draw ? widget.point = null : null;
                setState(() {});
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => widget.draw ? Colors.green : Colors.blue)),
              child: const Icon(Icons.rectangle_sharp),
            ),
            Container(
              width: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blue)),
              child: const Text(
                'اخذ الاحداث اللحالي',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                LatLng p = await widget._determinePosition();
                widget.point = p;
                print("the point is " + p.toString());
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
              child: const Text(
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
        SizedBox(
          height: 330 - 18,
          child: Listener(
            onPointerMove: (event) {
              LatLng point =
                  mapController.camera.offsetToCrs(event.localPosition);
              if (!widget.draw) return;
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
              setState(() {});
            },
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                //zoom: 12,
                // boundsOptions: const FitBoundsOptions(
                //   forceIntegerZoomLevel: false, maxZoom: 12, inside: false),
                //screenSize: const Size(120, 330 - 18),
                //pinchZoomWinGestures:MultiFingerGesture.pinchZoom | MultiFingerGesture.none,
                cameraConstraint: CameraConstraint.contain(bounds: widget.l1!),
                //center: widget.l1!.first,
                onMapReady: () {},
                /*onPointerMoclve: (tapPosition, point) {
                  if (!widget.draw) return;
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
                  setState(() {});
                },*/
                onPointerDown: (event, point) {
                  if (!widget.draw) return;
                  widget.list1.clear();
                  widget.list1 = <LatLng>[
                    const LatLng(0, 0),
                    const LatLng(0, 0),
                    const LatLng(0, 0),
                    const LatLng(0, 0),
                  ];
                  widget.list1[0] = point;
                },
                onLongPress: (tapPosition, point) {},
                //absorbPanEventsOnScrollables: false,
                onPointerHover: (event, point) {},
                interactionOptions: InteractionOptions(
                    flags: widget.draw
                        ? InteractiveFlag.pinchZoom &
                            InteractiveFlag.none &
                            //InteractiveFlag.pinchMove &
                            InteractiveFlag.flingAnimation // &
                        // InteractiveFlag.pinchMove
                        : InteractiveFlag.all),
                //interactiveFlags: //|InteractiveFlag.doubleTapZoom|InteractiveFlag.pinchZoom|InteractiveFlag.pinchMove ,
                onPointerCancel: (event, point) {},
                onPositionChanged: (position, hasGesture) {},
                onTap: (tapPosition, point) {
                  if (widget.l1 is LatLngBounds) {}

                  widget.point = point;
                  widget.list1 = [];
                  setState(() {});
                },
                onMapEvent: (p0) {},
                onPointerUp: (event, point) {
                  widget.draw = false;
                  setState(() {});
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                widget.point == null && widget.list1.isNotEmpty
                    ? PolygonLayer(polygons: () {
                        return [widget.plogon];
                      }())
                    : Container(),
                () {
                  print("test the positioning"+widget.point.toString());
                  if ((widget.point == null)) {
                    return Container();
                  }
                  return MarkerLayer(
                    markers: [
                      Marker(
                          height: 200,
                          width: 200,
                          point: widget.point!,
                          child: Icon(Icons.location_on))
                    ],
                  );
                }()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GoogleMapComponentDesktopFarmScreen extends GoogleMapFarm {
  GoogleMapComponentDesktopFarmScreen({super.key, super.l1});

  @override
  State<GoogleMapComponentDesktopFarmScreen> createState() =>
      _GoogleMapComponentFarmDesktopScreenState();
}

class GoogleMapFarmPhone extends GoogleMapFarm {
  GoogleMapFarmPhone({super.key, super.l1});
  @override
  @override
  State<GoogleMapFarmPhone> createState() => _GoogleMapFarmTestState();
}

class _GoogleMapFarmTestState extends State<GoogleMapFarmPhone> {
  bool hide = false;
  void _initStyle() async {
    try {} catch (e) {}
    setState(() {});
  }

  @override
  void initState() {
    _initStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        initialCameraFit: CameraFit.bounds(
            bounds: LatLngBounds.fromPoints([]),
            forceIntegerZoomLevel: false,
            maxZoom: 12),
        initialZoom: 12,
        // boundsOptions: const FitBoundsOptions(),
        //screenSize: const Size(120, 330 - 18),
        interactionOptions: InteractionOptions(
          flags: MultiFingerGesture.pinchZoom | MultiFingerGesture.none,
        ),
        //
        cameraConstraint: CameraConstraint.contain(bounds: widget.l1!), // ,
        //center: widget.l1!.first,
        /*onPointerMove: (tapPosition, point) {
          if (!widget.draw) return;
          widget.list1[2] = point;
          widget.list1[1] = LatLng(point.latitude, widget.list1[0].longitude);
          widget.list1[3] = LatLng(widget.list1[0].latitude, point.longitude);

          widget.plogon = Polygon(
              points: widget.list1,
              borderColor: Colors.black,
              isFilled: true,
              borderStrokeWidth: 2,
              color: Colors.blue.withOpacity(0.2));
          //widget.draw = false;
          setState(() {});
        },*/
        onPointerDown: (event, point) {
          if (!widget.draw) return;
          widget.list1.clear();
          widget.list1 = <LatLng>[
            const LatLng(0, 0),
            const LatLng(0, 0),
            const LatLng(0, 0),
            const LatLng(0, 0),
          ];
          widget.list1[0] = point;
        },
        onLongPress: (tapPosition, point) {
          hide = !hide;
          setState(() {});
        },
        //absorbPanEventsOnScrollables: false,
        onPointerHover: (event, point) {},
        interactiveFlags: widget.draw
            ? InteractiveFlag.pinchZoom &
                InteractiveFlag.none &
                //InteractiveFlag.pinchMove &
                InteractiveFlag.flingAnimation // &
            // InteractiveFlag.pinchMove
            : InteractiveFlag
                .all //|InteractiveFlag.doubleTapZoom|InteractiveFlag.pinchZoom|InteractiveFlag.pinchMove
        ,
        onPointerCancel: (event, point) {},
        onPositionChanged: (position, hasGesture) {},
        onTap: (tapPosition, point) {
          if (widget.l1 is LatLngBounds) {}

          widget.point = point;
          widget.list1 = [];
          setState(() {});
        },
        onMapEvent: (p0) {},
        onPointerUp: (event, point) {
          widget.draw = false;
          hide = false;
          setState(() {});
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        widget.point == null && widget.list1.isNotEmpty
            ? PolygonLayer(polygons: () {
                return [widget.plogon];
              }())
            : Container(),
        (widget.point != null)
            ? MarkerLayer(
                markers: [
                  Marker(
                      height: 200,
                      width: 200,
                      point: widget.point!,
                      child: const Icon(Icons.location_on))
                ],
              )
            : Container(),
        Visibility(
          maintainState: true,
          visible: !hide,
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: Wrap(
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("حفظ")),
                Tooltip(
                  message: "رسم مستطيل للمزرعة",
                  child: ElevatedButton(
                    onPressed: () {
                      widget.draw = !widget.draw;
                      widget.draw ? widget.point = null : null;
                      hide = true;
                      setState(() {});
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) =>
                                widget.draw ? Colors.green : Colors.blue)),
                    child: const Icon(Icons.rectangle_sharp),
                  ),
                ),
                Container(
                  width: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.blue)),
                  child: const Text(
                    'اخذ الاحداث اللحالي',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    LatLng p = await widget._determinePosition();
                    widget.point = LatLng(p.latitude, p.longitude);
                    widget.list1 = [];
                    print(widget.point);
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
                  child: const Text(
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
                        widget.list1 = [];
                      }
                      setState(() {});
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GoogleMapFarmScreen extends StatefulWidget {
  GoogleMapFarmScreen({super.key});
  GoogleMapFarm googleMapComponent = GoogleMapComponentDesktopFarmScreen();

  @override
  State<GoogleMapFarmScreen> createState() => _GoogleMapFarmScreenState();
}

class _GoogleMapFarmScreenState extends State<GoogleMapFarmScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.add_farm_map_bounder_api(),
        builder: (context, snap) {
          if (snap.data is List) {
            if (Platform.isAndroid || Platform.isIOS) {
              widget.googleMapComponent = GoogleMapFarmPhone(
                l1: LatLngBounds.fromPoints(snap.data!),
              );
            } else {
              widget.googleMapComponent = GoogleMapComponentDesktopFarmScreen(
                l1: LatLngBounds.fromPoints(snap.data!),
              );
            }
            return widget.googleMapComponent;
          }
          return const LoadingScreen();
        });
  }
}
