import 'dart:convert';

import 'package:final_project_year/common_component/button_show_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

Marker createMarker(Map f) {
  Map m = json.decode(f["center"]);
  return Marker(
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
      print(f );
      return ShowInfoButtom(
        id: f["id"].toString(),
        name: f["farm_name"],
        numberOfWorkersInner: f["number_of_workers_inner"],
        numberOfWorkersOuter: f["number_of_workers_outer"],
        sectionType: f["section_type"]["name"],
        totalAreaOfFarm: f["total_area_of_farm"] ?? 0,
        totalCostFarm: f["total_cost_farm"] ?? 0,
      );
    },
  );
}

List<Polygon> createPolygon(List<Polygon> plogons, Map f) {
  Map m = json.decode(f["location"]);
  if (m['type'] == 'MultiPolygon') {
    for (List main1 in m['coordinates']) {
      for (List plog in main1) {
        List<LatLng> points = [];
        for (List p1 in plog) {
          points.add(LatLng(p1[1], p1[0]));
        }
        plogons.add(
            Polygon(points: points, color: Colors.grey, borderStrokeWidth: 12));
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
  return plogons;
}
