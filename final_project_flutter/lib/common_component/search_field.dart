// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_year/apis/apis_functions.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class SearchGoogleMap extends StatefulWidget {
  SearchGoogleMap({
    required this.changePosition,
    Key? key,
    required this.width,
  }) : super(key: key);
  void Function({required LatLng latLng}) changePosition;
  double width;

  @override
  State<SearchGoogleMap> createState() => _SearchGoogleMapState();
}

class _SearchGoogleMapState extends State<SearchGoogleMap> {
  String? url = "";
  List<Map<String, dynamic>> l1 = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: widget.width * (2 / 3),
                      height: 40,
                      color: Colors.white,
                      child: TextField(
                          controller: textEditingController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              l1.clear();
                              setState(() {});
                              return;
                            }
                            url = "";
                            Api.search_farm_google_map_api(
                                    search: value, url: url)
                                .then((value) {
                              if (value != null) {
                                l1 = value.$1;
                                url = value.$2;
                              }
                              setState(() {});
                            });
                          },
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 166, 197, 181),
                                  fontSize: 20),
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none))),
                    ),
                  ),
                ],
              ),
            ),
            Container(
             margin: EdgeInsets.only(left: 20),
              height: 500,width: 400,
              child: ListView.builder(
                itemCount: l1.length + 1,
                itemBuilder: (context, index) {
                   if (index < l1.length) {
                    return SearchGoogleMapItem(
                      center: l1[index]["center"],
                      ssn: l1[index]["id"].toString(),
                      changePosition: ({required LatLng latLng}) {
                        l1.clear();
                        widget.changePosition(latLng: latLng);
                        setState(() {
                          
                        });
                      }, //

                      city: l1[index]["city"].toString(),
                      governorate: l1[index]["governorate"].toString(),
                      name: l1[index]["farm_name"].toString(),
                      village: l1[index]["village"].toString(),
                    );
                  } else if (url != "" && url != null) {
                    Api.search_farm_google_map_api(
                            url: url, search: textEditingController.text)
                        .then((value) {
                      if (value != null) {
                        l1 = value.$1;
                        url = value.$2;
                      }
                      ;
                      setState(() {});
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchGoogleMapItem extends StatelessWidget {
  void Function({required LatLng latLng}) changePosition;
  LatLng center;
  String ssn, name, governorate, city, village;
  SearchGoogleMapItem(
      {Key? key,
      required this.changePosition,
      required this.center,
      required this.village,
      required this.city,
      required this.name,
      required this.governorate,
      required this.ssn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changePosition(latLng: center);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.grey)),
        height: 100,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [Text(" رقم المزرعة او الحظيرة: "), Text(ssn)],
            ),
            Wrap(
              children: [Text("اسم المربي: "), Text(name)],
            ),
            Wrap(
              children: [
                Text(" الموقع: "),
                Text(governorate +
                    " " +
                    ">" +
                    " " +
                    city +
                    " " +
                    ">" +
                    " " +
                    village)
              ],
            )
          ],
        ),
      ),
    );
  }
}
