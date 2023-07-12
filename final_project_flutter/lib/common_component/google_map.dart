// ignore_for_file: must_be_immutable, depend_on_referenced_packages, overridden_fields

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_project_year/common_component/create_map_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/search_field.dart';


extension ComparelatLng on LatLng {
  bool operator <(LatLng l1) {
    if (longitude == -1) {
      return false;
    }
    return latitude < l1.latitude || longitude < l1.longitude;
  }

  bool operator >(LatLng l1) {
    if (longitude == -1) {
      return false;
    }
    return latitude > l1.latitude || longitude > l1.longitude;
  }
}

class GoogleMapComponentDashBoardScreen extends StatefulWidget {
  const GoogleMapComponentDashBoardScreen({super.key});

  @override
  State<GoogleMapComponentDashBoardScreen> createState() {
    return _GoogleMapComponentDashBoardScreenState();
  }
}

class _GoogleMapComponentDashBoardScreenState
    extends State<GoogleMapComponentDashBoardScreen>
    with AutomaticKeepAliveClientMixin {
  MapController mapController = MapController();
  LatLng biggest = const LatLng(-1, -1), smallest = const LatLng(-1, -1);

  LatLng handleLocation({required LatLng latLng, required double value}) {
    double vlat = ((latLng.latitude + 90 + value) % 180) - 90;
    double vlng = ((latLng.longitude + 180 + value) % 360) - 180;
    return LatLng(vlat, vlng);
  }

  List<Marker> list1 = [];
  List<Polygon> plogon = [];
  bool draw = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 330,
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            interactiveFlags: InteractiveFlag.all,
            center: const LatLng(30, 30),
            onPositionChanged: (position, hasGesture) async {
              print(position.zoom);
              if ((position.zoom ?? 0) >= 6) {
                if (biggest < (position.bounds?.northEast)! ||
                    smallest > (position.bounds?.southWest)! ||
                    biggest.longitude == -360) {
                  smallest = handleLocation(
                      latLng: position.bounds!.southWest, value: -5);

                  biggest = handleLocation(
                      latLng: position.bounds!.northEast, value: 5);

                  Map<String, dynamic> map1 = await get_data_map(
                      formData: FormData.fromMap({
                    "smallest":
                        json.encode([smallest.latitude, smallest.longitude]),
                    "biggest":
                        json.encode([biggest.latitude, biggest.longitude])
                  }));

                  plogon = map1["ploygons"];
                  list1 = map1["markers"];
                  setState(() {});
                }
              } else {
                plogon.clear();
                list1.clear();
                biggest = LatLng(-180, -360);
              } /*else if (plogon.isNotEmpty) {
                plogon.clear();
                list1.clear();
              }*/
            },
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            PolygonLayer(polygons: plogon),
            list1.isNotEmpty
                ? MarkerLayer(
                    markers: list1,
                  )
                : Container(),
            Wrap(
              children: [
                Container(
                    margin: const EdgeInsets.all(3),
                    width: 300,
                    child: SearchTextField(width: 100)),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green)),
                      onPressed: () {},
                      child: const Text('search',
                          style: TextStyle(color: Colors.white))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class GoogleCompenentFarmInfo extends StatefulWidget {
  List<Marker> list1 = [];
  List<Polygon> plogon = [];
  LatLng? center;
  GoogleCompenentFarmInfo({super.key, required Map f}) {
    if (f['center'] != null) {
      list1.add(createMarker(f));
      center = list1[0].point;
    }
    if (f["location"] != null) {
      createPolygon(plogon, f);
    }
  }

  @override
  State<GoogleCompenentFarmInfo> createState() =>
      _GoogleCompenentFarmInfoState();
}

class _GoogleCompenentFarmInfoState extends State<GoogleCompenentFarmInfo>
    with AutomaticKeepAliveClientMixin {
  bool draw = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 330,
        child: FlutterMap(
          options: MapOptions(
            interactiveFlags: InteractiveFlag.all,
            center: widget.center,
            onPositionChanged: (position, hasGesture) async {},
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            PolygonLayer(polygons: widget.plogon),
            widget.list1.isNotEmpty
                ? MarkerLayer(
                    markers: widget.list1,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

