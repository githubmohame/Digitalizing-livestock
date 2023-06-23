// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowInfoButtom extends StatefulWidget {
  String name;
  String id;
  num total_cost_farm, total_area_of_farm;
  String section_type;
  num number_of_workers_inner,number_of_workers_outer;
    ShowInfoButtom({
    Key? key,
    required this.name,required this.total_cost_farm,
    required this.id,
    required this.total_area_of_farm,
    required this.section_type,required this.number_of_workers_outer,
    required this.number_of_workers_inner 
  }) : super(key: key);
  @override
  State<ShowInfoButtom> createState() => _ShowInfoButtomState();
}

class _ShowInfoButtomState extends State<ShowInfoButtom> {
  bool is_visb = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.location_on),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Text(
                          ":الاسم",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.total_cost_farm.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Text(
                          ":التكلفة الكلية",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                           widget.total_area_of_farm.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Text(
                          ":المساحة الكلية",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.section_type,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Text(
                          ":نوع القطاع ",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.number_of_workers_inner.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Text(
                          ": عدد  العمالة الدخلية ",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                           widget.number_of_workers_outer.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Text(
                          ": عدد  العمالة الخارجية ",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ];
      },
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
